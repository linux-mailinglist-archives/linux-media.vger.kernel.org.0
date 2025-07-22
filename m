Return-Path: <linux-media+bounces-38220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44528B0E61E
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 00:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D06D1CC124A
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 22:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD5B2874F2;
	Tue, 22 Jul 2025 22:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FKcfaKkl"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013053.outbound.protection.outlook.com [52.101.83.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6B92E371F
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 22:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753222285; cv=fail; b=EFA3pii5+B8kYUWYw/rivzperxmC6C7JfMU3kBMWykBEr/EiVhDDQHTABqA1AQt5esSX9UNt2s+gXMZ33BZmMOUMsRCnu1cfCnaFsrRLOid0WRhdfMw0SYiU+HtV6NQ8yV7sseKMPbAfl8p58DU2yYxkFCP05FFwVu+X+/GYlQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753222285; c=relaxed/simple;
	bh=aygNDMyBYMvSZIS4cBKz5STG5agbhDZcvm0FXHIC+FM=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y+TQf6a+XZQiH7ZXtrXic7F7UD6Ltt6dtyQlAIFddGJ8KiS7d+t+uyGq9vNDP1x9/W/dYuLrJLKYZ9ktm/e/h0EfEwM2M1WPyachpU+PvGmGLAiALhbYKYFk4fIKN+fyCw0vyZCil3QVENgIuvvUTmlANhhSP5ZYrVSAbk4gENo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FKcfaKkl; arc=fail smtp.client-ip=52.101.83.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naXEtVWVhYqsfM6eLYTxi3lsONE2yFzSIAS5yrpw1vyuHSTiwAn/ECV5IwLuQ+DvMMKJoZkJ07aCh05isImiwIF0IHHKY9jcbNEcGUinrMVXzCirWIhHHoXyZ7VzVqMYtNpzjEGVC57apFuJQ0Er6DmsyYAV68bDhDYnTqUtWIf334Cb33p4EXILWPSfQrDC3SoYJdIH+PEAvz4/hAVeeXyqcExnHwlwCRfvuq18jlmaIMNC1Tmd97v73su4sQVPablhj9qCltc5SisAABP8WbWwE/j7F8BPw/xoMmeUvDZQoAg26NFjiOkPmFQZl+LJz+0RAtHrqGqDNF2rQWdeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGAuQqvp9YSG0YDdxIfFpG2aA6Ki1HX/kHOQaCyfCag=;
 b=qJayXly8pH0sr1ecjRO25uMo9UGd2eA52nyweB16FpmCrkvXK0k1G9N1cjcVzbqmFlVlJRxH4tmDRS5vCqyFxTGyYEIQsEUKJU/WynTnRtrquz5/7uOd3wVY7svrr+hIozbc6cOwldA+xcJqdAvJnqAnXCHGsEsZHr1IRVd+ua9+t344WoqzDcEFCOLLGTjKdLV4sBXN+qB6tA+BUzfjV2mPdE3rQOfMOOSi55SGgZV5qXwxeaCQ6bHdNGU7yXYwSvDMyYV9iYcHzVyphSrLoG35C5izOqLDYjmz/Wcbo/wE283t45r7aFwDuqjIAYfbEhZ/SDUgBIyEmd5EY2eVuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGAuQqvp9YSG0YDdxIfFpG2aA6Ki1HX/kHOQaCyfCag=;
 b=FKcfaKklMRIjPHkcAexoKC3mjoprBgwHoQkGBB56ZJAone1l65CLpPfSACEKtzyuQtNSvF5/Ay7AlonblAmVD3cVtk+VUChhBrOCWQAZXq+lBupqfhBUwPnwsS1oHy1tX3J7Hlc+lEQe4ye3wJxrNHPk00Bf2IfwSMY35mu4qqLU/Vvo94wH1VuDkH+8j51wMMrYUza9nf9S8KHcoW+2qN3RVd24j6gdN9xX0ORDwSBi0102zzGOdlYniIt25L10qHQMEEZ8HXRxJkygFrzi4o8G2x2NRqeNt9OrAuoCC59OFZJpGihOx+BEDGJk+MVJL0PBvCIXVvGo4f/hkPvhHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS8PR04MB9046.eurprd04.prod.outlook.com (2603:10a6:20b:441::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 22:11:19 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 22:11:19 +0000
Message-ID: <ba1e16e7-d61f-4d3f-9b82-b8014d0f1368@nxp.com>
Date: Wed, 23 Jul 2025 01:11:10 +0300
User-Agent: Mozilla Thunderbird
From: Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH v10 13/64] media: mc: Add INTERNAL pad flag
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-14-sakari.ailus@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20250619115836.1946016-14-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0103.eurprd04.prod.outlook.com
 (2603:10a6:803:64::38) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS8PR04MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: e3817a08-54b4-4a1e-ea83-08ddc96caf8d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Y2E1U293Q2VML2wweUlJRWZCcTc3NWdoYmdzajRONC9OTmk0VkNPRklPNDJP?=
 =?utf-8?B?dzk1VW02RjRDZENDWjBBN0xQcThCMVcrMlhydis0UmswbHJDdlpsUDY3aDI2?=
 =?utf-8?B?bUlDV1VyM2xqY1ljQUJSM0NoUHJmZGI2S2ZoTzV1ankwZi9VQysxV0xWbjJI?=
 =?utf-8?B?akRpQy9ZSXl2SWFkSGEyZE9vTmFCMEtiWjdVRmhOREUwVExmdWRhWC9tRWIz?=
 =?utf-8?B?RDM3SFVpZ1hOajM0Wml2c0hIRHBPdExnQWFRaVdGWmhpa1FLM1RidVhMVGh4?=
 =?utf-8?B?TWhIUTZoU0ZzWEc3ZVdXMkoxcHN0c1g2RXRSTmNZQWdKWDNZMUdBOTVhS0ZC?=
 =?utf-8?B?ZjlYckIvdXZKcnhGU1JxSTFwTDdubWNWZVRSeEhENVZCSkR6eDlIYWV5RUxK?=
 =?utf-8?B?SFBidi8zOHhUN1dhc25pMW16b3hOU1RTRElWRWxJbWRsMkRlZHd5eHBmbHp1?=
 =?utf-8?B?VmNaY0wyeitodHhNNnFCdFNST21jaFhrQW5IaWdQb3phQUlVT2J0NXhBU0tt?=
 =?utf-8?B?VlpZOHBKRFN3bTh3NUw4THo4UHNvVDlJOEdlWXVzY3M4aDNRT0VPS1RkazAr?=
 =?utf-8?B?azFNSFNEaFo3bFlod0wvS1J0THdPUkhvSUNJb0h0NnFGYVVYU01HV2tMbXJy?=
 =?utf-8?B?YUhWVG9EL2ZHOVBIaTdpV2hwS1ZweHB5N1Mrd1UxN1Y2SEZ1amExclpqK2dU?=
 =?utf-8?B?M05HYkJaYjJDdHVCdS9vOTFENWJ1bGoxRFhyTHNEYS9LbWY5dmZsbHh3YzNE?=
 =?utf-8?B?UENjZmtqT3BHbEJIL3B2dWl1Y0J6NmtpK0JuWFpCNXVpS1pDUDIvWXJOUmx2?=
 =?utf-8?B?UWhOVWhYNU51d2JJdWltQmFERHNTQmY3Ym81QmdDcTJmc0hzTG5SY3MzRGhN?=
 =?utf-8?B?TDZ1czJPQWoyZ1FKVGFnclUzVXl6U1g4eVVieVdqeXlJVmNKSFg5cmNKM296?=
 =?utf-8?B?OU9OeDcrU0hKT1lzandSeTFvN2xybDNYY3RSTHA3OTBUZzRPRVBzemd3eTZB?=
 =?utf-8?B?SS91QUVMQk96NzBYelpuOXRxSDNzMHZLZUN1cUVqd1MxSE1teGRMNnlYbC9S?=
 =?utf-8?B?NTJ0VmFvVkttTEl4blhUeTRxWDZOY1crNWpPVHZJcUFBSWpObXR2RXB5aFBp?=
 =?utf-8?B?b3BQR3VBWGc5ZmE0RGdaSVlMOWQxSHN5YTArVElQVHBVT3FXNUhQNnJKK3hI?=
 =?utf-8?B?aThNaVVQS05XbHBWQmF6WHRtQ1U0WUpzNjVFem9rTTBCQjk4eHh3SndmS0xJ?=
 =?utf-8?B?c2NwM3V5eGZxR0IvSnE4UjhMVmtoRWFaL0ZkZ1pHZnhjTWZkZEhUbEg5Mzcx?=
 =?utf-8?B?d21sOHIvTGJqZ3BGWGZXWjNqb2hlT2pTdTVkTktIMFVwRWhSQkNVUGdkMUtM?=
 =?utf-8?B?QldrZ2xiYVIvWFJVL2F5Rjg4ejh3Mm0rSjRLNWpBZG13YkZZR0VYRGNhbVly?=
 =?utf-8?B?UzZLMjQwRDEzU3JBY2ZkeFRxc3VGUEJaT1dzQ2VZTnBOcm9Nb1p3R0VINklE?=
 =?utf-8?B?UnRSc0tDQ3JOaUpQSFJtOHljdWtWQmdPVTFmMUZsZmE4OXhSKzN2aW9NN3RK?=
 =?utf-8?B?Q2lGekgwYXVHemtBU1ZRRzdDTXJnVVEwZmthU3hPWEExZ21KY3FjdmVLVy9O?=
 =?utf-8?B?SlhVaUo4VE5va2tNRk81cUg0UW1yUVBTVFZUVkJJbGliMCtuRnVUKy9IbGcr?=
 =?utf-8?B?RHNYZXlqYW9Xd1p4SFRmZC9TbTBRZnlmSzhZRGdXUzk3UWluZ2lyV1VrSXgr?=
 =?utf-8?B?TVNuUTBGNmt4ZEdlaEFuNVB1UEZCSHp0YXNxOGZZYWl4VFo2ZVJPV2FLSlpJ?=
 =?utf-8?B?c2pGTVdDRVh6ajM3Nm01ME5qaVhDVDdSdytYbnNWNmd2VXB6cEpscE1oeEhY?=
 =?utf-8?B?MU1HeXplaUxRSHdIZ0wxL05PRTRCOG1WRDl5Q0l2UFpaZFQzQUFnYVdMK3Fy?=
 =?utf-8?B?Z3NmaVp4cjNqVjJDVmp2TTlmOGV0MzNmdlFGZitVdE92ZDdSNlpMRWRsT1Bz?=
 =?utf-8?B?eXdxSzZ2ZndBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eDkxWk9sbXBGYit4RFp0dWo2ZjA5bjRkNW1xeWY1MUlPNERDZ3BsQkdYMlY0?=
 =?utf-8?B?K01OcGZiN0NWVDhEN0FLbjB3ZExvRThRUVRlckVWMWtHeStFeXBocWc4MWZ6?=
 =?utf-8?B?amV4K2dmckgwU0Nxa3hCSmNtWjMyVFQ3czIzTVZ2M2t1dkNpeVFVVTZoV3FH?=
 =?utf-8?B?cXZqR2dlenBVSnNWcmJCK0NGajZsVzloU2ZFSVdRMUpsSjM4T29oOXVWOHd1?=
 =?utf-8?B?d2NVTUI2ck1mYVN6WVg1bzhBV21CNURmYXMvOGlMSjkvdHkvbHRkNTZvVmph?=
 =?utf-8?B?Rk9ERkEzM3l0c08vZGIvSzBGUTJiZjBNYU1HQ01QajRqK1Z2ZFRpWkYzSUk3?=
 =?utf-8?B?Mm1GV1JmVVlwdnVTNVR1Q1JUOHAvS2Z3T1ZZZVpJaFB0MnBqV3RpY2Rlc3RO?=
 =?utf-8?B?YStGOHA3aU1UQ3UwNkJoVWNZdTgvdGMxMDA3RzBHQ0FIVUx2c3FaREFrRGM4?=
 =?utf-8?B?WGxsTW5ZZm5tZ2hLL3d5NFJiV0pKMGZ4Q0Q2Zy9TMjh5dXFwc1YySy9jM3lm?=
 =?utf-8?B?UFJQR1p3N3pueXFRaTZaTTR2ME1nQVlEMisrVkJSTnZ5Q29XTVRnZGt4NnNF?=
 =?utf-8?B?Umo4UVhpbXA5bXE4ZXZ1M0NsMzZCbHJndDkvMzJJMGk3RUJHc2UyVEFHdEdT?=
 =?utf-8?B?M285RHBHeHAycGxaTFNOUHRSd0poTC9Pdk9rQStjVmxHT3dwekZTSytwSFZN?=
 =?utf-8?B?ZjI1eFZvYnR2K25MMGZFMEoycEdlRUx6K3pobDIrVXhpazBaVXMweE02a2dm?=
 =?utf-8?B?dTRiSVl4cWFwWmJ0N2tESEk3NTE5T2FjNFNkUUN6STRoNm1ScGRnZDl6WEpq?=
 =?utf-8?B?MnJMdEE0YVhIZm1zZlVuWE5sdFFCUzEwRTcvVkZ6ZzlMbDZqUnNIb2ZEV3Yz?=
 =?utf-8?B?MWpmSGFEd3IxQUdvWEdrZC9KYmlnc1pmVWM1eG5uQ0pXZ2ROY09oRW5Meko5?=
 =?utf-8?B?SDJqMUlYUDU5V2JhY1diKzUxV2pZR0hTWFpIT09wRTdtR0d4TS9zVCt1ZHMv?=
 =?utf-8?B?dno2RjhrNmt0YVZrcTJVeUlsTEhhd3B4MDAwMmFHcWxyNGxxRnZCKzdxT21U?=
 =?utf-8?B?U3pFSEN5MXo0RlVuNGhYcFQ0Ym4yc2lvNlBrQzRvb0FiNVJvcFp0eVd6M2RN?=
 =?utf-8?B?Rlp1T0RNUnVDL2FSTkxxVUlLckR2U3NiUjJ3NGludk9oMnFpOUZsYjRLc3Ni?=
 =?utf-8?B?Y1VlNkVaVnhocWVNRDNmZTdaTW5ldzNxckdURnpsbUxOalExQWhyQm1aZGNV?=
 =?utf-8?B?QTNrcVRHK3ZRbkFWcGtMeGdUUWh2V0R6QmZNeFo1Sno2NEgra3JySlFHblBJ?=
 =?utf-8?B?d3dQdGd5bDBaSGF4aW9QL09TZm0zN3FPZW96OFYxMDZSVUNYYVFQQ1hpSmM0?=
 =?utf-8?B?MkVZUnJhL1ZNN2V5V3N2WlcyVzdGSUdVMWNDTDFqQlkxTVdnNFM5Vk1XOUw3?=
 =?utf-8?B?OEU4dWhUQ01UUG9KSjkrcHZmK2NCVE5jODR4ZVRDYnJ0akYxamFGajJpWCtZ?=
 =?utf-8?B?cjNiYjlCU2JnNTRvVVhQMVNWdW04bkVQTnN3S2JET1RLNHY1cVAxVURzZzFB?=
 =?utf-8?B?c0JTcHZJZUJVYS93WHdkcFplRGJHcjlPNWhrdkI3cUcrbm1MOXRuSXVMVmF2?=
 =?utf-8?B?ZXIvanB4RnlZTHVoeTljSk5RSElYYkVwRDAxQXVHSHRzeWpCREFZTDlhZExh?=
 =?utf-8?B?OTBscTUxWHJMUVJnVzkzSlNzbDRpMVNOT0RxUU96QlBDRlZQR05mb01tTGVX?=
 =?utf-8?B?TDBrdmlRNFAzTFAyREZiV1lNaHA1MStnMG94N2VVWjRIYVZJQjNMSzNYSWp4?=
 =?utf-8?B?MHBmcXlRNFRCc3RqOE8zSDdmRUc3SXBYc2d3emlvVVFiQWN5U0VSMWNEYXZV?=
 =?utf-8?B?dm8rNmZnaDVJSGNERC85N3dZekRSanV5VEd4dlE2cjMyc0xMR3BTTk1SdWpU?=
 =?utf-8?B?MjJjK2R2dlhmOE43TlBMWFVOWWJ2aUcwRDRoK25ycW13UjkwOU5USTRoNHRj?=
 =?utf-8?B?aFQ1eXc5ajhXRjIyTGk1bHU5QTJPRzJ3SzNrenhCcGVhZzFQRC8valJCUlBR?=
 =?utf-8?B?VTFGdUlCMjZGRWZDbWg0WWI0eFhseE11eHFXdzFiY0N6THEwRGwyQ1hWbUov?=
 =?utf-8?Q?52lx6c6PSYhycrzyjhuHa/CLg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3817a08-54b4-4a1e-ea83-08ddc96caf8d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 22:11:19.7376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4Xsve0boibkZ9swBe0R+i4Tj8vtI4NlOyyYyvWdZznSczjW/b9BN1Nu1uaAQ6IlCgoD9ZAE4Q5XbG+0eiNtJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9046

