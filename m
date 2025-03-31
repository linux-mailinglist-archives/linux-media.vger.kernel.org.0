Return-Path: <linux-media+bounces-29015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63758A75DDD
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 04:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05A6A167896
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 02:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698F986349;
	Mon, 31 Mar 2025 02:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hD6PhKdA"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA12F4FA;
	Mon, 31 Mar 2025 02:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743388640; cv=fail; b=SE/rSnPXbj5PO03P2LuiqYR7oHcyW2aw4UVcMlyxd3mT8v/nihb/m8DKFLCPbL2DKRFiAgHndLi+/w4Fpu6Nlhhi+4+k9c53SK6jnnFCqubaBSdwCog5vGv/RCRIHgWin2exXf8T6ie1653jOyrn4w/FDJ9acOCRk5NU0M77fbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743388640; c=relaxed/simple;
	bh=bEYGM6iVMcg0Xi3YuA9UkWhO4SedoOev11vPJJWX//4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sbLHspLGuMwdzmksLcGfwweqDDw2Q74xYP4XocWupgjEpZbKIzA6TdiHbr+cPtgLS2BHTLNSo1JlWoXh+BoiN01TtxSYRiOwxkTD/tSLkXemd31m9w3dwqKiHypsbG5R9PQOq2dwdX40Mp+UlntAF8QBDWAWDMLzX5cZ2GdzhNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hD6PhKdA; arc=fail smtp.client-ip=40.107.22.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KF8f/rh0mFkyowmAW5M5LlwL3Wd6SJ6hMN1+LEiLx9EBMokj99brH6R5O+gcrFASHvSehJDTu2HxhsSf9pcjfG6C85WSjUZdixyML5WFws6kmLkh5A23PZxPve6mZO9OqTf/BnaaoMh5bpCDiWOz6en7HFfgPYvDBzt/1EDsumvbD128lESf+0evPKGz6f+vACDiGst7BGDXJpKyZQr4BYxI05UEEVCnsJeiyZeq1piuaMgB4hz8pTBC67hMJFvo7/T1796uTdyJfCBXaF/xKjWlixYEU0kBAVRGjhFJ/Vbg713Q3X5RtdREiCR5GHpJ2D214p13N761Yc7e0RhUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzWdmWBYLG/QupSYxh8Y6ffkXHz6AubBsgI7xKTSMDk=;
 b=TJ1qNzHhTQ/c34xFqFhS2JuooP3ZYB08d437rCq0E5Eu5rOBLagnb/IvQ/trTfc/vm3MvTlFIj04jDze9p8iTV5JflAX8Ai1S7r/0HteiYw7zX/IGf8KNvr6K2LqgOPls+wYefKpyhFhr4mwXlTfy9xFA2FytI/8AUFkfLI3acXV0G+TMCaI8I7kqJmeuSuenxu0JSi+pJj+Dt363X7qDwCH+Aczz05i3/g5fRlLcruKzwikAs9fFsd24GiLUx8K/n3BNaJ0kvlFPg4dp3teioda+6kYWBgiRfu78Bq6/y5SRdXA95kKX9NyLCWNCWQWPw3ZM+FomhOKI3vpQtkkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzWdmWBYLG/QupSYxh8Y6ffkXHz6AubBsgI7xKTSMDk=;
 b=hD6PhKdAX1XKXazhfyYM0N+5W7uZpefycGdT/u/vsspLZLQyrR7aJKzyQAl6r2IoK6LD+twAX3zax3cBpQyGpJd/Ag5uUAPmnwJSVMXtgb4Fu853SG91+B+Uogm7HiV8+T9a5QwL7sptlnY4DmbbTox3aGu4UIQaQ/9ckUixqMeJkO+OA8WydecgkINkFOPnPJD+MNJEoaezln7oJALHg/sae5w7WnHkMrM0mqb8u0uAqmB0/mYG5K43Yc33x23tnNv2HDOV72K+Kh9/HvBPGGV5GCabb7L1q62XjGi6CCw/NpgWU5cczkjkfpJ7/BAV/dMW/APe2IxiK0LkuI8VcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB8753.eurprd04.prod.outlook.com (2603:10a6:20b:42c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 02:37:12 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Mon, 31 Mar 2025
 02:37:12 +0000
Message-ID: <8026c9c0-1345-488f-95db-15797833185c@oss.nxp.com>
Date: Mon, 31 Mar 2025 10:37:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: amphion: Add a frame flush mode for decoder
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250328064819.784-1-ming.qian@oss.nxp.com>
 <20250328064819.784-2-ming.qian@oss.nxp.com>
 <Z+axoaxe518QxY+3@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <Z+axoaxe518QxY+3@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::16) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: c9dd1d45-ce54-4fba-b16a-08dd6ffcf0f2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUhXUk9NTlBzZzFPVmE3UkNNU09BN0RwR2loWlNNNWlEZHJNTDV4SHVpcnBh?=
 =?utf-8?B?S2RGVlRWZHZUUzB5ckZUbmZPbWtIRHNmNnd0RkJja2VCY3VJVmszTlEwbDhs?=
 =?utf-8?B?UTA0RkZCNzZ3RjdxSDJuQjljZllhcnVIdlBoU25kcWgyUVd1SmZEUFI0Mkxk?=
 =?utf-8?B?bUNxQXlKYko5d2dwd3I2VkZVd0d6Y2lrME9zcTJ5R0ZEUnRxZ0ZBVlJEaDFU?=
 =?utf-8?B?dDI3aUt6eTJxeDg2L3NwNUFoTzFjUUlCR241bnZRRDdKN3ZiUXd5RTN3OVhz?=
 =?utf-8?B?bHZIeUhIeWNacHRMTDJac3gwRGMxZHJ0dytrOUhXMGtQVHl2MlNBbWdoVlRo?=
 =?utf-8?B?TVFrcVUzWEtWbVlIV0dKVzVwKzhWbGhYUmNBTHpoSThzWHhkUGIzVHhHSTJ3?=
 =?utf-8?B?ekRhSFpNSFlhRytkZzY1OWEvSk9zc2lndiswVi9DTFNLeDNvR0FMb3ZFbnFR?=
 =?utf-8?B?K2NwQWxCVmk2OU8xUTQ2ZGlVa3V4UVA0Tzc1OE5vYml2ZURSTVViZ29SNUpR?=
 =?utf-8?B?ZVJGZVJWczhFUjQ3bThqK3o3OVoySkw2K3FVeUVlbnpSQzJDcHBhWnlOUFRr?=
 =?utf-8?B?TTFyazhWUjV3RzRPTnZHTEJkalc3Tmx6NkJVR3NlblUwL0oyZXFMcWV3YU14?=
 =?utf-8?B?ektvWlVuZmxiWTJnK1AydTZpc3cyVFpBbGhaeE5odlprVEo1NnZoUTdPWm9X?=
 =?utf-8?B?QzBoUTZ4QlVjKzVBeVExaVVwRTVXMmVZSEp4WExReFJrUmxDelY5Wlhvbi9J?=
 =?utf-8?B?ZDVvcXdjdkhoMUJNcFZ6TlZ0MHU4bWZuU1BiL2NnMFJ5bWd3Y3I3MDMrK0oz?=
 =?utf-8?B?ekxqcjljdm1ycGRHOHV5WWdtcFBmeng0R2U3dDlwakQ3RjM1elVEQkJOOGU0?=
 =?utf-8?B?WU5MNG16UDFrQnZMWmJyRDJ5anlUM1lKZlZUaUJBL3dpRmxyeXJhdTB2cjRs?=
 =?utf-8?B?SmtDKzhwa1FROHlBd0JGMlZoaHVLV0R2S1JMYXJGenU1RFR3Nmpkc1ZtOXFF?=
 =?utf-8?B?bHVJNlIyTUlOWHFYUFR4VmpVY1FFbWNNNitDcFBWNUhPeERrTllzcW5Xc1Ns?=
 =?utf-8?B?alZNN2pBeEFWQ2t1clZkS2dPYTlmSTRTclZVbUpRTHoyVmZrdnYzak5CUXRY?=
 =?utf-8?B?S29FNG9FYnpzMnpvQlJLcGQ5c285cHo3d3E4YXJrODJMcjY5R0hXcEEyMmZX?=
 =?utf-8?B?ZnBQaU1BSEl6eTBhM2N2T01ibEI5cWNoM0NrSkMvVjQ3UFJWbmVQTzZvVzlq?=
 =?utf-8?B?L0ZncXlQOW8yM01iZks2Mm1hY0tPREdndGZTL0pNSkd6ZnQzRlFDQ01MK2pY?=
 =?utf-8?B?MGFHM2Q4cnU5bWdRVlRRZW9HWkNQdC9NT3BHa3lYay84ZG5XSVU3ZXJEQi9W?=
 =?utf-8?B?OHhxekdSMmZKTVVjSExjWjk2VDNmQm1mWk1ETTVsR3JzV09Ec3RidzI1ckxS?=
 =?utf-8?B?RjkvYjV2MUFETUZxR2l5SlN5ekg0VE9WMGwvYVRMZ0Y4a29YKzNacG1xYWpr?=
 =?utf-8?B?VW1yMmNzTTRwV2xNZjRYNEdTQVlNQnAxSVg0SGdDcGR4eTBtaCtxVDBYRTYz?=
 =?utf-8?B?Ky9Ra2RNT0dZTGlvY1IxRCt0Q2prM1N4UnpxQ1podzhCYVBjM0FzVmFIbWll?=
 =?utf-8?B?dUpkV2tremlSMU9jOXpRMjd0enBacE9aajFsamxhYUQ0aHN2SXVXZnNrUmdk?=
 =?utf-8?B?MEpVNWRnbm1UTURkVGp4V2srZ2lUL0FWY0pZRWZwc0R6STQvTE90aWxZT3M5?=
 =?utf-8?B?UzAvYVMvMVUxQTQ2d29GNEx6UUxxaENubWx2MmowWFZnbDFpYks2R1NuZjBy?=
 =?utf-8?B?bmd3MWpmV3k1d2FnLzlzWWF3OFBvQjVUemNHRkhhclFwc1FMTnVSVnVORmRw?=
 =?utf-8?B?Q1FsNVI0L3daZUxEWVFna1E5QXNLK0xVQUluSDhWVE9LWG4xWmhBMlgxaWZw?=
 =?utf-8?Q?ly1G5lvX4oU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnY2aDZOWnhkeDFEL3pmaG93UCtGSUVnQWNtTWZuWGFzY21sU0xZQW5WbndC?=
 =?utf-8?B?dnAxQnJnTXh1SXFsZ1J5U3Y5Z21PQlBGblkrZWY0OEJHWTdWSkRza2IzU3BU?=
 =?utf-8?B?cGFob0JINi9YK3k1bmZaeXg5azMxdFkzeWZZZHhtK3FyL2o2WDNEV0p5Y09Y?=
 =?utf-8?B?QnhIUVJlSVUzOW5SVFVmQWZUZTZpMER5TElDQ3d0WWROcTE4L2s4NkZob3RG?=
 =?utf-8?B?NFJWYnE3SzNkSis3Uk1GNVFIaUVnZGRmY0JwcTVBbVB3c0dJZGxNaFc1Qk9u?=
 =?utf-8?B?YUFXWWoxMWczei85UE9aWFJxY1grQUxtUk5NZC9uNkRUbVNQRWJlV0RCVXhq?=
 =?utf-8?B?cjBQdEhSSXVWUEVxTEhXQ3RCYXRxR0JVVjFZYWVJbDlBOUFVTGVJaE55Wm9o?=
 =?utf-8?B?OUViLzJBaTVnSndBYm5zRE4rUmFHbnpZUWQ5a1pKRnZ1S1M4ZUhmTEhNRk1G?=
 =?utf-8?B?cGQxV2pURzhPV3V4M3dZak00d05QaDRwaVM5QzZTU3hLSzJPbEgwVjN4bEtP?=
 =?utf-8?B?S3NwREhhMStVMG5vN01lZEdqelVDSytGR3hoTXRhb0hoQ0szeE9rY3FBbjl1?=
 =?utf-8?B?TjNwQTVQNEIyYU05Q2Y4aXhIQnFTWGFIdlVrMi81RUtpZkZzelpibDA0WGFh?=
 =?utf-8?B?R0RVNmpxajAzQlV1YnY5M3hsT0NraUxNMGtVK0ZMVnh4N1Q0VnlwWmdhNG5J?=
 =?utf-8?B?UVpsRHh6V2REVU1wN2dsZkx2Q29aVyt6R3Q4aVVKMHd2cU1UaWhvZ09abmph?=
 =?utf-8?B?ZE55QXFYdzlyaisrTk5JNUlRNm1KWjJUTGMySlNXYVZJOGt3R3JDc21vRGp3?=
 =?utf-8?B?N1MyaHVJWWlMZVAyUy8rYXByeFQxNm9VVmRHbmNjNy9kYTdQcCtHVTg4b0Zm?=
 =?utf-8?B?R1Y0cDZWckhMUHBXYk1nakNITnZ4ZXB5OHlDbExERDdIOFMyUDh2REdKNEtZ?=
 =?utf-8?B?RUpid1JHMUNqeGxwTHBpK0ljN2NlN083UXJuUHI4OU1JdW9oZVk1NUJVTUNI?=
 =?utf-8?B?Z3IyM2lvNFloMjg5N3Q1Wk5icnBpMHNTMTZTRGM1cXhuK2FHd1ArOHRhTEd1?=
 =?utf-8?B?ZzYzMGhzdmM3YXJncU54dWcwYlFqRk5wZGVON1dLSXNUYW55MEJWVWduZ1gz?=
 =?utf-8?B?UE9vM052d0x0YVpldzd2b05SWWlaanJmTGJvcGpSY1NtUElhS0ViRXlFb2M4?=
 =?utf-8?B?RDlOYXZqRzNsR0RRQjRLQTZiU0RBMldtWVhpZ2VkUmZVd3Z1Q3JSbGpwRmFP?=
 =?utf-8?B?SEpVYlFHOHZjaWQvWDVQRDkrSlJ6VFFhWWt2dWhnY1BvcVdHVmh6emVVZDJp?=
 =?utf-8?B?d2RTcHM0b1pPazJOdlJHZVFKcGFwNzluYi9VaWFrSXZVSHBvdDJyNzBxZEp2?=
 =?utf-8?B?cVc4dGJJcDU2U0ErYzhRWHRZVHoxTWY2L1lNOCtrMmx3bkpqa05RSDNySUNR?=
 =?utf-8?B?Tmk4RXlXeUNLek9oZVA5dWttdy94d1FrVnpTaUxPYzlXUE9BMEVic09BbGJu?=
 =?utf-8?B?LytpcGNUeGJyRENBaHhXUVRmYS91OUJ4NUZWSTAra1NYRTRQTVZtSGRHMndX?=
 =?utf-8?B?QVZkbUNxeDI4bWVHTkRMNmNuNCtwNGoyajFmSTdwYTNtN3BjSkdvTkxrZW54?=
 =?utf-8?B?UVlKTngrK2V3R3k3QWs3YXN6Uk5IR3ZPYlM1YXUvOFJicXRCL2dxNlpreERn?=
 =?utf-8?B?N29rZ21jT3BlSUwzRG9TR2hjMzk1cTlURHRlUHJHaXdJU0ppSEsxY09Mdldi?=
 =?utf-8?B?V3VuTGxaTkN6bVloZ0EydmgrYzNENm01YlJ3eXgwMVF3cTRwTGxxYk41b21j?=
 =?utf-8?B?UFBjamdlV2FhSE81UDJYMm90RjBLckRiWjhTTHFsekwxN01IbGw4VzVNY1RG?=
 =?utf-8?B?V2dGZXZBSkh4WUZITUpTanM2SlVoOGZ2WlQ5WU93Ri96ZTNPaTBjaTJkcm4v?=
 =?utf-8?B?VHl6U2dmN21lTzVuZ1dTYVpWYnNZcUZKVWlaSVl4Z2dnbW00ZURoT0hiT0Z1?=
 =?utf-8?B?SXRDbzhYSFlwSXl3TWFvVmk5YUJOQ3pLWlFtVWs2a0s5d3RaSXlzTzhZbkwx?=
 =?utf-8?B?d2xjWVgveGgzSytMT0tzd1pPUmFZY3NHZFVzYU8veCtzbFZmK0xjaFQwSjN6?=
 =?utf-8?Q?wFx2TprMpt8piolLBWQhcaP/W?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9dd1d45-ce54-4fba-b16a-08dd6ffcf0f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 02:37:12.3918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 285oNYU7GwIWw4qQ8Tk1FK0E/S3ajcZC5A/mtQ3aWSxlwcLhB3Qrsx7si2zVAE4J0P1Xvjmh4HRNzQabbkPKKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8753

