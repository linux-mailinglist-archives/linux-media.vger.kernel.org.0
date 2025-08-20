Return-Path: <linux-media+bounces-40446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBD0B2DFAA
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3003C5C5710
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 14:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824AA288C12;
	Wed, 20 Aug 2025 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b9C7AH5d"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB99285040;
	Wed, 20 Aug 2025 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755700781; cv=fail; b=KuX/4/mpjZlumQ2yQmlszfjsCPfoN8Oz863/yHRudZGEwaemgbOwBfCw095bX6Des10idvavZ6seR6oCLZ8cGKg0Xj2Kr2WR1ij6ZO2H0f9R788dLcUtpkdlxjgtmFh2fMABPY3Of52irDdV5DYo8LVxFSTBP81GzxTZqSCTdbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755700781; c=relaxed/simple;
	bh=GLkdJ5I2lH4bN9dYfPDkVOuCvqiahmr7mA6d/Rd/x5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c34X9TctZQ1SZBZMX7F27nvgP0gfDSRISfh8cEurVQjJYF66iDF/579BeUsDw3Rnz7o30kFFDIq/8jPNHxGwURR8oIoEQYPMGvmgxvcdziA8k2lYtHsbsvtXxI+pUfGnzEdHLA0DNIVv7uIJD6p4fvBOfWunXMHcHlvlnTkUyC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b9C7AH5d; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hneVOL7wV+3j2Ew3ROQMOMM3kTlJ5FVCvGdXeCj2iYlncbXdzKT8LNIjOWIFTgCLIaNWmjHTHvbBtfT5+IfmutqSUCCZ7nnMQLZGWS9ljQCGg7u6xpZ3qbiWkqyymphEyCAgwzQ2CFbbH315wZqPA+poChllikoTzBNnDn8Omsrq/MFjzDCrWB3SHEWpqe6wq3bGmhcxWhlocK4uqR1mOtTi7y8uqN0JIrG9NV/qCBPmKEgVPqTM1nhQbBctUhym+R6v8Ph5mp71GZkJtvU89RYIqrnxb4DfziaMLnmEWMd8VnZQN3V4g1dHYVhUPQ17B4TfRmJacOi58hGfmXuwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=712Mo12sKlHcVkrmO2j4o0z54IbkgMamv7susORvjSc=;
 b=QMyXK5u+wJGd7WblaWDxSd8dzjWqLLXoy0A6/S4N1y70r/CQgTcjDXf0ouau6SphOkkED/snFaaB9DME2OsXaVsJhi2RZUC2EcsAXeF4HIVI9439RutyobAuXhiY1z1gP9r6DY3dt1L20b0+5bbrjfBzO/jgXld/Frn5WZHJU7TjB/Qklcpttt6vQM73m/Xr5Erp6bHwqPlS1O8bS+0H4Yay7I353Df1SYXWqNiBq9qEJ+xQEnyi6ZbD4aSGAZfqr/Y+LuU99ndRSauGIGun1XMRDz2IdbDcw68In+KrmzIb4WW3EH4k7mYodNQYq02a/fiNtpbQRpMoFFTKdTh2CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=712Mo12sKlHcVkrmO2j4o0z54IbkgMamv7susORvjSc=;
 b=b9C7AH5daSnXF10jk7NwWJ3N1ZSerpWWHTFHGPoveX4LHmxk5tXksn5HpM9QtKecpOEE8V7i0meOxWtpJCnaU0ZWTLTB6Q8s1LmSH4rXOoKTf8HLu1WY1cwHiDtuEpLx5hTApI7InM8QGOQO7Ny9OpgrpJ7JD6NsoV9mE2sn5LsEymuaXVdqkg7PsurUqo2zpbIQtQM6QUVV9YXCQELdeIlXb5hoF2BZN5X0mgJQwHXUNGkBlDlUGP5CL1SpdcG9t625cz3ZMDRoCcoUV1/z/Ga+Wyc2Jjw06XImnUhZ9ZrxMFhPHIyedWw9TCaFUZTnRbPuoJgpKWO+NdumPIB6/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8857.eurprd04.prod.outlook.com (2603:10a6:20b:408::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 14:39:34 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 14:39:34 +0000
Date: Wed, 20 Aug 2025 10:39:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev, Luis Oliveira <lolivei@synopsys.com>
Subject: Re: [PATCH v2 00/32] media: add imx93 mipi/controller csi support
Message-ID: <aKXeG0+QxcgZYiUE@lizhi-Precision-Tower-5810>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
X-ClientProxiedBy: BYAPR11CA0079.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::20) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a2548b-27b0-4b4d-7217-08dddff76186
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?cUgS/xgwr08loJpK3yRa+vP9ni0itRRZICPw3FOBaONDQC9ggyAkfHq/iRC5?=
 =?us-ascii?Q?/P2sbEoEq+3OxOtcCCxI9y803DvimFMJcsg26OEbOzV0l5Cx1sZEcijN3/EP?=
 =?us-ascii?Q?bC043eMjMt4xB3rTpZJoaO7z73ZllBfj8wElA7CLCXSPPtxzitLY6mBWt0Fx?=
 =?us-ascii?Q?huEaPWMk+2Bk2QtRk1Nib0g+mR7bEEvqtYHXc/oNct6//ctPVOkia7l1yZ0H?=
 =?us-ascii?Q?Kmd/7LgtE+EbLlLFm3xh4gO4qqJPhCkcscmqRRax1c2DK1UZRqfs7+SzBS/I?=
 =?us-ascii?Q?mN+bWDjKPJQyohza5Q9GnjqeeaOyJq6aOQQl/MJIwdQ3q0tuk+AubaLDJH44?=
 =?us-ascii?Q?4WnjN86XkW7yLNjFAEtwzr5c45t24JBcE+MBfHV2/rjdGugxfBMmZlLdM1Sb?=
 =?us-ascii?Q?csLn3C4iO84DYZ5ch7fme94ygdd9xdym3QVoAXNVUQLopqM72Qd845sKW1RH?=
 =?us-ascii?Q?v6o3cw7+fOdT9VP24YOPgbO9ITyM3FBSgAoxW2MVDhF5q5KgK+QXNjEQnzrq?=
 =?us-ascii?Q?cNK/ocCYnadABnVYWulvMEQesm60o6w3gNK/1fYJkgXgGeau/Y0STSQ5UVVZ?=
 =?us-ascii?Q?LmPYyy9J2yeMZEfMK2T+7vFdDPZv6yD2Hdi0FbxNpXvYESEYA9bexJnB24i8?=
 =?us-ascii?Q?kC2ETY6n+hKwQTBsCHDa+nf1+gMt6A5xJdieZO8KTrV3aU3YHPxce+YaakOi?=
 =?us-ascii?Q?LXQ39oJoXzsUJa0Zb2iHA6uCL8ctqkK23Dy4exthtVgfPI/lLYrZLD1na4Bw?=
 =?us-ascii?Q?DfSjW40f7OBWz9+erxKaBnYA4iC/a+RoEtcqQGwJ2HfjDK2X9uSptAQwBt0D?=
 =?us-ascii?Q?a6tVHGaEK+rN93NYjphosr9/Txfx9CKyks11yagOhcf+P2bklblJpidKIV7W?=
 =?us-ascii?Q?t1t5Ugmp6606tHhjW96obRrfk19e73Hy5YT+0iuZQZzh7zaD8wP901oBSDgA?=
 =?us-ascii?Q?ZZ3ZY/9RPyFF68M7HznOAPz85+DjSkBygEp7iNwMKtqrcefWutWat7sNq/GX?=
 =?us-ascii?Q?orjhPNh9uXhqrujM2CIiD1kRM824d8Icb6As/7AQMbLO9KFCjDckgh5sLkKN?=
 =?us-ascii?Q?1xY57fE5JutNwTXlzBhJm1ImvlgWIiO1pXASSjgBewC/CUncjyk3Cduchebk?=
 =?us-ascii?Q?4DYQuyCU10og/Ga2k/0y4q+BupdNbY/cr8llA+EP45XuFDrEZzgi9fW1cE3y?=
 =?us-ascii?Q?AgKJpyPSuQX1tFh6Xi88hCq2ngT6Vy+FdHMm/o1sOq+CQ/lscXathiQ4lNYY?=
 =?us-ascii?Q?0UQZNGrE9s4+AJX/JNbmQ7DyZY9U8S32rQhu7io0vpFfetRbFKlQHtCh1jma?=
 =?us-ascii?Q?MtPg9F0xXa9Z9WCyhQO5QQcG8+BlS8iLFj6VKGDWO2/Qsz+m3amDsATcBen1?=
 =?us-ascii?Q?AXgd6NdM0Cp793jlr7Qo9ljS19hEBzNSPJn2HJQoPw5BCGclB5GKE3aBxIYU?=
 =?us-ascii?Q?J4kI+jLFUemk/OTm6LVwLekPwEKfcbXiXPi4yjfi3R0KKigFcIfTyZMsR+q6?=
 =?us-ascii?Q?aVk7wHu3i3USqLCpFBQmVJztwAU7XrO9finm?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?c0YmqQx/8kG6iOz7fMek7L506RemRVi/HtEtvjp40UnnsOR6gdBwxYUsi4GN?=
 =?us-ascii?Q?hADF6aQNx/VdyaeMTA6FW6SOg1yl5UE7QS5qSTzYPy0I24C+zulCuy53QGJr?=
 =?us-ascii?Q?TXlgKOkNUtHOdgV9Wek1e8v/0fBBjgLtcedAgDgbNDN7BSBfrYaOqsSBMQgQ?=
 =?us-ascii?Q?FJdSkmXlptT1dUgOBp6NwrlhftSA6yC5LNT4duJFTTqxoECHEE1QAFNyD/aB?=
 =?us-ascii?Q?5uALoJSI9dH1cOyfN5J2JE+bfbqBz4msJGza7M3TYnoHTmH3UFXNDUSKR9wy?=
 =?us-ascii?Q?UrBS2zpef0LCYEOIgXUXChyAr+G+mzZtKQBAupJhWtBn2+3DCYKURu/r1Bq7?=
 =?us-ascii?Q?mbGLEIUWdiOoyJ0eKHuN2QuYqxTKxLsNB6xxbPmrED3r7/Rb91sZqEHje8+p?=
 =?us-ascii?Q?8x07mNUFvH3C5jBKrkVdIGcr04ew2gqrUrmAxrFNeTnpzY63GwIcEpEC2oFg?=
 =?us-ascii?Q?917B1hssQ/VZw+92qJr23U+ZJ2S5B9fSuIOFThSz/kb7aCMRm5O1CT+APoTQ?=
 =?us-ascii?Q?9MZ2QdRuVfXoJBHh/CKET9FC1TRZZuuMsDNYyGvIwrf5AsiwuWFDo7xlI+GN?=
 =?us-ascii?Q?6wfeqDjd2PP3suER8oLqEZOIy3l+KJNCVzGKhJQ/8ohmuV2fKr4zEp7BAn45?=
 =?us-ascii?Q?nasoupMfL47rOIlK1yLzvX+q8TrZltSCQwnSVRaPSXTR5Xm3B3kWSyZK+zA1?=
 =?us-ascii?Q?386i6lKJBpreVs93nJ3X4cGrRNBiv7ygAeriNsAcc6x6azVu57vTVzOOyI7h?=
 =?us-ascii?Q?0GfTEAkEKav3zMEHuGs1JQMObi9wnLlg3DajS76FkBEOYGgMUwIv/hqhUefK?=
 =?us-ascii?Q?UYUhZNFKkwAKF1kkAWYs1ANKTXvcbhd3Htgv+ipGCetsut2S19nKS0E0wuUi?=
 =?us-ascii?Q?cfl2XL+o1zlZJ1wrzd7lRC3qdzJd3nX7ekC8lf8uwxmLpGFVq+uAhJby4CIH?=
 =?us-ascii?Q?oEVvo1Le6P6HIj/bIRrekhVYhipr80+coD1f4qXweJ+louksu7qPLf1lc1MS?=
 =?us-ascii?Q?zOejITZE5OFE5DwL3BjC5S+8GY54SN5TBEa0iVkdigJ+/DCfH8RVo2acQjvt?=
 =?us-ascii?Q?q0wvnpWce66YrqCmOoWSfEMqMW0G1+0wx18Rw4k7klGBBFJX7hK8mJ0KwvyS?=
 =?us-ascii?Q?WtXYRzRez44vcTMT7QkEXJQ5jTGqU/EQCjAO1prIno0giRHOdxCTCzzSa2VG?=
 =?us-ascii?Q?BSWQ/m6FRNfgOB7lP0Y8//8/86G8NaZGSJIQfK4VBiUgo4/QEmRkQHXtS3nP?=
 =?us-ascii?Q?Rykwq5TYXl4QVnUno01t8PSvRBsHAY9H/vA8Nb8Ur5DLeA1ESNqTeB9oAgoF?=
 =?us-ascii?Q?cUHv1Ue7Vlqy+1tegclB26lkousxTrG+OYYWPuRfZBxkBAbB4m84u6E6fk3d?=
 =?us-ascii?Q?M8r16kArw2dFdpoCpT3FYtKEx611kFpy71tO7HYtTAkn+vQDTF1gytuezjtt?=
 =?us-ascii?Q?CW29PN679iyHx3tyeaHJjlFwEBYfxrScPIPDAzBf2Jo217CksrOzA4e33Nu7?=
 =?us-ascii?Q?2vFFhYQNWlsblc033pm0IMRvufYR1jTVSwK0X1snGVg2lewYpQwd0kyxThgT?=
 =?us-ascii?Q?B32Yj4FbNkjZNhzsB2/JSqutin47lTfH73vRmMWW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a2548b-27b0-4b4d-7217-08dddff76186
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 14:39:34.4667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQZGjtjowiVqyufy89XO6YtPLJCQA20oLl3MYBMGK1wD246IdgmdoJm+vTefb9T4NKLHr0N/1AidHG3y/Eb3Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8857

