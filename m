Return-Path: <linux-media+bounces-18671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05A987FF6
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 279761C21AAF
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 08:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEC6189914;
	Fri, 27 Sep 2024 08:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gaDy027M"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2047.outbound.protection.outlook.com [40.107.104.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A21898F1;
	Fri, 27 Sep 2024 08:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727424276; cv=fail; b=sovXiIZC3Updpd5iihWW4DSXpG/u1j54r+mAfREov+i2Q+qhEdZPyLGLwd3/n0hZFyR5i49XUKgEsuHJyXgJast/aA9e+HVJZT8aVPVhhsc8MvoUfx6tDn5dvDLUZ8Z45reSK/ijTjPOHb2ZgrrsVAVJaBzgdo/y2CxRc/nAxUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727424276; c=relaxed/simple;
	bh=E1PGbLfsyU+w5SMSraLV2u5ukCUH7mGSeXf82TQCvqI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mV0X91DfIO4HIMLzVAGUt3f+lYlOOXIT6YaApr2wBSZ3RlC+Cw+qcZUf398Bg4j5TRXXxlXRuZWpD30awLVTgWDNQrAbch1dj0dCoUnt5Gch9mNT/EaLwMBDHxcIK/PtzMsqMQGYJMTWciRojI5R1U8S+csNleJw0ri0aA7rGds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gaDy027M; arc=fail smtp.client-ip=40.107.104.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aozN5IMCXF2a6vyItuJnUKBL4ByBgEUpYao2idweqEqVVBsfaKUmvvkis+WGS4isOZrcSN/bstcQ9SRCIpaotzZOi58yPJCS45HjWX79N+IcVuNOGmeLnvv8J535gnceMyFlydq0m4hqfXraflN8tR3HZgS67OT1/eEt+ZXlakyD4HhqBNsD9PJHcCoQiAQWkeLqKVbUMC8ZRNUe9p289h8K2BDaZByWeqzKN7eiXLnxk1eEF6gAEPFxDfboEH41AphSBen1mhu+mjtQK4NmW9AY43mT71wlidvX6kVIX/T9g6aFGbO3OQCHeulRmOjGsdiPS7mGUG/CENz6l5hU5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1a9Q7q0Ddd1jDlCkAJ5oFa6bcAu9/xMd6pSl2NflMUI=;
 b=dBcH1LsQRvBXyfEC3KJt1pv6ajNRLXBVtDM4khM6fbGM99Wn8qB+V6JF8fPCLVSHnNybSCPEAatrUCdXM0ufRGCShVS7OtQyUZtP0cgXPxLp0HuHxKbtiZ4t2pIB2sqIlzi4iyEH8kSltL+2H3VdY+x6qtGVO2opQjNdR+AFhbWX//3km62O72fty0vIQCTx5RKyLF3CW+lhXaW0jwzT0I5jdH7g1bUNdu/2w3DwOq7/Q570Kk5kEjwlnaIhCjDKG0RH7Tj1R3NrM6Wy2pUyE9LuSQTkV71i36DHoipB2+AgcIn/7L5js79VJzrLYiSbO0D2+fDnb1wqS2rqkSk5Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1a9Q7q0Ddd1jDlCkAJ5oFa6bcAu9/xMd6pSl2NflMUI=;
 b=gaDy027MkBxDsDAjaHs36DfWq28JbS7ZOAn4C/bdlceHyA/aeo1Aogpd5/X+fy775BSa5LBZG/hab60iHXnIXIdbrtyqnFCOu8juy+ULC/ctjgHpzy6LhyWQefmN+V90v6K7XhkvpD/2ZrI4D4LBCtHW8I+ZgeK3lW+HyQitLMPUh87f2Opus2vvakTgtd/EoDif1hqQ1NSCiBb9Ss01eg2o4d54FylpxmQOtCwOKjoEJagbOfaxfjaFpBxIA1Af3mVoAMt+se1cltR155aNdVA7k/JSOMZxfutfV1DiZuvQ/vMU3Pp0PG3oD3p5eezMi1upRsSLCysyza+t2aWjXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AM8PR04MB7809.eurprd04.prod.outlook.com (2603:10a6:20b:242::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Fri, 27 Sep
 2024 08:04:30 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 08:04:30 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: nxp: imx8-isi: better handle the m2m usage_count
Date: Fri, 27 Sep 2024 11:04:20 +0300
Message-Id: <20240927080420.3867806-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::17) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AM8PR04MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 7033f3fe-445c-40af-c965-08dcdecb03ee
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?bhqTBkke2jEhvp1IRkSOl/YVEmf358sWh4l9Yzm9pK744qzcrCj5lOMzv5s3?=
 =?us-ascii?Q?XrIXqZlMtTCcufPHYxXihoY0/icILB6d0i47C36kICcK0UrS7Jsjw4Rs2BB9?=
 =?us-ascii?Q?z7h6yHn7WL9rHSSIGoVnT+WQJEMqpZT+vL1UEoQGE06hASaehPvPuD/NMjv5?=
 =?us-ascii?Q?qamW6v7PRVOUMieswad3R9V8akhG7c5HfmRsQZqGSVp+jg0jXRL7b3Sp+P0V?=
 =?us-ascii?Q?K8sgSgTiWcH8I1ZVWWokJQx/eXYfnwSSWquUPK8jO+M89IH1qfjVm4YfpzTg?=
 =?us-ascii?Q?d/F5iM758F/ZU2/38LoOn+URw59vMiNCZeTZ2/MbePEGk5UVrGjCvngtQmvD?=
 =?us-ascii?Q?FhsM8rNzzFHXCvVJ9a0Ih6NGqcdbwtE1sva8Gihg2E+oEYIjBdNywdFSEcJ9?=
 =?us-ascii?Q?PpsjCNHazKP3fZWX3GD8G6DYTA4h2vtb3lXFPjw7fKxTI1NEn1BQRU+ZFnMf?=
 =?us-ascii?Q?KfNamkmOJURJegxzdxsVvzqq3UbpCXzV5nM5bXmnZ0fm+9k0MwxzkjYHdFyu?=
 =?us-ascii?Q?H/HL0v7hOXgCx68tRHPC0/4YadTNfRwYPbHvK9Xke/dD9aDKMkyduDCkMUzZ?=
 =?us-ascii?Q?7VbeJYbOFN9SHsVNXZbHnIDJWzBW2uwh0Gr+X8+mNYG2OR7/XKEcvsfshdkS?=
 =?us-ascii?Q?4c+MDVgQa/5xpN+Jiue4AY2QSRULjPCeAkiuVc6NDUXJLRb2GoqFWti4zwek?=
 =?us-ascii?Q?wV+ctCc+ICkY7plysW8nTflGlvhWAH7tLrfne5OcQdPU1+7Z8SHKvFXa1pjq?=
 =?us-ascii?Q?IKonR0Jocue74bIpweS42NKCPqr2UoVQ8JUdMp7P2moMeL5f2DvDphKkCDPw?=
 =?us-ascii?Q?Hg5gyK1fa/QbnFpGGyHm2VDa6f9mgN9vQ4TdtazPVQr3Punt/YCWwhz+xieo?=
 =?us-ascii?Q?5v+8G5OAdm5yLCuwkboB1jcuto2X4Az6oW4hileL/EmUks4LVJTQ/iiitGLS?=
 =?us-ascii?Q?EFr/vXq/VkNjQqiLxApL+7OXsi0m9Yoxsnt1VMFRmO2+uCGglskvmVonW8Sz?=
 =?us-ascii?Q?W41GNxCPjB8QrvP1Sw21To094lyYIvgQGw4jK+T7ana6LtwCVSmHZNFBYgg2?=
 =?us-ascii?Q?k6b36yvWOXIDypGeAKvreXNnw/QWhSVJj6yBoLFSY9xU+1TBX9i6T/2s81+a?=
 =?us-ascii?Q?3+rYIhC7yKXmuJKre+dKZmiDJqc9p9FulHgrrD/lHssOR2en1wiAjGYouke6?=
 =?us-ascii?Q?E69bSzxa+029H0lSexINCmoEvqLJ2VRDkXiHh8/bQoBL1+UC9iDm2FBMgRqs?=
 =?us-ascii?Q?sRKaRkcZI9K9s0BHbIfFgroB5qYYtUEtb0MSh7PPb11MTdnSQCGrPckSFntu?=
 =?us-ascii?Q?KnGrXEurV74t3n/dRziuWQ6STePeJ1gZym6V8bLWohr1Bn6bOx96AyHvCdXT?=
 =?us-ascii?Q?6NVDW1dk9Q7cVk5ulyRypYiVzK8q?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?As39oaCawWtMJrBrAxSARlzqvWD8oN4dWwvOOwJOqlJwpb1nFGrio9Doz5GZ?=
 =?us-ascii?Q?F0p6FPRD9zKgROnEGcSa4wMQ37ldh5G9hPy6+CCaErGzLJgWyvhJ24t+FYb3?=
 =?us-ascii?Q?guKzWRKjttGKDxFD5hMPku+whOz2P0d3Qc0bHCK70+iz+3/seIuh5/o1k/gk?=
 =?us-ascii?Q?pLAvbBJ4WCKOiJzcf26h1NVCfTivzx3TeIa6w5OFtzPQEnP52/1v8piv85Up?=
 =?us-ascii?Q?HoYZiTQACzQJVMG455P9zZW8TIkcOnLmgV0q/vu3uLe2eSM9EB2jGE+jqD2G?=
 =?us-ascii?Q?4jO1q2xL6zD0Cso1nofAo4C1c+et2XDosdnNoT5tqj+B2fLm6p0RFWrsarl1?=
 =?us-ascii?Q?J4msD6DVrCuy1jHG1dhK0o90bFDmnJtqfhWzBbzpNI2IrXJfM21xr+uYQyLT?=
 =?us-ascii?Q?toRl8e4+MGaxxlE+tyEjwHwHefGWYLQk2+WPmJXIDllR0y/aLckb4JvwcTRn?=
 =?us-ascii?Q?n09GWtsvj0rAIsIwJYxD1zcIj/EVBC0nw78zXYqQSCF1rVOEVsbLtj9OUs5L?=
 =?us-ascii?Q?jeN8qAQYPBEkkBjmClTcAq0fCRCao6KTqECXSFvGJjSG2+XoMmGHPx3BXyiu?=
 =?us-ascii?Q?vjoB4LAzFLVTMV/zhpl08XfDjPfqAvHXKOsZkBWkqUs3DF96lhIEzDjrJd+P?=
 =?us-ascii?Q?PMhBnAnS0o5VBwNyYFXb+BoAfbvdHPvPECzyxWfHTSTqTvSbGO2vj7QLu9m4?=
 =?us-ascii?Q?f8yl6jQr2r92dimEkrcjR3F/jIOFdXg6u1cf9Ryi+RY3lUBJ0/Kv8YwPz9bQ?=
 =?us-ascii?Q?3Er/D6KNiSIw6OwHcD2umAoqoN6wwXQntGPQJgsFHMVs9H9Yc+lhYjJGYkRd?=
 =?us-ascii?Q?B19TV2T6TZEzWjdFFtNdxOX54ttFPlLDMpOdiAd8EZBKG97B2VqFHSa/V+6W?=
 =?us-ascii?Q?5RUmUVU+yUfGbaLMrc3uaO8n4evCpPC00uXONimo9y22nfI1/UdHkU7RvwsL?=
 =?us-ascii?Q?gH/Mfe2RcqpCmJaKqT3GlHKBzEyLm+xg+JHs+4Oop5nbBSDushqQzG0YL27L?=
 =?us-ascii?Q?5yoo63zm7hHSal2MtgwSjvoZkPdY6g0FE6vD8rBiNyJFfPzferevcR4ZRFm9?=
 =?us-ascii?Q?A+5SDyirXzxsJj1GiKV8G+A/Q7qws10NsuUCN1bUs4HWZwYZhGlDxMkVDYVG?=
 =?us-ascii?Q?UHdOpkemX3RXpHsaO+YcSOAvTrgqAMiwpeiW74R62JaRV7K1Lmiz+53Pr91e?=
 =?us-ascii?Q?mRDopEMwqGgEwZNmcTmMplnU5nQKYWURhT4Xc/gSApmxJB+xul87mHo1UvW7?=
 =?us-ascii?Q?RhOUMoJkshD398XBZOJFakxQR6U1M7jbENbuUcUPLdWb9Ky7K0oGrRm01mDu?=
 =?us-ascii?Q?S6eW9NuBG57iLBtCWzWQEmcQ1iF7kdyU8ZeN67KGECQqGRHpbyCWTTjkiLaK?=
 =?us-ascii?Q?VfZ19g5agHxERgmYIc+iPnDpD/gc2QDc84jdj6NGQBIybwUuFvvlasn9OxYh?=
 =?us-ascii?Q?i/TUKYeAK6z4sZaey6qu9kbQkSvOVVCjljBPZkVWBMVlJ76+iHws0V3PIRW/?=
 =?us-ascii?Q?YWsmg6Looy+6elL9X0KmjDRsTWjDXjIHoQFdepCTkF+7tHmXJTsFuNTFixY7?=
 =?us-ascii?Q?mo81nVAqgIcoyHAkOWb0ndtHPHBG7gsBgTzBtNC7xBT4u/B5VsB68IMoJNYK?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7033f3fe-445c-40af-c965-08dcdecb03ee
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 08:04:30.8500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrW2kOcLex8ULW4Q+u8iSzgHTISd10G4/OrFMgs0gUiQLZ07Sez0jVuXXDf1O2AVKQk3JrO6lEX0ILSY+Q0KRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7809

