Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894882C1982
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 00:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbgKWXkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 18:40:19 -0500
Received: from www.linuxtv.org ([130.149.80.248]:54986 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727726AbgKWXkT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 18:40:19 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1khLRP-007PG5-HH; Mon, 23 Nov 2020 23:40:15 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1khLUV-00016I-SK; Mon, 23 Nov 2020 23:43:27 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: =?UTF-8?q?Re=3A=20=5BGIT=20PULL=20for=20=3D=3Fiso-8859-1=3Fq=3F5=3D2E11=3D5D=3DA0Smiapp=3F=3D=20driver=20fixes=2C=20=28=2369243=29?=
Date:   Mon, 23 Nov 2020 23:43:27 +0000
Message-Id: <20201123234327.4189-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123231950.GD4351@valkosipuli.retiisi.org.uk>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20201123231950.GD4351@valkosipuli.retiisi.org.uk/
Build log: https://builder.linuxtv.org/job/patchwork/78341/
Build time: 00:11:57
Link: https://lore.kernel.org/linux-media/20201123231950.GD4351@valkosipuli.retiisi.org.uk

gpg: Signature made Mon 23 Nov 2020 11:09:35 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Can't check signature: No public key

Summary: got 11/29 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-ccs-Add-the-generator-for-CCS-register-definitions-a.patch:

   checkpatch.pl:
	$ cat patches/0001-ccs-Add-the-generator-for-CCS-register-definitions-a.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:26: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:1073: ERROR: do not set execute permissions for source files
	-:1079: WARNING: Missing or malformed SPDX-License-Identifier tag in line 2

patches/0002-Documentation-ccs-Add-CCS-driver-documentation.patch:

   checkpatch.pl:
	$ cat patches/0002-Documentation-ccs-Add-CCS-driver-documentation.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:16: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0003-smiapp-Import-CCS-definitions.patch:

   checkpatch.pl:
	$ cat patches/0003-smiapp-Import-CCS-definitions.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:21: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:197: WARNING: line length of 109 exceeds 100 columns
	-:198: WARNING: line length of 125 exceeds 100 columns
	-:200: WARNING: line length of 109 exceeds 100 columns
	-:201: WARNING: line length of 125 exceeds 100 columns
	-:235: WARNING: line length of 101 exceeds 100 columns
	-:246: WARNING: line length of 103 exceeds 100 columns
	-:280: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:281: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:282: CHECK: Prefer kernel type 'u16' over 'uint16_t'
	-:286: CHECK: Prefer using the BIT macro
	-:542: CHECK: Prefer using the BIT macro
	-:665: CHECK: Prefer using the BIT macro
	-:666: CHECK: Prefer using the BIT macro
	-:679: CHECK: Prefer using the BIT macro
	-:680: CHECK: Prefer using the BIT macro
	-:696: CHECK: Prefer using the BIT macro
	-:697: CHECK: Prefer using the BIT macro
	-:698: CHECK: Prefer using the BIT macro
	-:700: WARNING: line length of 104 exceeds 100 columns
	-:702: CHECK: Prefer using the BIT macro
	-:714: CHECK: Prefer using the BIT macro
	-:715: CHECK: Prefer using the BIT macro
	-:716: CHECK: Prefer using the BIT macro
	-:717: CHECK: Prefer using the BIT macro
	-:718: CHECK: Prefer using the BIT macro
	-:719: CHECK: Prefer using the BIT macro
	-:720: CHECK: Prefer using the BIT macro
	-:755: CHECK: Prefer using the BIT macro
	-:757: CHECK: Prefer using the BIT macro
	-:758: CHECK: Prefer using the BIT macro
	-:760: CHECK: Prefer using the BIT macro
	-:815: CHECK: Prefer using the BIT macro
	-:817: CHECK: Prefer using the BIT macro
	-:819: CHECK: Prefer using the BIT macro
	-:822: CHECK: Prefer using the BIT macro
	-:824: CHECK: Prefer using the BIT macro
	-:830: CHECK: Prefer using the BIT macro
	-:833: CHECK: Prefer using the BIT macro
	-:835: CHECK: Prefer using the BIT macro
	-:848: CHECK: Prefer using the BIT macro
	-:864: CHECK: Prefer using the BIT macro
	-:865: CHECK: Prefer using the BIT macro
	-:866: CHECK: Prefer using the BIT macro
	-:874: CHECK: Prefer using the BIT macro
	-:879: WARNING: line length of 116 exceeds 100 columns
	-:892: CHECK: Prefer using the BIT macro
	-:894: CHECK: Prefer using the BIT macro
	-:898: CHECK: Prefer using the BIT macro
	-:899: CHECK: Prefer using the BIT macro
	-:900: CHECK: Prefer using the BIT macro
	-:905: CHECK: Prefer using the BIT macro
	-:906: CHECK: Prefer using the BIT macro
	-:907: CHECK: Prefer using the BIT macro
	-:909: CHECK: Prefer using the BIT macro
	-:910: CHECK: Prefer using the BIT macro
	-:911: CHECK: Prefer using the BIT macro
	-:912: CHECK: Prefer using the BIT macro
	-:918: CHECK: Prefer using the BIT macro
	-:921: CHECK: Prefer using the BIT macro
	-:923: CHECK: Prefer using the BIT macro
	-:925: CHECK: Prefer using the BIT macro
	-:927: CHECK: Prefer using the BIT macro
	-:929: CHECK: Prefer using the BIT macro
	-:931: CHECK: Prefer using the BIT macro
	-:933: CHECK: Prefer using the BIT macro
	-:935: CHECK: Prefer using the BIT macro
	-:936: CHECK: Prefer using the BIT macro
	-:937: CHECK: Prefer using the BIT macro
	-:939: CHECK: Prefer using the BIT macro
	-:940: CHECK: Prefer using the BIT macro
	-:950: CHECK: Prefer using the BIT macro
	-:956: CHECK: Prefer using the BIT macro
	-:957: CHECK: Prefer using the BIT macro
	-:958: CHECK: Prefer using the BIT macro
	-:961: CHECK: Prefer using the BIT macro
	-:963: CHECK: Prefer using the BIT macro
	-:964: CHECK: Prefer using the BIT macro
	-:965: CHECK: Prefer using the BIT macro
	-:966: CHECK: Prefer using the BIT macro
	-:972: CHECK: Prefer using the BIT macro
	-:976: CHECK: Prefer using the BIT macro
	-:977: CHECK: Prefer using the BIT macro
	-:978: CHECK: Prefer using the BIT macro
	-:979: CHECK: Prefer using the BIT macro
	-:988: CHECK: Prefer using the BIT macro
	-:989: CHECK: Prefer using the BIT macro
	-:995: CHECK: Prefer using the BIT macro
	-:1008: CHECK: Prefer using the BIT macro
	-:1010: WARNING: line length of 110 exceeds 100 columns
	-:1011: WARNING: line length of 110 exceeds 100 columns
	-:1014: WARNING: line length of 110 exceeds 100 columns
	-:1015: WARNING: line length of 110 exceeds 100 columns
	-:1018: WARNING: line length of 110 exceeds 100 columns
	-:1019: WARNING: line length of 110 exceeds 100 columns
	-:1022: WARNING: line length of 110 exceeds 100 columns
	-:1023: WARNING: line length of 110 exceeds 100 columns
	-:1024: WARNING: line length of 110 exceeds 100 columns
	-:1025: WARNING: line length of 110 exceeds 100 columns
	-:1029: CHECK: Prefer using the BIT macro
	-:1030: CHECK: Prefer using the BIT macro
	-:1031: CHECK: Prefer using the BIT macro
	-:1032: CHECK: Prefer using the BIT macro
	-:1044: CHECK: Prefer using the BIT macro
	-:1045: CHECK: Prefer using the BIT macro
	-:1046: CHECK: Prefer using the BIT macro
	-:1047: CHECK: Prefer using the BIT macro
	-:1055: WARNING: line length of 110 exceeds 100 columns
	-:1056: WARNING: line length of 110 exceeds 100 columns
	-:1059: WARNING: line length of 110 exceeds 100 columns
	-:1060: WARNING: line length of 110 exceeds 100 columns
	-:1078: CHECK: Prefer using the BIT macro
	-:1079: CHECK: Prefer using the BIT macro
	-:1080: CHECK: Prefer using the BIT macro
	-:1081: CHECK: Prefer using the BIT macro
	-:1084: WARNING: line length of 110 exceeds 100 columns
	-:1085: WARNING: line length of 110 exceeds 100 columns
	-:1088: WARNING: line length of 110 exceeds 100 columns
	-:1089: WARNING: line length of 110 exceeds 100 columns
	-:1091: CHECK: Prefer using the BIT macro
	-:1092: CHECK: Prefer using the BIT macro
	-:1093: CHECK: Prefer using the BIT macro
	-:1094: CHECK: Prefer using the BIT macro
	-:1096: CHECK: Prefer using the BIT macro
	-:1102: CHECK: Prefer using the BIT macro
	-:1104: CHECK: Prefer using the BIT macro
	-:1136: CHECK: Prefer using the BIT macro
	-:1137: CHECK: Prefer using the BIT macro
	-:1138: CHECK: Prefer using the BIT macro
	-:1139: CHECK: Prefer using the BIT macro
	-:1140: CHECK: Prefer using the BIT macro
	-:1141: CHECK: Prefer using the BIT macro
	-:1142: CHECK: Prefer using the BIT macro
	-:1153: CHECK: Prefer using the BIT macro
	-:1154: CHECK: Prefer using the BIT macro
	-:1155: CHECK: Prefer using the BIT macro
	-:1156: CHECK: Prefer using the BIT macro
	-:1159: CHECK: Prefer using the BIT macro
	-:1160: CHECK: Prefer using the BIT macro
	-:1161: CHECK: Prefer using the BIT macro
	-:1163: CHECK: Prefer using the BIT macro
	-:1164: CHECK: Prefer using the BIT macro
	-:1165: CHECK: Prefer using the BIT macro
	-:1166: CHECK: Prefer using the BIT macro
	-:1167: CHECK: Prefer using the BIT macro
	-:1168: CHECK: Prefer using the BIT macro
	-:1173: WARNING: line length of 110 exceeds 100 columns
	-:1174: WARNING: line length of 110 exceeds 100 columns
	-:1175: WARNING: line length of 110 exceeds 100 columns
	-:1176: WARNING: line length of 110 exceeds 100 columns
	-:1177: WARNING: line length of 104 exceeds 100 columns
	-:1178: WARNING: line length of 104 exceeds 100 columns
	-:1180: CHECK: Prefer using the BIT macro
	-:1182: CHECK: Prefer using the BIT macro
	-:1183: CHECK: Prefer using the BIT macro
	-:1184: CHECK: Prefer using the BIT macro
	-:1185: CHECK: Prefer using the BIT macro
	-:1186: CHECK: Prefer using the BIT macro
	-:1194: CHECK: Prefer using the BIT macro
	-:1196: CHECK: Prefer using the BIT macro
	-:1203: CHECK: Prefer using the BIT macro
	-:1204: CHECK: Prefer using the BIT macro
	-:1205: CHECK: Prefer using the BIT macro
	-:1206: CHECK: Prefer using the BIT macro
	-:1207: CHECK: Prefer using the BIT macro
	-:1208: CHECK: Prefer using the BIT macro
	-:1209: CHECK: Prefer using the BIT macro
	-:1210: CHECK: Prefer using the BIT macro
	-:1212: CHECK: Prefer using the BIT macro
	-:1213: CHECK: Prefer using the BIT macro
	-:1214: CHECK: Prefer using the BIT macro
	-:1215: CHECK: Prefer using the BIT macro
	-:1216: CHECK: Prefer using the BIT macro
	-:1217: CHECK: Prefer using the BIT macro
	-:1218: CHECK: Prefer using the BIT macro
	-:1219: CHECK: Prefer using the BIT macro
	-:1221: CHECK: Prefer using the BIT macro
	-:1222: CHECK: Prefer using the BIT macro
	-:1227: CHECK: Prefer using the BIT macro
	-:1228: CHECK: Prefer using the BIT macro
	-:1229: CHECK: Prefer using the BIT macro
	-:1231: CHECK: Prefer using the BIT macro
	-:1232: CHECK: Prefer using the BIT macro
	-:1233: CHECK: Prefer using the BIT macro
	-:1234: CHECK: Prefer using the BIT macro
	-:1236: CHECK: Prefer using the BIT macro
	-:1237: CHECK: Prefer using the BIT macro
	-:1238: CHECK: Prefer using the BIT macro
	-:1239: CHECK: Prefer using the BIT macro
	-:1240: CHECK: Prefer using the BIT macro
	-:1241: CHECK: Prefer using the BIT macro
	-:1242: CHECK: Prefer using the BIT macro
	-:1243: CHECK: Prefer using the BIT macro
	-:1245: CHECK: Prefer using the BIT macro
	-:1246: CHECK: Prefer using the BIT macro
	-:1247: CHECK: Prefer using the BIT macro
	-:1248: CHECK: Prefer using the BIT macro
	-:1249: CHECK: Prefer using the BIT macro
	-:1250: CHECK: Prefer using the BIT macro
	-:1251: WARNING: line length of 151 exceeds 100 columns
	-:1251: CHECK: Macro argument reuse 'n' - possible side-effects?
	-:1255: CHECK: Prefer using the BIT macro
	-:1256: CHECK: Prefer using the BIT macro
	-:1257: CHECK: Prefer using the BIT macro
	-:1258: WARNING: line length of 151 exceeds 100 columns
	-:1258: CHECK: Macro argument reuse 'n' - possible side-effects?
	-:1262: CHECK: Prefer using the BIT macro
	-:1263: CHECK: Prefer using the BIT macro
	-:1264: CHECK: Prefer using the BIT macro
	-:1266: CHECK: Prefer using the BIT macro
	-:1268: CHECK: Prefer using the BIT macro
	-:1270: CHECK: Prefer using the BIT macro
	-:1272: CHECK: Prefer using the BIT macro
	-:1273: CHECK: Prefer using the BIT macro
	-:1274: CHECK: Prefer using the BIT macro
	-:1275: CHECK: Prefer using the BIT macro
	-:1276: CHECK: Prefer using the BIT macro
	-:1278: CHECK: Prefer using the BIT macro
	-:1279: CHECK: Prefer using the BIT macro
	-:1280: CHECK: Prefer using the BIT macro
	-:1282: CHECK: Prefer using the BIT macro
	-:1283: CHECK: Prefer using the BIT macro
	-:1284: CHECK: Prefer using the BIT macro
	-:1285: CHECK: Prefer using the BIT macro
	-:1286: CHECK: Prefer using the BIT macro
	-:1287: CHECK: Prefer using the BIT macro
	-:1288: CHECK: Prefer using the BIT macro
	-:1289: CHECK: Prefer using the BIT macro
	-:1291: CHECK: Prefer using the BIT macro
	-:1292: CHECK: Prefer using the BIT macro
	-:1293: CHECK: Prefer using the BIT macro
	-:1294: CHECK: Prefer using the BIT macro
	-:1295: CHECK: Prefer using the BIT macro
	-:1297: CHECK: Prefer using the BIT macro
	-:1298: CHECK: Prefer using the BIT macro
	-:1299: CHECK: Prefer using the BIT macro
	-:1300: CHECK: Prefer using the BIT macro
	-:1301: CHECK: Prefer using the BIT macro
	-:1302: CHECK: Prefer using the BIT macro
	-:1303: CHECK: Prefer using the BIT macro
	-:1304: CHECK: Prefer using the BIT macro
	-:1317: CHECK: Prefer using the BIT macro
	-:1327: CHECK: Prefer using the BIT macro
	-:1331: CHECK: Prefer using the BIT macro
	-:1333: CHECK: Prefer using the BIT macro
	-:1334: CHECK: Prefer using the BIT macro
	-:1335: CHECK: Prefer using the BIT macro
	-:1336: CHECK: Prefer using the BIT macro
	-:1337: CHECK: Prefer using the BIT macro
	-:1338: CHECK: Prefer using the BIT macro
	-:1339: CHECK: Prefer using the BIT macro
	-:1399: CHECK: Prefer using the BIT macro
	-:1400: CHECK: Prefer using the BIT macro
	-:1401: CHECK: Prefer using the BIT macro
	-:1402: CHECK: Prefer using the BIT macro
	-:1412: CHECK: Prefer using the BIT macro
	-:1413: CHECK: Prefer using the BIT macro
	-:1414: CHECK: Prefer using the BIT macro
	-:1415: CHECK: Prefer using the BIT macro
	-:1421: CHECK: Prefer using the BIT macro
	-:1422: CHECK: Prefer using the BIT macro
	-:1424: CHECK: Prefer using the BIT macro
	-:1425: CHECK: Prefer using the BIT macro
	-:1427: CHECK: Prefer using the BIT macro
	-:1430: CHECK: Prefer using the BIT macro
	-:1431: CHECK: Prefer using the BIT macro
	-:1432: CHECK: Prefer using the BIT macro
	-:1433: CHECK: Prefer using the BIT macro
	-:1435: CHECK: Prefer using the BIT macro
	-:1437: CHECK: Prefer using the BIT macro
	-:1438: CHECK: Prefer using the BIT macro
	-:1439: CHECK: Prefer using the BIT macro
	-:1441: CHECK: Prefer using the BIT macro
	-:1442: CHECK: Prefer using the BIT macro
	-:1443: CHECK: Prefer using the BIT macro
	-:1444: CHECK: Prefer using the BIT macro
	-:1445: CHECK: Prefer using the BIT macro
	-:1447: CHECK: Prefer using the BIT macro
	-:1448: CHECK: Prefer using the BIT macro
	-:1455: CHECK: Prefer using the BIT macro
	-:1457: CHECK: Prefer using the BIT macro
	-:1459: CHECK: Prefer using the BIT macro
	-:1460: CHECK: Prefer using the BIT macro
	-:1464: CHECK: Prefer using the BIT macro
	-:1465: CHECK: Prefer using the BIT macro
	-:1466: CHECK: Prefer using the BIT macro
	-:1467: CHECK: Prefer using the BIT macro
	-:1468: CHECK: Prefer using the BIT macro
	-:1469: CHECK: Prefer using the BIT macro
	-:1470: CHECK: Prefer using the BIT macro
	-:1471: CHECK: Prefer using the BIT macro
	-:1473: CHECK: Prefer using the BIT macro
	-:1474: CHECK: Prefer using the BIT macro
	-:1475: CHECK: Prefer using the BIT macro
	-:1477: CHECK: Prefer using the BIT macro
	-:1478: CHECK: Prefer using the BIT macro
	-:1479: CHECK: Prefer using the BIT macro
	-:1480: CHECK: Prefer using the BIT macro
	-:1481: CHECK: Prefer using the BIT macro
	-:1483: CHECK: Prefer using the BIT macro
	-:1484: CHECK: Prefer using the BIT macro

patches/0006-smiapp-Remove-macros-for-defining-registers-merge-de.patch:

   checkpatch.pl:
	$ cat patches/0006-smiapp-Remove-macros-for-defining-registers-merge-de.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:546: WARNING: line length of 121 exceeds 100 columns
	-:547: WARNING: line length of 120 exceeds 100 columns
	-:559: WARNING: line length of 102 exceeds 100 columns
	-:884: WARNING: line length of 108 exceeds 100 columns
	-:885: WARNING: line length of 108 exceeds 100 columns
	-:888: WARNING: line length of 108 exceeds 100 columns
	-:889: WARNING: line length of 108 exceeds 100 columns
	-:892: WARNING: line length of 108 exceeds 100 columns
	-:893: WARNING: line length of 108 exceeds 100 columns
	-:896: WARNING: line length of 108 exceeds 100 columns
	-:897: WARNING: line length of 108 exceeds 100 columns
	-:898: WARNING: line length of 108 exceeds 100 columns
	-:899: WARNING: line length of 108 exceeds 100 columns
	-:911: WARNING: line length of 108 exceeds 100 columns
	-:912: WARNING: line length of 108 exceeds 100 columns
	-:915: WARNING: line length of 108 exceeds 100 columns
	-:916: WARNING: line length of 108 exceeds 100 columns
	-:1091: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0009-smiapp-Read-CCS-limit-values.patch:

    allmodconfig: return code #0:
	../drivers/media/i2c/smiapp/smiapp-core.c:161:12: warning: ‘ccs_get_limit’ defined but not used [-Wunused-function]

patches/0010-smiapp-Switch-to-CCS-limits.patch:

   checkpatch.pl:
	$ cat patches/0010-smiapp-Switch-to-CCS-limits.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:518: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0014-smiapp-Use-CCS-registers.patch:

   checkpatch.pl:
	$ cat patches/0014-smiapp-Use-CCS-registers.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:133: CHECK: Lines should not end with a '['
	-:144: CHECK: Lines should not end with a '['
	-:256: CHECK: Logical continuations should be on the previous line
	-:469: CHECK: Lines should not end with a '('
	-:478: CHECK: Lines should not end with a '('
	-:489: CHECK: Lines should not end with a '('
	-:497: CHECK: Lines should not end with a '('
	-:505: CHECK: Lines should not end with a '('
	-:513: CHECK: Lines should not end with a '('

patches/0016-smiapp-Rename-register-access-functions.patch:

   checkpatch.pl:
	$ cat patches/0016-smiapp-Rename-register-access-functions.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:264: CHECK: Alignment should match open parenthesis
	-:269: CHECK: Alignment should match open parenthesis
	-:281: CHECK: Lines should not end with a '('

patches/0017-smiapp-Internal-rename-to-CCS.patch:

   checkpatch.pl:
	$ cat patches/0017-smiapp-Internal-rename-to-CCS.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:15: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:53: WARNING: It's generally not useful to have the filename in the file
	-:66: CHECK: Macro argument reuse 'dim' - possible side-effects?
	-:1615: WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
	-:1636: WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
	-:2224: WARNING: It's generally not useful to have the filename in the file
	-:2380: WARNING: It's generally not useful to have the filename in the file
	-:2427: CHECK: Prefer using the BIT macro
	-:2443: CHECK: Macro argument reuse 'sensor' - possible side-effects?
	-:2443: CHECK: Macro argument reuse '_quirk' - possible side-effects?
	-:2443: CHECK: Macro argument '_quirk' may be better as '(_quirk)' to avoid precedence issues
	-:2449: CHECK: Macro argument reuse 'sensor' - possible side-effects?
	-:2449: CHECK: Macro argument '_quirk' may be better as '(_quirk)' to avoid precedence issues
	-:2659: WARNING: It's generally not useful to have the filename in the file
	-:2737: CHECK: Prefer kernel type 'u32' over 'uint32_t'
	-:2751: CHECK: Prefer using the BIT macro

patches/0019-smiapp-Rename-as-ccs.patch:

   checkpatch.pl:
	$ cat patches/0019-smiapp-Rename-as-ccs.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:157: WARNING: It's generally not useful to have the filename in the file
	-:190: WARNING: It's generally not useful to have the filename in the file
	-:210: WARNING: It's generally not useful to have the filename in the file
	-:230: WARNING: It's generally not useful to have the filename in the file

patches/0025-dt-bindings-nokia-smia-Convert-to-YAML.patch:

   checkpatch.pl:
	$ cat patches/0025-dt-bindings-nokia-smia-Convert-to-YAML.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:24: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:93: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst


Error #512 when building PDF docs

