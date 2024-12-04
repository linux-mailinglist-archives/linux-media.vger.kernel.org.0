Return-Path: <linux-media+bounces-22629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA06F9E3D0A
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 15:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85CCB282416
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 14:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853A920ADC2;
	Wed,  4 Dec 2024 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="iehwnb86"
X-Original-To: linux-media@vger.kernel.org
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazon11021122.outbound.protection.outlook.com [40.107.160.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E0C1FECCF;
	Wed,  4 Dec 2024 14:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.160.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733323482; cv=fail; b=HBrTAL0Zm8bil8tWrtWJ3JsG2W/poACxUVILXkPJ9yb/2+nXTPYZfpOv/Xjmfe+8mNne3LZbxs8H8SylsX8BnB07kDQLljRw3ph4hZJs10tj89HwmDXNspS3bNPDHwTPypxJeCP1IJCiKiZdfhe3Pbjje6WGdnrXYMqr6bLP8Uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733323482; c=relaxed/simple;
	bh=wcX7FUPsKO9ZaDKSYhbGnJr63EekvfFNHHLCMQ2DSAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X/mxZnkG9KMZl8AeYVtOlr0IH7zYej/1KmIn1SdU7TIArMDlPx1rqJr11JO+SA9YUwvT+88M25d6tlJgMiAPWw5xZZI5NF50ODqg7kceFjv+SPUuFTcM0/sUIXh7xAtNd8p0HBt5h0wZr5MbJ8Bclg21kua4jNN5107Lc4EanK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=iehwnb86; arc=fail smtp.client-ip=40.107.160.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlF7Vn8CO5pQsrwa9zBppBeYvgLwjaFM/BOlPlHfIykrAily4FquGEACKur+/A3ynj7gZYDmTRCPqUVnArL9zaltno/EVu818QRSZ/COKrd5APCNEIU5nw1mL/IsC94FKqoEwd+S3CQsuupqbTGSly63UVSaOGVDBx0WGBzBrKaf1shASv4XGHN8gLqDMazjtaGNk9sibKMw/nqwqK3dglyRmi/LDlz/9Rj3TNmGCP1v7ZGSISn0DXHcJ8BOtza/N2yQqVGLo+DpmKKRSqIE322iXz1PD5NEb1iFVwpcCduMujlnLGhQJGk42y9bKbi3x6eJ2Hfn7wLQ2GcY/eaEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c872q2zlt79O8wK4iNQ2xkq3Sqxn5zhCmlw9e7RPzlY=;
 b=TMzjIslmA0uvco7j7uRk+t6EdBn4yiR6h+i/VNlS8iG5/jrgsQd0vUfIi1GSEhhXFk7HEBi+mL7b0QqekAAcsF4V2xH8cjrRuB76FF2RPzs333HlQUrnt1pIxCoRg7rBn8aEA8bP37VGvGk5Ms/LVR2bwt4H24autat2N8O1T3skbIZrg0rnw2GG04Dscml9lCby4OhdHuXkNa7DZC3VF6jVoVwrBF46Cvbnc84T5W+r6lNq5HYNq7XXi7012D7TwJnX1dC5Yyrzz0o+4igU8dKe/wMZSAaoj+pieQcLE7IOo20YYmc4siDqDt0UTq7aL3n9kcsjUsa8ht+5PZzcgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c872q2zlt79O8wK4iNQ2xkq3Sqxn5zhCmlw9e7RPzlY=;
 b=iehwnb86uUfSGETFqUrcrmm+SiesWA3gIUZnSL331cTvatrcr4x1y3OBplHsVlhu1Z6/P4JekWcnMHHcQkmyVFfS4INm8J6T+e9A8mZRr99Z3e34D/Bnh0yOPK0xC1k0DxfQaQC1HGyTNDMr3M+t12R4tdafILrIX8qoeWaUNeE4gA1ebVCY3ZD4rtw+q/6FTfBMObRiIb7pz2iPA/7dUXZoQWffFASmmTnDjqvk23CXgVavu4KL0cRcZjGQvVlkZJ9RR4lyUqHxDW4Tukpe7+vEb44EcRLkdprzo2s8TqiwIyvsLAoEu/DPQgHIeI7Jj+1J5EUOI77k2gQPHLz+fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MR0P264MB4732.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:62::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 14:44:32 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f26:a361:4704:1a67]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f26:a361:4704:1a67%2]) with mapi id 15.20.8230.010; Wed, 4 Dec 2024
 14:44:32 +0000
