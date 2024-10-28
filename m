Return-Path: <linux-media+bounces-20375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3309B2307
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 03:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F775281185
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 02:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF36C188A08;
	Mon, 28 Oct 2024 02:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QcvB2oGp"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375A118C037;
	Mon, 28 Oct 2024 02:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730083201; cv=fail; b=sZEO/+IXtfNHcVwciP5/lDr1KBbycirzzEdsizmp/AudleB+RpTqbZQxnG7GrKl/TMU3zXotHmWzVKFR/4D8/yx4PUZpVfDObFrHHH6i0Y76lKtT7Q354DU9L6IzRkON5SthppniGzciqwM1fJlL/G1kEViw8TWqFTeS3U8phNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730083201; c=relaxed/simple;
	bh=3vApvOC7nmJ6il9tIdr6YRlc02f3NhM8PsqcFY4TWDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nhIBahmEr+ArzwkmBNNQy7ByzGOKKD5fNfJ8nHAh4W8MhBdbbN3WnGWoaIBtnqq1pFdlENK1fUahNx2iK20dsg6iWXFTbfEtEa5Lvpkv0wv7xMGg5aZ85eWcT6xNs5C+7JqExknzgThI/Lk/rX/a8qqRGHi2HwwpsIyRJbc5JnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QcvB2oGp; arc=fail smtp.client-ip=40.107.20.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWfeb0zs1if/PLZGuzNrq28eWJxyigbRfwcroGMfTAdGftb09ZKSr8x19GvI5kiCYsCF4Vh6gxzXTUIkP9dz+hSfYxeoBB6iRhhhrk0k5RGS6Lsw4JnuyBNt1eVw+PthRMlZkQ5p8+By9DV0xaAFOGFTWMC603xKTK+brpYJOMN9g+ZCqvnElYnwHxeZGszVfZPnISUyPoXct4viXU01+amQQgU50qFjmDuzyITzUdVsoLjZ8b/U39wIQMUdOC7r8tvDJxQ0lXlW1Dz65+OGkS5k3K/5NciNCNLOmlTadlOiCFJj9Gic8P8HTFO5pVRlL5Uc1gnEiY3jpnuUgW+ipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1aNMzvR63wk0dR/tTYseaG3xtqK1iO/pUpQ/LdzJFE=;
 b=TzxOSDVMD/4qVA2m17yuYiGgWLgKoPIYHeNWoOLNUsbEIa531qTzRRiK1pwnFAVSh8z3WGnzx+id3HKIzi2/Iu96RPtItviVxO96WTrRELh9u5lNeyP4Brr/H7mD26IrGzyIrTNGFSJzFCB3nX/BtM0YoeobGxY5gfdR0vsQ8WrQtu9o0A84/KyJVAxYDRhMLv8km++H5DPn6aaRqardYSmO+KqtxCTfdpmuhynu9HJfZQ6Mwa/ci/5828xqQu1P/bv/POTgy2sjrg/ZjYJ6qOM+oEdf4Q+/ZBaRCtxuOW7foh+EWVDgVOtdDz1JXPbupuN/LhcxEJp+pmdjkCMNvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1aNMzvR63wk0dR/tTYseaG3xtqK1iO/pUpQ/LdzJFE=;
 b=QcvB2oGpXOkkSGq6PfuFRBIEqW9cL5zIzlGzXYJDmUlP8MGSbJEPIjipF6c70Jcqt3roWpnLPnf8VGCs4VOcdCKQa83OhtdGzP5Mx//ynIrJ70NJupVqOJ+DT8dG2V2nrTyPe1gnFL80WGAlwLQdwpb1sSdVV6DbMcEzDoEGxTUW+GtugBWyQgnl7ZJvWzq5v2XB5mEKyFM6mmKrjmOBHZJvGIez6v94bOsBK0BAWReYNsgiToeO4akd2oZM7IflN+lw3ktkaA9lTQZ5THpt8fqLCGxVJMmIY3PhlQskkxhdtfmIo4L+tI2cG6lOda25CjlNcHsZAaZjnhYcAIJURw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 02:39:56 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:39:56 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_jesszhan@quicinc.com,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com,
	quic_bjorande@quicinc.com,
	geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org,
	arnd@arndb.de,
	nfraprado@collabora.com,
	thierry.reding@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	sam@ravnborg.org,
	marex@denx.de,
	biju.das.jz@bp.renesas.com