Hi Sakari,

On 6/19/25 14:57, Sakari Ailus wrote:
> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> 
> 
> Internal sink pads will be used as routing endpoints in V4L2 [GS]_ROUTING
> IOCTLs, to indicate that the stream begins in the entity. Internal sink
> pads are pads that have both SINK and INTERNAL flags set.
> 
> Also prevent creating links to pads that have been flagged as internal and
> initialising SOURCE pads with INTERNAL flag set.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   .../userspace-api/media/mediactl/media-types.rst  |  9 +++++++++
>   drivers/media/mc/mc-entity.c                      | 15 ++++++++++++---
>   include/uapi/linux/media.h                        |  1 +
>   3 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> index 6332e8395263..200c37a1da26 100644
> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
>   .. _MEDIA-PAD-FL-SINK:
>   .. _MEDIA-PAD-FL-SOURCE:
>   .. _MEDIA-PAD-FL-MUST-CONNECT:
> +.. _MEDIA-PAD-FL-INTERNAL:
> 
>   .. flat-table:: Media pad flags
>       :header-rows:  0
> @@ -381,6 +382,14 @@ Types and flags used to represent the media graph elements
>            enabled links even when this flag isn't set; the absence of the flag
>            doesn't imply there is none.
> 
> +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> +       -  The internal flag indicates an internal pad that has no external
> +         connections. As they are internal to entities, internal pads shall not
> +         be connected with links.
> +
> +         The internal flag may currently be present only in a sink pad where it
> +         indicates that the :ref:``stream <media-glossary-stream>`` originates

