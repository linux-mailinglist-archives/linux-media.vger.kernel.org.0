Return-Path: <linux-media+bounces-35061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56268ADC904
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42B5B3B31C1
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 11:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E842D2397;
	Tue, 17 Jun 2025 11:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ev6X4h3S"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012034.outbound.protection.outlook.com [40.107.75.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6828A1FC0F0;
	Tue, 17 Jun 2025 11:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750158301; cv=fail; b=qbYTYuU+/jSXaAv42m2KhRz/6tVyezZjmxBPkFeT+hnlzr7IEOMDdM4B/kFDXqByBWwtNwAJlk6xMLLHmKC0++fYA2MRldNJ2M0ShdCE2VluLXfTlj56CqUDYpg75OfSbJ4vjKR1rV6NIVh64LLYxD5Mh/zrShBsXxiDPAxupc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750158301; c=relaxed/simple;
	bh=ahAUnXkjqsb9y+7ReY1hC/YVojKiNQ/CYroUxL0sOLs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GABdmK46yEIGStcXDiL1ec6T5QU0yZ8Cv6o5g2cEtyXkeT31cyx/JwalE9UWYmk1jpQHTBwsLfLn91LUmI88qjrCnT0x1f0uzEuqq0Z6jFxBGaAs5/2Yadi5QN3I57z+09+ZPDNbwUI+fcjzHJeUnJmGWyoPJ5o0kj7JEd3K1O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ev6X4h3S; arc=fail smtp.client-ip=40.107.75.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7ysO+Leo9S0SPljMWenSLwI2sYjFbqup/n3I/MM4jsCuAz6CSccENq5TKLhVNbyZ7sYf+DTMcFiKpF56xMVXo4Fwl4U73WLkmWwK1oirVFtbiy8j9L31JSCPXrDo0F8tmDI3EbMxKSKQ+3jVGNMN8qail8t13eqLSenBYhQIi83rsUhu5T8dUF7gVYAGzVXppP8D2lXvT5i4IFZ5GtYek0/NGRFzJNsvJEb7uaTCUcY+5QRenyKAkP6c8OuauHBSbQFF40Xhx2oM5YqCd9wsDa7mEujn0f6Rgz4QbrXpIMdf39GuBCiqfgiZCw8qk/l3qYu9tFct2jh06kZ1f0kqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWeZ+d/k+X0FG69n0hxk9dcnhSgWrHDMt8N2voaS9uQ=;
 b=pcgzWhknG4BB6Pwi4D+nSbvLCiTjpf66SNCiv6Hnv5hbCIgPBkgLP1l892SMh82w4UJgox3ZXgvRab3Ey+p9MPU2f9LU4eZfcvpL+gb2sfVqgXmc8j5xbg/C6Ze808QXd6YkLcI1327XfeChu/R8FwWpXhdQeata89d3NMNnAIL9InGeY/xzDAy6IS3Yt41r3Oa2vWMi4qhdTYB2iyHMDGg+5wCSanNgtRcUl1pIt7RR12uysdp1MPmaQ/MdMoLqsNBHIqglKfKyBunDteyBsoyKKRvia4EZPpcrEqVUjY7/sXnKzuAtCLeorUQNV76wiSbZLbSP5C1TgYof9IiEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWeZ+d/k+X0FG69n0hxk9dcnhSgWrHDMt8N2voaS9uQ=;
 b=ev6X4h3S343/kZ0qJd2CnlM1JpFBW6Ovzw+u2IDTWRxSuFf66ffo+3AltGrM/NEuyv6H3FcZxz+0pTyKVwON2s67lyNRZTrnewkk68tuDynuV+KLo46ao2VBaSlUZ4bwdtIIh3pbR5xS0q7gsLJQxKCqBkJRr7W1dgk3+bPMzmkCs0XYc5RA2BExVF9rMitC07lL8qUgJQPj+j6cjK9FM6YsAYSq+HblJN0Cr9Hs3j/K+UQN9IPoaSL2KncoodNc3DJRC2zer+0Nl47FfpxPaDjaeb8iYNT/i1iWnyKBTSyzBbQQodbWzVD7AdeR5ejysQHI7Ae2XiW8G7BvBFK9dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5389.apcprd06.prod.outlook.com (2603:1096:101:64::7)
 by TYZPR06MB6379.apcprd06.prod.outlook.com (2603:1096:400:424::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 11:04:56 +0000
Received: from SEZPR06MB5389.apcprd06.prod.outlook.com
 ([fe80::6869:c60d:7f4c:ede6]) by SEZPR06MB5389.apcprd06.prod.outlook.com
 ([fe80::6869:c60d:7f4c:ede6%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 11:04:56 +0000
From: wangyufei <wangyufei@vivo.com>
To: Abylay Ospan <aospan@amazon.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	wangyufei <wangyufei@vivo.com>
Subject: [PATCH v1] media: dvb-frontends: ascot2e: Use str_read_write() helper
Date: Tue, 17 Jun 2025 19:04:44 +0800
Message-Id: <20250617110444.42904-1-wangyufei@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16)
 To SEZPR06MB5389.apcprd06.prod.outlook.com (2603:1096:101:64::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5389:EE_|TYZPR06MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a99d52-0a6d-43c0-7f94-08ddad8ecabc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cNVpDd/b0ZYe8/iAPfcaGfUWsgttBSd3ZLz1a0v1RHNuuPzE0/IWn+TZrSuC?=
 =?us-ascii?Q?q1BHe9yw+oDxGLmWyRh7Tgz899eoz64sKuJySIFB1GcQmU61IyZ9OOxvVTWv?=
 =?us-ascii?Q?NyFnEvTsx8QnnG4/ExiklRVvSXW4sV76tneBpH/Amx7KcTzvoPAfAVbEE+ki?=
 =?us-ascii?Q?rOxJmS8vrlT9gBCp4Cc+mRUwL3rP5g9E5WUuHrmWK1ZCECt+0TRG75aSS1zq?=
 =?us-ascii?Q?Eb2pZqC7COXVuZs/bbY09Z7ncQ5+y0TQnXr86Ako/gsGttE8HIAmKyM3oa70?=
 =?us-ascii?Q?LsJjz9ZR8zh1bk0aFAfMPcKK+18JslBneIehBW9aKzx5YIJDLUdcsTszllW5?=
 =?us-ascii?Q?JzzQFw9+L1dt7MTtA851PYVcoKXxR3kmxsr6N/N28kBtfAyeo/YoMOnynsrp?=
 =?us-ascii?Q?i/3MLxeMN1AI3BCruvSCqbPcvZCqDwZu/FQLx44zxiJEPbOfl7xM538cHMhc?=
 =?us-ascii?Q?BiB4AUStqSZwpJwnJ1NDBNCIfZ6mMfIgU8OODrQbGl/lKEalgrmwfXj1l8gG?=
 =?us-ascii?Q?PGIi+4m0H+UIErP+PNslNg7uZt8c9oInHbSaNcqr9nhGheE8Xm3Jt7sf0TZ2?=
 =?us-ascii?Q?DWcjQ7uPDig7xZTbNho29rS/J5S4SDmQf2Py1Fp5jKqlP4WErOJ0s2iizRhG?=
 =?us-ascii?Q?th3CEPKIZgwP3W4/nKQg6IuhX248qrA8tQhZOlKsaooySSOc1e996RlF6LEV?=
 =?us-ascii?Q?72K5VKSOjMQcu8FVM5sqEQOjteskLTNwM3CDB7Lu5T2XoWYT/W41OUEYtnw7?=
 =?us-ascii?Q?AiclS9gQX5t1XQHK2RltNPsX1Z+bk9JxPBTYaQs40jyIFfR6AsvXGRAZ7mu6?=
 =?us-ascii?Q?V4qw8eZ9kHuHZTjt9LZPjjFwDD/2V6udpmg4urDDGIe/el7FtMqBPKYhymHU?=
 =?us-ascii?Q?tOduTN8r7Lw4RsBihnWE9kEohXTqdrBPCzGMkcxyhfXa+nB2XKh4eh554Nzc?=
 =?us-ascii?Q?RV0xNJ0DhnayN5ejSo79j6gxJ7WkjW2LCjLFcIInmtpBcglfOOs/LWizGhU+?=
 =?us-ascii?Q?xL5ruEoO8NbcpGHpIi0dVLcMBiGk1WGrCbL/bNlPpQqPjPaTp9YWysMIMQaV?=
 =?us-ascii?Q?AiW/vLBS3QyA3Pzbz9px0FTt4sfE1B8Y4ZuMpcitWxj484uWyKpoDj0S1QZK?=
 =?us-ascii?Q?ORMkL/FOb4Sl6eGzVTZQVCZPcCisKSMErRRckUJoFOx1k3r+/3+uvRgUdMs9?=
 =?us-ascii?Q?pw5LmtQ8h/uJhLY3ZrJvnWiiCZmPr281JsqfqvBMw2b2biWuSNvdCEPWraKh?=
 =?us-ascii?Q?QD9CkI4QH5P2iDFsgwarU40JBXifdEfiqOCKzl8W7Tt0bgxwSVnh8V+qyyQZ?=
 =?us-ascii?Q?hS+mre03zT2+LA3f0ejEt+IdoAqX7nicEI/hCH/xJfWAL90BNhGtJDtsq2Rx?=
 =?us-ascii?Q?5MZGwK49pAyZh1tqAVg9C5MLAf8JTxJIZN8koFUJ1HO8iN1XvVe3rTC63hFq?=
 =?us-ascii?Q?iE/1XQ/m14wyTL8jGQec57scwQfodaMVX+wRPMGRLa5Pd4GvmPxnJw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5389.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sNIt+AmQTYC2qm+K7XYaHZY5fWPm/S0o+8/4OsENwHiO6Fnabh3UbJpD46f1?=
 =?us-ascii?Q?ANkjci0sbZT76xzDmUHe+QOwJ2oiAj4uxWfvr/6Gb6bU18CTx2E6+a7AYRZS?=
 =?us-ascii?Q?DPYHCIjaYe5VTJz9i83XMM6cVSOzQepnNA+3j5fD9Es4RJqIsTESy2QSSnCb?=
 =?us-ascii?Q?+NLbqhdLpwX9l1V1NALAo8OgfneSjSm7QzKJJHxt6Ak4oRBP8FSLnGAeGL10?=
 =?us-ascii?Q?uCSD6RTWEznUPgOggwB8PPxbNC2tl4V1QgFeftp6tB0+L0MHQBzG3j13WwqP?=
 =?us-ascii?Q?FOcVG4eNB5834NQ1V7UmyQiUshjlXz1/fbJf9q3JOiRYnkkJ3qqUzFodBwUc?=
 =?us-ascii?Q?F6Yi2totdScoIfSTpIwFVaUElYh/ugaxtvnIQrTtZuR8kvpyEf5E8oiOxZiv?=
 =?us-ascii?Q?T+cI0mN598/0jg2OZwnAJcWvCGJ2m6J4ICQz3GsPL5Sleqmqte4giBobS4B4?=
 =?us-ascii?Q?wGvRfFs4nq9li+md4pqQIA6ThJVETo8Ulpl+Aq/MnqxMAx+hj5rJEZI3B2z5?=
 =?us-ascii?Q?y0XsX5HZdQBavprWw+NigR3huFPKP6XjEe26NacQYSB/htluZkfBQP+uvQoX?=
 =?us-ascii?Q?J6cnCcI8hDjUHBofjPsXJ2iENIqKqEhgmM2VG+S6QLlgzByFwRnsnL57uF3Q?=
 =?us-ascii?Q?DSjBZB0ZhS0XubiAJdxIYYg4tTX+EvglaTpNrHziCDh3ZV1KQklB2kDiq3RV?=
 =?us-ascii?Q?J0o6A6JUVzeJhm3if2wL/8/6G86xmK4U365E/5a41vNRlU2ngMI4jVaxrQtl?=
 =?us-ascii?Q?WOJ71v5Ra755cfS71ZvJNMTH45clNi9DhIV23l/x3igS7elkpAFLZqCrvBai?=
 =?us-ascii?Q?Sx7LKy5dczv2U6fYbwZdTRZF5Jdpa41VfeBkFKgFglCg64wzCB8jjh7iTxAO?=
 =?us-ascii?Q?DeNeGcdbU6Fl212VnXHtxLyih2MxMTET7uTHAULd3mj3f0hxO2VrmDtnG13b?=
 =?us-ascii?Q?K6KreMrrn+UbkQGVOE94HAowmMdyBh8IBuzhMTXXsevLktWhB/AWmRouxsfy?=
 =?us-ascii?Q?eE5osMyPSWykBN6FWBNopzPyDXTAUj0VV7NIs/tc4/nkgdF5muvy/prNy03l?=
 =?us-ascii?Q?3xVN84MUhidzmRV8+zaY8BH7mEHt+LmNLkSeDxFLNYZpS3v+oSfeSrE7xgR4?=
 =?us-ascii?Q?Rsm/hHkiRF/9o7usT8YXkPMxqwGeHiOafRm4rW8f+IztQVfqPkBfSdLAwMrM?=
 =?us-ascii?Q?Izl8zQTDnxEhDCYRTYKptcDAC8Tq6cN6E5FATdf76L6H/zUKe4VQfW9xzHbi?=
 =?us-ascii?Q?JeBbxll3vw1yPDt1JjR0zlUcE63z7g4dH0tsWRMRWqbW9SMQKE8noxw5t58B?=
 =?us-ascii?Q?WLSEdShm8Z6j2OS4L2R2c80TDkfgK8QhcTjxdkMgvdMYcvEYeK0+qSbYAX/y?=
 =?us-ascii?Q?x2RRZbL76fismpzg8pG7SC+TJFqn9ycYqOlyOwRYcPdv0tQjT3WR85AY+WyP?=
 =?us-ascii?Q?GcLbcoZjvb+jSqtkY5+LdW+1Eo0JrB5cNfn6AiVFX2m2IGdUWnyhqpgYR8k0?=
 =?us-ascii?Q?q6sQEJhuhWTsrlhtaeiQJAIIRWA8fUY35WE4fRJi6SxX8NFIPNmwZPNiWXPE?=
 =?us-ascii?Q?JHOHeiRaNTffBjQCbFlRPgH/fImcsoaKWpeU97mX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a99d52-0a6d-43c0-7f94-08ddad8ecabc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5389.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:04:55.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjqL6yrRTGIbKNy7Ecqhb2edCMB8LJI+cUcyDAG2dWP/guJUFk9pvPK6hq4tDliotPTa1G81UPA96nFi7HHRGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6379

Remove hard-coded strings by using the str_read_write() helper.

Signed-off-by: wangyufei <wangyufei@vivo.com>
---
 drivers/media/dvb-frontends/ascot2e.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb-frontends/ascot2e.c
index cf8e5f1bd..4254f5867 100644
--- a/drivers/media/dvb-frontends/ascot2e.c
+++ b/drivers/media/dvb-frontends/ascot2e.c
@@ -16,6 +16,7 @@
 #include <linux/types.h>
 #include "ascot2e.h"
 #include <media/dvb_frontend.h>
+#include <linux/string_choices.h>
 
 #define MAX_WRITE_REGSIZE 10
 
@@ -104,7 +105,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv *priv,
 			      u8 reg, u8 write, const u8 *data, u32 len)
 {
 	dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n",
-		(write == 0 ? "read" : "write"), reg, len);
+		str_read_write(write == 0), reg, len);
 	print_hex_dump_bytes("ascot2e: I2C data: ",
 		DUMP_PREFIX_OFFSET, data, len);
 }
-- 
2.39.0


