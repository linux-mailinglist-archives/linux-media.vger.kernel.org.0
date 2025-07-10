Return-Path: <linux-media+bounces-37239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B87AAFF6D8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 04:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BEDB584C38
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 02:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF2227F187;
	Thu, 10 Jul 2025 02:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="I5QwuZ6t"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023140.outbound.protection.outlook.com [40.107.44.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D347F823DD;
	Thu, 10 Jul 2025 02:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752114730; cv=fail; b=HFzdeM93HDvTewlbHkKVvgXABdTau+RVJKL4KsKw1LPaEQ1WoWInnsYK+laE6sxfBWMxwW2si9oMR1dqxOjqy+LRzFew9oQS10OlTqgHMFaqBoCOahL09QC0UGZks65+XtwptGTgzpmmtPR4tlBGeFGd1tsesM8m8lbira1bQcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752114730; c=relaxed/simple;
	bh=zBp4qSIFUP40weD8uEV1HK5RAlrKkxCwNlhebm1i1O8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RAV31pZvMbr/nR+Ba9KFPrCjSJanBUvz/0vHwA33At6eUHIexaHd56YnsDqS1Ke/ISX6GsD/ug6xzNGpUcbOvViwKAO3Xusu0lyBr/VW2rC249z5X1wMc0CyDmPhYgGwgw1oWPSfOc5CjY8R6dwLuuvg3pxCkZfAoMTrOxSFTOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=I5QwuZ6t; arc=fail smtp.client-ip=40.107.44.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Os7FPxehRt18hVHQP1Mve9J9Kx+Af7mrxbuUfuNuyEcPrMmHm2ucTIhVxxM7VPFQ4doGzaeVYZSPy4LRgwQ/bgpycPjv5pMHqrEotBflK4b/o3TPtXCrDxaBhGRKU0R+UTeCvKYrvuGpFmlHYB8OUbL22LxG2Ol6+5UB1Mb9dpkwSYhh2Z0wqhYm1vmG43fd+Jn+Hku/Y0d9LMx6bxC0xlydxVKUYo7HOz+87LOzWluV93/315lNSGahQtZ+aeeVBCwyvIKD3sl5nzMXScEw77GNUz/RQFGajPtfPvJCKBXXn80HXuSxiu82fKrWj44TTkUEwFw8VN+GOJCpXoFrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRo9/P3rrCqscEcGILzPVCYJvs/q/oCNYKjJEWPTFyw=;
 b=rwk3NRx5uAPSY+1L8itB5rcuz5HIXbJC70fGqmVvh+8Jx0JvFwdx4AWJ/V5DmDwn6bPcaHbTe7frwpA1OHIYaPP3n8eHlcyxBvaqJ1kqauByLdjC8jsTbf0EFpZuwfeN3tM70RaEOIhfrZSpn3elgdgrv3Fr1AZakIKKheP6ES26TXeyaDHarNGXX4t5x7PEq9+WW34vhmkoHYb1LjlYCzybih5HcoagFWYW23oEgpHPwjbXns9Qr4YZCRN2r0VhPfepNamSFoGnZA8X0R4ye90LxSALJeTEh/nqC+54PtBXJeLnSUVXuvES3shciRH+8nPYwA0qPPlYruNx57ch6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRo9/P3rrCqscEcGILzPVCYJvs/q/oCNYKjJEWPTFyw=;
 b=I5QwuZ6tLFgrV5rueidZ+RF0EmAVdem1jJ1nM8oX1YLSHLIwGkHAsa07KjDbGTaZ0M0yxkgLoHe8SW607dJa3kWpITurovXInGvujmLUdj97Nj93aSWlKe9x2HwklyXpQiUESP+dy1bk5upU1rydfmcNzXMcmgFvy1NpbclbzpYKJd9olJyKaXQZn/WG6fE/7k1ocYNOXDdAN1fnjwLcEJORIfk2zJo5zBSIrjK+NMy4s3F+VuLydhotqT/4Hsx05zQjAFewnmJpCJA+6LojLCSpaC2prCbmjMnB/U/EUKWjl9XkSiMdMYMnzYlP+ocWsYl3v+D8Cf24X22FDT1oJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYSPR03MB7331.apcprd03.prod.outlook.com (2603:1096:400:412::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 02:32:05 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%7]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 02:32:05 +0000
Message-ID: <968ffcce-9fef-4336-b83d-f9cd7ade6ea0@amlogic.com>
Date: Thu, 10 Jul 2025 10:32:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: uapi: Convert Amlogic C3 to V4L2 extensible
 params
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
 <20250708-extensible-parameters-validation-v1-3-9fc27c9c728c@ideasonboard.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20250708-extensible-parameters-validation-v1-3-9fc27c9c728c@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYSPR03MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 331eb91b-2966-4fba-fdc1-08ddbf59f5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWFqZmNDc3RUd3NSWTRNQldHS0pPazhQR3A4MjZzbHd4UWNYR0JRS3lwdXlp?=
 =?utf-8?B?OG00alFVUml3bGwrWkViQmM1cWF4akhJblZaNTNic3ZadVhsRytwTkRuWkhF?=
 =?utf-8?B?bEd2YzZxWmRBdGZxQlpBLzhvWVJaYjBUai9NTE9BdDFQbzNxbWNYY0JNRzZW?=
 =?utf-8?B?K3YvN2hMTG8wMGljdmtqSzR5N2MveWYzY2JVcDlzdXdQRWNQOWhGTGRjZUpq?=
 =?utf-8?B?ZEFXRGlScXhPMW14djltWmdvWHdDL2thODBnb0VjV1cxR0NqZXdlZmZhVU9N?=
 =?utf-8?B?YTMwd25WUHpydDI5Vk5iamtHL2lBQkJ6VXBrSDI5Ui9tRnhzZ0xQVnJ2VEdM?=
 =?utf-8?B?Yk5VdlFpdUtaMlBKTnMvMnBqVGlNRjBXSHVydk9NOStBdWFIb1Ntc1pZcDc3?=
 =?utf-8?B?USsxR2VJVWZwcjJvUlgvSHRJaVJYUTdpU0NoOXdkamhvaFhJOHhkbS9EUE05?=
 =?utf-8?B?WjZrMjV5VlQ4NVBzWS9uNTZGOEtDRnNPa0lmbXFXNTB2KzBDejlaNjAxMXpM?=
 =?utf-8?B?cFlXeHhtamVBY0tHbVVRVHI0dUkvWkg3YmxjK01od0gzZ0FqZjJQb2dQaFZC?=
 =?utf-8?B?Vk1yRWhYb0U4Nk0xdm1yT0Z2NHdUZ2UwN3VaLzQrNlE1Z05DcmxiaXBBRVhE?=
 =?utf-8?B?bFEwcmNjTk1lV1JkdVU5TEkzbEhhaytOMUVIeWRBbnArTm1Jam1Yb0huRDFs?=
 =?utf-8?B?TWpKbmJTVlYyYnhJaHpXZFRMbFUzOVJUTTlBbjZ5S1dnVjhrS3g0TjJpV01X?=
 =?utf-8?B?VVpBLzJIbjVIRVZCRUFDalQrL256VE1QaTF4aHVMOWdIVXFpV3hRRHlKM1Jm?=
 =?utf-8?B?RlcwbXV2R3hkNnpwY2ROZWgvcVp2MVliMGJLQ1d5OXlyL0EvMUlHWkhSTTFh?=
 =?utf-8?B?NEFqUHQ0NUpYZUZ5QmRlYUhlZWtER2NvQkxMMXIzZVkxQlBlcndPZ3ZnY2Q0?=
 =?utf-8?B?MFpTSFY5emZORzdYMnFtNWpiYnhHWGlrcjZ3VE5SbjdTYjBDTkRBMkFBV0or?=
 =?utf-8?B?RHd0Q3J2RXdmNVdYWTdoSkVYaWNZdkZ3YVVORlVjcFdQNzJLUEtUZ0FjSjY3?=
 =?utf-8?B?UUpBN1hBSGQ4TlBpcWc1UXFwMk45ZEtQTDhYK2JpWUxDc1FpOFVCUnptaWxW?=
 =?utf-8?B?b2xHVTg3b1FKZ21DYUp3Nm4wTk9zVS9OZ3lVMkxSNGtjNThLOHRSU3NQV0xl?=
 =?utf-8?B?WGx1aXpNaEFoR01SVjVQT202ZjdCdWZQMTNqaG11TE04U3cvSEN6QkhzQU84?=
 =?utf-8?B?dWpydkVxelE4ODc0am0xWjJUWDl4UnVGRG5mMFJzblZaRUdBSmNQZEwycmVB?=
 =?utf-8?B?UEJrbWFMNVI4V0NyQ1JFemM2U1J5RFUydXVKVXAwWmRpdldWUWFZSWx3eFJ4?=
 =?utf-8?B?aVhZdlZOdzRLOUhJTkw1cVM1RUgzRGpUdk83RllRb2xIRGtsOFNNYVFHV0E0?=
 =?utf-8?B?Qm5odjFmNSsvdXgwN0VQWnIrOXR4dWhBdy9qdXZQVUVqK3JmLzArRDRmQXIz?=
 =?utf-8?B?Z3VaNklZVXRSR2ZhVFFTTXNhNHhBMzRIRDBxektVOFRmdjVQWWs0UXZqYVh2?=
 =?utf-8?B?TnN1UitMQ1ZQdm9XZ09Ib0trODRjNSt2S1VrOHk5T2c1dXRYY2JlNFNPZU9U?=
 =?utf-8?B?SEF5Zlk3T2Z4cWY4WHhSemxYNnZuWUxPTzN1QzdZVkJtSVFxZjk2SXFCcy8y?=
 =?utf-8?B?NHVSVWpWQTIrWldCUFUxd3lhWHBiR3Z2TFE2Z25rQVNWV0x5NUlvdzNiMytL?=
 =?utf-8?B?eEhwQVQ5aC96WGo4eFhyQ0N3R3NPWkVCU2pIbjZWQXVKaFdQS2ZiMWh1cWp2?=
 =?utf-8?B?T2IxdTduM3g0Zjdhb0Jwd1FDOFBmTUM0QnJZVmZEbDQrRWxkeVVENGhhZGlT?=
 =?utf-8?B?Ym55RU9nRDQwVldrSkhYTk5mNGdrMFlid1Z2M1dmbGZVSFc0Uk5KalpZTG9s?=
 =?utf-8?Q?AL8DXxem53M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UExPN2hnWmdETUVldDh5TUU2Q25oVHpnT0lyRll5aTlzL1MzaE5QNDhoOUVr?=
 =?utf-8?B?MVVybS9LTng3cGxzaVRKMDJYQlM3WFAzMVJ2a2ppYXk4OVlnWkJVQmJIRFA5?=
 =?utf-8?B?MzRrV21WZm1DWjhJdlhIeFBFV29tVGNiMk9ESVF4WGd3MGdlam5JaDdyenhL?=
 =?utf-8?B?YjBiUjhaaUszUGh3ME9Kc2FNb3I2UE96a1pMN0tqRFJBUCtRNkNXU2lEY05O?=
 =?utf-8?B?ZXBOUjRiMmYwMUxBMDhlTDdNT1N4RXpjYmRsNzM5UHorclA1TlptQjR5SUNT?=
 =?utf-8?B?RUJ4TkU1WVNnTk9GaDMrTUpmT2V1alV6UzZuaDlEclBIeUxid0dmWDRReGhC?=
 =?utf-8?B?VVNaWDNETXUwL3VvcTc5M25kaFNnczBjRW5XOGM5QmZ5UEZhNzVvdnQ1aTUy?=
 =?utf-8?B?ZXlSZm1teDAyT3VOdC9qcDFBVVRGMmxBUU0vS1lHbXplT0xIY2d5eUFWeGg2?=
 =?utf-8?B?K2Q5NGRIak1zNWNFRmNMZkhKMnVnSk5qUUpCSUNsRG5xSkFZcFA5UEF3SWZV?=
 =?utf-8?B?RXM1eFlPaWNiU3RJUVBzbU1vUUJLLytCKzBFNkhTUDc3d3YwVkZhU0ZreW0z?=
 =?utf-8?B?MFErT2FRRHFEdVhDcVp5ckI4ZERxS3R0OVpYbmY5U0lBWVZSckRvd09nd0RJ?=
 =?utf-8?B?MjV3MHNNRFdlRGdIdzhZUWhCUVZqekkzRUl1ZHIyejZGeDNITCtGZktFVHhu?=
 =?utf-8?B?a2VVMHJwZjZiV1lEZTZoN3dHOUxQdjhML09ReFc0a1VGeDJiSGRScFowUnVJ?=
 =?utf-8?B?RExLVjZOdWhhRWNvNDlIdXNQRkhXV0dIaEhpSDQ3Ty85YlBCd2Z4aHA3UmJC?=
 =?utf-8?B?TER6bW5zQU5La1dENzl3eHdEOTNWTzAwYmczeCt3Q1VPMjFnLzZwNFZkeXpK?=
 =?utf-8?B?bWdiQlY2UDIycjZENVowejRSS2Njb0tDcGZnekorS3QzVnIyNllGa3lHV3pT?=
 =?utf-8?B?cmtHV2g5ZUU5QUZERUNxTkJZOVpZZEY3S3lhY0NOUmNFSVlOMjRXOHd3Zk5a?=
 =?utf-8?B?bGNwYW40M0tWS0RGTVNmMy9kR1FTMlhXdWhPNGlpOE4vMlRhNTI2STF5Ukg5?=
 =?utf-8?B?QS9zNTFnNU4wa3dGTVg1c0JDTUJmM2MxM1ZpOEJCOC9mcVhKRnpIbytKTEJ3?=
 =?utf-8?B?SDkzdStFTHRST2NsT2FoUVo3VUR6TmdpcnhVMUU5U05oUUNKZTRtTDV3ZE5y?=
 =?utf-8?B?SFZubmxiSDJCbjhnaXRuemVkVmEyOEhXOGVUZjFhYXVYcElEWnVobXFUeGtz?=
 =?utf-8?B?MUlrTXBmd2pjZG1HVUZra2xTRGtiRnFROHltZkNiMnlIN1VmTW1Td3psalA4?=
 =?utf-8?B?cFY5d2pEczhSMVB0dDFlS01zTmhLUVBYOGtBWjlTMUs2V3JGRFoyaVhqdTN0?=
 =?utf-8?B?OTJOelNQRkZNMjE5L3FWWE5kSURwVnpET3dzWW9mNVM1ZWdUb0NUbDBmR0hG?=
 =?utf-8?B?a1lvd1VyQjJmeVZCdFdZajdPUWVrZ2VSZmRHMEdMeDJ3QTV0YkYvZnVjQlhk?=
 =?utf-8?B?TDIzazMvN290Z0lnOU8xSzZMWGFvODZlRzhsVlVXRzBxY1RwRlJIK1VFOHcy?=
 =?utf-8?B?Z3lZZFFvN25CREdwQWd5UDkxK1lFcjVPaEo1dDR4WngrbmY4RXF1YlJCRU43?=
 =?utf-8?B?V3JvbE84Q3pXVzBJc0RZbmVmREpKU2ExTVNWRU5BZkxZa2Noa0R1ZjdlWmNs?=
 =?utf-8?B?eGpuVG1Kd3M5OGZYUS9kN3FsUGFiQVRUMG1DWnpNVVZWVStUWGZtOVJOdDhY?=
 =?utf-8?B?T2svVERhUDkxMjMvMjhXSG13T2tmeUI0TjJza0g0QUQwT1QwblQxek05a25i?=
 =?utf-8?B?bk12a3l1bk56djV4L0VsVEVTZXN6R01JVHJWRGk4RXhoeGN3VDNXOEdmam5N?=
 =?utf-8?B?ci80OU5kcWg0NkY5UWRTdU5iV0NxOXIrcFVxcVZCMVp1U29VU1pyaExRMWZV?=
 =?utf-8?B?QTVDaHJOOE1PZWhNblI3VGN5eWh3cm5wK1VheGpkdU1QUFJoTjFjUVJkcVU5?=
 =?utf-8?B?aFptUGo1RldkbGUyK0JMQUZpYThXc3JzVXUydUdaRFRjaXRUZitkL2lhbUo2?=
 =?utf-8?B?RHZVU2kxMnhNZXF4V0Q5dnBaTmp1QmdTd0gydHo4T3RRV2hBQWJ3ZW8zRHV2?=
 =?utf-8?Q?hobnpcCgzA/pkwkmzfjeo5Hcz?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331eb91b-2966-4fba-fdc1-08ddbf59f5d2
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 02:32:05.5886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTyRDwV+sqGlEH6FZzL/BXLAVPatCKe+UTZzKD04B/2N1ifUAKpELy6Pak6SDAdZQcKAAGJqKqimWq4beQYQ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7331

Hi Jacopo

On 2025/7/8 18:40, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> With the introduction of common types for extensible parameters
> format, convert the c3-isp-config.h header to use the new types.
>
> Factor-out the documentation that is now part of the common header
> and only keep the driver-specific on in place.
>
> The conversion to use common types doesn't impact userspace as the
> new types are either identical to the ones already existing in the
> C3 ISP uAPI or are 1-to-1 type convertible.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   include/uapi/linux/media/amlogic/c3-isp-config.h | 45 +++++++-----------------
>   1 file changed, 12 insertions(+), 33 deletions(-)
>
> diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
> index ed085ea62a574932c7ad8d59d34b2c5c74a597d8..203116cdfb89356301c16c98cb40e5b83efe71d6 100644
> --- a/include/uapi/linux/media/amlogic/c3-isp-config.h
> +++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
> @@ -6,8 +6,12 @@
>   #ifndef _UAPI_C3_ISP_CONFIG_H_
>   #define _UAPI_C3_ISP_CONFIG_H_
>
> +#include <linux/build_bug.h>
>   #include <linux/types.h>
>
> +#define _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
> +#include <linux/media/v4l2-extensible-params.h>
> +
>   /*
>    * Frames are split into zones of almost equal width and height - a zone is a
>    * rectangular tile of a frame. The metering blocks within the ISP collect
> @@ -183,11 +187,6 @@ enum c3_isp_params_block_type {
>    * struct c3_isp_params_block_header - C3 ISP parameter block header
>    *
>    * This structure represents the common part of all the ISP configuration
> - * blocks. Each parameters block shall embed an instance of this structure type
> - * as its first member, followed by the block-specific configuration data. The
> - * driver inspects this common header to discern the block type and its size and
> - * properly handle the block content by casting it to the correct block-specific
> - * type.
>    *
>    * The @type field is one of the values enumerated by
>    * :c:type:`c3_isp_params_block_type` and specifies how the data should be
> @@ -223,15 +222,8 @@ enum c3_isp_params_block_type {
>    *                     gamma->pst_gamma_lut[i] = i;
>    *     }
>    *
> - * @type: The parameters block type from :c:type:`c3_isp_params_block_type`
> - * @flags: A bitmask of block flags
> - * @size: Size (in bytes) of the parameters block, including this header
>    */
> -struct c3_isp_params_block_header {
> -       __u16 type;
> -       __u16 flags;
> -       __u32 size;
> -};
> +#define c3_isp_params_block_header v4l2_params_block

Why not use v4l2_params_block directly?

Thanks

Keke

>
>   /**
>    * struct c3_isp_params_awb_gains - Gains for auto-white balance
> @@ -498,26 +490,9 @@ struct c3_isp_params_blc {
>   /**
>    * struct c3_isp_params_cfg - C3 ISP configuration parameters
>    *
> - * This struct contains the configuration parameters of the C3 ISP
> - * algorithms, serialized by userspace into an opaque data buffer. Each
> - * configuration parameter block is represented by a block-specific structure
> - * which contains a :c:type:`c3_isp_param_block_header` entry as first
> - * member. Userspace populates the @data buffer with configuration parameters
> - * for the blocks that it intends to configure. As a consequence, the data
> - * buffer effective size changes according to the number of ISP blocks that
> - * userspace intends to configure.
> - *
> - * The parameters buffer is versioned by the @version field to allow modifying
> - * and extending its definition. Userspace should populate the @version field to
> - * inform the driver about the version it intends to use. The driver will parse
> - * and handle the @data buffer according to the data layout specific to the
> - * indicated revision and return an error if the desired revision is not
> - * supported.
> - *
> - * For each ISP block that userspace wants to configure, a block-specific
> - * structure is appended to the @data buffer, one after the other without gaps
> - * in between nor overlaps. Userspace shall populate the @total_size field with
> - * the effective size, in bytes, of the @data buffer.
> + * This is the driver-specific implementation of :c:type:`v4l2_params_buffer`.
> + *
> + * Currently only C3_ISP_PARAM_BUFFER_V0 is supported.
>    *
>    * The expected memory layout of the parameters buffer is::
>    *
> @@ -561,4 +536,8 @@ struct c3_isp_params_cfg {
>          __u8 data[C3_ISP_PARAMS_MAX_SIZE];
>   };
>
> +/* Make sure the header is type-convertible to the generic v4l2 params one */
> +static_assert((sizeof(struct c3_isp_params_cfg) - C3_ISP_PARAMS_MAX_SIZE) ==
> +             sizeof(struct v4l2_params_buffer));
> +
>   #endif
>
> --
> 2.49.0
>

