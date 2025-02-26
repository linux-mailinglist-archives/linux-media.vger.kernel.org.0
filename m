Return-Path: <linux-media+bounces-27102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF2A46E1F
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 23:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C39C5188C4C1
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 22:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5213426E173;
	Wed, 26 Feb 2025 22:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="jlxCpFMF"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2126.outbound.protection.outlook.com [40.107.92.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2625021D58D;
	Wed, 26 Feb 2025 22:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607483; cv=fail; b=vDivpvGd4/kW3twqryumXzzkPY3z/gB/pJBnF+Y0ThUl4Gvk7nSkjGRd/9rl8OouNU2cy4K9WKfC7upzhVi7aA4oiSe54Yfztt4KFA3cNdF6CWS6ttkoEK97WDKhfb75GRXdfU2CLYKrkkqoxFeEd8PIfyMxref2YGg19RlCwCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607483; c=relaxed/simple;
	bh=pVkV14plZ2RTu1H8gLYC/teUG+YXAGo9vL49geNWC8s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=si9ylSKoiZ+6Cm3gM1hU3Jwxxp2E3McF5N9MICkiDlst/K2L54rR7wOwi596spJuG74LRu6idNKvGdYdld2d507OPKLptO/m0ZckzEMQBmieF5AMdM5a2rA9/cX6rKsTcnXWwynlbvvwa5PASTO6qxDKmHc0ux4ZaBR/1iNf+V4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=jlxCpFMF; arc=fail smtp.client-ip=40.107.92.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7l2WowjP6Cv2+dD3GQKIpU1CrV/UDBcs2155a9rhnGrGQci6VqnIWtatmCUPwE0iv3NA6vv1bPt3T5NIsKXnEy6DjFKtf8/FF4B3Ch/f5EYc7ajiWYRrUDIn4PMWA1Owve/ZzkZbg/3+EuAEbGACFvkZcjXnfo8QUcY3c1tG9rfyFVcMEQ/IqVGKHQr0c3Cg+hKkDhNeSfQ2ILfk5yAQruWoGVsuIcbsSLQX91BmUQxg1h+6025CunnrG79vNNGlXdj7vWZW9x29MalKIOKML+Ux+BizmC3X24R+vT8JHRRFSX9+S2aK0PsstZAv8dab5Jp3EFuXnFyvUHTj8NCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHbXEohd+G3xHEZxYv/iNH/iafQONOBzjarPflMgQQg=;
 b=HWPlF6yy+J9HNXqCKRB692QfiJxoUnJ2M8r15tHiEMkf8uC8VGTJEQDCqWDGeAdb3uak9oxxEacLmzUiLo16gkomumzXJWutqyp3PBwA1pCoWAS2C7u96JDPTLuv1BASLJj8jUM+eOmneGPmjhW85DxoVIUdga/W91jsveHmdXQN6s2ChEtIqBRjg4DeUS+iN7bxXHcCi6RPbZ4/9mCL0vFlk1GOn9rycBYqKKAELWuAguEbf3eiEtkHVdRx3VBo1xj2NVN9mS+uwN6xhgH8JEKNnjLfG9cafGK7Osy4QK0c2NJTRT77otp+p+8W6+X05wqBrAFBlGI/qSHr9AXR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHbXEohd+G3xHEZxYv/iNH/iafQONOBzjarPflMgQQg=;
 b=jlxCpFMFqYzrKQ9X+V4oGc2q+8JqWZmU9bF9/t3uzMAwvgnZypOQu540uS1puo/YiWypOdBqmtUu2Iumc/EqbXYnZDwWiKONeMuBUwGEuvcWbsqU9t84gz34hG9Efszir5kqFFM18h15zPAc2YKIUCEMQBI/LC5HgX9KotWii5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from MN2PR14MB4207.namprd14.prod.outlook.com (2603:10b6:208:1d6::13)
 by BL0PR14MB3891.namprd14.prod.outlook.com (2603:10b6:208:17e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 22:04:39 +0000
Received: from MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7]) by MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7%3]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 22:04:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 17:04:36 -0500
Message-Id: <D82PURRYPQ7J.2M7L0SF4BTPAH@d3embedded.com>
Cc: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, "Abel Vesa" <abel.vesa@linaro.org>, "Achath
 Vaishnav" <vaishnav.a@ti.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Ard Biesheuvel"
 <ardb@kernel.org>, "Benjamin Mugnier" <benjamin.mugnier@foss.st.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Bjorn Andersson"
 <quic_bjorande@quicinc.com>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Elinor Montmasson"
 <elinor.montmasson@savoirfairelinux.com>, "Fabio Estevam"
 <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Javier Carrasco"
 <javier.carrasco@wolfvision.net>, "Jianzhong Xu" <xuj@ti.com>, "Julien
 Massot" <julien.massot@collabora.com>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>, "Kory Maincent"
 <kory.maincent@bootlin.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mikhail Rudenko" <mike.rudenko@gmail.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob Herring"
 <robh@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Stuart
 Burtner" <sburtner@d3embedded.com>, "Tero Kristo" <kristo@kernel.org>,
 "Thakkar Devarsh" <devarsht@ti.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Umang Jain"
 <umang.jain@ideasonboard.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Will Deacon" <will@kernel.org>, "Zhi Mao" <zhi.mao@mediatek.com>
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62a7-sk: Add overlay for
 fusion 2 board
