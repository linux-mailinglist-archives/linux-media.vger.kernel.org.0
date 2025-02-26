Return-Path: <linux-media+bounces-27103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A28CEA46E27
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 23:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6CBD188C883
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 22:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6941326A0AE;
	Wed, 26 Feb 2025 22:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="AkMU394U"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2094.outbound.protection.outlook.com [40.107.93.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FEB26B95B;
	Wed, 26 Feb 2025 22:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607596; cv=fail; b=EyDRXYKExOY6n3caSvraIA9b02pvP0psYv/zq/sd8Z0CaM85zSE9Rd3+cOL+AHgUxXaADqU6370E1t/5P5i851wSLCsYZloNkHboS5mlx0mrGAL9AwL4lWWvrSrUpc7tNWsB+Yo524ZD5Sl7hk/NfVtBh7eYRupiLE/Tl1I/AJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607596; c=relaxed/simple;
	bh=vyAq73jl5jb3ypDp8UQhR2DkPLOAwFTzr4339emn15Q=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=pwTX7A4RQ+nmbgH8kGApoxVQdcSBwBDuycd0fHjrWK4EnFEt/wDadxO0Eo8++4pHDz30wnoZP7yPgjjhn6/rXG12TwPQAt6bjPKR7ARkUEzYazaEoC79ZNl01Qi8bpSbyi+xgPgylujg4PuVh16Nv6n42ojOffQZMkQe9V11x8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=AkMU394U; arc=fail smtp.client-ip=40.107.93.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oF1ovbi9B4/i2N1zFXETCmT/5/SsRZGTHR57nYG1vQx4qpQSWboDkDbQiVuyt/m4E3TMLvlK6U9+RbIAED3DJWQexmV0RLa/t6VI1u9ULLUg87yAqdgtKe1uiYf37SJ9QwDMOFn2Mh6DbdUO0SmtSklQq5oTpzhzK9TDtzcAySpFx/f59jJDFpaiwlqWrmwbaoQZEjdVPU+AOQjiBKXicNr7iBU5PUMcrsw47IPYwGdDM1vJUs/Lf+2qpo962xHDQh8NdjF+LHy5PxcsKYq2uRUJmIPb4rsd19wAPequRoZcOwY0XW1haLIzaXBcZuCCtihEaArOI3TlBvGurjKyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB570Xixa6Z6RY/GOTZyvQQ8K5oDjqZgJffHhApcpjg=;
 b=G9rmRpPCdrYiNNtrnBom0aKODA9DMGfKfxLmZoOBv3OuSLfsAZShMX1RKFs01Yq0JLlXFiO2h08aGkibFCdVxNifi5QuxoFzt2D/9cbvLGJz54QveaZ3ORxMTEHnzwP7q6SrW0IH4IokkLPUhvqj6PDBupF7GsxMI98apoMPJz5s483S3BCeKo9DwajUeePIMVhrURXtDekIBNtYOPiJMKWFGc2eAmIcGOTELNx67B752WX8Ysuwfnx2MHzElkIDBJeQERN2Vak8DVwnI6gyGUH3rsc1tE9+8LC2LKr8XjDvVjrJ0PNjApntmRXszSskailpnlcKgvmKDMXr5fSNpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB570Xixa6Z6RY/GOTZyvQQ8K5oDjqZgJffHhApcpjg=;
 b=AkMU394UCirUUxlsgm0WdWVKtCaD29fClVHuhLsgqVK4Qn4mbEo+fL36KwSJqC0fC0SSnsV4QfMoV/dYFw03JfpkrYsN1T4HpXcrmB33cnDmcCC/DuLxhnX8FilbS2LsiWaRzxykRfi0cdo+Rj6YmewKoLFnbVH4eWoGCR95CvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from MN2PR14MB4207.namprd14.prod.outlook.com (2603:10b6:208:1d6::13)
 by MW4PR14MB7386.namprd14.prod.outlook.com (2603:10b6:303:1ea::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 22:06:28 +0000
Received: from MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7]) by MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7%3]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 22:06:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 17:06:26 -0500
Message-Id: <D82PW63WUSVO.2WDJFHDMJFHID@d3embedded.com>
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62a7-sk: Add overlay for
 fusion 2 board
