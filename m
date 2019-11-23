Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB3F107F74
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfKWQqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:46:22 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.139]:37140 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfKWQqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:46:18 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id YYXziRYDERnrKYYY5iYY1i; Sat, 23 Nov 2019 09:46:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527577;
        bh=W2p2Hmg89fX4bVuRhORHOb/8pV7N+eSayByFMdSiwcc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WkKvnKlE2ab20Shoy3uq8kVVeX/AzxVD6P6Z+Y1Z0PWDKfyjKkVJS6rA6wJuOgBqf
         nitf/VsuVTWMeKVxHWIWEsTHQJywQxb+gKd7ibPPseN6vK/7yhOOS4J+HdH3kVO1ve
         O/MrBYEjiLpk3mupmWMWCijLV/ghxKSiJNes40ppzmZwyqrqzKSRnSe3VkhzSbGoUb
         3VsfAK6V+JdaH/+zMSDYRjHVwPNHQVaNqmOotxDAcnxGJWPW+GC7qUzfCZlXjNuUGS
         FyEYhHQ5AtBfahfLAYKiiOfRjZLsrifYK3R7LN3caZleNTlzu3/KzJMpTOoEkuSexs
         Lia7cr0UzAV6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527577;
        bh=W2p2Hmg89fX4bVuRhORHOb/8pV7N+eSayByFMdSiwcc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WkKvnKlE2ab20Shoy3uq8kVVeX/AzxVD6P6Z+Y1Z0PWDKfyjKkVJS6rA6wJuOgBqf
         nitf/VsuVTWMeKVxHWIWEsTHQJywQxb+gKd7ibPPseN6vK/7yhOOS4J+HdH3kVO1ve
         O/MrBYEjiLpk3mupmWMWCijLV/ghxKSiJNes40ppzmZwyqrqzKSRnSe3VkhzSbGoUb
         3VsfAK6V+JdaH/+zMSDYRjHVwPNHQVaNqmOotxDAcnxGJWPW+GC7qUzfCZlXjNuUGS
         FyEYhHQ5AtBfahfLAYKiiOfRjZLsrifYK3R7LN3caZleNTlzu3/KzJMpTOoEkuSexs
         Lia7cr0UzAV6A==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=MUTA2ij1fCMc5pG9_j0A:9
 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, joevt <joevt@shaw.ca>
Subject: [PATCH 08/10] edid-decode: Dump hex of non-decoded extension blocks
Date:   Sat, 23 Nov 2019 08:46:02 -0800
Message-Id: <20191123164604.268-9-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191123164604.268-1-joevt@shaw.ca>
References: <20191123164604.268-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHTxCG5BBpoqkDnryCe3eCAVNgzieEoKks7Hy73AmgTyK49aGkASM0AptWx4zV0Y8/jCwTFs5TrkkPIvdUsEt8sAo2NJLu50eliXViL5HtWazze6AqWL
 Ivc6cXFbpMN03Fh9mDgFJ+K5GGdyM6+/x80ISUtFMbStwXc+2qSB8FbbObvaYMRraG+3FdMCaFn7dspV4UaztgaiH0wPQVZ6HWw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Extension blocks that are not decoded will at least have their contents output as hex. With this, two EDIDs with different data in an undecoded extension block will not be considered equal.
- For unknown extension blocks, include the Extension Block tag number.
- Renamed conformant_extension to nonconformant_extension in parse_extension because boolean value of 1 = nonconformant according to return result of parse_cta and parse_displayid; matches interpretation in edid_from_file.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.c | 80 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 62 insertions(+), 18 deletions(-)

diff --git a/edid-decode.c b/edid-decode.c
index a40ee96..2f2f1c5 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -2474,7 +2474,7 @@ static void cta_block(const unsigned char *x)
 
 static int parse_cta(const unsigned char *x)
 {
-	int ret = 0;
+	int ret = 0; // 0 = conformant
 	unsigned version = x[1];
 	unsigned offset = x[2];
 	const unsigned char *detailed;
@@ -2483,7 +2483,7 @@ static int parse_cta(const unsigned char *x)
 
 	if (version >= 1) do {
 		if (version == 1 && x[3] != 0)
-			ret = 1;
+			ret = 1; // 1 = nonconformant
 
 		if (offset < 4)
 			break;
@@ -2866,28 +2866,72 @@ static void extension_version(const unsigned char *x)
 
 static int parse_extension(const unsigned char *x)
 {
-	int conformant_extension = 0;
+	int nonconformant_extension = 0;
 
 	printf("\n");
 
 	switch (x[0]) {
-	case 0x02: printf("CTA Extension Block\n");
-		   extension_version(x);
-		   conformant_extension = parse_cta(x);
-		   break;
-	case 0x10: printf("VTB Extension Block\n"); break;
-	case 0x40: printf("DI Extension Block\n"); break;
-	case 0x50: printf("LS Extension Block\n"); break;
-	case 0x60: printf("DPVL Extension Block\n"); break;
-	case 0x70: printf("DisplayID Extension Block\n");
-		   conformant_extension = parse_displayid(x);
-		   break;
-	case 0xf0: printf("Block map\n"); break;
-	case 0xff: printf("Manufacturer-specific Extension Block\n"); break;
-	default:   printf("Unknown Extension Block\n"); break;
+	case 0x02:
+		printf("CTA Extension Block\n");
+		extension_version(x);
+		nonconformant_extension = parse_cta(x);
+		break;
+	case 0x10:
+		printf("VTB Extension Block\n");
+		extension_version(x);
+		printf("  ");
+		hex_block(x + 2, 125);
+		do_checksum(x, EDID_PAGE_SIZE);
+		break;
+	case 0x40:
+		printf("DI Extension Block\n");
+		extension_version(x);
+		printf("  ");
+		hex_block(x + 2, 125);
+		do_checksum(x, EDID_PAGE_SIZE);
+		break;
+	case 0x50:
+		printf("LS Extension Block\n");
+		extension_version(x);
+		printf("  ");
+		hex_block(x + 2, 125);
+		do_checksum(x, EDID_PAGE_SIZE);
+		break;
+	case 0x60:
+		printf("DPVL Extension Block\n");
+		extension_version(x);
+		printf("  ");
+		hex_block(x + 2, 125);
+		do_checksum(x, EDID_PAGE_SIZE);
+		break;
+	case 0x70:
+		printf("DisplayID Extension Block\n");
+		nonconformant_extension = parse_displayid(x);
+		do_checksum(x, EDID_PAGE_SIZE);
+		break;
+	case 0xf0:
+		printf("Block map\n");
+		printf("  ");
+		hex_block(x + 1, 126);
+		do_checksum(x, EDID_PAGE_SIZE);
+		break;
+	case 0xff:
+		printf("Manufacturer-specific Extension Block\n");
+		extension_version(x);
+		printf("  ");
+		hex_block(x + 2, 125);
+		do_checksum(x, EDID_PAGE_SIZE);
+		break;
+	default:
+		printf("Unknown Extension Block (%02Xh)\n", x[0]);
+		extension_version(x);
+		printf("  ");
+		hex_block(x + 2, 125);
+		do_checksum(x, EDID_PAGE_SIZE);
+		break;
 	}
 
-	return conformant_extension;
+	return nonconformant_extension;
 }
 
 static int edid_lines = 0;
-- 
2.21.0 (Apple Git-122.2)