From: "Sebastian LaVine" <slavine@d3embedded.com>
To: "Nishanth Menon" <nm@ti.com>
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-4-slavine@d3embedded.com>
 <20250218184558.yxqy3sbz4muypwwd@busybody>
In-Reply-To: <20250218184558.yxqy3sbz4muypwwd@busybody>
X-ClientProxiedBy: MN2PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:c0::15) To MN2PR14MB4207.namprd14.prod.outlook.com
 (2603:10b6:208:1d6::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR14MB4207:EE_|BL0PR14MB3891:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a32ab0-9141-4d4e-67c4-08dd56b19063
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?K2VsMFNQQXpadGxMNGtCZjdvcXF1TTgzNStDcXUzLy8xWnJkTFY2MGhzcldD?=
 =?utf-8?B?T3BlU0VsVENaWC9IcmVjVFVZWUp2OWJRdXdaM0VoRDdmQjIvV3phalo5RC9i?=
 =?utf-8?B?RVR4RFhrZDFrWlZhU2FHcU0wQk81dCsyUGNBNFoxbXBydm5DOVFzMmlYdkln?=
 =?utf-8?B?OFNpNjVoeXdSeHgwQ3VVWFpmLzBueEYxZWJkU25mOC9UTmhXVjhVTktiR1Ny?=
 =?utf-8?B?RUVuWlBraWMxaS9jTDZpUVg0K2w5UlJxb0N6WXN4V1NzdS84STV6VXRIdlkw?=
 =?utf-8?B?M1pHS09uQkU3OU9TR0EzNHBNejJLNDdKR3FxVUUxdzl5ZlZxTUJTandJRXk4?=
 =?utf-8?B?aWdxZU5vczMzTkJhc0x3VFVHK3VkcHdxNVFybmxvU3lPYmpTMmJ2bDFvcDVk?=
 =?utf-8?B?cHNPK3dFUncrL0dTYnBFSTA0U3ROTG5ibWN2azlxMDQ4bUFQczdHRkZXMjdP?=
 =?utf-8?B?ZStWY3U1d2ZqeTVRWHFIZDJvRG9KQm95ejRrazlhaGlPZHZUZjJqV1orNmxk?=
 =?utf-8?B?T1RLaW5MZUdzMlZrZnFCVUdKWnRNeEllaE13Nkk1S05yZ3BpNGo1MlFoVEJE?=
 =?utf-8?B?RDcwRWhNVDd6R1JNNlpYT2grWkRVUnJINjlwVWFDOFArQy9rMW1pQ1Fmb3JM?=
 =?utf-8?B?Ukdhc2lBSGYxdGpLL3k2NHdneEdtYjBOdDk0aEtuVWlwVlZCcDMwaTc5Sm5R?=
 =?utf-8?B?VE9ZeTVGOXJKd2FIUU12QlJMVlo0cjdMMVBwNll3U0lMVmw2YmJISHFNejBz?=
 =?utf-8?B?Qnp6c2VjTkdBb2dBeTN0N0xyN0dEZVJxUmVmL0d0b0dsQnFrYU1zQTl1cUxq?=
 =?utf-8?B?UjBpMEtkYXo4eUdGUEtxQ1d4WjBVcXptbFlQckdDM25yd3J0d25BLzRCUnU1?=
 =?utf-8?B?eUptYjJhMVVnc2RtUlNMZjFOcUVxS3NVdWFxeE9uMStDNU5ZT25aL0haR0gz?=
 =?utf-8?B?dEFjaWtWTmRXdmRqcjFKRGlmMVRSZGRna0lVeFdZTUk1Mm9oNjVWN2pUZE1v?=
 =?utf-8?B?dDBZaWxRdm84ZlBLbS94dk1xWHRKTnBRTFdUMEluRXRnS3RSRGR6UDlHbWhn?=
 =?utf-8?B?a29qRHlZVzJsMGxrL1lzcmtsWk9MUVdFTWZJUVhkdHp4NjhXOGl4Y0h4Y2hu?=
 =?utf-8?B?YWk4TVV0b1VoOEpoTGRtSy8xTU82U1kwazA2VHBuM3luL0R0ZUtMQ1BnbWRn?=
 =?utf-8?B?amM3WUt5OHYxM3dGSFhjanZGbXd4QzFGQm1GVjlhc3B0QmFkbkIyNUxjOHQv?=
 =?utf-8?B?QnlUY3hmdUgyVGhObVArVjJpeVBPODZhb0pGUGpDK3ZGZk93dmVWTFQ5NkV6?=
 =?utf-8?B?dFVkT3lEdlh5SlBUajdXV3grSVVzM1VjeUxZY2ljUzN6emxYRTN5ZHZGQ0lY?=
 =?utf-8?B?eUNTRnplUlpJbmtXdEZQOEwwSVV3bFprTWhOVTA5NlJqbXFPYUdTZit2VENn?=
 =?utf-8?B?eENTTHNtOUx3OTdlUWhBZnU0cUhIK2ZzTUF4VzFESWw2QUZjMk9wUDl1bTZV?=
 =?utf-8?B?dThUa3lBZ0tlZTFIdys2bW8vcld2QnFRZUNnL2RVV1ZGVkE3M1dxTC8rV1Y4?=
 =?utf-8?B?ZUVEVmoxcE5KVCsycjNWMmVuL1JyWis4c0UvMnplTlJvelhuY1pVdUFwdnNv?=
 =?utf-8?B?QVVGNHdWRVNZTEdmdjg4UmlFSVV6NFh0M3N1UHhUM0VnWEQ2UUNtdXdjQzk5?=
 =?utf-8?B?LzRkN1djOXZDb3dXT1dhZ3RHeVlQQnR4bEM5SlBJZWVkT0NObFArSy9VeEp5?=
 =?utf-8?B?T0VxUjRoak05dXhSY21ZYVB1bjhHQVUrN2liS2F0K1hlZzI5QkM3WDkvbjdv?=
 =?utf-8?B?MTQ2VGZOVU1PR2RYVS9TQ1VNRVNoTEU4dzFMMlM0bmoxVnV6YUx4Y0lJcVZq?=
 =?utf-8?Q?DdVj4qXJTOghY?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR14MB4207.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bjYvSDhEaEovY2FXeFJDSlRCSXlYSkhXVlptRHc5enZYaU1Xc3VLL01Bdk51?=
 =?utf-8?B?bHFHTWU2WUdQV3gxbjN6S3RsUUtTWmxYTmpZQUdFc2xyR0ZXbDJWRkUraDB0?=
 =?utf-8?B?U2lMdXZJdTA0Nk9rcmRZdGdHcVpVRGxJT1pXbXl3bnAzc3hETk5NMDh2dHdH?=
 =?utf-8?B?T0ltdXBkaitadW0zNVpiSE4xRVRFbFJzMWhScDBxNnh6M0JRYWFJTEpqUmg1?=
 =?utf-8?B?NnZoTnRoMHl4cDBBUk9PZzl4VUloSmM3TXFmZlY0U0g4NDJKUVNJUjJyV3lD?=
 =?utf-8?B?QlZPd3pJY0tuUUhMUlNwV1VKUnhNS21xVHV3KzRGZm96V0NlZHZZVXp3a21t?=
 =?utf-8?B?Y1NTczNnbm9uYUNFWjJBMWVjZTFPM014NXBKcHAvR29UVUM1bGJWV0tCdm9p?=
 =?utf-8?B?S09MM0VXUm00WnJHamkzdUp4eWV2SmRyWUhtQW5OSHBPTUxXMExxN0tKU09w?=
 =?utf-8?B?RWo4SHhYOGNubkhzT2NPTmNnd3o0WE1ZL2YxdzNpZE1TY3JxMTZrL0tjT3ZP?=
 =?utf-8?B?U3hTRVYwTDJSWkV1UDVuMWxHaHNMUlppYURFOFRxTHJ1MEZ1K1E4L0YrTGZR?=
 =?utf-8?B?N2dWbE9uZ1Z2dDU3dmV2a0xjdWM1TXZQZExzWmxrNkVGbVVJZXYrU3BTVldX?=
 =?utf-8?B?Z3lCaVVwK2pDNXhlV2NXaHRxdFdxazJTUU9DWFlmRFp0b2pjUzJLTHkraEZO?=
 =?utf-8?B?WnB1VmFmY0UwZzB0UjBoNXh1VFM3cGR0RTFkVFdWMzNKRU8rZ0VCdkJLSk9n?=
 =?utf-8?B?OW1sYkZWZ0R2U0k2dkd6M3I4QUkvelg4UnIvdFEzUm5TeCtIc2tRUzN6MTZR?=
 =?utf-8?B?QVNqUStQVUdLV2lmTkNOR1FvR0kveThPV2k5L3FBeWhOZXlNUVl3aXhiZTVs?=
 =?utf-8?B?RStsejYyV29FbXJBKzVrdGhNOU13VXNXWGI0NWFVMmZiSVpuNVNpdkovdmJp?=
 =?utf-8?B?QzlEMWxsNkRtUVMvNUFSYmRVbDVtTjFqRHVIb2RBUnJQc1JLMU9WWjVzQndK?=
 =?utf-8?B?dEhUNitjeG5IWGo5YnM5RnZ5cWpTVVBoSHlrM1RJZUpQVHZlM1ZSR1J4VmNr?=
 =?utf-8?B?eXlrUG5aMXd6cHVodzhXTUtzaEcwVUFvN0RxNm1xTjd4YldBcGF5L2dsU3pm?=
 =?utf-8?B?R0RxTVRPc3R3UnNiMEMwOUpDK0FUM3RsanRvaVdlSmZNc2ppd3hEVzBpb0Fj?=
 =?utf-8?B?OFN4QW1LaVR2d1VSR3NiWnNhUGdjeGtJVVQvY2xKY1U4TFAwSXQ3YnpWOGlX?=
 =?utf-8?B?aEl4U0xqTEJqMVhWQTlhMTRQUzE0ZjVLeVIxUWxmeXdKMS91K2RzUE5yTGxD?=
 =?utf-8?B?SmYrKzhqeFkwUmZ5TW93Y3dyajc0L0Vtckg5bzdFY1kyazd4aGZhK2NDa1Zk?=
 =?utf-8?B?eVJkU2VodUpwTnlqWVFEVFZ0VXJGeGxRMEY4K0dMV2pjQnRpVGRheTRrbUo5?=
 =?utf-8?B?dzcvVDhQRlMxbFY3ZzBhZTUzMlp6dEh1c0tYUXJmS0RJcEl0TnZvcXg2aTgr?=
 =?utf-8?B?TlFuNk5QQXhzdEprVTFvNjBzKzBXa1ZzY3J0ZElKREc2Y3ZIdXlGanY1ZVpy?=
 =?utf-8?B?Zkp3aHFmY25oZ0FPSUpTRjhyVFRQQUViZG9TYXpNSXF0WEEyd2kzK1Q0Qno1?=
 =?utf-8?B?c0hVNzVBRlJVemczZiswN0FMYmhGSDVFN3AxT04xUmNySUVONkUwK3Zzbnph?=
 =?utf-8?B?d1R0dVhQb2hseEpJbUlqdFdNb0NyQzNzTlp5bVlyUUhGUGExbkJXSDF4OWJK?=
 =?utf-8?B?SHVKTHBraUtkM0hJNHFTakl3R0ZWYjZYL0E5dlJXZ0FScVczcHphMVdUSCtN?=
 =?utf-8?B?UlFheUo4WFJpMlVDOXhiZURDMEo5a3pZMmtYQ1BqRjFmcUdmMnVlT3p2ZW4w?=
 =?utf-8?B?TW9HSHRUTkNnQVl5NkxLS0NPNDZEQVZCNGljbFJUYW54bFp6aUlmQm9nLy9u?=
 =?utf-8?B?Mjc1S0V4VFFob0FIVUl5UzFDNm9QN1ZLeGNTZTZSbFhOclR5RGRxWFYxRmRU?=
 =?utf-8?B?dXVieWxXSUlHV3BZdktnOUxucG9uaXFtaHZodUVJeTcwdkIxZjVibVdOd0Fi?=
 =?utf-8?B?MUVqMExhWHdieE1YVGtwZXBFOWJEcXVycHBzam1PUHZ5R091bXd5UUxUUGlI?=
 =?utf-8?B?RWxpOGpWR2dCa2hQWDdhMFJDZmNwZVlaZy80S2xLS3BkVjBtdkxkdzRFc0xF?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a32ab0-9141-4d4e-67c4-08dd56b19063
X-MS-Exchange-CrossTenant-AuthSource: MN2PR14MB4207.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 22:04:38.9237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZQuDQhGnBH+UTDxOawr0ZXfzZ0iI2Nyn60/m+Ibv0RXGMphHPyAs9K32rpm2wQxrSBKQYVnX3P0zYHT5Df8Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR14MB3891

Hello Nishanth,

On Tue Feb 18, 2025 at 1:45 PM EST, Nishanth Menon wrote:
> On 14:56-20250212, Sebastian LaVine wrote:
>> Adds an overlay for the Fusion 2 (FPD-Link IV) board on SK-AM62A.
>>
>> Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
>> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
>> ---
>>  MAINTAINERS                                   |   1 +
>>  arch/arm64/boot/dts/ti/Makefile               |   1 +
>>  .../boot/dts/ti/k3-am62a7-sk-fusion-2.dtso    | 115 ++++++++++++++++++
>>  3 files changed, 117 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 27fb3c1be732..bf6a48da0887 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21890,6 +21890,7 @@ M:      Stuart Burtner <sburtner@d3embedded.com>
>>  L:     linux-media@vger.kernel.org
>>  S:     Odd Fixes
>>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
>> +F:     arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
>
> NAK. please do not send overlays from media tree. they should go via SoC
> ARM tree.

Ack, will send as separate series in v4.

>>
>> ...
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso b/arch/ar=
m64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
>> new file mode 100644
>> index 000000000000..68e06d643bfd
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
>> @@ -0,0 +1,115 @@
>> +// SPDX-License-Identifier: GPL-2.0
>
> Would prefer GPL-2.0 OR MIT in line with rest of TI EVM licensing for
> DT.
>

Ack, will fix in v4.

>>
>> ...
>>
>> --
>> 2.34.1
>>
>> Please be aware that this email includes email addresses outside of the =
organization.
>
> Drop this. this is already a public mailing list :)

I'll look into `b4 relay` for future patches to get around this.

Thanks,

--
Sebastian

Please be aware that this email includes email addresses outside of the org=
anization.

