Return-Path: <linux-media+bounces-32298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3599AB34BC
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 12:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27D167A6959
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 10:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B57263F35;
	Mon, 12 May 2025 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neat.no header.i=@neat.no header.b="NJVJm1yd"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2098.outbound.protection.outlook.com [40.107.22.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0820259C88;
	Mon, 12 May 2025 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747045157; cv=fail; b=i63laNkSZg+M+6rxKdgYa9XGbYWCXSXTEYVIJUnjlC3izyTQqwNv2BtgaJrXx7/7EM/jtDGZkoGmZkFJhrjzlkTGxdoMe+j8sQ+vgruce+UXU3T8NwrbOcSh3Y359a+qYSzWKvwGct62ZBmNPsorAIRb+mWTlOqyVbGq3SNgVlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747045157; c=relaxed/simple;
	bh=ppoPIlmwsJMVT7swecFYSXc44TYb4mOTdXgSFICB1jY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d5Gb3E/JEqVdUfqUbrRPQYgb2n8YA66Xp6k9ff4bzukW2LcRsWLIqSw8z12kLPF9hb9Vut4NU2+c9qxm/rIwL3fODnZmHYrQsF4bNv0zkYz1NieR4l0iFhqXqSowgZrt6Dh+kZU+Rdn2fanZmtl5l4JhSZQgxu9vghSNRfF3Gb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no; spf=fail smtp.mailfrom=neat.no; dkim=pass (2048-bit key) header.d=neat.no header.i=@neat.no header.b=NJVJm1yd; arc=fail smtp.client-ip=40.107.22.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=neat.no
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsAKtl6p2QiQQxj/7kbrErd0hTuQPVvPIHHAYZPLIDnvNxHjMmiEFtbSfxdxQOiEK73HgM5c4LmmaEoQdqS++2eBVP8zQYr7qNh5roED8TxM/B7wXY8TmAleoD4ElAkCVGMAiyz71kyX7fH+bvMLFLav+A9pw7qlwWi6pTufUyu5qA+fFKT/x+3D+tWFlcSRGeT5hAVF08rxp43mUhfnzrZ90lpZcHe9KjWxj0bHIm/ZwU5LA7FUp6F3qfCMX83+ltAIDVARfNC+Jtj3LloVyb/vt+/wjsMjO+NotdMoy/ScACwNe7YvyG2t89VR+8752+pw5Qn62wSetmPYLIX7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiEgaeiMSOKCUSbMJxw4E9uR1c1Sbgv8AmWkVCJcCRw=;
 b=b/YwNVYM4NGh9I1Wa9Ex/alUfbL+0pHFT6CYG9a1IlaTecWmi9WG3uJf3VXK56FY5q2dcYeI2kz/H/NaD9YtHDAvmZsQ98D8EM9BTha4+/QhoudsfLDEXQDuiyB0/adHbslgUW++M/T6+OBkzQg+Bm7oZiV8E10Y1cYD1IxsfqnzdN7N5JQItv/32Xun/FDtGbF3OcFBWp96huOBN3lhn4g02Jg+N+YuDW0REJsuQrbG4wuAucSzGOOnY4/HeAexp4f7ehEIilgdOlpE9o++Fc2b99hQa9ay5xHzk5K+jqlMDfAoDGKK92e0ycaIP/hE89f3kTTmn7t+Os79kpyrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neat.no; dmarc=pass action=none header.from=neat.no; dkim=pass
 header.d=neat.no; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neat.no; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiEgaeiMSOKCUSbMJxw4E9uR1c1Sbgv8AmWkVCJcCRw=;
 b=NJVJm1ydmZqVjoRXzHkDta8qzJS7be5qsvjCo2JEGsEKSDVkZ3tEvJ84Oz7N+wgkZkNECAIfeKhB5OMMk25b1vcsTI2eQ6w7fpmbbkXcnvBfpirmcDiXWfQvplo7YPFllJ1RhljMmpXD4YTJKX8ycumG3Z0A1Z1jhUGBznDEOCMS4n9e2WBwWrF5KhuLuCOfaVk9VKxqU70IkJFoonmPLTMcTXIroe7zOgcErA0X7pbXEt0uY7+4j/9kC1BXMYCipL6LGw2+8SW9mMVMWvKINCB8iYYNRJRtfsVeW/yk8Dd24yMCbo+1whQ5Z/zMVKVFSNWIXdqyxqrgTEasheYyjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neat.no;
Received: from PAXP251MB0209.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:207::12)
 by PA1P251MB1068.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:45c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 10:19:09 +0000
