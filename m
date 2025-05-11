Return-Path: <linux-media+bounces-32238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E670AB293E
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 16:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 998EE1893C94
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 14:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEA325C716;
	Sun, 11 May 2025 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="AUmX1o5P"
X-Original-To: linux-media@vger.kernel.org
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazon11022113.outbound.protection.outlook.com [40.107.161.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D831E1442F4;
	Sun, 11 May 2025 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.161.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746975104; cv=fail; b=sBgB0kaHw3IfFqQXUgiM3xNWfpx+bB2c6Yz4x1sMzN9AiM7APZmXVkL+YdubR9hUBziMI4oaQNorwSvOtex9Hn6BTDMyqN7P3JaweAFnMbdTfc77zevbTiA4g2NIOATdFYK+BBYCi8uxw/eJqkHc9WMpFz0UFR1U1DSRx+gY5sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746975104; c=relaxed/simple;
	bh=YjBXb1Y1NywMkYjTDPiqVEl6DXpq0aV0ui2YHOv2bL4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NQwjBw14/CpvUU84GNTnfCPfI7desAbfAEUdIpSXSB/tEdJAGO8kEAEdmToH9bug0OGE+GE1V0SKJ8K6nJYo9S8cjGkao7sVKHBwtYiUuYhIYXc4mSi4HjMdfdBd3IXTfeYti72TjGPqAaHB6477QKyszuTrhO5bSfK9AwmZuRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=AUmX1o5P; arc=fail smtp.client-ip=40.107.161.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gskdM+eXPkncNKcEfsV0tJHQsfFRDXTTsSmm8ATImJjAgNl5JcBLxnn+B7PqaCu7D4HwuC2cx6dFnty+iCgENoWYnZdMd7UQVCGuUCfoQ+tzcVYGqK9QSC5cbbLxaruclJYbuYnJU/ExwgXvwQx9Ns8SURZU/ikFhk9AlxpiHv80cq+Mq/KGYiJvyYTPMjAuG3ud7lLFdlbwXx9a0M8f+psAprf7Os4n+w5skLuh34g9KwUOP94TVi3FasHlIovU9mGGT2eS+ihV3tVpSxlFdfe4CEl+Icw7CXBulRJ2RE9tv033/HhBVXYL+q9NmWKpT1kWkIUwpP+Dj8WtosnXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrZ6YZ7RFD6yWai2hq8Fo/d2pf1W68VZRSfSauz40gw=;
 b=uWlOwyLwAdtq2V0SMKiq8wI9pLVxBSpYw6G6XIpQ5dzz6msuhanNja0Ciprz+OoBFZcrfMTxnVREpAq2LgNvxvnGMDrp9PNAiOT2wG00KWOsmRoQW6IpjrrVJJfGGOZqVGPJfkmzggqOWc/h52V52wjN2OmrKLea7E0v29cMZWUDa98mFh5E0R+6lGUNNEJ+R4Emr5pN/aaf5EVbz60/ggPrzQGlydyQWtGjGqD/M3fTfoNh0qcBs06/RknihzuuyG2nDwUkef5agl3aKk5B9H7FfzmXgER7cnbyQjkwYatkNqy8jw9dbavz5mO1h+Dy2C3/GmV8zTDevBYkL9vx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrZ6YZ7RFD6yWai2hq8Fo/d2pf1W68VZRSfSauz40gw=;
 b=AUmX1o5PGrOpuwysxMDeWdavEuCnybQ3HeIO5Izu+mxmKTuDcOoqEonbqPzRr2CJizpdekehEqN+Bm/lB+P7NHOMwhhoZcriHgI1OGkWCTEQxrUkV59d/I3TozmXXM2eBkTn1JL6RtlakOON6PVMbiVs9qOQU3ZeZSa40hBOjiCWtsikCnMLocRO47uUQ3yHgpXc3Ro+wekyWEhD4Txdd9KBqziKsnGXHh8DSNYgNY1ZVchgtPjshL6QnKj+O9eSkzv43kGf051PDmOIg4fleHChmZP7ejb+HtaSA4b742udv5Vnrvu1jYnVXTvr8+3MyeRc97LVCZhkXVbfGQFdjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MR1PPF375D3D4D7.FRAP264.PROD.OUTLOOK.COM (2603:10a6:508:1::21c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sun, 11 May
 2025 14:51:39 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Sun, 11 May 2025
 14:51:38 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Junhao Xie <bigfoot@classfun.cn>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] media: allegro-dvt: Add DT-bindings for the Gen 3 IP
Date: Sun, 11 May 2025 16:47:34 +0200
Message-Id: <20250511144752.504162-4-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
References: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::33) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MR1PPF375D3D4D7:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c1b38b-bac6-477c-2568-08dd909b55aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fxj9w5rzHa1jT+2fF6Qc53EK/8F7LGW33tixNjwborYa3CePnPwkFf5l4nez?=
 =?us-ascii?Q?UqX5ipTtN64YeoZRZG8QUSmh2KbkUNNR89D8w+tgfmZZwEok8Y1hLkIOE+xe?=
 =?us-ascii?Q?IRukbcieqctCy/2vBmjirvztFClUU6z4x9lEBuI+Hq+tjqa7x7G/EBsMoaA1?=
 =?us-ascii?Q?QrrJqaCvr0rPnzLGYkRsbcr8bJ39YCOaSjQfhalyTsebRnDJfOZsx+IEYx5Z?=
 =?us-ascii?Q?RBF75h50tW9WkqgArUK70sktQkctkI4HJdQIbSWJzDWO4oX40GYuTsfKXd+x?=
 =?us-ascii?Q?ZonJTho3b/+xTNvqO2+eKWra9ez9vW9Lj85MmtMfpYz19DOde9uIsePhDSgG?=
 =?us-ascii?Q?Q9xR8eZEzAhZrOI+fYA5NSYsY0W6to0Qe+DnG47ZV+0CWIX6jwc1x3UttZxF?=
 =?us-ascii?Q?OvwxwHFmvT5rmRAvdFVQE4skfyN4X/UY2iNGFeu3kNc89AyNDOI4VnXniWUO?=
 =?us-ascii?Q?szP7XheKlz8kJ/IlZ4qSXRjHYVudT6TnrdNftOLGnSuwYVYPYLnLy8hguDWx?=
 =?us-ascii?Q?EZrdSYvOqiEcnJpOqsSf+WDmaHUisgnfFfLtGRE8UcE/1IkyKWhlUvRf0Oz+?=
 =?us-ascii?Q?7Ut7vAUeb1Vz2d0ynMyNb/Aa+bVFAhvp7fd89p0drXPI0yBuFJcIZTaxaFKe?=
 =?us-ascii?Q?uuIxzkbQ3HjgBbgSHCEC9fut4+Qp1Ofsmg3YSKkTwHEmtvgh0DcRUt+Y2OsN?=
 =?us-ascii?Q?00KGbJ8vzIRRC4LanRejVcNVWbl/g2sZzUGRklE2VcB4AJvh+ZTp/Epdd8IH?=
 =?us-ascii?Q?ZGelJHDos/PFWlCNi34Q6HTV090KOkLUm5cXVWTzdLyHSOBpVYEDPhcoqWqf?=
 =?us-ascii?Q?KPmf4UFCyFaxZ5aFB345wnoXb45Dny1j8iSgd7dnRerI8TP4DEbb2oYfJpJ/?=
 =?us-ascii?Q?918VK14IEN0y1zWG4K6fYdppPuMAetK7wfyHXfMJYCN3H0CYmmT0JK1CziCw?=
 =?us-ascii?Q?oZptnmeWYcMyV917qQ+S8m1VZaoBXrG0ijGiFweTrMLWPrJr5BYokW5LDY2+?=
 =?us-ascii?Q?uUU/a5MQuuCDOJMRK5WciWvlW7748iZIP829AFlt+5lqmkTuJoQaqHmGkKHD?=
 =?us-ascii?Q?UwkcolkVnm5Cm34ix9Knx/EDis4/TyXlMg73BURqa/hCdxzZxCKfkGsxBRBs?=
 =?us-ascii?Q?KnP2/l2qELPH0VdF+8EYEu+590A0YwTZYEagFvQbZKFha+hQdDDG5bsaapnJ?=
 =?us-ascii?Q?4sdpIovsWJel2YgOo+eFgG+svob4DXb5/VL2pzWRKrfhjwLLwc25FfiSeYnJ?=
 =?us-ascii?Q?yK2L2kH+APayRi8EiHtPAlJG4OSNornlG0UsyaNZeir2mmBj1Vp/MQKrN0VK?=
 =?us-ascii?Q?REgUhXsFoCYoxat1Q95MIrx6Ull3adj2Iakbm+rbCRgidkH+mBL9sOV1eAHG?=
 =?us-ascii?Q?jNCS8A9yDZLsHuwi64oBl0e5u5Yw3ZJYEhbIkZNwphdAt1TzbA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZXvKWi1gFFkwYNS7jcVN8sY2H8c6f0EZ6hEOP96OCgJoxA3EsH+uiQNKBC8X?=
 =?us-ascii?Q?xD/HU2+NvkQdMzoPwo7PEE2pm+2mOgmu46W3O10r/i7XowlUikhWyQiOqO/F?=
 =?us-ascii?Q?IS5pOyZ4kleOJhpk1I6Kg4fts4yM5Umot+DRwfT0hJGNmZ/ZojV74rGWh3vf?=
 =?us-ascii?Q?YgPmr/39wsE1jrOHW54ym+itn/Jfu1xlgAoqb1lozqnDdOfMvsm/YEJ7WBeM?=
 =?us-ascii?Q?Hcqy9OLjM9ZzOCP6EzvfaLIBGQISMkiSpW/ZI+AowuyWWBmTKgZ9RVPmuB50?=
 =?us-ascii?Q?VAV8Qz2fjf38notp3YqISvS2gdhcV+uxWpDj7xzKiQYYS80mLmGqg0pP1kph?=
 =?us-ascii?Q?ryyW3GV1dmOz7CbUYohBJJyqGsDZpjCrD3W6soyms77FZBQkRhqNyBlqU/tQ?=
 =?us-ascii?Q?6A/5JB26+1C+1ZNLlkXyJBSxIoSS4fZr6QpWLF5Rfc01mNV5C2PWbQv6sOSy?=
 =?us-ascii?Q?2f+LvADYpD5xHFM9NwC0tGkSN6+08Kk0zbtNWr6JkhvCw2UO/dH2ThGi5huE?=
 =?us-ascii?Q?K8/U3EFBKZq8fr7NrdKPX7uiNsL7KojdwZB0OHEpQIyCo4fUkapwo/qePRb5?=
 =?us-ascii?Q?5pw/dWhetwwcrsEMVLNPr9j+ODfn9AOTnpvZ+9tnmTQVybaViTH/po/H8UDP?=
 =?us-ascii?Q?TSZBzU6C/aYowDAIWflGGB9/oY7Y3dpONnNFGgm8iIlqcVKiAi2oPVj+rP6b?=
 =?us-ascii?Q?tH1Fije9I4unVx5yZbPmPfi7KwCJJ4o0CbwyIRdDr5lIp6+dbOdM5MKWHrlJ?=
 =?us-ascii?Q?I1kGaf19shmHXmP/IcCOz0AR58yib4qEFu4ArOz1RnWDDLB1pUL7l97xkNdh?=
 =?us-ascii?Q?2I3TffyUiizVG+mZ/cfGyyg5DLiP1E6ygWnL3WaXQsbWwrsGqUuv44ZzFgF3?=
 =?us-ascii?Q?WizLTwa5Nzpk6zaNtmc7GrNz17C1dfXxwdyhHmEoaYZevJDhOdGZM6PGsglF?=
 =?us-ascii?Q?4z/jkHYRHbFB18nuyWvstRQvMskvfKPQxfKb0kH2Uu9qGHLUMYJs/hsF58Kl?=
 =?us-ascii?Q?UgWGzmKNjJE6cNJW+9lsvyqHG24pVZfPPaNho/I3INRLJoty+YobUEZNhMf7?=
 =?us-ascii?Q?LnaC+g4n0haiwyGFPs6xIk0tvTPxLZ2VV3OEhlNAvliwlV/f/qVnObFq6VMl?=
 =?us-ascii?Q?gBlQq1WWXk3URRptUV8Gd79DKlth9yV+CIZ6M+jfoRZ/N2CDD/5CP5S7HsaL?=
 =?us-ascii?Q?dFcCNPvj9oRxA7qq3u1AWtZ6L2ndpDKhP4RxrXM6b1Ar2cuQrS/Hmyc3mAoF?=
 =?us-ascii?Q?qrqDgJZWPR/mjAZelJuGpLUjQKmpN4jc7U+mWt+NOIVlsW2b3k6k06qqJu3y?=
 =?us-ascii?Q?9v4m8/WFQPU8g88p61JFvKRGFDa/W+aj5UTEv7XxfmMaBLlwCpqiw0sfiY24?=
 =?us-ascii?Q?zhZCTQ2JXiqV/xZcS0dWqT3FvIDRvPqMHaTugtPyqgRIN36cqM7liolPTpPw?=
 =?us-ascii?Q?ceiQFo6Ks6vtWpse8V7QfJ9LBHaCu0VTNeUFhQlEj1XDDig/8nykLp2NA1Oo?=
 =?us-ascii?Q?FC/vhFwrMa3J97goIAA9sRlhR3ONfnyJChq6bERDXpQPFRD5BpO61iSHdN+U?=
 =?us-ascii?Q?icNRTC1Gm1m80JZpwqVTWjD+gIc+FWfI7gKYVsGNkAMZciUqkPmtuThCk5I7?=
 =?us-ascii?Q?feTHEJVc4Gma7yC6Kdxr8jJ3i36MmgDmrv8TZ9D1BUQ8QfiBch4NgcGX/PZz?=
 =?us-ascii?Q?lU8wng=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c1b38b-bac6-477c-2568-08dd909b55aa
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 14:51:38.9188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/G47FMUZ2D9ideRPS+6Nfmj/wIrbtiOa9gWkVaC8s9vxMW/wIsJm2wMublsQuS1ZKVSjC2cNqBwBw0TnngPMDrh+qAoCsM3NjJlTRleJ0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1PPF375D3D4D7

