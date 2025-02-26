Return-Path: <linux-media+bounces-27093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EBFA46A34
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 19:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56B101889861
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 18:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C38D237164;
	Wed, 26 Feb 2025 18:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="U+DtMW7G"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2098.outbound.protection.outlook.com [40.107.96.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60EE21D5AE;
	Wed, 26 Feb 2025 18:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740596036; cv=fail; b=t+toQWSb4VitOpsML8sdhrf33S+5U8RTqYhlXOIdbkNSsMaRl/xg8vR7/ndrCuhRKNathhQit7LWSV/oWcYdvp0V+HAeha1HtBUisH/CEbDqxwMtdNEEap+d07mCL10o3Wv0tlXfmlXKUUiaDvcBECVdSrh0d5rJaMUrQjdfLxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740596036; c=relaxed/simple;
	bh=7GfL0nvic5094uIJz4iv0vKANr48xLfL1syv6pplnFY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=g5gPe7SUULYkpQCkVT4KPzx/saux2/Rur3FS8EkMFzOHKzb4TdQz65Ik61cxCkT5XlbTNbT1mCxT/ka0tASqlln7RFg7bjDwaYMOXVuF7roUqgUCd1FjEdmHdSlLA7X9p0PmNvux5kwEiL9OM5Y2wtAMowb0CVR5+77JrlLWCOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=U+DtMW7G; arc=fail smtp.client-ip=40.107.96.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwgm93inXTFkmJVng+JCLuqrsAERvAmBGIEEnX/+6Wq6w6f2u+vEw1VNZASUUsgm4z6GGByko6MtUEc2CADgINYwOrjBU2Zicgm4E9no3YY9JNtZETwuTSHU5srR9QJ+Ni6IdKg4zjAtTYDYODWtqzBNVq87w3+GNE57uGlKHhSjBvPJ7JdXHR/qY9GHuSnEJjbMQyww+cIi/eU53oxgJBolbMhQpZJeKXnQuvGOloryY0FaD+5PqEv2cnXg7i7Hll4PY+jWV54Ztz9LPLc0UVF2iI5MIdrd8YaukfhopXRQOAJ5K9YdjsiS2opJT9yCGl0H5LG6Nqr1A4p2ZHvDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GfL0nvic5094uIJz4iv0vKANr48xLfL1syv6pplnFY=;
 b=b792n3P/6y7rH9rm8WHiSkJQKDE9qsiZnATjBZE49Hhe2bGAqkcdy6/GYrylp4f1yZ7y/QKCTE2Z0MTP0Exvov1dpjGq5XjdJestKhNlE5GIRujsW6We+cmKDpzrDPgeuBDWKzhQB1fEf3W+3MUwf1/Ud+iVCqM6SYyJhCcHIVct4V4Xnd8ymppW5SId3tuOZwsAeHv4RxSeuB99MeC16Zm7SVhZAOQARigKm9u+8me4rdjaBoQ1BZu0oUFlGi9kq1NQTwI8n0H+wJ8U4dh4gI9U2durS7smS9/IQ9K2ni7ZSfDUDVbfMJL4Lzy2tZ7xNiDOuXCsqjB5gBjFr46bjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GfL0nvic5094uIJz4iv0vKANr48xLfL1syv6pplnFY=;
 b=U+DtMW7GjGnMKHrihdZZM08fC4vQf1ZBoSiL7KZaYDRl6Ny9z81dVH6e/mkmVNRrONTQbdzJDwMtvdFX4EPaIDOLcW6YUagwiIihK7wrTnbEorvPKHfTtwwZX8N9bDHw0uqik4TU1S2yB9PcF9oL7NwpC26qUg+c6rOzZdh+ulI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from MN2PR14MB4207.namprd14.prod.outlook.com (2603:10b6:208:1d6::13)
 by CH3PR14MB7164.namprd14.prod.outlook.com (2603:10b6:610:158::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 18:53:51 +0000
Received: from MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7]) by MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7%3]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 18:53:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 13:53:48 -0500
Message-Id: <D82LSOSFJ4C3.33BIAA9K4F1YB@d3embedded.com>
To: "Sebastian LaVine" <slavine@d3embedded.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>
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
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Sony IMX728
From: "Sebastian LaVine" <slavine@d3embedded.com>
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-2-slavine@d3embedded.com>
 <20250213-shrewd-tacky-chachalaca-778a50@krzk-bin>
 <D82KGJEBFQO0.1TX611HMKWB16@d3embedded.com>
