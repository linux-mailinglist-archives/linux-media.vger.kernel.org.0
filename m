Return-Path: <linux-media+bounces-38359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D636B10699
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 11:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA6A717065E
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 09:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B4C24728E;
	Thu, 24 Jul 2025 09:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fGWDXkZ+"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C45246BDE;
	Thu, 24 Jul 2025 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349633; cv=fail; b=EZKPWp8ivsjgB7mS7bnY57/X6iAsYIX1cwuEIdE8YHAAsgwfIrgFi5vwDVVLqLg/ESBpVts5k5eWkM7DrVr9+a68JW0C37D/Rf63021yeMBDn9gdT1buMmTCiI1ZbSfJuJPUoZHAOaDJTQ2xZmt3yN2mMMrP0Jqj4+L/qypsqOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349633; c=relaxed/simple;
	bh=55u/KiOiH50dYXUUINX1ZsTa8oaPhcZx4QCV1H/QO2I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W8kByG35UScy6eaUvPxZr2IKgzMebkZm6aLdJJveLrZzym0r7gUekpzuTwreQ3RbQN4Gq+7NI5eMxppGB5gp7pCSZq+Zn1lo+QEU+9qaC5ylm65BDWov8PWgKpAhaGOxwwDOj4Bj4OkcHnX9Q0WZXwPsZECjNVsbxiv9ZIAPZSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fGWDXkZ+; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nC50BYoGuWZ8kXUNPuux8enK3FmHGKJOogGm6W/k/LOMUZdSXUPhLaXl+lu5lbDxlZD5Q1HumqOM87XesLC4/tgSrjDvwxow+9e2u51qfNqnuYq1uTTgwt6FTfwuwHbiUGEVBFyX6wx0OVLusr2eb+Vc4d+tP2XWyfa862APVftTSnYhttL57uxdGnhMVPuRWo26aT/9cyHnD8JsCtOYllXtvCey4cOm4/LxP6vUZTVm/9XOZds8OiQ9oEBAL3sdLnDjn43JU1rk/A6Mz73gkacVz3heOBNi0/S/H84bP2KJ1hO47DrB0WqZZkls2WyR637YbtGeZ8Xf5BgZE7tZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ta0b3v7BtaKTlJ/iQv8RpPsD16dHuYnK3x+WnUbmoXA=;
 b=G+gmsaL5hSQv6n8ouyNFoxBGvPxwzX6TUUeWVIqcuUvvEx95PnQ7SOQVCAYuH8q3mUW9GrxAuQAPi0T+RHsNr8zRNqtWQ1zFudNvH/MbXHG9AA7gInbmPAdmlPA7p/3gkrp7emRv7+mrLjBuDz9VAE/sDWwfzJYK7wtBcPGVJzOaddSUVUdrCaW/fwcnz9dIPHShS/CNTCGsovx4CB+SFrK8njkIdO5H8F72lN0sHNmDLOBISMh3C664+7QNeiwdbv1mwNdkjgCjKRRfxANVpNNaj7UYIWAgQkOBW6peNl0RyIc0Ku+kh7+STvFB0R4u0ocopsFaEhErYLLEFuPDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ta0b3v7BtaKTlJ/iQv8RpPsD16dHuYnK3x+WnUbmoXA=;
 b=fGWDXkZ+lrHuaxvpD/F1RJOcRVGYe/BcKevYHq3V5/rPWR40Dh9FtZvQPUZbUxQdLnTcyCB6i7NmO9W+ydL1z7uw2pu/cmwve3RL7Ce6Cqq6z5Phlm0H5/rN0i6FyIwy0Q4wZAaHeK2LRaZM/vu/HqXc2ir+XpE8ouzmq6FkV6HHN7VwHawR3Skzt4MBoTd95BKGlplLHAlrquCbIomR1in1TE70Co/xxVa9wz9YJkiGfiCx4t7lW9rwIce3fj5PMd7ciwSZlFsHGIjAFRKrZxheItRw3OaU3yMKJMw3NeXPgdEXuEjBsy3alkDfElL4HU3teaJsUES/VaWf7PKWWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV2PR04MB11189.eurprd04.prod.outlook.com (2603:10a6:150:27c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 09:33:44 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 09:33:44 +0000
Message-ID: <e86c8543-b883-4bd3-ae21-87e7c9443957@nxp.com>
Date: Thu, 24 Jul 2025 12:33:41 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: Re: Re: [RFC 2/2] Documentation: media: Describe exposure and
 gain controls for multiple captures
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, ribalda@chromium.org, jai.luthra@ideasonboard.com,
 laurentiu.palcu@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com, julien.vuillaumier@nxp.com,
 celine.laurencin@nxp.com
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250710220544.89066-3-mirela.rabulea@nxp.com>
 <20250716000738.GF19299@pendragon.ideasonboard.com>
 <fcb87e2d-5ddf-4f33-b5f7-5af67c438af5@nxp.com>
 <20250723134942.GC6719@pendragon.ideasonboard.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250723134942.GC6719@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR06CA0171.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::28) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GV2PR04MB11189:EE_
