Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01741107F73
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2019 17:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfKWQqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Nov 2019 11:46:17 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.138]:37172 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbfKWQqR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Nov 2019 11:46:17 -0500
Received: from shaw.ca ([70.71.78.228])
        by shaw.ca with ESMTPA
        id YYXziRYDERnrKYYY4iYY1W; Sat, 23 Nov 2019 09:46:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527576;
        bh=ZbZjeMg4bRMV1Ftgtz/8dBzcw3I1FF14MWwDJ/6Nyms=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=qJ+YZIBBG+seLo3EEBwiTNhNVyTSYL2iNNZA6I/KeV0qjuAlWP6Si5x3M1gTOZG0l
         tN6ZKzDcEN8RDlPH0FSKBnnTE0gpd9TlS6f/xzIlWKhcWqVoTFIJoYn1+jCbok+Kon
         DPlKU/XGUVECHoXPiPSlHoRahzMO4JndlUVAfufUd7nx33VJLskdET2b+A/5yxHoKP
         4YHtO2p4izUCDMuRu8EFngt7Fu2GXCNZqvT9VznZVhhtFjeXX7Goahz1FvSdqDzPdY
         vrc0jiS2E/M91j/iCPHc+5IEfc6Nb7VvOGbqtCLxF8Ke6NrQWpmM8/fwDDF75dJYDL
         DANpZECJ5Zgjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574527576;
        bh=ZbZjeMg4bRMV1Ftgtz/8dBzcw3I1FF14MWwDJ/6Nyms=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=qJ+YZIBBG+seLo3EEBwiTNhNVyTSYL2iNNZA6I/KeV0qjuAlWP6Si5x3M1gTOZG0l
         tN6ZKzDcEN8RDlPH0FSKBnnTE0gpd9TlS6f/xzIlWKhcWqVoTFIJoYn1+jCbok+Kon
         DPlKU/XGUVECHoXPiPSlHoRahzMO4JndlUVAfufUd7nx33VJLskdET2b+A/5yxHoKP
         4YHtO2p4izUCDMuRu8EFngt7Fu2GXCNZqvT9VznZVhhtFjeXX7Goahz1FvSdqDzPdY
         vrc0jiS2E/M91j/iCPHc+5IEfc6Nb7VvOGbqtCLxF8Ke6NrQWpmM8/fwDDF75dJYDL
         DANpZECJ5Zgjw==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=_Dj-zB-qAAAA:8 a=bAolQom50hykzV7YMrMA:9
 a=3YPUzw7YLU6Ixx1t:21 a=L6LgHPg5I2kkYD5o:21 a=c-cOe7UV8MviEfHuAVEQ:22
From:   joevt <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, joevt <joevt@shaw.ca>
Subject: [PATCH 06/10] edid-decode: Dump hex of unknown CTA Vendor-Specific blocks
Date:   Sat, 23 Nov 2019 08:46:00 -0800
Message-Id: <20191123164604.268-7-joevt@shaw.ca>
X-Mailer: git-send-email 2.21.0 (Apple Git-122.2)
In-Reply-To: <20191123164604.268-1-joevt@shaw.ca>
References: <20191123164604.268-1-joevt@shaw.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNqLdg9ZMaVKC21oywaFt3H2bmA4YWhViyWonWA1WjvSCAEe3Hxa+KbFs9/SNd4ZO7JkIwMXwq2UloVIL/JtoYTG6UZAghSoIQ1tAq28T9I+4o2kIusj
 94N4R7mU4NjgkzMPk420nSsXDfywUqT72ReQMGimik884sXR9gG/i2L30LqzQ1p0adqWTZp/wT2Jyvr0RrPkEFILxSRUOtiZU4g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Unknown CTA Vendor-Specific blocks will output as hex. With this, two EDIDs with different data will not be considered equal.
- Added hex_block to output hex for blocks of data that are not decoded.

Signed-off-by: Joe van Tunen <joevt@shaw.ca>
---
 edid-decode.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/edid-decode.c b/edid-decode.c
index 4d6fe29..ce404cd 100644
--- a/edid-decode.c
+++ b/edid-decode.c
@@ -1934,6 +1934,18 @@ static void cta_hdr10plus(const unsigned char *x, unsigned length)
 	printf("    Application Version: %u\n", x[0]);
 }
 
+static void hex_block(const unsigned char *x, unsigned int length)
+{
+	if (length) {
+		for (int i = 0; i < length; i++)
+			printf("%02x", x[i]);
+		printf("  ");
+		for (int i = 0; i < length; i++)
+			printf("%c", x[i] >= ' ' && x[i] <= '~' ? x[i] : '.');
+		printf("\n");
+	}
+}
+
 DEFINE_FIELD("YCbCr quantization", YCbCr_quantization, 7, 7,
 	     { 0, "No Data" },
 	     { 1, "Selectable (via AVI YQ)" });
@@ -2321,7 +2333,9 @@ static void cta_block(const unsigned char *x)
 			cta_hf_scdb(x + 4, length - 3);
 			have_hf_vsdb = 1;
 		} else {
-			printf("\n");
+			printf(" (unknown)\n");
+			printf("    ");
+			hex_block(x + 4, length - 3);
 		}
 		break;
 	case 0x04:
@@ -2348,7 +2362,9 @@ static void cta_block(const unsigned char *x)
 				printf(" (HDR10+)\n");
 				cta_hdr10plus(x + 5, length - 4);
 			} else {
-				printf("\n");
+				printf(" (unknown)\n");
+				printf("    ");
+				hex_block(x + 5, length - 4);
 			}
 			break;
 		case 0x02:
-- 
2.21.0 (Apple Git-122.2)

