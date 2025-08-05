Return-Path: <linux-media+bounces-38881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A2EB1AC36
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 03:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F9FD189FD0F
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 01:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FB21C2DB2;
	Tue,  5 Aug 2025 01:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L3qAFFqS"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D5EA41;
	Tue,  5 Aug 2025 01:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754358235; cv=fail; b=hSI+BSGSTtaf/uih3Bwy8Iyl27NFbvlKDJOhooBQqOFUGO+WPnV8ekFDn3+S8b9gWZOwOKb1QHeBaf2Se0iguUxw8qdJhHa+teJVbu19yV+9j/Yxa+AB7hx1OEJN19YNeJl1tSHiqEzpbvLnQ7mob5GI48VQEfAXlB1XQJxWnd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754358235; c=relaxed/simple;
	bh=78mntRTSCRTHmUQ3AnS41MhIN4wuy2oYNTFrSsuuIv4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EG3+4HoQL2jScxgC5NnaVmEWEcCmhdSrx4ZUAjkCkkxHYsbymPrN2E7B1EeEANjh/sc5gMNyaleJu4h++1J3Uvbs/RdoSY6EeFKF9IebKmcQv9JQD7Gbxb0WJZdGWZi+gp2fPtVc6WD8ZJAKCaiE2g0vTO/b93EUelyFAsx25oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L3qAFFqS; arc=fail smtp.client-ip=52.101.72.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRc2Sa5FrK7WUgnBux6ZOMbyTXfvTRKKdSGQAinKxanzgmq/C/aIQRTjoy8wnrSmmYXvFKcLnjPG73mYwX0vsmZTKJw7QxOVHG6uunr1Fj+WEvUUnZeNqMC+9YqBh/xEXGCQ77iNsQbvxqXtU6avWAZNbPNfYrUwXRRpd7uhYsojxUjF0+pmmB1hnATD3gEN3UHQ+U6w0yqGncUwpnoc5y1ZeS8eA1anVkHj/DA12tc3AllxZd749c0thiMYDpvo+AAk6KUroLmFMqZ3uo1sG/qR0UEDVDYCOYX2o+vb7CQA9OwgiRjnrSXxuz6XLh6JvYyWhEDMEKt73Knnu4HcvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78mntRTSCRTHmUQ3AnS41MhIN4wuy2oYNTFrSsuuIv4=;
 b=fRTNUhaT1taUtY0GfIMD7ZVzT0mrmXe+MvMluXhG+8F3PYow4Ro66Ml8jkhDlepuOhsbPay97rSIBXg9jN1htVYNebPQrL8Qfhzpv2j/EB86kDbRbzSROgvR5KubzcmBX2gy2ChD8graZ0Zhmd8aJv2V3ayOWGKPRfH0NV6Xl0D4GFTdKlYvz8/CJL7pem/y59qGAJXpL92AJA1mqJW/hkQyoi2LxWLcaw1J9lYcxLIn6rNzYDmula/hinp9m31klf483VUOEFRL6If4khlxeJnmcCOb5LPBh4OvrSR14g1weqi9gxN9EG/Zse55cjoX7nFTc6ynaozbp0uREN5h3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78mntRTSCRTHmUQ3AnS41MhIN4wuy2oYNTFrSsuuIv4=;
 b=L3qAFFqS/7VPQrsGybe3Ak0o90Zg2iulOQ6xIjsrxkdTkJu9T/IpLVzpIkxcZ6Etrbo/D7Otg+D/sn0Mr32TrjOaGa5KUxpN/51Or7c2gLTVFSQaX34C8uSpRyTFrcm3d7gXcyuSp/Fc9HbjOSxjdoKKuiKtbfZauJ0gCHTXCmQuA02SlBxBqRtGayz/Q7waGiAN6u9+x7yfAKupiMucoUlQXWL9yuD5hQMkltX5YHwzc0CwNgbZTGSxn2P43KPW3bY68UL4ckm4J0d6rwj75+B+H0DpiQ4RpuyO9tn2nXj4OSO7hL317DDrzLbD526SIBSPOJbZEil+vy/5xzqeZA==
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA4PR04MB7566.eurprd04.prod.outlook.com (2603:10a6:102:f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 01:43:49 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 01:43:49 +0000
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
Subject: RE: [EXT] [PATCH 14/65] media: amphion: Delete v4l2_fh synchronously
 in .release()
Thread-Topic: [EXT] [PATCH 14/65] media: amphion: Delete v4l2_fh synchronously
 in .release()
Thread-Index: AQHcA49v/WX5kK4uE0Wf9CSkyY6fEbRTTY5A
Date: Tue, 5 Aug 2025 01:43:48 +0000
Message-ID:
 <PAXPR04MB825428409FEE27E0FEC0BF25E722A@PAXPR04MB8254.eurprd04.prod.outlook.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-14-eb140ddd6a9d@ideasonboard.com>
In-Reply-To: <20250802-media-private-data-v1-14-eb140ddd6a9d@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8254:EE_|PA4PR04MB7566:EE_
x-ms-office365-filtering-correlation-id: f05a0e73-c435-4981-c6c2-08ddd3c1862b
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?YlpkNjBqUlo1YnE3TGlpeHVwRzBpS0NzK3Z6YlFxVHZnK3BMQmZaUXVwcU5X?=
 =?utf-8?B?RU03VGRYeUd0bW9pbVoybnRXdStNbit0OHpzLy9yeWFCQjlhVThQcHlIYTRa?=
 =?utf-8?B?cXZEa01OZDRkeGxCTU5YejViOEtBS0U4a2JDYUVpVGtjaDA3WFRScE1YWmNt?=
 =?utf-8?B?LzFHN0t0SHhscEZSWWpiaksrWFpCNk1NVkMranZKQXhYc2lJTVlDamtoRnFa?=
 =?utf-8?B?UHR6NGs0K3I5d2pXREVmRFp6enZNdStiZjJ1Tzg3MlhLS1RZQjRTR01nTTJH?=
 =?utf-8?B?ejVlVzZ0Z0R5YmpMcGtpb3hlRk9ZMnRRSzZEaEpoZ0RmaDZkbnAzanJYRTZS?=
 =?utf-8?B?WlJJUHZiQkg3NE9JbVpUZmpvMVVXdEVoZWhnSnBjbU1FWlo0RHFpWXFBbUtk?=
 =?utf-8?B?VlU4SlBCOWYyeWo0TU1MMEtZRWpFblZmWE1OK3BjVm1HMkx3R01EMXJMc29O?=
 =?utf-8?B?Q21vUnNDTjZBVWFjelRsdkJkYkVOclN2ZzdkUC9CV0ZsWWN2Q2E2dVhaNXRN?=
 =?utf-8?B?RUtkaEVxTVdlUXNLcDRLdDJtdWVlWmFyK2VmWGN2c29pbksybkQrUDZ5SWJw?=
 =?utf-8?B?Y1Z1YkFra0xpZjN3UExhVVJVd0JMYVp6Sm9nU2FhbkhqY0p2MlM4cThBZXNz?=
 =?utf-8?B?NytmQUNENVhyTk1BLzkrNGplM081cEV3byszMXlDTk1ORnRZY0pLdTFKYTQy?=
 =?utf-8?B?ejlYNzk1WnJjdEE4Z2I0anZReVk5WHJ4ZDF6aGZocFNGNDlMd3dYelFYamxJ?=
 =?utf-8?B?TVJaN09hV3UwbllseUI2V1FBZ0lHU21TKzJudnpBZTJXa3BXWVZLSVY5M0w5?=
 =?utf-8?B?MEhJM1RuRlorZGJEOTJQSWhWUXJOVmViU3gyV2xlOHF1Y0hUSzJUQjY5WjdT?=
 =?utf-8?B?SjA4SDJkeno3UVRSU3N4Mjc3Y3FURnJ6a1Z4cUVYYytXQmg0WENzemtHUHFI?=
 =?utf-8?B?bGhFclVrTm5DcDFEakpsRHpRZ1JtV3daNDZISU92TlJyTFh2c0RjVlhtcUNn?=
 =?utf-8?B?ZW43dGpNR2ZnZkxPVHJYTjhtK1VZSHd6VWlVaWViRWlZSEdNY09zeHpjaXZH?=
 =?utf-8?B?eGwrWVJqbEc5K3c2UnVBWEZKSjIzMzlOc3V1ckFlWmtGQmNxeDhRRFdTTldN?=
 =?utf-8?B?YUFGeHFkWmt2ZDY2NWJxZ0lZQXhrMHpjZ1p4cTAzY1JWMVNVanVacmtsMEJW?=
 =?utf-8?B?bXd3enF6MmhHaGE2czZ5VUJUWXZ5MHJ5TW1iVzdNemUxNDdtMDFuMmRIZllQ?=
 =?utf-8?B?WHVmNnE1QStIcXdDdElVd1dqKzJhcWNzVWo4L3o5cGJQVWdzK25VUmcva2Ns?=
 =?utf-8?B?aW9XWWs5TTM0NDVuNFl1cUozeGk5WTN0VkU0Z0JvU09BdUt3ZTdLVW1yRUQy?=
 =?utf-8?B?S0ZMQUNnb1B2ZmZ0Y0ZSSC8wME9uaElCUnQ4bTlBVHVYL0pET0liRitqa2Ny?=
 =?utf-8?B?QTFldHVtQnR6aG82Wmd5NDYvN3NJenJQQWpYdFRNUkRhZmNkeVpvWDNkdWU0?=
 =?utf-8?B?REo1MFNEZStIanJ5aUpxQzc2ZVFNdFI1UUpIelF2RE8zaC9LdXNyTXBEbkFn?=
 =?utf-8?B?N3BmRHNzVFJSM2Urd1MxS2ZvYnZPWkdIMUo4RHNhUlpTODdGbFp0Zk91cHFQ?=
 =?utf-8?B?QWFTNzBGbUJ5Tk1LbnFGTXQyRjNTUW5BNWtrL2tRYnk4QUdiOUhzYjcwdUxq?=
 =?utf-8?B?RDU4T2ZpTFhaRGsyWWUzUE0vZGdKcFhCNTltVFFCdU1CSnVhRG9WRmoveHhV?=
 =?utf-8?B?cGxEa05yeFJFOFZmODlDd0dkbmxKRkZwci9PaktNajJHclFJV25qY3JzM2hw?=
 =?utf-8?B?cU5tVGpBYU9wMWI3K1VnWW41ZzkrTHhIbXZQZG1XNURMbDZ1aXAwQzA2d2tU?=
 =?utf-8?B?T0ZoV3lwYW5ZemU3aWx1Y2ZVdFE4ZStnVkJiWC81UzdiQ2sxZlgxYk5aSzJo?=
 =?utf-8?B?K1FDU0FqYmNGdmVYMHArV2VhbVdlcUlHWGZVMEtaMXdGcFFBZ1ZPenhFcWtB?=
 =?utf-8?Q?kNR7PJexvau2oIoe0KGZYaay+A3F58=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3dUa25OaXFmcC9rUERIWE1wMWt0NkxrelZVVjZCUWtYR2VDRGk2UkZLOHg3?=
 =?utf-8?B?c1M1c1VkV1ZiWGJ5Yll1TEpNWmRRZTZiRitYczdYUSsxWmlWWkUwaFdQMnFz?=
 =?utf-8?B?aGxpWEg2Z1ZuQ3g2SlVFSkJSbG9HQUxZaVpOZ05vRWV3NUZheE8xTW5yTmxS?=
 =?utf-8?B?cW0ybExUb0xlblBzaFAycVBPbTRlYjRyVVpwd0IrTnRid2R6UGs4T3k5RSs4?=
 =?utf-8?B?QmprbHZIVzVIR3ZnQlJKeDlwWm9JcDV1TUU2Zyt2SCtjUXlvQ2k2ajcvdGYy?=
 =?utf-8?B?bXBZb3liaG9hd1grTTdwNmJwL21PaU55b0VISFAzdjBUaFE4UFNvN2hOVVFV?=
 =?utf-8?B?NS94NHBYU1VNK3Q4YUQyL1QzTUVxWTB5V2hlaXJFZDU5Tk43QkxLNkw2WWFP?=
 =?utf-8?B?ZmFVUFFUYnFTY0lDRk4vVkVCbmZMakF0V2NFeStILzZOeE5ySVZrSGlTbThV?=
 =?utf-8?B?a1Fzb0g5blcvQlYzR1JVZjJXOFZIaXNHU2VhOUE5c2Fuak1IWVJWQVI1NUQ5?=
 =?utf-8?B?RUNiTHRYVjhVUzhBdHBjNHE5UHBRMGdEbUFkWUh4dmNTaW9kSjlFcVpCNjUy?=
 =?utf-8?B?ZEUveGRrOTJ2Yjg4eGQ1YlBHMnU4MDMvYVc2TW1pbkdGMVM1N1RoeXdwLzFJ?=
 =?utf-8?B?OEkydytOME5kVlhjcXpxbXJTWXoyRXZ3SXJ2Qk54TkZxaXphMHA4VU1OTHE1?=
 =?utf-8?B?cHpNcSthenphWHN4aVdmWk5Mc2VRVVNsNTNnQkpsQWR2TmhKMW9SRExSb2oz?=
 =?utf-8?B?VTN1Z08rcHZOWE1KMm9QSUxmUURIemEyNS9vVGlKYXdWa1I5L1lOWFMzUmEw?=
 =?utf-8?B?NTNWdzJlV2JWN3p2ekxVSUJmbXk3YXFiMGtDMWl3blVDMGZxemRmYldyRk1U?=
 =?utf-8?B?SDdEVW03SXMrRHFrc0g3MHh6N0RqRThHQnZHTnpQbzNTS1F1ajg4SmFNMy9a?=
 =?utf-8?B?bHZLSFd5dms3OXI3RnZIRU9SWXdHUGFXNG1URTFOWU8vc3d0SEhwL0VmVWhV?=
 =?utf-8?B?Rjd6WGU2UEN3NWkyQlpSWWwwSWF4UDB5TEVpYjY5TlJHN0J6Ulc0YWs1Vmhm?=
 =?utf-8?B?YW5USjMrcjd5UlBIMkZXU0NMTWNWOWlkRlNwR1NXbWpGREJjMHlBRFVOUUFM?=
 =?utf-8?B?cFlCZEVBVjdPdXBVYWEvbzJnRVNFK1YyMmRid29pZjMrZFpmRnNycTdYM2Fr?=
 =?utf-8?B?OUtIZTlaRCt3cmxRTENTM3czVlBUY2w2anRxRm5mYUptMlZkay9zcStSM0FU?=
 =?utf-8?B?RUZ6Z0RZZFBPaW1aZTNJZVNRZk5CVFhPY2QrWnczVXlyQk5pencyQm9TWlFW?=
 =?utf-8?B?UWkvcTArbzZScUdjZkF4aHE1ZS8yeVVoNXl1SWdWYlNscW9uQVh4aTUydTNx?=
 =?utf-8?B?VnYwTk9kUXlrOUhWa2Q0eVFnK0JmOFJqSHAzSWE4MjdXU0UrcjA2cmVGQUR2?=
 =?utf-8?B?Ty9SUVpiZ3dBUGgwbTFYcnFpY3VoQ1pqM3JteW1sS2JXZ3J4c0FqbnNKK1pt?=
 =?utf-8?B?bXNzdHM4T0lLODBhQlRyY0xMVlZKb0FMYU41N3VuWmVvZzRMdzREY3JKUEJX?=
 =?utf-8?B?RWRTaml4dmN2d3B0dE9LQzVMbGRzOGw5aWw2OE8zNFY2SEE5MzRoT0wwdXlX?=
 =?utf-8?B?UUorZU5yME5IbU1pR011RWtVa1dUNmtqVGp0NVFLZWh2UmdOLzRaaFh6WkZm?=
 =?utf-8?B?eXFzUEdZWWJZMTdibk1acnovQnpMdzk5YSs4MkNjem9SejFTL3pLTXN3TElR?=
 =?utf-8?B?OTFyZFRkY01wb284TytqaW9RdHlJYktqNVIxREFqSy8vRmI5NXcrc05vZXNS?=
 =?utf-8?B?ZXJ2WUlPSmw5b3JjcXdrVXdJTVVVc1dWUkd3TWFsNzR6WnRsTzVrTEFRZGZC?=
 =?utf-8?B?eE1FS01HZkJkd0VyUmthcDRmSkh6eXJQdjdWZ0NMaUZDU0gwUm04Wkh6cGI2?=
 =?utf-8?B?RUtDejBNaVdLSERvdVhuT3B3SDYwbFZqWStxZy9DcWt2RHNzOW4zci9UYWxO?=
 =?utf-8?B?bWc4bGgvZUltRmxSMU5McFlHSHkrcWU2QlRWREsvV25QK0g2eVBIVXlNL0Rv?=
 =?utf-8?B?cTZRZnB0dEhyK3VTQi82RWlyekxueFh0aUYzcWs4QnZqcVFESkc2RldLeFZS?=
 =?utf-8?Q?2YqE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f05a0e73-c435-4981-c6c2-08ddd3c1862b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 01:43:48.9564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ChIIsPXOScry7eZ1PfNj71p0wUke5X4blofYS+Nyg2HlOw0MiJLQh6LC8qQgteKJzH6a7Pn8icj3FBZichMag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7566

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
DQo+U3ViamVjdDogW0VYVF0gW1BBVENIIDE0LzY1XSBtZWRpYTogYW1waGlvbjogRGVsZXRlIHY0
bDJfZmggc3luY2hyb25vdXNseQ0KPmluIC5yZWxlYXNlKCkNCj4NCj5DYXV0aW9uOiBUaGlzIGlz
IGFuIGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mg
b3INCj5vcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3Nh
Z2UgdXNpbmcgdGhlICdSZXBvcnQNCj50aGlzIGVtYWlsJyBidXR0b24NCj4NCj4NCj5Gcm9tOiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+DQo+
VGhlIHY0bDJfZmggaW5pdGlhbGl6ZWQgYW5kIGFkZGVkIGluIHZwdV92NGwyX29wZW4oKSBpcyBk
ZWxldGUgYW5kIGNsZWFuZWQgdXANCj53aGVuIHRoZSBsYXN0IHJlZmVyZW5jZSB0byB0aGUgdnB1
X2luc3QgaXMgcmVsZWFzZWQuIFRoaXMgbWF5IGhhcHBlbiBsYXRlciB0aGFuDQo+YXQgdnB1X3Y0
bDJfY2xvc2UoKSB0aW1lLg0KPg0KPk5vdCBkZWxldGluZyBhbmQgY2xlYW5pbmcgdXAgdGhlIHY0
bDJfZmggd2hlbiBjbG9zaW5nIHRoZSBmaWxlIGhhbmRsZSB0byB0aGUNCj52aWRlbyBkZXZpY2Ug
aXMgbm90IGlkZWFsLCBhcyB0aGUgdjRsMl9maCB3aWxsIHN0aWxsIGJlIHByZXNlbnQgaW4gdGhl
IHZpZGVvIGRldmljZSdzDQo+ZmhfbGlzdCwgYW5kIHdpbGwgc3RvcmUgYSBjb3B5IG9mIGV2ZW50
cyBxdWV1ZWQgdG8gdGhlIHZpZGVvIGRldmljZS4gVGhlcmUgbWF5DQo+YWxzbyBiZSBvdGhlciBz
aWRlIGVmZmVjdHMgb2Yga2VlcGluZyBhbGl2ZSBhbiBvYmplY3QgdGhhdCByZXByZXNlbnRzIGFu
IG9wZW4gZmlsZQ0KPmhhbmRsZSBhZnRlciB0aGUgZmlsZSBoYW5kbGUgaXMgY2xvc2VkLg0KPg0K
PlRoZSB2NGwyX2ZoIGluc3RhbmNlIGlzIGVtYmVkZGVkIGluIHRoZSB2cHVfaW5zdCBzdHJ1Y3R1
cmUsIGFuZCBpcyBhY2Nlc3NlZCBpbg0KPnR3byBkaWZmZXJlbnQgd2F5czoNCj4NCj4tIGluIHZw
dV9ub3RpZnlfZW9zKCkgYW5kIHZwdV9ub3RpZnlfc291cmNlX2NoYW5nZSgpLCB0byBxdWV1ZSBW
NEwyDQo+ICBldmVudHMgdG8gdGhlIGZpbGUgaGFuZGxlIDsgYW5kDQo+DQo+LSB0aHJvdWdoIHRo
ZSBkcml2ZXIgdG8gYWNjZXNzIHRoZSB2NGwyX2ZoLm0ybV9jdHggcG9pbnRlci4NCj4NCj5UaGUg
djRsMl9maC5tMm1fY3R4IHBvaW50ZXIgaXMgbm90IHRvdWNoZWQgYnkgdjRsMl9maF9kZWwoKSBh
bmQNCj52NGwyX2ZoX2V4aXQoKS4gSXQgaXMgc2V0IHRvIE5VTEwgYnkgdGhlIGRyaXZlciB3aGVu
IGNsb3NpbmcgdGhlIGZpbGUgaGFuZGxlLCBpbg0KPnZwdV92NGwyX2Nsb3NlKCkuDQo+DQo+VGhl
IHZwdV9ub3RpZnlfZW9zKCkgYW5kIHZwdV9ub3RpZnlfc291cmNlX2NoYW5nZSgpIGZ1bmN0aW9u
cyBhcmUgY2FsbGVkIGluDQo+dnB1X3NldF9sYXN0X2J1ZmZlcl9kZXF1ZXVlZCgpIGFuZCB2ZGVj
X2hhbmRsZV9yZXNvbHV0aW9uX2NoYW5nZSgpDQo+cmVzcGVjdGl2ZWx5LCBvbmx5IGlmIHRoZSB2
NGwyX2ZoLm0ybV9jdHggcG9pbnRlciBpcyBub3QgTlVMTC4gVGhlcmUgaXMgdGhlcmVmb3JlDQo+
YSBndWFyYW50ZWUgdGhhdCBubyBuZXcgZXZlbnQgd2lsbCBiZSBxdWV1ZWQgdG8gdGhlIHY0bDJf
ZmggYWZ0ZXINCj52cHVfdjRsMl9jbG9zZSgpIGRlc3Ryb3lzIHRoZSBtMm1fY3R4Lg0KPg0KPlRo
ZSB2cHVfbm90aWZ5X2VvcygpIGZ1bmN0aW9uIGlzIGFsc28gY2FsbGVkIGZyb20gdnB1X3ZiMl9i
dWZfZmluaXNoKCksIHdoaWNoDQo+aXMgZ3VhcmFudGVlZCB0byBiZSBjYWxsZWQgZm9yIGFsbCBx
dWV1ZWQgYnVmZmVycyB3aGVuDQo+dnB1X3Y0bDJfY2xvc2UoKSBjYWxscyB2NGwyX20ybV9jdHhf
cmVsZWFzZSgpLCBhbmQgd2lsbCBub3QgYmUgY2FsbGVkIGxhdGVyLg0KPg0KPkl0IGlzIHRoZXJl
Zm9yZSBzYWZlIHRvIGFzc3VtZSB0aGF0IHRoZSBkcml2ZXIgd2lsbCBub3QgdG91Y2ggdGhlIHY0
bDJfZmgsIGV4Y2VwdA0KPnRvIGNoZWNrIHRoZSBtMm1fY3R4IHBvaW50ZXIsIGFmdGVyIHZwdV92
NGwyX2Nsb3NlKCkgZGVzdHJveXMgdGhlIG0ybV9jdHguDQo+V2UgY2FuIHNhZmVseSBkZWxldGUg
YW5kIGNsZWFudXAgdGhlIHY0bDJfZmggc3luY2hyb25vdXNseSBpbg0KPnZwdV92NGwyX2Nsb3Nl
KCkuDQo+DQo+U2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPlNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3Bv
Lm1vbmRpQGlkZWFzb25ib2FyZC5jb20+DQoNClJldmlld2VkLWJ5OiBNaW5nIFFpYW4gPG1pbmcu
cWlhbkBvc3MubnhwLmNvbT4NCg0KPi0tLQ0KPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhp
b24vdnB1X3Y0bDIuYyB8IDcgKysrKystLQ0KPiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL2FtcGhpb24vdnB1X3Y0bDIuYw0KPmIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9u
L3ZwdV92NGwyLmMNCj5pbmRleA0KPjMwNmQ5NGUwZjhlNzlmYWFhY2ZhMzViMjhlNTc4Njg2MGY3
YmQxY2EuLjU3Y2E2MjYyYmIwNGIzNTZhODVlMjE3ZWYNCj41MWNmYjEzY2I5YTBhMzYgMTAwNjQ0
DQo+LS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3ZwdV92NGwyLmMNCj4rKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhpb24vdnB1X3Y0bDIuYw0KPkBAIC03MjQsOCAr
NzI0LDYgQEAgc3RhdGljIGludCB2cHVfdjRsMl9yZWxlYXNlKHN0cnVjdCB2cHVfaW5zdCAqaW5z
dCkNCj4NCj4gICAgICAgIHY0bDJfY3RybF9oYW5kbGVyX2ZyZWUoJmluc3QtPmN0cmxfaGFuZGxl
cik7DQo+ICAgICAgICBtdXRleF9kZXN0cm95KCZpbnN0LT5sb2NrKTsNCj4tICAgICAgIHY0bDJf
ZmhfZGVsKCZpbnN0LT5maCk7DQo+LSAgICAgICB2NGwyX2ZoX2V4aXQoJmluc3QtPmZoKTsNCj4N
Cj4gICAgICAgIGNhbGxfdm9pZF92b3AoaW5zdCwgY2xlYW51cCk7DQo+DQo+QEAgLTc5NCw2ICs3
OTIsOCBAQCBpbnQgdnB1X3Y0bDJfb3BlbihzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHZwdV9p
bnN0DQo+Kmluc3QpDQo+DQo+ICAgICAgICByZXR1cm4gMDsNCj4gZXJyb3I6DQo+KyAgICAgICB2
NGwyX2ZoX2RlbCgmaW5zdC0+ZmgpOw0KPisgICAgICAgdjRsMl9maF9leGl0KCZpbnN0LT5maCk7
DQo+ICAgICAgICB2cHVfaW5zdF9wdXQoaW5zdCk7DQo+ICAgICAgICByZXR1cm4gcmV0Ow0KPiB9
DQo+QEAgLTgxMyw2ICs4MTMsOSBAQCBpbnQgdnB1X3Y0bDJfY2xvc2Uoc3RydWN0IGZpbGUgKmZp
bGUpDQo+ICAgICAgICBjYWxsX3ZvaWRfdm9wKGluc3QsIHJlbGVhc2UpOw0KPiAgICAgICAgdnB1
X2luc3RfdW5sb2NrKGluc3QpOw0KPg0KPisgICAgICAgdjRsMl9maF9kZWwoJmluc3QtPmZoKTsN
Cj4rICAgICAgIHY0bDJfZmhfZXhpdCgmaW5zdC0+ZmgpOw0KPisNCj4gICAgICAgIHZwdV9pbnN0
X3VucmVnaXN0ZXIoaW5zdCk7DQo+ICAgICAgICB2cHVfaW5zdF9wdXQoaW5zdCk7DQo+DQo+DQo+
LS0NCj4yLjQ5LjANCg0K

