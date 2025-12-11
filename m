Return-Path: <linux-media+bounces-48626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D46EFCB5914
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 11:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3AE5301D594
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 10:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A3B306B33;
	Thu, 11 Dec 2025 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="jkmKxp3i"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020113.outbound.protection.outlook.com [52.101.225.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8223064B9;
	Thu, 11 Dec 2025 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765450513; cv=fail; b=qK1qUTAOtl+yqHSJBBB/qkukN8P54W91AM1VO2ijBt3JRn2ayTK2lmpxpdC86mLG72oLf8DkQqR58fke5Xfg6bYAIuotJuVtxdnFdXnZwILSKgF2vJYFwNc+HCwYJ7CjFDDJ9vPsXrvIy2wh07dVKRICFUOSzD7n828/WBcIaEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765450513; c=relaxed/simple;
	bh=M+7qw7+DzO05Z2ClSOCvCJPgVDpWzpOo0AuCs86mfyM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XLIPlOIowUC3Zm4zJhXEU2aNTP+XdHeMXg0mXdxpMwCAwgFTVs47EqNI+nHbxdkV5MLeNsvK2aCe6Oqa/kVZun0e+LWX3WQchslDUxzCmBIQMA65bA1a8qOHSBvLzi17URY2zt1aqmV+Vj1/mo+GDcKE3PQu4ncDRSmhdXy5eLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=jkmKxp3i; arc=fail smtp.client-ip=52.101.225.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwOGoA2BRZFmKto6WWynEgRyHdfUVMnf+qAmCJT0nnBfwC+KEohviqS2v8RkmJf1hoLN0aMdbfxUKhb+thN7PIv7UvK+98j2y1bqCDl6GwmA0BgntNJh+byP+my8kOEvYJUd/K21wWByMNTJ76o008cZpTEgaDZQmJxLSeC0Uz4XGh9aVsfjTmVNmXKbcGiVipA2GaBfAKZdIYWdfBGOoyJNaGQ0H4ijzOZTLIuNDSf0sc8sW6Y7z1w/W069wziPpvaK0G/G4rDgGK4FhwqDZoO/yz3WFm2n5wzAQ2zBvOyoV8txyYVh4XVA75eTcPmSJw2kMfQzyaLBvoobf3+32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYYdToAJBvZy3FCGU50/l3nme28gaLCxXxxSEH4mMK8=;
 b=dfZldKMyHwabWVPQFqce+R+ZLU9ObWnqwahzkiCsGRJLDMRJ5008Y23J16coCf6vkF2AYTOqGYm2L3calQrsupM/dfWfjwYHVp2x/txS5Y5nvVmizVZB3eDlvoJyyXwBf4sHwegq5fSGW3cicwkpq6543W3s94Dq9vYvQYlxPvJN1sdxb0ky32pvQSY1uIc/RXShTxG4ptRiNKyRPZjTecS4Soc5qTklSIDU6VSBsAwnzRFuPGEMhYlaHoyqvHpP7P+JDzPUG6I11O2wmYN93Mgz+zvZv+hl/bIjqAh/ycfkhcCNBuucHyb4jq4ehOwTA4O1VAO2+V9g+ur9ClhFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYYdToAJBvZy3FCGU50/l3nme28gaLCxXxxSEH4mMK8=;
 b=jkmKxp3iU/r2XE/QYQbqdLdC2r4m7HxykAVXDcQucKe8jmDJqHX/Ktn7L5Eyd5uRLGUB4EN7fjYIXkCJ+8D4n1olVoqXn6mxIFrTEKbmwJKxkMkoXdbKegQltnbUWElnBT/bH0fy5Pr/2+IlRXin/p0iZj2SgrQc/dcx7DvRVY0mx4b3fIjz2gum3BV4pMxl7rngr0K0UKUWD5w52rRK+LH8xADNM2KkTsYVd5yB3J54KxUYWB1036e+89Thh1GG3XxPvabpu4/t/fGP0c/LfUQDOUlOzck8P2MwSNZQebKQwF9XiIo9zG5gK+7cv9ikJkqZ/9h1UJjp+s7iJn0pIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAYP287MB3833.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 10:55:08 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 10:55:07 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Date: Thu, 11 Dec 2025 16:24:06 +0530
Message-Id: <20251211105427.22374-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211105427.22374-1-himanshu.bhavani@siliconsignals.io>
References: <20251211105427.22374-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0116.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b0::8) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MAYP287MB3833:EE_
X-MS-Office365-Filtering-Correlation-Id: b6550e11-3403-4e8f-03aa-08de38a3bf89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mB8173B4CCUaAFQOMsplQ0COriFUFtRtrhceY7+f0Arqo8dWRDjgo2KEce2J?=
 =?us-ascii?Q?SmTJVWofgx8KHNTDu5dVUHlZX+5NRVpn6FYyWh+7ATvj1YkhBfOssaQfYNjP?=
 =?us-ascii?Q?EEwBy6WWTW0QNd6QGpw4zRTOmTbFGA2KqecpPIu1vWdUUDM19Rm4klE2ohUW?=
 =?us-ascii?Q?L38fvrzQooSDK6yqLSqY2Crn/yg7Re0WNK8sQTZ0OCUPo67htEplirrRj3su?=
 =?us-ascii?Q?iwRsSFsb6CR1ONp7KK/ghx0kXV6ZYhCl5miaOXKFzZ6BfVxQYhVxiizzLXc2?=
 =?us-ascii?Q?fbIcsD0VXaBDQhW/oFVVO8kaDXJeHEA6xe7osZbf8LeRPLKhvdwb/vJxhs8w?=
 =?us-ascii?Q?Rg39N4i5MkleScogbuwsKBZpiQdmGdEZ85/3iBCjZvYlNiWD7EJ3HnPzPgTN?=
 =?us-ascii?Q?0bYHMp1F8SmKscKAvlREzOxzzu8h9pRM7Llcb+bvtLuioGjF85FIEJKFsZIc?=
 =?us-ascii?Q?m1T6tHyee0HzQ7xOsrAeLTOaYDwR/VjFBD8yl0vSqMgLx9Sj6GMXEvo66sr6?=
 =?us-ascii?Q?h2OD02xbQ5qpFEm1FDaK0GNgjnw7/jdAlcvy9FAZk6J3jQ6QGWK50qJc/kRP?=
 =?us-ascii?Q?aqAp/d/2S/tbXPnJsc4I9in6FVUgCvfiHmve5/xuLVAUHTotqF9bkwwd2QG+?=
 =?us-ascii?Q?KOAQxJYss64KuTroYMskErGecHG+8iHXe+5yjyEmJFBmk5bO+TG0RkjLLRAD?=
 =?us-ascii?Q?/6Bq4/ZhoB2XmRuRG3BLX6mPRDRynRHcp9mclCVmjzRzA83BszUH1HxUYeJs?=
 =?us-ascii?Q?zC0V2SrwR3Yj8rzR8i0PV47lBumMY1mpME6CxYvP4h1MDkM7gvK7NBkzKKCG?=
 =?us-ascii?Q?vfa4i5+5vO0CK4dVkAPKUvVM4aN+q6+S1jzEQoQFdhAKG/wbyFDa2WP1Rt/l?=
 =?us-ascii?Q?awXcrz7s6XfngMEv8/Dw6I+kTXNvMjE2sSe2DhzCH3MKMOsW2y1lt3s7HjVi?=
 =?us-ascii?Q?g//XdwtDmNR73vRHZUYvl5WeuvqqKP3oCG4nt+Y2ca78xBsWIGt30r7RXug2?=
 =?us-ascii?Q?7J7wQ6k6Lbsr/3KbSEKlPS//xy5JhiMAJHGiBHhFkE5+NATJKTn34NhFWQWB?=
 =?us-ascii?Q?9XmhiCh5ETPfTUNuc4378M+3lS/tiiJwYePCzc3vBguSeJiREcXk4FsizR3C?=
 =?us-ascii?Q?oAudY+eXA+s8D91P7d4aPVYNa4O6huLQrju4hJPg5bdrdSECtdTwranQ4daH?=
 =?us-ascii?Q?s67wVYbVDNOX2Ueb3egmS6B8q9zoVFOUKcG/PvhG/8RTtXbAcEGh81ITYMcy?=
 =?us-ascii?Q?V1yMfd9xZPlIvteLRi07c1in7lO4LKHxTu25a+EItu5Fk6EOdWmrhMXRBskz?=
 =?us-ascii?Q?ZHa0tRbu/ZtW8Toh7USMwgPSkSOf1WIPKxFAFPRFfaSKOryP/RWZovhihjBQ?=
 =?us-ascii?Q?K86RGcqJi+kVhbuFjwmAuLPGBfkc72ml2raqIRXmrX3ZKvwF3wqkdTl3nWvn?=
 =?us-ascii?Q?mEL99WiO+fdFsONTUO8q5ogKENWoxtny?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RfE9x3TUUguu/RsDI7SCs1wgnkJ0kCWfYKV5Gerll+Bvd1ga703P9RA9SVkf?=
 =?us-ascii?Q?vJBL/xLQQ6vYUljtdlhS0cl+Ex8DNKhDk2J5AEH+hbQrZi3FcJ2LvyYOiW/T?=
 =?us-ascii?Q?mZks93pNTtqhlz26dn3WQuTjRpFAyazjUB0mUFvamqIgHNQ+LEyStK5snP4D?=
 =?us-ascii?Q?GjmNdOhqJqsoQx19ccms591oiueyHT10GMZDHV3vDGrcpAPHtEnM/qMYygaP?=
 =?us-ascii?Q?TG/ZzH8tKi0n+j11JObkk55O5ZbD+MXIFjFv/w0EwZtyC7IXHR5QypMoyY0n?=
 =?us-ascii?Q?mgcqVxT51T04poGTEFReXwwsjYHRfekXk3ppQB21/s7VC0tg2E6YtLXHR9RT?=
 =?us-ascii?Q?tRFngBaSVVYG7gM8XtA1kAMP8iy8pdUJNyeKNEFgQc2WFCXd+6KgWpcgIuGp?=
 =?us-ascii?Q?edpnZXGcLFoa/j2vavs6lnsBc2LbgX76Lp12DJuqBtCUUp7VNvRUi6nulJ17?=
 =?us-ascii?Q?4B5rvte6/eUSQaxVgwM+xrnrU/QYenWK1DQacAmeKCazQYOeogMkCflhrfJZ?=
 =?us-ascii?Q?lWfSzlUEshr7LRXVshdKtwr8LkBsnXAmPNn5gVJhfeJVBJBO7WG472uQSXsi?=
 =?us-ascii?Q?42Yfp74QLBn5vUER3IveA+ijRJXn6Ly1Pp2/4QocX2cPHC3IPAfMqmgOfH4u?=
 =?us-ascii?Q?D1Vaa2pFoWVU8NvGzGNuvQgINMhZNdsxMrjYSLAlXvKfkPnqJTcLNj8QVB/9?=
 =?us-ascii?Q?eFfv9va1OvoDCnJ7/l03X66rXkbC/mw58xacgLe2gjJyIu17lVUbBrZx76MH?=
 =?us-ascii?Q?LVnO5QXmLPrk+Vpyq3eTXytmN/BHE2dE2Il/9WdGldyOK866fmD8cxlajQho?=
 =?us-ascii?Q?LnZAbBnP+YbMBAzxnhE5TvLFu+kh9Z/tYKLpf/NDyb/00nVhG2BFv8YEtRKI?=
 =?us-ascii?Q?1MoyCwHhjwO5NgHO+wckHQF0pVTFR3lilrk0QpzAK3YMNpd5pnzUP4Cfj5jy?=
 =?us-ascii?Q?RAVmEvIxCi/mODYz1Gwd4KcZGKb5Z52WCpklXzhMXzsh0A7Cr1N13cjmWxr6?=
 =?us-ascii?Q?0rFRLHuePbGXPR8tSqeNNNvidT9+4wlo6wfEXBhdon/9lroA5WUm84GkoUIM?=
 =?us-ascii?Q?nUa/Yg9maD62MNBT6KcAfy99ffcn+mZoy8CkaVWY1dfddXQhXbUG+wPFhrfv?=
 =?us-ascii?Q?NL6nGNx6RCaY6YrnZh601vyUBXh9Ir5vTrz8/SmbZzQEoB5fUUwI4FlZ1znC?=
 =?us-ascii?Q?BBCuJ3A3mgx9GpLiMRg5KFU/Y3dm/4VyqpHomnBmiYyjKbib04jv1TIqBta/?=
 =?us-ascii?Q?sKO2D0TV9ipfJajdOp5agspGqNY+bMx4C+rp6vMYrN/oo0uyL8FnmXTHyCsM?=
 =?us-ascii?Q?IECvysjXu11LnOZtvP3hJ3Ti+cq5LAzB0x4d7YbLR9ummLBLj7ruZWpJzjcG?=
 =?us-ascii?Q?ZED0iAM9uUyRbe/kaVNVSuIWC6JXeA1Fibo35XiNCr/BEv6iBXREYkusPHDD?=
 =?us-ascii?Q?CWcGmze6zVrsc1W/O+p1u45f61c834gIFUCGVrfVs27K0olt6UpGLKc9Cp7C?=
 =?us-ascii?Q?YjnOCqDE6MykpfQfQ7dJuCiXBUqlwV2iUbXA7ZYTcHCNxopTwcgl23RPpbb5?=
 =?us-ascii?Q?IFOXgFpotrK9QPmjy5Kz2x9Jvvd45wfhTgU5kUfSCHksui1TRxGyg+p1jRDX?=
 =?us-ascii?Q?rNgRkNjEkFFih6I/zQqxt4E=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: b6550e11-3403-4e8f-03aa-08de38a3bf89
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 10:55:07.8493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVAxtku9AOW7kK4++vxl37DWfOxFLElxImRWuRdEly4yA7x+Fw+p6jFT/N2IMKI8vwwRhEoQjHmjaHDfe/HEjR8qSw01nfnUnP2uzXR6eoXXSLxIavCoHlUlZ0Gipdmb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3833

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

Add bindings for Omnivision OS05B10 sensor.

Add MAINTAINERS entry for Omnivision OS05B10 binding documentation

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
new file mode 100644
index 000000000000..b16e5333b1ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS05B10 Image Sensor
+
+maintainers:
+  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+
+description:
+  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
+  1/2.78"optical format.
+
+properties:
+  compatible:
+    const: ovti,os05b10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply
+
+  dovdd-supply:
+    description: I/O Domain Power Supply
+
+  dvdd-supply:
+    description: Digital Domain Power Supply
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active high)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@36 {
+            compatible = "ovti,os05b10";
+            reg = <0x36>;
+            clocks = <&os05b10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+
+            avdd-supply = <&os05b10_avdd_2v8>;
+            dvdd-supply = <&os05b10_dvdd_1v2>;
+            dovdd-supply = <&os05b10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 663e86eb9ff1..c85915d5d20e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19234,6 +19234,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c
 
+OMNIVISION OS05B10 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+
 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.34.1


