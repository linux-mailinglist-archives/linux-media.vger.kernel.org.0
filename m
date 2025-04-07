Return-Path: <linux-media+bounces-29444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB76A7D23A
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 04:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AB0E188BA88
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 02:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6791C212FB6;
	Mon,  7 Apr 2025 02:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mx7b/d9Y"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1C135280;
	Mon,  7 Apr 2025 02:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743994436; cv=fail; b=TaWX4kmbxaX2/zMHtKLmJcPxee+MRvvT7wV/Lxj9ybz20j1lsCkyn19qBc6X//HwoJZNkuOv4FhsmOcFNV6dlPjt7w2pM9W/CkrAB+GMM93MFkg9ad+5NlJxmeP5gHys9L0YcD6ZPCE17Anve74InVeq6LXAG0rW7APFyIGNIqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743994436; c=relaxed/simple;
	bh=Pdvf1MkSzAk4JXpJ+qcUb316rupfsDYOqWdTXGfYQjQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U0vo0kR2xgstr51li/T+HO7jhiQ3jRSSB4za/S9l0z8gw202uRcNlXvMqWCFlZNDw3k2uYd8Y1oB0EgLqNM8ZoaEarRBXUrAeSFWE4yu5HFUJ8M3Af9jy0ShloYSJ528ugqroMvjZp8FVeEvOd6rFYVGIZmiyqQf856/vCE7/gE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mx7b/d9Y; arc=fail smtp.client-ip=40.107.22.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmlGyazlsguLLJViiyQz1nlSeFk9AhvL/UpSdCPEb1OzJqLCKyOpFA32aydTgVG39/0hK7M5psLNsBOXE5Ncll4vK3xP9fEeHKB8CFCZbAe9PIxVp60hY7AafkqKRC9ZQwZsLZv+AkJNQ7/4hpgvJy4tSZZKKffJ4VuEYhClfhOTvRrS8nMR+ZExE+7hmws+UIaCq++XN79RDt3BxaF0iMoW0axqmq2obFrYU/jyTdAUDN6ixIaQmoxvp9b2qCtZLGRgy/IkSDXQ8IvkOTFYu8+iOAzXD4ujZlQ5eOE7kjuN/YEa86VH0vqJbA0uk1mEBy1r4B+AlZyU69RdWlhgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfvIV59H9ViSrmdJzqKZgZRASpvrzVATDKHNsi1badA=;
 b=GBkhadbwmyhkSwIqO+yAznIq7O9l9xuLRM1Z8/b3AejNvJEVyPs5PrUuYTXQZ6TtAJjPlGEZvPk/oKYdTgtxf+Eains0cVOiWBf7DJ2YDLXpzYo1hicdM4gz4qxiq9e0F4OEDNaIrEqyYlmRkY85acuHRd/g+RermGfLP6KH6seQeSU7GydUoP1Jd8RGLJsnyvjpBauecj299M9sYvhSVpGKdbU2/0V05hsvlQwNgRk/Xv7lbPjsiARtXfC20rrbSTG6f23P3gQdm3IZc01U3fxSpXAZ11w5ktQz5I11sDF904lKIn8z68u+m/wCpi391IxWtT2CAnF59KViesDd/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfvIV59H9ViSrmdJzqKZgZRASpvrzVATDKHNsi1badA=;
 b=mx7b/d9YtHMtYjnBFJ1pjroeOdoKecWrfkFcYe8iZ2RRqnUeKjVszztCBm/1vQQDgU10vv9dDtTamhmrwotVJgSzmTOxehdVQHLPVVg66XCc5q1t3YuNwPUNQ/zjz/qItFlff6bcdEtgwm9Upghp95CZ9b/jQ59bJpyB3NvxnC2qGK17tpImFMXd+VSotg1umxBftHayOW1qulIGmjZ0S2sxsEe7zvN6ojGxH+oi85aQpdZJkGx2SGP7XyKZteLZxLVIIFxaoX/jtbMUTkakRFWGKaIkT5A555rQGAw7evlqHtq2d69ULtAmF1YTwqnlhxDrIIsAheLQRk5Xrz1XDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS1PR04MB9263.eurprd04.prod.outlook.com (2603:10a6:20b:4c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 02:53:51 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 02:53:51 +0000
Message-ID: <92c8f778-cd94-4113-8b9e-699b8ffa9fa2@oss.nxp.com>
Date: Mon, 7 Apr 2025 10:52:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: imx-jpeg: Enhance error handling in buffer
 allocation
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
 <20250328063056.762-2-ming.qian@oss.nxp.com>
 <20250405113936.oepkmoz2czytbuxy@basti-XPS-13-9310>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20250405113936.oepkmoz2czytbuxy@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:3:17::20) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS1PR04MB9263:EE_