Hi Frank,

On 2025/3/28 22:26, Frank Li wrote:
> On Fri, Mar 28, 2025 at 02:48:17PM +0800, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> By default the amphion decoder will pre-parse 3 frames before starting
>> to decode the first frame. Alternatively, a block of flush padding data
>> can be appended to the frame, which will ensure that the decoder can
>> start decoding immediately after parsing the flush padding data, thus
>> potentially reducing decoding latency.
>>
>> This mode was previously only enabled, when the display delay was set to
>> 0. Allow the user to manually toggle the use of that mode via a module
>> parameter called low_latency, which enables the mode without
>> changing the display order.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> ---
>> v4
>> - Improve the comment expressing
>> v3
>> - Improve commit message as recommended
>> - Add some comments to avoid code looks cryptic
>>
>>   drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>> index 88f8c16a451e..7f6251f7becb 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -25,6 +25,10 @@
>>   #include "vpu_imx8q.h"
>>   #include "vpu_malone.h"
>>
>> +static bool low_latency;
>> +module_param(low_latency, bool, 0644);
>> +MODULE_PARM_DESC(low_latency, "Set low latency frame flush mode: 0 (disable) or 1 (enable)");
>> +
> 
> If there are two malone instances, it will impact both instances, is it what
> your expected? Prefer use sys interface to controller it.
> 
> Frank

