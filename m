Return-Path: <linux-media+bounces-38825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AB5B19F38
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 12:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B29677AD061
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 10:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB54246BCF;
	Mon,  4 Aug 2025 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KVe4Ltf6"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2FD1F4617;
	Mon,  4 Aug 2025 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754301763; cv=fail; b=SN//PIGvRui28esBLPjmGzLdQJMKCg+4NQmEezb6D//9WQb1IBYyFBk5TGILrdgUWSFPETPBgjOjz/SR7goXILfWUdnpBpl5uW8B5VtkUbKGP+wcBZXfmujWWHBwrm9o6uHmUUGqcRQhicX47iwTAn6RrOJ1cNI8lq4kCna4mUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754301763; c=relaxed/simple;
	bh=9XKGpgBmERDlkL9z2XZ1h2iCr/LllBgDFS9GFiymk0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F//6DLkoGfv3JGnZWZFaFcnIzk/ik0SKXfCUDh6K+3zqPoFrJkQxY+yjRVZ1vZ4bVlj7UQO/CUwPm6xWO4q4bwi67Xfjv98zCGDYLyuQ3tdu92iKDYkyhI/lVagV1JcKtUwfwg1LU189GJA7Z29x5bECEV/pOltGRTy7GhuSpAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KVe4Ltf6; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pv3vIsGWq8Cds6UA9NxxrO2u4MS5eneXoYWQ7mpHKC599ToKQI6mMAwLWKx1WNRSqHviLN3BUwt4UcILkIrBvsKpOnma/VbFYTQG0vHw7IY7NHvThMKPk3gw6aK3XErSabs+x2ZzvSm18dNvGnQyCkGefWGSyEBmk9dM0dyoWkDJgIy1+BDIKsG/5oWk3h6ErD7RWHQiCmNUn2fXNevRO98O4b5u8bxx2aqRcl9VcRRGT3dQCLfra5XepLrSJ2N5i8p6ixaVcUwo4R0XmwbZoqw9tsO09L4ReiqB2bYT6b9fYcSbuKAygyNno0jNPUN3+D+BHzTQBPe5GIU8BlshRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LahB2slSphuLvkWzngb3sjn8vTJACjVcm2Z5KzBk35w=;
 b=WqSzWt4PB1Z1c8EuXxg/+7QM9s+LdptSVdP87mLLzeeRQpFPmyYoeGKKnhGXYzSeTRdchNwhq77NT6PNEMIasyKAHcDJCWsLG5hsiVfSg2XO7F9+/uYqA6UfOcs76C4Mrt7b3UIUoN16d55QGVB20T5roajlVYRbXkC25yyDqoKhP9GvBRSR3j1Ryv6nqfsctjudzDFGe9ORlifZHOrXBqwnLlHXl8/JxNnjiskOVaF5UFfwpsbGwIpH8twmdIzx1UMUjBeYV7IB+mB9ztGpgUuGAOyf8uu7yjYt8onvxYO1B+wbDyJFzm41wHNdB6/gm8h/HTxem0Q/Uwiht3RU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LahB2slSphuLvkWzngb3sjn8vTJACjVcm2Z5KzBk35w=;
 b=KVe4Ltf6kbSs60KbSfjSMnIXdw43+XNmTn+FOJA0CPtplOB60KtvthdJWCBVoxsieGxxDDM+n+urJ4yrjwty93+I15SF64TM8vaCd+6/P/LIDFzEdi+lRHDtyjfBilExY71QNS+M1qA7bbANF8geTwoD4Jb/4D7OLe9pjh0Z77o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com (2603:1096:604:10b::10)
 by TYYPR01MB10592.jpnprd01.prod.outlook.com (2603:1096:400:30e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 10:02:35 +0000
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0]) by OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0%5]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 10:02:30 +0000
Date: Mon, 4 Aug 2025 12:01:47 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
	Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	=?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 18/65] media: rzg2l-cru: Do not set file->private_data
