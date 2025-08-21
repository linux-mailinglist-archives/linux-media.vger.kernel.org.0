Return-Path: <linux-media+bounces-40513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD4EB2EE39
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91DE05C0907
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 06:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A472E266E;
	Thu, 21 Aug 2025 06:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OPMOmPX9"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1732DFA39
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 06:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755757737; cv=fail; b=ofRvRqcxXxbs4339ZPVxtk5h6l3ATu7jj+5jvuFyQ57IakYPaD3RuSWhKRkAyriOGr5kkKA1ZBUYw3ZzjWRtUGbXs//v2a5EoINNDerT+fR9xGrgQvLGnWRJcG5NEmKWlAFHyJoVldO3q2ruuK7Qaqln76e7GuxTxYW3+EJtEKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755757737; c=relaxed/simple;
	bh=PjAvdXxtcDLc2D40cz+uuCsdwOjR9+Fse1QjYngyMO8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EkOybr4egEztooyRZ7Z2pyVwy+cOzyADRHh8Mfu1h2AYND8wMj83yPK02GseBqQoWxNYgv17lKnoeZW2j5YUqIFM4HSfmmDnrMiveU3ewYxgBxe6zAu8OwzV8aiz5+HgwFV0thC/UDM4VU5CGN2nMCpWh4AOfE91Mdr1+JBy6Jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OPMOmPX9; arc=fail smtp.client-ip=40.107.159.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qpe+xZhc/33lopm3kpUhE+bvyR45lfCXvY8laSqjDhgSl3RXYvN29OOwBAp89PLRZOhHBB2YK9a9Wjlfl4oW5VvUmxY4ukMzvzwPBZKUYkzMMCZ1v9GkVE8eB9rNqsBQPeZkpBk0PEBpPAxlUt0eMCqHriTCv87iO25Vh86os71RRYvWngzI6v5wnUdbvRiG6kmIjoR1d7/NksoR1fv8bKbwpDSrLZSyaczI9MSBgrBkEihJh5GsDuhFbLBfh9BYUErMYqC23848BRLMwlk/dTYR6P4e8AGzTd2KDPb8U9VQL2r+/pk3SJs/6ATETNbTL9Xl6NUNRUINcQPnUe3Baw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srd7zSkUDI/f+GBmT3Qr58ZlD6mS+Lv2qqEMFQXyAs4=;
 b=HHyf3dkzs0GbD9WUDWwyImNRObUI7CnMBE28XblCk+TZ7BBT2Ba2w3UOADz24Ej8Ihgm0d144838Mf8RK7vKVeUv4tuoqvUEKDE4Oys8kLZUlothfCQRA4ObVMArC/UIOljNQp7jYMvJ46Yfdk36PiCf5EFU+nScDgucgyuZf6GtyQLTS77m7vwXHOOn0Jf7b7CrkAslQuZplD0w4oBbZCzqIMnowCLqYHDfiwndEr/7jb8YxkamGFxfLLx+wwGCfSpxGNIiS5q6LND7pWImdt2i+6qRjDrM54mXwyi5SUNnxYF9reqbtdiq21XRo/k9f+fcw9YI+BOkD37NO8SgOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srd7zSkUDI/f+GBmT3Qr58ZlD6mS+Lv2qqEMFQXyAs4=;
 b=OPMOmPX9EtCa4grlqfVEr101IPs8odJvQxcTNi2nOQ5vTwpaZeYI3gyp1CN3962vfP1fWvBcHjZ1luxGbYCxPAmeQqOk/Nq9pCNZkQidTHpeZZTbUDBkq58EfDC1F8HQav05xjiaTsMauPvp0eL1vjgoNXlIchrc/f/8Ur/Tu2haZhN/1Kl0yAllaaW0mUeXUW/qBy8crtWU2ufvghwBifkmQYymthGYKchUatMTlj5l2LIH+fuOIVh2ueUld1dDMSsMmvzwdOgX1KgRAVa1Mcr5qEzf8O9GFliqxfLC3j2Ur1/GRlUj0Txnq8wkyY6kVIS5ElySbmSRDzVpO76CMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GV2PR04MB11237.eurprd04.prod.outlook.com (2603:10a6:150:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 06:28:49 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 06:28:49 +0000
Message-ID: <8d38e622-a743-41f9-81e6-d8608e3c60ec@oss.nxp.com>
Date: Thu, 21 Aug 2025 14:28:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-jpeg: Add support for descriptor allocation
 from SRAM
To: Marek Vasut <marek.vasut@mailbox.org>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820163046.209917-1-marek.vasut@mailbox.org>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20250820163046.209917-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GV2PR04MB11237:EE_
X-MS-Office365-Filtering-Correlation-Id: a0979297-b01d-4410-6496-08dde07bfced
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RmdjNkRXUUtld3h4bGp5ekt0bUxEcHRXbGFPZTZYbXdUWE11bWhqZW51dW50?=
 =?utf-8?B?ZlNNZUdxSGFsRS9EUjlMN3poaWFQN0N0bUtmNWZGazBLcXRZOUh2SHJmdkRQ?=
 =?utf-8?B?OVpiL29ZeVJRSlJVRlpVTm9pd1lPY1cxS3JmTWliL0lVcDNpWTZOYllFTDlF?=
 =?utf-8?B?cU5kclJLOVBNUWlpUVV5ZHRONzZpYkhXWVhZQytRbGVPSVJRaDJ1SlVtS1l5?=
 =?utf-8?B?MzVQeGd3QWZRU1FQMG4wS1R0ZEVuZ0Z4WXEwRUdWcG9ralh3R2l3aTROVk5V?=
 =?utf-8?B?RXRYZ3V0a3NZeldybEkzeFl6cEhZTlhWM2tXOTN5QnZaK042N1lKY3NKOXlN?=
 =?utf-8?B?dGdkN0hpclYvQzVHM1RYM081V3ZOZkdDMFFaTXVRUkJISGpUSktob01CRndm?=
 =?utf-8?B?RFFWTGtwOC9kK0pLU3d3aFBoWml3RFZEOTJyQW5tWjJEaDdiN0ZZVWJvU09R?=
 =?utf-8?B?akk3WDZ2UHoxWjRpZGVzUS96Vld2WjV2TkJwT3E3SUJFOXBpWUMxRmdlZkFU?=
 =?utf-8?B?TTVvTjFZK3NhR2I3VnFYNm0vUWRVaWhMRHZZdnpjQ1h2OTJvRVhUdmdudmhm?=
 =?utf-8?B?dmRVVTNlK1Zld1NweWhuUWtBdW5xUFQyTXhWT3RNMThMUENHQ0lYSm4xMTFB?=
 =?utf-8?B?TlJwb1B2ZGhBRXJ5ZmgydFRuMFhycXl3dW9GMEwzVjhJKzY2OWVsNlRpMUJx?=
 =?utf-8?B?T0VwMXBvNDVCRHUrdmF3Z0VjVmhBRCtObEVnUDd1TTc3WHNqQ0NvMDdCYzFl?=
 =?utf-8?B?aFJoZ0Z2YzNzc3ltaUd3OEpOQ1prUkJqZkpYVEVTTVVFUStNdndHd3V1eHR0?=
 =?utf-8?B?b2NUZUZ1eXBvaGxVRllNbWlkMCt3RHFiQUtIb3NxWXI5bEZhN1hZNytWSWQ4?=
 =?utf-8?B?NUtUQWpJTGdCTGV3MmpjbXNBelgxakd3Rk1tOElhYWpuK3FNd3A3YnVlZ0Jv?=
 =?utf-8?B?dVhFUEZFQVoxd3MzL3NNaFJ2NHJvYUxucG9NK1V4TU1Bb1RCajBoL3pXbDdi?=
 =?utf-8?B?VFptY3NuVUlqbDlyQVIzMldJRVBBdVR6ZlVsa05HYytyOE12RU9rcjBlNmQ0?=
 =?utf-8?B?TTJHVEh2VmhZSkQrWHlVTHF3ZzIxWEdGVkgwY1pMMmFnS2N1YXdZYTR3czc4?=
 =?utf-8?B?WEN5REw2RHdWUzhVdnNBcGVDUXJPQ3NLVU5YK1krVGFpdEpyam5WNWtrdTgr?=
 =?utf-8?B?cHlCZGlWYjdWc0FlQnMvQVJYMU5VQ0NlSHYrWlVya1FvZy9zWWF0USt1SE1k?=
 =?utf-8?B?K1pJT1lnZVcyeG85LzFLbUNSM2hwWUVSOGtzTjVaZEtiUlR3enFyZk9UcHBr?=
 =?utf-8?B?dWhCT2l4OW5SZlhEMHdkUytpeDlWcUk4QS9hWUs3UURQVTFZYUZhRUExYmhV?=
 =?utf-8?B?RERLTDhBMk1qN283Nm1DZU1aOGhjSmtRVUNDMXAycFZUSDMvMHNMRlJGQkhF?=
 =?utf-8?B?b1B1L0dHZTZRZTJFR0hSMEZlN0RaTHhFRkRYWjNUQllxSzJSeGJRbm5NTnhR?=
 =?utf-8?B?YjU2dm1zK2tTaXJSRlF2UkJVVVJEUkY2dlVoT1E4M2ZBRlpuWG9ENmVhOVBl?=
 =?utf-8?B?Z1FmNHI0RXcxV0d6ZGZVSGc0MFVnRmo0eUJBNWxkQ1ZMb3B3dVBlWlZaRHRI?=
 =?utf-8?B?RXlnaXlqV3REVzB1MjdTT3E3OWNpUThqSmI4cnVpN05mTjlMWkJGRXJJUkhi?=
 =?utf-8?B?L3NVY2EzcGZ5eUpmVzU1RExkeGZDTnVHa1F5MFdiTDhvR1RtZW91dUUzaWlJ?=
 =?utf-8?B?L1RhZnlGalFqdU5jMXQzUUJWQlRRSEJyVndPaDhFcmxCMWpoQlRBajV6UWpm?=
 =?utf-8?B?ck90bm5jMURXSnVsTjVFRngxWE5saGtjSlMvQkh5VWk0amtFODJnZ09KcVJy?=
 =?utf-8?B?L2hwbjJpR3kxMVdNUFppWUVETENtNHF1UDNCVzM4UFNtamhMZndmTllOajJL?=
 =?utf-8?Q?eIocWFN4wIY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VUd3QUxvaGVFMjVrWDRQOUJIM3luWTd2eTBJVEZpOHNRaWQ1WDhicnlCakhj?=
 =?utf-8?B?OHIzVVE2U3hxZFE5bTNORWlPdlpJZHRBc21wbDcvVG1hQU9YRmFTYmxBajI1?=
 =?utf-8?B?YnJLMmloRWlmMTZDbWVGUU9GanErS3VBV0JqRkFJdm1uenNyRDUwZ2Q1dzNB?=
 =?utf-8?B?UlEwa0FzcTdHeUQvWFVic2h2a2E3U0NmMFRkYWt1ZWlON1dnOW1NeEpEdENZ?=
 =?utf-8?B?Q1pSbTNSbWVRL0tEZ0lmMDg1dmdrS1NFNjVqOFY2L1BBd25iMllERFhsaXk5?=
 =?utf-8?B?VStDY2dLNjRpOEQrK2FPN1RuNGhwUmxmUnorOWNYK2FyRXdGKzYzbEgzR0RM?=
 =?utf-8?B?UVVBamZCYWtNd05uYWFqSkJHalR1alpDOUwyTTZBd3d0NnlETEtCM1Z1Nk1M?=
 =?utf-8?B?NXpIUGV1V2lZM2tEalQ0T3luQnd6Yk0ydzVKRXJxbkhHbGdod2dsVjQyV29B?=
 =?utf-8?B?SDVmckMxSlJFWk5OOGM0RHNrQTFldE1YZ0JINU1TMFNtT2Q0OVp2ditTaFBi?=
 =?utf-8?B?bTZUQU5wbjJrSUMwVTkvcFNQcUFBelVHR1N0d3ZzbVpJZWNDQXRxajg4Ky9t?=
 =?utf-8?B?SXJKNlVRZTFwRWdBUWFxZTVMUkNvZG53YitjcWg4ajl6U1RTRE1aOVB4b1Na?=
 =?utf-8?B?MXdzY1Z5d3llV2Q0TjB6UjVta2ZSRnlWa1NDM3JFRHJERnFiMFFVKzZYNE9P?=
 =?utf-8?B?VFFDVlZjZmFxNWtHM0I1UEFRRmp2V0c1VWcwYy85UmI3WDVTbWtmdmZPdS9q?=
 =?utf-8?B?WVQ5U3c5UEZuZWdxeGpadFdWSEcrZ0dTRGFKZEgyMEorRHJhNHdQNXNVWXhh?=
 =?utf-8?B?aFgrTFBmVHZRZUpzQ2NMU2t2TTZIekcrZUwrTjFMeS9Ock1jSDBkS2E2MUdj?=
 =?utf-8?B?RGNiUE1DZE5JSVR6TlV1L1ZaMEtqVFc4a1hSaHJrbEVUaDhxY2g0cXF2L3lZ?=
 =?utf-8?B?SWh2UjZ3V3dkWktSODBXZ1JlVXR6YmZqbDJDZGZzZ3RmS1NsZlJhb1NOb3ow?=
 =?utf-8?B?eGZ5UzgyRTNhQTA3dkdYVFM1T3J1aG9yeW9FdFN2ZlNKWDlPbnZEZ1Z0ck5E?=
 =?utf-8?B?b0c0eUwybW9mUThLNUJMMVRnV3VraFcxQWU2Z1owSEROV0hJOUYzWW5GZHI3?=
 =?utf-8?B?aEZjVDRXVmNvTnA2V3lqWVVtakdBTXVkUStLN2tLTTB1YVVKbkRmbjV3aFdu?=
 =?utf-8?B?UjQ2NG5pSzlKWmtQd2xEa1JicnhzN3VIWTZGR1U2SGgybWUxZkJXZlBWTjVF?=
 =?utf-8?B?T2ZPVHY3MHVvV3pRNUkwYUNoMkFZMlVRMnpYcm9jMGpqcUNweHp3eUl1Zzlt?=
 =?utf-8?B?NjFoK2lzcEhZTi82V1RNMU5FOFRuUnNtd1hZbjJJTWdsb05hZXhlVng2NVc0?=
 =?utf-8?B?S1p1eExRWXNsOGFGUUQ1RFJ0NE1LRVI2Y2ZvZzhQa1d6K1VTaGFKb1Z6THJl?=
 =?utf-8?B?NitQckJIcHZHNTk2bkdPRWt3aThRRitCVThXWjA2aldqRDloUnhsTnJ1OXZ5?=
 =?utf-8?B?VzBxYlZXMkRZV01PbGtPMjJlUHJmQjFsNjVpemdYRk5SelZZdEVUaGlVckdS?=
 =?utf-8?B?eVVBdDQ2cU1YNGZCVFhxYUMvb2tyTjRFYWhvYWxVSVBiTDVITi9JSklGK0h2?=
 =?utf-8?B?U2lYb2FSTlhrNWRuYk1KVFlhY1hHWmlnN1plbkFHYldySGhSWERGUDVZbVJ2?=
 =?utf-8?B?bUtoYTI5QXllV0hoYUpCQmJWdlF4T1hxdkp1T1IwY1VDb0docFVwRUUycWtY?=
 =?utf-8?B?cndSUVhwTXpJOHRYQTJyMlR6cis1eW9OU3d3U0s4YjlZaUVNaUtzcnNORjIz?=
 =?utf-8?B?dDA0ODYxQytoMXMvWmRQVkdkbUhHMi9EZVZ4NHZmVzMzeFhYdjdWOG5LR0J3?=
 =?utf-8?B?WlVlZDRpUXlVZFV3U3A3S2paKzR4RHJMRnZVeEhtWGxMUUxuMnI2WmloNWhy?=
 =?utf-8?B?bnNmNXMyNWNmODU1K3drd0l6eHBpbVRCbGpsdEd0ZUozc0NPK2VRQ2Q2QnNw?=
 =?utf-8?B?MGdQSU1tcnFGN0NpeDBYS0J0WlAxTFJ6eDlIcDBzYjI2WkpwYmwyMG9ZWHho?=
 =?utf-8?B?WFpZR0t2NTBGS0V4ZUxBUmRveTlIUXYxQ0N4bHI4czFGa21Xc2huRXFjdEps?=
 =?utf-8?Q?AHvkJBIiYAWBZo9Vn0MFGHE/V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0979297-b01d-4410-6496-08dde07bfced
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 06:28:49.2525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XV2/YAGJg30O9OrqRt/Z6x2OJQxns+WfTLJ7OzSj5tRq488X5nMBLabgyfGgSWUkLS0EFbb769M5Tq1Lg0wgZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11237

Hi Marek,

On 8/21/2025 12:29 AM, Marek Vasut wrote:
> [You don't often get email from marek.vasut@mailbox.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Add support for optional allocation of bitstream descriptors from SRAM
> instead of DRAM. In case the encoder/decoder DT node contains 'sram'
> property which points to 'mmio-sram', the driver will attempt to use
> the SRAM instead of DRAM for descriptor allocation, which might improve
> performance.
> 
> This however helps on i.MX95 with sporadic SLOTn_STATUS IMG_RD_ERR bit 11
> being triggered during JPEG encoding. The following pipeline triggers the
> problem when descriptors get allocated from DRAM, the pipeline often hangs
> after a few seconds and the encoder driver indicates "timeout, cancel it" :

It's a hardware bug in i.MX95 A0, and the i.MX95 B0 has fixed this issue.

Using sram instead of dram only improves timing, but doesn't completely 
circumvent the hardware bug

Regards,
Ming

> 
> gst-launch-1.0 videotestsrc ! video/x-raw,width=256,height=256,format=YUY2 ! \
>                 queue ! v4l2jpegenc ! queue ! fakesink
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Ming Qian <ming.qian@oss.nxp.com>
> Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
> Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> ---
>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 69 +++++++++++--------
>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  1 +
>   2 files changed, 42 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index aef1d6473eb8d..0095c2182ed39 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -44,6 +44,7 @@
>   #include <linux/module.h>
>   #include <linux/io.h>
>   #include <linux/clk.h>
> +#include <linux/genalloc.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> @@ -783,32 +784,40 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
>          return -1;
>   }
> 
> +static void mxc_jpeg_free(struct mxc_jpeg_dev *jpeg, size_t size, void *addr, dma_addr_t handle)
> +{
> +       if (jpeg->sram_pool)
> +               gen_pool_free(jpeg->sram_pool, (unsigned long)addr, size);
> +       else
> +               dma_free_coherent(jpeg->dev, size, addr, handle);
> +}
> +
>   static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>   {
>          /* free descriptor for decoding/encoding phase */
> -       dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -                         jpeg->slot_data.desc,
> -                         jpeg->slot_data.desc_handle);
> +       mxc_jpeg_free(jpeg, sizeof(struct mxc_jpeg_desc),
> +                     jpeg->slot_data.desc,
> +                     jpeg->slot_data.desc_handle);
>          jpeg->slot_data.desc = NULL;
>          jpeg->slot_data.desc_handle = 0;
> 
>          /* free descriptor for encoder configuration phase / decoder DHT */
> -       dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
> -                         jpeg->slot_data.cfg_desc,
> -                         jpeg->slot_data.cfg_desc_handle);
> +       mxc_jpeg_free(jpeg, sizeof(struct mxc_jpeg_desc),
> +                     jpeg->slot_data.cfg_desc,
> +                     jpeg->slot_data.cfg_desc_handle);
>          jpeg->slot_data.cfg_desc_handle = 0;
>          jpeg->slot_data.cfg_desc = NULL;
> 
>          /* free configuration stream */
> -       dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
> -                         jpeg->slot_data.cfg_stream_vaddr,
> -                         jpeg->slot_data.cfg_stream_handle);
> +       mxc_jpeg_free(jpeg, MXC_JPEG_MAX_CFG_STREAM,
> +                     jpeg->slot_data.cfg_stream_vaddr,
> +                     jpeg->slot_data.cfg_stream_handle);
>          jpeg->slot_data.cfg_stream_vaddr = NULL;
>          jpeg->slot_data.cfg_stream_handle = 0;
> 
> -       dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
> -                         jpeg->slot_data.cfg_dec_vaddr,
> -                         jpeg->slot_data.cfg_dec_daddr);
> +       mxc_jpeg_free(jpeg, jpeg->slot_data.cfg_dec_size,
> +                     jpeg->slot_data.cfg_dec_vaddr,
> +                     jpeg->slot_data.cfg_dec_daddr);
>          jpeg->slot_data.cfg_dec_size = 0;
>          jpeg->slot_data.cfg_dec_vaddr = NULL;
>          jpeg->slot_data.cfg_dec_daddr = 0;
> @@ -816,6 +825,14 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>          jpeg->slot_data.used = false;
>   }
> 
> +static struct mxc_jpeg_desc *mxc_jpeg_alloc(struct mxc_jpeg_dev *jpeg, size_t size, dma_addr_t *handle)
> +{
> +       if (jpeg->sram_pool)
> +               return gen_pool_dma_zalloc(jpeg->sram_pool, size, handle);
> +       else
> +               return dma_alloc_coherent(jpeg->dev, size, handle, GFP_ATOMIC);
> +}
> +
>   static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>   {
>          struct mxc_jpeg_desc *desc;
> @@ -826,37 +843,29 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>                  goto skip_alloc; /* already allocated, reuse it */
> 
>          /* allocate descriptor for decoding/encoding phase */
> -       desc = dma_alloc_coherent(jpeg->dev,
> -                                 sizeof(struct mxc_jpeg_desc),
> -                                 &jpeg->slot_data.desc_handle,
> -                                 GFP_ATOMIC);
> +       desc = mxc_jpeg_alloc(jpeg, sizeof(struct mxc_jpeg_desc),
> +                             &jpeg->slot_data.desc_handle);
>          if (!desc)
>                  goto err;
>          jpeg->slot_data.desc = desc;
> 
>          /* allocate descriptor for configuration phase (encoder only) */
> -       cfg_desc = dma_alloc_coherent(jpeg->dev,
> -                                     sizeof(struct mxc_jpeg_desc),
> -                                     &jpeg->slot_data.cfg_desc_handle,
> -                                     GFP_ATOMIC);
> +       cfg_desc = mxc_jpeg_alloc(jpeg, sizeof(struct mxc_jpeg_desc),
> +                                 &jpeg->slot_data.cfg_desc_handle);
>          if (!cfg_desc)
>                  goto err;
>          jpeg->slot_data.cfg_desc = cfg_desc;
> 
>          /* allocate configuration stream */
> -       cfg_stm = dma_alloc_coherent(jpeg->dev,
> -                                    MXC_JPEG_MAX_CFG_STREAM,
> -                                    &jpeg->slot_data.cfg_stream_handle,
> -                                    GFP_ATOMIC);
> +       cfg_stm = mxc_jpeg_alloc(jpeg, MXC_JPEG_MAX_CFG_STREAM,
> +                                &jpeg->slot_data.cfg_stream_handle);
>          if (!cfg_stm)
>                  goto err;
>          jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
> 
>          jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
> -       jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
> -                                                          jpeg->slot_data.cfg_dec_size,
> -                                                          &jpeg->slot_data.cfg_dec_daddr,
> -                                                          GFP_ATOMIC);
> +       jpeg->slot_data.cfg_dec_vaddr = mxc_jpeg_alloc(jpeg, jpeg->slot_data.cfg_dec_size,
> +                                                      &jpeg->slot_data.cfg_dec_daddr);
>          if (!jpeg->slot_data.cfg_dec_vaddr)
>                  goto err;
> 
> @@ -2902,6 +2911,10 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>          jpeg->dev = dev;
>          jpeg->mode = mode;
> 
> +       /* SRAM pool is optional */
> +       jpeg->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> +       dev_info(dev, "Using DMA descriptor pool in %cRAM\n", jpeg->sram_pool ? 'S' : 'D');
> +
>          /* Get clocks */
>          ret = devm_clk_bulk_get_all(&pdev->dev, &jpeg->clks);
>          if (ret < 0) {
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> index 7f0910fc9b47e..311f2f2ac519f 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
> @@ -142,6 +142,7 @@ struct mxc_jpeg_dev {
>          int                             num_domains;
>          struct device                   **pd_dev;
>          struct device_link              **pd_link;
> +       struct gen_pool                 *sram_pool;
>   };
> 
>   /**
> --
> 2.50.1
> 