Yes, that's we expected.
I prefer to say that we use this parameter to adjust the behavior of the
firmware. I thought about enabling this mode by default, but our team
prefers to add a parameter mode, but keep the previous behavior.and then
enable it as needed.

Thanks,
Ming

> 
>>   #define CMD_SIZE			25600
>>   #define MSG_SIZE			25600
>>   #define CODEC_SIZE			0x1000
>> @@ -1581,7 +1585,15 @@ static int vpu_malone_input_frame_data(struct vpu_malone_str_buffer __iomem *str
>>
>>   	vpu_malone_update_wptr(str_buf, wptr);
>>
>> -	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
>> +	/*
>> +	 * Enable the low latency flush mode if display delay is set to 0
>> +	 * or the low latency frame flush mode if it is set to 1.
>> +	 * The low latency flush mode requires some padding data to be appended to each frame,
>> +	 * but there must not be any padding data between the sequence header and the frame.
>> +	 * This module is currently only supported for the H264 and HEVC formats,
>> +	 * for other formats, vpu_malone_add_scode() will return 0.
>> +	 */
>> +	if ((disp_imm || low_latency) && !vpu_vb_is_codecconfig(vbuf)) {
>>   		ret = vpu_malone_add_scode(inst->core->iface,
>>   					   inst->id,
>>   					   &inst->stream_buffer,
>> --
>> 2.43.0-rc1
>>

