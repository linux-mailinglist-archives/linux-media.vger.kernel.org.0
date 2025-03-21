Return-Path: <linux-media+bounces-28569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFEAA6BE17
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 16:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89CC318969C9
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 15:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855C81DB12D;
	Fri, 21 Mar 2025 15:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="g1S7tHGf"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2081.outbound.protection.outlook.com [40.107.20.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF6964A8F;
	Fri, 21 Mar 2025 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570182; cv=fail; b=SdqH9EibF6KmwvcJLvpCLcYGP3h8YzEscqrnlnFNijoOtWJBetnYtypRChmMX3iqHVaaQLJz4HWROcjqtCpnwijfPx8RFG1YoKzJiBDJy415+xu8ExO2DCS6Vbxno66hpNi330EAQqfUz4gvPzZOkVBjskGh+W9QYm0YhVb3Hc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570182; c=relaxed/simple;
	bh=dqVKjTbA4j00mBerPanoVoMwE6tSAl8BAzvTznnXHKg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WQtfUQfijS6n+NkHSS7JiMNyvHz7SRa4RgC0mIg15Z5Mrxh3GXNCApku1l/iksToA1coMqDR7wblR4HIVcNw1E2cp9ecpM/kmuhPkjGpLax1QmySuBjKJiOt+HrCTi9Mf7hm4m19gZN3UoqdKp7th5mRmgEt/VOoFIPvprh8yAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=g1S7tHGf; arc=fail smtp.client-ip=40.107.20.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D36kG+ltGy8oWno+UdOgvc3/diLHylg2Xt27Ho0sOfEB4M2sgkR476MeoVzKiuoGusYfMhjOoTQqY5Z240guFuittNMIwSkn2r3GL8/5SR3owTZY/ZI53U9wo9grpy6B0n7YmKR1hHbW11CSMxatbSe097QL5YbEPg07F4pYEE/9yOUUg1o+4nYECOVfhd2xFVhuhhhjYRNV4McCmwlJot9466Lq3lgtPoaQeo8EA2tLTEV+LrpC8v+4w3CWKABCiPvehsyTMtY8obydogdIgOGXvRhnesulfRorQWmoQ2YLgqXLuEmdg9uBBDtxae3E1rczm3gjaKoPlpWdsfdmgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qG51QGdkRGi5/hJ2RPflZqbLI/YXgxKM2qMfM3eUDc=;
 b=zI6b1rOTqFN44+V7rxS1zzN4t1b9mffhW9T+SebNTLkZdVIXh6EUmtzofyNu1e54VlGnyX9ugeXqaJYGRXKhj+7kZFW386ge7V6+JQLVFGx7hoFgTLouBCuy5g7KrlWN1GGPq4tvrkBCCdvAV7dcfF4NpSswZWOygr0a+e+fNclqD6BzHZ+j1IWBS9leKOnCiqAyjBiheRebZn5qQszN2gAO7MsEd48vtWhliVCNuk7B+1p7+7lKqMIWEV6bqC9pXAAQUkdO5Yqze8s+Hubx2cLvXyUfkR10YddEYAm1Co6vqc2viQU5DNwkrPfEYTSNxVrKU/rTm0N67weglgW34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qG51QGdkRGi5/hJ2RPflZqbLI/YXgxKM2qMfM3eUDc=;
 b=g1S7tHGfsGsZl+FN9FWdeK9Q37kW2f/1Km/nB+NKuF+k2z67DISlnj/eBlYpdfLB/WvGM7kt8Euxf9bYK0srzE/K1sabFEGK3cG+zXxw0VLuTttFBAuoXx7H+xyUTlMHl32u/HMEBKfDGYhE0AIEnvkIogE7uXZM/4YkXYtqVW9Z6vNprydFebZIvBKofDyihIkSMXlRZ/9Smf4SwbbLiVblrdDYBZpLnmqjd5XEdYPfqrJAlKNQ+vM6QrZ5lIu3d6srSR+MR2g5fYdvZ/B1KX9crmQE60qJs3Muk1yb0SSnT9qM8bwz0MpjykeksB6gGWfUkcymZjMLB9OL3hWdIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by VI0PR03MB10284.eurprd03.prod.outlook.com (2603:10a6:800:1b9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 15:16:16 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 15:16:15 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v4 0/1] media: imx: csi: Parse link configuration from fw_node
Date: Fri, 21 Mar 2025 16:06:14 +0100
Message-Id: <20250321150615.381112-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0063.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::7) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|VI0PR03MB10284:EE_
X-MS-Office365-Filtering-Correlation-Id: e98d232b-8a64-49aa-1bb5-08dd688b52d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mN02KV/Cnm3iskl29WdZFpDPsCllf/xEYKUyczpSfsdIUeFUANl3nybZUyea?=
 =?us-ascii?Q?Py2b//glfmVsEFUWC31EIue4/1/rSPp42Re62es99rfaoY3EuM7zjK39nqW3?=
 =?us-ascii?Q?zf0Ol0wMnNaI667nWTDN/UeyWR5urU+o3Qmm54ZqDnQRSUf50iAvQjZLRbQW?=
 =?us-ascii?Q?4GolV2QbngHfik8NN4e4uINqcssaF3fbei5XV4sN8Rj8Kr6UwGRLHkjZeOxL?=
 =?us-ascii?Q?t8UHS9IUB3jwCyWEw7cZcZBgRSNDDYnJMJn68rhUQKqqY449TwMuzCBHoYwn?=
 =?us-ascii?Q?hd8jiIAHkxrg8EXahm/V0EK1o70OTc3pKq1fcQCijDGHXLqQsjYlgpR6lFvV?=
 =?us-ascii?Q?h7940MP3/NaUwnLcMOSBFT7TpY5jXteNnssWV+O0XCtRV41Df9ME4S8y0tog?=
 =?us-ascii?Q?yQNchKVQUCsWMS/hYbRdhY6tQPENuueH7ppVH7PMbPgWtO7Qqypy7+GWEjvF?=
 =?us-ascii?Q?QbYbQSpay30Nf07d1MqLh5l1y9F1yjoClppnlGCjI0WYjOdUqN13aPItWL17?=
 =?us-ascii?Q?bzL9SbQisjPtV8TFRqdLHd8KVvpFRZIZoMd9b1700mjoQuUGgxiPnqYwuOKf?=
 =?us-ascii?Q?lMyKQwqsOnvXg+IN7DQouLkbUzji9pAazE7aFYbecizT3IrQPXT9ZhsXBnLA?=
 =?us-ascii?Q?ap3hAVIXJuI66iWKFYBg+Ml7zs0g1f88XnYleUFmjdRYo3uMl6qpM8KvaISL?=
 =?us-ascii?Q?HKND/qCyid9Rqa3D5aqKaS4/6oAKhKhu5URgWzzXIqDLOLHizZsALmd698Lu?=
 =?us-ascii?Q?k6nO2rN4u/5xdGwH5pBbN3QmTNoWvppQDeE0/xRrRLtlUCJIB83ZR1nvjm6g?=
 =?us-ascii?Q?vQXbitoXjSVP2eEvFKUz0PlHFw/r15QzmzayPnd0h9hyyvNS0EPgImki098i?=
 =?us-ascii?Q?pCLxpD6hc/RM4oHSum+SxkYeqKkxG/0+ngXdfafHw3gB7KNpgM1hnKwrknk9?=
 =?us-ascii?Q?w01EZ5F9POCrvn62e9FXpkFUg3DTV5mk0Roi9vQeF6a1Nblef3WeUpHscXSY?=
 =?us-ascii?Q?8OfMSacfYPjlboDV6Fcvtd/uElCRIz2AAjOlVAwopYOFCzj2FvWncIB02e93?=
 =?us-ascii?Q?Sn4rj1SenvOjF2C6kNgxGlr6j4u++7F31cixTMoO6o4wD5SLJvFBUa7IRPax?=
 =?us-ascii?Q?uKao2Xczrad9H1o169NbfE/Cpp+CyiFZwvptRqUEP65RxEuk4bKu10eEDLDn?=
 =?us-ascii?Q?0ggqKadLZTWESVkwd3W9TZpUiy0Usj16atdT4wcyfCg+OnZnLjraX2Jw2nJn?=
 =?us-ascii?Q?ceTRHbMgMKg459CfI9mAA2pN5k0BTspg0e2DSBavlh+F9h8XAUD7+m9C/jWS?=
 =?us-ascii?Q?cVtNNKkid6SMwxrdeKMQ4eDHk+NmO/onvpkUbd4wBYw+g8QEKSkz/lfSsoRl?=
 =?us-ascii?Q?NP8/Y9sVklOHIDY8tX6QMSTuQOk0rXe7/lumU2KEzK9dbsL2pyLyqArf1iXA?=
 =?us-ascii?Q?KKCN4tdCmldy7WbRFCo+tDwTAzIlIQ4X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OufZx84mFdep2NA+j4sYAanwrD5vIrN5DP4SiOj4Xj224Lx4MfH9vMd7uZqM?=
 =?us-ascii?Q?nmhjnByi1h+4ecT6B4hpSwe4Fc/ILwk7QnXBfEXauCLa6Nf8cSOtEF0tWjp1?=
 =?us-ascii?Q?S5no5WyL0dbH/98DE8vVsx9iOWx7mm7+1lMhVy5HO5kDtJfIM2THPTKmWlXe?=
 =?us-ascii?Q?HX8hD3d8ghqT8aeOakKb8VW1ASFV5n90igh7V5S7NfvgMzG0wvtdQk0MGI2E?=
 =?us-ascii?Q?N/eveZQRJXapkWM10w+rcgLZccWkPmIBV6tbfFL6ePqW5LuE2aPL9YjUkX81?=
 =?us-ascii?Q?mJ2SIfOxChlHWA/TKsHOvNd9CNiP/phlnJOA4rzbN/+3SBA1fGhbby3i32lM?=
 =?us-ascii?Q?e1vhDWFroxmlobPOPvute6N78kV4bqpo75PpP8oavvhITr8VXn4Z0UMnIYli?=
 =?us-ascii?Q?bCBY6yyjMGt6Y5+zWAJbphrir1g52xVCV6EO6+q5atCrjR1p/DDNm/DgnnHD?=
 =?us-ascii?Q?1MtMDIU5TpY+m4IaREIiVUt9y9j2lDwnBHevIAfznhed98AjbXxH4HqsvuEH?=
 =?us-ascii?Q?9vBzbOkZdalhlSzWt0rmH6TKGi1Ab8t+U2vcarCP98gS8EkZakIcwTeueCCK?=
 =?us-ascii?Q?X/iXNFCUmjZFZl7RP3QIjEr4iYWuC7cB29mzj5X+RjUP4gRDYuN/yJErfDhd?=
 =?us-ascii?Q?O0vu5pp1UYuquE+BAH4jAzZ6/F1/a2HOAVC+ulMpPi/zQCo8He1DbtR+2RXe?=
 =?us-ascii?Q?GQRpJ3sc4V0rbKl8fjV8G/vITq5NDskKkkivW2lFsquaEjaKXKQ6/INSl8TB?=
 =?us-ascii?Q?nRUSx97q9VQYKV+q2ttTnQKwg2g5A1RxD2ytCuN4r1EfZbQxctQsOegiGhls?=
 =?us-ascii?Q?1MgM/sKA/R5i/jdJYPId1nfKonegFcXPLo/krKJl94naHNbNVKK8TqPWWYke?=
 =?us-ascii?Q?lhSQjT1g63RSb13QfDf4zWJ5Wmsz500sim/lgAqArtogInhLK6XXgzEcIM91?=
 =?us-ascii?Q?ieZMam2KdCyCDCOCzwEu3MaSMeS/k0QnmPf+GTorUIchEa/A3dYyxm7gCLc2?=
 =?us-ascii?Q?8H+o4HoXIfGCjNVE8o2RGs6FjtOiRdeN1etDuXVHxaxPQSD5pLswgsK0KXAT?=
 =?us-ascii?Q?3oOyTdXEPq1kEwwf53hwUyrBWV+18gZSWGzxDQopGjmMRKwpfyztwEaE4cwT?=
 =?us-ascii?Q?kC1fCMZ/FQzguqTNwwWVj1CysSOp5Xhjhj8F69JXysS9M8ge69akH17yUGFP?=
 =?us-ascii?Q?3Q8+jb6rphzqj+TljlPKWRbpYUXqTXKpJiHn51h5DwWa3MUl3DOoJFPuyYwd?=
 =?us-ascii?Q?c6A6K6IVlf81zpvv4L2SOcRgqDQhReqGs1Hl7yuuIe3Dh03TIod/ImbOeNjW?=
 =?us-ascii?Q?wC5TsHJ/Fw4HA9+t4rPFJek0fHi9Bq4uHl5XSmCKCSO3EII8nBAD+AJPxsPU?=
 =?us-ascii?Q?A75R6isoT/lzNRiXV7XiJICpgMlBXYmm+M773qHaNLPq5BsZVG2wovL5ry5C?=
 =?us-ascii?Q?GqfXeA12qpgxwIw8f9T/AJAq4l9cM4M30E0iH3E/YxCigqkqd9yeKokeEE05?=
 =?us-ascii?Q?4oxpq47OfTGigG0ohGZta6ThJcnmAB9OaNbdTDKlFkWwnVKib3ER3AQfVqaf?=
 =?us-ascii?Q?I70JeKln/NX0ggPkPug2vtio6fx1bUNMQyP/2VUM?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98d232b-8a64-49aa-1bb5-08dd688b52d7
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 15:16:15.8139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zSZmo7mfKOagDm2T4ocBnnC3iMiz7Qh2TI61bjobF6kDSsexB4a9PHCqOrau80k4RjfVWZr+0nQ4PVSmiES6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10284

Hi,

this patch fixes the imx-media-csi driver to work with camera drivers that
do not implement the subdev-pad-operation "get_mbus_format".

Changelog:
v3 -> v4:
- Determine the expected mbus_type based on the link topology. If the
  parallel port is used, try to parse the endpoint as V4L2_MBUS_PARALLEL
  and as V4L2_MBUS_BT656.

v2 -> v3:
- Factor out the function "csi_parse_upstream_fw_link_config" for better
  readability.

v1 -> v2:
- No changes (I submitted the wrong patch. I'm sorry for that)

It's the follow up of this discussion:
https://lore.kernel.org/linux-media/Z8AoA6WjbXQufqR6@kekkonen.localdomain/

I tested the changes successfully on an i.MX6DL with an MT9M114 and an
MT9V032 camera. They both use the parallel camera interface.
Sadly, I don't have the hardware to test with a MIPI CSI-2 camera.

Best regards,
Mathis Foerst


Mathis Foerst (1):
  media: imx: csi: Parse link configuration from fw_node

 drivers/staging/media/imx/imx-media-csi.c | 62 +++++++++++++++++++++--
 1 file changed, 58 insertions(+), 4 deletions(-)


base-commit: ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7
-- 
2.34.1


