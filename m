Return-Path: <linux-media+bounces-39081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF5B1E011
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 03:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D14415839C5
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 01:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329E335966;
	Fri,  8 Aug 2025 01:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RT3Ya/YD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D322E36E2;
	Fri,  8 Aug 2025 01:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754614901; cv=fail; b=ENwjzucPaprIZ+aJLAQBLigGTgvKbXkUgLSpkQ0Ts4hvG5NB+AQ48TtJz4PeoDAhaD5gcuuwBj74VY1ecESlaenjAQKXFtbcP2cQAqdR9NcMi+Qlu0AXJdTXm7VxgHIhVFo8Y180X6gCmQX5s1qMDCBrlW7CwdOWAlqS6W9/uq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754614901; c=relaxed/simple;
	bh=/AE3nHQRhPCThMc8Nswln4VLZKr9y8dChSuGg3kl/js=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nUyIT+6RoZvkZfQdC+peOXcMDoy7iUDGRtOWoodgvPR7jsCkq9SChWA1LexoFdm+QLzGJcu9w6l0t93x0PvWXRvnWw5o7K+rkX/D728aFkBE8hvskCWhTTMsEwQizZSuEjarsA09k6R/s1b9+W6GvaXcDqDYt4wYGiVTQZPYwl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RT3Ya/YD; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754614899; x=1786150899;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/AE3nHQRhPCThMc8Nswln4VLZKr9y8dChSuGg3kl/js=;
  b=RT3Ya/YDRhhqCXACtzehACqVEYOmhh4kRekv3xT+KIItX5uqrLww0Fim
   1naddPdREt14wdLiI1oCB9vlZRIT273Zo5+ZtST9bCcQ8HCKnInFrXIyI
   a7Aln03/sdSqaXGOq6jMaiC0Bre1nEzcQm/wLp+W1Js6H5uWAc0XLh150
   n+xK6NhWPqcWiGx0T+9h6rIvSPT+Rm28bdOgWdFn1b9PUghnzBNKW/20c
   M3jsns5ADXhE/+G+sMhqnhmpOga1tMqUCUrYUT3SQaxKNVJz3Vyk14YC9
   jBE4mySV73HOvMNg6GFaSkunObpRQKuG3GHAI8E05DbkO3I0/pt4XFlTt
   g==;
X-CSE-ConnectionGUID: QPMlrKKyQ+u0yD+zinepRw==
X-CSE-MsgGUID: z0RS97VkQlyLKGq2VsH6FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79517688"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="79517688"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 18:01:37 -0700
X-CSE-ConnectionGUID: qhcz+EOqSDa4RlWTo0As9w==
X-CSE-MsgGUID: jCJBUOsyTs+elydHHZB2rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164440719"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 18:01:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 18:01:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 18:01:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 7 Aug 2025 18:01:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHhW4QFBsQf3JIgMml0LAOIP48Loz0T8AClaQAdj65YcRbClOGJ5NDBdvSJp9/bOd1iAq6Sz8ZphRPi2Hg9wcF/4S6/w1DFtFTAgLeXa6XCrxqKGV45yeiwO18QrKlOppmrb0uDfPomzFqnQUv6UpCX8lxzNiNE5hqOI2IL5AiHV0slmpGExjtroWgcauGr7uhlaXJtfl0EZ+Fk+FHsHWSHKkaaJ51h2S8a3k1iI93eNSlxva/JLjih8h09EGPlSk9vg9n0cf7f8aq7Y4qYS/nXqUc4gzygttshYbUlqGIVEUjv0kGfbzwcrGkHMa5mgHhV4mpOVEzLKaEUhVlhR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AE3nHQRhPCThMc8Nswln4VLZKr9y8dChSuGg3kl/js=;
 b=DDG2PZrLirOYsmzaTgAnd7KgIOjgjxj/asL072iAuNlM9pBpwuI2P7E3misFPadgfc38AcvehqwiUbMN1ooYl2RDJgHuRjzg3eHhk0q7BWMX/LzD19DwIbvdnETdf+b0J5xm06lD+m69B7mfxWHL/8qo1mEzLxdOkPzGNHZpUx1d2yL932uB4chG5F7CjcGe+slxrPPpFPBYDfTuQvZVqrhxyYYGMsb+/nTOIiw5yTdvI2GGb4E3WTuvIhaAS2Ag6fFrwL2mZC/kUh8gf7ktxVvW0dxi0WrDExURcn4t66eJoPl52kdobE6QEowLLLYA5jWOKjeUAFhaVhUAHmiA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CO1PR11MB4915.namprd11.prod.outlook.com (2603:10b6:303:93::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.15; Fri, 8 Aug 2025 01:01:33 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%4]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 01:01:33 +0000