X-MS-Office365-Filtering-Correlation-Id: b0707693-420f-4b7f-bbe4-08ddca952ec6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cWFPaUN1ck5oR2xTYThpaTF1YlZZbzhKMTdiUGpPTng4U00yaFVBTWJGbURm?=
 =?utf-8?B?V2ZiV05iblNGSjJLRmc5bTRJODdzNWE2Z01YdHNPZVUwa3FJZmNxWHcvNDBI?=
 =?utf-8?B?K3pRTkw1bTMxcW9TdEZKSUVzVEVsOFpIZEdULzJKMW5LbjZuWCtNaEhpTFcv?=
 =?utf-8?B?N2w4MkJwOVdRbjFmUW5tZVRzZ2xKRzJNVktiR1lEbFM4K3VncVZqaVoxQTFB?=
 =?utf-8?B?aFNLeWxxQTdLSUp5NFlSZGZMWm9pMlcxRUVFRDlxdFZqcjN6UjAraUpUWU5i?=
 =?utf-8?B?dFE4ZnRXYlJFU2dSMFV0UWNNNzllNDlmZm5manNxVjlvK0RwNHhmUUdHV1Ur?=
 =?utf-8?B?NVBKWEx3MWwvcEg2ZTNiWU9IT2hPZDFyMnR3RFd5ZTE4aGY4UTJXdnp4THZJ?=
 =?utf-8?B?dDRjS0JXTnFTSUlqYVhzZHlYelY4WXU2S1cvRktKUW9uTjNqU1NLWFlLZkp6?=
 =?utf-8?B?ZkZXMzBTV21pOVc0dCsveTE2VEVKOVpKR0JxTVRKZnBvdzJtUU9CbHdSK3d0?=
 =?utf-8?B?T0dvSXNYcGpKeVRJRTQ0L2lnQWVWT0dCRytRcUVZMHZSTVNONXJNZnl0Smtq?=
 =?utf-8?B?TTlOR1ZFbE80UjUzT0loMGxiYm5zbkR0ZUJyQVhBa1FHUjRvWW0xMlNhQnBt?=
 =?utf-8?B?UFR5WlBPZ0s0bzF1MVhiYjZ3U2tGR3phN2NPMUtHNkNNWHNuRXpZY2FuQ01T?=
 =?utf-8?B?R0tsWXVxNENJS1p3amlsT2w2MWorcjA5VjVuRGs4bFpPYWRpMThBM2ovdkZa?=
 =?utf-8?B?SVhlR3ZMY0JLcXprM2RhZWJ0UDJmZXVSMjRycFlaMitoWmJrc0J5U002cklT?=
 =?utf-8?B?WFpGR0ZrVmJScjFKb2lsbzdTZmhDaG4yT0dQV0Z1UHgzSk1iRVc0Q3pxM291?=
 =?utf-8?B?OVJIejV6SDcvWTVTZWg2TkUrU1I4K3A2TnZvRHFwYlg5Q1V3RlQ0MHBJWXlG?=
 =?utf-8?B?VXpwYVY5TDduaEd5MjE4R0piN0JPWGxQV25USkZlZHA1UE5OdVE2S0pRQkFx?=
 =?utf-8?B?YTNDUEJTcHFPVTdER0NFRG1jVFI1L0xDUGRWc3R6RE1pKzYvYTh6MHZ6ekJj?=
 =?utf-8?B?cWlsWTFTaUpJWDYyVTdiQTR5WGtENzdUYkxXVjloV0lYc2RPRTF1bVZHZTdJ?=
 =?utf-8?B?eGUza1FCTXVRZE96UkprdW5ZZEovNDk4cnF2cnpRZ0FhRTZXVmpsRnBPZmFs?=
 =?utf-8?B?bzJSdC9PRVNCMExLcnp3WVFFWVF6TW9yR2U2bjREVGNrSkF4ZjQ3bUNpRjcz?=
 =?utf-8?B?L21XRmVvalppdjhnZk5MMWl2SVZIWlBLRXBxc2tVSys2OTRZWjZHRHcvdnV4?=
 =?utf-8?B?NUlsSU5tSXZZUjhxdEIzNkJtSklVR1VtblNJQnJoUko2MTV6UTY0c1RoWENW?=
 =?utf-8?B?dDd4U0RrdytwK2dvZWEvRWRvd0FVd0l4VnNRN1ZhblErRThsalZqUitrRHAx?=
 =?utf-8?B?NkVPUlVrYTNQdUoySXliQW53M2QrZDZKK3NZTTN3ekdDTzlzWkQrdHRDNkZm?=
 =?utf-8?B?RzdDSDF1RnpkdGt5U3FLamhiSWNxSWhuV3BMbEFnWUZqczkrY1hRUjhRdkNa?=
 =?utf-8?B?LzRzMHVCWnl1TEhFY25jK2hrV3lOODJ1QlFmZUhPaFQxby81L2hSdk1kbEJ0?=
 =?utf-8?B?eGdMQ0xZWGRWZFVyVi9UOHYzZG1TU3p0S2xpSnY0cG5CN2U1aS9qUlRnTi9R?=
 =?utf-8?B?K1NES2F0SjRRMHlzR2p3aDEzQkswTnZSZkI1UVZJTFVYUVM5OU1DTnNhWWNv?=
 =?utf-8?B?V2pOTDVGR3ZJT3hhb2xCOHYrZkJPM0xHTlZMZjBscFRncFVnT3I5SkZFc1JO?=
 =?utf-8?B?Tnk1ZDlrbFY4Q1ZTYjl0U0xuVXI4cyt3TEJzd0V6b0lUWUN4MEVQbXdjdmZz?=
 =?utf-8?B?Sy9ST0JmM3FUc1d3QmppVjdDS1czNWdlK0puUGRtYjQ4Z1JKb0VXSWtXOHRi?=
 =?utf-8?B?elR1MjdVaGlEcHk1NDVWY05UL2xNaEZLRmJKSE0yTTNGNHU1VGE0TnNsR3RO?=
 =?utf-8?Q?kCARfPWLVvBNamQpeDiE4FEWxjgxTk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZG5ITWlIMWFlN2g2OUg1UzI1aXk3MlFQdlNOZGdZcFdmSWN2czk3WTlkTTYw?=
 =?utf-8?B?VTJJWE1BejByYU1uODhzSW5MTUJYZTlaY1lNbVpxa0pTRFZKSWllRE5RRE5z?=
 =?utf-8?B?UGEyMnEzdnFmbFdLZ2FSVXJJZjZXYXE5TkhtZGFiRzdjOU12Tkw0Tit3UDEr?=
 =?utf-8?B?V0hoeXdNUEV3WHlxQkxXT0ZPRUJKWjVPYWRlR3ZkazMvUGVCTXF1VEkvemtD?=
 =?utf-8?B?RHhBRndSUEVEekN4NDE2OVVpclpSNzFmZHN1OUN2M0RaYURDRHRaRUZNNkRr?=
 =?utf-8?B?THlNY0c5MXZvNUc1QjV2aHoxZEtIUEhhbVVxc2h1SFo3dndmb2ZEVHhyVTAw?=
 =?utf-8?B?V3Fsbzk4TDlFTGpRQjhLS3lLWHZnSWpYZ0hoejVrVDVJM2txQzJqS3lsVGJV?=
 =?utf-8?B?dnZ0RFY4azFVamw5STNLcnVmT2kxSGFnRHFBcFY1U2VLVTJic0UyemZyTVcz?=
 =?utf-8?B?citORTJCYUhNMGE4V3lxWlBRbzE3VEtvUFk2REpNdnd6VFVnNThMTzBTZGxV?=
 =?utf-8?B?UUVHWjh1b3lWS2kzRzFsUnRsaVBXdXV1R3NYNVQ4eFRBTWhmZmNUUVhhMWNm?=
 =?utf-8?B?cWNHdWV1VTBQSW02SXYrbHVHU3JlakFFU3BUamFHQ004T2pvWEphanpjbDFq?=
 =?utf-8?B?WlZlNUtiRHdMaG1hVGQ5RXhZSWJmdkxZeGdwS2ZRT0hVUWU1TGpJbHM5dnZV?=
 =?utf-8?B?ckowVks5TEtSMDlPOWtucXAzZGtqVjhhQktmUXlwVzBOVGZOWWlKVjduVkNs?=
 =?utf-8?B?SnZsdTNmY1hDdUZKQWhxVEZCTW8wZFFTekpYR0NYY1VZaFZlK0VVMWhDZVRx?=
 =?utf-8?B?TTBBalpNUFNmSFQva3RTeG90RDl5azBBOTRjMUcwOFMreWFYdjFQVEVxTGJp?=
 =?utf-8?B?MmhiNysvRUljdm9wMUxTME1ldHNVOXBJTVVPT2FPVVFYNThkaGRMWFhscHgw?=
 =?utf-8?B?TUcwS2I4WThvVmx4VW5ieDNTOGNiZGw5SC9RS0huSEtPQUtVUEZYN3NZaGx5?=
 =?utf-8?B?dnd4Y2ZudHdxekN0T0xXR2JiQ0s2aXVQcDZGb0JYZVU2K2d5eFNXSmxSSXRh?=
 =?utf-8?B?aVlobnlUNHN5a1hSR3RlaTdyTkU1S093OWpMZHBxdmtQYnFKMDRPWlA5V1Jw?=
 =?utf-8?B?SW5EbFAycU5ndDQ3MUhzOGhnQndQVjZZbGxyTzFBb1AwcVlDeGc3SnEwdVoy?=
 =?utf-8?B?aklYR3Q4Q1NCR1FXSFFTcnFSSzQxZnFIS1B2NkVkZWdua2JHZlg5U2hHVFps?=
 =?utf-8?B?Ly9CZEJQT0hmTkwvOEZ4MnhnSXptZ1RMQlVRcTJJM0xvZ3hnQVNyd2M1cUxl?=
 =?utf-8?B?dWk2SWxhbDVXWXV3c242Q2cyWnhDTUxuR1RWNFhET2MyNDBrcmJQbHk1dVB4?=
 =?utf-8?B?Y05aanVXSTZ5Uk9IQXZsbEJIL2w2NE1BYU55SVBRbTJ3eXdEUkd3OWhWUUJ0?=
 =?utf-8?B?MXdEZVdlVENCYXNVdkQyMDlqNm9XOTNCbjkzR1h5MVlpUGNDNGUzZDFMbzRY?=
 =?utf-8?B?RXBvL0RrZEhOdlRISmJHT2x2RnVZU2NhZEJpb2p6K2RhZyt1N3hPdG1jK0d1?=
 =?utf-8?B?VDI1RXBMT2M3RTB2aHdESHh0eFA5aXltZGpXVFlMdGhFOW1SZlArMk1KL2xq?=
 =?utf-8?B?R3ZzL1BGTzFpcWMwRThkYTM0T1cwWEVucXpIekYwblNlaGRiR0ZLUUo5aEM0?=
 =?utf-8?B?b2h5NTUwZUlOeVpUQ2VsZTBJZzNDNERWb3dGWWpiUlhXaVk5ZE95SXJXZzFk?=
 =?utf-8?B?QjBZOVBrdlVwU3g5a1JOUVRucXlhVnVSd3NVRlE0TmVYanVDQUVVNDRUZ2hG?=
 =?utf-8?B?eUt5eTRIZmI0KzhHN01kUGk0TitTbWVGYWNqRVZXalc1clhpNUtLOTZxNXNl?=
 =?utf-8?B?SXVRYi9UVTJCQzhIMTlYZW1mVWhUUDNiUzZFVlJqd3MySm5BM2ZqQ3VDK25G?=
 =?utf-8?B?ZWhrY3pWMHpEVklZZWhJTjI1NGppOFB4dm9Ba0VOU3pJRGtTWjk3dEtFQXEv?=
 =?utf-8?B?alVFM3ZrMTdZSzIwS1NBOExXSWl0c1ZPWVU0dFhIMEVEaUw5WTlQdTFKcTAy?=
 =?utf-8?B?R0MzK3VLcTZYSUU3eGFMUHlmaXA4NXB6WWRJVGxuMWR0MC9lS0NFT0NwV1hU?=
 =?utf-8?Q?EAXEiFCamzj/y5hQcCSUc/8nK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0707693-420f-4b7f-bbe4-08ddca952ec6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 09:33:44.2098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQD0Z0/yvb3dtylw+rghbFlYw79oq/0qqEhn+2egHBv9GcsZityr/N4+tqgSF/etlZ4jie3VsfnUR/TzqlRqSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11189