Currently, if streamon/streamoff calls are imbalanced we can either end up
with a negative ISI m2m usage_count (if streamoff() is called more times
than streamon()) in which case we'll not be able to restart the ISI pipe
next time, or the usage_count never gets to 0 and the pipe is never
switched off.

So, to avoid that, add an 'in_use' flag in the ctx structure that will
keep track whether the output/capture queues have been started or not,
and use it to avoid decrementing/incrementing the usage_count
unnecessarily.

Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
v2:
 * Changed the way 'usage_count' is incremented/decremented by taking
   into account the context the streamon/streamoff functions are called
   from;
 * Changed the commit message and subject to reflect the changes;

 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 9745d6219a166..3f06ae1349e53 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -65,6 +65,7 @@ struct mxc_isi_m2m_ctx {
 	} ctrls;
 
 	bool chained;
+	bool in_use[2];
 };
 
 static inline struct mxc_isi_m2m_buffer *
@@ -491,6 +492,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
 	const struct mxc_isi_format_info *out_info = ctx->queues.out.info;
 	struct mxc_isi_m2m *m2m = ctx->m2m;
+	bool already_in_use;
 	bool bypass;
 
 	int ret;
@@ -502,6 +504,8 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 		goto unlock;
 	}
 
+	already_in_use = ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE];
+
 	bypass = cap_pix->width == out_pix->width &&
 		 cap_pix->height == out_pix->height &&
 		 cap_info->encoding == out_info->encoding;