From: "Cao, Bingbu" <bingbu.cao@intel.com>
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
	<m.szyprowski@samsung.com>, Andy Walls <awalls@md.metrocast.net>, "Michael
 Tretter" <m.tretter@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Bin Liu <bin.liu@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Dmitry Osipenko
	<digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio
 Estevam <festevam@gmail.com>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Michal Simek
	<michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>, Zhou Peng
	<eagle.zhou@nxp.com>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>, Abhinav Kumar
	<abhinav.kumar@linux.dev>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
	<samuel@sholland.org>, Daniel Almeida <daniel.almeida@collabora.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>, Minghsiu Tsai
	<minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Jacob Chen
	<jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova
	<detlev.casanova@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, =?utf-8?B?xYF1a2FzeiBTdGVsbWFjaA==?=
	<l.stelmach@samsung.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, "Hajda, Andrzej"
	<andrzej.hajda@intel.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Jean-Christophe Trotin
	<jean-christophe.trotin@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Steve Longerbeam <slongerbeam@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, "Robert
 Foss" <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>, Corentin Labbe
	<clabbe@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, "Qiu,
 Tian Shu" <tian.shu.qiu@intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
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
Subject: RE: [PATCH 63/65] media: ipu6: isys: Don't set V4L2_FL_USES_V4L2_FH
 manually
Thread-Topic: [PATCH 63/65] media: ipu6: isys: Don't set V4L2_FL_USES_V4L2_FH
 manually