X-MS-Office365-Filtering-Correlation-Id: 819f5bdb-c70c-4dca-4331-08dd757f6d1f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGlSR2oyYTRsekhYTDVlZXZMS1BENVd4b09qbmFvK3dQcU1SbmVLcDI3Q1Qy?=
 =?utf-8?B?Q1pLUk9IZWI0K1BUaEUzdHp1RXEwTkU2YW5BcEN2dlRwT0RaQTQxL1lLeWNN?=
 =?utf-8?B?aU41dEtpOEpMKytRWklyMGtjOTcrZHdEZ0VnUE1Pa3JDS2Uwa3ovKzJHZEw3?=
 =?utf-8?B?WFZoWE4zSk9hSHNndEJ6L092eDh2eWlwWXRURXZvQ08wNVp6czJhaXk0WXpu?=
 =?utf-8?B?c2EyV0EwM05uV21DS0tWV0FWMzRWajBTV2VjdFROZU1SSkhxdU9TTzlVTlJO?=
 =?utf-8?B?M1VYbm5QV3Fnd3BkRVJXOTFuNVZzbjFmbUFkeXhMbjlmeDR1MmIvbndnbWgr?=
 =?utf-8?B?L0VsejNFakhiWlE4NjVCZzBkZERUb0tyMGhENFN3eG1KQncxY3IrN09rdG1h?=
 =?utf-8?B?TXhoSCtrTm5UNWliNVdzSWJ4ajBLbk1PMXlTSlpUaFpIaHZmN3hUQ0FQd2VZ?=
 =?utf-8?B?ZnZ3TVZ0M2FPRmxZSE5SYy9tUHF6OHJnbDhETUdnY0c1ME5CY1RkRllkb3JL?=
 =?utf-8?B?bjhRL2tDc0ZzNXo3TWpSZ1liRWpoN0ZyM0tvdXZmNDJab3BnN3o2REdyeFdy?=
 =?utf-8?B?QVJRbGRzLzdoWnp2Z2Q5cStyNUFkNS9kVEhYZ0xhNy9lRnRjN242OUFaTHZu?=
 =?utf-8?B?ak8vWXFGc2VDK3ZWOHVjL1RUY09ReFFIKzhEY1dqZmVSS0pzdUl5eDQ4Zm9G?=
 =?utf-8?B?eSthYzNCUUJJMUoyaUhXSVYwckQrMGZJNTI4TVN3TTc3eWs5MjNHYnBwNWVS?=
 =?utf-8?B?dFdHVFRtVkY4R1hVRGxEcTNkblFiUVlDMUNFNXZMa0I5N3VuakE5V0xTd0RP?=
 =?utf-8?B?MUVTaHdMeFZwQWlRTVh5SGJTRWVHMnV2bHJTeHVzN1ZoMEx2TjYxSFczOXlU?=
 =?utf-8?B?QjZxRzFxKzZvOHpHYnpUNGRGUzNoeDE5RG1RTFc0S1VMZ01Zc21oZUFOcnl1?=
 =?utf-8?B?ZFFPZUxLUWJQWVA0WHBPQko5NDdIM2ZwWjVmWDk3eDJWZU9zblYvSktGWWhX?=
 =?utf-8?B?b3B5QkJLNmlBRk54bVJRclJocE5aWFRjUUJCcFg4b1ZHT0F3YzZJbTZ0Y3ht?=
 =?utf-8?B?am5scVFhaUpTRkQxK3pVSnBSSy9pRHl4K0dYdUx0cGYvVlVFRGRwSTY3cThC?=
 =?utf-8?B?cTMzUGtzc3ErMWI4T09BK2dGTStFS25WMnVBSElLVmI0Y2pvRVgyYTlNMXJs?=
 =?utf-8?B?cDd6ZHFveVpyKzQwK2xWUDJwSXM5NHVrMmtsUWl5eVFHbWY0UWlxV3pyemln?=
 =?utf-8?B?MDdLZWI1RnNFZ2xDUVBpT01OanVsTWxYWU5NZFBOQ2tSd3FHY1pVaWxFMFJa?=
 =?utf-8?B?VUhQbnJjQ1ZEWGZBZDZRbGk1bGRlT0xFeHVUQmtaZ0Nsa3lmb3hDSW1BMlJL?=
 =?utf-8?B?NGQ0elhSejFUcW41STFYS2lmSU0xUmdtL0RQeTh1MmxTOUo0Qzl3VlFNWlNH?=
 =?utf-8?B?RU1sc00zaHhod0MwanpsN3V5VEI3dlhKQ1N0QkhOeFhzQVlrSDlaSnVTWEJ6?=
 =?utf-8?B?aFFpd0l4ZzBPU2JuTWk3REdRNFN6aSt4RytZcnQ0S1VEUEdkS0FYeCtlL3Z4?=
 =?utf-8?B?R1crbGNSTmNHcnV0dEh2eWhJTkEwdDdPVjZ5QTdweWI2NzRtTkJ0eHZReHpy?=
 =?utf-8?B?T3dCY2l3VzN1NllJZlkva0FYNVNnbmk5U2sxS0hPRmVFVmR5Rjk2clZRRzFv?=
 =?utf-8?B?STlHTEFKS1ZLSTJFQXdpMm5VVFdYcVhUd1J5MGpPamtNZHhsS3VNdkRIU1FU?=
 =?utf-8?B?c2R5ZjUyQlNxZFIvMDdaT2RMWGZXYmQ5VUk2U1M2N3o3L1pwRHdkb2lqMi93?=
 =?utf-8?B?WkJ4czd4aDFVUmw4VzV2RnUzVHlIVG1Bcml3RWI4dVBoK3M1ZVVyZ3krVWNi?=
 =?utf-8?Q?O/XEiWl2Z2apy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUExMllFblFkZ1poWjJBdnB6dzc0dFcrWGhTaG56N2M0WUUrak5TS1QvWW5m?=
 =?utf-8?B?emlSVmFvMTB4dDRXSm9VU2JIREZtd2tFdUVLbS9TZHlJNm1kKytTcUQxM2My?=
 =?utf-8?B?ZTNvRTdNZHlMSm9aV3NOQi9LbS96Zmo4RS9ZdUJBenZyQm9zODRXb1hRSTkr?=
 =?utf-8?B?VlMwVFFHU1REeE9KVWx4WlVFRE92T3Ruc2ZlZE81d1EzTm1vZklkTWlOMzdZ?=
 =?utf-8?B?MlNxVU5Ed0VFblZpZ04rWUN1eDBESGVPN29RTVI0blIwY2JCMjE1bUdtamJS?=
 =?utf-8?B?N1lHMmMyV1l1bXVya29ZdjBqQnlCWUFQU3BaVk1Ma2M4OTVjblRCMlgzRE9v?=
 =?utf-8?B?Y0M5OWFnRjdCdTRoOEFSU0g4SC9FL1RCSURHa1FaMWYwdmxJVnp3cXQvWEhX?=
 =?utf-8?B?QmNveE96ZTFtQzdsRTdqYTV5R0xEZ0tlQlJnNU9pYWt4QzF0ZzFVa0oyZ0tu?=
 =?utf-8?B?MHpVY083Q3JXQmVFNWZXdk0yQlVFMFpqKzBSdUE5c1hCN1A0ZEpWMEo3cUNw?=
 =?utf-8?B?NU0yaWJvN0xxUDJiMmZBblgvSGNJRi9iSFRZb2ptLzU2Nk9oZmhYaGxQeGZO?=
 =?utf-8?B?ZytPVFhjZWltTmRnMG1SbmFsam12eTAzbXJuRkZkZGNHMWhtVFdTditrdzVi?=
 =?utf-8?B?Umc5SSszU2NlYWdVRFFrQ1E2b2FiU0U3ZERWTTNRU2UrY0hGbkpaTXM2WFZI?=
 =?utf-8?B?Q2t5Z0l6bnNsN2Y0ODBadGkxMlN3R0VlMGFobDVmR0pYT00wWngzRUpRY010?=
 =?utf-8?B?MXRlOE1uWW1PWFNZR2hHaFo5SU1QcDBxTm9kNnBXTUFIYXNsM2tmTVRXOFdq?=
 =?utf-8?B?RTAzSHd1d1g0Y25rTndubFdnQ0FvVERlbS9pTnhaOVFtakZrdk1idXp4ODZD?=
 =?utf-8?B?MkRXOHJNOTVYUmJxQVRuRkMwSkk5cHZkaXFmTmw3ekRaVmxqdkhhZHVTTmVI?=
 =?utf-8?B?QS9MZ0lNNFM0a3htb01EcXdwcWJIdTBGOVY3YmVtekcrRFFPcG1NVVRpcDNn?=
 =?utf-8?B?ZDRCTDIweVJHOUdRVFdVbHhkNXFmZVl6SkZjSVZ3MVZkOVJpUXFiSGxBc2dI?=
 =?utf-8?B?a1REZjdyVyt1UVUzeDZidW1ENkpCclQ1ZGlZV1owZHJIYjhQNC9qeGx2QzJF?=
 =?utf-8?B?Y3dRditDbTM4azJWRlI5WFlzNWNSSllTbGNQc1drNXFnNGNMaVowdzBGMXJH?=
 =?utf-8?B?WXdwZS9qTnE2T0x5TCttcDRCUUhQaGlnTDY4V1ZSTnRDTnl4REQ0RDdEYTNx?=
 =?utf-8?B?aU9TV0FFZ3VSRTB6c2lZNnNSOHlvZzB1K21VT2dRUVFUekN1eFJTdWxZRDlB?=
 =?utf-8?B?QWhiWE81VWlVVGluMVErcXFZQjlLZW1qUjV5M0hUZzU2aVZTc1h6c05mUGYz?=
 =?utf-8?B?TkhYcjByQU1COVlJMVVmdDc3NS9GT1RzWFoveFFKbWRUdXRES1JBYk1zMmc4?=
 =?utf-8?B?dWZVRUg4WHRRdHZLS1ZvTnU5ZngveFJWSVV6eitGSW1LQ09sVjVRNXZJZ0pO?=
 =?utf-8?B?ZDNjQStwaU00T0trTmFrZXdYdnd4cXNMK0VZbjBLclo0Nm9xZ1lKLzZ0YXdz?=
 =?utf-8?B?VzhxTStzVFhydGlEWXZNc0gzVFJza0xINXlOZkxXQS9MRlRDNHlPaVVURHRw?=
 =?utf-8?B?V0hQMS9KOFZERmhLR2hxRVZGTTlPSDFwNTdJdFV4OHVPcThScVBsWTN5c0NX?=
 =?utf-8?B?UktHMFUxRTlkdUN6QWR5Zi9yVmxkcmZ0MXVpVW1sdG5wTlR0MEJZNk9mWVpE?=
 =?utf-8?B?RTBqU2NIYzJ0b1MwQjVGTXNFRnlxNHY4aGdsek8rdkFsdlJROTQrdzRLV2Nu?=
 =?utf-8?B?UThFUkZma1lkcHhocmFReGRndldwL0g0cnRUYmFIRnk0TzBnbUdyUWxGRkkz?=
 =?utf-8?B?N2dLRGxCN0lBZnpGU2MxTnRxL2YyV0d2ZzdJTU9QMlRTTkc1M0kvWHVGTktQ?=
 =?utf-8?B?akZaWHlHdnYrL21GUGxQenE4NHVtNGJQb21LeTVOOVJUNlVUK3VHR1hIT0hz?=
 =?utf-8?B?b2NmRmxoc1FuRm1DNEc0Vi9XVEdYVExOOHlIRmZ1blliWW54NUpxbmg3dk5j?=
 =?utf-8?B?bTRqZm92U21ENXJLTEZXQ1A2SmtrUUZ0c2EvZWRWMWhxbEMrQVhrS2UzV1Jt?=
 =?utf-8?Q?F7YogwMMOInFERIiryKfwZMZc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 819f5bdb-c70c-4dca-4331-08dd757f6d1f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 02:53:51.4587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yY/2eMWcxZItlIuqtA7hycP4A797LPojUZNiGn0VcX+lvk94P9nn9LXiOfEYpTSMzroNInPXh2zJW0d5xepwqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9263