On Fri, Aug 08, 2025 at 06:39:03PM -0400, Frank Li wrote:
> Totally rewrite CSI part driver compared to V1.

Laurent Pinchart:

	Not sure if you have chance to look this patches, which is big
changeset.

	Please check first 3 patches firstly, which help reduce many
hardcode in current code base.

	media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
	media: v4l2-common: Add helper function media_bus_fmt_to_csi2_bpp()
	media: v4l2-common: Add helper function media_bus_fmt_to_csi2_dt()

	The other patchset https://lore.kernel.org/imx/20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com/T/#t
depend on this first 3 patches.

Frank
>
> This only includes CSI related patches.
>
> DTS part: see https://lore.kernel.org/imx/20250701-95_cam-v1-6-c5172bab387b@nxp.com/
> PHY part: see https://lore.kernel.org/imx/20250701-95_cam-v1-4-c5172bab387b@nxp.com/
> AP1302 part: see https://lore.kernel.org/imx/20250701-95_cam-v1-7-c5172bab387b@nxp.com/
> 	upstream: https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.com/
>
> First 3 patches add some common helper function to simple code and remove
> duplicated code in difference CSI2 drivers.
>
> Clean up stage imx6 old version csi2 driver, and prepare create common
> dw csi2 library for difference IP version.
>
> Move stage driver under driver/media/synosis.
>
> Create simple platform driver for common dw csi2 use case.
>
> TODO:
> 	1. create bus, to probe phy driver under "test_if" interface for
> specific phys under CSI2.
> 	2. support to combine phy, (which connect to both dw CSI and DSI's
> test_if). Need use DSI's test_if to config combo phy to switch to RX mode.
> and also need config RX part's phy register by use CSI's testif.
> 	3. move other vendor's csi driver to use this common DWC CSI
> library.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - totally rewrite, see above section
> - Link to v1: https://lore.kernel.org/r/20250701-95_cam-v1-0-c5172bab387b@nxp.com
>
> ---
> Eugen Hristev (1):
>       dt-bindings: media: add DW MIPI CSI-2 Host support
>
> Frank Li (31):
>       media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
>       media: v4l2-common: Add helper function media_bus_fmt_to_csi2_bpp()
>       media: v4l2-common: Add helper function media_bus_fmt_to_csi2_dt()
>       media: staging: media: imx6-mipi-csi2: replace space with tab for alignment
>       media: staging: media: imx6-mipi-csi2: use devm_add_action_or_reset() to simplify code
>       media: staging: media: imx6-mipi-csi2: use devm_clk_bulk_get_all() to fetch clocks
>       media: staging: media: imx6-mipi-csi2: use devm_mutex_init() to simplify code
>       media: staging: media: imx6-mipi-csi2: use guard() to simplify code
>       media: staging: media: imx6-mipi-csi2: use register structure to match hardware
>       media: staging: media: imx6-mipi-csi2: use devm_platform_ioremap_resource() simplify code
>       media: staging: media: imx6-mipi-csi2: move probe part to imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: move sd imx6's specific initialization into imx6-sci2.c
>       media: staging: media: imx6-mipi-csi2: move csi2ipu_gasket_init() to imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: move number pad macro define into imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: move dphy init part to imx6-csi2.c
>       media: staging: media: imx6-mipi-csi2: use runtime_pm frame to control clks
>       media: synopsys: move imx6-mipi-csi2.c to synopsys/mipi-csi2.c
>       media: synopsys: csi2: Remove deprecated s_stream and use v4l2_subdev_pad_ops
>       media: synopsys: csi2: Add phy interface support
>       media: synopsys: csi2: Add basic v150* version register
>       media: synopsys: csi2: Add irq support to record error count
>       media: synopsys: csi2: Handle alignment requirement for width
>       media: synopsys: csi2: Add register prefix to register field definitions
>       media: synopsys: csi2: Add need_dphy_reset in config
>       media: synopsys: csi2: Add default simple dw_csi2_subdev_init_state
>       media: synopsys: csi2: Add v150 lane stop state register bit define
>       media: synopsys: csi2: use standard v4l2_subdev_get_fmt() function
>       media: synopsys: csi2: Add customize get_frame_desc() callback
>       media: synopsys: csi2: Add Image Pixel Interface (IPI) support for v150
>       media: synopsys: csi2: Remove source pad connected check at dw_csi2_enable_streams()
>       media: synopsys: csi2: Add simple synopsys platform driver
>
>  .../bindings/media/snps,dw-mipi-csi2-v150.yaml     |  158 +++
>  MAINTAINERS                                        |    1 +
>  drivers/media/platform/synopsys/Kconfig            |   20 +
>  drivers/media/platform/synopsys/Makefile           |    3 +
>  drivers/media/platform/synopsys/mipi-csi2-simple.c |   75 ++
>  drivers/media/platform/synopsys/mipi-csi2.c        | 1258 ++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c              |  220 ++++
>  drivers/staging/media/imx/Kconfig                  |    1 +
>  drivers/staging/media/imx/Makefile                 |    2 +-
>  drivers/staging/media/imx/imx6-csi2.c              |  181 +++
>  drivers/staging/media/imx/imx6-mipi-csi2.c         |  846 -------------
>  include/media/dw-mipi-csi2.h                       |  120 ++
>  include/media/mipi-csi2.h                          |    5 +
>  include/media/v4l2-common.h                        |   30 +
>  14 files changed, 2073 insertions(+), 847 deletions(-)
> ---
> base-commit: 33652d58b64e92d2598205fd992989bd93cd61f4
> change-id: 20250606-95_cam-b74c094ad1fb
>
> Best regards,
> --
> Frank Li <Frank.Li@nxp.com>
>