Date: Wed, 4 Dec 2024 14:44:31 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Michal Simek <michal.simek@amd.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Gaosheng Cui <cuigaosheng1@huawei.com>, Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: allegro-dvt: Moving the current driver to
 subdirectory
Message-ID: <abshbp4blqxasxvf4ibumtfqcr7hytehmhzs2yag3nfpbcl47x@ndjg7al4iysk>
References: <20241202102654.40472-1-yassine.ouaissa@allegrodvt.com>
 <Z02SLI05JhNDtXFn@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <Z02SLI05JhNDtXFn@pengutronix.de>
X-ClientProxiedBy: MR2P264CA0190.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::29)
 To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MR0P264MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e58180-da5d-41db-4cea-08dd14722a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTZYUFEzWERNODJOYlRZUnZrYkJkeWNobU5INjlsdnppMDNnQVRnb0Vuck9p?=
 =?utf-8?B?ZGNzeDdsS3pDTXQ3VmxReERVYU9VQjYxZnRscmVMTFNtVm1XUVVWVUNiNVA4?=
 =?utf-8?B?clVuRkxpRFpad28yU2V5NFF4Wi9SMSsxdkNnNThuMkNmWVUrK2Z5N0FhYm5L?=
 =?utf-8?B?QkQzKzRPUVUwMmJ3K2I2UXhZaktBY1lwbVlKS0RibmRvaU9nMTB4SSttcE5y?=
 =?utf-8?B?ajF3U3V6SlpGbG84Tm1FeFc1MWZ1SktoMWV2Q1BuRjVicVBLNzdQNVJiaUNW?=
 =?utf-8?B?WXRaVXUyWERBajNua1U0YkN2UUUzdVlLc09ZZjM1am9pQWNJb0tEMnVOS0Za?=
 =?utf-8?B?WlVwMm82dG81dFRqTEU0OEFSZVNiUEdEbEJZYUlhZ1NXMFZHSEhGWkVFTThH?=
 =?utf-8?B?Y0M5cmVGVUpyck1UUmNXVndkOTNHZmlJYTRkZGNqajNYUHZFODROc3VBbThN?=
 =?utf-8?B?WG9KcS9tbGdMTkpOVEpvb3ZSeEJ4U2ZNc2h0Z3REQnlJY292OW81OVZnMWlB?=
 =?utf-8?B?SjN4NXh5bVZQNWltNk5yb2JpYlB2TjNrV3VxSjM1c0YyTFF5V0U1L1FaakY4?=
 =?utf-8?B?SGxWZDlrS0RmZ3djay9mNUsyenlnYXFMaTdGODVsVmRhRm9EcktmZmFlbGdR?=
 =?utf-8?B?WncxVUtFeUJaaDI4cEVVQU14alhURms4Vm1SVEVoa2xZS0VvUXJPOXpzOUFp?=
 =?utf-8?B?cUZ0bEJ6SmF5NUNzRkYwT0pDLzhIWkRDRzU3MERtYmFibGZsWkl0ZWpLR3A0?=
 =?utf-8?B?ZDJldjhZM2tRc0xwS1BPd3E3NlZnVGI3Qzg4LzVGSmdmcWhMVGNCSFVDNEsv?=
 =?utf-8?B?WXF2aU5PbkZSMjdWYnViaXFYdDVpUWxackQvWmppZXhWVkEzeDl3WlZFQ1di?=
 =?utf-8?B?ZHI5TERGU1VWMWhoU243ckpYOXYrdEFyRlZXanJGWi9CanNZdVdYS2lqQXlC?=
 =?utf-8?B?WnNrZm9lUDE0aG1TbkFwMDdiQURBbWgraGMzVkNGdEtLc0NhWXFNZnREUWxp?=
 =?utf-8?B?UFBEMldFNUxaV1J1bzBnbWw4OHZ1V3RGVkM5a1BnTVU5TmM5Sk9nSWk4bWt6?=
 =?utf-8?B?RDcyVkZELzlHOCs5YXI0TE5sbzJxcVBuUDc0V3dQTDZzTjhNazhGdmRwakYx?=
 =?utf-8?B?cGdobmN1NVVUbCtRL01hRnc0cjRFY0FDWXY5Ym9tOHZqUU1qV3ZadTBpT3JZ?=
 =?utf-8?B?TmI4aDBqMUxzdzFwUnVjQXJLYUZ4Mnl3REE1WnV1OGo3YnlBd3BCa2tKeGJx?=
 =?utf-8?B?aWl1T2FYTEtqdy9YVVBOYi8ybHZtbzhaYXRyelNDMzhNcUdZVzZMdmdnZUdM?=
 =?utf-8?B?R0IybHY0MEowN2NabXNtTFdpeW5tMkpIcnA5RFRCNFlKTXNtRmpPdU8rZFFq?=
 =?utf-8?B?dVNPL1B5YkdXdi9tbzJIa3NIVVlQZnVtajVDM0t0dm1NM2pBaVdvRG5PS0I2?=
 =?utf-8?B?M2RkZ01Qbm9aM0ZUZVVuUW9ralNDSXVSMUNXRHRqUlVvNTVqT2UyYUQ1Mjht?=
 =?utf-8?B?THFYcXN5MVVvbkxST2lGYlQzQzRmYVRNSlErbjRUaEpaejQrTk9iNUdpblRB?=
 =?utf-8?B?VGc0cUlCL0ExR1RUQ3lsMGlPN2pUM1A1RU8xdGRkYzhOUEVmcmlHcVhHeTVX?=
 =?utf-8?B?bWhaakZmL2JyTkY4cmVsZytJOXFweEN0YmlhbC9TU3VsOXp1dnpldkZqcHBI?=
 =?utf-8?B?YUlIQlBIUXUxem1TLzkyUzJLQUJYTlpuNGw0bThxYi80UGRDMFVIcEczcVVh?=
 =?utf-8?B?TEt1dFNvV0VueHFJTTA4T0wxSW5PeXFIa3A1YTdRSFFEZU52dlVPdk1rWHJT?=
 =?utf-8?B?cWdDRGZMM0trL3hYUFlKQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkxDb1d0S3JMMTlMV1B0TFRrWTJZMHQzaDRqWEJnMjhwR2xvUnptWWNpOGJJ?=
 =?utf-8?B?NGZoWGlNQlhqVVYvOHoyZXlPQ0NjcGI5R1lXcGFkRlVrbGtwVnc3QXJ0bWVy?=
 =?utf-8?B?eGVSbUM2OUJ0RlZVdnZZdXFRZWdZaTU0N2kvZmhQN1pDZEFWMjlDS2p5TUxJ?=
 =?utf-8?B?OXE5ekIvMHNTREhENVQ2Sm9sbDAzMlZDKzhMRTFaYndoSk1nNVdmejJCUVpP?=
 =?utf-8?B?dzQyRWtpakRpbjR4eXJzWHlXTW54REZaNlFwY2ZjcVorQi9KUzBhM0lPcmpy?=
 =?utf-8?B?RVFsczJVRkdXalFWWjE4bUVVYnQ5RC9Xb0dWSG9ZeURybXY0bHFSUVI0bENB?=
 =?utf-8?B?WEQ4VFo5TW1SV1V4M09RZlZtbWllbVhyejBrRmNqQjFYRkdwb2pVZGJBOWVk?=
 =?utf-8?B?dTJ1a3RRQit6VDN1SVpyb0ZUY05HVE9DeGprSjhQWUJWNDY0UjZ3aUNBaGFk?=
 =?utf-8?B?NE4zTHM2bUx1QzFqNnFQbWt0ajVZR3R4MUJIZ01za1dNbUlNR1FtYmZ1N2J1?=
 =?utf-8?B?SjlQeUo4K205VnByYjJabDNkcm0yZHZOaHhGK2tqYWN4dUY5Y0huWnF6SW1H?=
 =?utf-8?B?enFMZ3k5OU9UeXJMeGJ1aGJZY1F3di82L3c0dVZxZXJZZlVaanVBMzUvdEtw?=
 =?utf-8?B?cUFyTHFoSDRLa0NtdDYxTllEeGZWWElQWmQvakx6WWFpRjNsSEMvRkhtNGta?=
 =?utf-8?B?eUVjWjk3QnhoMXZ3OHpwbHQvbThUMEhiQWhDcGwvOGl5WUdHQVZyeXo1bjVw?=
 =?utf-8?B?WHYwTjc4TG5WYUw3STZlRi94ckZ3M3hJd1lMeU5USzAyM1RLVHhJWm9LOHV0?=
 =?utf-8?B?MCt2cmhJbUpmSTdTL1VIZUtlcnh0dExvM0RBMk5KZ3pMTnJVOGQrc3M0T0tN?=
 =?utf-8?B?YXVEa0d2amtmRFYzNUp3MjJzQTVpdUNGMzAwQTlsTXZCYnJDWGcva1NzS3JK?=
 =?utf-8?B?Skt5THhqSTRJQm5ZYkNSN2lvMHlpS2R0SmtWUXFPRGlwNFdPejhxaldVQlJZ?=
 =?utf-8?B?eTEyb1g0MWh2ZStTTWZ0cDBIa0o5UDhGalFzdWpBcU16eWNCQXpISndzeHd0?=
 =?utf-8?B?UUtUb1h5QTZYakgycDdTL0ZhS1ZSMnJTWEpUQ2F1NENpclZJS1FpYTJmZmxV?=
 =?utf-8?B?N1dwZ3ozenl1REZQR3gwK3krM1EzL1FFTGhXaXFlcytOY29OVmE4ZFoxTWRG?=
 =?utf-8?B?NXVHcWtrVDhvdzhZZytTUHNRdFFkMXRNYTM1cmVSN3JoNTlJdEZqS3kvWG1M?=
 =?utf-8?B?MzQwcEtPcjFHbnlia3NGcERGd1NicGlUYS91aHV6WnZxUGtUb2pRalNIWHc2?=
 =?utf-8?B?MEFoc0tpeWFwOWpoeEljYkRVWmlSS2UxRTZuNlNQYWFvUkRuUmFWT2RvSzRF?=
 =?utf-8?B?NzlQSTYvRWtnOWE2TXV1STg3d25aS0VIQk54RFFpSTUrRTljQmUva3I0a2ov?=
 =?utf-8?B?R3JwMjV5WkhrNUZLSE8xd3lJUVZOcURTVWtSbXZ6c200RWJsaGE2WUxiVlhY?=
 =?utf-8?B?MjdCQTZhY1VMeEdnci90azNIR2JERHJXR1dRdW9jY3B6MUk4amtQZ2JVZnpw?=
 =?utf-8?B?TTJabWFneGRMM24zL3BMVU84K0VTNWFDTklTT0hZUUY0RjlSS0NTMjZuS2xV?=
 =?utf-8?B?Z3BUUUVGYzk0WjE2eXJheEtHOGhKb2ZpMExOZ3J4MkltYU1YaUVKOVZqUUlt?=
 =?utf-8?B?Ry9HV3UrMDhnKzgzNjB6S3JnVWlVdEtld3FST25jWTJxbTNjV05WYVV3dVNj?=
 =?utf-8?B?WTA1bjd5RUQ1U1l1dGJvRlZ2MzQ5MDJBMHI4ajBDajZZYWl1SjZOL1dCYzJz?=
 =?utf-8?B?bHJld2pXNml5M1hYSXJjam1EamMwM2dlZUFTQTdvcVo4UEk5OTR6Z0JrMUN2?=
 =?utf-8?B?UGllSVpLMEU0S0d6TWFiZ3pDTkJ6VzJOc0pIUTdqSzNJZE4reUYyRlhBUk5W?=
 =?utf-8?B?cGtBa1lsRmVmRzN2dHpuK253aGpyVllCdVZ3NmdvSFZHYjZYSXhuNzhIdVdK?=
 =?utf-8?B?elR0S2xqZkxVVy9LUFFPWmdTV090R3ljejNrNDR4ZTM2NTlQSnBDUndjeEF2?=
 =?utf-8?B?UXZjWlB1UzlRcVRxUStRUGs2aHZaZDZSdlZxWm8xM1ZONTA0Wk9ncjZCSmNC?=
 =?utf-8?B?L01SS05iL2NaUnlZOHhna29mYnZxUGFNOUdrUWNSUkhHOGhBQXowQ0xnMXVv?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e58180-da5d-41db-4cea-08dd14722a4f
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 14:44:32.7230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VP4D8cei1YHko25r3fELE4+olxA9g9mA0fAI1O2vtLH3BDM5+om7HwZR4nUs/lUyS43CPWLFOhuBtvzm5am+FGR/YZbNIW5RFZqb/1KPcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB4732

