Return-Path: <linux-media+bounces-33377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0227DAC3F52
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 319C03B8C3A
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 12:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5E0201013;
	Mon, 26 May 2025 12:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="eFeXD7HD"
X-Original-To: linux-media@vger.kernel.org
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazon11021093.outbound.protection.outlook.com [40.107.160.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63156156C62;
	Mon, 26 May 2025 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.160.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262438; cv=fail; b=LXaa7xzEB8YTTnhO4OH2Sw7omBZBOWi3gyhe81E7Sp8JlpJcr2BQ1BKqXT8EXXIkiszSdiC/+i2M9FW6a4nPuj5G6MJ7nZ81bteSTw/RG4dY1u+ICwez1XFBthzeKwHLSN0l1HiR3k8W2JnYGD/E62EoFHL2F+nKNGmFdP0tCk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262438; c=relaxed/simple;
	bh=zvFkKS19Tk8Yoi/P10WUDFGc81JmtSZlIVv8S/JUa/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tcftcHe1Un/SgTYRMGEzTxbX3yAKXVPj5LYQXprCxQlBLQqqjntM0biNG67fJ8kaQh7VOoXAZgdGnb9DnI8o3sTDpIVH5Yg+0LgMyHz9GggwJ/tsRrMzt5O0FTAWkQ4fPg5SEVSP+NcT+neTiYbJAudmMCfgDggsIN+BdRqyWXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=eFeXD7HD; arc=fail smtp.client-ip=40.107.160.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIQDqY+VigV9sKaM0mHKS6TEmHvDD0LVbhgcAtPFPdEAViVo6Ge/w4qcfPBZwcbNLBYFybDwqJ5axoMyf8YDBSoJRwFzJ6mwg/PO440VJjHjd6swdZlTniHfN+qsfdPaQn59oAoMT2DHcsuaZvSdROF9gQv8z/hWV+eYwZdHhUoAXxD3T69zkmeuB59Lff5IAhIKwCusMS6nypD7d8wPBZbdQ+ey10qLy1v25V3eSzE614ik6YFCh/5W1ESJz7EBZ+xpFMdZLIFQqkekDDYWDSS5lcsjEt3okQehUa7/lCTZLXaQViN1qkqruVCPtybGSyfdqyVegalLihes5jDHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvFkKS19Tk8Yoi/P10WUDFGc81JmtSZlIVv8S/JUa/c=;
 b=PK/MOSOucHzpJ5qsPrTQ5ZXRQ93JzKaTxr+umc0iwf9N5jFDfrR7zf3mVvXxR4nqUMJQpq/qOuscpTEMbJJ5VFCVSh+ANOU3CsiygPGNt4p72pre592xvJn7zJpKj//Aw0eVj90DP2gwzEpKEPFuWrzDH6dtA5y5Xs/Ibznmcj2bYcTMj2TQ91mcgGhxYgKKEDGFL3RsFkA+C6dAB8PM5GPPox4U2zHOoFa5NCTGpa4GCiJ0v0v6Ey+MvY2592yD5ZtEvjWYNjPTsG8mtoZaWVKtbplXbXww5i8hqBciATvRHR6z8mZyKOuvWZUiR/rAbATXiJ3ZlJbqnRAyoxYaNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvFkKS19Tk8Yoi/P10WUDFGc81JmtSZlIVv8S/JUa/c=;
 b=eFeXD7HDjiNK52ZCCQ6P9Jw1Ozg6gD7oX9+QVtNavdLvUMoPlKf/UXJbfBSVLfu7mQDbBsVGXDtxmP0UQeYKnisLO+CH4lqRZRikAS4qgFG1EJwt3UBMQIkpb8IvhF10O2QabjFm0UEkuu0ZugAYbR/fB0FsRRKFvV+7Ay09qdhatw5oz+RKFKsyAPc/2FJ2KZAw42j9ifEaj9PH06+3+HtZ/fN/WENAtuFtwTwYPUUapJk2BChUuGmkXPJ0FIjBK4ves5S9pAxuUdBZxrFcnPpGkwyf0bjsxQLgZcxnWuY7bYKrNSmeOU9YnWfA1CnxPmOW3zkTC9EYPUxh23uG2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PATP264MB5094.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 12:27:09 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 12:27:09 +0000
Date: Mon, 26 May 2025 12:27:07 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Michal Simek <michal.simek@amd.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Junhao Xie <bigfoot@classfun.cn>, Rafa?? Mi??ecki <rafal@milecki.pl>, 
	Kever Yang <kever.yang@rock-chips.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
Message-ID: <flwocneutp64bxxwfkfqvm6dq7klc2nu33ybr3ap6qeovopfq7@7qognvdf4zew>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
 <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
 <3e6be40a-2644-416a-bd32-f6256f1501ff@kernel.org>
 <7863d15a-fa20-4db5-89b5-77a026d3f937@kernel.org>
 <a72z6exgol5cbur2cy7wjwyroi4zddtki5ab3zdkfuwpskpavr@r26wahldhd3r>
 <b5bb919e-6273-48ed-b5d8-29177dbbfb76@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <b5bb919e-6273-48ed-b5d8-29177dbbfb76@kernel.org>
X-ClientProxiedBy: PA7P264CA0098.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:348::9) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PATP264MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: b0bc174d-43dd-486a-4d45-08dd9c50a241
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NVArN29oU0pJT3J0aytmWVJWY3BoTWVTTDVMMFJqWWRaQm9jYXIrU1dZU1Nw?=
 =?utf-8?B?S29pVVVOcEhBaytQbGI2NjFoY2krZzExdDNQS1ZLc3Rra0RqK3J2YUxuM3hC?=
 =?utf-8?B?NlZvcXlreWxVRlhodEQwdktKWTJTdG9keDFDV09PSXBSRlFvNlh4OUxaSnNU?=
 =?utf-8?B?eVFpR2k4eHlmY0U0TlFmM1J2OGZiWHVBYXo2WEVoVG5DZC8zWFl5TkxQQ0hW?=
 =?utf-8?B?NVR5aEN0QVBDWEIxOHNLS0VPNDNVRWwvbkIyRkQ3ZFRUT01pSUs5bkt6U3dQ?=
 =?utf-8?B?N3creGNvdDhNSlp3Y1Fkay9BZmRIVGJhMEcwRThoL0M5NFYyN1d0SWtpd21G?=
 =?utf-8?B?WXplYm5xYm5NY2tNZml5NnRvK0R1NHJESnpqRlZaemtLcmNKOTI2YWw0VDJM?=
 =?utf-8?B?N09QdkFkZElIMS9KeXNsSlQxWlNicUIrQ3NPQVNjUVdSNUxOK3FHdE1vM3pl?=
 =?utf-8?B?YkwzcTc1Q1NSUWZzbWwzZUkyQTc0dFZJTENGRWc2SFRHeVZhejlFNXNrUzVT?=
 =?utf-8?B?cmxFRDA0L2V2Rlk0aytBZ01jekNYbmFWM0sxL0l2eXIzLzBRcnNtZ3pSMysz?=
 =?utf-8?B?Ly9iaFUyejllcDhJa3RyU0h0YllqRjlBTXo5ZThPbGNqY1VweGVTdkFGWGdy?=
 =?utf-8?B?bXdBVER3L3l1YUFqNlF0Yk8rcCs3b1kwMitTMGw4T01vUkRmSmpRZ2FxdWUy?=
 =?utf-8?B?NUVyMjU5b3djeVZlWjNIMDMzUXpPbndDcTBnZGpEM1cydG5jWHFUZFpOQlFo?=
 =?utf-8?B?cFNvWlpCUGg5c01LRk0xUzFQQmp3d1pZUXEycVZsc0FWMCtJQXBYWkt3QnZk?=
 =?utf-8?B?MFh0QTBqNGRXUlZmQ3ZFeGlFdlBGK1ZHcklINjlZck9RWnZibEgvcFN5N3Ft?=
 =?utf-8?B?b2RJVWU5dXJwYTN2T2tCbFd6ZmdNNTB3TzJDMGlBM0lLY1A0cVhGRjJLRFp5?=
 =?utf-8?B?WEhPZExuMGMyeG4xOW9MRW9kSERkSitpRHlLOFRtV2NZZGFEZkpCVktudFNO?=
 =?utf-8?B?ZXVmQjFlMzFTYkNmV3BoUTVkc0tzcG9oZVlpQ09MVUJaTDZwM1B3eE4rdTQx?=
 =?utf-8?B?RUY2TkJVZ3RUUXJ4alh1dHp3OUVXdVA3bjQ2b0NwZU5WR3ZxbGhKbnBYM1Vo?=
 =?utf-8?B?NXpaOFJZekN4UE9iaEgrRFFHMHBrYUtHMGNaZ0hsdGFOcW5jQ3ZHSVRXTVp1?=
 =?utf-8?B?Unp6ZlY0bzVYS2V3dkg1Tk96d3dlVmpaeU03Mm5ORXp1U25lR2U1ZUpTSUFJ?=
 =?utf-8?B?QXN5NUdHQnM3dnpNRTFCNWN6WnQvbEFNcUYvSXBva0x5aldWSXNML2xxWmVL?=
 =?utf-8?B?a3p1U3Q4K2hUdHM3VGJrajIxSS9rbTA5b3lSWE80bUJBaDFtS3BZQ1FpTTNB?=
 =?utf-8?B?aGNxNWZqTWhNS2RENmhhMGFuR2EvN0l4SXBoSklQZXNHSFpvZHZFSytDWVdh?=
 =?utf-8?B?S2JhenZhOXVqWTJ3MmdiN202TFJESmVad21OWmt0K0UxK05VV0EyZktucDlo?=
 =?utf-8?B?UWVydXRJQ1NvS0h0UGk1VUtpa1lIUCtKRDc4VnhST0hjY0lnSHk5MUxGUXFO?=
 =?utf-8?B?Y0pkaTBSLzhqS1dQL2p3ZzRFaGkvTU9ha3crdU1TVDJqaHJmdVFJN1cwUldD?=
 =?utf-8?B?SWVXdGRnSDM3ZFpaemNYd3d2SGJwSFJncVMydmVscUE3WC8wZXlNVGpNQmMy?=
 =?utf-8?B?azgwdlNFc1lJSkdPa1pWSjVwaGFtMTVDVC82MmJaV1h5NVlDczJ0N0t3MUd0?=
 =?utf-8?B?Mlh3Y20wT3g2dU5YR2JUVU5obG40K3pjVDJTY3poRWxLN2hJVFVEMk1QRjIw?=
 =?utf-8?B?SDBkL0FIUStSQWJWNmFRN3Bld3QrYVdIbkhiRXRXVFk1cjRxMXFiU1loOTIz?=
 =?utf-8?B?ZFIvcGlodEF6RVBWS3laKzhuZlp6WG16M0E5RE1rT2p0eXhwL0doRVRySnBu?=
 =?utf-8?Q?bqvdZt0wjoE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WjZwelpidUoxNE5URVBKZDJYZnhCU2JtbU5Vc091azAyOUtkYUVvNUJBalFj?=
 =?utf-8?B?R1FVSmVvNkNpbXRXUXk4NGttVzJJa0NaQ1ZIOTFnRWtUTFVCV003TU9BVGp0?=
 =?utf-8?B?bnN4UzljWDVROUZXaDdKY2RhR3NpTWF2WFdmRUNKZmpsZldnemczdjVaSXl1?=
 =?utf-8?B?Q0ZxQ0RZSGxGVGJzUTk2ZEF6ZnZlS1ZPMy9RekpKYVJIeE5LTmNuaXB3Qkk2?=
 =?utf-8?B?MlZJdVd0dEp5SWp0TlFmb0d4VmZSakYxa3pSTzhXTVpaYzBuY3hKaDhGR1J1?=
 =?utf-8?B?TTk1bmFqd3F4cms0dTNQY3l6aXc4eXNndy9MbHAyVktqUmFKc3ZKMWpOaXkr?=
 =?utf-8?B?V3BBbjJxS24xeVRTZXpyZDZ1VTJPQnV3aDJQSWo5RjZtYlc2eExZN3dCWjhF?=
 =?utf-8?B?bHEwVCtWeE9VWHgzd0pLUDduSFM3SVQzNXdsVVFWd2JVMGNNdTM3ZEJtSkE5?=
 =?utf-8?B?ZDJKVllLUlZvV01VVVE2aGhYb0xHZmdFL3BmVm5iUFFVNVJyMkRScWhUaHBH?=
 =?utf-8?B?Q2RMWDk5T1BqSE00Tjg3MURUeWhvV3p4WEM0STRxUkErTm1vTGI5VXJsbmd2?=
 =?utf-8?B?TlFGdjFIVUlSc3c5Zk9jTHoxZFdRc3RFdExDaTl3RnRWU1BsNThrK0xyc3p0?=
 =?utf-8?B?ZzNMdXNNaHFtTTJEUS9yK1djZytQQnVGVitudElrZTQ2MTdvT1VKMmlKYzFK?=
 =?utf-8?B?RXBXNTdZZU03OWR4dUVncnFYakZNSXBwVVhiUzRPVmJJeVBsYTFDSlQ0ckRN?=
 =?utf-8?B?bGNlVmJXTHV4d0V1ejQ5UU1uMUdmYk1ueWFsdFRMQjRKWUo3T1I5WThBdDBZ?=
 =?utf-8?B?bFVOM0Q3YVJFVWhXalBpQUFOT3lqMk1jelNNUC9xM3NueERMcnVTTkdxbjl5?=
 =?utf-8?B?UVVyS1NLa1J3MVVNTS9FOUMzUDd6djJabjd1bUtQZklackQ2YmdMeHlTRjhO?=
 =?utf-8?B?a01vMFVIVGtKZlpSVSt5cjlUdGZQNEZkdmhvU3lURFdCdVR0a1hEdmJPWFkz?=
 =?utf-8?B?QldNNFNad3hrOUcwaDNHRDZrS29MTDdpZ3RDUXVYTjFmUUoxMDhnV1p4b2Ny?=
 =?utf-8?B?VlpaTHh0bHRoMW5EUjYrbWxJZ09vOEtQQXVLaEFCZUplRWhGUy9vYklVTWRO?=
 =?utf-8?B?SWpRQVZGNlo3WmNqQndpSHUvMnlZSHNhVGNFa3BBeE0zb1ErUzJGeGc4Qnhm?=
 =?utf-8?B?NXRVWTZXWUJHS0orN1k0M2MvRWgrOEJJVHp5RENreDlhc1lSVVUzYnkrVFVJ?=
 =?utf-8?B?dHN6SDJ5Z255c0JMK2p5V1BQMFhuZlpSOHJTQ0NLL0JUanM2dXB0SXZJZ3lh?=
 =?utf-8?B?ZnpTWC91NWtaejczV2UrT2NVYjFkeitERHNDNGZKdXU0S3hrNGdvVGhYWDRl?=
 =?utf-8?B?Mng1bU9MbzFpclJEMFhqUzBLbzJlMEZFS1g5TmpKekY3Sml5dmFEcXdmcktH?=
 =?utf-8?B?WXJSMGhNdzFFQ3h6aUdFQ0FXY21xeTFMUm5rRUxGWFgwR1YrTHc3ZXZsdkNo?=
 =?utf-8?B?ZTZTU2I4ZHlCK2tIUjlCeUIyT1JIZVk1MjlFc2tYWDZ6am83eEl6N0VPbFVJ?=
 =?utf-8?B?WndJN3c0MzkyNThyL3lMd0JBV2luWERPcER4VGdkUGNwNTRrc2JlUE5kdDJB?=
 =?utf-8?B?MUF1LzltOUZUUVFkMkZkeWVZQUpzTmxVeHprdlJLU29pNlMyc1hzczdxdktz?=
 =?utf-8?B?TU1XWUNIQ0xReWRQWENaRlZqOVpXTy9CRVpIbzFqQ0JzVVVpTmdld1kyZzdU?=
 =?utf-8?B?alJ1MEV1a1o1ekhpUDVyTEliU25KL1FvSmJ3MmdSN1MwaE8wUlE2OFJPMVhT?=
 =?utf-8?B?YkVOeXZtWmU0Mnk2OC83dmNzVHpMbDh4UUhIWDdlTUxpd1RhYitLWnBRNGx3?=
 =?utf-8?B?UStvYWo4MHJ4d3RheXBQTEpGNElqQmpZd0hyd1BDTmV6MDZkVkhsZW5yR3lN?=
 =?utf-8?B?UGRLbEd4Q0NNMDE4elpxdXFVSkE2dDVxajlYczUvd0ZYVm1JbmIrTllPeWpD?=
 =?utf-8?B?Rmk2UG1UTGdCaUJ3anpncVEvb1M5YVZDVkRLOVpob0U0MVh1bjg4Qzc0MTZ4?=
 =?utf-8?B?bFpDbkxVeENqR0psWmlmNWJBN1REdEZxbXQ3OFZheElSQTdkMVA4Y0VCNnJj?=
 =?utf-8?B?dFA1RXFkYUp4blJkdXM2NzFPK0Q0Qzk0bWlOYWRnV3BUK3BYMWYzaEJ5OU12?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bc174d-43dd-486a-4d45-08dd9c50a241
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:27:09.4098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tr984dTGtRGU4WvR81Itl3hNsopuzfV0Wkqi38jIpEKvhAimMR9Dno5gtCt9cmq4FIsmKUuLbZSNIhoVuohlczBZtbro1UNyGeHrjaaDbjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB5094