@@ -520,7 +524,10 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 		mxc_isi_channel_get(m2m->pipe);
 	}
 
-	m2m->usage_count++;
+	if (!already_in_use) {
+		m2m->usage_count++;
+		ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE] = true;
+	}
 
 	/*
 	 * Allocate resources for the channel, counting how many users require
@@ -555,7 +562,12 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
 	ctx->chained = false;
 
 deinit:
-	if (--m2m->usage_count == 0) {
+	if (!already_in_use) {
+		m2m->usage_count--;
+		ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE] = false;
+	}
+
+	if (m2m->usage_count == 0) {
 		mxc_isi_channel_put(m2m->pipe);
 		mxc_isi_channel_release(m2m->pipe);
 	}
@@ -575,6 +587,9 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
 
 	mutex_lock(&m2m->lock);
 
+	if (!ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE])
+		goto unlock;
+
 	/*
 	 * If the last context is this one, reset it to make sure the device
 	 * will be reconfigured when streaming is restarted.
@@ -587,6 +602,8 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
 		mxc_isi_channel_unchain(m2m->pipe);
 	ctx->chained = false;
 
+	ctx->in_use[type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE] = false;
+
 	/* Turn off the light with the last user. */
 	if (--m2m->usage_count == 0) {
 		mxc_isi_channel_disable(m2m->pipe);
@@ -594,8 +611,7 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
 		mxc_isi_channel_release(m2m->pipe);
 	}
 
-	WARN_ON(m2m->usage_count < 0);
-
+unlock:
 	mutex_unlock(&m2m->lock);
 
 	return 0;
-- 
2.34.1