Hi Sebastian,


On 2025/4/5 19:39, Sebastian Fricke wrote:
> Hey Ming,
> 
> In the title I'd suggest:
> media: imx-jpeg: Cleanup after an allocation error
> 
> To be a bit more concrete, enhance error handling can mean pretty much
> anything.
> 

Thanks, I'll apply your suggestion

> On 28.03.2025 14:30, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> In function mxc_jpeg_alloc_slot_data, driver will allocate some dma
>> buffer, but only return error if certain allocation failed.
>>
>> Without cleanup the allocation failure, the next time it will return
>> success directly, but let some buffer be uninitialized.
>> It may result in accessing a null pointer.
>>
>> Clean up if error occurs in the allocation.
> 
> I'd suggest:
> 
> When allocation failures are not cleaned up by the driver, further 
> allocation
> errors will be false-positives, which will cause buffers to remain
> uninitialized and cause NULL pointer dereferences.
> Clean up the errors accordingly.
> 

Thanks, I'll apply your suggestion

>>
>> Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG 
>> Encoder/Decoder")
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> v2
>> - Add the Fixes tag
>>
>> .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 47 +++++++++++--------
>> 1 file changed, 27 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c 
>> b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index 0e6ee997284b..12661c177f5a 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct 
>> mxc_jpeg_slot_data *slot_data)
>>     return -1;
>> }
>>
>> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>> +{
>> +    /* free descriptor for decoding/encoding phase */
>> +    dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>> +              jpeg->slot_data.desc,
>> +              jpeg->slot_data.desc_handle);
>> +    jpeg->slot_data.desc = NULL;
>> +    jpeg->slot_data.desc_handle = 0;
>> +
>> +    /* free descriptor for encoder configuration phase / decoder DHT */
>> +    dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>> +              jpeg->slot_data.cfg_desc,
>> +              jpeg->slot_data.cfg_desc_handle);
>> +    jpeg->slot_data.cfg_desc_handle = 0;
>> +    jpeg->slot_data.cfg_desc = NULL;
>> +
>> +    /* free configuration stream */
>> +    dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
>> +              jpeg->slot_data.cfg_stream_vaddr,
>> +              jpeg->slot_data.cfg_stream_handle);
>> +    jpeg->slot_data.cfg_stream_vaddr = NULL;
>> +    jpeg->slot_data.cfg_stream_handle = 0;
>> +
>> +    jpeg->slot_data.used = false;
>> +}
>> +
>> static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>> {
>>     struct mxc_jpeg_desc *desc;
>> @@ -794,30 +820,11 @@ static bool mxc_jpeg_alloc_slot_data(struct 
>> mxc_jpeg_dev *jpeg)
>>     return true;
>> err:
>>     dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", 
>> jpeg->slot_data.slot);
>> +    mxc_jpeg_free_slot_data(jpeg);
>>
>>     return false;
>> }
>>
>> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>> -{
>> -    /* free descriptor for decoding/encoding phase */
>> -    dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>> -              jpeg->slot_data.desc,
>> -              jpeg->slot_data.desc_handle);
>> -
>> -    /* free descriptor for encoder configuration phase / decoder DHT */
>> -    dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>> -              jpeg->slot_data.cfg_desc,
>> -              jpeg->slot_data.cfg_desc_handle);
>> -
>> -    /* free configuration stream */
>> -    dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
>> -              jpeg->slot_data.cfg_stream_vaddr,
>> -              jpeg->slot_data.cfg_stream_handle);
>> -
>> -    jpeg->slot_data.used = false;
>> -}
> 
> Can you split the moving of the code from the changes you do?
> Otherwise the reviewer is forced to get the diff manually.

Sure, this will be done in v3

> 
> Regards,
> Sebastian Fricke

