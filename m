Return-Path: <linux-media+bounces-27096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23619A46C1B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 21:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B25B416D818
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 20:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C516D275608;
	Wed, 26 Feb 2025 20:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="X/F+j/P5"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2120.outbound.protection.outlook.com [40.107.220.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17A02755E5;
	Wed, 26 Feb 2025 20:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740600818; cv=fail; b=HZlsYlhhVz+5dtD4PnDwPH08nyuiw3LLotxGKL0N16yDz6RkJQkYodwPGjDMPac+AxuzqhNPnSzaH0TaSkXfir+iXbUg84+JJ+SHYLcLwASxaueFj5Ih/oV2RqOcPolObzLzq91CZsxWGJgQgb+kPrwAe/nA295LE8xiGCOePrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740600818; c=relaxed/simple;
	bh=TF4TzYXNw2Oi38vSU0OTyMYl18fy3bDaa6Vxd/ozT6A=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=iJ7lGsssZx5k/EKbdd1MPT+8uh8OPtcTNyWaL5nEpV3ukhJCW69yb1HadqGmL29FrrNjkQIGEfq5GldazhNtFlL1I/yeU5ZyX8wLYxJEJ50ay0uihL6g208OUNtZxyoc8uwTfs0xrbap7GBV/4MqTToWB4zE8pTyxdYywECx2Do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=X/F+j/P5; arc=fail smtp.client-ip=40.107.220.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZLR1Vdkdmm+8ZVZw3SZurQ7hDZzO8Io1fWF01S2tnk/jCO/mybl+e6UrPOMB70r+y03Xv7Tj99gA284qmJCw0CPSBAcd2mmQn/Vp5SHh2AlHmu9pAO5LIlWd3Lu7W/P5HQZke02AeJm6xnbZh3pPg+ZQzpWI2Ha0rKjuVocPHjBe5WgQCDxdbzMZSBlOuBtOJhxTj5ya45o9p01OQbsUYQahU35q3rGtKehiiA9enBsPn2dT/VwWRBqsJLEzOV4BNYGANL40AS4p7+/wlkbHtKuuuRyIEsAi+VlsNnj503J0xf0nBxPmgNO5Qox34dBKBbIZdv1pF5Y/OEVB9DnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC3RNv0zRkL8JB3B9YbRuq05r11k79SCIrwFmV7QaRo=;
 b=Mnwsi+s4xDw/1TIfNTCoX8IVTSz0oad4yAK+R7OUOslBbEF+Bk02hz0gIT/1l3ZX1DU2upXXfvkbsuNuIBB18EXrGCZS1Sz46HuDdZk17YeM+vKezIDVxfctjCMEBWfL219GhgqlHEYAi8ciyhBpok4vJ7/QLKTdtJRbDdzcoNaD0+Hh9jp3K0g2eH08iXeawSO+EcBQ6r5X4hpdm4cOzfAKUvoGrfET3ucEoKvFDbj9AtY7JbSFyRdTLdhUJ3X7g2ML9qGx4ncDjr3YDhXr3WK5d3fEGrgxPVPXqtkXXY57gLIaIQlNz4wH83rJ8tM5jGs27BkzzTvWZFlMGCQ/dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HC3RNv0zRkL8JB3B9YbRuq05r11k79SCIrwFmV7QaRo=;
 b=X/F+j/P5oGkvb/36zIN3mTW09SAWASFVE72V+4LA3VfkZ9Vryv5TMMjrw5M5Zjf4fUIyTBGl0FBWxbrOYL8TyNaZ66K9bRcaB+6meUiY9ccWmj4Wfhgy5tI+iPt2w0NytlSWCeqUBsjSN5+QgtyCZw+4vEx30/jBT38UYJ2p8Oo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from MN2PR14MB4207.namprd14.prod.outlook.com (2603:10b6:208:1d6::13)
 by CY5PR14MB5559.namprd14.prod.outlook.com (2603:10b6:930:39::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 20:13:29 +0000
Received: from MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7]) by MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7%3]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 20:13:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 15:13:27 -0500
Message-Id: <D82NHO05EBSQ.3AZF1VYBU17V5@d3embedded.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>
Cc: =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Abel Vesa" <abel.vesa@linaro.org>, "Achath Vaishnav" <vaishnav.a@ti.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Benjamin Mugnier"
 <benjamin.mugnier@foss.st.com>, "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Bjorn Andersson" <quic_bjorande@quicinc.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Elinor Montmasson"
 <elinor.montmasson@savoirfairelinux.com>, "Fabio Estevam"
 <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Javier Carrasco"
 <javier.carrasco@wolfvision.net>, "Jianzhong Xu" <xuj@ti.com>, "Julien
 Massot" <julien.massot@collabora.com>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>, "Kory Maincent"
 <kory.maincent@bootlin.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mikhail Rudenko" <mike.rudenko@gmail.com>, "Nishanth
 Menon" <nm@ti.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob
 Herring" <robh@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Stuart Burtner" <sburtner@d3embedded.com>, "Tero Kristo"
 <kristo@kernel.org>, "Thakkar Devarsh" <devarsht@ti.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Umang Jain"
 <umang.jain@ideasonboard.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Will Deacon" <will@kernel.org>, "Zhi Mao" <zhi.mao@mediatek.com>
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
From: "Sebastian LaVine" <slavine@d3embedded.com>
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-3-slavine@d3embedded.com>
 <416d75fd-40d0-45d7-9590-0322abb480ca@linaro.org>