Received: from PAXP251MB0209.EURP251.PROD.OUTLOOK.COM
 ([fe80::a426:ce2b:45e1:5342]) by PAXP251MB0209.EURP251.PROD.OUTLOOK.COM
 ([fe80::a426:ce2b:45e1:5342%3]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 10:19:09 +0000
Message-ID: <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>
Date: Mon, 12 May 2025 12:19:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
To: Greg KH <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org, balbi@kernel.org,
 paul.elder@ideasonboard.com, kernel@pengutronix.de, nicolas@ndufresne.ca,
 kieran.bingham@ideasonboard.com
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com> <Y4xaXHLoiPupWM6V@kroah.com>
Content-Language: en-US
From: Krzysztof Opasiak <krzysztof.opasiak@neat.no>
In-Reply-To: <Y4xaXHLoiPupWM6V@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::9) To PAXP251MB0209.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:207::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP251MB0209:EE_|PA1P251MB1068:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eae9f88-1e11-43c8-7400-08dd913e6ee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RU0yUEszMlZkczBmZXJ0R3ByTzVOdXl4ZWhkWG0rMFBXbE9IN3l5UE1POVVF?=
 =?utf-8?B?ajRJNERWV3lnUlVvYmg1ZUpPSS9KZDl1eThFSWFrRUtFOW9kWjhNTlJRMDdx?=
 =?utf-8?B?SDR5ZGlrSm1HL0hLa05yUWlRY1l2QVREakhxT1dzWVUvQldTeldjaE9VVHRD?=
 =?utf-8?B?cHpIbVRndG1FSTlNVjdXMStUK0dNZXd6OVVYZU5qTHBJM2ErYzgxYUJlSjRh?=
 =?utf-8?B?WXduWWNsbEJVblBGT2VteFlxd01Vem5Va0pRRWxaUHNnQ3NZT0VXcDVaVlJa?=
 =?utf-8?B?aHZXTE9aZjNwbkdkZWhwTllGZ1NnbUM0MVl4c3ovUWd0SFo1dWFKZWx3dGRs?=
 =?utf-8?B?dHEzUjVBVEROeCs5ZmdNeEN0QlN6YVVCOW80QWd5bVRhcUVOc0prWGV4QlBZ?=
 =?utf-8?B?MVFGM00ralRJVnFpbk9VMTNzaHpCSUoramVLVWt3bHJEdHNSTXhubjZyYTNM?=
 =?utf-8?B?Y1FmQjMzRGExZ2c5WG90bUdtMVBxaWZwUCsvY2g3ZWJ1T3EvRGtJSWtQd2d0?=
 =?utf-8?B?ci9MS1h6S1dHeFE0NTVjVWhKdll6b1FUNGVTQ1IxNkw4MTVlMXBwMGZseVhN?=
 =?utf-8?B?Rm5yRUdMUm84TExsa05ZVjlzM2hpYmM4V0JwZUhGZU95VG83eHRHOHR3eWZV?=
 =?utf-8?B?NVRYVGQ2bXpwSjZnWmpHWjhIenJiU1lqTHIrQUY2OHlUNzdST3NxSEhRcVRz?=
 =?utf-8?B?T0hYYTBUdlBXSm1GRWZnMW1RQk9yZGdYQ0lzak9lbUxnd0lpYjdKVEVlVHRY?=
 =?utf-8?B?YXM4dC9PVGREQS9tZVhiOUtadC9JRGlHZ092NjJhVVF0SkI0RDlJSlp3Sy81?=
 =?utf-8?B?Zis3M0xWclFYTWxjTjJVYW94WEM4Y3IvWHZxbFhXbnpDOUpIZk1yWXlYNUc3?=
 =?utf-8?B?Qy9YRzZESm9wMnJjWFFDMHE1VFB1NnVVdVVDSGExWEZobWdxVngveVFrWlFI?=
 =?utf-8?B?SmtWUDYzUUpiWitaOUN4MFlWcy9yWERIdHBYclkxd21HbEp6NEFmSHpxMVdr?=
 =?utf-8?B?THQzNG9ud3VrWU1KN1VPVXNTTUhjMExaR3NvSENKKzhQVmxvajNueEhSOVc1?=
 =?utf-8?B?bjBGTVBVKzlaU0Z0RzlXVGRRbFNJTU9OZHRoZkxxRC9ZYVVMUGd2dGRRb0dt?=
 =?utf-8?B?RzM2aW44SzA3ZnhNejlJYkZrMVRJWUhJb3VEUy80SmhLQjNWbWE5VUw4N1JQ?=
 =?utf-8?B?ZDhubmpwMWxlWEdwQVZRdXZkRmlObHd4MzB2b0VlNm1oR2dMKzhHeEgySnZX?=
 =?utf-8?B?RGhEd1BzdUJ5c1luY015RTVaVklPa2hyVk54d041VExVb0krR1dibFlJQTRz?=
 =?utf-8?B?QWxsY0R3TE9WWi9ZN3VxeS9COStySklMTnA1NlVoc0w4TS82RWhrK1JSU0N0?=
 =?utf-8?B?QnRaZVBSV0pWMTlsaXF1SHVNUTRCY205ZnZiL3F4a1BBUC9aQTZJb0FjV0tN?=
 =?utf-8?B?WGV1d2lJbGhtNTY2NnNEcFR4NGFBVjA4MHhVK2J2UWNQbzZBd1hZVUgvbTN3?=
 =?utf-8?B?bHNXQzNKWU4vdG1sbmNHbXNwMEtRbXNvUFhpK0ZwS0VkU2FIM3gyOHdPekJL?=
 =?utf-8?B?NU1BL2NQUWFJV1VsVDhuVXFkcDVXR0dvcXN2dC9Sb2tYWk5Ua0s1L0ZtdGFm?=
 =?utf-8?B?eVNlRDg3UDV6YXZNYmh2Mm00Lzh2MFJTOVNkTVpRUXRMTWsvazY1U1MvZWdp?=
 =?utf-8?B?TzBxNm5mdXRMUE1DUS9rajJqREhWVUJzRXRsMnhtOHp2QTNlUkhLWS9oVE1W?=
 =?utf-8?B?Um41eTZhQTg5QUtVSWdmUXlsL0ZMOWdwTTUxaDN3b0w0MVBZY3NhdTdzVElw?=
 =?utf-8?Q?7/uGXUVmnJFzL/FXkXr3MwMkvTX+YxeiqXoVo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP251MB0209.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnFwQTFDVHZEZkYrMVVLZVNkeDJtVWJ6M1lXM3NaZW1zbk9UUExraGlwZnpj?=
 =?utf-8?B?MXFKVW00VGFmaEh3RlNkLzU5Q09MZkdVMjR6MGlsWnRNdzNPdlVzR09aczFD?=
 =?utf-8?B?M3FLOVVSS2p0WjgrcVUrYi96RWxmQWVmYXZDSzlJbjJDRElxUTBKbjI2ZTFG?=
 =?utf-8?B?Y1ZaU1IxaXc2YmF6amVmWmEvaFZKakt1ZUkyblZWcHdGM1AyNHNDWU5rS3A2?=
 =?utf-8?B?dkhzYnJWbXRNLzVUQURPdzFhbVV4RGhKTXNXMVBRKzNJaC9UNm5rTkczK2Z4?=
 =?utf-8?B?RlU2Tnhic1NFL09JYUdISVVWNnRSTmQwTG01RXprUFQwd0MyNFBnVVo4SHU3?=
 =?utf-8?B?N1hXSVFSbUpJY0UvL2dhWHdNeW1SanFqY1VqMHY3QWhHenNXL0Q4amdvWk5i?=
 =?utf-8?B?RGZScjFaVDUxalZ2MXlSWFAySmZvdzJiSE9HYlhVQWpybndhcUdDNEdCd0M4?=
 =?utf-8?B?ZlRGYTBjTW0xTG9pWWYyeVREakhMZ2Fpb0dQMHBJUXd4NGlCUVBuYTQ3cWtF?=
 =?utf-8?B?RWhnYmllRHNObWRYM0F1d0RtQUNBdG1hWWdYZFRTTG9BZVNETHpNdXVreVor?=
 =?utf-8?B?ZDB3NUZOaUd2V1FkNjl2YmxPS3IvVXBtNlNNcWR2c1JvYUl3Y0kxaVBDOVpu?=
 =?utf-8?B?TWdybTNyamFPUXczeEJnRUtxVmw2RitLZ1ppTE9iaHV6WklyZHdpZlJ3Tk5m?=
 =?utf-8?B?L0RLK096ZDFLU3MxalNzTVo4QnJYVEFCWXgydzNrTHFrRTlyeEgvZTZPaWFl?=
 =?utf-8?B?QUYxbU1Da3hsbWpXTkh1NnZzbS9peU9QR09uZUo5d3FFM053WFFFVjgrMnZo?=
 =?utf-8?B?dzJBKzM4RG5MRXFObm5Zd2ZERWNrUklMa0J2aWN3MkdCcVlEclZkK3dCMXp4?=
 =?utf-8?B?enkzT3ZsN09MZ2VUcmJZcEdONzFtK1FFaVNpYldiOWE1b1lQMHQrb3FsZWVD?=
 =?utf-8?B?dDRlNEZPbFRoRjFsZFJ6RTd3cmI1WjlKQzFnOTlVeHpleHFYTHVRTE9wU1JJ?=
 =?utf-8?B?OVFPZUcyUzVFSndtdzFpc2YvNkxTK2ZXSkxISlY4Y3NCNS84dFRzeXBlNitG?=
 =?utf-8?B?WnhQcFVmS25lNTM4REs0R0ZGN3BUM0dGZ0NJMEZ5cjl1K3p2TlMzOUlwaWxQ?=
 =?utf-8?B?aU5HaCt0eEZDWkU5VHhCUVVSeFBQWjZyUmlhdnZFbGdrMkord3FycE92SXg3?=
 =?utf-8?B?WXBGMFFhaG1pZ1JJQmRRcENQcWIzVkt4bUR2dXZYYVMwMmZXdUVXb2pya2Ex?=
 =?utf-8?B?bVFzUlhIbEVKWVpDTHZKSDFkS1RYdkRPRnljUlJpZ3RXOHBDcm5nSER4QmRR?=
 =?utf-8?B?SStmL3d2Y0orZk5LcFZzVEZiZFJSWmppN3ZYSU41VHFrcVVDQTRNZFFVL2tJ?=
 =?utf-8?B?WVkxYlc1ZEFKZVU3SWFUUm1keGk5TlpmVmpmTGJVTG1lTG9rWUJvMDZvMEFy?=
 =?utf-8?B?dCtaUkcyN0UrU2NQZ2FyUjE0UkhLVDZmMnFPSDRxTGxzU0RManNkZndxV2V0?=
 =?utf-8?B?RTRXdXJqYkRUNjRicmJxeWRFakNIQmV3Ykx6cmtZQjdPbU9aaTVCZmpOZjg1?=
 =?utf-8?B?QlpMOWJGOVJ3QUs4cUx6RktxUVBGYmltWDZZZlNqUFdWSUl2UUpYR1RJYy9K?=
 =?utf-8?B?SWNndnpBekJFanRycjJncm1Hb0NiTzFBRU5ZMW1HdDc0djdnc0JaUG51cUNk?=
 =?utf-8?B?T2svZ0pLdnNITVRrcjBwK0Jxek8xK2VZOHMrQlRQZnRIQUpEWkU2SGsrcHBq?=
 =?utf-8?B?emkyTDNVcWMxU3J0bU9yZUx6ZFJtVzUySjJZUFRrM09uTndHNlhvMXZFUEVi?=
 =?utf-8?B?R3U4dStUaWkrYTNRVG9qU3ZoZUZIL3NQRHBZTGR6UmdMNW9qZHczNUhCdkRm?=
 =?utf-8?B?cjN4L3ZBdjJKdUN3a2FYODhDTVlQZzJRSHhiQ2cyNFI4SGY5b1Y5dHc1R0lu?=
 =?utf-8?B?RWZDT29HSDFjTkxEL1pmaDI0dm52eXkrZTFBaGZXTFdFL3lJTnlyUkFuYjQv?=
 =?utf-8?B?VVlxU2dpWGJaWUxWVmhoVXk1WEd4QXdoWDNsMU1heEFtWWtab0JmRHFBUkJo?=
 =?utf-8?B?ZXVBc0xHN2szZ1poM3B0TGJhck5YMEVycU1yOWJRSnRxaFg0WWpKWGxvcUt2?=
 =?utf-8?B?aVV3NEEraitia2o3Y3ZWalhreVVxQURhdnpWeitCeVBaZWkwTVF6VUk4QlhS?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: neat.no
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eae9f88-1e11-43c8-7400-08dd913e6ee6
X-MS-Exchange-CrossTenant-AuthSource: PAXP251MB0209.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 10:19:09.4170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 029c40c7-2844-4bf3-9532-45d5eff8c8f6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rnu1YSbZ+Z69q0fZUkO6mhz1T7T+IQpEXjBCrDutL/at7wuE4LPJatCTRQfmYG6OckK2lJDKuWk6WnX9F/8MzPCaewD3SnzsoeknKLEf50k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P251MB1068

