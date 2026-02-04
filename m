Return-Path: <linux-media+bounces-52159-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA6LKayigmlpXAMAu9opvQ
	(envelope-from <linux-media+bounces-52159-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:36:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C69EE0791
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BD43304B4F2
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 01:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CBE27FB18;
	Wed,  4 Feb 2026 01:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="igbVXPuI"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4207322126C;
	Wed,  4 Feb 2026 01:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770168981; cv=fail; b=pN50V7Tfx4PXzfj0GOzc4aa4pawOJ/NVs2zylN78TZKwi48uZbJ9usUTx2krTwtSck/KpNlhbTCEwbd1945/AgA/DgrHBxr+zSWeP3iD22//8WA48+0EuMx4hxAzUcz/NIQltSI14f4+YE+0BglfnNsyUxfnQBWsiSJfbeea/xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770168981; c=relaxed/simple;
	bh=0Fg2QtaSVymgHkvQAYCaiHTU0guuN+Wqjei1yOdr9lQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wr27EpmmxR55hz3Gx9vA21cqQN6rdz/+80Ykrf0WLGQlfpwyY+FAbT38bh+QqhwWfYg5v7rv80AZX1yZZIrUoLjIBUCLfmiCjdSmlIe5GOnLHoKqboK2ZQdCYlCtym1zrXNvUXVV4zF0jPTXNnOePUrR5heD1ZXH2MWbLc6WWek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=igbVXPuI; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g89iE1lK7ZK8MipclWKhdnIrKaSeddIWwp5BEjFea68uXm0Om5XjlU1vxqbLpke6PcF5hCNjY5DyXab74GuMrTdIf+19ZFFjD2Bpp8nylIZQTI4miTTjLLQoUwKXbkhKHMSWEazcY22xYn4/FdM3hgXwToukSFnRjjJAlrz8udyobez7wRjLyaGL7MFwcf7VlQIHuAJeF7aWmYJG03WrRAvWytDnzGxq2QR6lyYhx0kBKuiBDEzk2Xv66fjhmvG8JK20+JXsvjebd9AV4Aj32WCv4D8gVpKk7LFuX/nj5vS3VaB/o4ZM5XGnj/X/I85++0pq01aZDrBvsa9XhAy77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdamR9BfOVCKiajvmKSqLX/Z0fXBZdyI2KP7bSVMqsg=;
 b=bspTVgs4dsOc98GlE8GCfQtPwxv2tbJdLiO3sjjJgwp798TSb3ETw90WwoegkEFi0AgBSJsGxnESHRQpEC9CThj4fX8jQdLa4qmGrnTYDmpGS3+4bNGg5z4cVkj+3n9EsnSKOUGcpS9Zf0wvEqLSuu2x9d0AXs9HrxKLOzKIwlGzeLAkaT3ri82P+QnGwfmFCAZpzkNsdZf3FifNGlgg9mlLizyVoH1/DE5Vv6nC+KwhJgg5fNWCQPgdXmQz75aPFLKMo8udR6uqxyZ57dxlD2in+o6xQWeqxYns0xFTEMkGQNTYe1/2d1OcYTmGi3RLMknlUqaJtGDB8e3Dc1PqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdamR9BfOVCKiajvmKSqLX/Z0fXBZdyI2KP7bSVMqsg=;
 b=igbVXPuILDkbqCEn370G7Lg2281HvzPjVrrkMfkCznjGRiPp6L92AiX0BqdIsm9jKBl7UwZgYeMUue0PEjQME/r9Phbxnhk7tQTqSgv1IAUTCLSe4IOeNmQTiu4f3OCQ1TrNkxvKfAl5Vo3AbKwdx5ijZD1P2kHdgxDDY9FmZLs1BskTEYvcBFLoipmXDefHzAl6b6FBzijbeU3vmrsZIUE4prFr8oNyz9DUSHrTl+9NFGBokaPTHZiiauOmKXZOu38D07mkRuzlwid9IdysZcBFwzmynWmyMhCqx8ah5Dz7owadtXrXjUqXi3+e8LKtjqHAuIMvM5MDDJPkIk9rCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB7651.eurprd04.prod.outlook.com (2603:10a6:20b:280::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 01:36:15 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b%4]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 01:36:15 +0000
Message-ID: <0f2cc5d0-9abe-47c6-abdc-42ebe5fb5b35@oss.nxp.com>
Date: Wed, 4 Feb 2026 09:36:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: imx-jpeg: Use devm_pm_runtime_enable()
 helper
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 nicolas@ndufresne.ca, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, linux-imx@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260203082349.1082-1-ming.qian@oss.nxp.com>
 <20260203082349.1082-3-ming.qian@oss.nxp.com>
 <aYIopWM4U9YQB2SF@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <aYIopWM4U9YQB2SF@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM9PR04MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa0cb31-3cd5-47c9-4f4b-08de638dc90c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yld0NEt4MVJjNmduaDNzejczZ1RLTHhYVFJhcXgwakFmZGVrRGdKWEJZZ1JF?=
 =?utf-8?B?U0o4YmtiWmVvTjZ6L1BmTmQ0OWl4RFgwL1J0SWpEZkN4L1VhQ3VPSldUK1lR?=
 =?utf-8?B?YVJxNm5YQm1IbHBGcCtNY3RSTnZZOGJHa1ZIQ3BsRVhtUHgrTHFXL01pSmU5?=
 =?utf-8?B?bWJVK1UvY0VtYi9PMzNkSTBpNFhaWWF1ckVJcWlLQU1TdnBLUHZZUFlVVnNG?=
 =?utf-8?B?ZHRRbkhZYWUxUyt6VEt4NDQ3MWVmWjVaYkg5eDcxNFh0c1JGN1VUblBDamV0?=
 =?utf-8?B?UVJVL1ZsRG5laUc3cXlZZVpQZ3daTWgrSEI4bG9jU0Rha1ZmdGcxdEFVeGY0?=
 =?utf-8?B?YW1ZYm1IUS9EVEJZOHdZdHlUZ1lpeDViejJRVFlER2hISi9RKzRwVFE2cGNp?=
 =?utf-8?B?bUVSMTlqU0FPT0tTNGV4ZnhETDNZQmE5QXdaUFQxeENyMEg5RWhUOFR0NjFJ?=
 =?utf-8?B?bjNWTUFCa3VidE9UQXNnWGgzNm15QWw0dWpMZFB0SUp3d2hVSzd4ai94dG83?=
 =?utf-8?B?MUFQdXU3bVFsTFJXYk9ERkdvakYrcHZPV3hHdGNaYXBlNXRnajBsY0NWVXJ0?=
 =?utf-8?B?VmxXUkJwYVZGU2R3NzFCRmU5akhlRzhBR1lzWjdkTzh6cVRhVDlRQ2pLS0xj?=
 =?utf-8?B?K1VsblVwZWNVMGFEQUJETGRTbGREMU9CR1Q3Z2thZytoYUNxc3FkNWpjMDBD?=
 =?utf-8?B?MExjZEwxQ0x6a1MvVXFjZm5FVWt1U21kM2wyWFhXMkFGUE41NGNOY2duMERB?=
 =?utf-8?B?LzVOSlRGUjAxcU54aU91MjNhRzg0ZXBHLytaOHlicDVSdnpMbXhhaWtzRjBX?=
 =?utf-8?B?MklYai9MQmdid3pURjdBcVhBaHVWS09VQjVHU0tHTWV4cGZEYlBVMFJUWWtF?=
 =?utf-8?B?TU9hSG5yS3ExdWQ3SW5FK1RnOWJrak5MOVgzRy85MGQ4SS9tYUkvZGpNZFQr?=
 =?utf-8?B?ZXgrUUNJQWhQU3RxOGI3Ymg1UzVNNG5mc2g2MFFGMERFbkpaY1hmVnFGTlhl?=
 =?utf-8?B?VzRSS1dCN3VaY29oK1UxVmJRQ0FQajNscUlidTVKdXhYUWdndWdWbjkvM1A4?=
 =?utf-8?B?cXBtVWx6RE5hc0tjTUVPNlg2OEpxbFJxN1NZVytCMWxYZXdRTldSM1ljeEoz?=
 =?utf-8?B?cnVySnh6amlDbXd2Ymc4dFRaNWJVWTMvWHF2QzIwVGdnN1pLdUd1L005cnMw?=
 =?utf-8?B?dnJVN1VDOFNMdG9QMXdBakU1RWYyQ2EwSXN3SWw3UGpxZnY0TDI4WVpYM2cx?=
 =?utf-8?B?WTZYemZ6a001bDNIM1E5WUVjZUtWTFMzempab2FxTExFQXRzQWZBWkpkd2g5?=
 =?utf-8?B?S3VDY0ZwdFBkWHlYTVpUOUE4TTY0SnRldTFJYkZ4R0UrSFBkZklCWllwQito?=
 =?utf-8?B?UzlKWmMvTXJHQ3BDaURibXpTdkVaYk5UZU9BcWtESmpCZ1JTYVhyZWVHZ21y?=
 =?utf-8?B?bXpWdHZhWnQ0RGlJMnpmcjh3dHlKclFIVVhIQm1kWFo4REE2MDlBNWY2NG14?=
 =?utf-8?B?T04rQU5YdEZVNG9FcW1jMVNMV211TjBxOG5STWpiT1hRVWMxTW0zRG1yOWp6?=
 =?utf-8?B?d3hoam5kckdpSlBNNFpCOGZaUDNIbFVBclJNQzhtdGpGU1VwMjNDMzQyV3Uw?=
 =?utf-8?B?ekJVRXFtZE5iaFZhcFd0bGYxK1h4RlpLOUJ5Z2kyZkFMRldHWGs1aktHZnQ2?=
 =?utf-8?B?andUbFZFdXhoak8xUHFlSWFFQ1lIem5NWmE0REpaVmZRNURvdElZc0M0QVZD?=
 =?utf-8?B?R05SeitOTEM3T0ZreGdsZ3pTenhrVGVVOTZWU2wrczlrMWp3Z3M2WXlCRnNS?=
 =?utf-8?B?VlM1UU5VdGw3VHRtNkNwMTBIem1ZVjNpbVJFdTBZZHNGdEx3WExXb3U5R2hn?=
 =?utf-8?B?dFNwWFVrdWt5Q3A3SS83SGFhenhsK0taZ2l0SVZXTUg1TjJUY0RkY0NIekNE?=
 =?utf-8?B?UTArdnNOLytRUUd5VmJUMUdTSENuOHVVWGh5Q2tqNzN2eXRNeFpGY3hpM2pz?=
 =?utf-8?B?SFFMUUN0Ry9taEZNZDVWRkdQSENlT1Z4akMybURIcTg0bno2MzBwZ0dUb0w5?=
 =?utf-8?B?aENKR0p5NHVOOTFWQ0FqMUk4L0Z0SWFwc2Nya3F6NXJxTEVIUmRVN2Ezblph?=
 =?utf-8?Q?Z6eU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjVaRFgyVTlLZmptTlg3Sk55T3RHU1hRdlZ1Q1VDQjBoWVhWSGNUK1h6c3kx?=
 =?utf-8?B?c0x5OGhOdlNCSnFhWVlLR1Q2T0k4Rm9WUEF1T1dWSFFlTThPVjlabC85UEUx?=
 =?utf-8?B?VGxFZG5qMFVHcjhCY0locUZGOWNKN1Z2bk1uZW90M0pMaUNhVzJZN203V2g1?=
 =?utf-8?B?aDRWWTFDUExnOVl1STExM2ljTmtYUDd4ZlZLMmhmWHVGMW5lNHRQNE9LdkdQ?=
 =?utf-8?B?U20yWFdNaTE3b1pUa2E1b3NCSStDOFdkNkZCVlVHTDNxTFlSRUI4UnkycmZp?=
 =?utf-8?B?Tnp0RTh6S1NzS0daREZQN1hoalo4WU9oYWhBcG9EQ0tEcEp5WmlHZG5EaURY?=
 =?utf-8?B?dXVIQmVoYWl3U0pKazFYOHdVNTdlNE13a091KzVNdXhkbXFtckNob29lNmFr?=
 =?utf-8?B?ejZieWNwVHV5dEN3MlE1NWxydTB1V1lNZWc0L0dHcGZUK3lNVFN0aEwwYU1x?=
 =?utf-8?B?bGhKTzI3M1dUWVNLUG1TS2V6b1c5c2gwOVJnMWhFQ3dCbWlpVXJEbXdxQ3Jw?=
 =?utf-8?B?Z3owOWFrSW9wRUlRVEkrcjJnZEJqRGdweTltZGtKZE5IVkpJWkNEQSt5SkJD?=
 =?utf-8?B?YzRaVGdTbEViOVQ4L3YrbkVYUnNqM0dQZmxsUS9TTGQwT3d5NFRvdkg2VS9i?=
 =?utf-8?B?aGFzcm5OOENuSzlwYlZnakNQWDRuOG9haHMrdk1maERCQkJxT0p6anpzZHpt?=
 =?utf-8?B?Ymo4T1pWSnMwOEFhNGthdzdqQzBzZDJ5ekFKTTMrdG9pcmJXUnRLUWJxUm85?=
 =?utf-8?B?OTlYTGlNbXJLdkFKQjgxODhzckRQMXpGa05sdDZYNmVmZVlydGU4czJ3S0RZ?=
 =?utf-8?B?LzBXYXdTNEdGVFJqdDNORUdJc3EzWGhzTzZYdmQ2cER0Yld3Qm5yTStIN2d4?=
 =?utf-8?B?ZUYzUUxqS01RVlhRa1p0TjhRRmRFR0ltdmlzQkZjdjZWK0lxOGJQSXVNc0My?=
 =?utf-8?B?bEVnaVI3eHJsNG9DNkFQbG9WRjFNd3dDdXg3dnR2Q1R3Tk1jVERMM0FVMUZn?=
 =?utf-8?B?WE1kTWhDcW9NS0FsREhGcmNiYkYwUEtlWEY2OUM5bTNtcDVxMmdiejY0Nyt6?=
 =?utf-8?B?MlMyMTQvU3d6SFpyOFlBaWE5YmFONG5NeWpiVHVPeXRPcHF5emlrcHY1eFZK?=
 =?utf-8?B?SzVPZ3hFenlDWFFtQ2ZmSExvVzVkMzZaMXlGclhEQ0EwWUh4Q2RWYjdSUnY0?=
 =?utf-8?B?dVNoNHcxa2FrQ2RwOWNaT2U0LzRiN1VOV2xGK0dZeCtGUmdOT1RUSDN0Rngr?=
 =?utf-8?B?aHRjWWJERGxZbG1lTVFOQmh1TkNjYVgxRHphWWJKckNxdE53ZFlDQ3MwUnJO?=
 =?utf-8?B?QzQwc3VQU0NXaVFvUklUS29FeHdnUDVYeDV4NEh5dmtzOEpzMjlCS1FYcWJs?=
 =?utf-8?B?ZnV4bzJ6NmsyMzJUcGJRSEp4Z0RHU2h1ODlCV09RSm54UEtweWJlTEFGcFA0?=
 =?utf-8?B?K2hsSDFJVmptWmdSUVRuWlhQWXQ5dEwxK3J4Tyt3V3BPU2NKUzZkalc4RzVv?=
 =?utf-8?B?Lzd4d3JsWTFnV3JpbXVYRE1lQTduTG9aU3VpVW9qUUNIcjRITnYzOGtsYndi?=
 =?utf-8?B?dmpxTTU2bU1hdm5VS2piSGVLWjUvL3JkUHpmODZWR05KZ2JrY1RTVHp2VXgv?=
 =?utf-8?B?S00zejN3TEV2b0NxM1U3NWtNQVdzemFrY250dmlwK24rbmQrMGJBSUZLUGdP?=
 =?utf-8?B?RVNBekwvRHNIdFkwRlhPKzZxOFZ5YXZqbk9tT2RiLzd6MGVnUFJ1S2xjVHYy?=
 =?utf-8?B?WEg4akZOSEZkb2hXenY5OGkvY3ZYZFA3TWdKcVA4YXQrWDFMNGlpYjljOFpq?=
 =?utf-8?B?MzY4WWhENXdnM1NSY0pSaUlWdzN0MUo2R01GeVRxM29rYWM3bFlndU5jemRh?=
 =?utf-8?B?MzRnL04zUmlMTEVlVklHSVNPb1Qxa1JGYnRSRDhFQmZHb1dzaU1aL28rcW9q?=
 =?utf-8?B?b29FZkhwSlFzcUhTKzNWbVMvY2ZBa09NVlh5MnNrdnNOSzVlMXRzTW9XZ2Nu?=
 =?utf-8?B?T3ptcmlWNUl4T3AyQjFuY1U1QXVUNWJ4TG5RZU9mbFZDSnRCZ3ZqWkYvVzZ5?=
 =?utf-8?B?QmxaUzJxRzY1RSt2cWJib29abS9xZmJ5RXloTHE5NlVBVFY4S21LWmFVYUVw?=
 =?utf-8?B?ZFQ5MnhZQURROFUzaXc2V2RuNVBmWnJXdFFzVjRUTFltczYyY3VTODRKUU9t?=
 =?utf-8?B?WHZFZGw4YmJZMGh5VnNQdkpiUlNCd3preHZjV1c4THo1Mlp5Z0dOdEFCSCta?=
 =?utf-8?B?QmhFK2cvWVNFelQ2WCtQMS9nMlFCWDhCQ2c5N2NGREIzN2k5dUFGajJLa0Zo?=
 =?utf-8?B?clNQUEN0a1hiQURnem9NclZmQzdhT2V1eHdZTHAzTDhKZlZtOXI4Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa0cb31-3cd5-47c9-4f4b-08de638dc90c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 01:36:15.3436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Smr8CoG6+zFxPn9rRP3X7cGM292oIf2IuHsMy+G+UWT65b2eUaIqs0+Y5QQB12ZqPPlu2X95dkkIpQu1DUhc6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7651
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52159-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 0C69EE0791
X-Rspamd-Action: no action

Hi Frank,

On 2/4/2026 12:56 AM, Frank Li wrote:
> On Tue, Feb 03, 2026 at 04:23:39PM +0800, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> Use devm_pm_runtime_enable() to simplify probe and exit paths.
>>
>> No functional change.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 15 ++++++++++++---
>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index 39022c1bf36d..877e6c4f7406 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -2971,12 +2971,22 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>>   			  jpeg->dec_vdev->minor);
>>
>>   	platform_set_drvdata(pdev, jpeg);
>> -	pm_runtime_enable(dev);
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable runtime PM: %d\n", ret);
>> +		goto err_pm;
>> +	}
>>
>>   	return 0;
>>
>> +err_pm:
>> +	video_unregister_device(jpeg->dec_vdev);
>> +	/* set NULL to prevent double-free */
>> +	jpeg->dec_vdev = NULL;
> 
> code have not simplied, you add addtional goto label. You can use
> devm_add_action_or_reset().
> 
> Frank
> 

I don't quite understand the difference compared to directly using
devm_pm_runtime_enable.

int devm_pm_runtime_enable(struct device *dev)
{
	pm_runtime_enable(dev);

	return devm_add_action_or_reset(dev, pm_runtime_disable_action, dev);
}

We still need to check the return value of devm_add_action_or_reset and
perform the corresponding error handling.
We may still add the goto label.

Regards,
Ming

>>   err_vdev_register:
>> -	video_device_release(jpeg->dec_vdev);
>> +	/* Only release if allocation succeeded but registration failed */
>> +	if (jpeg->dec_vdev)
>> +		video_device_release(jpeg->dec_vdev);
>>
>>   err_vdev_alloc:
>>   	v4l2_m2m_release(jpeg->m2m_dev);
>> @@ -3047,7 +3057,6 @@ static void mxc_jpeg_remove(struct platform_device *pdev)
>>
>>   	mxc_jpeg_free_slot_data(jpeg);
>>
>> -	pm_runtime_disable(&pdev->dev);
>>   	video_unregister_device(jpeg->dec_vdev);
>>   	v4l2_m2m_release(jpeg->m2m_dev);
>>   	v4l2_device_unregister(&jpeg->v4l2_dev);
>> --
>> 2.52.0
>>

