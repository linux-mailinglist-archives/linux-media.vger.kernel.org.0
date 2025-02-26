Return-Path: <linux-media+bounces-27087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BCCA46707
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 17:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE6113A1D04
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3771B22370F;
	Wed, 26 Feb 2025 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="IG3nGALE"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2134.outbound.protection.outlook.com [40.107.95.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AE322258E;
	Wed, 26 Feb 2025 16:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588632; cv=fail; b=Cq2R6wIAVotkEcQKhnkwp+MRM5PEtMSNoHiuBXMthYgas2amIv+xYSoQyqk74s/9l2PZO525r8UyUo16ajjO1JxToOykYA1i+TeBqggYnkb8WUEi/+oXQnHE1GWiJ8wSG88W3VicbFtAiGCtxhH36VOsl3t49tFnHjAZ7EewPA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588632; c=relaxed/simple;
	bh=Rd9nC+NKMn7+7nJGHbe2O9p5BcScuJLjTAtsMKTsIs0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Toa72AU8rOZOmxlxrUR5t4jyDUdrnwxa68WRoiH/gPdffDJXkrJxNs6jhip1zHNTq025aIQLJEyBZlOzihAT83fbN3gIGOXu15m4aAbjvUHxqIa1G5JAgeNJIYTXEI4+rjegB455ZdSoCk3+bqHcqa0UD7onFfZIYcNcoY+n25o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=IG3nGALE; arc=fail smtp.client-ip=40.107.95.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1+jtD/NhCYgzqtS8lSU7/aETAYTfKHng+vPH14Tx37XkVmXlj9ybyIj0HhwPEw2xpQHoD0mhUaua2eIejMFfglEy9guowFtlTTyV40g6bTNljPhLq+Qjy12YfsG1XUudJsQJrFiHY3lZeHCfC8fJK2IoD1mssAzHxKbeWDUe3aDtAAlzEkNy3TsikuJpRDotBIycluWZcgT3SR6M6bUJQNZ6e7PV26MTMFTgag477L7KPKG+TC2yalj+BKcXvuISeVkb1e0ARLVgN+k7MrUprvmyMlYbbQ66VnXlEBpaNJlKAH76p66EFE4je5eQjGnA5+NEKep4MxAmXkye77f/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rd9nC+NKMn7+7nJGHbe2O9p5BcScuJLjTAtsMKTsIs0=;
 b=VechUyEg1v0lSOUmyAMzm1sO7N1tRoGh3LnbW90K3sofsXjhPWATNyRsMayQk1abddl3eqbo8OLciY27RSR9Iq/Q/ALB3oBno7kW9ycUTu6IYsftGEYivafBPfB6I5LFAcIu2zaL8a4Vvc/CnKc4Xq6GqXxlG/iQz+YwUGT2fonE4fh5RF/VueOLGFJZliYxHav+XkJp0+YDTC+d2yUYT0IkjIJ8IY58w3F1oEBdtistaD/tlxoNcDyboTrcIlmR+74DXqtEYq0JUusimtutd6FgJDhAeYVhv89ZIZPuSj9R2utpz2EPHRFLLRbmGi7OdqWb38C6IpCzgJ3I3yC4Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rd9nC+NKMn7+7nJGHbe2O9p5BcScuJLjTAtsMKTsIs0=;
 b=IG3nGALEqoToYjWflmHLCF7IFRkX8U8rSo9bH8hg77OjqYSs+m5dkcswyT8uD5GzRr3VBUM78f0maGgsrXREbML7dlssj8gqWjRsY4oW7lLSEpvljjw5kqeU8MSvG7nHyb61TpWckIzX7L3cFqk1E52YHy8Sfy8oD/wvLYt3Ung=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from MN2PR14MB4207.namprd14.prod.outlook.com (2603:10b6:208:1d6::13)
 by PH7PR14MB7033.namprd14.prod.outlook.com (2603:10b6:510:248::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 16:50:23 +0000
Received: from MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7]) by MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7%3]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 16:50:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 11:50:20 -0500
Message-Id: <D82J65FKPE98.1GAVEAPQ6QN0N@d3embedded.com>
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
Subject: Re: [PATCH 0/4] media: i2c: Add driver for Sony IMX728
From: "Sebastian LaVine" <slavine@d3embedded.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <251cbe57-da12-47a8-bcf4-be0a0c4082f6@linaro.org>
In-Reply-To: <251cbe57-da12-47a8-bcf4-be0a0c4082f6@linaro.org>
X-ClientProxiedBy: BL1PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:208:256::33) To MN2PR14MB4207.namprd14.prod.outlook.com
 (2603:10b6:208:1d6::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR14MB4207:EE_|PH7PR14MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 4981ba63-403e-4c46-b08a-08dd5685a935
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MHQyS0ZjeUcyTXZtMWE3UVMzdm0xcG1NWHkrUGFlUXNQMkYvc0VhSU5JbkMr?=
 =?utf-8?B?TlM4QXRuRXVaa0N0WWEwUU9ieVk1c0psRzhLRGg3RHBQZ2c2RkcrOXJHUXZJ?=
 =?utf-8?B?SjRkWlNETk4yQUZkUTRHcDV5NE1ubTFJQUJlUWlHUkZyVUJpQ2Q2WDZNTUNi?=
 =?utf-8?B?UEZzVUJGZEIwWEVTNmZ0WFhwL0ZsWU9iZTFtWDAxVGRqVEo5WFpmU1FPN2Zr?=
 =?utf-8?B?ZGZCNzUwZGdLV1pGRDlScEQwKys4elBKdGFiaTMyaEZBMWxxaWhzcmNpR2xy?=
 =?utf-8?B?Q2tpMG82NVUvckRjMTY4RUQ0TFpocllGL2w0OGc3d0EyV0ZHQndhZE9xS2FM?=
 =?utf-8?B?dXVRRTM3bW1qMkRzL3lwaE5MU250dFpoQUNDeHJ2bVAyRmxsREEya1BidWU1?=
 =?utf-8?B?RXBzZjFjQ29FQnRtV1hJaUZUVjVtTHRMZXYzazFhV0NrdnMyR2M2UzlCWFVS?=
 =?utf-8?B?bkdoazI5U1dET2cyQXNhbVYrL1h6NDhJZFQzY0xrWmVwQ21XaWJVV0tZcXg3?=
 =?utf-8?B?RHMwMGFySENtQklEQ0lTVVREWlNMOVpsVHc1dFk0S1BEeUdTSGp3TXlRYi9Q?=
 =?utf-8?B?cFViTnVDRFNlWERQN3djekhKeGI2WnhqYlJ4Rld1ZElxTWg1U0lyb0Job1B0?=
 =?utf-8?B?Qks2SEFBZDd5MVRhK1NKdDRML0ZmZjJkbHB4QU9BNTlJZzlEZzRPUzhwc0pR?=
 =?utf-8?B?bmZkck5lNjRtRStQSU9Vb05zSFA3RDRiMWJvY0pNM09CeDNKSmRIRThUUVJ1?=
 =?utf-8?B?czJRYUR5bzlQYjREMCtKakNiNUJEZ3o0a3VFbENIUCtTN20xZzRpMGE3ZWZL?=
 =?utf-8?B?RVNIYitEMDFlRmU5Vll1TkVYZy90d2V2K3dCR3JhbFBKeGtLa0Z5SXRGaDRr?=
 =?utf-8?B?c1FRcitrdWNhWU43QVJ3dE1HTS9DRHpYN1NhRjVjM3puWmd6V1JLQUxsUWNh?=
 =?utf-8?B?RU54dUpkRTJRcUlGMFltUERiK2FIdTVKQUZaVlBUTGVPdXdlY25WWWUwMXdq?=
 =?utf-8?B?Tk9tZGJiR1crdWpxL3F4YkgyYXpGQ1UyMHlNcE9MQUJ0Mm9zMFFReDN1eS9n?=
 =?utf-8?B?TXNncWtzRmlDNlF2dEJCbmI1Wm5hYlF5VmxwVDVmZy96TGJlMWZWNGU1WCs5?=
 =?utf-8?B?MFIzUGFidXdvazRTdWVWL3RaY1NZY1p4eGtMVTUrR2lKZmhkZFV1VGZRWmx6?=
 =?utf-8?B?aXI4S1gwb3pycHIxbWNWdmdGeXltYk80dzBwNEhTekM0OXBCRXVMdkxWaFYy?=
 =?utf-8?B?SzMzeWo2YklPdVRrYnhLTTh6YmtlY29KMG5Vc2YyZEsvR0FIUE5qQTRJZG1w?=
 =?utf-8?B?L0hFMlpmMjFFYTlhVjhLUXVESW9PcEUwc0lYOFY1VnRRSnpGS0tPVXdtUzM1?=
 =?utf-8?B?Z1N3UzdDRVlmYnVzN2VZZVlmOGxMK2NveVU3QnM3V0NvWFdvVkVDeDQ5VEpq?=
 =?utf-8?B?Y0F0bFZWbytwaU5XU29PWG9HWkpKSk5UNnU3RG5HM0tSQ1NGRC9JZVNUUHZo?=
 =?utf-8?B?cW5ReWxqcGhyTEFPMmFzM0FoVzFYdnZwRnphVHBKeEV4bk5aQkFsQm1ZalNY?=
 =?utf-8?B?YVpyWm9WSGJxZlhseDFsU28zdjV6MWNIc3h4Zkd4TTh2TmNvdWhjdWRyeUoz?=
 =?utf-8?B?dk9vMDNlRGgyZVVNNVVHdmJVOC96aDUvQ0g0VmRQeUtWS09wMXBtd2ZwU3JF?=
 =?utf-8?B?eGZCMHYvaXE3SEZuMlV2N1E5UDFDUzQ5UVJ4ZG5BNWdLR2RuWmVFNmpCcGlE?=
 =?utf-8?B?UERmdXI3ejNGZHpXV2RHejZaZ0hIRStnMXRZd3lBaTNpUVpBcSt6NHA5d29F?=
 =?utf-8?B?bmFzWllHeG0rd2gycVorNk1MSWcyYTNkRjBoWTdUY3o2aWpadDNITVA4MXFi?=
 =?utf-8?Q?nYtl+Hf//GpO9?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR14MB4207.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dE5DTVlEdHJEMEVmUllRRW1FT005NVUzWHBiellUdDVZTlp6aFQ1LzViMFE0?=
 =?utf-8?B?endkMVV3aW8zT2lLVUdiR3oyOVN6WlB3ei9qeG9WbmlYUEluWnkzNmhLeklt?=
 =?utf-8?B?RGNQRXg4aHEyUGYwb1VNcm9LUHJyT29NRDFTeEY5YnN0cFdickx2UUtzb0to?=
 =?utf-8?B?Zy9hZlAweVJtcEVXQ0IrM1VRWVVQZm5BWGxqWGsvS3NBK2RDdkJLQi9JNjhM?=
 =?utf-8?B?OUQ4bU5ONU8rN21zQW8yaTMwRXFPZHRoekpXVENxWG0rM2s5NFNmZTFBVlJW?=
 =?utf-8?B?d014NVNyUmhFSzdzSUpmL0xzckttOEw1SFNpRkRBZkpxeE9wejFaUmQ3SnEz?=
 =?utf-8?B?MUlHcTROQjZiNXlsdU1hYWVTZEc4d2tJb0R5Y21hM1ExazBHWC9hNFVidDdu?=
 =?utf-8?B?anlhS3d2aGNqcGxqWmFEK0htTnlsNmJrNzVETFRJZ1E2b3N2cndwMFVQM0NE?=
 =?utf-8?B?b1I4dWRLWitieFYvbUNSK1BpS0trbkhuOHZQUjhxUG9GbVJvZURmNThyZzB2?=
 =?utf-8?B?WHByRU5lWVVzcDBCRDNwSWZTeFMrQ3A4Syt2dXhRZFo2bkJWcUZPRWdObGh3?=
 =?utf-8?B?VzJHZ210TzY5OVNrb3JGdFRNWTBzYzhlcXVVYzV2N3JKUWYrMzJXVVhGUmdh?=
 =?utf-8?B?V01TS08wbmNlMUFoWU9OK2dvY3hBYXRrM2NkejdFcmJKTGFVRVl6RGlrcFE1?=
 =?utf-8?B?RnhUaVNOTmYvbWErOUN0dDNINk9XRzJkVGtqMGxSTDlwcjF2bnR0bTVUZFRI?=
 =?utf-8?B?L2hHd0pESzFLdHcvd0FyTk1PSVZIalc1VEhCM1MrMmVITGNTWkdsQzZwVG1y?=
 =?utf-8?B?UzZWN21qMzBBclZnN3BjcUJTVVpCVXFtTmZEUEQ0MTZaVk9EeG5pVStmQXNS?=
 =?utf-8?B?OEgzMWpZOFFyWUpXL3psYkg2Sm8xbkdqMG85Q0h6VjVuTVRNTmVCbmZOc09G?=
 =?utf-8?B?OHAycVRLSXh0eWdzeTlSd1ZMZ0puTDg0RDNmeTBXYXhiU21qOTBkbFpsRFFa?=
 =?utf-8?B?a1JkaFk4S2Zka3gzQnpWbUE0MXlwZ05qV3hPZHRCWUI2ajlsUWlTMFlCYTJE?=
 =?utf-8?B?U1YwZE13TnlIYjNKeVlKK2VCUG5ZVkRrbDc5WmhmeDZoWXZ6WjM4eHR2aXVy?=
 =?utf-8?B?ZmdHR3JRNGlneTkvakFURjZXRElxU0NxVHp3bk1qTFB5eGE2M3RYZ0l6RXdP?=
 =?utf-8?B?a1RWQ04wZ2VrMEdtaFBDWTBJQ1JqYWpNN2h1cmNSUUxzeXpNaUxqVTl6NnBk?=
 =?utf-8?B?WExYK3JZVExQM2NROTlBNEdPbWlkV200alMydFl0QXhpYU9VR1dCNUNhUitl?=
 =?utf-8?B?U1IraUg3VnZXOFBMcDgvMkszNmlGMnpvc3U1dXJHdDlZT1R5eFR5U0crQ3VT?=
 =?utf-8?B?NmhVRWE4SjgxYmxoV0NiZVVLanMzM0cwbHVNZFJuSit5bWJhNFZVM0I4aWYx?=
 =?utf-8?B?OXdNbHQydlhqV2VoTDRkSTJiOUxGSUJLTURVdXlFOUZBSTFxcGY0QnBXdEIx?=
 =?utf-8?B?L2ZLV2tMUG9iRkdXSnE0RFhsaXRkVSsyb0xVS29sVVp1UWh4aW1YZS9wRGNG?=
 =?utf-8?B?dEgwOHdYV3pWd3loZXlmRFl2TDl3MEJIdXJWRmJtcm5adlZNaXdHa0QxSjJ2?=
 =?utf-8?B?VGpsMVRpYUVMY3E4Z2h6QzVTWHE2b3dUbHczWjBwNGJjck95YnJsWEVLWHVs?=
 =?utf-8?B?dFh3dXFwSm9iN2VwdkI5c1NzVStEeExvQ1Y3Z0hkNkduWHVoenBhVU15djJn?=
 =?utf-8?B?M0NVSjdiSHZqaVYydFlUUlY0Q3B2UVUyQmU1YWYrcnFrczljRnBBUm91MElu?=
 =?utf-8?B?MW5BRGo5RWRkN2tMN1RTYURUZ0h4SVJxUUliOWxORGVrbDY1RW9pdzRpanM3?=
 =?utf-8?B?T2s2TkhzcmlTVmNNYm53RmtoZmwrVEtJbENRU0IyVUlVUjBySnJaeE0xN1Ux?=
 =?utf-8?B?a0Q1NE1FRmpLQWF3Tk5QMHhYMmRNdzZtUUZlc28wbzhSUWk3REtCaUZPMy9K?=
 =?utf-8?B?ME5jeFZlQ013blhwejUyQ2FXejFFUCtDcUpOL0dUWVd2L0U4K1B2ek40NFFp?=
 =?utf-8?B?R3JFZkhmeTAvVWMvMTlYMjBxVmJlRnY0Z2NGcTh4ZDNBNmRVcW9XTVNQcGxv?=
 =?utf-8?Q?V6SY61DFmrHfQ4T8tdZIkqO2A?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4981ba63-403e-4c46-b08a-08dd5685a935
X-MS-Exchange-CrossTenant-AuthSource: MN2PR14MB4207.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 16:50:22.7454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/gO/FqZxR5nM1KuxiC2tk+GXHO9nS6AThhVjbEzcRlXjVsPGh5ephTngrLha2ul7pOIj33MHu918BffZFABpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR14MB7033

Hello Krzysztof,

On Wed Feb 12, 2025 at 3:04 PM EST, Krzysztof Kozlowski wrote:
> On 12/02/2025 20:56, Sebastian LaVine wrote:
>> This series adds a V4L2 sensor driver for the Sony IMX728, and related
>> devicetree overlays.
>>
>> v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38
>
> Your Cc list is neither correct (incorrect my email) nor reasonable
> size. You cc-ed several maintainers which are not responsible for these
> files.
>
> For next version or any resend:
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.

Apologies for the extra noise -- the list of folks I CC'd was obtained
using scripts/get_maintainers.pl, and the impression I got from the
documentation was that all of the people that are listed from that
command should be CC'd. I will be sure to prune the list more strictly
next time.

Thanks,
Sebastian
Please be aware that this email includes email addresses outside of the org=
anization.