Hi Greg,

On 4.12.2022 09:29, Greg KH wrote:
> On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
>> Hi Michael,
>>
>> On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
>>> This series improves the uvc video gadget by parsing the configfs
>>> entries. With the configfs data, the userspace now is able to use simple
>>> v4l2 api calls like enum and try_format to check for valid configurations
>>> initially set by configfs.
>>
>> I've realized that this whole series got merged, despite my multiple
>> attempts to explain why I think it's not a good idea. The UVC gadget
>> requires userspace support, and there's no point in trying to move all
>> these things to the kernel side. It only bloats the kernel, makes the
>> code more complex, more difficult to maintain, and will make UVC 1.5
>> support more difficult.
> 
> I can easily revert them, but I did not see any objections to them
> originally and so I merged them as is the normal method :)
> 

I know that it's already 2025 and I'm very late to the game but this 
series breaks our userspace scripts as it implicitly adds a requirement 
to name a streaming header directory as "h" which previously was a 
user-selected name. This requirement is coming from here:

+
+       streaming = config_group_find_item(&opts->func_inst.group, 
"streaming");
+       if (!streaming)
+               goto err_config;
+
+       header = config_group_find_item(to_config_group(streaming), 
"header");
+       config_item_put(streaming);
+       if (!header)
+               goto err_config;
+
+       h = config_group_find_item(to_config_group(header), "h");
+       config_item_put(header);
+       if (!h)
+               goto err_config;