Hi Laurent & all,

On 7/23/25 16:49, Laurent Pinchart wrote:
> 
> 
> On Sun, Jul 20, 2025 at 10:02:13PM +0300, Mirela Rabulea wrote:
>> On 7/16/25 03:07, Laurent Pinchart wrote:
>>> On Fri, Jul 11, 2025 at 01:05:44AM +0300, Mirela Rabulea wrote:
>>>> The standard controls for exposure and gains allow a
>>>> single value, for a single capture. For sensors with HDR
>>>> capabilities or context switching, this is not enough, so
>>>> add new controls that allow multiple values, one for each
>>>> capture.
>>>
>>> One important question not addressed by this patch is how the new
>>> controls interact with the old ones. For instance, if a sensor
>>> implements 2-DOL, it should expose a V4L2_CID_EXPOSURE_MULTI control
>>> with 2 elements. Should it also expose the V4L2_CID_EXPOSURE control,
>>> when operating in SDR mode ? What should happen when both controls are
>>> set ?
>>
>> Yes, it's a good point. I experimented with the option of implementing
>> both, at least for backward compatibility (libcamera requires them) and
>> kept them consistent, I mean if V4L2_CID_EXPOSURE_MULTI values change,
>> also change V4L2_CID_EXPOSURE and viceversa, so basically keep
>> consistent the values from V4L2_CID_EXPOSURE with the values for the
>> first exposure from V4L2_CID_EXPOSURE_MULTI. Also, I had to check if hdr
>> mode is not enabled, do nothing in s_ctrl for V4L2_CID_EXPOSURE_MULTI
>> (cannot return error, as it will make __v4l2_ctrl_handler_setup fail).
>>
>>> There are also sensors that implement multi-exposure with direct control
>>> of the long exposure, and indirect control of the short exposure through
>>> an exposure ratio. The sensors I'm working on support both, so we could
>>> just ignore the exposure ratio, but if I recall correctly CCS allows
>>> sensors to implement exposure ratio only without direct short exposure
>>> control. How should we deal with that ?
>>
>> I'm not sure I understand, but in case of indirect short exposure
>> control I think we do not need these multiple exposure controls, we can
>> use the existing ones, as only the value for the long exposure is
>> needed, the driver can derive the value for the short exposure using the
>> ratio.
> 
> I'm talking about sensors that implement the CCS exposure ratio, or a
> similar mechanism. With those sensors, the long exposure time is set
> directly, and the short exposure time is calculated by the sensor by
> dividing the long exposure time by a ratio. The ratio is programmed by
> the driver through a register. The ratio could be set to a fixed value,
> but I think there are use cases for controlling it from userspace.