On 26.05.2025 12:57, Krzysztof Kozlowski wrote:
>On 26/05/2025 09:25, Yassine Ouaissa wrote:
>> On 23.05.2025 19:13, Krzysztof Kozlowski wrote:
>>> On 23/05/2025 19:11, Krzysztof Kozlowski wrote:
>>>> On 23/05/2025 15:41, Yassine Ouaissa wrote:
>>>>> Add compatible for video decoder on allegrodvt Gen 3 IP.
>>>>>
>>>>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>>>> Please do not send the same patches over and over again. You got review
>>>> which you need to address.
>>>>
>>>> Once address you send NEXT version with proper CHANGELOG for each patch
>>>> or top of cover letter. See submitting patches... or just use b4. This
>>>> should be actually requirement for this work.
>>>>
>>>> Anyway, I see all of previous review ignored so let's be explicit:
>>>>
>>>> NAK
>>>>
>> Hi Krzysztof,
>>
>> Make sure that i'm not ignoring anyone reviews, i sent a new set of
>> patches to start cleanly, and i have sent you an email about this.
>
>It is still v1 - the same? - while you already sent three patchsets before.

As i mentioned, this patch is sent to start cleanly, so it still v1.
And the previous patchsets should be ignored.

>
>>
>> Also, for this patch (dt-bindings), i respected your previous reviews.
>I did not check every previous comment, since this is v1, but at least
>subject did not improve which with lack of changelog and versioning
>suggests nothing else changed either.
>
>OK, if you implemented the reviews, please point me to the changelog
>listing all the changes you done from each previous version?
>
I'll make the v2 patches that should point all changes.

>Best regards,
>Krzysztof

Best regards,
Yassine OUAISSA