The link to stream does not work in the generated documentation.

Other than that, hope to see this one merged soon :)
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Regards,
Mirela

> +         from within the entity.
> 
>   One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
>   must be set for every pad.
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 045590905582..04d69f042a0e 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -209,11 +209,16 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>                  mutex_lock(&mdev->graph_mutex);
> 
>          media_entity_for_each_pad(entity, iter) {
> +               const u32 pad_flags = iter->flags & (MEDIA_PAD_FL_SINK |
> +                                                    MEDIA_PAD_FL_SOURCE |
> +                                                    MEDIA_PAD_FL_INTERNAL);
> +
>                  iter->entity = entity;
>                  iter->index = i++;
> 
> -               if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> -                                            MEDIA_PAD_FL_SOURCE)) != 1) {
> +               if (pad_flags != MEDIA_PAD_FL_SINK &&
> +                   pad_flags != (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL) &&
> +                   pad_flags != MEDIA_PAD_FL_SOURCE) {
>                          ret = -EINVAL;
>                          break;
>                  }
> @@ -1118,7 +1123,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
> 
>          for (i = 0; i < entity->num_pads; i++) {
>                  if ((entity->pads[i].flags &
> -                    (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> +                    (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> +                     MEDIA_PAD_FL_INTERNAL)) != pad_type)
>                          continue;
> 
>                  if (entity->pads[i].sig_type == sig_type)
> @@ -1148,6 +1154,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
>                  return -EINVAL;
>          if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
>                  return -EINVAL;
> +       if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
> +           WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
> +               return -EINVAL;
> 
>          link = media_add_link(&source->links);
>          if (link == NULL)
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 1c80b1d6bbaf..80cfd12a43fc 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -208,6 +208,7 @@ struct media_entity_desc {
>   #define MEDIA_PAD_FL_SINK                      (1U << 0)
>   #define MEDIA_PAD_FL_SOURCE                    (1U << 1)
>   #define MEDIA_PAD_FL_MUST_CONNECT              (1U << 2)
> +#define MEDIA_PAD_FL_INTERNAL                  (1U << 3)
> 
>   struct media_pad_desc {
>          __u32 entity;           /* entity ID */
> --
> 2.39.5
> 