Thread-Index: AQHcA5CfGc1/s5WMDUaFpKl0jNuNK7RX+FFA
Date: Fri, 8 Aug 2025 01:01:33 +0000
Message-ID: <DM8PR11MB565351DA0F5BE96C5514C3B9992FA@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-63-eb140ddd6a9d@ideasonboard.com>
In-Reply-To: <20250802-media-private-data-v1-63-eb140ddd6a9d@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|CO1PR11MB4915:EE_
x-ms-office365-filtering-correlation-id: 6309bbb9-71b9-44aa-abd3-08ddd6171dec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dUkrWHYvRms2N1BjOTU3NXJCYW95aERzaXBFWi9YNzFrRnhUamNuSWxWVXV5?=
 =?utf-8?B?RHZNTDFpNEFKVW90c3V3TndBYStLcUNnS1p3L0h2ZXZPZXFmZGRKTGhqcDFh?=
 =?utf-8?B?Si9BM1Z0dmgvTWVFUUVHMFZXOFVLdHEweGttRHpudkp0OXkrUVhjQXFBZHU1?=
 =?utf-8?B?VXA4NDV0RVFUb3hjSW1pQTRzcnFMdHVOcFdtK09Pc2tpWkRSV0JQNDJjMkRI?=
 =?utf-8?B?cjRwZnl5OHBFaktMUGVHTzk0a01qU1JDOW5ZczFLaE9idWZ0K1RUWmNmbVpn?=
 =?utf-8?B?UUp0NVcyUjhKcURqS1BXZlJrWU15MXdNQUc2SEJ3V001cHAzOXhRL3pJSEda?=
 =?utf-8?B?UVZma2pFZUpYcytIQTBKeEFEVEVMS3R4a01hYnpDdVRRWEhVUlpZS0VOdC94?=
 =?utf-8?B?UXYvU1R2SFhveUNXRUUyZUs4S2pBaHU2d3p3VHNmL0hMa2tudDI1cGFDNnd3?=
 =?utf-8?B?MkIxUi9EQXdRNkZnbkhCQnZXbVNubitqb3ZkNkdCYjMyZzFDRHpvUlkwMGV3?=
 =?utf-8?B?Y3k1Vlk4cXNJYXlSWXNwdHJFNjZ4NUkvV0VPMm1XWG45K1BUZzVHcFZWYWJE?=
 =?utf-8?B?dVI0Q1lPLzlIY0RkNWVGM3I2WkoxVVd6VWZ0d2xndkx1cXVsT1dwL01DRWMw?=
 =?utf-8?B?UzdJMFJZcVhZZmkzY0NIK2ZjbWpZUjcrZFg5S3RZOXM0emVLOUlFNHJHMjRW?=
 =?utf-8?B?N08vSjIxUkg5SkVaNzFDcHgvWWlBM3BzNm9hSkN1aDIrc0JJNWRRYWNCcGIx?=
 =?utf-8?B?QkQ2QkEyc2lGcDhFR3JBSHgyNkpoNEtIbmgxcHRMQVBTZFlZNEJsdTR6Y1Ra?=
 =?utf-8?B?akRGSEJnVmlTajg3ZnZlTHZSRWdmS0RXODV0WlVnVmYyZHZPNUI0b3N0Y0Uw?=
 =?utf-8?B?VjNxZzVJTzZGWDNFeEpEdnV5YzNmRU5EMG4rT20zUDNJaG55eUljUzVJSzNl?=
 =?utf-8?B?cVMzRERtb25yWUNvMm9GdTBaZWZQbjRic0g3dFVqYWVmOVNjWkNlUlQ1QVRB?=
 =?utf-8?B?M004Kzh4ZlJvRUo0WXBzZzNlZGxBSVJieHNrMEhxYk9MdWM3SmpuU0dqcHpR?=
 =?utf-8?B?N24xaXF2S1o3NXoyZWRPb3Z2cW9QelM2S0xhZ2pIVVdQVGxuWS9GTTVZUWFj?=
 =?utf-8?B?N204RFlXMTNsR012dVM3Ykd0T3UyU293b3ZRZCtFNVIxWk9FMVIxMXBIWmUv?=
 =?utf-8?B?ajZyL3lCYm9kRFhFKy82YlNkN1JicFdFc1FmVjA2UVV4M2VpUXprdkpWUlgv?=
 =?utf-8?B?SzZBdmp1aUNta3JlSVlwLzJOWDBlSDBxZnloS2Q2dlVjdzVHOThMT1VBZXpF?=
 =?utf-8?B?L2kxUWJxNTY1TU5XRTNEM3owUGdaeGozTEhxUUJCckFiTDdhUENua2gyQTh2?=
 =?utf-8?B?WnJaT01BbjBWOGNVcTNSVlR1MElac0pKSGhuUURwTWtmTmN4ZkhmaDErTklH?=
 =?utf-8?B?ZGh3N2JSb2pJZ1pCRjN6cEo0MFZybmdnYXhvUjZhZFlTVkIyYXRLRGFFM29i?=
 =?utf-8?B?KzVGYWpDVFVZVTJzRzd2TEx0eVhZUGkrM0JpbmxpZTdHaW5CVVNidHppMjUw?=
 =?utf-8?B?dk5Gais2eCtFK3ZTVTVCbVEyNFdWWVQ5SUVwM0huS2JPVTQrUzlER28vV1Bi?=
 =?utf-8?B?bEVKQ0M4bDVUY3VlSHBUUGNYVGxhcE5Wc1JjQ2Jhd05jRlg5OW1sVjk0ZHJi?=
 =?utf-8?B?WGVIdjBBdDlhVXFORExsN0pPRmhyVVNLbHVobkkrNGJjSzRRbUJmVW1RaFVI?=
 =?utf-8?B?UFo3L1lrM05qUWkxTGIyTzVKeWZ6SHRFalFtOUxkdVcwT2hvNGxBQkxFNCty?=
 =?utf-8?B?U0drcWh3MCs2R3QydEk5NnkyaG1ZTW9YY3E1WVB3azVWc1c4alFJcXNrZGhH?=
 =?utf-8?B?OThpcGZzMjlIbFFKRjN0MmZuNjI2eFB2RFZyWGY5OTNTaGRBTlErVjQxenM3?=
 =?utf-8?B?eGllY21IOEdsWmgwVlpoLzRsZVNRL0d0YVhBNlcrMjYxOVk3RXJ1TkxHUWNh?=
 =?utf-8?Q?hGSc9GP4fWW+/zHiqdYAQ4vObI4vLY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEpldGNOSmtieHVlTUUwMzZZQTFEVzZBNkppaGYwbENQa294RkFoY1I4bmhW?=
 =?utf-8?B?bjBRcmNKNlJ4cm5zZEFVeVhMUDkwT01IaXh4RTRYTWZFbkphclRRZUY1Szda?=
 =?utf-8?B?dEtxZFNJQWJDbkJtVFBKVkpXR2JHZzRzQ0cxalgrNElLTFllVk01d0lMNGVi?=
 =?utf-8?B?NG5RTENvbEI0WkF1eXFDbFJWcnVSVEVBNnlVa0pqN1lGVEw2NFFlaks2WVhQ?=
 =?utf-8?B?c09ES1BiTFQ0eHNZM3d0ZkFGUkpwOTRWbXZ5clNUWWUyYWFtc1l1ZGVEbG5D?=
 =?utf-8?B?OEhZSnR4Q1ZsOHVZc1k0dUhCQlFlZnhpR0NXemZuUnBUdDlBbEVzM1ZUWTA4?=
 =?utf-8?B?cW9LYWNVQWVYL1h0L2pWaE1TUWJyTGdoNmQwcHZxQmVkQkdHNXpnQW4zRElE?=
 =?utf-8?B?MXNWQnFWSnovRmlXRlY3OUlUREMrRjJDeTk1TnlZN2JpNW03TkhvaHhDMUpy?=
 =?utf-8?B?aUk5d1hqcmltc2prbS8zdXU3ZUx1a0J3VHh2Wks0MWQwUlpQWVhSd1owSllt?=
 =?utf-8?B?dnViUnJRMVBwU1R4ZW5CWVBsMExlTXROTENqNGF2Y3VPdkF1Skg3TjFpK0Er?=
 =?utf-8?B?UmVmRTB1YXNRbmdORHVHVW5kekM4a3NtYXZZQU9nTm9lTHZIVXE0R0pIdnRR?=
 =?utf-8?B?c2xneHc1RzZwRVJzOHNZRnFOZ2R3MklSUVVQVTFaNW1qMlNJazBuVnBpZTIv?=
 =?utf-8?B?LyswUHBmWVhpM0RKU3dieWsxZXhaNVVOVHg1MU5qWDVlZlZwNVJLZTNQOTc2?=
 =?utf-8?B?V2Z1QTV3SHJFWVlaMloxcnYzbFBnZzZtUllPNUdZZDhRbnNFei9rMjUxcGF3?=
 =?utf-8?B?c1Qva0dMaDE0STFVeXk3SS9qNEZ2c1ViTzRSdmdTNVd0Q0tKZ1BRYjJxb1NP?=
 =?utf-8?B?ZTUzWFhUK0ZOVUlTOE9CT1MxYVZwcWY0TW5MRld3akgzQkxaajdrQWV0MlE3?=
 =?utf-8?B?U1pVMHFkM3hQaGJROTlncVRJc2lCTUVadHAwMHdFb09tZEUwQkxydzd4TW1X?=
 =?utf-8?B?WTVHRWpqaXJGdms2cmpwNlFjc0xGK240NVQwZ1Z3SEUxZW5uUTB1cjZtd1gx?=
 =?utf-8?B?N2pselp1Zm9jTzRROFhWWFVkVDNBYy82K2V4YVR3aEplQmRPZ3l2dGNDR3FM?=
 =?utf-8?B?UW5SV09ZRXBVL0Ftb0UrV0lreEVGMEtreEJhcTJQeGVNek9SbU5RbzNBQ0R2?=
 =?utf-8?B?eUliY2tma0lqRi9KQW5kc3Qwb05WMXpGNXliME9DZ1FKMVY4bEpQWmhEa1RZ?=
 =?utf-8?B?bXRGTmNnbzhMUFR2Y3hjNGt2OWtpSHcxc0FmTFQ3QlR3VWlCS0g5S1JFMkpO?=
 =?utf-8?B?dzRxNmFzajhCdlRGWExwcHZxNlpxaG1uWUpFRDgrb0RaVU0rUVBMOGttV0Ju?=
 =?utf-8?B?ckJwcHVBRFplU25yeXhUcDkxeTV4TW9Rb01kZ2dCTnlIK0s0cU5zeXROb2tQ?=
 =?utf-8?B?b2I0SXZxRWU5LzdkNzQzMUR1cXhXQjZCZFZXZDZrUFp6ckFMbC9UNVVXWVhv?=
 =?utf-8?B?L3VPNmtaNWZWbnZ2UXNlcmZ4WDJCTmlnWmpBNXRRZnNNVEd0N0hjTi9hdVZS?=
 =?utf-8?B?OXRSQzQwOTZsQzdNaHVKNjNNVkNNZFlTdjVrVENsM1hHRTVaTnllS3Y4K0pQ?=
 =?utf-8?B?SGtJa0cxbDZGZmtjMGtURFpuMERCblBXcDE4NnJUNFRPem1IRVBKQmpEZDEy?=
 =?utf-8?B?RDB0WjlNSHhWRE90ZlVCdUJ2MjF3OWNIclNRZ0xWc1BnUmRWL3VNbjZJdEJw?=
 =?utf-8?B?QzBpYjFneFJaaWRUVGFXZXNHVUJLWk9nVEpKcHRqUTlrd3RIQkxkLzdiak5F?=
 =?utf-8?B?MGpiTldkc3MyK0RlekhNOXB6eWUvSS9aMHJKTTYvY2NhWTNRODZLMTRCL2dS?=
 =?utf-8?B?WGpRNmtpNE96TXdaY3pMeXB5b3BqRHc0ZXpXc2FTQW5FMVdtM0k1VFdlbVNS?=
 =?utf-8?B?UklnWVpGZFd0MCtiWFhKb0tMM3ZVY0dEbks2NmpCUkRkTHM1NW93MFp6d3ly?=
 =?utf-8?B?MHpvcW9hM3Q1MnlsNHZ5aCtIYkRPRWEreXowVUhJeEtucTVyS2RzcmRZVWd5?=
 =?utf-8?B?K2hqdzlGL0F6eWUwOUZDSDdqV05FdDVSM25ldWNWdTFSaWFkL1Q5TkVwQjM3?=
 =?utf-8?Q?R0rQAZltcnA6B0o6F7y84vdeE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6309bbb9-71b9-44aa-abd3-08ddd6171dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 01:01:33.0915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nriQhySY3zcdrZxbb14Vap237fQV2oXhpfqoJ4W9s6I4w1a1r1AwfOdM2cyPOVi0Y7OEj4MpDKhVn5FLFteDRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