Subject: [PATCH v4 12/13] arm64: defconfig: Enable ITE IT6263 driver
Date: Mon, 28 Oct 2024 10:37:39 +0800
Message-Id: <20241028023740.19732-13-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d48386-26b3-433f-d243-08dcf6f9cf3a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?SAAWYHheIdaUAAC3icpF21het74HuykPG2zvHv5A/HhhdsliHIzpAz5ojXuF?=
 =?us-ascii?Q?cuuqfCjycTGqEwkASwRZYhYGzwVF+2GpRrRY/W8TWk8Zn1go7k1AMegNOz1S?=
 =?us-ascii?Q?GDcRJGl0SfZX3/1j8sMHvPPSXdDNUkRXcS2XBjGqea8IG+Y/+GPSzBXMoNKx?=
 =?us-ascii?Q?ddqChJyVtRtsV6SjqBcaTNJltoc0E9S1TMrwkRwqTZ2qq6Yme/N+Z+yBqBKK?=
 =?us-ascii?Q?I+zKKM3ep3XK91VveUFUXn4oOWDDjzzuDgSERCwBotfISit3xszXNs5ksdK/?=
 =?us-ascii?Q?lFl0wMK/QZX1qTUrrUmAr8sx20/gabzg/V9k4CmJVQBqTc+erBgZwaLLY1rM?=
 =?us-ascii?Q?ldZZpzC3nLA1o41fVAqFPDvFCEf3v0d7TXmzFg3oeKVW4o5jXyqBWGptP4kz?=
 =?us-ascii?Q?HaCdkzCrW69SYFeoM6Cfr2OlJ9jTSFW1QDWBESaf8I2qEhYaVqWJel5ZZITY?=
 =?us-ascii?Q?uBC765mFSzDsVSo7I8l7w1ncH8kqvNQquV/mzqTUPF2zglD6L11lhsysIus7?=
 =?us-ascii?Q?tz/eYevoxlRe8N9XMlc7zYl6fQHeYYHkvxTpv6qYbvkRkOE2U2zxju28QiQe?=
 =?us-ascii?Q?DCUcDdwNIv989XurQEWHc/48tVJFHZIxa8PxdUeRpMB6tZRHnVs8H5y/CpuW?=
 =?us-ascii?Q?LlYCPfpejEYKqR6z51A9jF1DibNt8ux/xfjjVSxdZ9OBDHZCTqPzsH/jlt0i?=
 =?us-ascii?Q?G0tQGIbg3OINRvr/jp9rNMTjJz0QvfNRqWnkRE8lB+PR+jXM5a6YxLQZrKMa?=
 =?us-ascii?Q?vNiyrEefJVln/rvxcRtq8VZZEUT4pxbAwNvYkXJI8SLfH2q9238QrRbDwy7l?=
 =?us-ascii?Q?Pz+FpYKjc0JZxsPsn8+ZwbtmfST2pAhJpg7z8aG+1Jmjljyi+VMeGcqjFxS+?=
 =?us-ascii?Q?oQZCE4CE00E+tChBFqprCuW2FP66SZ+X3Wktu33FYPUV3ArFSLgOnU8M9dSq?=
 =?us-ascii?Q?KXLgmxbFF7mOqci+Y/m1x4QBwKGrMA0+yZVC3SojH+zFObld82rI+ZAywhF0?=
 =?us-ascii?Q?Vsy/ofohbp4WCgzqwAyfu0meuha5NCb821Xw34H+yjobNUvFdtRYGJNAI/IM?=
 =?us-ascii?Q?vrAo2YCryt78TOebxrilfqolAcgLiis2kb3odtJeIs8F5DVDO+3kfCEtC0WQ?=
 =?us-ascii?Q?NW8oHy28eKZccDi3TyI7jP8X7qxjC0oRSo8+4YM7KAzRMpaE1VDe4mqCD0ar?=
 =?us-ascii?Q?2ba988ExFYc3V8KW2XNUdD97EdEUCmvhsKxkqfxAHVVIvZLbK1snbLIpRJom?=
 =?us-ascii?Q?8VDC7r2nTJ6iJTwSyZDf+TyTdeiFyxGdQFXvQoSWusul91m4z3ZP1ywpkrYC?=
 =?us-ascii?Q?BIVBe22p1eF+eQEz46A3UIBiEFwJCpRgHYDt7ogbUmm0i9lTX8nhOY0g1eeT?=
 =?us-ascii?Q?ngQ4fwg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?+wMM5FpIIaqze4VzlA5aKMKQbhS8NuK3hdGW4UDlD4Hf/Y76xzry6t1t0Idb?=
 =?us-ascii?Q?5jU+kf82CRJ+llQYszRj/dX6KuJX5eOjWwDpEFE4ffIs0vTQ8hdTt1Ok56tg?=
 =?us-ascii?Q?V73pjh0hGRj7xZXNVTF8DjXfHsZrTHPL1v9P5w9r8hRs1kZHrEwOIDMl75LZ?=
 =?us-ascii?Q?nuDALgES5QEXXsSH2OZ+IvcFOqLOFnHKXTh2yHsvAaxYhln2GaVKjnvaYA2G?=
 =?us-ascii?Q?uyGRXh7m7Bkh5sb9D/jAGPAmEt03kEuhNiBYLQ90kjNoBCWGWtjvMlCdQtCG?=
 =?us-ascii?Q?4Xp+Pl/7mS8AtMkNIx4HeLcpGNDW2/IIuXWDWQk8iFeJO5V533ixPYJXzLl/?=
 =?us-ascii?Q?+SK1vcnc6e0GNR0j2jaBV4G3QHlxni+vCRxcEYUqvaPVNv32txV4CZ5InEEo?=
 =?us-ascii?Q?iKVqolao4DUlyGqvmAwskzCCyDV1vSikJ9Hyb1Rr590rsjt5HF70Sm+NI4Et?=
 =?us-ascii?Q?Ob8AVxo219tAs+Nv6l21qNvmJW4MiOQZu6ipU3W5vTYxfnrdQkpLaaX2p+QL?=
 =?us-ascii?Q?r5wxO6IDVfoAa5jcjTaIehnhbQyVOqZ3DJpmY0EWXIJ2J/9xttp2dhyNN1Aj?=
 =?us-ascii?Q?f+WbVBCF1fQx7RNgZME1vo25yk0k80zewrgqoLSd6PrsMxPsXX1pwYNFynYK?=
 =?us-ascii?Q?uBbrpeSnUCw4ZbDTMV5+2XJ43VqSp5QWuYNtKyFgR8DvTUVAHYJLkA7tG3ZD?=
 =?us-ascii?Q?1NnnXkVSknSVpnGIcw3MLq4pG+M/IeCG2uAvmP7/hV4bG+R0COo2Ud97/+NO?=
 =?us-ascii?Q?GOyLjlRFTjxSHD/QTDNCa39eD/H4MSTHKTEBDi1HZytesnhrPfShG4W/kW/o?=
 =?us-ascii?Q?Vw7iPhsICe2iWxr8Ai1j+zD3yiby06IkaMCZXsMrV0T+UKhoj4mq+u052Fir?=
 =?us-ascii?Q?w3ocz6cO5uq132OUOOeoqUP48YJE/dfYxpt4G2rqJReZ33efDhSL6cuqnZo0?=
 =?us-ascii?Q?hdYCWvyvy5PbYhr06rKpx5aK7SYT/Odbop3irpvSiL1EmdlJUsnIdmipXCzB?=
 =?us-ascii?Q?I2EvS09IEV70OxLb0WPpOS1pwThUKg9ABul1vBZ/4F9j9PX8Fifvb2o0n0Zg?=
 =?us-ascii?Q?CbVnUgraI3atRRk67U/WM2f9/iNkBM4Jv5noACyV3pFalcGMyP5doLNzeEUm?=
 =?us-ascii?Q?OSmQbtklsZ85DEbwjQIT+kN5iWKLzFd0znJ7eJJ3ips8o9n/sDErikic86nV?=
 =?us-ascii?Q?TbZRnOzXSLMdMGuM326co+sZB2UgWJcDxFWUrToIFfmObMwVmmfXsVp760nb?=
 =?us-ascii?Q?xd2KGd9DCmsVD5a1eoelQ/oF6LqX+Uq6UPd39tshxR1a81YEZDmTF2LUzCSO?=
 =?us-ascii?Q?1GxJloEni5vGRQbzoinuQkQbiCFcylvu2uK47ujaLPg/7UT+n0VMqh0pXHBt?=
 =?us-ascii?Q?zhj0N3SF6sFSEXNQWswdHvlXmbOTEAoflxzF2+8/779JSFW27qYMbeTuN01A?=
 =?us-ascii?Q?xS+o2X+sCDVoeh8ehgzYlvdZefSf0rc5PkzrDvGliCncEiChG7tr90acCnQE?=
 =?us-ascii?Q?P+d6KhotfVZPLyXk6Yw7yzh/2uhGPM4e/+5/Rg5kK7KYC9jYiQi1L+Ltg6z4?=
 =?us-ascii?Q?dn1ycIPyf4R4Gkqox33602dHu7GvRsCLVk7Y3x1b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d48386-26b3-433f-d243-08dcf6f9cf3a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:39:56.6281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDxRjUEuPZpnVyra9gVxnoRCPgR3qSnAUPxmlUs9gs0uTLtQ4WCdJh0ZR6VmMRZGCXJ8UI9k7UwcC+LMQE7WLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902

ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
and IMX-DLVDS-HDMI adapter cards.  The adapter cards can connect to
i.MX8MP EVK base board to support video output through HDMI connectors.
Build the ITE IT6263 driver as a module.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
* No change.

v3:
* No change.

v2:
* No change.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 36b33b9f1704..d249df72e2bd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -899,6 +899,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
-- 
2.34.1


