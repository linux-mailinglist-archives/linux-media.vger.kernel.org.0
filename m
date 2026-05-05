Return-Path: <linux-media+bounces-60326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKgUE0tZ+Wk68AIAu9opvQ
	(envelope-from <linux-media+bounces-60326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 04:43:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9F54C60EE
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 04:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BC3A3046FA9
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 02:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C52A3A3E93;
	Tue,  5 May 2026 02:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="mWdobfxL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4BA392C25;
	Tue,  5 May 2026 02:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777948881; cv=fail; b=og6b6JVizBQyW2HJhGvho03h5XTRPNxefo3fuaQ01Pt3UkOisXgVnxuh8KlTszwRMh8ExlIsV3DSrH8Zo3dBT9VqbkCwZ89PSrcZD/WsM2kwIJWnOB/bqsmnnnUScYT2IpjYRKDD0AvJPFN/kOALJHHZybmdTNN5Nb8o0Vtbi4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777948881; c=relaxed/simple;
	bh=5gsLSDIvoxVExJXzfoMnRCYoUa+EBbZZ4QmH3smMZfQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jBz0VXsXUuKrAcpHEICmVwgfkyMaH58gVdZ+LZDSZqmIrcCVkpnUVbUsgenSqEmJNnE+TpGEia3cEScO7TwWp3efVhv/CjktIWaaRbyNlKE7ozu4sInj4iBDyhoGoxDlXJocjwCCCBfln2INYlcT/bkP7AYYeRtXcwrMaUtOYfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=mWdobfxL; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6452MlSK1806311;
	Mon, 4 May 2026 19:40:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=nidYGVBUOYIfXHfuLFKR2BWrOZ+HtDmpEKz2DQdycsI=; b=
	mWdobfxL7Vv2FvgG9aIh6SLCyBOIoFs/I0igvwaEPsUHDpf58Otg8lUnLkNInKHt
	Agyickz0u/cxMISQ1Kg8EJZjbHfkKckjL/C8SjK30C8OHloLHUV6YYJqQIfDaOjt
	pQMI163HthqZvUAjX3S1Uf1CF9mWmC5Q/r/ajVXrt4Zc5ml+xGnBNA4L3IAuFAgZ
	11oV5WgEBlMobB7yqPSJWQObJj39wU5ZPhZse5fR2knCUFIUPA2xW8ztLy7P1J8T
	8fv2mYO4QFXjIexH1wY6F9AvG4eVwWIwpslBi+U/KQcuYQZkty3w2cVvZ0frHkre
	4A8dBia7JYlTWxweLKsOUQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012067.outbound.protection.outlook.com [40.107.200.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchytmjr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 19:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msQ+T5q/2HxbAp11LrfL6qSWPY/yF6r/POUiBq40kOfiQKx1WQfViyRNP/ItDec3ZYoyff+7GNoLxP20qCxahPlkR5DFGFuTACPUC3Ki3fAPy4VkXdzlyzm4XaopB+woBG2HrlO7tjG03zokpbaz2UlCu1NAPmqvSNSACmcSxBg1D9DlkvkTYvpZCxPzc5mo3HOMnaveWP9LxfbdG4lidlfBI32aPJvgu3647YCz26En7BRYrlQ9VBkRY8/KKyeSCG2xjh2hA8vh87N5EIHBSUnYGq89e8AqcJAg8BKwhBkSW4PlcHVPPXPfZmKQ1EMhi5Ncpxx+n9H0EIamLWbgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nidYGVBUOYIfXHfuLFKR2BWrOZ+HtDmpEKz2DQdycsI=;
 b=cSPWV7zkTmEpC8Pwb619KNM9CvW76Aqv/n4gpUXCKxypu4pZ5oLpjmqqSqwS+IOOJGM+qC1HIEU9h7NfDdJfAJp2slSrLCvd93p1I08JT/Sj8EFji9TqGjfpXVxsSXLcKIw/HgZZfa/OqoGpRRnM2To2GFk6HmS9tq3S+xr+kEWZy2ase4TTjyVy77UY+e5CsCeOcD2W16CekJETVsaQLR4cQHIP+dKEW9ZIfKqe/ifTCtRppsylKw2yR9tLTNSZyLfdIIdIvU7nPozWIvxuWZdIpLJI6FOyiGunODsOd29CMZa1y8v9WlODQtrMjq5QbhZOrEd3LLJiotqipKYLDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 02:39:15 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 02:39:15 +0000
Message-ID: <1bbd7824-a15d-47c6-baf7-03841bff5439@windriver.com>
Date: Tue, 5 May 2026 10:39:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: imx8-isi: fix resource leaks in probe error
 paths and remove
To: Frank Li <Frank.li@nxp.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260424231926.406079-1-xiaolei.wang@windriver.com>
 <20260424231926.406079-4-xiaolei.wang@windriver.com>
 <afjHnSEYm4t0rko8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <afjHnSEYm4t0rko8@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0124.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::11) To SN7PR11MB7017.namprd11.prod.outlook.com
 (2603:10b6:806:2ac::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7017:EE_|DS7PR11MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: c2dfba38-080d-4b1f-91b8-08deaa4f7f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YEkmzy4CZhHJm3HjqqfCTh9p2aRK7faOJfogDLaopLaktY3frqeQQex9DKGKXsM+E5AcmowcCc3P5Ts2qiGOZI+QTyRl08zm2aXPQed8Ad+3v6NghY8JZZeRRwIgm7/h1jXCim+rt8sd42otKbG2cuTtyeindO5VUsOqXQLYpseJMfIFZbmHNnB1Vb6WU1UPsnRGR2sSCn4IOcVLMGiFlkQ0ysA/TTuKp9rDeGJkLhLuUHYaGHv0GGfni0U0M7MqBtTaBgquBLxz+gwlsRfVR7wRqITOqZACly3FdbiTy8puY2/X7e/WhrpYLyPNe99bpNpW3z88jHWxcA/jMs2hY4Y7RBXcnkCj2d55ZAFwJDtYLslsQWv+2kSexoi2QMCk3yZca8Iy2aqQ7dDs+gtj9Q3lQRHhrTFcjk3+bqESv8pTJIAyIvLAKcUbPjNJSNf37ZfYJcc22pogJVP5QrAioEsvefrXCIL6usq3u6rXZ7BZMbgjp0hMNP0Y4/FYCK3DbCXMOlQmIrsElCJ3boUMZ874INBKDbnPxU5SENs9e7E9wXKZK9+yQ4wA3+OR1pJ4AdPrZW7TopzcyruGWPOWeUx65v4lxkWVSByauquAVRuBui0kfmoYz2glYrcGsgEMbnsxviAybA3fUAHsFXjjTJrJliC002JEiVAJR4nWV6xIeJeGrrkyCdYnlJstvAWY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUtCSjZnN2UzK1lONmY1MzhvWWVIM0Z4NzdZcUlZeVZCL1NYY0tCY001TXdJ?=
 =?utf-8?B?TS9qV2xnWDJSNFpzeGlIWWJkTENOcjR4RGZmN0xDUGllZE56aVFrbjJHbVcz?=
 =?utf-8?B?cXhPb1Q1bFROenp0SWNHTFNmMWlUWS8xWWI2UDBHMUpRdkJjRGNWTkZIeUF5?=
 =?utf-8?B?Zmt5Q1FLeFdzYzd6WlYvUHpKM0Q2TU9rTnVtVWRpSkJwbytIaStnWnJjSmtN?=
 =?utf-8?B?emZRa1pGV2V4cG5HcGtGTmNpVEcvUWZ1VmprWWU1VVg5S3J0NGEzS3gxb2x3?=
 =?utf-8?B?cEhhQ21hUHo1Z21EMzBrYkJJZCs2QUF5UE1DdjR6NHVseXZtd3J6MWpsTHRh?=
 =?utf-8?B?NXRkQ3QxelQ0WlZKL3NnSm1Td1F5RGxMSUw2M1kxRVlnVlBCLytGWkdLVUJM?=
 =?utf-8?B?SFNIcUVQM3grUkRjWURGNWdnRlVZeUNuNVdzbDlhbEVab1YwSUZsRkc5bytw?=
 =?utf-8?B?aW5KcG04czRKNWhFamFrSmpiV1h3d0Q1QmRyNUdwQjZJeFNRdHRENHlCUy9Q?=
 =?utf-8?B?ajNoQXFVaDlqUURsM3RxUFdqN1ZSRy9JMVFhelRmZ2U3MTI4Zy9wNEEwU0VG?=
 =?utf-8?B?UWxka0p2VG9mS1Fyb3Byc1JyS0doQm1pMTEwTzR0MWFpS1cwOVAydklxNnhl?=
 =?utf-8?B?WEhqNGhkU0hzSzRKU01uUUZLQjRDR0tKdVBubm5UMGtseitoN2JUbmhlVG03?=
 =?utf-8?B?di9mUFd6aDlKTjNBR09kWUVJTHVBV21aY3VzMWViOVVxS1QzdkRSREU5dWZI?=
 =?utf-8?B?K01NeEZ0blExNlhsRDRKeUxRTHc2cklEQUZGelBwdm0wVjIrNTF0dnhrdnQ3?=
 =?utf-8?B?MG44dDFrZHZGVkxXUmRnZXRDVklpQzJqQzE2OGFQMnQwdWxaTitrRFpRSkFM?=
 =?utf-8?B?dVc1U1ZZYVZPNWpFdUV6aXRlWG9NRmJRTGRhT0hBM2xHZFZRMDRLNitmdndh?=
 =?utf-8?B?TUNBWTVESUppQUJOUW8xcWY0U3dYVnZSK3JWVVNCeFZzZ3BRbnhsZk43ck1y?=
 =?utf-8?B?WHljaWNKWExTTUdOeC9VR2xIMm5KVmRwUnVMNGY4UGRtWWZSUVZOVHpYdDNU?=
 =?utf-8?B?T3QvMTdpL3NTMkxVVkVDdjN1R0ZUQVlseTllKzRleUZGenR1bUJKRVlmVjRF?=
 =?utf-8?B?c0lzRGNyMDVoMnVBenlxNWJzT3IzQ0FuM21PQkhoM284SkIvSDM5VnVuc0tG?=
 =?utf-8?B?MDVVVWhNZ1U1UVl3L3BKeXBwdC9LZWNvR2l1MnptelYwWUxKNk5wSmx2RTE3?=
 =?utf-8?B?bGJyNDkrT29Qd2Y4UTNjQ3EwSm43L2R0RE45bHNSbmt2a0picFhHUTJrTUNR?=
 =?utf-8?B?VjdaQmp0WWlJV3BscWRqTXc3emNLRXdPZlp1K21RZ1FhMyt6UjY2bGl2THFM?=
 =?utf-8?B?aElxRm41YWdwOFVCRHJsVTllRTBiZjJ4WEZPcTVlVmFrZ0xXZlFJNDhWZjJh?=
 =?utf-8?B?SEhVV2MzVHVOQkRlZmJKem4zMzdBWGx5Y2VMS3BvWEJ4QnhsbEI4R1ZwS0Ez?=
 =?utf-8?B?T1RQWVB4a091Y2lpaTdhL3V4N1NtV2NGeExhblVmN08ycVZEblNpQzZURFRY?=
 =?utf-8?B?cWpheXRWalJ5eFlPY2tNZm1KOWFOUGR3V1V1SExldm5MVDJncUNyNlgvQTJ0?=
 =?utf-8?B?WW9LYzNuZzJGT3ErN290N3VYa3pEZzcrM3lUU1lXVlpSSGR0akEybjRxZGFO?=
 =?utf-8?B?M3RhUGdoeENlbzV3YmRLSjNLeTYwdzIwd09XZ0dJUlI4MVA1RDc1VkV1NHJT?=
 =?utf-8?B?Uk9GNlFnTFhEOEtLOHc4Q2h2aXpEUG4zTEdoSm01ZDJEbTc5QkllWlJyYXZ1?=
 =?utf-8?B?b1c3aHpSaTEzS0xQeDAwZi9zK1NlVExDRW1pY1lvdWxYNStqR29KRGlmdndO?=
 =?utf-8?B?YzJuRFptblBvTHFScStKK1BWSmRxd1VnTXJGa2FtT1NTdURQUWU2MnlzSFFN?=
 =?utf-8?B?RlV3ODVaK3Y2MjZhVUZwS1AzQ2NoWXkzK0FBTVRBK1B5V3Z0NnBiaUxIeGly?=
 =?utf-8?B?TklLbG0zSzVXeTJpS2xnZmZEZHkvY09oQ2JacDFSV3RIejk5N1dadHVoS0oz?=
 =?utf-8?B?ZmhUWlkySjRjalVrRWp0YUJ4d1ZPV3RyQTljZ1BXK3NoRU9NekViM3ZuWGln?=
 =?utf-8?B?YllGRWR2YmEwc1Z1UlBDNld3Y2laamVEUFJIWGRFS1lNeUtzc1hEOXd0c1BO?=
 =?utf-8?B?dlF1aEFGc1hzVGsyNmRpc2w1WEFYMllsVFdSMlZla3c4RFQyTVdlYitNYndL?=
 =?utf-8?B?bzBPS2FMV0wyUnA4VGY2K3p1Vi9kVmtsNGx5VEJBZDJjQmQ2d0w2NnVlRDZj?=
 =?utf-8?B?Wm5MLzhWdmVweWhYL0RaTEVNUDlRcTlpYWJidGFYWUY5MFVCK3Z6TDYzVnNM?=
 =?utf-8?Q?UqiwEQmmKlRJExJ4mB9wP73pJAZE42HZQ5KRwg2wMSqTr?=
X-MS-Exchange-AntiSpam-MessageData-1: KSnqtK7Zd0u8aiWB1wNOhSv7qVEq4nIK/+w=
X-Exchange-RoutingPolicyChecked:
	SlHsC34taeOqc1imIpVrcaqK+cZ9z4bv7hp1tvQMgG4QnKxVhWE+L2radGXYjzjemfuyvJ35vG4E1TovGqqxFYdds7MJtWe1A3Now7x+fFzDTlmyHdfklEviYJ8Gkyy/G+9VeWc1lu/JgSMBWGxsv48w5gHbUa4xSq+s4AT32VbzLrilLeZSUWRZZOfZO+SCZeWfKQ6x2AWOaWb0nqlSA5xX0rFYXhPp/hpH5emWm10TnNtsybz02NM7ckWjfMtT9qJGqVDfmt+74NQKyOSIDNHbp9H8iHY+Jq3sS4ALvT20WfN/dURxH3L0vEj+JqYqkOQKOWkuy+xRaevnejGLCQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dfba38-080d-4b1f-91b8-08deaa4f7f48
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 02:39:15.1319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmLQB+pIAcLJYrfNmvN8mWZjn9AjL20i4xjFWI/UvDMsyyBww352Bbg0nvO12fLb3fG/zNegT8VuXXcHjAeZBPoAPZSDFfUubjmUGffMqiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAyMyBTYWx0ZWRfX+G3oc5CpMPa3
 4RNL8hsmx+XZ3AnhHjAVYaCGy84fSb2FaE1GiuT9NMQf9MPggMELV6fHqleKUcU7I173oxWA3b1
 gMoifJhnOhhcHH6wNqWB49Duoi9ttMSzEC8rJdvjhxmFQrusmBIRd0wO3BgTwMtAQpdFx7Ne6pW
 MLHMvrIFDdo9W7Urr52C0IKFQwzc01Pu9AqW5AgJnGKQz/b3WGRxOkNzLmodCXj7T3X26iGTiiu
 HwuxAw1/oemqDBbHZL+jJu5EgkX5wF58ei6mu4hF95furpH2Pn7IQZAg7keGgzGLjVUGK1Zqrfr
 bOMoLp1L2ccnd2jk1hg9uGlflWmh8PPPGDP9lNg+cBjliKHZ8O6rk6j0j5ntCr/5A6LshmgAiEk
 8o30ke61WyHrYQQXz4SZjEuzhvh+zsiWgPjpNFfa9BPUHFuVYJJnzZVotPGT7B41VGjUNVnhcgb
 oGTs2GyqUp1dG+SDLiw==
X-Proofpoint-ORIG-GUID: MshUXeY7ITfKgDeHuczKdNOd4WYIcSEs
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69f95892 cx=c_pps
 a=A4Ph3AWZfT0pg7R4Z/C0uw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=zasR19Tv65GsDpzOMRUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MshUXeY7ITfKgDeHuczKdNOd4WYIcSEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050023
X-Rspamd-Queue-Id: DF9F54C60EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60326-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,nxp.com,jmondi.org,phytec.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[windriver.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Frank

Thank you for your review

On 5/5/26 00:21, Frank Li wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sat, Apr 25, 2026 at 07:19:26AM +0800, Xiaolei Wang wrote:
>> mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
>> frees it on any probe failure path or in mxc_isi_remove(), leaking
>> the allocation on every failed probe and every normal unbind.
>>
>> Additionally, when mxc_isi_pipe_init() fails partway through the
>> channel loop or when mxc_isi_v4l2_init() fails, the already
>> initialized pipes are not cleaned up — their media entities and
>> mutexes are leaked.
> Although it simple change, it is two problems, suggest use two patches to
> fix it.

Yes, it's two issues, and I will use two patches in the next version.

thanks

xiaolei

>
> Frank
>> Fix the pipes memory leak by switching from kzalloc_objs() to
>> devm_kcalloc(), which ties the allocation lifetime to the device
>> and eliminates the need for explicit kfree() in all error paths
>> and in mxc_isi_remove().
>>
>> Fix the pipe init leak by cleaning up already-initialized pipes
>> in the err_xbar error path.
>>
>> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
>> index 2d639b789910..8533a979d60a 100644
>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
>> @@ -485,7 +485,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
>>
>>        isi->pdata = of_device_get_match_data(dev);
>>
>> -     isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
>> +     isi->pipes = devm_kcalloc(dev, isi->pdata->num_channels,
>> +                               sizeof(*isi->pipes), GFP_KERNEL);
>>        if (!isi->pipes)
>>                return -ENOMEM;
>>
>> @@ -538,6 +539,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
>>        return 0;
>>
>>   err_xbar:
>> +     while (i--)
>> +             mxc_isi_pipe_cleanup(&isi->pipes[i]);
>>        mxc_isi_crossbar_cleanup(&isi->crossbar);
>>
>>        return ret;
>> --
>> 2.43.0
>>