If you name this directory as "header" gadget just fails to link to a 
configuration. Although this isn't a big deal on its own as we could 
simply rename the dir in our code but this is just the tip of the iceberg.

To my understanding, this patch broke an important feature of UVC 
ConfigFS interface which is allowing to present different list of 
available formats for different USB speeds as for example, it does not 
make sense to expose 1080p30 in high speed as it simply just does not 
fit into the ISO bandwidth of HS. For example what we've been using 
previously:

mkdir uvc.nf/streaming/uncompressed/hsu
mkdir uvc.nf/streaming/uncompressed/hsu/360p

mkdir uvc.nf/streaming/uncompressed/ssu
mkdir uvc.nf/streaming/uncompressed/ssu/360p
mkdir uvc.nf/streaming/uncompressed/ssu/720p
mkdir uvc.nf/streaming/uncompressed/ssu/1080p

symlink uvc.nf/streaming/uncompressed/hsu \
         uvc.nf/streaming/header/hsh/hsu

symlink uvc.nf/streaming/uncompressed/ssu \
         uvc.nf/streaming/header/ssh/hsu

symlink uvc.nf/streaming/header/hsh \
         uvc.nf/streaming/class/hs/h
symlink uvc.nf/streaming/header/ssh \
         uvc.nf/streaming/class/ss/h

no longer works as the patch requires presence of "h" directory inside 
"streaming/header" and even if we rename one of the headers directory to 
h the patch would be actually wrong as it would expose via v4l2 calls 
only formats available in the "h" directory and not in any other. (and 
at least on our adroid kernel it makes the kernel crash but haven't 
tested if that would be the case for mainline as well)

Given the limitations of the v4l2 interface I kind of don't see a way 
how we could fix this series to present proper formats to the userspace 
using v4l2 calls as the list of formats can change when the speed 
changes and userspace would have no way of knowing that.

Given that I'd like to suggest that it seems to actually make sense to 
revert this unless there are some ideas how to fix it.

-- 
Krzysztof Opasiak | R&D Team
neat.

