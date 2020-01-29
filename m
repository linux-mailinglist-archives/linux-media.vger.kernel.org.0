Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621DA14C9F2
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 12:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgA2LyV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 06:54:21 -0500
Received: from gofer.mess.org ([88.97.38.141]:60379 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbgA2LyV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 06:54:21 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AA688C6461; Wed, 29 Jan 2020 11:54:19 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v4l-utils 4/4] keytable: a bpf protocol can have parameters and no scancodes
Date:   Wed, 29 Jan 2020 11:54:19 +0000
Message-Id: <20200129115419.8456-5-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129115419.8456-1-sean@mess.org>
References: <20200129115419.8456-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently a protocol without scancodes does not get its parameters
parsed.

Signed-off-by: Sean Young <sean@mess.org>
---
 utils/common/keymap.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/utils/common/keymap.c b/utils/common/keymap.c
index 15c31c76..a3c1349e 100644
--- a/utils/common/keymap.c
+++ b/utils/common/keymap.c
@@ -384,13 +384,6 @@ static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot
 		return EINVAL;
 	}
 
-	scancodes = toml_table_in(proot, "scancodes");
-	if (!scancodes) {
-		if (verbose)
-			fprintf(stderr, _("%s: no [protocols.scancodes] section\n"), fname);
-		return 0;
-	}
-
 	for (i = 0; (key = toml_key_in(proot, i)) != NULL; i++) {
 		int64_t value;
 
@@ -408,6 +401,13 @@ static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot
 		}
 	}
 
+	scancodes = toml_table_in(proot, "scancodes");
+	if (!scancodes) {
+		if (verbose)
+			fprintf(stderr, _("%s: no [protocols.scancodes] section\n"), fname);
+		return 0;
+	}
+
 	struct scancode_entry **next = &map->scancode;
 	i = 0;
 
-- 
2.24.1