In-Reply-To: <D82KGJEBFQO0.1TX611HMKWB16@d3embedded.com>
X-ClientProxiedBy: BL1P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::10) To MN2PR14MB4207.namprd14.prod.outlook.com
 (2603:10b6:208:1d6::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR14MB4207:EE_|CH3PR14MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 2731010d-759a-4699-3b63-08dd5696e8db
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SHVMRHMvbURKdFVZMEtsSnNadUxtRTdKcXhlTVg5c0JTYm5Ta1JTQWVsWFhp?=
 =?utf-8?B?Q0RqKzZJdCt0bnBIdVdtUkxhdExveGt4amlzU040SVRPMGhYdkdmQkNxQ3VD?=
 =?utf-8?B?VVh6cWMzZkNqUU9SZFA0SDB6c25meUwzc2F1QVhUR21jb2s2OS9BNUhNS2Fk?=
 =?utf-8?B?QmovdVBHUTMyek81dWNnM2Q4WTVadmhCWFV0S3FmdG0vdHd6ZExwU0wxcHR3?=
 =?utf-8?B?VnYyd1J0MjdpZzVMcDNqZXRmRmhETzBtenc0UGx3MVdaNm1VOElXbUk3cnIv?=
 =?utf-8?B?dFFRNEtpWUp1V1ZKRDVnUkRVU0VqUjVGRlltYlZDQnp3RUJlOVJEWmVoM2o3?=
 =?utf-8?B?M1UyRlNZd3lNbzNja1JBUlM5Sk5NNWpGR215UVB6ZkluTit6VkRnd05rTGU0?=
 =?utf-8?B?Q1NGWnlKZVFETW5MSUhqNWZWNUFGbGN1VmRDRTBHYzI5RkZOTW1VQlN4Y09t?=
 =?utf-8?B?d1JxdEJUU0IxSFhaM3hCcmNDZm9xSkxBdCtWN2lGU014ZXVreG1tdHp6SkFu?=
 =?utf-8?B?dE1xNlBFUlBsVnlBTmRSTjVUdy9SdWJSNmRURGw1NUxvSTVGUEVHNXR0RjZR?=
 =?utf-8?B?TFV6ZXVVaHRWaGtlT0c3N2dIRVJUNC9zdUVPQ25GWWp2SmJ5eTVRTTloVVFB?=
 =?utf-8?B?SmdpZmQxUERnbTAxTHZqZmpZdVh6NzNsMFFUbzRlM1MwV1R0VDRSRVV1eXFi?=
 =?utf-8?B?VE9aMGhXY0xzcWwyN0ZVS1ZoaUlxS29pdldIb2Y1NzJYVzNuWDAvSXBsY2pY?=
 =?utf-8?B?bjBlRHU4TmZRcTdsNnlsTkpPb1ZFd3hRakN1Q2tMYzIwK1RJM3JiYVFYcUVn?=
 =?utf-8?B?dk93czZOT0VlRHRnZkZvb1JWSmxGbmJsNkxETXZLWjBJWDNTU21xUHltTkt4?=
 =?utf-8?B?YzlMUU40TEpDajN6dFlOQjhZUjZkWGExZ05LelpTbmppdk5yRGdBenVQd1d6?=
 =?utf-8?B?MThQRnd4cVM1Zmdlc0tCU3oyY0FTZ3BTTFJhVFQ5bXZYUmJuUEdQKzMvQVpr?=
 =?utf-8?B?OVQrQ0Q0ZEZocmt3dzlSM3FkUnRBWUdiQytwcDQwNWlRS1BXQ1J0blBLS1V6?=
 =?utf-8?B?em9EcEc5cDQrMFB1VDBSK3g5TUlmNmFMQjJBM3ZudE9JUkd2azViVWdodkhr?=
 =?utf-8?B?REhEdlFCQzkrN2VxTmpRQmdiUThMeWNnTzNBVjdETkdjWGVWM1FFbjAvRko4?=
 =?utf-8?B?TW9nK0g4aFpVaGtVMmdEVXlEZ3F2NnZ2WW5tb2NiYldqQjgrUDFuVU9tNWdM?=
 =?utf-8?B?K0VDMkpJek9vN0pNeG5aN2dkZTNSMkw0cWVuTWZJYWgvdEdsZVN4OVNocmxH?=
 =?utf-8?B?eHRaSUp1QnlCQ3Y0SWU1YkFxR1dyREkxVWt1M09xNDg1MjQ3am9xcWtWcFc4?=
 =?utf-8?B?SDBGcy92a0haK1laeElIUmptNXUyRUMxb1hXQWlqVDE2ejVRWGkrUHgrSDN3?=
 =?utf-8?B?a1hDQlFJV2tpWUd0MlRoblB1Y2hDSHMwZXNLZk1xaW81Z0t0WkRrWlp2VkxS?=
 =?utf-8?B?S0d2WG9DcjlZaVdvVzVtOWxsMG5IYWNtNkNMZFBTbmUyeEduY0VaZzZCd0Ix?=
 =?utf-8?B?SVhBNnVlOUFyOW8wMFhORk9xenhlZklzV2FGQW5ya2l6cnEzL1g4R1hrRXZZ?=
 =?utf-8?B?YTAyQnRGOE5MTHpvdkZ6L0N5R1UrUzVOUlpxbFJTd3AxMElMNStFSUVLN2Vr?=
 =?utf-8?B?eCt3T2JPU1Juci9zRlUzcVBQRFNWOXZSNXBkQlhGZElqTFhGU0RMcmdEMm9D?=
 =?utf-8?B?dlZ4WjQwS1puS2RYdFZGb3NidzVoam1zSk5JZmcrU0dUNVg0eDRpQzFMU3U3?=
 =?utf-8?B?T0QyMkZMaC95RlZGeGx6MER2T1ZXdHUrKzdjRGJpK2hTQ1BJWTVwbEs2TEJH?=
 =?utf-8?Q?/IyR1VIF5BiEG?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR14MB4207.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TEZpVHZxNHZvOENONFMwWnVMSVlJVEFaU2JoRDMwVDJYbUdSMTJCbTBUcWNr?=
 =?utf-8?B?NkJWdmYvZHRqK1NMWW9VNnlOVFBrb1JCeG1LZCtEMzRzbFZ2OHRFcjJDaWZB?=
 =?utf-8?B?SEs0SG1uVGQwL24xNm9vNGJ0TVRscmhLcy9XMXQydFc2d29wRTFhU09aa1hX?=
 =?utf-8?B?QTJmbmtsS1VEQ3RRMGwrWlVUQSs4TXhVM2pyNnNLZWE3UW8wbzFWZEd6Slll?=
 =?utf-8?B?V0Z1bDg3Tkhpd3ZGME1VUkk2TnRnMWVsNVgwRzNDVjR4UXNSSVYzdjhqbWFx?=
 =?utf-8?B?K054OW1wS3hMVThhS0VpTFFScDNacU1YY0w1WXFpL3hybzFsbFpYd3VGOVFR?=
 =?utf-8?B?ai9la1JwcWZsNXdUdWxOb0tGOGRDOUdVN1FzTE1ldXJ0NTNXK05aMEp0Yytw?=
 =?utf-8?B?UklvYzJxKzFOQWJDWUdldFlzSmdlWVJkc1hwWWVVbWZEM1dYRy92WXVKcTlx?=
 =?utf-8?B?c3krSzgxWEErNUlwNHFQWXpXcTBXWnVxaVRWaHNCbVVrazhkUkdHVTBEZXVw?=
 =?utf-8?B?ZGJZK2ZDbENrUU5tWXFQTGpNZGVoaEQ0U0VHell3dEs4VWxiRkFkcEhsMHlS?=
 =?utf-8?B?d1ZlR0lBT093TnpJSVhFRnAvTXJIWE4xZGh4OVRZai9VN0g0bUJBdDRIcGFC?=
 =?utf-8?B?T1VqUlEwR082ajQ1MGNOaW9KM2xxeFNWSlNqdkJuMFd1Z3Z1bEtlZnJ6YjJZ?=
 =?utf-8?B?Y3JjSU5uQW9IMkhoMTJUSXl1d081MzJBbDYyeHkyb0JLUHVWVFVQNVRZM1Fk?=
 =?utf-8?B?aVpTZnAzZmxKVnNtY05aU0VlNC9PYThKMjQzMHE2czJJY3h4QUZxdVBkYTM5?=
 =?utf-8?B?QndObU9CcFZYY0QyYnBIaDUwb3FUMmlLNFFKZGJodzNSaEdCSThkUlpIeks4?=
 =?utf-8?B?a2NMSC9uZnlpb3EvM1h3bmNYUTR1bXNhQXAzT3M0Wk5LMjlSaTRENVpKdG1W?=
 =?utf-8?B?NmtQRHc2SFRweWdmbldTYkpqUFF0dFo0TWcvdlRMalVxaVBLcGlwbUkvWlB5?=
 =?utf-8?B?WEZQdFl1SXFWblVCRnRXNFZDbTVxbnArL1Z0U1hXM1lVcStOWllNcllpUVRP?=
 =?utf-8?B?WGkvT0E0b2pvTXFvdk1hVlF6L3J6TlRMY2ZYbmNjSzN0dGoxQzQxekRUY0Ri?=
 =?utf-8?B?b1M3aFE2NzNoa2kwWFd1MWVzMUVUczdiMm10aTYvSUwvcWJ4Z3Q3dGRWQnNw?=
 =?utf-8?B?TzhBZ0pIcUhSQkNGQkhIUG9ZRElSTWdDU2puYlAzRkpwaWdpUExaSEx0VWF3?=
 =?utf-8?B?UWZjM1U1MUUweUZwWDVsdDIxYkcwR2l2TmZDdU5EWjR2STI1YW5nb0dpS1Q4?=
 =?utf-8?B?bHV5cndVTmc3U29sU3gvb3ZuTDRUc2dwdnpJRjVDbFl0ZnVnekx6NnV3Q2lN?=
 =?utf-8?B?SCtDWGxEVW5NMDhYY1hSbVpDYXVYSmd5V1ZzanBGQi9VdkFKNm5pQnZxSGVx?=
 =?utf-8?B?dG40T2lBUHE3NlJTaFdkSVQvM2ZrWkp2cncyWnVJcVVaQ0UvL0ZKeEowaE9D?=
 =?utf-8?B?NkgyalA0OGlHUUl5aExRSU41VUNpQUtLMjRkbU15dnZ1cklnQzRjbVA0eWRt?=
 =?utf-8?B?NTFKRHh5QzgrMTdPK1JJd1VMQlRNVlExelFBSTZoTHdmQk00SmxvQ2dFQVV0?=
 =?utf-8?B?SGc5bklJVVBsMlg2Und3TWJuZytiWVVEWFBCMUUvOXNXZGJ3Z29iVXhEM3VW?=
 =?utf-8?B?VDQ4aWxqUEdWODg1K2l4U2tvZHMvTk9Rdm5nclpUakJuVVlhazdzWVBIaWs5?=
 =?utf-8?B?eXRPU0dKd3VpQ1pHdzZna3JkL3Rpcm1WdnNCbnVFQXh6N3lNNXZ1NmNWU0VP?=
 =?utf-8?B?ZWZuQmRrdjVsSFZIMVBsODllbjIxTkRCUStPQ1orRGVhWExpQ2RMSTVYVDlW?=
 =?utf-8?B?YkVGbjRPdXRKWXlsYzM1MEkvS0xjYWhNVkM4RHhkODdSTlR4TS9pZVFHOEts?=
 =?utf-8?B?VUJsdlZscndlSHNmM1NzYm5QQkViYklRVUdIVmV5RnRTUCtGb2krRDlEd1NS?=
 =?utf-8?B?aG1VKzVYdXFaTmZJMU1DTG9ic0NQZEVMUGthdGQ5R014UzBoVVlkSDdIWGVV?=
 =?utf-8?B?enUycDdVcGJmUCtHWkZFV25JRGJNNm1rd0RmQ0V5dnk1TnNqVUxqVUhMNkxG?=
 =?utf-8?Q?TEL8z56L6KBhW9cHgONwVLxYb?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2731010d-759a-4699-3b63-08dd5696e8db
X-MS-Exchange-CrossTenant-AuthSource: MN2PR14MB4207.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 18:53:50.9361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +e7uegtW/DLBC+7LPjR5gf/7vd6yl/k+LoMsf8CBzPt6QYokgLtlQjYB4hQt5ac36a7Nv58lWj43YwHrv1wGUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR14MB7164

I'll put Stuart as Acked-By in future patches.

Thanks,

--
Sebastian
Please be aware that this email includes email addresses outside of the org=
anization.