Sounds like we could use another control to allow userspace to control 
the exposure ratio, let's hypothetically call it 
V4L2_CID_EXPOSURE_RATIO? Would the ratio be a scalar number, or do you 
think we need an array?
While a combination of the existing V4L2_CID_EXPOSURE + a new 
V4L2_CID_EXPOSURE_RATIO control could make an API for sensors with 
indirect exposure control only, I am concerned that if we were to add 
such a control, we would also need to define it's interaction with 
V4L2_CID_EXPOSURE/V4L2_CID_EXPOSURE_MULTI, I think the logic here can 
get complicated, especially if we begin to think also for sensors that 
support both direct and indirect short exposure control.

> 
> Some sensors support both direct control of the short exposure and
> indirect control through a ratio, while other may support indirect
> control only. For the sensors that support both, we could decide to only
> expose the multi-exposure control with direct control of the short
> exposure. For sensors that support indirect control only, we need to
> define an API. We could possibly still use the same multi-exposure
> control and compute the ratio internally in the driver, but there may be
> a better option.

I think I like better the idea of using the multi-exposure control and 
compute the ratio internally in the driver, it sounds more flexible, in 
case different ratios are needed, maybe for sensors with more than 2 
exposures, it saves us the trouble of adding a new ratio control 
(possibly array) and defining it's interaction with the other controls.