From: "Sebastian LaVine" <slavine@d3embedded.com>
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
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
 <kory.maincent@bootlin.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mikhail Rudenko" <mike.rudenko@gmail.com>, "Nishanth
 Menon" <nm@ti.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob
 Herring" <robh@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Stuart Burtner" <sburtner@d3embedded.com>, "Tero Kristo"
 <kristo@kernel.org>, "Thakkar Devarsh" <devarsht@ti.com>, "Umang Jain"
 <umang.jain@ideasonboard.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Will Deacon" <will@kernel.org>, "Zhi Mao" <zhi.mao@mediatek.com>
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-4-slavine@d3embedded.com>
 <0f279079-98e2-45f9-b4ca-32f2704fd616@ideasonboard.com>
In-Reply-To: <0f279079-98e2-45f9-b4ca-32f2704fd616@ideasonboard.com>
X-ClientProxiedBy: MN2PR06CA0005.namprd06.prod.outlook.com
 (2603:10b6:208:23d::10) To MN2PR14MB4207.namprd14.prod.outlook.com
 (2603:10b6:208:1d6::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR14MB4207:EE_|MW4PR14MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: b19d9218-a35e-4aef-b7e3-08dd56b1d19f
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eGZaVy8yT1ZjZ0dmT2F5RkFLYlhWaUJXcVJUOTlhQm50dnFONmhURWQxdzNy?=
 =?utf-8?B?aUpCRkdXK0Z2aXJsVmZWV2RwRGNKb1orOEdjc1g2d3YyZVBTb1ZVZ2hvQ3pN?=
 =?utf-8?B?NnRFNVpSMThvaWNERk1tanpJVlN5UFVxR2tzbUtrYXl6Tld2WWpiY2lSZU9l?=
 =?utf-8?B?OTVYZmRxdmwxTjJwZ3FvSDd5TmhyZmh4c0piMFVUR3hnUGRialhsZ2pHLy9C?=
 =?utf-8?B?bjJ1cjBISnU1Q2RSY0J6OU56ODBwbXBXQjlGT2VlUzNMT1dEQWVMdVVFU1Z0?=
 =?utf-8?B?L2MyTFhWWG5VdnlTa3RxaDhrQUlZQi9VVm5ZNkRnVXp6SjlqUFVnWUt5SmxV?=
 =?utf-8?B?eGEyUlplUXVFbG1JbUZWdkRwZUFjTG55M3pUYjUxVEpnangxcmUwWENpVXFw?=
 =?utf-8?B?cmtSdmUwQ1U5anprbGtkNDg3aGI4WEdFbmYzSkJjdTlmY01Fak15M3lWZGZQ?=
 =?utf-8?B?UElzTXNWUnNNU3A3b3Q3UTdzL0h2L1JmWnZWWjZiVG9Lc0lLNXNRVTdvaEtK?=
 =?utf-8?B?eWZac2I3SHpwdE1NNm04ODhjaG1lRUpEVXNGRndsVnFQdUM3b3EzeGJUUXI3?=
 =?utf-8?B?OGh6QnRXQll3Qm1ITjhRZ3JMZHNwaVhhWXdhRDA0NjhJbE9VRzQxdlZZMldG?=
 =?utf-8?B?L0VaMXJXaUJacVd1WXJTb3JyZUNTMGpENC9Wemt3S0QwQ3ErYmJXekxraGNt?=
 =?utf-8?B?ZXlEdWNMN0ttVEF3cXJYc3VoOWNnZXJGbzNSNkNIL25yY1NTNTFZa1lHeUYz?=
 =?utf-8?B?TU9FeDlXMWlaVGY3MFJyU0ZIQVRKUVhMazc3Yzd1eG91R0NML2RlQ05XbFlX?=
 =?utf-8?B?OEpWWUFUdlJqL21WakJ4b3RPU0tTcXI1b1JDTnpLejB6TVlubXJReHdyU3hi?=
 =?utf-8?B?KzBNOFdXdDRzL0d5bUVHZTdZRGxFRVJGZUZtenZVVE9SWW5iVVJoS2preEln?=
 =?utf-8?B?bnA1Tm9RbFJCL3NpVnkwWW9XbnkzSExVUTNZMkIwNzBVK3JwcytZYXo0a2JE?=
 =?utf-8?B?bFZPRDdHSFNXNys5bTVwb1dPa3paYllRZ2Jxd2NmV3dpSGtyZWhUUlc2aXor?=
 =?utf-8?B?UFJvZndnaHNPc0ZyS0lSSmVadGRCajUyMTJLeExuSHJEcWlVN2J5VHdPVFdW?=
 =?utf-8?B?S1FqL3FXT2RDcFZPT001clFVUndabHdiQmhtdTF3RFZxdkY0Tm5FaDE5cUVJ?=
 =?utf-8?B?dmE2NmxUZ0hpQmN4UkxGNFRZbW9NUFYzMG0rSkFUSmg4czZHWlh6cVhiYjRP?=
 =?utf-8?B?Qm5iR2xQZlJQN0REY1g3eDZQcjV3SlZRQlF2c2pTdTZlcUtRS1FGN0R3R1ZV?=
 =?utf-8?B?NGVhTms4aHZac005alN0Y2xKYTlKVDA4K1ZwSXY5TTl0Tm5QTnU3ck1HQXZm?=
 =?utf-8?B?REZKRi9qQTZGT3JRK25qcVpQNGxwMHVHUEpEbW5UVmcxRkMxQTBlLzN4THZV?=
 =?utf-8?B?cGc2aWEyYUJ1cXhQQUYyV1kyVVJRYU1qcVhDRWtVZ1RIQlFlWjlqclBMSXlE?=
 =?utf-8?B?VHk4cGRKWnBvOWdlYzhlR2srUzR3RGRSdW1OYWlxc1RiYUFkRlpMdHNKWkFW?=
 =?utf-8?B?bFdPdVN3aUtkN2M5ZFZPK1lQdXpTVjdZN1ZRMEQxaExwZGZDWXB0ZFBMaVV1?=
 =?utf-8?B?NlNVVUFURzczY1NUSURBdDk3MmhpbGpiU0tVVXhjK3kyMXVNTDZzNUg1N0hy?=
 =?utf-8?B?eERtR1hQb1NPZk1UNmRvSTg3aGk5eURxa0VVdCswMEV6emxQTm10UndmTk1E?=
 =?utf-8?B?Q3ZXcTJTdmNOVDV4NmhrZHBiSEZKSzdWaGt4Y00vUVozb3ZkV0ZQalMzQnBy?=
 =?utf-8?B?UTZRWlhzYXBRR2lYM3JGZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR14MB4207.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TGljQmJVek5nWm5LVzhQVXJ3TzQzcy8wNXJxSEJlUVVxK0htVmhsUXFkS3Vx?=
 =?utf-8?B?cVUzLzNKYkJBU3krTWZYV3NTNk9BbUJ1cmlvcDRzQTVpTjdNZStvOVZobWc4?=
 =?utf-8?B?WGROM0pleTdTbzIybHB4QjVmSTgvdFlkcENCVkpKWDF0cGhISlBpZm5Pa0hO?=
 =?utf-8?B?VFN0RDZtbGE5Mkx2bk95YnpNa3hQMlhQbks2K0gra2Zjb2l4a1Q5T05XVm85?=
 =?utf-8?B?N1dNcU45d2lsaWZQeVlIS1E2OTJ6N2lOMmRMS0NoV0hHQ0dFb2tKcDlRczNV?=
 =?utf-8?B?TDVpWTNrR3dBeUNKYjhuZFplUHBObkgwN21vemhDWjUyTCszVjYxZSsrdmRj?=
 =?utf-8?B?bElReVBRRjVyME1KSjFtSkJVS2p5bFZFclppUDEvck16OHFXRG94UjdYVUtq?=
 =?utf-8?B?bjNWNDhKcHppTVpRNGZqQ2pMOHVBYVNGTjg2UGRlTkZIc3MvekQxTVVtdmhr?=
 =?utf-8?B?ZG0ranlZSU9aRE5TaWZNVGpHWVcrbHJJT0d6RVZ2SVpybUhwMVJBeENweFQ3?=
 =?utf-8?B?VmtLOVBUUE9tSExHbzUrSy9KRmNWTTA3Q1cwZ1dWWmNyWmw1eFV5NlZPSGFM?=
 =?utf-8?B?UWJGbVlJVFdpd1BqSEtHRnJpaUNzQjhTcEJ6ZUhZa1YwU1REeVhkQ1NTMWU0?=
 =?utf-8?B?blA2VjQ0TitWQUpHcUNBSWZ6QVNYQWtXd2FJdXV0M2xEeUVOKytFamgzVXlU?=
 =?utf-8?B?a0xKVUovWEVITGJXZHZyU2ZodklBR0djT3M4cC9nZXJ0Z0tmdmpjb0JxNHAw?=
 =?utf-8?B?dWs2eEgwZC9jTnhqem1NUDFINnpad2ZHOUd6Rk81RzV4YTV1UGpDRzVjemlN?=
 =?utf-8?B?ZElTUkw4Tm1vV20rY09GYy9lcUNBamwyUVFHeDgzOHNMN3ora0Q0YTYrbzNG?=
 =?utf-8?B?TmlmL0hvQ29jc3FEVDJBcTFheWlSSys0aThEOVlFYjdtOCtkVmFHbHdmSHhB?=
 =?utf-8?B?T3RLNkM5VWRNUUhCT2d0ZFZRNUNHRUNKNEdiUkUwem04b2xsTExFanZ1Yzln?=
 =?utf-8?B?SlR2MW9iVDVaeUZYc2hEUUtRWTlTUjhCMm9vdGUvUDA0QnRWY1JJYU9Yb21z?=
 =?utf-8?B?M2g5ZUk1TkwyMFhVNmVEL3hFUWFsMVhSTUxUNSszYTl6ZEdLbDBxRGRPSlpS?=
 =?utf-8?B?aVZaZzFUa2RwRjE4VlFESitMVitmcnNBbWZQcjg3WS9UWG05MmNIQ0JpZ0JQ?=
 =?utf-8?B?dVpJR0lWR3RzdVZXMEhXS1JPUDZSYXRXdzVkVE5UR3hyaVZkTk83T0lKb1I4?=
 =?utf-8?B?NklvRmJBcXBLSW1kV3BFVnhyWmh4YmpLNm5GNkthR0hyNmhBVGJDOE5kTkRO?=
 =?utf-8?B?VG5TNFE0QVZLYXhEMVlxajU5WnhjNnI5empvc2dSMUVMQjVJZ2J5RWROSUJi?=
 =?utf-8?B?WHJaREl5UjB4dU1MY2ZKNURuQ05BWmpRaDZLR3R5Y3NIcjYrTVJyUTdrVVJZ?=
 =?utf-8?B?NWl2eTZCWERPR0hTY0k0SUxBTHBLbktsY2RETmR5R0thY3o0YlJmOVY4TnJP?=
 =?utf-8?B?TVJoOFo1UU5UMDhLRXJxWE52UlNleFdpRkJrSDV2SWI3QzZ3ZWJlL3lnVzZu?=
 =?utf-8?B?U2wrMFdtTlRTRUIxMGZwOVZxMDZIOXYrVWx4R3BIRHlMZExNaS95YU5VOGFY?=
 =?utf-8?B?Q0hMNFRsTVBOb0xoU0I1SUR6QVZLbHY4MXRhVzh5ZFhhRUgxWVduMlN0dEk2?=
 =?utf-8?B?aE9RcWlBMVhMM1lSOHdXaGNyNCtHaGt0Q1NQaTJtL3JhbXA1b0xkUDlReHQ1?=
 =?utf-8?B?RWVXQm9oN0UrYUJnQ2xFb29wNGE5b2NvRTVIeTBDdFF1bXhLL0lRaytjZEpI?=
 =?utf-8?B?ZTNvL3VLWHRSaFpLbjBsZWlpN0F6ZHFSbUw3VFFTRlgxZCs4NVhDMGNOKzRq?=
 =?utf-8?B?YmtuanZjMlBidmhyLzZrZHFEbklIZ2c3emdNOGFlRGs3SW9hQ3ZYVlRZNFpq?=
 =?utf-8?B?UnUzT1JiT3JzdFh2K2NWYU1zZUxGTUxFK1FYTGxIS2tYaEw1V01hQkFkbmFJ?=
 =?utf-8?B?Wjd0bUNYMWVtVmZ6enZ0SlNkSkNnZjc3T0JFMVkvRHE3UWE1QkVPTFdxOS9s?=
 =?utf-8?B?UGl3UFVCYnBVL09ncEd0UXNIK0RPaWkzNXZTYjNrTlJCbXdjVHU3VFBkZngx?=
 =?utf-8?B?QlEvcXBFWlczcEd6RnRQek5YNCtzTDhNVE96VVJ0RUE4djJJR3dHV2YxVGhD?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19d9218-a35e-4aef-b7e3-08dd56b1d19f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR14MB4207.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 22:06:28.3529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6thIrntd3PlHK+dVm3xdyZk9s3RzewWzCwqfM8l7hdERV2WWLXYwFWkhy7SjM3qKLp8dKh5gPdU0oYUgYx1A7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR14MB7386

Hi Tomi,

On Wed Feb 19, 2025 at 4:31 AM EST, Tomi Valkeinen wrote:
> Hi,
>
> On 12/02/2025 21:56, Sebastian LaVine wrote:
>
>> + * DT Overlay for Fusion 2 (FPD-Link IV) board on SK-AM62A
>> + * https://www.ti.com/tool/J7EXPAXEVM/
>
> The link doesn't work.
>
>   Tomi

Thanks, I'll use the corrected link[0] in v4.

https://www.ti.com/tool/J7EXPA01EVM

--
Sebastian

Please be aware that this email includes email addresses outside of the org=
anization.

