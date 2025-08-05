Return-Path: <linux-media+bounces-38882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E17B0B1AC4D
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 03:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6089D1893227
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 01:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A631C8603;
	Tue,  5 Aug 2025 01:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="je1ub/SC"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A283FE7;
	Tue,  5 Aug 2025 01:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754359088; cv=fail; b=bHW+29V14giv2rmKGAgS8GZyy5TTG2C0GMC/MqXrYnA6+8Mo0JNWKIM1wcyYAc/DlFBcp641jGpPqqQlmsBv8HfsqWhlD9AILBjPR9+/O9kiX98ZYUn9ab7i8+yvYTuZjGvEeAPVvJCCn7IshgGtgnkk+7Mjng1151XexpcsO0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754359088; c=relaxed/simple;
	bh=EvpGjX1fpPTzbQT5E8vNLYV7Scd8UKPxz9wHvhOb0Q8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=trAkT/9Ld5gTHw7DFyr9/dX8IDvhSZLet+C/mNdp9XIvil3IOah1qmNC6ccZGcjiqkoIAdWK33CKJaZfJfK1a16wLni/4boi2rY4y9owmI/oxx0sa0ArprSsU7Dfmtt2q5KCrfLpzzM8P9kBqRUE81xnpPgjnlq1Xpn8Tqysoz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=je1ub/SC; arc=fail smtp.client-ip=40.107.162.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYOQ8BsZnd1xpkaY2uJ94nFURlBlKMzLg+stifqMKjL/VJNRQ1C/WP54oXteRw9p55zi5+vD1WZoDMrlHY+y6vmTmFgMW68c1OGcSId9h+zPsXyJs3NigQfdmdZG7tvr0PPuESVmk3M3Y3lytPZndOYXdDOaZJ/jwn/NkIboh+nsN5ZZm9+Ds1qEkdLMLDuc2wjozXa588NQCvM3y00McQXlC2/iDXBjwKlbO05LTpBAqdLg7JL1cifkmFYrXzKGJd4Zo+/qbWrwwOv4aTWHkNG6ohzTPdZOMPP7tl4kLPFNq+Z0fNTQOYUPABBir3uZwJnOGQ7aqr0elhDyhnfboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvpGjX1fpPTzbQT5E8vNLYV7Scd8UKPxz9wHvhOb0Q8=;
 b=VFbRyP9qJAaJ6WjCwTZJrtZV6CmdplWZmWJuGhl/y6AP+sdxFP4+x/Kc/xYD7vQgNQuKyKTTeAPcZ8S/T8+agq/ZwpiTy50JOuKgHGmQYS4Cd2HW1/XPBBpsIeolGw2oBsH6K5qOyIMLERT9B3OMpayPsaJdrHOuW5euTuZ9NXMXgbvGUJR22tS2HpRRYd+kNGR0JjDRTu9PsGfBr9PSQgtBVpci8ppkBD0yC38SB4V1e5/05Kc0mVkJwmx6t/g/kN0EYc5QzzW4FYsy4rsZaH+zAhLYzGA6dF4ONdHwX5JPu2EHP+eElCA3GhA2AToR1Y0fulSuuIeVLDh8eHdz2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvpGjX1fpPTzbQT5E8vNLYV7Scd8UKPxz9wHvhOb0Q8=;
 b=je1ub/SCi0K71Z+0pb5HqLquYgpbpX3N8FsLz2n2XZRB3DghjmFvKuWe0aQ75lU6TadZSZiE/Cmc68ZxUB3QITgN0d5RqAYJ/wFWUCbJ3ICJRq+lGTq4j5iVcjBkl1+ajzG/yyDAaAaddy+vtGo47l3XrZAqcgsvVUJCFLNzcfaNMmaxqs+OHwq0pcxsiDhvlkjVmUDNoYIqZaLrxhQLoWIGq7UfYaUswJUP3eMFwgx4TLG4M50Wxds9Dajv0WNWL+nVT+nSR916hsTX5WzkuQ7tgp4Z/fSJCMEB/CDdRabHqQ/jaeV9d+PeBvrknS7TR7nfg63LWv/oWN3WB4tMjg==
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB9110.eurprd04.prod.outlook.com (2603:10a6:20b:449::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 01:58:01 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 01:58:01 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot
	<bparrot@ti.com>, Hans Verkuil <hverkuil@kernel.org>, Mike Isely
	<isely@pobox.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans
 de Goede <hansg@kernel.org>, Parthiban Veerasooran
	<parthiban.veerasooran@microchip.com>, Christian Gromm
	<christian.gromm@microchip.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, Yanteng Si
	<si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet
	<corbet@lwn.net>, Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Andy Walls <awalls@md.metrocast.net>, Michael
 Tretter <m.tretter@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Bin Liu <bin.liu@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Dmitry Osipenko
	<digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio
 Estevam <festevam@gmail.com>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Michal Simek
	<michal.simek@amd.com>, Eagle Zhou <eagle.zhou@nxp.com>, "Xavier Roumegue
 (OSS)" <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal
	<quic_dikshita@quicinc.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Sylwester Nawrocki
	<sylvester.nawrocki@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>, Minghsiu Tsai
	<minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Jacob Chen
	<jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova
	<detlev.casanova@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, =?utf-8?B?xYF1a2FzeiBTdGVsbWFjaA==?=
	<l.stelmach@samsung.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Jean-Christophe Trotin
	<jean-christophe.trotin@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Steve Longerbeam <slongerbeam@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, Robert
 Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Vladimir
 Zapolskiy <vladimir.zapolskiy@linaro.org>, Corentin Labbe
	<clabbe@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu
 Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw
 Gruszka <stanislaw.gruszka@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"mjpeg-users@lists.sourceforge.net" <mjpeg-users@lists.sourceforge.net>
Subject: RE: [EXT] [PATCH 39/65] media: imx-jpeg: Access v4l2_fh from file
Thread-Topic: [EXT] [PATCH 39/65] media: imx-jpeg: Access v4l2_fh from file
Thread-Index: AQHcA5AEYBBwNg2Y/E6im34Rtxr7RrRTUYBw
Date: Tue, 5 Aug 2025 01:58:01 +0000
Message-ID:
 <PAXPR04MB82541D50F538EECA4EE244BFE722A@PAXPR04MB8254.eurprd04.prod.outlook.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-39-eb140ddd6a9d@ideasonboard.com>
In-Reply-To: <20250802-media-private-data-v1-39-eb140ddd6a9d@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8254:EE_|AS8PR04MB9110:EE_
x-ms-office365-filtering-correlation-id: 65068444-4ab2-4c61-f625-08ddd3c38245
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?bFBCNWdzME9GSGtPNkhjL21LNWVXc3lPcEpXdFZWMDNWVlU3M3QxRVVwWEt5?=
 =?utf-8?B?UHJsWVNoRm9NVFd3WGs5YzJNM2cvNGVRRG56Wk9tNDFFdTF2WjI0Vm81TThH?=
 =?utf-8?B?cUNuZDNwbjlLS1JyUEZwOUJkR28vREwraXFaeG4xbFZyS0sySGxSUGd1LzNy?=
 =?utf-8?B?MWJPTnovdXhydDlLOUVFUkt1bElPVGxHV296OUNKK1FvdExENTFrWmtqa0xT?=
 =?utf-8?B?czhjVVJvaXRsZ2NsRE5maStJSU1UOGsvTEp4d09hMHg0SldwaHQrZkw0MlJ4?=
 =?utf-8?B?d3c4MUg5cnVDN2M2ZXdVNDRCanRGVDZYNEphUGQ2Wi9RM3ZpZmIybXliNmw5?=
 =?utf-8?B?UnpjWFlDem5NbEQrQkNJR0ZqcHdwSnVTZG5zbldDa21sZWdUcTdVTm9SL0dQ?=
 =?utf-8?B?ZzRGM3FmZzZ0QWRhWDd4aERiVUN3NEpxSXdiTFBuTDdnQUFpNnJIOWIyeUtF?=
 =?utf-8?B?UDk4b1Vxa2g5MElwQzJLeG5uSWdYVU55RWdXaWxvL2Q1TkhMZjNNYll1V0pT?=
 =?utf-8?B?eXRVTHZmWUloUUIyRWxRZ3pmV1RKZmhBTzdFQm02SVl3UjBSQjJxREF6TXM0?=
 =?utf-8?B?SWk0alZpeWRDRDBqOGFLSkJjdTVrbzM0SVpnKzNSSmZuL0I4YllFYlI4djFU?=
 =?utf-8?B?dFpBbTNhSGdjeHZuRFlhZFA2RkRVMFdXaHZFZ29QcTZUM0tCSkw5RlF3WkY5?=
 =?utf-8?B?blFoVEMrZXZ1MFFvck5jSTN3bUY4OFY3VEIzYTdTK1dwUjlQbjVMbGZEYXZW?=
 =?utf-8?B?enUvOG9Pd29vYVpKL2RsOHA5Uk9LUWZmZ1pWN3QxY1ZMUmh2OXBIa1JxRmZh?=
 =?utf-8?B?c1RscUpaRWZzNUJtSVRkczh4enpjOTFWa1kzb3pRaklJRlpzeHM4UllUeXhp?=
 =?utf-8?B?TDhRajdLWklHZmxZb2VoM1dFMDcrQktKemovWXloVjN4ZTd2Wkd6SXlTS0py?=
 =?utf-8?B?TUhNVmpzYnU1UlFFZzB1TnM5ek9GVERFd2hRUjNBY21uRVcwS0lTMW94cGJz?=
 =?utf-8?B?bWZ5RUFNbHNRczdOZE5NQXBQL1dqOXZSTjlWa1RqT0RMMWpWYWJWRlN5U1Zt?=
 =?utf-8?B?eDRFZ3dLRGRJbFZIeUhVL3NWT1dpZGovWmY0NVJDTFcxbWhwNHZlVk4ydTVp?=
 =?utf-8?B?d2VSemd0cHZ2NmdleS9tM2RRSnAxY1llaGh0b281VVBmdThJcEppaWVUc09Y?=
 =?utf-8?B?WXg0cFFNVlZnRHRJckFTRDBEaFhHeFZzZDlOekw3aTUxWmlmUGlGejZhc0lK?=
 =?utf-8?B?RjA5NHR5bW0vSGJ3VzBuMlVJMVh1VDg4MHk1L2NmakVHZWt0cGRpSFhTUFh3?=
 =?utf-8?B?R3o4cUhaVlFjdmQrUC9hK1BJWHBTbi93dXZTWUpJTlNKaW1mK2pyYjZQR2Yy?=
 =?utf-8?B?Z3NYdUR6WjM2RzZFeG1UTHdvL0dabStOYXVaVktHY0xkN3phTUlRMjdSYVhq?=
 =?utf-8?B?TjBienhDUHVUbWo0cjhEOUVTcUduenBJMml0UHZxVTdEdW9DODNCRjVHcUY1?=
 =?utf-8?B?K082QWxDQjhZZmJqdVE0Rm5oOG5GRy9mVFV1cjZkYkd2UzhBaDVNNWdaVDBn?=
 =?utf-8?B?dzVtTm0vVGVoRytRVWZNUkRJc1Z4czNBdEhpd0NFMExkejIzZURsL2M2Rmwr?=
 =?utf-8?B?bDhvc201SVFsMVI1RDMrM0tSU3NhaWJQajJWTEtuZE5MdUdFaW1QZFNIMGZU?=
 =?utf-8?B?cjdLRUxXWGJRU2doUGZRYU9OK1JwSzFZY1crR0xUMlVNbmtXeWtTNHMxN1pz?=
 =?utf-8?B?cXVsMDlVZjJsUGlMNEh5azhwcnBqU1ArMUpzSmpuT2Jhb2I1ZkRZbzB5OXEv?=
 =?utf-8?B?aFh6NXEwSWhKNXRjNi82NTY4NkFkZDdWQytJK0c0cEhWSndFdGFBblBnM1dh?=
 =?utf-8?B?Znk0d0xNejBreXpHQ1N1NFNyNFZmUlFVZDZHQi9VTDl3Qnp1cDdpNXR6R1Zj?=
 =?utf-8?B?RmhaSncxdXA0Uk83eE9sMUVJM280NzBuaDgxYnlqQ2VkK0hiNHl3Z2RTalpk?=
 =?utf-8?Q?w4ri85F/syWhuNPQwUdub5c7L8rktA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGZGVXBva3pScHFLQ3phTVo5cnp4MGRaWXlQU0E1ZG1MM204dWI4VlA4N3ds?=
 =?utf-8?B?UWdOWDZ4bUtlT0ZNOXdDWWpPTDJBQWMwRFh5RkljY2JqdUsyUVpuLzcxNEhq?=
 =?utf-8?B?MzVOVmdwMGdOaDNlNStybGZmbkU0bWxsV1EwV01Jc3gzSnFsTm5aZ0NIcW1E?=
 =?utf-8?B?bGlXYVEvYWF4bnUrR1B3cmxpVzdrR0xJb1FQWUtaZnRBSWpEYkxEZDlWUVF5?=
 =?utf-8?B?Z0ZDRkdwSmpxcEM2NFVaWkluM1RtcWNuNTJXVG93NXVoR0tzMkxzbHVISUpC?=
 =?utf-8?B?TktYSHNBbmZDN3dNR0tya241MUhkemxyWTVub1NsbHVIbkNncStHdjVFZHc5?=
 =?utf-8?B?b3IxM3NXNkdLVXplcDVlRmdlalQ3dFN3Y2ZQUHl1dWFaMHVxSVZRY0M1Mmlh?=
 =?utf-8?B?a0FuVXp5cWNJZTlvOG5JWnZJeUs0bXNvNGxIU2dKZENzQWxXTUpodjVXNEJo?=
 =?utf-8?B?eDRXdnR2THpGaFJRSmtKeUxiVmU3Qm9jUkJNc1I2UU9vM1A5aStZVExrU2Yx?=
 =?utf-8?B?aDROT2RFa1NZZzA4YURvMGVSZ3loZnVKd2taZVlUdzBzK2MwN1hxVVBzN2pj?=
 =?utf-8?B?eFNLRjZyTkI2NnZ5YlNLbVBIcmNqM1Joa1ptU1NaejZYYXF4UzN4eGlkN0dV?=
 =?utf-8?B?ZHRMVTJucUhkNm0wc29MQW83VytuZ1FhVHhNazRhdlFyQXB6U0VwdDdldUlB?=
 =?utf-8?B?cTdSWVkxVUVKUkFTc3AyamtZK2dtREVwaEZSTzdVMlFOVGprVzJ6RmdVdFgw?=
 =?utf-8?B?dDRjYkdnYi9yQTlGVkIwYXRPenpHYTBRY2hHNjBwSWI1RTZOUDdEa1g5bXdH?=
 =?utf-8?B?aCtnL3VSa3hKWEJpaHE1Q2ZFVmdZbFlrbzZZQVFXRHhqZzg1ci8wWG5ubThQ?=
 =?utf-8?B?ZnVNcHZJQ2lUb2F1WlQvdTZvUm1hL2pVTDFLaGZIcEx5NFMvMEcyYnpTZ0l6?=
 =?utf-8?B?R3FDNC8waVdJOGhJQ0duWU40OG9VbkcrcHliYnpWUzhXc0ZIUHhPRjFucW5u?=
 =?utf-8?B?YUhTdDZUMFdIVzZZN1ExT0l1U1gweDlIWStmK2xWVjFnSCtHSzFXcnFFMUVs?=
 =?utf-8?B?R1Q0UTJMeVNDSXgyUDhYdWdXN00yRExxakplTUVyNWhPZmMva3VaMkF0WjE4?=
 =?utf-8?B?aElYNmEyWW0yQjRPZDhJQjBsSTRrUzVCdXUyUzk3N0M3YVh0K0E4MXZDaVFt?=
 =?utf-8?B?cEhLM0tTWnduNkNVMFJVaUZBVnBGenN4VGFWWUdDSEN0MUM0dHBNTnZQeUI3?=
 =?utf-8?B?Q3pldCtwMURjS2JvYjJYMGdHbmFGVVIvOCsvZWZKNXg1QWI3bkxlMTF3MU41?=
 =?utf-8?B?Y0E5ejRTdFNHWTAxaEhoWmorU2tYQVdxdEhTVW52OVBpbzFaOUdPMHQ1WUNS?=
 =?utf-8?B?Q0FXam1uODZKYjlLYzgzKy9MNVJGT1J0OUdDL1UxNGUzZEJTZFFYRE5ORzNN?=
 =?utf-8?B?dVF6Y2FuSjdpZFpLNnozdmhPdXU2K01sQThjUWFsbTdVSXBMcjhiV0owdWtj?=
 =?utf-8?B?K3dPN0VudG5HN3JQeHdsczVINU5EejA0eDd1a0xPam1VM0dCdjZrZzdWN2Vh?=
 =?utf-8?B?NGxrWjJsdzQxaXhuTlhZa1RsblYzSVB4Y2x3aWo1R3lJZHlhUkVNeXQ0eW9p?=
 =?utf-8?B?MW1yR1JjMXZGT1VzVVc3T1cvVGQ0OTRwVFZZb1BWTEIxVGo5aHNXR1ZCUlZ1?=
 =?utf-8?B?Vmt0WUJkeWlGR2xNUlkyQVFGMUY1WWRPZ2l3WFFGZHlVOXlNanlkS29wUHpF?=
 =?utf-8?B?Yk9lQTFVUm1XdkdacDVqUEhsMkdZcXpmSG92dXdFSHNIRWtNa2swbk13V1Na?=
 =?utf-8?B?ZEovRFNvWTcwQk9zSHRHczk5ZkEyTmVwRlBMRDh5WnB3SjlxakJzRHNYSmNa?=
 =?utf-8?B?OU1jbUdjWkk0c0g1NzNOVVpoUFBpeXRTSHlHdFJLRHJnRW1sZGRFMnJNMFA1?=
 =?utf-8?B?aHh1MURsb3M3cXZxRkNtN1RxR3dsS3ZZd25lK2RaUFkrOEYxdHc4WjYzMEZX?=
 =?utf-8?B?REZyYUdaRFh2Z2xwZjdOc1BYZkpaU1lsRVNVTTYzWlpOMG9NQ1J0OG5ZWlVN?=
 =?utf-8?B?US9PeUFEbVM4LzFQT1JxTnNJbEVjbVA1RW52UGhVQ2h6Qm5TTklsUnVoaEZn?=
 =?utf-8?Q?MStw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65068444-4ab2-4c61-f625-08ddd3c38245
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 01:58:01.3766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 75XJqb1gu6gjrukDgnwhvy7uJDlLYcrKEH5I8kDS7QBu+ZdEJvFqxc3ZCXfz9s4pFk8ndWkikDHjr0h5X0AQaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9110

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEphY29wbyBNb25kaSA8amFj
b3BvLm1vbmRpQGlkZWFzb25ib2FyZC5jb20+DQo+U2VudDogU2F0dXJkYXksIEF1Z3VzdCAyLCAy
MDI1IDU6MjMgUE0NCj5UbzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5v
cmc+OyBEZXZhcnNoIFRoYWtrYXINCj48ZGV2YXJzaHRAdGkuY29tPjsgQmVub2l0IFBhcnJvdCA8
YnBhcnJvdEB0aS5jb20+OyBIYW5zIFZlcmt1aWwNCj48aHZlcmt1aWxAa2VybmVsLm9yZz47IE1p
a2UgSXNlbHkgPGlzZWx5QHBvYm94LmNvbT47IExhdXJlbnQgUGluY2hhcnQNCj48bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsgSGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9y
Zz47DQo+UGFydGhpYmFuIFZlZXJhc29vcmFuIDxwYXJ0aGliYW4udmVlcmFzb29yYW5AbWljcm9j
aGlwLmNvbT47IENocmlzdGlhbg0KPkdyb21tIDxjaHJpc3RpYW4uZ3JvbW1AbWljcm9jaGlwLmNv
bT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPjxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IEFs
ZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPjsgWWFudGVuZyBTaQ0KPjxzaS55YW50ZW5nQGxpbnV4
LmRldj47IERvbmdsaWFuZyBNdSA8ZHptOTFAaHVzdC5lZHUuY24+OyBKb25hdGhhbg0KPkNvcmJl
dCA8Y29yYmV0QGx3bi5uZXQ+OyBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPjsgTWFy
ZWsNCj5Tenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+OyBBbmR5IFdhbGxzDQo+
PGF3YWxsc0BtZC5tZXRyb2Nhc3QubmV0PjsgTWljaGFlbCBUcmV0dGVyIDxtLnRyZXR0ZXJAcGVu
Z3V0cm9uaXguZGU+Ow0KPlBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9u
aXguZGU+OyBCaW4gTGl1DQo+PGJpbi5saXVAbWVkaWF0ZWsuY29tPjsgTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT47DQo+QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT47DQo+RG1pdHJ5IE9zaXBl
bmtvIDxkaWdldHhAZ21haWwuY29tPjsgVGhpZXJyeSBSZWRpbmcNCj48dGhpZXJyeS5yZWRpbmdA
Z21haWwuY29tPjsgSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT47DQo+TWly
ZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+OyBTaGF3biBHdW8NCj48c2hhd25n
dW9Aa2VybmVsLm9yZz47IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IEZh
YmlvDQo+RXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgS2llcmFuIEJpbmdoYW0NCj48a2ll
cmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPjsgTWljaGFsIFNpbWVrDQo+PG1p
Y2hhbC5zaW1la0BhbWQuY29tPjsgTWluZyBRaWFuIDxtaW5nLnFpYW5AbnhwLmNvbT47IEVhZ2xl
IFpob3UNCj48ZWFnbGUuemhvdUBueHAuY29tPjsgWGF2aWVyIFJvdW1lZ3VlIChPU1MpDQo+PHhh
dmllci5yb3VtZWd1ZUBvc3MubnhwLmNvbT47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0
cm9uaXguZGU+Ow0KPlZpa2FzaCBHYXJvZGlhIDxxdWljX3ZnYXJvZGlhQHF1aWNpbmMuY29tPjsg
RGlrc2hpdGEgQWdhcndhbA0KPjxxdWljX2Rpa3NoaXRhQHF1aWNpbmMuY29tPjsgQWJoaW5hdiBL
dW1hciA8YWJoaW5hdi5rdW1hckBsaW51eC5kZXY+Ow0KPkJyeWFuIE8nRG9ub2dodWUgPGJyeWFu
Lm9kb25vZ2h1ZUBsaW5hcm8ub3JnPjsgU3lsd2VzdGVyIE5hd3JvY2tpDQo+PHN5bHZlc3Rlci5u
YXdyb2NraUBnbWFpbC5jb20+OyBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwu
Y29tPjsNCj5DaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+OyBTYW11ZWwgSG9sbGFuZCA8c2Ft
dWVsQHNob2xsYW5kLm9yZz47DQo+RGFuaWVsIEFsbWVpZGEgPGRhbmllbC5hbG1laWRhQGNvbGxh
Ym9yYS5jb20+OyBOZWlsIEFybXN0cm9uZw0KPjxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsg
S2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT47IEplcm9tZQ0KPkJydW5ldCA8amJy
dW5ldEBiYXlsaWJyZS5jb20+OyBNYXJ0aW4gQmx1bWVuc3RpbmdsDQo+PG1hcnRpbi5ibHVtZW5z
dGluZ2xAZ29vZ2xlbWFpbC5jb20+OyBOYXMgQ2h1bmcNCj48bmFzLmNodW5nQGNoaXBzbm1lZGlh
LmNvbT47IEphY2tzb24gTGVlDQo+PGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT47IE1pbmdo
c2l1IFRzYWkNCj48bWluZ2hzaXUudHNhaUBtZWRpYXRlay5jb20+OyBIb3Vsb25nIFdlaSA8aG91
bG9uZy53ZWlAbWVkaWF0ZWsuY29tPjsNCj5BbmRyZXctQ1QgQ2hlbiA8YW5kcmV3LWN0LmNoZW5A
bWVkaWF0ZWsuY29tPjsgVGlmZmFueSBMaW4NCj48dGlmZmFueS5saW5AbWVkaWF0ZWsuY29tPjsg
WXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT47DQo+R2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IE1hZ251cyBEYW1tDQo+PG1hZ251cy5kYW1t
QGdtYWlsLmNvbT47IE1pa2hhaWwgVWx5YW5vdg0KPjxtaWtoYWlsLnVseWFub3ZAY29nZW50ZW1i
ZWRkZWQuY29tPjsgSmFjb2IgQ2hlbiA8amFjb2ItDQo+Y2hlbkBpb3R3cnQuY29tPjsgRXplcXVp
ZWwgR2FyY2lhIDxlemVxdWllbEB2YW5ndWFyZGlhc3VyLmNvbS5hcj47IEhlaWtvDQo+U3R1ZWJu
ZXIgPGhlaWtvQHNudGVjaC5kZT47IERldGxldiBDYXNhbm92YQ0KPjxkZXRsZXYuY2FzYW5vdmFA
Y29sbGFib3JhLmNvbT47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz47DQo+
QWxpbSBBa2h0YXIgPGFsaW0uYWtodGFyQHNhbXN1bmcuY29tPjsgU3lsd2VzdGVyIE5hd3JvY2tp
DQo+PHMubmF3cm9ja2lAc2Ftc3VuZy5jb20+OyDFgXVrYXN6IFN0ZWxtYWNoIDxsLnN0ZWxtYWNo
QHNhbXN1bmcuY29tPjsNCj5BbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWp0cDIwMTBAZ21h
aWwuY29tPjsgSmFjZWsgQW5hc3pld3NraQ0KPjxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT47
IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsNCj5GYWJpZW4gRGVzc2Vu
bmUgPGZhYmllbi5kZXNzZW5uZUBmb3NzLnN0LmNvbT47IEh1Z3VlcyBGcnVjaGV0DQo+PGh1Z3Vl
cy5mcnVjaGV0QGZvc3Muc3QuY29tPjsgSmVhbi1DaHJpc3RvcGhlIFRyb3RpbiA8amVhbi0NCj5j
aHJpc3RvcGhlLnRyb3RpbkBmb3NzLnN0LmNvbT47IE1heGltZSBDb3F1ZWxpbg0KPjxtY29xdWVs
aW4uc3RtMzJAZ21haWwuY29tPjsgQWxleGFuZHJlIFRvcmd1ZQ0KPjxhbGV4YW5kcmUudG9yZ3Vl
QGZvc3Muc3QuY29tPjsgTmljb2xhcyBEdWZyZXNuZQ0KPjxuaWNvbGFzLmR1ZnJlc25lQGNvbGxh
Ym9yYS5jb20+OyBCZW5qYW1pbiBHYWlnbmFyZA0KPjxiZW5qYW1pbi5nYWlnbmFyZEBjb2xsYWJv
cmEuY29tPjsgU3RldmUgTG9uZ2VyYmVhbQ0KPjxzbG9uZ2VyYmVhbUBnbWFpbC5jb20+OyBNYXhp
bWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBQYXVsDQo+S29jaWFsa293c2tpIDxwYXVs
a0BzeXMtYmFzZS5pbz47IE5pa2xhcyBTw7ZkZXJsdW5kDQo+PG5pa2xhcy5zb2Rlcmx1bmRAcmFn
bmF0ZWNoLnNlPjsgUm9iZXJ0IEZvc3MgPHJmb3NzQGtlcm5lbC5vcmc+OyBUb2Rvcg0KPlRvbW92
IDx0b2Rvci50b29AZ21haWwuY29tPjsgVmxhZGltaXIgWmFwb2xza2l5DQo+PHZsYWRpbWlyLnph
cG9sc2tpeUBsaW5hcm8ub3JnPjsgQ29yZW50aW4gTGFiYmUgPGNsYWJiZUBiYXlsaWJyZS5jb20+
Ow0KPlNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT47IEJpbmdidSBD
YW8NCj48YmluZ2J1LmNhb0BpbnRlbC5jb20+OyBUaWFuc2h1IFFpdSA8dGlhbi5zaHUucWl1QGlu
dGVsLmNvbT47IFN0YW5pc2xhdw0KPkdydXN6a2EgPHN0YW5pc2xhdy5ncnVzemthQGxpbnV4Lmlu
dGVsLmNvbT4NCj5DYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj5zdGFnaW5nQGxpc3RzLmxpbnV4LmRldjsgbGludXgt
ZG9jQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLQ0KPmtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOyBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj50ZWdyYUB2
Z2VyLmtlcm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LXJlbmVzYXMtc29jQHZn
ZXIua2VybmVsLm9yZzsNCj5saW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsgbGludXgtc2Ft
c3VuZy1zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj5zdW54aUBsaXN0cy5saW51eC5kZXY7
IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPmFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtDQo+c3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbTsgbWpwZWctdXNlcnNAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Ow0KPkphY29wbyBNb25kaSA8amFjb3BvLm1vbmRpQGlkZWFzb25ib2FyZC5jb20+
DQo+U3ViamVjdDogW0VYVF0gW1BBVENIIDM5LzY1XSBtZWRpYTogaW14LWpwZWc6IEFjY2VzcyB2
NGwyX2ZoIGZyb20gZmlsZQ0KPg0KPkNhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwu
IFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvcg0KPm9wZW5pbmcgYXR0YWNo
bWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9y
dA0KPnRoaXMgZW1haWwnIGJ1dHRvbg0KPg0KPg0KPlRoZSB2NGwyX2ZoIGFzc29jaWF0ZWQgd2l0
aCBhbiBvcGVuIGZpbGUgaGFuZGxlIGlzIG5vdyBndWFyYW50ZWVkIHRvIGJlDQo+YXZhaWxhYmxl
IGluIGZpbGUtPnByaXZhdGVfZGF0YSwgaW5pdGlhbGlzZWQgYnkgdjRsMl9maF9hZGQoKS4NCj4N
Cj5BY2Nlc3MgdGhlIHY0bDJfZmgsIGFuZCBmcm9tIHRoZXJlIHRoZSBkcml2ZXItc3BlY2lmaWMg
c3RydWN0dXJlLCBmcm9tIHRoZSBmaWxlICoNCj5pbiBhbGwgaW9jdGwgaGFuZGxlcnMuDQo+DQo+
V2hpbGUgYXQgaXQsIHJlbW92ZSB0aGUgbm93IHVudXNlZCBteGNfanBlZ19maF90b19jdHgoKSBt
YWNyby4NCj4NCj5TaWduZWQtb2ZmLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wby5tb25kaUBpZGVh
c29uYm9hcmQuY29tPg0KDQpSZXZpZXdlZC1ieTogTWluZyBRaWFuIDxtaW5nLnFpYW5Ab3NzLm54
cC5jb20+DQoNCj4tLS0NCj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14LWpwZWcvbXhj
LWpwZWcuYyB8IDMzICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0NCj4tDQo+IDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4NCj5kaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14LWpwZWcvbXhjLWpwZWcuYw0KPmIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14LWpwZWcvbXhjLWpwZWcuYw0KPmluZGV4DQo+ZmE3ZDc0
ZDhjMWFhYmQzYmY3NDQ4MmUyMTQxNjVkOGMxYTdlODlkYS4uZGYzY2NkZjc2N2JhZjBiZjY2ODc4
MDhlMmMNCj4wMTcwNjMxODFhNzIyMCAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL254cC9pbXgtanBlZy9teGMtanBlZy5jDQo+KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9ueHAvaW14LWpwZWcvbXhjLWpwZWcuYw0KPkBAIC02NDQsMTEgKzY0NCw2IEBAIHN0YXRpYyB2
b2lkIHByaW50X214Y19idWYoc3RydWN0IG14Y19qcGVnX2RldiAqanBlZywNCj5zdHJ1Y3QgdmIy
X2J1ZmZlciAqYnVmLA0KPiAgICAgICAgfQ0KPiB9DQo+DQo+LXN0YXRpYyBpbmxpbmUgc3RydWN0
IG14Y19qcGVnX2N0eCAqbXhjX2pwZWdfZmhfdG9fY3R4KHN0cnVjdCB2NGwyX2ZoICpmaCkgLXsN
Cj4tICAgICAgIHJldHVybiBjb250YWluZXJfb2YoZmgsIHN0cnVjdCBteGNfanBlZ19jdHgsIGZo
KTsNCj4tfQ0KPi0NCj4gc3RhdGljIGlubGluZSBzdHJ1Y3QgbXhjX2pwZWdfY3R4ICpteGNfanBl
Z19maWxlX3RvX2N0eChzdHJ1Y3QgZmlsZSAqZmlscCkgIHsNCj4gICAgICAgIHJldHVybiBjb250
YWluZXJfb2YoZmlsZV90b192NGwyX2ZoKGZpbHApLCBzdHJ1Y3QgbXhjX2pwZWdfY3R4LCBmaCk7
IEBAIC0NCj4xNjEwLDcgKzE2MDUsNyBAQCBzdGF0aWMgaW50IG14Y19qcGVnX2RlY29kZXJfY21k
KHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkDQo+KnByaXYsDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgdjRsMl9kZWNvZGVyX2NtZCAqY21kKSAgew0KPiAgICAgICAgc3Ry
dWN0IHY0bDJfZmggKmZoID0gZmlsZV90b192NGwyX2ZoKGZpbGUpOw0KPi0gICAgICAgc3RydWN0
IG14Y19qcGVnX2N0eCAqY3R4ID0gbXhjX2pwZWdfZmhfdG9fY3R4KGZoKTsNCj4rICAgICAgIHN0
cnVjdCBteGNfanBlZ19jdHggKmN0eCA9IG14Y19qcGVnX2ZpbGVfdG9fY3R4KGZpbGUpOw0KPiAg
ICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gICAgICAgIGludCByZXQ7DQo+DQo+QEAgLTE2
NDMsNyArMTYzOCw3IEBAIHN0YXRpYyBpbnQgbXhjX2pwZWdfZW5jb2Rlcl9jbWQoc3RydWN0IGZp
bGUgKmZpbGUsDQo+dm9pZCAqcHJpdiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCB2NGwyX2VuY29kZXJfY21kICpjbWQpICB7DQo+ICAgICAgICBzdHJ1Y3QgdjRsMl9m
aCAqZmggPSBmaWxlX3RvX3Y0bDJfZmgoZmlsZSk7DQo+LSAgICAgICBzdHJ1Y3QgbXhjX2pwZWdf
Y3R4ICpjdHggPSBteGNfanBlZ19maF90b19jdHgoZmgpOw0KPisgICAgICAgc3RydWN0IG14Y19q
cGVnX2N0eCAqY3R4ID0gbXhjX2pwZWdfZmlsZV90b19jdHgoZmlsZSk7DQo+ICAgICAgICB1bnNp
Z25lZCBsb25nIGZsYWdzOw0KPiAgICAgICAgaW50IHJldDsNCj4NCj5AQCAtMjI2MCw3ICsyMjU1
LDcgQEAgc3RhdGljIGludCBteGNfanBlZ19xdWVyeWNhcChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9p
ZA0KPipwcml2LCAgc3RhdGljIGludCBteGNfanBlZ19lbnVtX2ZtdF92aWRfY2FwKHN0cnVjdCBm
aWxlICpmaWxlLCB2b2lkICpwcml2LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgdjRsMl9mbXRkZXNjICpmKSAgew0KPi0gICAgICAgc3RydWN0IG14Y19qcGVn
X2N0eCAqY3R4ID0gbXhjX2pwZWdfZmhfdG9fY3R4KHByaXYpOw0KPisgICAgICAgc3RydWN0IG14
Y19qcGVnX2N0eCAqY3R4ID0gbXhjX2pwZWdfZmlsZV90b19jdHgoZmlsZSk7DQo+ICAgICAgICBz
dHJ1Y3QgbXhjX2pwZWdfcV9kYXRhICpxX2RhdGEgPSBteGNfanBlZ19nZXRfcV9kYXRhKGN0eCwg
Zi0+dHlwZSk7DQo+DQo+ICAgICAgICBpZiAoY3R4LT5teGNfanBlZy0+bW9kZSA9PSBNWENfSlBF
R19FTkNPREUpIHsgQEAgLTIzMDAsNyArMjI5NSw3DQo+QEAgc3RhdGljIGludCBteGNfanBlZ19l
bnVtX2ZtdF92aWRfY2FwKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LCAgc3RhdGljDQo+
aW50IG14Y19qcGVnX2VudW1fZm10X3ZpZF9vdXQoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnBy
aXYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2NGwyX2Zt
dGRlc2MgKmYpICB7DQo+LSAgICAgICBzdHJ1Y3QgbXhjX2pwZWdfY3R4ICpjdHggPSBteGNfanBl
Z19maF90b19jdHgocHJpdik7DQo+KyAgICAgICBzdHJ1Y3QgbXhjX2pwZWdfY3R4ICpjdHggPSBt
eGNfanBlZ19maWxlX3RvX2N0eChmaWxlKTsNCj4gICAgICAgIHUzMiB0eXBlID0gY3R4LT5teGNf
anBlZy0+bW9kZSA9PSBNWENfSlBFR19ERUNPREUgPw0KPk1YQ19KUEVHX0ZNVF9UWVBFX0VOQyA6
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIE1YQ19KUEVHX0ZNVF9UWVBFX1JBVzsNCj4gICAgICAgIGludCByZXQ7DQo+QEAgLTI0
NDEsNyArMjQzNiw3IEBAIHN0YXRpYyBpbnQgbXhjX2pwZWdfdHJ5X2ZtdChzdHJ1Y3QgdjRsMl9m
b3JtYXQgKmYsDQo+c3RhdGljIGludCBteGNfanBlZ190cnlfZm10X3ZpZF9jYXAoc3RydWN0IGZp
bGUgKmZpbGUsIHZvaWQgKnByaXYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IHY0bDJfZm9ybWF0ICpmKSAgew0KPi0gICAgICAgc3RydWN0IG14Y19qcGVnX2N0
eCAqY3R4ID0gbXhjX2pwZWdfZmhfdG9fY3R4KHByaXYpOw0KPisgICAgICAgc3RydWN0IG14Y19q
cGVnX2N0eCAqY3R4ID0gbXhjX2pwZWdfZmlsZV90b19jdHgoZmlsZSk7DQo+ICAgICAgICBzdHJ1
Y3QgbXhjX2pwZWdfZGV2ICpqcGVnID0gY3R4LT5teGNfanBlZzsNCj4gICAgICAgIHN0cnVjdCBk
ZXZpY2UgKmRldiA9IGpwZWctPmRldjsNCj4gICAgICAgIHN0cnVjdCBteGNfanBlZ19xX2RhdGEg
dG1wX3E7DQo+QEAgLTI0NjAsNyArMjQ1NSw3IEBAIHN0YXRpYyBpbnQgbXhjX2pwZWdfdHJ5X2Zt
dF92aWRfY2FwKHN0cnVjdCBmaWxlICpmaWxlLA0KPnZvaWQgKnByaXYsICBzdGF0aWMgaW50IG14
Y19qcGVnX3RyeV9mbXRfdmlkX291dChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdjRsMl9mb3JtYXQgKmYp
ICB7DQo+LSAgICAgICBzdHJ1Y3QgbXhjX2pwZWdfY3R4ICpjdHggPSBteGNfanBlZ19maF90b19j
dHgocHJpdik7DQo+KyAgICAgICBzdHJ1Y3QgbXhjX2pwZWdfY3R4ICpjdHggPSBteGNfanBlZ19m
aWxlX3RvX2N0eChmaWxlKTsNCj4gICAgICAgIHN0cnVjdCBteGNfanBlZ19kZXYgKmpwZWcgPSBj
dHgtPm14Y19qcGVnOw0KPiAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0ganBlZy0+ZGV2Ow0K
PiAgICAgICAgc3RydWN0IG14Y19qcGVnX3FfZGF0YSB0bXBfcTsNCj5AQCAtMjUxMiwyMCArMjUw
NywyMCBAQCBzdGF0aWMgaW50IG14Y19qcGVnX3NfZm10KHN0cnVjdCBteGNfanBlZ19jdHgNCj4q
Y3R4LCAgc3RhdGljIGludCBteGNfanBlZ19zX2ZtdF92aWRfY2FwKHN0cnVjdCBmaWxlICpmaWxl
LCB2b2lkICpwcml2LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
djRsMl9mb3JtYXQgKmYpICB7DQo+LSAgICAgICByZXR1cm4gbXhjX2pwZWdfc19mbXQobXhjX2pw
ZWdfZmhfdG9fY3R4KHByaXYpLCBmKTsNCj4rICAgICAgIHJldHVybiBteGNfanBlZ19zX2ZtdCht
eGNfanBlZ19maWxlX3RvX2N0eChmaWxlKSwgZik7DQo+IH0NCj4NCj4gc3RhdGljIGludCBteGNf
anBlZ19zX2ZtdF92aWRfb3V0KHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdjRsMl9mb3JtYXQgKmYpICB7DQo+
ICAgICAgICBpbnQgcmV0Ow0KPi0gICAgICAgc3RydWN0IG14Y19qcGVnX2N0eCAqY3R4ID0gbXhj
X2pwZWdfZmhfdG9fY3R4KHByaXYpOw0KPisgICAgICAgc3RydWN0IG14Y19qcGVnX2N0eCAqY3R4
ID0gbXhjX2pwZWdfZmlsZV90b19jdHgoZmlsZSk7DQo+ICAgICAgICBzdHJ1Y3QgdmIyX3F1ZXVl
ICpkc3RfdnE7DQo+ICAgICAgICBzdHJ1Y3QgbXhjX2pwZWdfcV9kYXRhICpxX2RhdGFfY2FwOw0K
PiAgICAgICAgZW51bSB2NGwyX2J1Zl90eXBlIGNhcF90eXBlID0NCj5WNEwyX0JVRl9UWVBFX1ZJ
REVPX0NBUFRVUkVfTVBMQU5FOw0KPiAgICAgICAgc3RydWN0IHY0bDJfZm9ybWF0IGZjOw0KPg0K
Pi0gICAgICAgcmV0ID0gbXhjX2pwZWdfc19mbXQobXhjX2pwZWdfZmhfdG9fY3R4KHByaXYpLCBm
KTsNCj4rICAgICAgIHJldCA9IG14Y19qcGVnX3NfZm10KGN0eCwgZik7DQo+ICAgICAgICBpZiAo
cmV0KQ0KPiAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPg0KPkBAIC0yNTU0LDcgKzI1NDks
NyBAQCBzdGF0aWMgaW50IG14Y19qcGVnX3NfZm10X3ZpZF9vdXQoc3RydWN0IGZpbGUgKmZpbGUs
DQo+dm9pZCAqcHJpdiwgIHN0YXRpYyBpbnQgbXhjX2pwZWdfZ19mbXRfdmlkKHN0cnVjdCBmaWxl
ICpmaWxlLCB2b2lkICpwcml2LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCB2NGwyX2Zvcm1hdCAqZikgIHsNCj4tICAgICAgIHN0cnVjdCBteGNfanBlZ19jdHggKmN0eCA9
IG14Y19qcGVnX2ZoX3RvX2N0eChwcml2KTsNCj4rICAgICAgIHN0cnVjdCBteGNfanBlZ19jdHgg
KmN0eCA9IG14Y19qcGVnX2ZpbGVfdG9fY3R4KGZpbGUpOw0KPiAgICAgICAgc3RydWN0IG14Y19q
cGVnX2RldiAqanBlZyA9IGN0eC0+bXhjX2pwZWc7DQo+ICAgICAgICBzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSBqcGVnLT5kZXY7DQo+ICAgICAgICBzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0X21wbGFuZSAg
ICpwaXhfbXAgPSAmZi0+Zm10LnBpeF9tcDsNCj5AQCAtMjU5Miw3ICsyNTg3LDcgQEAgc3RhdGlj
IGludCBteGNfanBlZ19nX2ZtdF92aWQoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQNCj4qcHJpdiwN
Cj4NCj4gc3RhdGljIGludCBteGNfanBlZ19kZWNfZ19zZWxlY3Rpb24oc3RydWN0IGZpbGUgKmZp
bGUsIHZvaWQgKmZoLCBzdHJ1Y3QNCj52NGwyX3NlbGVjdGlvbiAqcykgIHsNCj4tICAgICAgIHN0
cnVjdCBteGNfanBlZ19jdHggKmN0eCA9IG14Y19qcGVnX2ZoX3RvX2N0eChmaCk7DQo+KyAgICAg
ICBzdHJ1Y3QgbXhjX2pwZWdfY3R4ICpjdHggPSBteGNfanBlZ19maWxlX3RvX2N0eChmaWxlKTsN
Cj4gICAgICAgIHN0cnVjdCBteGNfanBlZ19xX2RhdGEgKnFfZGF0YV9jYXA7DQo+DQo+ICAgICAg
ICBpZiAocy0+dHlwZSAhPSBWNEwyX0JVRl9UWVBFX1ZJREVPX0NBUFRVUkUgJiYgcy0+dHlwZSAh
PQ0KPlY0TDJfQlVGX1RZUEVfVklERU9fQ0FQVFVSRV9NUExBTkUpDQo+QEAgLTI2MjEsNyArMjYx
Niw3IEBAIHN0YXRpYyBpbnQgbXhjX2pwZWdfZGVjX2dfc2VsZWN0aW9uKHN0cnVjdCBmaWxlICpm
aWxlLA0KPnZvaWQgKmZoLCBzdHJ1Y3QgdjRsMl9zZWwNCj4NCj4gc3RhdGljIGludCBteGNfanBl
Z19lbmNfZ19zZWxlY3Rpb24oc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKmZoLCBzdHJ1Y3QNCj52
NGwyX3NlbGVjdGlvbiAqcykgIHsNCj4tICAgICAgIHN0cnVjdCBteGNfanBlZ19jdHggKmN0eCA9
IG14Y19qcGVnX2ZoX3RvX2N0eChmaCk7DQo+KyAgICAgICBzdHJ1Y3QgbXhjX2pwZWdfY3R4ICpj
dHggPSBteGNfanBlZ19maWxlX3RvX2N0eChmaWxlKTsNCj4gICAgICAgIHN0cnVjdCBteGNfanBl
Z19xX2RhdGEgKnFfZGF0YV9vdXQ7DQo+DQo+ICAgICAgICBpZiAocy0+dHlwZSAhPSBWNEwyX0JV
Rl9UWVBFX1ZJREVPX09VVFBVVCAmJiBzLT50eXBlICE9DQo+VjRMMl9CVUZfVFlQRV9WSURFT19P
VVRQVVRfTVBMQU5FKQ0KPkBAIC0yNjQ5LDcgKzI2NDQsNyBAQCBzdGF0aWMgaW50IG14Y19qcGVn
X2VuY19nX3NlbGVjdGlvbihzdHJ1Y3QgZmlsZSAqZmlsZSwNCj52b2lkICpmaCwgc3RydWN0IHY0
bDJfc2VsDQo+DQo+IHN0YXRpYyBpbnQgbXhjX2pwZWdfZ19zZWxlY3Rpb24oc3RydWN0IGZpbGUg
KmZpbGUsIHZvaWQgKmZoLCBzdHJ1Y3QgdjRsMl9zZWxlY3Rpb24NCj4qcykgIHsNCj4tICAgICAg
IHN0cnVjdCBteGNfanBlZ19jdHggKmN0eCA9IG14Y19qcGVnX2ZoX3RvX2N0eChmaCk7DQo+KyAg
ICAgICBzdHJ1Y3QgbXhjX2pwZWdfY3R4ICpjdHggPSBteGNfanBlZ19maWxlX3RvX2N0eChmaWxl
KTsNCj4NCj4gICAgICAgIGlmIChjdHgtPm14Y19qcGVnLT5tb2RlID09IE1YQ19KUEVHX0RFQ09E
RSkNCj4gICAgICAgICAgICAgICAgcmV0dXJuIG14Y19qcGVnX2RlY19nX3NlbGVjdGlvbihmaWxl
LCBmaCwgcyk7IEBAIC0yNjU5LDcgKzI2NTQsNyBAQA0KPnN0YXRpYyBpbnQgbXhjX2pwZWdfZ19z
ZWxlY3Rpb24oc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKmZoLCBzdHJ1Y3QgdjRsMl9zZWxlY3Rp
DQo+DQo+IHN0YXRpYyBpbnQgbXhjX2pwZWdfc19zZWxlY3Rpb24oc3RydWN0IGZpbGUgKmZpbGUs
IHZvaWQgKmZoLCBzdHJ1Y3QgdjRsMl9zZWxlY3Rpb24NCj4qcykgIHsNCj4tICAgICAgIHN0cnVj
dCBteGNfanBlZ19jdHggKmN0eCA9IG14Y19qcGVnX2ZoX3RvX2N0eChmaCk7DQo+KyAgICAgICBz
dHJ1Y3QgbXhjX2pwZWdfY3R4ICpjdHggPSBteGNfanBlZ19maWxlX3RvX2N0eChmaWxlKTsNCj4g
ICAgICAgIHN0cnVjdCBteGNfanBlZ19xX2RhdGEgKnFfZGF0YV9vdXQ7DQo+DQo+ICAgICAgICBp
ZiAoY3R4LT5teGNfanBlZy0+bW9kZSAhPSBNWENfSlBFR19FTkNPREUpDQo+DQo+LS0NCj4yLjQ5
LjANCg0K