Add the device-tree bindings for the allegro-dvt Gen 3 IP decoders, and
update the MAINTAINERS file.

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 .../bindings/media/allegrodvt,al300-vdec.yaml | 86 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml

diff --git a/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
new file mode 100644
index 000000000000..ea4a55de570c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allegrodvt,al300-vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allegro DVT Video IP Decoder Gen 3
+
+maintainers:
+  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
+
+description: |-
+  The al300-vdec represents the latest generation of Allegro DVT IP decoding technology, offering
+  significant advancements over its predecessors. This new decoder features
+  enhanced processing capabilities with improved throughput and reduced latency.
+
+  Communication between the host driver software and the MCU is implemented through
+  a specialized mailbox interface mechanism. This mailbox system provides a
+  structured channel for exchanging commands, parameters, and status information
+  between the host CPU and the MCU controlling the codec engines.
+
+properties:
+  compatible:
+    const: allegrodvt,al300-vdec
+
+  reg:
+    items:
+      - description: The registers
+      - description: the MCU APB register
+
+  reg-names:
+    items:
+      - const: regs
+      - const: apb
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MCU clock
+
+  clock-names:
+    items:
+      - const: mcu_clk
+
+  memory-region:
+    items:
+      - description: Used to allocate memory for the MCU firmware,
+      and is also used for various operational buffers required by the MCU during codec operations.
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      If present, name of the file within the firmware search path containing
+      the MCU firmware.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: False
+
+examples:
+  - |
+    axi {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ald300: ald300@a0120000 {
+            compatible = "allegrodvt,al300-vdec";
+            reg = <0 0xa0120000 0 0x80000>,
+            <0x01 0x8000000 0x00 0x8000000>;
+            reg-names = "regs", "apb";
+            interrupts = <0 96 4>;
+            clocks = <&mcu_clock_dec>;
+            clock-names = "mcu_clk";
+            firmware-name = "al300_vdec.fw";
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 313d08cf90e0..8912fabab6ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -807,6 +807,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
+F:	Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
 F:	drivers/media/platform/allegro-dvt/al300
 F:	drivers/media/platform/allegro-dvt/zynqmp
 
-- 
2.30.2


