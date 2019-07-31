Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C77647B944
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 07:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfGaFyH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 01:54:07 -0400
Received: from gofer.mess.org ([88.97.38.141]:52357 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726079AbfGaFyH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 01:54:07 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2F5E56055F; Wed, 31 Jul 2019 06:54:06 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] keytable: generate missing keys like KEY_ZOOM
Date:   Wed, 31 Jul 2019 06:54:06 +0100
Message-Id: <20190731055406.4852-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The input-event-codes.h now contains lines like:

Ensure these parsed correctly.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/Makefile.am         | 40 +------------
 utils/keytable/gen_input_events.pl | 92 ++++++++++++++++++++++++++++++
 utils/keytable/parse.h             |  9 +++
 3 files changed, 102 insertions(+), 39 deletions(-)
 create mode 100755 utils/keytable/gen_input_events.pl

diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
index 0a8f5936..2f265f12 100644
--- a/utils/keytable/Makefile.am
+++ b/utils/keytable/Makefile.am
@@ -33,45 +33,7 @@ sync-with-kernel:
 	  exit 1; \
 	fi
 	@echo generating $(srcdir)/parse.h
-	@printf "struct parse_event {\n\tchar *name;\n\tunsigned int value;\n};\n" > $(srcdir)/parse.h
-
-	@printf "struct parse_event events_type[] = {\n" >> $(srcdir)/parse.h
-	@more $(KERNEL_DIR)/usr/include/linux/input-event-codes.h | perl -n \
-	-e 'if (m/^\#define\s+(EV_[^\s]+)\s+(0x[\d\w]+|[\d]+)/) ' \
-	-e '{ printf "\t{\"%s\", %s},\n",$$1,$$2 if ($$1 ne "EV_VERSION"); }' \
-	>> $(srcdir)/parse.h
-	@printf "\t{ NULL, 0}\n};\n" >> $(srcdir)/parse.h
-
-	@printf "struct parse_event msc_events[] = {\n" >> $(srcdir)/parse.h
-	@more $(KERNEL_DIR)/usr/include/linux/input-event-codes.h | perl -n \
-	-e 'if (m/^\#define\s+(MSC_[^\s]+)\s+(0x[\d\w]+|[\d]+)/) ' \
-	-e '{ printf "\t{\"%s\", %s},\n",$$1,$$2; }' \
-	>> $(srcdir)/parse.h
-	@printf "\t{ NULL, 0}\n};\n" >> $(srcdir)/parse.h
-
-	@printf "struct parse_event key_events[] = {\n" >> $(srcdir)/parse.h
-	@more $(KERNEL_DIR)/usr/include/linux/input-event-codes.h | perl -n \
-	-e 'if (m/^\#define\s+(KEY_[^\s]+)\s+(0x[\d\w]+|[\d]+)/) ' \
-	-e '{ printf "\t{\"%s\", %s},\n",$$1,$$2; }' \
-	-e 'if (m/^\#define\s+(BTN_[^\s]+)\s+(0x[\d\w]+|[\d]+)/) ' \
-	-e '{ printf "\t{\"%s\", %s},\n",$$1,$$2; }' \
-	>> $(srcdir)/parse.h
-	@printf "\t{ NULL, 0}\n};\n" >> $(srcdir)/parse.h
-
-	@printf "struct parse_event rel_events[] = {\n" >> $(srcdir)/parse.h
-	@more $(KERNEL_DIR)/usr/include/linux/input-event-codes.h | perl -n \
-	-e 'if (m/^\#define\s+(REL_[^\s]+)\s+(0x[\d\w]+|[\d]+)/) ' \
-	-e '{ printf "\t{\"%s\", %s},\n",$$1,$$2; }' \
-	>> $(srcdir)/parse.h
-	@printf "\t{ NULL, 0}\n};\n" >> $(srcdir)/parse.h
-
-	@printf "struct parse_event abs_events[] = {\n" >> $(srcdir)/parse.h
-	@more $(KERNEL_DIR)/usr/include/linux/input-event-codes.h | perl -n \
-	-e 'if (m/^\#define\s+(ABS_[^\s]+)\s+(0x[\d\w]+|[\d]+)/) ' \
-	-e '{ printf "\t{\"%s\", %s},\n",$$1,$$2; }' \
-	>> $(srcdir)/parse.h
-	@printf "\t{ NULL, 0}\n};\n" >> $(srcdir)/parse.h
-
+	@./gen_input_events.pl < $(KERNEL_DIR)/usr/include/linux/input-event-codes.h  > $(srcdir)/parse.h
 	@-mkdir -p $(srcdir)/rc_keymaps
 	@-rm $(srcdir)/rc_keymaps/*
 	@echo storing existing keymaps at $(srcdir)/rc_keymaps/
diff --git a/utils/keytable/gen_input_events.pl b/utils/keytable/gen_input_events.pl
new file mode 100755
index 00000000..dfa1dfce
--- /dev/null
+++ b/utils/keytable/gen_input_events.pl
@@ -0,0 +1,92 @@
+#!/usr/bin/perl
+use strict;
+
+my @ev;
+my @msc;
+my @key;
+my @key;
+my @rel;
+my @abs;
+
+my %key_hash;
+
+while (<>) {
+	if (m/^\#define\s+(EV_[^\s]+)\s+(0x[\d\w]+|[\d]+)/) {
+		next if ($1 eq "EV_VERSION");
+		my @e = ($1, $2);
+		push(@ev, \@e);
+	}
+
+	if (m/^\#define\s+(MSC_[^\s]+)\s+(0x[\d\w]+|[\d]+)/) {
+		my @e = ($1, $2);
+		push(@msc, \@e);
+	}
+
+	if (m/^\#define\s+(KEY_[^\s]+)\s+(0x[\d\w]+|[\d]+)/) {
+		$key_hash{$1} = $2;
+		my @e = ($1, $2);
+		push(@key, \@e);
+	}
+
+	if (m/^\#define\s+(KEY_[^\s]+)\s+(KEY_[^\s]+)/) {
+		my @e = ($1, $key_hash{$2});
+		push(@key, \@e);
+	}
+
+	if (m/^\#define\s+(BTN_[^\s]+)\s+(0x[\d\w]+|[\d]+)/)  {
+		my @e = ($1, $2);
+		push(@key, \@e);
+	}
+
+	if (m/^\#define\s+(REL_[^\s]+)\s+(0x[\d\w]+|[\d]+)/) {
+		my @e = ($1, $2);
+		push(@rel, \@e);
+	}
+
+	if (m/^\#define\s+(ABS_[^\s]+)\s+(0x[\d\w]+|[\d]+)/) {
+		my @e = ($1, $2);
+		push(@abs, \@e);
+	}
+}
+
+print "struct parse_event {\n\tchar *name;\n\tunsigned int value;\n};\n";
+print "struct parse_event events_type[] = {\n";
+for my $e (@ev) {
+	my $name = @$e[0];
+	my $val = @$e[1];
+	print "\t{\"$name\", $val},\n";
+}
+print "\t{ NULL, 0}\n};\n";
+
+print "struct parse_event msc_events[] = {\n";
+for my $e (@msc) {
+	my $name = @$e[0];
+	my $val = @$e[1];
+	print "\t{\"$name\", $val},\n";
+}
+print "\t{ NULL, 0}\n};\n";
+
+print "struct parse_event key_events[] = {\n";
+for my $e (@key) {
+	my $name = @$e[0];
+	my $val = @$e[1];
+	print "\t{\"$name\", $val},\n";
+}
+print "\t{ NULL, 0}\n};\n";
+
+print "struct parse_event rel_events[] = {\n";
+for my $e (@rel) {
+	my $name = @$e[0];
+	my $val = @$e[1];
+	print "\t{\"$name\", $val},\n";
+}
+print "\t{ NULL, 0}\n};\n";
+
+print "struct parse_event abs_events[] = {\n";
+for my $e (@abs) {
+	my $name = @$e[0];
+	my $val = @$e[1];
+	print "\t{\"$name\", $val},\n";
+}
+print "\t{ NULL, 0}\n};\n";
+
diff --git a/utils/keytable/parse.h b/utils/keytable/parse.h
index a78d86dc..05decfac 100644
--- a/utils/keytable/parse.h
+++ b/utils/keytable/parse.h
@@ -151,6 +151,7 @@ struct parse_event key_events[] = {
 	{"KEY_SCALE", 120},
 	{"KEY_KPCOMMA", 121},
 	{"KEY_HANGEUL", 122},
+	{"KEY_HANGUEL", 122},
 	{"KEY_HANJA", 123},
 	{"KEY_YEN", 124},
 	{"KEY_LEFTMETA", 125},
@@ -181,7 +182,9 @@ struct parse_event key_events[] = {
 	{"KEY_WWW", 150},
 	{"KEY_MSDOS", 151},
 	{"KEY_COFFEE", 152},
+	{"KEY_SCREENLOCK", 152},
 	{"KEY_ROTATE_DISPLAY", 153},
+	{"KEY_DIRECTION", 153},
 	{"KEY_CYCLEWINDOWS", 154},
 	{"KEY_MAIL", 155},
 	{"KEY_BOOKMARKS", 156},
@@ -268,8 +271,10 @@ struct parse_event key_events[] = {
 	{"KEY_VIDEO_PREV", 242},
 	{"KEY_BRIGHTNESS_CYCLE", 243},
 	{"KEY_BRIGHTNESS_AUTO", 244},
+	{"KEY_BRIGHTNESS_ZERO", 244},
 	{"KEY_DISPLAY_OFF", 245},
 	{"KEY_WWAN", 246},
+	{"KEY_WIMAX", 246},
 	{"KEY_RFKILL", 247},
 	{"KEY_MICMUTE", 248},
 	{"BTN_MISC", 0x100},
@@ -363,9 +368,11 @@ struct parse_event key_events[] = {
 	{"KEY_SUBTITLE", 0x172},
 	{"KEY_ANGLE", 0x173},
 	{"KEY_FULL_SCREEN", 0x174},
+	{"KEY_ZOOM", 0x174},
 	{"KEY_MODE", 0x175},
 	{"KEY_KEYBOARD", 0x176},
 	{"KEY_ASPECT_RATIO", 0x177},
+	{"KEY_SCREEN", 0x177},
 	{"KEY_PC", 0x178},
 	{"KEY_TV", 0x179},
 	{"KEY_TV2", 0x17a},
@@ -422,6 +429,7 @@ struct parse_event key_events[] = {
 	{"KEY_ADDRESSBOOK", 0x1ad},
 	{"KEY_MESSENGER", 0x1ae},
 	{"KEY_DISPLAYTOGGLE", 0x1af},
+	{"KEY_BRIGHTNESS_TOGGLE", 0x1af},
 	{"KEY_SPELLCHECK", 0x1b0},
 	{"KEY_LOGOFF", 0x1b1},
 	{"KEY_DOLLAR", 0x1b2},
@@ -582,6 +590,7 @@ struct parse_event key_events[] = {
 	{"BTN_TRIGGER_HAPPY38", 0x2e5},
 	{"BTN_TRIGGER_HAPPY39", 0x2e6},
 	{"BTN_TRIGGER_HAPPY40", 0x2e7},
+	{"KEY_MIN_INTERESTING", 113},
 	{"KEY_MAX", 0x2ff},
 	{ NULL, 0}
 };
-- 
2.21.0