In-Reply-To: <416d75fd-40d0-45d7-9590-0322abb480ca@linaro.org>
X-ClientProxiedBy: BLAPR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:208:329::17) To MN2PR14MB4207.namprd14.prod.outlook.com
 (2603:10b6:208:1d6::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR14MB4207:EE_|CY5PR14MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f0034d-d6ed-4885-5abf-08dd56a2091b
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?akNoTWVrbEJkbk9DWUNvamtaWnJjb2loOURCTC9Ia0tWdHljSlU1eXFHQ0d3?=
 =?utf-8?B?cWZtRGt3SDV5K2tHd0NoS0I4bFNyYjV1aDZxWUZtdTVPWUVtcGpoZmFxdUxG?=
 =?utf-8?B?bXZZREhyMjJ1T0xtZ2hSMG5iZVdIZDY3cEVFK2RvWXZhUldOSEpYZDdKY1hI?=
 =?utf-8?B?NWltWk0xeUFDNHpIei9LeFkybG5TSTZTMDdEQlFuZWptVi8xcnBGb3oxVDZP?=
 =?utf-8?B?Z0MrQURqQ0xGTFhnSFJXMUdqWmhOdTRORU1iTWFOaDlPcmNMb1FvaTcxR1JS?=
 =?utf-8?B?YUhuc1ZPai9qcndzMGxZNXp3bS9XVUViUnZ0ZXQ3N2EwQkplOWNCSjVPSnBk?=
 =?utf-8?B?WlFpNVFmTmJ4dzFMdDZNSEtWVytZNnNReEdJaE5kUWVDeG5WNXhQdVE0TXNz?=
 =?utf-8?B?YkMvaU5XeWI2Nm1HbzBqdkdyeDRrZDdIRXpaRjNMajgwNnhHMGsxSmxOblFo?=
 =?utf-8?B?YUpTb0pCdG1sZU9pbFl2cVJYUUliUUxhNlhqZiszT1NEY2FTK2dLTVJWdE5E?=
 =?utf-8?B?MlUxb2wrdDQrRXcwdVErMXlPWHBVSzJPbTU3Z1p4bWJlZjVkM1daN1pEei9N?=
 =?utf-8?B?dTJ3SVdsZi9heDFUQkRIK0p3V2U4TTlDeFdENnVLQW05ck91L0Z0Vy9xZnQr?=
 =?utf-8?B?VlRBenFqOVkxeUt3a3RtQUdTWCt4TmtwMlNydkpYQWRRU3ZjNlBUSys3V1Y3?=
 =?utf-8?B?eDFoaWVqb21WL2U0L0VtWjN5c1l2UVZsTUtqNmhqbWwxenRRZlE4a1NDRGJV?=
 =?utf-8?B?RVJpdUs1ZkU1TEhRVkFrdHFCOUh3NkJ2cDc2d3Rkd0o0dHg2OGNGdWt5MnhS?=
 =?utf-8?B?UUtGaXN5VU5kNFk4eE8zSVNLem4xdXRscloxQzZrZHhmN1JjSURUSUtCMno0?=
 =?utf-8?B?SnY3MHBmVEN4ZUdjMHdsSk1PdEYvcDluRUU2RU1CNUpPTHVtOGh5K3Rld0Y3?=
 =?utf-8?B?ZWVkTmQ0bTA0V2hQMURXQTdydDlaL3FuUHIzcU1uVUpVU2QwSzhwUmVDcFVN?=
 =?utf-8?B?RTlLaHNwSmZ2OGVSdWYzN3Q0bkk1Mm1QZEhTaTM1QVZqQjJleDZtL1pxd3dL?=
 =?utf-8?B?b0tTaXdXU21YYVFKMFFTeWVxVUgyK3VTUG5YQXNwQ1lTdDBSZXdMSkpaanhq?=
 =?utf-8?B?ZjZiS3lUc0JVa3FSbld0L1h3SWRsNHJjUUQzOW42amVOM3VVVlE0aVdYbG51?=
 =?utf-8?B?VWl2SElMd0JPSFhvQ0pvcFU5SVl1L1JzdUJjV05pNmZjWWdWZkZPYmZDRG1w?=
 =?utf-8?B?eG9sdGl0L2IrbWRwZFF1WXpiK3IwTGZnQ0FQUmc2Z2dWOTM5clNBYUE5enpW?=
 =?utf-8?B?U21EMXZMMjNTdUplZmkzTlVLQ3BJMXBqd0ptZ1FTSDNhRWpSSTJXMVFqUHA3?=
 =?utf-8?B?UGMvVS9RVXFXWUNUMWhpVnBDc2ZoYWIvdWFEeFRHZ1RyTjZqNUpJZDI4QnNu?=
 =?utf-8?B?N3MvT1Flblc4Um15SnM2L2UvTEVRWDZIbnY3Z0d3V3dBOWVqUnRSc3oxRU10?=
 =?utf-8?B?L1phOHN1eFd0MzZEVW5xdElGWjliRkxZWlRjV1N1MzZhSy9FYmVmTGJ2dXVH?=
 =?utf-8?B?aytjRXY0MnFNMDZaakxxaDl3K0ZKT3NGS1hocFdyRVg1VDBaMGJyckZnZVpk?=
 =?utf-8?B?OWxQdWZFKy9zQnAzbHNoaU9VRk8vdVV0WkZKTGMyNUFlYUczbWhXRU1jTGFw?=
 =?utf-8?B?MWxncndiZjEzdTdYODFRQk1pS3lXZ3lKWDJ5emhGay9qeHVWTDhQb0NUVnBG?=
 =?utf-8?B?M3R2Um1NZEwrOEg4S0xJS093a3RNeDF6MHJzNWxIeUVIc3VNT0wxaC9yeDIr?=
 =?utf-8?B?SWd1RkpJTEppVlVzZkI2SjExSHFWQlNGcHhSaWV1eUl3OG1PUGd2ajF3ZFZn?=
 =?utf-8?Q?ihzTW0wV6UpEs?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR14MB4207.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TFh4cldJcGdGVmQxZWlobmk3bXhzd1RFT0dWRnk5clF2dlVQejBST0dGUUg0?=
 =?utf-8?B?VnpiL0FaZHo4Y0NMY2VIVWdhcnRoWWpESTRRRG9EeklaTnNvckJsbXU0anF0?=
 =?utf-8?B?aHJ1ZWVmY0laWEIrOW9VRWt6OGNaMGZxclNIQmdLN29ZS2FhVmVZTTlPaWZN?=
 =?utf-8?B?NVpSZ0hwK0w2Zkp1cWhPOHRaQ0hKdk9wSkJ2M3pwWnIySVo0TVRob2EwdGZQ?=
 =?utf-8?B?RjdvTTI2OHhQYkF0YTdMRU9IdksyQWlFaEZzRmNkK2RlOHA1SG14SkZpM2JM?=
 =?utf-8?B?cVF6WWRqMFBZSTVCbmVXV0grTVRpVU14N25EbWFTR1JEUyt1WHFqNTlTK0dF?=
 =?utf-8?B?V2VUcHRLcXAzc2w2Q0o3ZkcwRTNuSnRlRzJadFBYeWVUT2lNVVJMUGxnSXhN?=
 =?utf-8?B?QkFYdGdUcHN2eG5xY2hQamJrUzVXQ0pEcWJPYWU3alRUQ0lmUW91c3ZwTG9V?=
 =?utf-8?B?aHVVMmd6ZUtVNFVDY1I0NGp2YTdIcFZVYlNlVHFrZER1cGNITFFTRHVIUEhD?=
 =?utf-8?B?SmZuOGFKWDZzK1ErMnVQRG9XUzBXVHh4dnU0ZE9sNXVqbFV3bjFGUmN3bFlG?=
 =?utf-8?B?clRiNSt0MU5walppSTdCVGpCVzRnMmMzRU83WG9EVFJKWXBJTkpXaVYvU3Vr?=
 =?utf-8?B?d3F1RnhaZml1OXhiNFpxdU1yREErSjQ5cDdiRjZLbEF1cXJ2NGpNdjdJUHBj?=
 =?utf-8?B?bk5yanJDUjlQeHJIaDQ0eUpMYkF6dWltM2tpeWp6eFJEVXZhSkVKQnVlbmpI?=
 =?utf-8?B?V0lCdk5mQVRJMm5qUXlBN2FaOGdrdzRpV0JLSS8zMjlMcmNaU1ZBblYyYUJE?=
 =?utf-8?B?NDQ3YlA1T3lvWjRRQmlnL2tHK2hQblFOSlhoTlV6UnM4emJsRnM1RGdtSEZY?=
 =?utf-8?B?TERDSm1kWUZSelhzN01wcW5mVVJCaEVOTzJYaWZuOFFNaUJFODNqUTFwK0VG?=
 =?utf-8?B?RnhRSitETXJkMlE1SmxVWG83dFJrREVSVTFEMUliVksxMW1EZUQrdVFPcElG?=
 =?utf-8?B?SHJyK3kxNmZMcVAvcGJzbXdHcEh3a2FBMzNWbzhteTFZMnVTSWtEZ3crS0lx?=
 =?utf-8?B?SlMxbUpqazdjelU2NkY1UXVTSW1MQXpZR1hNNFM0TFRXQ2VlZjdsaFdpcjc1?=
 =?utf-8?B?cUViYUYxcDBaLysxblVDSitTNmppa2dCMHRRdVVPbjFlVkJMcllRRE9zU2VX?=
 =?utf-8?B?MEtOc3lrMjdqN2g0MEtZZTZUbDUrOC9pTjdMU0c4eXpRb2tXbm5zc3Q2V2ND?=
 =?utf-8?B?eUpUNXM0V2tnZlYzM2R6ajF2RENJK0dMZWRmRDMxZjFOZnNiNDdDN1grTzFC?=
 =?utf-8?B?K0lmVFJaUWR6Z2d4T2JucS9XR3U4ZzVabS8rNXVYa3pKNjhNcWRxT2tnUU05?=
 =?utf-8?B?R093MEdpYkR4NGNNQzMyN3E0L0d3MjlHT0JFN1Fualc3dWd4UG84K3ZsRkox?=
 =?utf-8?B?NXY2SlRQSk1LcERGSy9SM1FsMk0vd0h0VDBJVEhXL2c1T3g1Q2lLaXk2MHBu?=
 =?utf-8?B?MGRxYjVOVWxPcWFCQ25PaExJS3N0bjloU0wrS0YyVFJFelZLY1dJUkp1eW0v?=
 =?utf-8?B?OWYwRXkvTGdIYk9yNGNrRWdZQzFRc0U4ZnowUU5acmZpUjJrKzJtTlpBRGt2?=
 =?utf-8?B?am0vQ0duQTlxQ254YXRtNUIvUXlsN1F6cG15SG55OE9KWXhONDhqZkRYUEEz?=
 =?utf-8?B?Sng5alJpMzFXVnJZUzQrTHZpWlBHdmFyQmF3YWxlZnBlMlNaUGFDUU96TjBo?=
 =?utf-8?B?c0tzWmJsWFJuQ2FoTDhUb0ZheXVCRkI4SnV1UFUwbFI3VEJCUXBnTHFWMTBV?=
 =?utf-8?B?dTdYVk9oRWk0YmcxZkp3ZVNvZHNoa0hEM1d5dFZWbTVodC8yTzQwL3pGWGlH?=
 =?utf-8?B?akI1MCtrTlAvdEtrdTBoOVI1SFZCa2Z5dVBQUzJ4Q3Y0WTVwMVk5Um1KeTQw?=
 =?utf-8?B?SVh5T3k5VXJKdjd4V216VXpTc2g5Mk96SkRRWUNUY25BQXJYeUVIMTVFM2o2?=
 =?utf-8?B?RDVFK1FSSW42RGlRQmc4OG91L3hsdHplS2NVUFpjSWRSS2p4ZnA3bWhkREFE?=
 =?utf-8?B?enNpcXpCNkxiY0x3dVdDTlFKZk1kUU4ydEQ3em44RnJYaGZNclNJUy9iT290?=
 =?utf-8?Q?0bqK3Q6YYq4xX0GYU7W8gFsfS?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f0034d-d6ed-4885-5abf-08dd56a2091b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR14MB4207.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 20:13:29.5865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SPJPZApB+Oo8X5Wi/AUe1L0E3QeWQWZgorW0Gw6ruczafyA3G0kbHL2gvDUBTcp7bcgSn4ggxUWAOzsT3Do9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR14MB5559

On Wed Feb 12, 2025 at 3:11 PM EST, Krzysztof Kozlowski wrote:
> On 12/02/2025 20:56, Sebastian LaVine wrote:
>>
>> ...
>>
>> +static int imx728_reset(struct imx728 *imx728)
>> +{
>> +
>> +       int ret =3D 0;
>> +
>> +       // Prefer hardware reset if available.
>> +       if (!IS_ERR_OR_NULL(imx728->reset_gpio)) {
>
> Here can be ERR (although why?) but...
>
>> +               gpiod_set_value_cansleep(imx728->reset_gpio, 1);
>>
>> ...
>>
>> +static int imx728_power_off(struct imx728 *imx728)
>> +{
>> +
>> +       if (imx728->reset_gpio) {
>
> Here cannot.
>
>> +               gpiod_set_value_cansleep(imx728->reset_gpio, 1);
>> +
>> +               usleep_range(1, 10);
>> +       }
>> +       clk_disable_unprepare(imx728->clk);
>> +       return 0;
>> +}
>> +
>>
>> ...
>>
>> +static int imx728_probe(struct i2c_client *client)
>> +{
>> +       struct imx728 *imx728;
>> +       struct v4l2_subdev *sd;
>> +       struct v4l2_ctrl_handler *ctrl_hdr;
>> +       int ret;
>> +
>> +       imx728 =3D devm_kzalloc(&client->dev, sizeof(*imx728), GFP_KERNE=
L);
>> +       if (!imx728)
>> +               return -ENOMEM;
>> +
>> +       imx728->dev =3D &client->dev;
>> +
>> +       imx728->regmap =3D devm_cci_regmap_init_i2c(client, 16);
>> +       if (IS_ERR(imx728->regmap))
>> +               return PTR_ERR(imx728->regmap);
>> +
>> +       imx728->reset_gpio =3D devm_gpiod_get_optional(imx728->dev,
>> +                                            "reset", GPIOD_OUT_LOW);
>> +       if (IS_ERR(imx728->reset_gpio))
>> +               return PTR_ERR(imx728->reset_gpio);
>
> So can it be ERR after that point? Looks like not.
>

I see what you mean -- I'll change the check in imx728_reset to a simple
null check in v4. Thanks.

> (Jumping back up to previous inline feedback)
>
> ...
>
>> +
>> +static int imx728_set_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +       struct imx728 *imx728 =3D to_imx728(sd);
>> +       int ret;
>> +
>> +       mutex_lock(&imx728->lock);
>
> Just use guard. That's actually perfect candidate.
>

Okay -- I'll include this change in v4. I'm not so familiar with using
this interface, so please let me know if this is incorrect:

diff --git a/drivers/media/i2c/imx728.c b/drivers/media/i2c/imx728.c
index 4a6dfa0a6c58..d7d62e9917a4 100644
--- a/drivers/media/i2c/imx728.c
+++ b/drivers/media/i2c/imx728.c
@@ -9320,17 +9320,16 @@ static int imx728_set_stream(struct v4l2_subdev *sd=
, int enable)
        struct imx728 *imx728 =3D to_imx728(sd);
        int ret;

-       mutex_lock(&imx728->lock);
+       guard(mutex)(&imx728->lock);
+
-       if (imx728->streaming =3D=3D enable) {
+       if (imx728->streaming =3D=3D enable)
-               mutex_unlock(&imx728->lock);
                return 0;
-       }

        if (enable) {
                ret =3D pm_runtime_get_sync(imx728->dev);
                if (ret < 0) {
                        pm_runtime_put_noidle(imx728->dev);
-                       goto err_unlock;
+                       goto err;
                }

                ret =3D imx728_start_stream(imx728);
@@ -9349,15 +9348,12 @@ static int imx728_set_stream(struct v4l2_subdev *sd=
, int enable)
        __v4l2_ctrl_grab(imx728->ctrl.h_flip, enable);
        __v4l2_ctrl_grab(imx728->ctrl.v_flip, enable);

-       mutex_unlock(&imx728->lock);
-
        return 0;

 err_runtime_put:
        pm_runtime_put(imx728->dev);

-err_unlock:
-       mutex_unlock(&imx728->lock);
+err:
        dev_err(imx728->dev,
                "%s: failed to setup streaming %d\n", __func__, ret);
        return ret;


Thanks,

--
Sebastian

Please be aware that this email includes email addresses outside of the org=
anization.