Hi Michael,

Thank you for the feedback.

On 02.12.2024 11:55, Michael Tretter wrote:
>Hi Yassine,
>
>On Mon, 02 Dec 2024 11:26:38 +0100, Yassine Ouaissa wrote:
>What kind of conflicts do you encounter or expect? It's kind of
>surprising that your driver would conflict with anything in the existing
>driver.

The current "NOT allegro" driver support only the ZynqMP (ex : ZCU106/ZCU104 ).
And the upcoming driver, has support for many platforms.

>I'd like to see how you plan to integrate your driver, what it looks
>like and what conflicts with the existing driver actually occur. Without
>that information I don't see the point in moving the driver to a
>sub-directory.

The upcoming driver is not using the parsing, conversion inside of the
driver. Actually the new Gen of ALLEGRO IP does that.
>
>Michael
>
>>
>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> ---
>>  MAINTAINERS                                               | 2 +-
>>  drivers/media/platform/allegro-dvt/Kconfig                | 4 ++--
>>  drivers/media/platform/allegro-dvt/Makefile               | 8 ++------
>>  drivers/media/platform/allegro-dvt/zynqmp/Makefile        | 6 ++++++
>>  .../media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c    | 0
>>  .../media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h    | 0
>>  .../media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c    | 0
>>  .../media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h    | 0
>>  .../media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c    | 0
>>  .../media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h    | 0
>>  .../{allegro-core.c => zynqmp/zynqmp-allegro-core.c}      | 2 +-
>>  .../{allegro-mail.c => zynqmp/zynqmp-allegro-mail.c}      | 2 +-
>>  .../{allegro-mail.h => zynqmp/zynqmp-allegro-mail.h}      | 0
>>  13 files changed, 13 insertions(+), 11 deletions(-)
>>  create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
>>  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c (100%)
>>  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h (100%)
>>  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c (100%)
>>  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h (100%)
>>  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c (100%)
>>  rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h (100%)
>>  rename drivers/media/platform/allegro-dvt/{allegro-core.c => zynqmp/zynqmp-allegro-core.c} (99%)
>>  rename drivers/media/platform/allegro-dvt/{allegro-mail.c => zynqmp/zynqmp-allegro-mail.c} (99%)
>>  rename drivers/media/platform/allegro-dvt/{allegro-mail.h => zynqmp/zynqmp-allegro-mail.h} (100%)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7292e4a1ddb8..d79efe6f8992 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -795,7 +795,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>>  L:	linux-media@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
>> -F:	drivers/media/platform/allegro-dvt/
>> +F:	drivers/media/platform/allegro-dvt/zynqmp
>>
>>  ALLIED VISION ALVIUM CAMERA DRIVER
>>  M:	Tommaso Merciai <tomm.merciai@gmail.com>
>> diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
>> index 2182e1277568..9bc7e99788b8 100644
>> --- a/drivers/media/platform/allegro-dvt/Kconfig
>> +++ b/drivers/media/platform/allegro-dvt/Kconfig
>> @@ -2,8 +2,8 @@
>>
>>  comment "Allegro DVT media platform drivers"
>>
>> -config VIDEO_ALLEGRO_DVT
>> -	tristate "Allegro DVT Video IP Core"
>> +config VIDEO_ZYNQMP_ALLEGRO_DVT
>> +	tristate "Allegro DVT Video IP Core for ZynqMP"
>>  	depends on V4L_MEM2MEM_DRIVERS
>>  	depends on VIDEO_DEV
>>  	depends on ARCH_ZYNQMP || COMPILE_TEST
>> diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
>> index 66108a303774..04727c5f7ef4 100644
>> --- a/drivers/media/platform/allegro-dvt/Makefile
>> +++ b/drivers/media/platform/allegro-dvt/Makefile
>> @@ -1,6 +1,2 @@
>> -# SPDX-License-Identifier: GPL-2.0
>> -
>> -allegro-objs := allegro-core.o allegro-mail.o
>> -allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
>> -
>> -obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +obj-y += zynqmp/
>> diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
>> new file mode 100644
>> index 000000000000..a8ddb9cf93a8
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
>> @@ -0,0 +1,6 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +zynqmp-allegro-objs := zynqmp-allegro-core.o zynqmp-allegro-mail.o
>> +zynqmp-allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
>> +
>> +obj-$(CONFIG_VIDEO_ZYNQMP_ALLEGRO_DVT) += zynqmp-allegro.o
>> diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
>> similarity index 100%
>> rename from drivers/media/platform/allegro-dvt/nal-h264.c
>> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
>> diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
>> similarity index 100%
>> rename from drivers/media/platform/allegro-dvt/nal-h264.h
>> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
>> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
>> similarity index 100%
>> rename from drivers/media/platform/allegro-dvt/nal-hevc.c
>> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
>> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
>> similarity index 100%
>> rename from drivers/media/platform/allegro-dvt/nal-hevc.h
>> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
>> diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
>> similarity index 100%
>> rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
>> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
>> diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
>> similarity index 100%
>> rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
>> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
>> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
>> similarity index 99%
>> rename from drivers/media/platform/allegro-dvt/allegro-core.c
>> rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
>> index e491399afcc9..8895d7755987 100644
>> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
>> +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
>> @@ -31,7 +31,7 @@
>>  #include <media/videobuf2-dma-contig.h>
>>  #include <media/videobuf2-v4l2.h>
>>
>> -#include "allegro-mail.h"
>> +#include "zynqmp-allegro-mail.h"
>>  #include "nal-h264.h"
>>  #include "nal-hevc.h"
>>
>> diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
>> similarity index 99%
>> rename from drivers/media/platform/allegro-dvt/allegro-mail.c
>> rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
>> index aadc947a77ae..88a98f9e5d00 100644
>> --- a/drivers/media/platform/allegro-dvt/allegro-mail.c
>> +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
>> @@ -12,7 +12,7 @@
>>  #include <linux/string.h>
>>  #include <linux/videodev2.h>
>>
>> -#include "allegro-mail.h"
>> +#include "zynqmp-allegro-mail.h"
>>
>>  const char *msg_type_name(enum mcu_msg_type type)
>>  {
>> diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h
>> similarity index 100%
>> rename from drivers/media/platform/allegro-dvt/allegro-mail.h
>> rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h
>> --
>> 2.30.2
>>
>>
>
>-- 
>Pengutronix e.K.                           | Michael Tretter             |
>Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
>31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

