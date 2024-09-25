Return-Path: <linux-media+bounces-18543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D7198555C
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 10:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95E87B22C7A
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 08:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C2A158DC3;
	Wed, 25 Sep 2024 08:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="NlEmnxT4"
X-Original-To: linux-media@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010039.outbound.protection.outlook.com [52.101.128.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCBF7E574;
	Wed, 25 Sep 2024 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252379; cv=fail; b=LYW3MRiLV4+Tw0AZaj/225wT2Uvn32nwOfQtzZ3Q1ZjOrlQeO9Q5WnuEukNLHJR5tmrwuHweQtAYZT9ho0XqLhzClpSCXYUan40twkF6dKEMxmelXXcNjAD+XLrhPaA3TqZoxGjPAI+fK3wofdjK6bB+BsGrrV5saqezUi2VWbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252379; c=relaxed/simple;
	bh=x9Fz3+Oyj/bnNfuNC34Tv6PJi6KgoHqsCvIwGLsexjY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ddWIx7fSr9rRwCg68pe348OWqY6s7D35niCBSCIpsu4UgX6MX43qWWtvPLyCgkqTvX7T2gdnmvAWokdi6sJ+wMOQf7T19yBvnhNzwQsBb43BWJwVOCS8bGJRpbTyMASP8hAQMJefMC9uPi1q6t5riXcxFXUx8lNM0EAiuqs01U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=NlEmnxT4; arc=fail smtp.client-ip=52.101.128.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hs9gtqSOspUkIyBTJcp0uES0xD+fAuf3r5qYXJIYMs3zYIvDlOK2MPf5CzL0Jsxvt9vukABNQpofxamJDVCp4X5r7zOJAdJdS3jiFXk3zrsmi3Z+ZvyqIcBMlsnyUi2Q3XlmZjWIhHX1J0XmEUNSs2IjBQFVI2+fbjXVajGkx9cfNXWAtop7ohV7Y14P0JfRAvZbB9YtpP38ZTAMQrJx8AtP9m2oVBSP4GQ4MIzENvXsjc0ctvqwq+VJJjgPWoXXmj1rHkLBh+Ck3acrIWqiWCaLIwvizaDFPGnW0X7ZPjXyAUw9dY4mU09tNTcaCtZXJmudvcW/iC14kKJTWygQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgdad12z3MGwG2GH1IJWA36kIlazOs7F5QRjf8aNYzw=;
 b=bIf9+rC3rcotn4qXpdN6YtCnh8+b0g6YaQhdLl6Benih2vgk4s+V/6NUtwJrMfv0RtQcmbIL/jbTbp/VP5og+hLzceHMVyZzqOown/dBKbP71UzndnfwjrOE1wwPFtI/6MIvCmyjFYF7+ulOvwtLHA4LblIctgRYQZkNGAdYZOwPZ4niLYloB95Esd9n7IOzF05OphGtztO9Xnlm/KHZzq3QGEyjftDINZNfa6tOR0BTpSuGL8uDiR5AH0QnjMevs6NIuyT1FHSCQkv0NC3ugl0rSn+JdXgzPzdCymJV+lir/7UJEbsdkMCvBy+zeebXofIO4aS7631sGHDODgoJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgdad12z3MGwG2GH1IJWA36kIlazOs7F5QRjf8aNYzw=;
 b=NlEmnxT4Wxn7CzFiiW1hWWZAOLhXcAiyKBUg1J6bix32oGy8e2gVKPKds0DCPhRet1p8SdHhAEgPTd43EDtIYP8hOfBoYisptZCbxEvZJMihoh69Dpp+mJsvhN28ekJUtYWcCgMnLzWMV/+/+xFom80itfs3jC8OZAoZQWHC+6/4ekd+JtTbW9BaOVUzemYvR2yVfbkOvmgKrhH1KJKNKEad/cnYPP49xzkpH6uOfstA5GufzjiZAfzpdoo+o3N99JbtcNJivRVstD3A88I4EdU1f1HCDyGTGZvOg/71/ndKaq0u4Qf5BkECXZ3tAmP4Eug2AOY6wyJOHePJjgKeNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYSPR06MB7298.apcprd06.prod.outlook.com (2603:1096:405:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 08:19:32 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 08:19:30 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Matthias Schwarzott <zzam@gentoo.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] media: dvb: Fix typos in comments across various files
Date: Wed, 25 Sep 2024 16:19:01 +0800
Message-Id: <20240925081911.3310324-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0010.jpnprd01.prod.outlook.com (2603:1096:404::22)
 To TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TYSPR06MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 86fcdc77-3a10-4aba-7245-08dcdd3ac78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m5acSYZzCl4oMuO7kqb/7uMgip9DDZkpoq4GBSHDxcJFjYqssNjBtFY8t6Az?=
 =?us-ascii?Q?H8VGEIgfGADHDgPhZ6S5hQW0fYVctIvkgzvG2QOtUxspZV/pVIpAk1HmGudx?=
 =?us-ascii?Q?YHHNOWNjNbHDlS7vvDLBxntnpaJ8D4+8jbfAKqwfIE8Q4B8DIr3MSby+XxAL?=
 =?us-ascii?Q?AW4HbsojXAVxQT2ayAQk2EVjTgcab7qCT24gxca5wl5nFunGkhDdEy9E7Int?=
 =?us-ascii?Q?O77KSyJ0NfASYQ9fbw57xJBWI0abJQEFOhS+UOJvEBpvp786QmZQi63KePbi?=
 =?us-ascii?Q?xccx/bxXiuMsYeNamcoLwwixNLDmG/2OYTLZPl8zfl1I9iS4zF122CUdM0ev?=
 =?us-ascii?Q?htB0WQ7TkGLUcCZ0spKX3hRJF+xHcMLiuyEVCWYdXAcyIEwEMswO8c3cwiu4?=
 =?us-ascii?Q?aXYhP1aTIU5CNLS8iPlTo/uUX7zusA3etF1y0l6ZPkFVAHt/0MmmKMnZaJXp?=
 =?us-ascii?Q?Ysi+5G/QizEMdIhU7QcE/QKFCxFMMyKRKkvxhip4P38VifstHcAXjyBPGUTt?=
 =?us-ascii?Q?XAHDuKP4hMpIUfTLHNp8BpBcXMvZyhYUR110hST1KIDbs0mM6NaweXhCXPBv?=
 =?us-ascii?Q?XthZlxuk+/W+sIBpAHJYAugNLIZNffZrc+gbfPV04oIV1WcE+68hfmnxdGHn?=
 =?us-ascii?Q?fKhlJ8hnkqk0mis9BTlfgU14QeaaeofkMCfWIpGKgqSXWkt1sxEJ2ErduGja?=
 =?us-ascii?Q?tdzpVxo1qj61yjGeBG1smySP1j2OZlesMOTpsKoeuypB+doymWcyy/vVN6+R?=
 =?us-ascii?Q?G/Bgvn5IB4pw9RrF7ofdhujAnSMEXi64qH9M9wodF0dtu/zDFg6lnVGLW1EZ?=
 =?us-ascii?Q?JnZ/1U4n1nB0oK0jJq2D2TNrnCLfOg0ovvjGA1VDy8J8a0oKzVciGnI0dR+Y?=
 =?us-ascii?Q?LCo2pxrHoXQB936wgXnz2PauepIhcGZrwfD5IkOrPiOdYmI3jHkL5AXRAHVE?=
 =?us-ascii?Q?9l6Pedw3X2zp/pvTfQdIPogI+offiGQoQkndAQdN0YJsQSeFD43hVSvh3qCq?=
 =?us-ascii?Q?UuAFORSEmsNcrrMdP1jNPO/XU+BUFu9eDgFY1EjzXyFyVPEP4TORNZKpJBzJ?=
 =?us-ascii?Q?/aghegFFGBPrUGnX3DqAGl7LruMRMoI3OVOXk8MnDtGjoUx+p4vYCdqiubF9?=
 =?us-ascii?Q?3tHn3afkNrNOMPtTNOMU+e6/NOJDyCsZaaU2d3izYk5y0YRHTZV2CkESZBN2?=
 =?us-ascii?Q?H+ksmOtO5LC9hn3Y9wgTzrJhyyWZlc4vV/eq1zvL20+9uqlHg81/SOiQIPDf?=
 =?us-ascii?Q?+oeb/skk5Q6m52xcI/amrnqg3J6XaZTPhHl/PHColhTqR2Qj3hS3phvhmWq8?=
 =?us-ascii?Q?tUi98q4C7HZOo/eGWd+6QBbQf0j002E1gpDMWiGnoHnDtVbK/HR2wTCeQ2fR?=
 =?us-ascii?Q?BKxeCloQ3eJHv1dSsGJ9QIUbzULATxb1g8/TONXCEzjG9G4EJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VTB6ag0vcYGje/KQvAPJMxvNrLt9eiXKx7XqBwCHmkepodmn1cbFlXnL+zsB?=
 =?us-ascii?Q?el0G2jVYB4vVDnsc3Y4WkEj1tVN3Brc5VnbHsIdk25nUXQBXiMiUBetaWmVF?=
 =?us-ascii?Q?hTM9jPIdoXLOdUtHagnjpBX/XNFRpMtAg+/V4ZoJawVSF5zz1EfIYq8MI3Lt?=
 =?us-ascii?Q?qfVemsunXHeXKzlzNVLTp7Q5RjMhaJymCvO4CoiUfKdL+3IcOH1ymVKvLURb?=
 =?us-ascii?Q?dJX7OnqNJbKsWxKuSgsvtG/fsrfU/w9qGbDstcvr2I+CumuAl5nIaid8mD0O?=
 =?us-ascii?Q?la45oSaePsF7NbvEKs1bh+Dh/jfSxZfn5RyWdkPHCgfp48dGO3ZhHxLJjF6w?=
 =?us-ascii?Q?HYH4qN4+6Rh5rrSIBe09TJewtzpM5xlmkkKXKzrLj0WWFygunRofF2T6tarD?=
 =?us-ascii?Q?De+FAMsuFB677e6/uirsY1UrnlW5Kfq5DSrKDd+lB24ckR+yHw9CvUWRS5SR?=
 =?us-ascii?Q?OzPBhtFNrsB655cfryo+l9ATfsCe26VBF1WbWlwuMqfIm0wzHWZOkDAPraVS?=
 =?us-ascii?Q?iRZFKtuRdpjsVUkIKBaU0rRueqcC2WInoSeGPXI/SygdxC0c+CXjtw28JGXU?=
 =?us-ascii?Q?/MPyMjj6yizDdfOs/uhjJMIVWegpXI4S2xzy/L6E0fcPXmu7eTRr18R/91rv?=
 =?us-ascii?Q?TJF92cOpNOEEs3dnPV99riIb/HdPZCH0cTGGOesOWZffd4b5V1YMigVpVeta?=
 =?us-ascii?Q?yxMZ+BISpherbDYLIwOQtFcklojqQIHQsLFq0kjZ7z5vh99jbHltVdUNLNOT?=
 =?us-ascii?Q?aDJmrDa2x1pYQPQIywv0WDnOKScx+jefZ7HcyhKk02mYIswOPM3V3F1+p0kD?=
 =?us-ascii?Q?qJOxteohzXoTJIeP9Vst7pcCEXQFUkzOobRZ8sMgrtEmUqe+CYCO0bTVFckC?=
 =?us-ascii?Q?/DjuC9G84VB11xgz+O0AqVg5GtCKWs+zhOgP1HtoZ+9GC8q9fa43/280sEwZ?=
 =?us-ascii?Q?/QEnKfc9md5PVBFnBUj1fND2D8BpPdA4V6ztINWqpjf2yWVslQzOnLpcCC8f?=
 =?us-ascii?Q?hvMIpLzti0GJwRu8yYCqjz5wnlX+SgmPd/FuHOhdoA2iTMMID7y0D8INUP+g?=
 =?us-ascii?Q?onqpdfJRLzbQLjMvTgpErLmuX/fqEYe4zqtsVtpSV7iYCBli/ussOxR2Igyv?=
 =?us-ascii?Q?5yMdAdEXLF0ktLwqehqWpPxqSmaZXd74Tk4y1776H7ZkltZ435aLequ7o3WW?=
 =?us-ascii?Q?Eu/tlTwGTutkdSrhiM5gjWuxy73EyUYna2WpUdYHlPlMIEL3VKnbzq2bQ+Fs?=
 =?us-ascii?Q?PePkX/AHohFXLqmemA/q+hk/iAVm5j6scC2HKDEB28z9KsnfXg6ePdqJe8nO?=
 =?us-ascii?Q?4js8V8zVLcKyladTT+o0hk9XT6NDBQlhwIA1xzDHUPSOM+cWbdNlglZ4kHet?=
 =?us-ascii?Q?pgcu95UriyZKUeHZvMz7Rg0fxzUulUVzf6j/Q1SFwFDrMJFyPA8TYkDEjE3X?=
 =?us-ascii?Q?yapSY07tCBARN8Zr9aIURwvP2LJ2+3oTld/JNb0y0+aa7gAced0eRwXDvvgh?=
 =?us-ascii?Q?WMae9vEnrrV+bw3hI/TQ00eJqMMClABu3wLZKUSkdHmr0OlPNE8R40P4ogJa?=
 =?us-ascii?Q?kwu4T2b2BjNQabXivOtgW+qV0Gah4GvHePIiESa+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fcdc77-3a10-4aba-7245-08dcdd3ac78c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 08:19:30.6933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bhBE5oTQUETR198v5qt7F8jAexoYPubWuy6xnWyys3kaAO3xOSJ51VWDzrflEy1fgIk+Ynha3hHdxkEs+qr4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7298

This patch corrects spelling errors in comments within
the media/dvb-frontends directory found by codespell to enhance
clarity and maintainability of the code.
This change does not affect the functionality.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/media/dvb-frontends/bcm3510.c      | 2 +-
 drivers/media/dvb-frontends/dib0090.c      | 4 ++--
 drivers/media/dvb-frontends/dib3000mb.c    | 2 +-
 drivers/media/dvb-frontends/stv6111.c      | 2 +-
 drivers/media/dvb-frontends/tda18271c2dd.c | 2 +-
 drivers/media/dvb-frontends/zl10036.c      | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/dvb-frontends/bcm3510.c b/drivers/media/dvb-frontends/bcm3510.c
index 27f1de21f571..d935fb10e620 100644
--- a/drivers/media/dvb-frontends/bcm3510.c
+++ b/drivers/media/dvb-frontends/bcm3510.c
@@ -729,7 +729,7 @@ static int bcm3510_init_cold(struct bcm3510_state *st)
 	int ret;
 	bcm3510_register_value v;
 
-	/* read Acquisation Processor status register and check it is not in RUN mode */
+	/* read Acquisition Processor status register and check it is not in RUN mode */
 	if ((ret = bcm3510_readB(st,0xa2,&v)) < 0)
 		return ret;
 	if (v.APSTAT1_a2.RUN) {
diff --git a/drivers/media/dvb-frontends/dib0090.c b/drivers/media/dvb-frontends/dib0090.c
index c958bcff026e..6cbbb351d545 100644
--- a/drivers/media/dvb-frontends/dib0090.c
+++ b/drivers/media/dvb-frontends/dib0090.c
@@ -78,7 +78,7 @@ MODULE_PARM_DESC(debug, "turn on debugging (default: 0)");
 #define SOC_8090_P1G_11R1 0x86
 #define SOC_8090_P1G_21R1 0x8e
 
-/* else use thos ones to check */
+/* else use those ones to check */
 #define P1A_B      0x0
 #define P1C	   0x1
 #define P1D_E_F    0x3
@@ -1574,7 +1574,7 @@ static int dib0090_reset(struct dvb_frontend *fe)
 	if (((state->identity.version & 0x1f) >= P1D_E_F) || (state->identity.in_soc))
 		dib0090_set_EFUSE(state);
 
-	/* Congigure in function of the crystal */
+	/* Configure in function of the crystal */
 	if (state->config->force_crystal_mode != 0)
 		dib0090_write_reg(state, 0x14,
 				state->config->force_crystal_mode & 3);
diff --git a/drivers/media/dvb-frontends/dib3000mb.c b/drivers/media/dvb-frontends/dib3000mb.c
index c598b2a63325..822639f11c04 100644
--- a/drivers/media/dvb-frontends/dib3000mb.c
+++ b/drivers/media/dvb-frontends/dib3000mb.c
@@ -640,7 +640,7 @@ static int dib3000mb_read_ber(struct dvb_frontend* fe, u32 *ber)
 	return 0;
 }
 
-/* see dib3000-watch dvb-apps for exact calcuations of signal_strength and snr */
+/* see dib3000-watch dvb-apps for exact calculations of signal_strength and snr */
 static int dib3000mb_read_signal_strength(struct dvb_frontend* fe, u16 *strength)
 {
 	struct dib3000_state* state = fe->demodulator_priv;
diff --git a/drivers/media/dvb-frontends/stv6111.c b/drivers/media/dvb-frontends/stv6111.c
index 2d0adb6fcb08..0ac15273922d 100644
--- a/drivers/media/dvb-frontends/stv6111.c
+++ b/drivers/media/dvb-frontends/stv6111.c
@@ -161,7 +161,7 @@ static const struct slookup gain_rfagc_lookup[] = {
 };
 
 /*
- * This table is 6 dB too low comapred to the others (probably created with
+ * This table is 6 dB too low compared to the others (probably created with
  * a different BB_MAG setting)
  */
 static const struct slookup gain_channel_agc_nf_lookup[] = {
diff --git a/drivers/media/dvb-frontends/tda18271c2dd.c b/drivers/media/dvb-frontends/tda18271c2dd.c
index fd928787207e..c11563853c07 100644
--- a/drivers/media/dvb-frontends/tda18271c2dd.c
+++ b/drivers/media/dvb-frontends/tda18271c2dd.c
@@ -954,7 +954,7 @@ static int RFTrackingFiltersCorrection(struct tda_state *state,
 			Capprox = 255;
 
 
-		/* TODO Temperature compensation. There is defenitely a scale factor */
+		/* TODO Temperature compensation. There is definitely a scale factor */
 		/*      missing in the datasheet, so leave it out for now.           */
 		state->m_Regs[EB14] = Capprox;
 
diff --git a/drivers/media/dvb-frontends/zl10036.c b/drivers/media/dvb-frontends/zl10036.c
index 3df055be66d6..5ad987c6861b 100644
--- a/drivers/media/dvb-frontends/zl10036.c
+++ b/drivers/media/dvb-frontends/zl10036.c
@@ -89,7 +89,7 @@ static int zl10036_write(struct zl10036_state *state, u8 buf[], u8 count)
 	int ret;
 
 	if (zl10036_debug & 0x02) {
-		/* every 8bit-value satisifes this!
+		/* every 8bit-value satisfies this!
 		 * so only check for debug log */
 		if ((buf[0] & 0x80) == 0x00)
 			reg = 2;
-- 
2.34.1


