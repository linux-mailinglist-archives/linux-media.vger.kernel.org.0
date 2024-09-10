Return-Path: <linux-media+bounces-18043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 071D0972709
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 04:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3657CB221E0
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 02:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D89E143880;
	Tue, 10 Sep 2024 02:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="f/1bNQqm"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2090.outbound.protection.outlook.com [40.107.215.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF311DFD1;
	Tue, 10 Sep 2024 02:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725934251; cv=fail; b=MXC8tnGM0aVulhokbke35AXQKSU9iP3kPOINR1QBNlSiR2mWLVqY88YWBLVViHASbEFXU7US/At1VykRdowBD8uds7c2ZtVeqc2neB4H1Yhl2Ca4Jd4dbfOAuN3oqz35lBKWntO8MDjBEBHEoYl9hnf6yN1vq2ZXsSQxIXYxe+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725934251; c=relaxed/simple;
	bh=8nEbG9ZwAQd2t8rlPnVd3G2w8a3yKU+pGbnCgwODBnM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tlRTkk0LHkbY+ibnwaY/4P484A7OtJ4zq8jriyrSaPZN5BtqhibIJesMlnA2JEW7+UL8yWWK4AQUfBRJuQQufVF4S8o06wF8phXZ223UFPYrB8iBWayGujM113nefiArR1TcSdc6jl6SQurteq2iATdw7EBpQwQA1U34bFJ1DXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=f/1bNQqm; arc=fail smtp.client-ip=40.107.215.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYDaDm69AXrqQgXVBh5uXuG05HPEGjvr+NbpKAgDB04Rk/31NJmOXzGa7+nNdjqVhwnpd/d1i4GfGCrj4YroIewlxKC3PSGfxrN+VhpqQ61tsqfgd5nWHF0Y/Uf2jX2stnlVDYYH5beoS9TDCy0VWMPUkIM2JsIpnMqjKN2QY1CEQwRgwoStk7D/MxwrNOA0WjFdCX5XS0Bbe2CZrqz8XRyZo1U71pV5RhN7bcx8im4p7s25B9PYaF8JrkS9HCiLDpPprT4sjkupjb8kos6shDV7NJpdw24ReJthp/LAqiZXdHrCO7CRW7NVshrjDvPIkg8XywcG6HNY8CtUyWaJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgQvMkXxO7dO7g3S2fdDXHlPj7/HSgvMhxQ7PixZWeA=;
 b=sZ3h/Q98N+IahzrzC3pQ8O/xF5i+GrqtUFzn5dYBxaQ6c9SgOrMtibGZdf1qOBE/+jqhj+7h+dW22lviOETgsVpzhwtGcZTXv7Uds1yZMOhEVwo0hWT3FhG7NIn1XvQ+6v49UfhK5agL4vsTSAVRSm1MfzDi/k6yRgvyQLgLoBnBz7DqZTRW8EU4QghAgfn8tQnVzvzn6uXSV8s7KIE8rA3K3twcGkefZDULt9zP61eAchn5rh4j+tAxOCzmhzbzkJ1AYfAH5sOUbSQfDW/CVLnk2b5HWUfuprPisMTGxLHE+/wUWYIUk+ac6qJFZ+ug3LulqSPZJ7EM4XtTS74WOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgQvMkXxO7dO7g3S2fdDXHlPj7/HSgvMhxQ7PixZWeA=;
 b=f/1bNQqmt+qJTApev2mIjq7PFsY6NarAtNMB0892/cmJ/bHXvDfevpqJj+lIlk6ZtinfuH/aA2D17fWPQl5Sg0CXEErOlxRGwr5KTYJO27kURDBUXH6OXiEZHv4SJteilAsvmg76T+NZzrMtZtveXcE3uW7jKAIhAoGOE7QyxWKSDgT5lzUdm7wrQfhjZ4WiUxGXdYSjdvAWtCr6D6yxKmADqyb66s16kNSiyF63wvQIdKljiK9+YSWh3l6vx4XAtud9R0EFRAKEjvChV8ckdG6EAlv4e2MrjyIll3sxXHcHA6zlRyNX3Kgt+56TlRiUzg3XP+KwZOO4+Fc+hAQycQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by OSQPR03MB8624.apcprd03.prod.outlook.com (2603:1096:604:291::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Tue, 10 Sep
 2024 02:10:44 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 02:10:43 +0000
Message-ID: <b83514eb-9c07-4005-8169-d36a12424cee@amlogic.com>
Date: Tue, 10 Sep 2024 10:10:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Amlogic C3 ISP support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
 <6hbbej3mm4s6nrpdyz4a4l7nsbuu5eu2p2xws6o5xpg4ag6fav@tkbfrkpefeoh>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <6hbbej3mm4s6nrpdyz4a4l7nsbuu5eu2p2xws6o5xpg4ag6fav@tkbfrkpefeoh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|OSQPR03MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: f73217a2-6489-4b76-be66-08dcd13dc66c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1hyaVpQVCtVTTFLejZiRnBPejNRRk5Na0o1MG5PeFhzakZ3SW1Lak1JWHJk?=
 =?utf-8?B?ZFltcFNPYmZTbytwa1ZBQTdqNHdjdmxSaFNFUGdrYkxPL1Nxem95ZlQrclpt?=
 =?utf-8?B?YTN1dG1RR2VqV045ZDU4ZU9aNW5KaHlhSy9BYTNLZ1I4TEoyVlQ3MElSQWxz?=
 =?utf-8?B?cGVvYXI4ZjBZVENhanJ0dW5scFRaOWlTaENHUkUydDFHSjNKSGdubkMrTS9S?=
 =?utf-8?B?NGhwc2ZCS2pGRDdKWWFFekZWWVV1YVE2Mi9LcS9YTHNhTDZQc256UFJCL0hB?=
 =?utf-8?B?RTVqcGpLVWRlL2dXRmF4eFhqNDBTaFd3S3hqRE56Y2xJVElFMzdqM1BjWmZB?=
 =?utf-8?B?SHpCUHpxdUYxT0l4RkJGZWlxVEN6Zy9hd3B6dVBKSnQ0eDhnOVloL2NqMGRR?=
 =?utf-8?B?Sm55QW1tQ2xiWHJpSHFycGNpWnVLUCt3WHRPK2pqdUhmREZHUjdwNll3N2xr?=
 =?utf-8?B?U1BDR2ZrMWtPdjl4UHF2d1NweXA2WlRUb0dHM1VWRTAvRVR1ZW1sOGNaTWZ4?=
 =?utf-8?B?WC9WdFd5ZUxQcVU5dEFQSWNIU3Y0MFA3Z1BUa0FleW9uYVREZnpTT0JQbGZL?=
 =?utf-8?B?SS9PQXhFU3hXOERMR0JNblJxbDV5c3UzaDlaR0dWQld6T0kvY0QxWVkxY29l?=
 =?utf-8?B?QkxEQlpVdjNGS0ZnTm4wOVdJZlI1ancvZEJrSHRNbzVOUEFab05BcUNqd3Fr?=
 =?utf-8?B?WTN0enNsRHZYeVNVZ0tKVFZPeUIzU25RMGlUeW44RC82UGJmcFlWdVUwSXJO?=
 =?utf-8?B?QnNwbUVPSmpDbmxVRURPWWREZVVaeUljSEZ0cHhab0RRRW5iVHVLelFUeHhq?=
 =?utf-8?B?SzFsbEkvcXNSb3Rsd3gzWE1nZTZtd2lDQ1pLUXNlQzdtVDFjYlFhS2RaNzNX?=
 =?utf-8?B?VlpJUHZoRDRsNm5UNDNWUTFQYmdjTEJOLzVWMXY4QXR5MmpRVEsxQ20yZHhn?=
 =?utf-8?B?YXJUQXJZVkxETktYeEhtZnY3NER4K01WaDdBbktEWGs4bjEyWExlSnZmc1JU?=
 =?utf-8?B?SHE4eUtqS3dUNWx4SXdMWjI1MW5aaUVEUkk0d2d1KzhaWmVRTjkxQnhwbGxt?=
 =?utf-8?B?TEc3d1ZPVlJxQUxyaXA0VmRrVXdWS20vNUd0akR4MGtUQ1Ayc3Zyc05MRVBO?=
 =?utf-8?B?ODR3Y2lxVVdKMHRVSi9zcjUyNll5UExOclg1dlNTclRIc1FqOWt3RzF6b2sx?=
 =?utf-8?B?aWxhS3U3OFBYdGIxOVNJcjZSWCtldjlaV0JDQ29rVDY2SWs2Tkc5RUc1cmJ5?=
 =?utf-8?B?c3NRcHhGLzFoTUVLN2QyTWR0QllraEpleVFMUFZUTEJtOTRvMjVrWHZiU2I5?=
 =?utf-8?B?SGxaREkwczNQczlCdFUyRFQzd0xOU29BdDV4TnZJRmlVZWhHeWdlUXNwQjJm?=
 =?utf-8?B?VXJOeTFFa2xlSGF3U21lZ2RzUzJVYTBwZzVKK1VqUDNZYmpaNXRRVUxWeXNx?=
 =?utf-8?B?YVgzWjhBa1lrbjBaRDNoQU1YRVQ1NmZGWDRRRDJiOEJyZnA2TEhJZUNYZVNF?=
 =?utf-8?B?RndDN2M5Qk41ay8zS3J2NXUzaU9CSUxGNU1oNUR3UElIQkRKM01BeEpRUDcy?=
 =?utf-8?B?Yml4aWxIbVFEVUdYSXVwQXNXcTdPblNnNm9pYUgvMU1EdDFJM2d5NGtBM3pn?=
 =?utf-8?B?TzdjbTdoYnczcDRJVHZKbDBNY1kvQ2l2QUlXTStCTS9ObDdlNWEwdEVkU25C?=
 =?utf-8?B?eGhHZGxvM1U0ekxSNS9uVXVaWE1vZ21tQUJOUTNEZGRXWDV4OURYQ1hVSlNl?=
 =?utf-8?B?WGxYOWlmQWlyVXloM2N3bWxXb0VNV1I4MUMxUTg5NFFQNDd3Szh3OFAzTTdU?=
 =?utf-8?B?andXSjJpdmRkOVF4T3ZvQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmN2V2JIK2NYNlNFVTRUSWlMd3NoQ3BTZXpZK2duU1QzWS9aT0FXS0xZOWo0?=
 =?utf-8?B?N2lwWjdzZWg5bFZ4b24yYlhsWWhvRnhFREVqY1Nib0pVMTZ5S3Y3TWhaRDFG?=
 =?utf-8?B?TGRINTlMQmVzT2hTNFdFdEx1L2V1dU1MRTgvdjNKK3JJMmlaMnA1WWF5VWVw?=
 =?utf-8?B?WGswZlRUYmhnQXlaOVltVU5tTHJhTVA3azJ6MEtKanZQdkpLaU42MEp0aFZK?=
 =?utf-8?B?OWV0Z3JsL3hPaUhRRkVyWFFUMnFETmw5QjNveEVQcHNQdlM5RHhnTU5rOVNn?=
 =?utf-8?B?ckxPRGZvN2ZZS3ByWFJ3R1prcEIxMUtsOXYwcXVWenpuaXJzdklaOHQ1SnlL?=
 =?utf-8?B?OWxpc05xc21IYmFmRWZ6MmxkU05PeGNCaTU0a2QzaUNlaG9mK01EcGhURzdY?=
 =?utf-8?B?ZjhoNkxSWjgxYXB0SmR3NFBCbUlyTmV0ekJjUFUwOUJzN0RmVHQvdHl2c3cr?=
 =?utf-8?B?Y2tWZzdybDhUbVhKTE4zL0REQkNBUnViOVFwYXVrVnVOMktHUkVHMEF3SVYw?=
 =?utf-8?B?RzhXRzF2eFk0TTRXcWZnSXYvSzZRV1dyelEyTnBZa2E0TU5SY2lHdHJyaFN2?=
 =?utf-8?B?UEdreFQxR2xOSjF1dDZkYzdpd0hKaWxIYnFJY0xVbkhFYmhiaDdtamc2Ly9h?=
 =?utf-8?B?dnRVOVh5aG9aa0toK3BCMlFTVTdvRExabWo4MjJGOFhaaTJXTEhHcDhjdUNK?=
 =?utf-8?B?ZEc5cUhZbXd5TWlGQ1IzOVUwMk16OThPVTA1WjJzVmxKaEVpKzJ2Y284M29F?=
 =?utf-8?B?bnB2TmpoMTZZL3Q5OFRsazI3amhGVGYyVzdwWG1yL0VUOTVSZEZ5eXM3OFdB?=
 =?utf-8?B?cmp5MkZYRmJYUVZOTUZEOFh5dzk2cS8xMzdRaUFIM0ViOTFRTmtIeXZSanA2?=
 =?utf-8?B?R2JKa1hSU3Z2YktmSlBkR24vcjd4T2p6Z3pMbnZnZUdqOUp5dFllUmRoMmJR?=
 =?utf-8?B?dC93aHJBTTNHaVFRZnY5SUgycDdOUkhUVE1KV0NLcEJHTmlqZGVHWlhCMlVG?=
 =?utf-8?B?TFZ4RGJWZ2hCLzVsdk0zZmhKenZqUUZpSkZMZ0tVRC96Q0cvY2QweHdEclUr?=
 =?utf-8?B?ZW9jN0dtaENBU0dqVGNTaEZ1WmhrT2UxQ0pjMkYwREkraURvRmFENmNSYmUv?=
 =?utf-8?B?VlpUR0xHR2lZVzNpSXdwQjhHc0s4c243RVlVSWxZcThJTVJqRVVpWGhucS94?=
 =?utf-8?B?WVltYWYyL0NtNU9KdWEzd2Fra1VXSW53ZytRVSs0Mlc3R2pZbkxlTmJtMnBW?=
 =?utf-8?B?Q2dBeU5LR1BUbzIwaURmOEo3NlIrQm0wM1FwMlo3VTZ1dVVKd3RseUFqTmM3?=
 =?utf-8?B?b1BXdkJqeFRhVGUwTi9CamovcVJnbFJXWTBPZGJtUlp5OWFLOEZpcVVCL3pR?=
 =?utf-8?B?M1VKMldlckw0ck9aSWJ1ZW9VWjFCVlRBeXBMUVk3dGdhU1EvdUgraTdyQmM4?=
 =?utf-8?B?TjUxL1ZIV0svcm1YbFBBM1VSSmRXVHNRb2pMclhTQzFxVzFWT0JMeGZrek1M?=
 =?utf-8?B?VWVJdVBQY0RaaktYQ0ViK0tLZDVZZ3U1eHpSckZzUHJWWU5OcUR3ZkRuNDlT?=
 =?utf-8?B?SmJrRmcxU2Y2R1RIMzhNcmZPYUgyd0NzM1VpY0JyUVJTb2k5U1B2aXVzdkhk?=
 =?utf-8?B?eDdjUlZ0QzZyVXJacWRXWkN3NXEzYWwzbG9JYlB0RjlOVWFUamNHOFdIN1g1?=
 =?utf-8?B?Z2gvNm9ZdDlyQngyU1JaczBRK21oNEVkd3ltc2ZmMklUd0pqSHZjMkJpd1Q2?=
 =?utf-8?B?MnU5a25aekxZb28ybW5pOU9WSnZuR1FJc1hBYlFUNGVYRUxlb0grdHhPL25S?=
 =?utf-8?B?UUkwL21CckF6TUxRRUVuWitjN2pZQmlQQ0NQSmJqdzlMWktvY3gydmFpbXli?=
 =?utf-8?B?T0FwZUo3ZjNFWmsxa3g4MUQ1VWRiaXM5Q2UrRzRaSldySVViMjFUaTlyd1R2?=
 =?utf-8?B?cWx4RFo2OG1qYjdLRkdWT0tvYmNGRGxEODExNUZIOElmUlVSNXVNREtYN003?=
 =?utf-8?B?L0dvUFJBMmpNMmRrNWVKS20zZ3RGdHF4ZmcxQ3ViSFl2OHVSNnZaQkpSMkVy?=
 =?utf-8?B?WC85V3Z6TndJN0VtUkQ1ekgrZTJ4TnB0S1lqZHV2SWt5dXZzYThIYlRxV2JX?=
 =?utf-8?Q?mi/NsFS7QCqdADNORriIiv0FR?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73217a2-6489-4b76-be66-08dcd13dc66c
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 02:10:43.4348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unKJD5oPoRBkNECso/FZ0XSUyKgbNy4bzsx5Vuvbozo+dHc3REaJheK1l1yRmuin27XbsWwPbwTjjpx44j47eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8624

Hi Krzysztof,

         Thanks for your reply.

On 2024/9/9 18:12, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On Mon, Sep 09, 2024 at 03:24:10PM +0800, Keke Li wrote:
>> The Amlogic C3 platform integrates an ISP capable of supporting
>> multi-camera, multi-exposure high dynamic range (HDR) imaging with up to
>> 14-bit raw RGB Bayer data.
>>
>> Capturing images on the C3 involves operating the CSI2 receiver and PHY,
>> an adapter layer that integrates the inline processing from the PHY to
>> the ISP, and the ISP driver itself.
>>
> Changelog goes here, so we won't have to scroll over 500 lines of
> unrelated stuff. I will on purpose not trim the context so you will
> seeto what emails this lead.
Will move changelog here.
>> This implementation consists of several distinct module drivers and
>> is expected to support different platforms in the future.
>>
>> The test result of v4l2-compliance:
>>
>> v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
>>
>> Compliance test for c3-isp device /dev/media0:
>>
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>>
>> Required ioctls:
>>          test MEDIA_IOC_DEVICE_INFO: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/media0 open: OK
>>          test MEDIA_IOC_DEVICE_INFO: OK
>>          test for unlimited opens: OK
>>
>> Media Controller ioctls:
>>          test MEDIA_IOC_G_TOPOLOGY: OK
>>          Entities: 12 Interfaces: 12 Pads: 20 Links: 23
>>          test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>>          test MEDIA_IOC_SETUP_LINK: OK
>>
>> Total for c3-isp device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/video0:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x84200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000011
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x0000000f (15)
>>          Name             : isp-cap0
>>          Function         : V4L2 I/O
>>          Pad 0x01000010   : 0: Sink
>>            Link 0x02000023: from remote pad 0x1000008 of entity 'isp-resizer0' (Video Scaler): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video0 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/video0: 46, Succeeded: 45, Failed: 1, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/video1:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x84200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000015
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000013 (19)
>>          Name             : isp-cap1
>>          Function         : V4L2 I/O
>>          Pad 0x01000014   : 0: Sink
>>            Link 0x02000027: from remote pad 0x100000b of entity 'isp-resizer1' (Video Scaler): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video1 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/video1: 46, Succeeded: 45, Failed: 1, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/video2:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x84200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000019
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000017 (23)
>>          Name             : isp-cap2
>>          Function         : V4L2 I/O
>>          Pad 0x01000018   : 0: Sink
>>            Link 0x0200002b: from remote pad 0x100000e of entity 'isp-resizer2' (Video Scaler): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video2 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/video2: 46, Succeeded: 45, Failed: 1, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/video3:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x84a00000
>>                  Metadata Capture
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04a00000
>>                  Metadata Capture
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x0300001d
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x0000001b (27)
>>          Name             : isp-stats
>>          Function         : V4L2 I/O
>>          Pad 0x0100001c   : 0: Sink
>>            Link 0x0200002f: from remote pad 0x1000004 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video3 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>                  fail: v4l2-test-buffers.cpp(703): check_0(crbufs.reserved, sizeof(crbufs.reserved))
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/video3: 46, Succeeded: 45, Failed: 1, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/video4:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x8c200000
>>                  Metadata Output
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x0c200000
>>                  Metadata Output
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000021
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x0000001f (31)
>>          Name             : isp-params
>>          Function         : V4L2 I/O
>>          Pad 0x01000020   : 0: Source
>>            Link 0x02000031: to remote pad 0x1000003 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video4 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>                  fail: v4l2-test-buffers.cpp(703): check_[  123.995890] isp-core: =================  START STATUS  =================
>> [  123.996714] isp-core: ==================  END STATUS  ==================
>> 0(crbufs.reserved, sizeof(crbufs.reserved))
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/video4: 46, Succeeded: 45, Failed: 1, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/v4l-subdev0:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000041
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x00000001 (1)
>>          Name             : isp-core
>>          Function         : Video Pixel Formatter
>>          Pad 0x01000002   : 0: Sink
>>            Link 0x02000036: from remote pad 0x1000035 of entity 'mipi-adapter' (Video Interface Bridge): Data, Enabled, Immutable
>>          Pad 0x01000003   : 1: Sink
>>            Link 0x02000031: from remote pad 0x1000020 of entity 'isp-params' (V4L2 I/O): Data, Enabled
>>          Pad 0x01000004   : 2: Source
>>            Link 0x0200002f: to remote pad 0x100001c of entity 'isp-stats' (V4L2 I/O): Data, Enabled
>>          Pad 0x01000005   : 3: Source
>>            Link 0x02000025: to remote pad 0x1000007 of entity 'isp-resizer0' (Video Scaler): Data, Enabled
>>            Link 0x02000029: to remote pad 0x100000a of entity 'isp-resizer1' (Video Scaler): Data, Enabled
>>            Link 0x0200002d: to remote pad 0x100000d of entity 'isp-resizer2' (Video Scaler): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev0 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 1):
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>>          test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 2):
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>>          test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(370): checkMBusFrameFmt(node, fmt.format)
>>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 3):
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev0: 72, Succeeded: 68, Failed: 4, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/v4l-subdev1:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000043
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x00000006 (6)
>>          Name             : isp-resizer0
>>          Function         : Video Scaler
>>          Pad 0x01000007   : 0: Sink
>>            Link 0x02000025: from remote pad 0x1000005 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>>          [  124.084364] isp-resizer0: =================  START STATUS  =================
>> [  124.085234] isp-resizer0: ==================  END STATUS  ==================
>> Pad 0x01000008   : 1: Source
>>            Link 0x02000023: to remote pad 0x1000010 of entity 'isp-cap0' (V4L2 I/O): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev1 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 1):
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev1: 58, Succeeded: 58, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/v4l-subdev2:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>> [  124.130974] isp-resizer1: =================  START STATUS  =================
>> [  124.131838] isp-resizer1: ==================  END STATUS  ==================
>>          Capabilities     : 0x00000000
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000045
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x00000009 (9)
>>          Name             : isp-resizer1
>>          Function         : Video Scaler
>>          Pad 0x0100000a   : 0: Sink
>>            Link 0x02000029: from remote pad 0x1000005 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>>          Pad 0x0100000b   : 1: Source
>>            Link 0x02000027: to remote pad 0x1000014 of entity 'isp-cap1' (V4L2 I/O): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev2 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 1):
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test V[  124.177400] isp-resizer2: =================  START STATUS  =================
>> [  124.178270] isp-resizer2: ==================  END STATUS  ==================
>> IDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev2: 58, Succeeded: 58, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/v4l-subdev3:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000047
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x0000000c (12)
>>          Name             : isp-resizer2
>>          Function         : Video Scaler
>>          Pad 0x0100000d   : 0: Sink
>>            Link 0x0200002d: from remote pad 0x1000005 of entity 'isp-core' (Video Pixel Formatter): Data, Enabled
>>          Pad 0x0100000e   : 1: Source
>>            Link 0x0200002b: to remote pad 0x1000018 of entity 'isp-cap2' (V4L2 I/O): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev3 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 1):
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK  124.223764] mipi-adapter: =================  START STATUS  =================
>> [  124.224637] mipi-adapter: ==================  END STATUS  ==================
>> m (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev3: 58, Succeeded: 58, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for device /dev/v4l-subdev4:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>>
>> Required ioctls:
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev4 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for device /dev/v4l-subdev4: 43, Succeeded: 43, Failed: 0, Warnings: 0
>> ---------------------------[  124.269696] mipi-csi2: =================  START STATUS  =================
>> [  124.270587] mipi-csi2: ==================  END STATUS  ==================
>> -----------------------------------------------------
>> Compliance test for device /dev/v4l-subdev5:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>>
>> Required ioctls:
>>          test VIDIOC_SUDBEV_Q[  124.273752] imx290 2-001a: =================  START STATUS  =================
>> [  124.274678] imx290 2-001a: ==================  END STATUS  ==================
>> UERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev5 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for device /dev/v4l-subdev5: 43, Succeeded: 43, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for device /dev/v4l-subdev6:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>>
>> Required ioctls:
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev6 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>          test VIDIOC_QUERYCTRL: OK
>>          test VIDIOC_G/S_CTRL: OK
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 12 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for device /dev/v4l-subdev6: 43, Succeeded: 43, Failed: 0, Warnings: 0
>>
>> Grand Total for c3-isp device /dev/media0: 613, Succeeded: 604, Failed: 9, Warnings: 0
>>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>> Changes in v2:
>> - Modify coding format of the YAML files.
> That's too vague. What did you change? What is format of YAML?

OK,  I will provide a detailed description of this change.

Thanks again.

>
> Best regards,
> Krzysztof
>