Message-ID: <aJCFC-_F6l7Z40A2@tom-desktop>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-18-eb140ddd6a9d@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250802-media-private-data-v1-18-eb140ddd6a9d@ideasonboard.com>
X-ClientProxiedBy: FR0P281CA0211.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::6) To OS3PR01MB6657.jpnprd01.prod.outlook.com
 (2603:1096:604:10b::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB6657:EE_|TYYPR01MB10592:EE_
X-MS-Office365-Filtering-Correlation-Id: 307728cb-3ea2-46b9-e7e6-08ddd33e058c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?4Dx7cqXSiPRwV//Bkm4NvhTALZy+WVjuKm+Pm8V7LAVPPNryn2VtFRizi56C?=
 =?us-ascii?Q?fKUDZnARKg8UBkemz+AzfGjyRf0HYRsL6iepBv++wz6d7eMLQU3k/3JAwLOO?=
 =?us-ascii?Q?7NE8W8iiwLXczmM8yTkuIoVtBLAULOvsnT6CNNKlsr8f0+L4JH+gwJSSubrT?=
 =?us-ascii?Q?tVj4KkD4ZXbMDHhTgwoI44yxWcAg1FxscqBsNs7Rr7yvkv6/OM0xluPkzwNU?=
 =?us-ascii?Q?zF4zF9Je2MEJgI8susgGqa31ugP8cKseg8Uy1bnj3ILqww6frv423Gb3ldKK?=
 =?us-ascii?Q?0tWV/5/8qzD6sbfo+P7pGf+Rer0n/Aeva+Nl93YorqpKlS+nToE2o64l6qnF?=
 =?us-ascii?Q?2Rp8bYlMwrNIQA1J02PjBW/9OkmaiOCtJeTt4q7oH4D4bJcTyfWAEjjLzLX3?=
 =?us-ascii?Q?BLL5U4zwC3iTwFz8yWb3DUcpOp7RbGIw8HFFzcw1BGxRhXQat/SUJb/+oNKt?=
 =?us-ascii?Q?tCvo5dqg9u4UorRuOHBGnvBfIp0kyRYgXKq7Try8WxuY9mJCDlzxb745acVk?=
 =?us-ascii?Q?i1zLkeGlfhU5wtbmRFqMTH08ZIh7fEdZrqe6rfgDkByx4I79dKslqrQN1iNV?=
 =?us-ascii?Q?3FPDwuPvrDOF/H0xIyhw9h7OfAAMZPtRm4dALm2lY9hBr98Rkymm+Sj+Dw2V?=
 =?us-ascii?Q?51WjlXslO8eLzcQNECkY3gLTFpzlYQjIgBRvzwWqqdmkdp24xPz2O4USAOSU?=
 =?us-ascii?Q?fDN0YYnrn6Jc9DsPl4qeHKTJrHSuYruGIrfhf0LmDtuPQaXrUrPpejPhwTyv?=
 =?us-ascii?Q?atahvHYztWdBQ/beoPI1aeM6NcyGgI/JpH5gCGnUDQlmIYLTeGinDzJRAAVH?=
 =?us-ascii?Q?6aObM2X+BKkUwPXj99/QjSjF2K3+MDQbJsfgYdXnuwfzP7YwOgmYrWyqT+44?=
 =?us-ascii?Q?of2faiJcqTNOELt8uvLg80btrnavoCKYDyIevSKL3/jkcuY0sbTFdAP4CEAl?=
 =?us-ascii?Q?QZKJ6K7+h620ssWcY1b56p8tLdDGyGp49J4vQspTJRIpN/zNLLV6vUhVBmaT?=
 =?us-ascii?Q?emOqL1qaXQ0jcxEC4xNAcBcZZTPoEQni/Q05JyUjgKaXIZ04AZ/4OUU7Pl92?=
 =?us-ascii?Q?yRLA9DwSZ+Ng2/LpkSV0PtBKkS6PmUFHUldGxafBdlcOL5yZoD/Z49UyGcxX?=
 =?us-ascii?Q?A1K+nXOrFPLu1eqpKqfictpv1224UtnBUC0O7bgGJZPhy2ekVoqtNrhSFmTY?=
 =?us-ascii?Q?DTCaYb+PTyEZ22v3/xVXX3JhXSpuaeyOBx59lnq56dK8Y3pFfw7owUxsEq+m?=
 =?us-ascii?Q?BkBYoWgKFVbtc60gb1BLei5M15tPo6ZdmQSzVxclUYOjoT1jRXygviniyhSV?=
 =?us-ascii?Q?8JiEOwrO0lmotPtseztgHCY1ZseTzzrcMn156rjcZf1AEnm5ofQ0apOd2Q2o?=
 =?us-ascii?Q?ToXhaf2x4zEpS5SrUte34nGFrw1aW7mDc7bosO5H4cxzSiggyYUTu3HyiLyA?=
 =?us-ascii?Q?+6QuLX8j5bjvl434bzJnhSpRgrLYVMSu9IC+cUGOo8rzUcFag6fzfA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6657.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?zA8P+PgdMNbUjR1PxzpoQ6auR+oZd8Bjlg1yrwVN/IVj4Jgl15N46MS2iwXr?=
 =?us-ascii?Q?TqzH+FZHcmwmkiVLhQC4xdhwbw/Unlj7A+A7PcUT2t/EmVkFRJjyy0//GpvZ?=
 =?us-ascii?Q?koY/WyvT189BXwRp5pik/o1kGJPxboL2FkQHCYTZeJWTqYLBfAkZ+RFQWhCu?=
 =?us-ascii?Q?SsyYD5ilxkGVX4Vej4P4P+TbEJ2Zlb5EraO1ErtDqtBCjR/al3X1AgPV3mSk?=
 =?us-ascii?Q?OVnwRuDsamRr4o++x3s57Aglky7L5xAmp3Vu305Q7y52i1NlWL7L5Jm/w1Rs?=
 =?us-ascii?Q?qdmGju62JPqo4mgMPN2vNdF9jaqt+PUlcJD0X6i/kpP/BDxbBMSJJY3AEwba?=
 =?us-ascii?Q?vXYxy+4OtvokyPKJtFZ3gnQTP1b67ghjwAYMNzyGl4DeeFnhLgnJlq2yQRnO?=
 =?us-ascii?Q?nFYx7SplQe6lIWOWsNYB/TUKF/A37I8bkN2dorEH6xv1gpFKyyhlepz+c0/J?=
 =?us-ascii?Q?dfYTPoOeXXrtPSM2GcNO4Av7HizTSUCsC4Sft09JvoiL8/A4+tKy33lcouii?=
 =?us-ascii?Q?fOjIelK5W4UgMb4mnblR/5pYIhq/ePgiitPPF1USCA0BqayW5PUCngBxAH1U?=
 =?us-ascii?Q?/LMIjZaTnUsBuv1edppIirCxayLjXFCyUDlfM3KRjJUVKLo8hNsCY0nSjgQ9?=
 =?us-ascii?Q?DpNEyJlpVf+YBYKLcpekWZOS19QjnAuiV6BlLxAtJhy/OYk6t5vvYUlYnHTg?=
 =?us-ascii?Q?cyAN3K0tdgf+cPuYzBDSoq8GpiiSlUgDnyAc1e5v0sEAVkDFUdQ4vWIpV1j/?=
 =?us-ascii?Q?Xw1k/52fbEDMAY8gIjds7wwNf7pRfsuJiPDdj4mBBETeXLNfPIoxFDo0x8wO?=
 =?us-ascii?Q?r+1HNpno/4BwAYqfxTcfmVHc3Br5VDHjRDj6LQdVbV2lI5O9qukNxiwdEgnF?=
 =?us-ascii?Q?gl6a3CZtXF3JdXIRGBkVlDCciLEqj836AtVwRtl6UVB9vL8436rvoLDXW7yF?=
 =?us-ascii?Q?c5Cq+pfQWJ5QxAgPSi4SPkIUOlYwynNyuMKfs6ItsxpllHKcxzAxbxw0Ki5m?=
 =?us-ascii?Q?6wiN7YNEpP3KXl+A1alepUJbevqozjVB9jikPeX808l4ENPEBi9tsd3RlyU9?=
 =?us-ascii?Q?ADBNqeQVPV4vEPxOKze2FiNErpvaE6kJtmh4ixBZCvcl9XuX7Utear62Z5dC?=
 =?us-ascii?Q?fXEQFGlc3o4beZBJVfSMtcUCXGK5Wgrcl6REC6SUIjnQCo8c/wZgymbwoQ4W?=
 =?us-ascii?Q?FD8I0LOXj+gFMr4ss2acB+4NNNYGiClSGuF4OimWVTfzddqpyeIeypIy/Ic1?=
 =?us-ascii?Q?Lx3uT2Z6u3wKAIdfCH7LiHDT/pIz+Ltc7o2RYohvWRPaedKd//A5j/pOOHpN?=
 =?us-ascii?Q?trhJq7E0CMFa9iGU/FUDzx1Vci59XRb5RqwZGrQlSE0D+0I7SU/korkAl2UJ?=
 =?us-ascii?Q?hn2WTjXjNQaciOx/BsiWJADeZ31++Mf+dWAlMrOj7dohoX+BkYiMTRWprbcV?=
 =?us-ascii?Q?weXYJCbPT+Rv7WxeihliK9/XdnlPl2UmyyUAFIaWF9l7L18wpOgDRrO3tMfb?=
 =?us-ascii?Q?IF+jTYK+Lf28lh2bzl4KIn1XiCBkbhlx7ZW5EN+9JbQWj6JKywYQ1+tnG2wh?=
 =?us-ascii?Q?pfxb/vgcGxb/3KLaoRfqL9MgL2CW+QdevK6uIBg1zxISthw2T2VKwrSTxkLs?=
 =?us-ascii?Q?iAH/rgv0Xv4LSd0MslrrAX4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307728cb-3ea2-46b9-e7e6-08ddd33e058c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6657.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 10:02:29.8933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pSRknQ0n8XPfQ4gqt0vPrscjvGNKuxE8mB/ymud16XA4kfBKrXtSpN/6U6jIYPOL8jwNWXGziPjIOtPI9pbTzbOE9KPk3W/a6rHqSTf2Q/NavODphSN7cpOtpdJelvW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10592

Hi Jacopo,
Thank you for the patch!

On Sat, Aug 02, 2025 at 11:22:40AM +0200, Jacopo Mondi wrote:
> The RZ G2/L CRU driver sets file->private_data to the driver-specific

The RZ/G2L

> structure, but the following call to v4l2_fh_open() overwrites it
> with a pointer to the just allocated v4l2_fh.
> 
> Remove the mis-leading assignment in the driver.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Apart from that:

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index a8817a7066b22f8a8dd1fdab50efabc486e4dfdb..941badc90ff55c5225644f88de1d70239eb3a247 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -1078,7 +1078,6 @@ static int rzg2l_cru_open(struct file *file)
>  	if (ret)
>  		return ret;
>  
> -	file->private_data = cru;
>  	ret = v4l2_fh_open(file);
>  	if (ret)
>  		goto err_unlock;
> 
> -- 
> 2.49.0
> 

Thanks & Regards,
Tommaso


