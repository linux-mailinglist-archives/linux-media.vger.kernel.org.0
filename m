Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73AD85BE40
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 16:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbfGAO15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 10:27:57 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50273 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728171AbfGAO15 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 10:27:57 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 37233FF817;
        Mon,  1 Jul 2019 14:27:53 +0000 (UTC)
Message-ID: <3bbb2edc0b34a029c7514fdf67af70d5e7e514f3.camel@hadess.net>
Subject: Re: [PATCH v2] keytable: Add keymap test
From:   Bastien Nocera <hadess@hadess.net>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Date:   Mon, 01 Jul 2019 16:27:52 +0200
In-Reply-To: <20190627193348.d53sbpys32i7qyi3@gofer.mess.org>
References: <b6ffea1984f05adec9f52cd60902a95c82bf8666.camel@hadess.net>
         <20190627193348.d53sbpys32i7qyi3@gofer.mess.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-06-27 at 20:33 +0100, Sean Young wrote:
> On Thu, Jun 27, 2019 at 10:13:56AM +0200, Bastien Nocera wrote:
> > This new test will try to parse all the ".toml" files in the
> > directory
> > path passed to it, error'ing out on the first parsing problem.
> > 
> > Run as "make check" in the keytable directory.
> 
> Good catch, and I like your solution.
> 
> It needs a Signed-off-by.
> 
> > ---
> > Changes since v1:
> > - Fix patch formatting
> > 
> > At least 4 keymaps look broken in the current git:
> > it913x_v2.toml
> > pinnacle310e.toml
> > hisi_poplar.toml
> > imon_mce.toml
> > 
> > Let me know if you want patches to remove the duplicate entries
> > from
> > those.
> 
> That would be great. They have to be patched in the kernel tree, they
> are generated from there.

It's customary to put a comment at the top of generated files
indicating that they shouldn't be modified and list the name and
version of the tools used to generate that file.

So, what's the name of the tool used, and where does it live? :)

> >  utils/keytable/Makefile.am    |  6 ++++
> >  utils/keytable/test_keymaps.c | 68
> > +++++++++++++++++++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 utils/keytable/test_keymaps.c
> > 
> > diff --git a/utils/keytable/Makefile.am
> > b/utils/keytable/Makefile.am
> > index 148b9446..086d53c2 100644
> > --- a/utils/keytable/Makefile.am
> > +++ b/utils/keytable/Makefile.am
> > @@ -1,9 +1,12 @@
> >  bin_PROGRAMS = ir-keytable
> > +noinst_PROGRAMS = test-keymaps
> >  man_MANS = ir-keytable.1 rc_keymap.5
> >  sysconf_DATA = rc_maps.cfg
> >  keytablesystem_DATA = $(srcdir)/rc_keymaps/*
> >  udevrules_DATA = 70-infrared.rules
> >  
> > +test_keymaps_SOURCES = toml.c toml.h test_keymaps.c
> > +
> 
> It could be called check keymaps in line with the make target.

I usually call tests "test" as they aren't beholden to the "check"
target to be run, but up to you.

> >  ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h
> > toml.c toml.h
> >  
> >  if WITH_BPF
> > @@ -21,6 +24,9 @@ endif
> >  EXTRA_DIST = 70-infrared.rules rc_keymaps rc_keymaps_userspace
> > gen_keytables.pl ir-keytable.1 rc_maps.cfg rc_keymap.5
> >  
> >  # custom target
> > +check: test-keymaps
> > +	$(builddir)/test-keymaps $(srcdir)/rc_keymaps/
> > +
> >  install-data-local:
> >  	$(install_sh) -d "$(DESTDIR)$(keytableuserdir)"
> >  
> > diff --git a/utils/keytable/test_keymaps.c
> > b/utils/keytable/test_keymaps.c
> > new file mode 100644
> > index 00000000..23084331
> > --- /dev/null
> > +++ b/utils/keytable/test_keymaps.c
> > @@ -0,0 +1,68 @@
> > +#include <string.h>
> > +#include <errno.h>
> > +#include <stdio.h>
> > +#include <sys/types.h>
> > +#include <dirent.h>
> > +
> > +#include "toml.h"
> > +
> > +static int
> > +has_suffix(const char *str, const char *suffix)
> > +{
> > +	if (strlen(str) < strlen(suffix))
> > +		return 0;
> > +	if (strncmp(str + strlen(str) - strlen(suffix), suffix,
> > strlen(suffix)) == 0)
> > +		return 1;
> > +	return 0;
> > +}
> > +
> > +int main (int argc, char **argv)
> > +{
> > +	DIR *dir;
> > +	struct dirent *entry;
> > +
> > +	if (argc != 2) {
> > +		fprintf(stderr, "Usage: %s KEYMAPS-DIRECTORY\n",
> > argv[0]);
> > +		return 1;
> > +	}
> > +
> > +	dir = opendir(argv[1]);
> > +	if (!dir) {
> > +		perror("Could not open directory");
> > +		return 1;
> > +	}
> > +
> > +	while ((entry = readdir(dir)) != NULL) {
> > +		struct toml_table_t *root;
> > +		FILE *fin;
> > +		char buf[200];
> > +		char path[2048];
> > +
> > +		if (!has_suffix(entry->d_name, ".toml")) {
> > +			/* Skipping file */
> > +			continue;
> > +		}
> > +
> > +		memset(path, 0, sizeof(path));
> > +		strcpy(path, argv[1]);
> > +		strcpy(path + strlen(argv[1]), "/");
> > +		strcpy(path + strlen(argv[1]) + 1, entry->d_name);
> > +		strcpy(path + strlen(argv[1]) + 1 + strlen(entry-
> > >d_name), "\0");
> 
> These five lines could be replaced with a single snprintf().

You're right, it's marginally better.

> > +
> > +		fin = fopen(path, "r");
> > +		if (!fin) {
> > +			fprintf(stderr, "Could not open file %s: %s",
> > path, strerror(errno));
> > +			return 1;
> > +		}
> > +
> > +		root = toml_parse_file(fin, buf, sizeof(buf));
> > +		fclose(fin);
> > +		if (!root) {
> > +			fprintf(stderr, "Failed to parse %s: %s\n",
> > path, buf);
> > +			return 1;
> > +		}
> > +		toml_free(root);
> > +	}
> > +
> > +	return 0;
> > +}
> 
> Great idea!
> 
> Thanks
> Sean