X-OriginatorOrg: intel.com

SmFjb3BvLA0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBKYWNvcG8gTW9u
ZGkgPGphY29wby5tb25kaUBpZGVhc29uYm9hcmQuY29tPg0KPlNlbnQ6IFNhdHVyZGF5LCBBdWd1
c3QgMiwgMjAyNSA1OjIzIFBNDQo+VG86IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBr
ZXJuZWwub3JnPjsgRGV2YXJzaCBUaGFra2FyDQo+PGRldmFyc2h0QHRpLmNvbT47IEJlbm9pdCBQ
YXJyb3QgPGJwYXJyb3RAdGkuY29tPjsgSGFucyBWZXJrdWlsDQo+PGh2ZXJrdWlsQGtlcm5lbC5v
cmc+OyBNaWtlIElzZWx5IDxpc2VseUBwb2JveC5jb20+OyBMYXVyZW50IFBpbmNoYXJ0DQo+PGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT47IEhhbnMgZGUgR29lZGUgPGhhbnNnQGtl
cm5lbC5vcmc+Ow0KPlBhcnRoaWJhbiBWZWVyYXNvb3JhbiA8cGFydGhpYmFuLnZlZXJhc29vcmFu
QG1pY3JvY2hpcC5jb20+OyBDaHJpc3RpYW4NCj5Hcm9tbSA8Y2hyaXN0aWFuLmdyb21tQG1pY3Jv
Y2hpcC5jb20+OyBHcmVnIEtyb2FoLUhhcnRtYW4NCj48Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+OyBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz47IFlhbnRlbmcgU2kNCj48c2kueWFudGVu
Z0BsaW51eC5kZXY+OyBEb25nbGlhbmcgTXUgPGR6bTkxQGh1c3QuZWR1LmNuPjsgSm9uYXRoYW4N
Cj5Db3JiZXQgPGNvcmJldEBsd24ubmV0PjsgVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9y
Zz47IE1hcmVrDQo+U3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPjsgQW5keSBX
YWxscw0KPjxhd2FsbHNAbWQubWV0cm9jYXN0Lm5ldD47IE1pY2hhZWwgVHJldHRlciA8bS50cmV0
dGVyQHBlbmd1dHJvbml4LmRlPjsNCj5QZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBl
bmd1dHJvbml4LmRlPjsgQmluIExpdQ0KPjxiaW4ubGl1QG1lZGlhdGVrLmNvbT47IE1hdHRoaWFz
IEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Ow0KPkFuZ2Vsb0dpb2FjY2hpbm8gRGVs
IFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Ow0KPkRtaXRy
eSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT47IFRoaWVycnkgUmVkaW5nDQo+PHRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbT47IEpvbmF0aGFuIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+
Ow0KPk1pcmVsYSBSYWJ1bGVhIDxtaXJlbGEucmFidWxlYUBueHAuY29tPjsgU2hhd24gR3VvDQo+
PHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXgu
ZGU+OyBGYWJpbw0KPkVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT47IEtpZXJhbiBCaW5naGFt
DQo+PGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT47IE1pY2hhbCBTaW1l
aw0KPjxtaWNoYWwuc2ltZWtAYW1kLmNvbT47IE1pbmcgUWlhbiA8bWluZy5xaWFuQG54cC5jb20+
OyBaaG91IFBlbmcNCj48ZWFnbGUuemhvdUBueHAuY29tPjsgWGF2aWVyIFJvdW1lZ3VlIDx4YXZp
ZXIucm91bWVndWVAb3NzLm54cC5jb20+Ow0KPlBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0
cm9uaXguZGU+OyBWaWthc2ggR2Fyb2RpYQ0KPjxxdWljX3ZnYXJvZGlhQHF1aWNpbmMuY29tPjsg
RGlrc2hpdGEgQWdhcndhbA0KPjxxdWljX2Rpa3NoaXRhQHF1aWNpbmMuY29tPjsgQWJoaW5hdiBL
dW1hciA8YWJoaW5hdi5rdW1hckBsaW51eC5kZXY+Ow0KPkJyeWFuIE8nRG9ub2dodWUgPGJyeWFu
Lm9kb25vZ2h1ZUBsaW5hcm8ub3JnPjsgU3lsd2VzdGVyIE5hd3JvY2tpDQo+PHN5bHZlc3Rlci5u
YXdyb2NraUBnbWFpbC5jb20+OyBKZXJuZWogU2tyYWJlYw0KPjxqZXJuZWouc2tyYWJlY0BnbWFp
bC5jb20+OyBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+OyBTYW11ZWwNCj5Ib2xsYW5kIDxz
YW11ZWxAc2hvbGxhbmQub3JnPjsgRGFuaWVsIEFsbWVpZGENCj48ZGFuaWVsLmFsbWVpZGFAY29s
bGFib3JhLmNvbT47IE5laWwgQXJtc3Ryb25nDQo+PG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+
OyBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPjsNCj5KZXJvbWUgQnJ1bmV0IDxq
YnJ1bmV0QGJheWxpYnJlLmNvbT47IE1hcnRpbiBCbHVtZW5zdGluZ2wNCj48bWFydGluLmJsdW1l
bnN0aW5nbEBnb29nbGVtYWlsLmNvbT47IE5hcyBDaHVuZw0KPjxuYXMuY2h1bmdAY2hpcHNubWVk
aWEuY29tPjsgSmFja3NvbiBMZWUgPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT47DQo+TWlu
Z2hzaXUgVHNhaSA8bWluZ2hzaXUudHNhaUBtZWRpYXRlay5jb20+OyBIb3Vsb25nIFdlaQ0KPjxo
b3Vsb25nLndlaUBtZWRpYXRlay5jb20+OyBBbmRyZXctQ1QgQ2hlbiA8YW5kcmV3LQ0KPmN0LmNo
ZW5AbWVkaWF0ZWsuY29tPjsgVGlmZmFueSBMaW4gPHRpZmZhbnkubGluQG1lZGlhdGVrLmNvbT47
IFl1bmZlaQ0KPkRvbmcgPHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT47IEdlZXJ0IFV5dHRlcmhv
ZXZlbg0KPjxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IE1hZ251cyBEYW1tIDxtYWdudXMuZGFt
bUBnbWFpbC5jb20+OyBNaWtoYWlsDQo+VWx5YW5vdiA8bWlraGFpbC51bHlhbm92QGNvZ2VudGVt
YmVkZGVkLmNvbT47IEphY29iIENoZW4gPGphY29iLQ0KPmNoZW5AaW90d3J0LmNvbT47IEV6ZXF1
aWVsIEdhcmNpYSA8ZXplcXVpZWxAdmFuZ3VhcmRpYXN1ci5jb20uYXI+Ow0KPkhlaWtvIFN0dWVi
bmVyIDxoZWlrb0BzbnRlY2guZGU+OyBEZXRsZXYgQ2FzYW5vdmENCj48ZGV0bGV2LmNhc2Fub3Zh
QGNvbGxhYm9yYS5jb20+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Ow0K
PkFsaW0gQWtodGFyIDxhbGltLmFraHRhckBzYW1zdW5nLmNvbT47IFN5bHdlc3RlciBOYXdyb2Nr
aQ0KPjxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPjsgxYF1a2FzeiBTdGVsbWFjaCA8bC5zdGVsbWFj
aEBzYW1zdW5nLmNvbT47DQo+QW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqdHAyMDEwQGdt
YWlsLmNvbT47IEphY2VrIEFuYXN6ZXdza2kNCj48amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+
OyBIYWpkYSwgQW5kcnplaiA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+Ow0KPkZhYmllbiBEZXNz
ZW5uZSA8ZmFiaWVuLmRlc3Nlbm5lQGZvc3Muc3QuY29tPjsgSHVndWVzIEZydWNoZXQNCj48aHVn
dWVzLmZydWNoZXRAZm9zcy5zdC5jb20+OyBKZWFuLUNocmlzdG9waGUgVHJvdGluIDxqZWFuLQ0K
PmNocmlzdG9waGUudHJvdGluQGZvc3Muc3QuY29tPjsgTWF4aW1lIENvcXVlbGluDQo+PG1jb3F1
ZWxpbi5zdG0zMkBnbWFpbC5jb20+OyBBbGV4YW5kcmUgVG9yZ3VlDQo+PGFsZXhhbmRyZS50b3Jn
dWVAZm9zcy5zdC5jb20+OyBOaWNvbGFzIER1ZnJlc25lDQo+PG5pY29sYXMuZHVmcmVzbmVAY29s
bGFib3JhLmNvbT47IEJlbmphbWluIEdhaWduYXJkDQo+PGJlbmphbWluLmdhaWduYXJkQGNvbGxh
Ym9yYS5jb20+OyBTdGV2ZSBMb25nZXJiZWFtDQo+PHNsb25nZXJiZWFtQGdtYWlsLmNvbT47IE1h
eGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz47IFBhdWwNCj5Lb2NpYWxrb3dza2kgPHBh
dWxrQHN5cy1iYXNlLmlvPjsgTmlrbGFzIFPDtmRlcmx1bmQNCj48bmlrbGFzLnNvZGVybHVuZEBy
YWduYXRlY2guc2U+OyBSb2JlcnQgRm9zcyA8cmZvc3NAa2VybmVsLm9yZz47IFRvZG9yDQo+VG9t
b3YgPHRvZG9yLnRvb0BnbWFpbC5jb20+OyBWbGFkaW1pciBaYXBvbHNraXkNCj48dmxhZGltaXIu
emFwb2xza2l5QGxpbmFyby5vcmc+OyBDb3JlbnRpbiBMYWJiZSA8Y2xhYmJlQGJheWxpYnJlLmNv
bT47DQo+U2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPjsgQ2FvLCBC
aW5nYnUNCj48YmluZ2J1LmNhb0BpbnRlbC5jb20+OyBRaXUsIFRpYW4gU2h1IDx0aWFuLnNodS5x
aXVAaW50ZWwuY29tPjsNCj5TdGFuaXNsYXcgR3J1c3prYSA8c3RhbmlzbGF3LmdydXN6a2FAbGlu
dXguaW50ZWwuY29tPg0KPkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPnN0YWdpbmdAbGlzdHMubGludXguZGV2OyBs
aW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0tDQo+a2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPnRl
Z3JhQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtcmVuZXNhcy0N
Cj5zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtc2Ftc3VuZy0NCj5zb2NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1zdW54aUBsaXN0cy5saW51
eC5kZXY7IGxpbnV4LQ0KPnVzYkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZzsgbGludXgtDQo+cm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbTsNCj5tanBlZy11c2Vyc0BsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQ7IEphY29wbyBNb25kaQ0KPjxqYWNvcG8ubW9uZGlAaWRlYXNvbmJv
YXJkLmNvbT4NCj5TdWJqZWN0OiBbUEFUQ0ggNjMvNjVdIG1lZGlhOiBpcHU2OiBpc3lzOiBEb24n
dCBzZXQNCj5WNEwyX0ZMX1VTRVNfVjRMMl9GSCBtYW51YWxseQ0KPg0KPkZyb206IExhdXJlbnQg
UGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4NCj5UaGUgVjRM
Ml9GTF9VU0VTX1Y0TDJfRkggZmxhZyBpcyBzZXQgYnkgdjRsMl9maF9pbml0KCkuIEl0IGlzIG5v
dCBtZWFudA0KPnRvIGJlIHNldCBtYW51YWxseSBieSBkcml2ZXJzLiBEcm9wIGl0IGZyb20gdGhl
IGlwdTYtaXN5cyBkcml2ZXIuDQo+DQo+U2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPlNpZ25lZC1vZmYtYnk6IEphY29w
byBNb25kaSA8amFjb3BvLm1vbmRpQGlkZWFzb25ib2FyZC5jb20+DQo+LS0tDQo+IGRyaXZlcnMv
bWVkaWEvcGNpL2ludGVsL2lwdTYvaXB1Ni1pc3lzLXZpZGVvLmMgfCAxIC0NCj4gMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkNCj4NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wY2kv
aW50ZWwvaXB1Ni9pcHU2LWlzeXMtdmlkZW8uYw0KPmIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwv
aXB1Ni9pcHU2LWlzeXMtdmlkZW8uYw0KPmluZGV4DQo+MjRhMmVmOTM0NzRjYzQwMGY2NGViMWQ1
MGJjNzYwZWU2NjEyNGQxYi4uZjNmM2JjMDYxNWU1ZGM2OThiZTVjNDc5ZGZlZDgNCj5lZjJlYjQ5
Y2JmYiAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL21lZGlhL3BjaS9pbnRlbC9pcHU2L2lwdTYtaXN5
cy12aWRlby5jDQo+KysrIGIvZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1Ni9pcHU2LWlzeXMt
dmlkZW8uYw0KPkBAIC0xMzA2LDcgKzEzMDYsNiBAQCBpbnQgaXB1Nl9pc3lzX3ZpZGVvX2luaXQo
c3RydWN0IGlwdTZfaXN5c192aWRlbw0KPiphdikNCj4gCV9faXB1Nl9pc3lzX3ZpZGlvY190cnlf
Zm10X21ldGFfY2FwKGF2LCAmZm9ybWF0X21ldGEpOw0KPiAJYXYtPm1ldGFfZm10ID0gZm9ybWF0
X21ldGEuZm10Lm1ldGE7DQo+DQo+LQlzZXRfYml0KFY0TDJfRkxfVVNFU19WNEwyX0ZILCAmYXYt
PnZkZXYuZmxhZ3MpOw0KPiAJdmlkZW9fc2V0X2RydmRhdGEoJmF2LT52ZGV2LCBhdik7DQo+DQo+
IAlyZXQgPSB2aWRlb19yZWdpc3Rlcl9kZXZpY2UoJmF2LT52ZGV2LCBWRkxfVFlQRV9WSURFTywg
LTEpOw0KPg0KPi0tDQo+Mi40OS4wDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQpSZXZpZXdl
ZC1ieTogQmluZ2J1IENhbyA8YmluZ2J1LmNhb0BpbnRlbC5jb20+DQo=

