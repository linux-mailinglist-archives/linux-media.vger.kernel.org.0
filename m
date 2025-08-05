Return-Path: <linux-media+bounces-38880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBD2B1AC20
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 03:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCE7E17F9B4
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 01:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77E11A4F3C;
	Tue,  5 Aug 2025 01:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XcWAy0Wj"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED7D10FD;
	Tue,  5 Aug 2025 01:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754357691; cv=fail; b=D2b3bq5dnGWSPVbk9xcMeVwRsz7+tXu5LdJiCYSEl4W45pmy/d8/Tdt2jfNuQa36h/WX59+v4iBGoiS3lZWFMDCzchry6vQNeMnKCkuUa31zzMlB33lKFKpUyEmkrw8L/qp/4LA0qeyAlhP0NcR0m2eKeVDtQARBfp0pRFEjEug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754357691; c=relaxed/simple;
	bh=7e2TGUFSw9jhmeBA4k7xwUGaMFafjzzHLoT+2O3xsr4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NMIeYOpMrGwsq0ZgwG+7RzCzR5MgMBw49gTAg9hO7YQ9ByBnobxegh9Wxo2pYd/GmgFCe0YvGc28lr7ggcK3rbe3UIRtjZ85YKaI2IxYXBaE76oFBm4QyyAJ3k/SoKdk6Z+MuVx5EMpfThVrZnpHZX89yp8SX9t3lVWXKljDlEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XcWAy0Wj; arc=fail smtp.client-ip=40.107.159.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eY7QwsjSoqtrjtV6qsG2POCWIgRJhHd1HgSY4nZSHuJaNQoLEF2LvIwFFt8u2pQNzXVoyWn2KimeTsHTswKgoBsm56ZxDrCC9jRfmW6dJtRt1diS7CkHanqCQdrAD/XtdNg7d0hDYmwBgt81nSrBhamCz4KpbsqvHre2t2j0EQEO7kvqbnl9iUAufF6DRsnYAnK1oUNVveYaMmDurUzsmAb1o/eXiEMePXpStORQqRZeFQWUnTL27ZjIsmD22uUxFu8Gj4BkPD3WAblt9GZHVEsedk9hYkiw/5SbcRppmnOYoGGsYI5sMYhaC9qLOHW/oBoDHce3UaErMIumLSkW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7e2TGUFSw9jhmeBA4k7xwUGaMFafjzzHLoT+2O3xsr4=;
 b=R6ZvANxmwWKK47xRkV/aTVk1SMDdI5Rv6DEbaedsYrBRo34DWHisbI3uMtFPD1Lte9maTfkS6rH387tU4QNodOvewZ5AElbVWn2qSBvjN5Y6RvFAwJSMWy0brjgjoqT2iDfgvvckT5V+ib5zVxnf8nbWFrdp/OtyD/8sDkbxD1o3kMp1waPAStyvxyQzl6Mm3DMkeGrItM/yBup2xiL3/SqrPNGImk5MQWwJDpJ6DYhMRag0VkcbGYYN1e2r3CGiCTM70nf+bTzAgO0FeYt7e+XBNEZQGNM2YwwKUwyksstAiu+qB8L33hKPaz74zGQoPqF5CJG72mjygEW+W4frCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7e2TGUFSw9jhmeBA4k7xwUGaMFafjzzHLoT+2O3xsr4=;
 b=XcWAy0WjAmah8X37WlVgb8vjt59mJCrEK+Ya7QQlo83C1KPIuvah1GyPh0GzGeR5bXbuANyX/yr7nIa/p0orfGomeKgA9mEMkBQgIkRSoeiAmFJATYZo5e/4q8QHDVAG37mOgwVsgs48ItyuJ97IAim8B0XBKbzKrw15jXHv4yckF86vx2/EV8b7r8qfaNt75Cl2p7sBV8fW8X74eoqkpFHrqqp30aWXJQOqnyep6Q2RX6ZvxmUXOb5NvTmL3PLvOGd/DnETuvIgwfaT351P5lvvyOqRMQuAv1YeuGlcG8Sh9HtajNqBk9YCGfWxRqTB5EcHmM6VA7ssE+MC0IqK9A==
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DBAPR04MB7464.eurprd04.prod.outlook.com (2603:10a6:10:1a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 01:34:44 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 01:34:44 +0000
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
Subject: RE: [EXT] [PATCH 13/65] media: amphion: Make some vpu_v4l2 functions
 static
Thread-Topic: [EXT] [PATCH 13/65] media: amphion: Make some vpu_v4l2 functions
 static
Thread-Index: AQHcA49qQX+NqreNUUaJhGLOkFz6kLRTSvBg
Date: Tue, 5 Aug 2025 01:34:44 +0000
Message-ID:
 <PAXPR04MB8254A8FDD7B30CEEF4117CFDE722A@PAXPR04MB8254.eurprd04.prod.outlook.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-13-eb140ddd6a9d@ideasonboard.com>
In-Reply-To: <20250802-media-private-data-v1-13-eb140ddd6a9d@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8254:EE_|DBAPR04MB7464:EE_
x-ms-office365-filtering-correlation-id: 397eb17f-7cf4-4adb-cb94-08ddd3c04177
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlFXcXFsK21iUFdMSnY0VmVxdWU4NnNMdmRMTENaWjM4bjRwS2RYaUVhdVAx?=
 =?utf-8?B?MEQwYXNHRTRUZWNkbDcwbnJpaHFZdk0yM0J2QlpaTnl3dGg3WXYrTHVPU1Fq?=
 =?utf-8?B?L2ErTmFVOWI4Z0NjUnMvRTNhaHREUHFsSTlaZjhjVVRsYmtUY0UyVnY0VmYw?=
 =?utf-8?B?SWkyYUpZWnNvQzBvS1BVT0Y5djdMTVM0akdwZWkwQ0p3c3FIYXpSOTQ1NUli?=
 =?utf-8?B?ZGE5d1NJb0J0OGxDd21RUlMrY3BCMS9QR1NxZloxbnZpWWI0R3NMOXBBWFE3?=
 =?utf-8?B?ZTBZSFFvWU4yTmZlM1RQbDdOQ1VJWEhSdTM5anFkaUlFMVZUVHdHbnNXY2ZR?=
 =?utf-8?B?cDFJTlVQeDduQnpiZjZMK2hOZmQ0Wmtob3BxYjA4RmZKU3VIRW8wbm5KWExS?=
 =?utf-8?B?NnU1dEQvaU50RDhqdktUQjE5RDBPOG1mdW8vcVBWeXNZUXNMREZwd2lKLzFw?=
 =?utf-8?B?dy9rMyt2ZTB6ZEhTZmdiaEVoRmhUcW45R0hBV2l5dkF5M3ZtRXVTUXdpSlVD?=
 =?utf-8?B?VGFwaDBUMHlFQmRyYlZMZ1hudEdYZGtOTUdUaDR0V0lyNjIyTTM1cVRjRmVY?=
 =?utf-8?B?b3NhQWFqVlVzaW9VQTJrUmVoeGQxVGJ2UzZlVzJhTFZQdTkyYThQM3RKSmti?=
 =?utf-8?B?clZPdW9aN0xhcWtDYWlmdWZwUmJscGcwakdRa2E0NG9EOGtLRy91SDlmalVu?=
 =?utf-8?B?SlRaOHZzQmkvd3c0a0ZEK2w1MUJyL1JLSGw4WFVsdXFuV1FhZ1k4SGRURjAr?=
 =?utf-8?B?WHhzKzQydDhWMnF2U0x1NWNaOFV5Wkg2QVBFbjZYR3VabnNSaUVsU1Q2emQ2?=
 =?utf-8?B?cXc3ZEwzcFd0WlhwWDUxeFQ3R2l3YjJNY1Z1ZERGeGJhMTFrZEp3b3pqYmdz?=
 =?utf-8?B?aDlhM3pmZDh6QklPK1BESlN6Ylg4aGRoMkgxbjhmK2VNMGEvQldYbG5qS3E3?=
 =?utf-8?B?SDZPdno4MUpBVUNyZXJnTy9hcWVzSHhjaE13ZkhwbHoyMzFRQ0taUUdFVkxl?=
 =?utf-8?B?SjJLWWVTVmZwNmRueC9aOFJieXhVSllmMVdKUi9OYUZrUU0vQWJlYml0cGJX?=
 =?utf-8?B?cDdaRDNVTk9ESzM3UWhGSEQ3dFpVV0JCR2p0bnRjNWxqZk1aYjdiTmpoazlX?=
 =?utf-8?B?Sm1ma1VoSnhwdWRuUWR5VFRreEIwTmU4SG93T2N6V3MwbmRLaFVwN01waGQ2?=
 =?utf-8?B?eHpReFdOUktkTHJIbUU0UWk1a21YcUVWMG5kL1EvZGhGZXZTVExWNEJCTHhw?=
 =?utf-8?B?YnlKU3dJL3ZrQXBnRHhWaGp3RW1wREFJYkdmNnBSYXZUcXZtQlBvVnQyaTMz?=
 =?utf-8?B?MXJVZkl2ZFQzSG8yRUN5Qzl5djBWZjJBOGQyaVNRV0FYUmRyMzVacytZVFdT?=
 =?utf-8?B?Q3pKVmVsYVY1Y1VQSHFtZUMzVENXY2UwdGNKNmlCLytPVFVIeGQvcmo3L2lq?=
 =?utf-8?B?NFAyQ3B6R2x5MzVVZlZtZU9td1dEL1VhckpUanErQUluZjArYzZxYlFHMGlY?=
 =?utf-8?B?OXJzK1lCRUgwUWhteFo1MDFyWGZuSVZJdHgvQnpEQkFZb25kOXU0WXNZTDZN?=
 =?utf-8?B?VVMra0dlbEJpenc2YnRYOWhvZjN5dkJPZFBZZ2lDeXM3K25mVHVzWjlndnlY?=
 =?utf-8?B?MzhPTUhpc2I1ZWlsZHRqZFFJZkhHTmIwWTJ2WFZNNnZjaDhuQU9rb3lBMEVX?=
 =?utf-8?B?QW5sTUZ1eGVFUFNCSHpnQndSOXdXQXU2bE9Ub1RDc2p0TmsvcGc3N3pjdUhu?=
 =?utf-8?B?RUxmRmcyTURFMElNL0YzYWFVYUVDcmZnMlErc2t0QkZTZ1VleHNTWEtJS2RR?=
 =?utf-8?B?eU56K1FNV1VNQVlmRHNWaENhVFgvcmFvMExTMHB1eTNyYml5cmRocElXb0s1?=
 =?utf-8?B?Nkh0QzZ0UC9uZk9TWXZpc2ZhSzM1L2VIeXpCTHpZeEt3bzg1T0JyVUFPNEEy?=
 =?utf-8?B?cnQ4dkpvZkY4UXJLRHR5K1RVVjhSZnNOYWg3aGZZbXdtWjNxc3l0RjFvbXNm?=
 =?utf-8?Q?rUGPhOLZVWWjEvaSUsG2/HeNgpFjSU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGtuVmZqVFFUbS9Gd3JuZGRBYzlXS2IvV1NvTndabGpYWEp6K3J3dTdHVnll?=
 =?utf-8?B?VkwyMjY1RGxYLzc0a0s4R2JHMTFEYVRSTUNCYXNLeVNGb1kzekNremxNd2Jx?=
 =?utf-8?B?ajdHZnpyYjB0NVczdjFRdUFWVG9iMjVvdndrQkxBd1FLdDVFZ2FTMWgwaWox?=
 =?utf-8?B?WGlNK1orVUo0ZDUrTDJ1VWl2S1VEci9UOThaOWphUG8yZ2srWXNJZDNnQzlo?=
 =?utf-8?B?UEcwTm9VTVNKblZNbzdsekl3Qy9xU21BOGRtVHgyTVZrUXRjRjVXcU40b0tZ?=
 =?utf-8?B?VU5nRlJYVk5qWStKTU1KMVZzYk1obHp3ZkpMZm9kbDZOVjNvdDM3Q3MxUkNF?=
 =?utf-8?B?UDliK0xicVZLcndoZlUwTzVkUWlVeTE3TDQyS09DNWZueEQ2Z1Y3Tk9udko3?=
 =?utf-8?B?cmY1aHdvNkdjbjM1aUFGYkUyNy9FMnBOcDhLaGZKb3RiVE9pT3ZjMCt0Zy8w?=
 =?utf-8?B?bHZSeDdxNWdvbS9qMUhZTTJ6ZDZWdzJmbEFVNnE1VHBtWmhLbXJnYndVSEhB?=
 =?utf-8?B?UkE3TlU1MlBjYUVWWUtrY1ZFbGRlT3RrYTBmOHlnY1BqL3dIVVpWWGI1UzhE?=
 =?utf-8?B?bmFkZWxQOEJWWThKdU5OczB5MUY1Q1V2STJldjJuWVZoWWtKM3p5YjdvbzFx?=
 =?utf-8?B?a0pFdHhBVGJlNVJyMFdUU0JRNXFZaTlNR0oycGtLQ3drdm5WRUxyb2RMQUN6?=
 =?utf-8?B?Z2hld1pnR3pOdnhDK2IrUGlXVGJrRkpIZnNCb3NCSkVuSjA3Mm1LOUdURTNV?=
 =?utf-8?B?NTFBVGhJOUFMcWVFdDJPZ09aNkNqYkV6ZGhtM09YL3JwOTJ0Smd3SkFhZmUz?=
 =?utf-8?B?UGk2UHY2ZFdFRC9zVjErN0drUjgyZHJIQ0hISVh3TC9SYis1SzI5MlBlQlh0?=
 =?utf-8?B?NEdJRmg5dXlJNDhHUi9QRTRQelVWTkd6dG5uRUwra3ZyMk5QUVpFdS9wb0p3?=
 =?utf-8?B?MUhKMUpjYmh0ME5tb2lEY0hCMWdDTVhsZHczN1F3TTRZbnlNODFGY212SURa?=
 =?utf-8?B?Z3Yra0prbVFJQkoySkdvSjg3UEs3RFpadm9NMngwSENGbzNBZFJQYzliNzgy?=
 =?utf-8?B?cFlXZ3gvbnpIUlFhRXAzWHZDUGxFcm14bWZmakNTVHdrOEF4Wk10M1E2bHl6?=
 =?utf-8?B?OERoUUx4Z2c4ZmJoWEliY0M4czlZTXVrcWkxTzF6VjNla2xkbndBTWg1d3lI?=
 =?utf-8?B?dGhDNzNlb2NNR21EQTJGUEgxUE5PYnkzajlPbURITE0rZkszWkZKaTdUUUc3?=
 =?utf-8?B?czFnODB6MFFpWFBKQVpKcVpGWXBQVkJxdnZIVitaMGw5Z2F5T24zSDVhM29H?=
 =?utf-8?B?SksyemxiNCtyN0pGc2dubUFmZjFybTNzK3JyWnZyZkovdU1SNVZsSEtYa0Zq?=
 =?utf-8?B?V1g1aVFpM0p1ZVJ6OG5lQm55elZVUmRHTzUvVGhiMGlibDIxNXZyYXppazdp?=
 =?utf-8?B?OHl3REtYdzRHSDJDbVlsb0ZWMHhjYzF1Qkg2eUhjeDNsVjY1YllnaW9XYVdP?=
 =?utf-8?B?dHlWNE9CZ2tKY1lWWGNjT0tCMmN0a2V4d1BVVG1XMG9LTjhmdHBEanA0MHJx?=
 =?utf-8?B?bW1EQmdqMDJrNDVsb251aFF6ZUx0bEEyNnhmcFZzb3JDSlFtN3pzNi9CKzM1?=
 =?utf-8?B?eHYzUUdwdndUckZWbXRadXdvZVVMNTd1b3N3T2xiNzJNUHNQNWxkdk8rbmFY?=
 =?utf-8?B?alJ2Ri9mcmFQZTFieks3V1Z4UXowUENldmJlYUZDWGRneDNKeHd1eE9Jd0FJ?=
 =?utf-8?B?a2lyaStEb2ZBYUFEQ1pydmhPdEk1cGpTRWJhKzkwQmlrMjdsd25TdFFyTU56?=
 =?utf-8?B?TjlzYkZuSUNNaG9KR2M4TWJISkFDNHcxVkxaMlBtQTJMUEVOakhiMkV5M2Rz?=
 =?utf-8?B?REZhNWx3NzRDdjQzR2FCK2R1N3pjQ1ZmYkFLRldzNldOYncvdVEvQllOcGwx?=
 =?utf-8?B?NlpIWGlaRjRYZkxkR243dUQ3cGlzU0d2Wks3b2s3TFNvY1UxSEQzTDk3MWFr?=
 =?utf-8?B?aFRSazF5UlgzM0hEcmhXM2QrS3NDdlFGOVVPQXJBeHA4NEhKaGdtUnNydDVw?=
 =?utf-8?B?bWRuTG5wcElmSzJxQmNPMUZhRk42N0FGU0VnZ2V2dDZNeUV3RDNIdnNteGg1?=
 =?utf-8?Q?YskQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 397eb17f-7cf4-4adb-cb94-08ddd3c04177
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 01:34:44.1458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K7SNzxzH6sVTNrGyZwyZDuATY+s5t3I6vDOasXbmha2vzPkGp4JKgTvlSElnlcXHJuc0tl3eCECV3MvtgDXRpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7464

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
DQo+U3ViamVjdDogW0VYVF0gW1BBVENIIDEzLzY1XSBtZWRpYTogYW1waGlvbjogTWFrZSBzb21l
IHZwdV92NGwyIGZ1bmN0aW9ucw0KPnN0YXRpYw0KPg0KPkNhdXRpb246IFRoaXMgaXMgYW4gZXh0
ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvcg0KPm9w
ZW5pbmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2lu
ZyB0aGUgJ1JlcG9ydA0KPnRoaXMgZW1haWwnIGJ1dHRvbg0KPg0KPg0KPkZyb206IExhdXJlbnQg
UGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4NCj5Tb21lIGZ1
bmN0aW9ucyBkZWZpbmVkIGluIHZwdV92NGwyLmMgYXJlIG5ldmVyIHVzZWQgb3V0c2lkZSBvZiB0
aGF0DQo+Y29tcGlsYXRpb24gdW5pdC4gTWFrZSB0aGVtIHN0YXRpYy4NCj4NCj5TaWduZWQtb2Zm
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
DQo+U2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8ubW9uZGlAaWRlYXNvbmJvYXJk
LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IE1pbmcgUWlhbiA8bWluZy5xaWFuQG9zcy5ueHAuY29tPg0K
DQo+LS0tDQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfdjRsMi5jIHwgMTIg
KysrKysrKysrLS0tDQo+ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3ZwdV92NGwyLmgg
fCAgOCAtLS0tLS0tLQ0KPiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pDQo+DQo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYW1waGlv
bi92cHVfdjRsMi5jDQo+Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhpb24vdnB1X3Y0bDIu
Yw0KPmluZGV4DQo+NzQ2NjhmYTM2MmUyNGZkMzQ4MjliNTAwZTk5Yzg0NTVhOTQxM2ZjMS4uMzA2
ZDk0ZTBmOGU3OWZhYWFjZmEzNWIyOGUNCj41Nzg2ODYwZjdiZDFjYSAxMDA2NDQNCj4tLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhpb24vdnB1X3Y0bDIuYw0KPisrKyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfdjRsMi5jDQo+QEAgLTI0LDYgKzI0LDExIEBADQo+
ICNpbmNsdWRlICJ2cHVfbXNncy5oIg0KPiAjaW5jbHVkZSAidnB1X2hlbHBlcnMuaCINCj4NCj4r
c3RhdGljIGNoYXIgKnZwdV90eXBlX25hbWUodTMyIHR5cGUpDQo+K3sNCj4rICAgICAgIHJldHVy
biBWNEwyX1RZUEVfSVNfT1VUUFVUKHR5cGUpID8gIm91dHB1dCIgOiAiY2FwdHVyZSI7IH0NCj4r
DQo+IHZvaWQgdnB1X2luc3RfbG9jayhzdHJ1Y3QgdnB1X2luc3QgKmluc3QpICB7DQo+ICAgICAg
ICBtdXRleF9sb2NrKCZpbnN0LT5sb2NrKTsNCj5AQCAtNDIsNyArNDcsNyBAQCBkbWFfYWRkcl90
IHZwdV9nZXRfdmJfcGh5X2FkZHIoc3RydWN0IHZiMl9idWZmZXINCj4qdmIsIHUzMiBwbGFuZV9u
bykNCj4gICAgICAgICAgICAgICAgICAgICAgICB2Yi0+cGxhbmVzW3BsYW5lX25vXS5kYXRhX29m
ZnNldDsgIH0NCj4NCj4tdW5zaWduZWQgaW50IHZwdV9nZXRfdmJfbGVuZ3RoKHN0cnVjdCB2YjJf
YnVmZmVyICp2YiwgdTMyIHBsYW5lX25vKQ0KPitzdGF0aWMgdW5zaWduZWQgaW50IHZwdV9nZXRf
dmJfbGVuZ3RoKHN0cnVjdCB2YjJfYnVmZmVyICp2YiwgdTMyDQo+K3BsYW5lX25vKQ0KPiB7DQo+
ICAgICAgICBpZiAocGxhbmVfbm8gPj0gdmItPm51bV9wbGFuZXMpDQo+ICAgICAgICAgICAgICAg
IHJldHVybiAwOw0KPkBAIC04MSw3ICs4Niw3IEBAIHZvaWQgdnB1X3Y0bDJfc2V0X2Vycm9yKHN0
cnVjdCB2cHVfaW5zdCAqaW5zdCkNCj4gICAgICAgIHZwdV9pbnN0X3VubG9jayhpbnN0KTsNCj4g
fQ0KPg0KPi1pbnQgdnB1X25vdGlmeV9lb3Moc3RydWN0IHZwdV9pbnN0ICppbnN0KQ0KPitzdGF0
aWMgaW50IHZwdV9ub3RpZnlfZW9zKHN0cnVjdCB2cHVfaW5zdCAqaW5zdCkNCj4gew0KPiAgICAg
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCB2NGwyX2V2ZW50IGV2ID0gew0KPiAgICAgICAgICAgICAg
ICAuaWQgPSAwLA0KPkBAIC01NzMsNyArNTc4LDggQEAgc3RhdGljIHZvaWQgdnB1X3ZiMl9idWZf
ZmluaXNoKHN0cnVjdCB2YjJfYnVmZmVyICp2YikNCj4gICAgICAgICAgICAgICAgY2FsbF92b2lk
X3ZvcChpbnN0LCBvbl9xdWV1ZV9lbXB0eSwgcS0+dHlwZSk7ICB9DQo+DQo+LXZvaWQgdnB1X3Zi
Ml9idWZmZXJzX3JldHVybihzdHJ1Y3QgdnB1X2luc3QgKmluc3QsIHVuc2lnbmVkIGludCB0eXBl
LCBlbnVtDQo+dmIyX2J1ZmZlcl9zdGF0ZSBzdGF0ZSkNCj4rc3RhdGljIHZvaWQgdnB1X3ZiMl9i
dWZmZXJzX3JldHVybihzdHJ1Y3QgdnB1X2luc3QgKmluc3QsIHVuc2lnbmVkIGludCB0eXBlLA0K
PisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSB2YjJfYnVmZmVyX3N0YXRl
IHN0YXRlKQ0KPiB7DQo+ICAgICAgICBzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICpidWY7DQo+DQo+
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfdjRsMi5oDQo+
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhpb24vdnB1X3Y0bDIuaA0KPmluZGV4DQo+NTZm
MjkzOWZhODRkMDdiN2VhMDdlODg5YWI1YWQzYmI3Y2E5YWI1Yy4uNGE4N2IwNmFlNTIwMzA2ZWRl
MzU2YjZmDQo+MzMwOWQ4YjRhNjdjMjA0YSAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2FtcGhpb24vdnB1X3Y0bDIuaA0KPisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
YW1waGlvbi92cHVfdjRsMi5oDQo+QEAgLTI2LDE1ICsyNiwxMiBAQCB2b2lkIHZwdV9za2lwX2Zy
YW1lKHN0cnVjdCB2cHVfaW5zdCAqaW5zdCwgaW50IGNvdW50KTsNCj5zdHJ1Y3QgdmIyX3Y0bDJf
YnVmZmVyICp2cHVfZmluZF9idWZfYnlfc2VxdWVuY2Uoc3RydWN0IHZwdV9pbnN0ICppbnN0LCB1
MzINCj50eXBlLCB1MzIgc2VxdWVuY2UpOyAgc3RydWN0IHZiMl92NGwyX2J1ZmZlciAqdnB1X2Zp
bmRfYnVmX2J5X2lkeChzdHJ1Y3QNCj52cHVfaW5zdCAqaW5zdCwgdTMyIHR5cGUsIHUzMiBpZHgp
OyAgdm9pZCB2cHVfdjRsMl9zZXRfZXJyb3Ioc3RydWN0IHZwdV9pbnN0DQo+Kmluc3QpOyAtaW50
IHZwdV9ub3RpZnlfZW9zKHN0cnVjdCB2cHVfaW5zdCAqaW5zdCk7ICBpbnQNCj52cHVfbm90aWZ5
X3NvdXJjZV9jaGFuZ2Uoc3RydWN0IHZwdV9pbnN0ICppbnN0KTsgIGludA0KPnZwdV9zZXRfbGFz
dF9idWZmZXJfZGVxdWV1ZWQoc3RydWN0IHZwdV9pbnN0ICppbnN0LCBib29sIGVvcyk7IC12b2lk
DQo+dnB1X3ZiMl9idWZmZXJzX3JldHVybihzdHJ1Y3QgdnB1X2luc3QgKmluc3QsIHVuc2lnbmVk
IGludCB0eXBlLCBlbnVtDQo+dmIyX2J1ZmZlcl9zdGF0ZSBzdGF0ZSk7ICBpbnQgdnB1X2dldF9u
dW1fYnVmZmVycyhzdHJ1Y3QgdnB1X2luc3QgKmluc3QsIHUzMg0KPnR5cGUpOyAgYm9vbCB2cHVf
aXNfc291cmNlX2VtcHR5KHN0cnVjdCB2cHVfaW5zdCAqaW5zdCk7DQo+DQo+IGRtYV9hZGRyX3Qg
dnB1X2dldF92Yl9waHlfYWRkcihzdHJ1Y3QgdmIyX2J1ZmZlciAqdmIsIHUzMiBwbGFuZV9ubyk7
IC0NCj51bnNpZ25lZCBpbnQgdnB1X2dldF92Yl9sZW5ndGgoc3RydWN0IHZiMl9idWZmZXIgKnZi
LCB1MzIgcGxhbmVfbm8pOyAgc3RhdGljDQo+aW5saW5lIHN0cnVjdCB2cHVfZm9ybWF0ICp2cHVf
Z2V0X2Zvcm1hdChzdHJ1Y3QgdnB1X2luc3QgKmluc3QsIHUzMiB0eXBlKSAgew0KPiAgICAgICAg
aWYgKFY0TDJfVFlQRV9JU19PVVRQVVQodHlwZSkpDQo+QEAgLTQzLDExICs0MCw2IEBAIHN0YXRp
YyBpbmxpbmUgc3RydWN0IHZwdV9mb3JtYXQgKnZwdV9nZXRfZm9ybWF0KHN0cnVjdA0KPnZwdV9p
bnN0ICppbnN0LCB1MzIgdHlwZSkNCj4gICAgICAgICAgICAgICAgcmV0dXJuICZpbnN0LT5jYXBf
Zm9ybWF0OyAgfQ0KPg0KPi1zdGF0aWMgaW5saW5lIGNoYXIgKnZwdV90eXBlX25hbWUodTMyIHR5
cGUpIC17DQo+LSAgICAgICByZXR1cm4gVjRMMl9UWVBFX0lTX09VVFBVVCh0eXBlKSA/ICJvdXRw
dXQiIDogImNhcHR1cmUiOw0KPi19DQo+LQ0KPiBzdGF0aWMgaW5saW5lIGludCB2cHVfdmJfaXNf
Y29kZWNjb25maWcoc3RydWN0IHZiMl92NGwyX2J1ZmZlciAqdmJ1ZikgIHsgICNpZmRlZg0KPlY0
TDJfQlVGX0ZMQUdfQ09ERUNDT05GSUcNCj4NCj4tLQ0KPjIuNDkuMA0KDQo=