For the sensors that support both direct and indirect short exposure 
control, I like the idea of exposing only the multi controls, and let 
the driver use what it needs from the array, depending on what routes 
are active. But, if needed for backward compatibility with userspace 
applications, we can have both.

> 
>> In some cases, this may be enough, but when direct individual
>> control is needed for both long and short exposure, then we need the
>> multiple exposure controls. Do you have a specific sensor example in mind?
>> I think in the past we looked at imx708, and my understanding was that
>> the exposure control affects only the long exposure and the sensor will
>> automatically divide the medium and short one with the corresponding ratio:
>> https://github.com/raspberrypi/linux/blob/rpi-6.12.y/drivers/media/i2c/imx708.c
> 
> The ratio seems configurable. Register 0x0220 is programmed to 0x62,
> which selects ratio-based control of the exposure. I don't know if the
> sensor supports direct control of the short (and very short) exposure.
> 
>>> Finally, I was recently wondering if it would be possible to reuse the
>>> existing controls instead, allowing them to be either single values or
>>> arrays. The idea would be that setting the control to a single value
>>> (essentially ignoring it's an array) would provide the current
>>> behaviour, while setting values for multiple elements would control the
>>> separate exposures.
>>
>> You mean to divide the 32 bits value of the current controls between the
>> multiple exposures?
>> Just one comment here, we have encountered the ox03c10 sensor with 4
>> exposures (that will leave only 8 bits per exposure), and the ox05b1s
>> sensor with context switching and the exposure on 24 bits (for 2
>> contexts, 2x24=48). So reusing current 32 bit controls  might not be
>> enough.
> 
> I'm not sure the controls here should be used in the context switching
> use case. It would be better to define a more generic mechanism that
> supports multiple contexts for all controls.

Stream-aware controls could also do it, in case of context switching we 
have a stream/vc per context.

> 
>> Or do you mean changing the current controls type from
>> V4L2_CTRL_TYPE_INTEGER to u32 array?
> 
> Yes, this is what I mean.
> 
>> Would that not cause issues with
>> applications already using current controls?
> 
> That would only work if the kernel could handle some type of backward
> compatibility, doing the right thing when userspace sets the control to
> a single value (as opposed to an array of values). That's probably not
> very realistic, as the control would enumerate as a compound control,
> and that may break existing userspace.
> 
> Another option would be to change the control type at runtime based on
> whether or not HDR is enabled, but that also sounds like it will cause
> lots of issue.

Let me know if you think it is worth investigating any of these paths 
(control as single&array or change control type at runtime).

> 
>>> I haven't checked if the control framework supports
>>> this, or if it could be supported with minimum changes. The advantage is
>>> that we wouldn't need to define how the new and old controls interact if
>>> we don't introduce new controls.
>>
>> I think the same advantage will be achieved with stream-aware controls
>> (no new controls, also the min/max/def semantics remain clear), but
>> there is the issue we do not have streams if the sensor does internally
>> the hdr merge. Does it sound any better to introduce some fake streams
>> or pads that are not associated with any pixel stream, but just to allow
>> multiple exposure control?
> 
> That also sounds like quite a bit of complexity for little gain. It

What sounds like complexity, stream-aware controls or fake streams/pads?

> seems that new controls are the best option. There are still a few
> issues to solve:
> 
> - Should sensors that support multi-exposure (or gains) implement
>    V4L2_CID_EXPOSURE for backward compatibility, or only
>    V4L2_CID_EXPOSURE_MULTI ? If both are implemented, how should the two
>    controls interact ?

I think sensor developer's life would be simpler with only 
V4L2_CID_EXPOSURE_MULTI, it would have been ideal if V4L2_CID_EXPOSURE 
was an array in the first place.

For backward compatibility though, which is an important practical 
aspect, we can allow both V4L2_CID_EXPOSURE and V4L2_CID_EXPOSURE_MULTI, 
with the mention that V4L2_CID_EXPOSURE, when used,it has clear effects 
on the first (longest?) exposure, but may have undefined behavior for 
the other exposures (a default ratio could be applied by the driver, or 
a default or previous exposure could be set). On the other hand, 
V4L2_CID_EXPOSURE_MULTI has clear effects on all exposures and would 
recommended it to be used in case of multiple captures.


> 
> - How do we handle ratio-based exposure control ?

For ratio-based exposure control, I'm thinking it is better to use 
V4L2_CID_EXPOSURE_MULTI for both direct and indirect short exposure 
control. Let the driver calculate the ratio, and there can be n-1 ratios 
(n=number of exposures). This would save us the troubles to define and 
manage the interaction of a ratio control with the exposure controls.


> 
> - In which order are the exposures (and gains) stored in the array ?

With the os08a20 in mind, I would propose from the longest to the 
shortest (when the sensor operates in non-hdr mode, only the long 
exposure registers are used, that is the first and only exposure).

Well, these are my opinions, more or less justified, I would like to 
hear your opinion further, as well as anyone's else.

Thanks,
Mirela

> 
>> BTW, Jay, what are your plans around the stream-aware controls?
>>
>> Thanks again for feedback, Laurent!
>>
>>> Hans, what do you think ?
>>
>> Same question from me ;)
>>
>>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>>>> ---
>>>>    .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
>>>>    1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>>>> index 71f23f131f97..6efdb58dacf5 100644
>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>>>> @@ -92,3 +92,15 @@ Image Source Control IDs
>>>>        representing a gain of exactly 1.0. For example, if this default value
>>>>        is reported as being (say) 128, then a value of 192 would represent
>>>>        a gain of exactly 1.5.
>>>> +
>>>> +``V4L2_CID_EXPOSURE_MULTI (__u32 array)``
>>>> +    Same as V4L2_CID_EXPOSURE, but for multiple exposure sensors. Each
>>>> +    element of the array holds the exposure value for one capture.
>>>> +
>>>> +``V4L2_CID_AGAIN_MULTI (__u32 array)``
>>>> +    Same as V4L2_CID_ANALOGUE_GAIN, but for multiple exposure sensors. Each
>>>> +    element of the array holds the analog gain value for one capture.
>>>> +
>>>> +``V4L2_CID_DGAIN_MULTI (__u32 array)``
>>>> +    Same as V4L2_CID_DIGITAL_GAIN, but for multiple exposure sensors. Each
>>>> +    element of the array holds the digital gain value for one capture.
> 
> --
> Regards,
> 
> Laurent Pinchart


