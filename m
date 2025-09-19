Return-Path: <linux-media+bounces-42744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA6B8840F
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4696D174FAD
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 07:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C9C2EA48F;
	Fri, 19 Sep 2025 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="1ftOaItW"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021087.outbound.protection.outlook.com [52.101.65.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC482D3EC7;
	Fri, 19 Sep 2025 07:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268151; cv=fail; b=bK5R4HPHfC9EcoHxGSvm0Ob9qXGiqy7H7dMwc6jLKJd2meXn397iv2A0C4CTB7l5gh1Gk69IU0aAx4hRb28zUWjDM42aTJvZ2dhyoPFM3fwr6C5oDMJhr1KrJV7UKslHrzvqZCz9tUo7efAcTDBSxYgzWaMe/7ZoEkr+ivH4G1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268151; c=relaxed/simple;
	bh=70xMfKMS1oX8nk061JswHrLMSAVlnyjX9xnKtzcAF5w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R1qUJEdJWiX/LOCt5fiYFSsHXGlzEKuRWHf1jkWIbJ6j3mggXO/uDBk+918pO6Rp3BGey3/nyVk4ktIib/U8kEgM7NAeHOHcBS0NqaUG+t4xOdCOALyeynRmVyJrKBYYDuaaKhyl3HX15/GSunRQmM/DbkHTaMrk+no3tGokafE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=1ftOaItW; arc=fail smtp.client-ip=52.101.65.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFS26PC7gSBviwpMOP0WjkhTH4ySHAUKgxQqSqex2EEw/eRFG5gAdD0svmoIbV6Bdr15P/ket/fj9YqIa3/1w1Q/MxNJnQls0MPCTzBgCxeAN4p/q3iB6CofWIcGoCjCAkvgfP9AJ6nJmLo5R8cTYPdM/EzkzMvvjP3DvRhTbaQhqM6atgvQAd2f7JRmC1/o6bO1v6vxFqkMdDPKeA2q5aXn4z/i/xkzdRCN+MRMl4acHkql2T6CW2vTxHdyFn+ID0AspSQg/MxsRgS+zNzG7KF+zWnQOOI/CZTupLLMjD/z3lbyDvaaHgR2nB8OQljee9sEsPdhLAtGtCYVKrfq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9y3qQCUgJ1ms4EQWmC7Qlxn50RxR80bEiBIzLAeKX4=;
 b=Jqv+m2wodA4x4GoxX+c4t0EWeHeDHEOI71V3ho44RPC8heIkFD6WbU/VTsYbkmnkcVC1woIKtpR75p3oSoXV8q2UTa4/7gB0Ra0CciIcOuxeXT8p5sMgC+MQL5/mkDLScprosqXWtGvPuDYtAVN1XZC9WA0UIJnfxQbIwgpz01GU9r+HYWbKSfBSw9bfHZ72O/ZddDc6RoTACdpwptTCUm99sWYEBXKCYPhaajInjFuhoYvpNOwsyuKBLFqffF92H356OMRkD+vcNC5WXLyCy87GvBnxzFVyY9LdwTkcNJ7ldXSgyo27M7GxkjOEi15LsIqYazuJFEj7p5amToc0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9y3qQCUgJ1ms4EQWmC7Qlxn50RxR80bEiBIzLAeKX4=;
 b=1ftOaItWOAsbDPhzJoiWKyG8w94zAKXVZwQzLj+T0eYvsj1Z4GerFdwMlj8yCwNCarnvSLHRv3UjTpXvlSR+FxEJNjpXH6N5XgW34q/ckAl16FpdNr68QIorQYRn5CLPFm0T3ag3fQmPr1AK64ecjmetGGiO+1OW7ZJpD6BDLZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com (2603:10a6:20b:512::15)
 by GVXPR08MB10542.eurprd08.prod.outlook.com (2603:10a6:150:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 07:49:06 +0000
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726]) by AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726%4]) with mapi id 15.20.9115.018; Fri, 19 Sep 2025
 07:49:06 +0000
Message-ID: <ecb98821-63aa-4d20-b9ac-ac15f069985c@wolfvision.net>
Date: Fri, 19 Sep 2025 09:49:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/17] media: rockchip: add driver for the rockchip
 camera interface
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-7-af0eada54e5d@collabora.com>
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240220-rk3568-vicap-v11-7-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0036.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::49) To AS4PR08MB7735.eurprd08.prod.outlook.com
 (2603:10a6:20b:512::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7735:EE_|GVXPR08MB10542:EE_
X-MS-Office365-Filtering-Correlation-Id: 7480b6a6-9e9d-4862-5a03-08ddf7510288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2xkQ1R5TDd4UjdkUWhBbmdTU1l3WW8wUWZSd2ZWM3cxR1dKV2R6WUxnWWNO?=
 =?utf-8?B?VkFSVXFQYi9oblFDNlE4VFRHT0JMbDh0cTZGVHBFTzYvVGJxbUlndi9PUm90?=
 =?utf-8?B?QTRQbktRMUNCdXc4V05XQUxTb2IwWnRzaTB4NEFiNEZRS3QzNnQrdld0ZFVl?=
 =?utf-8?B?L2tURFI3dXA1NUp2TVdSTkl5b21VdW8rcG9iTXhmbEZRMzlaT00rN1A5WHAr?=
 =?utf-8?B?d1Zld25tQ1dEMTZLZUdhQWZyVTdFZWNsSVltUTFqeHFmTHFrYXZMbjVPclgv?=
 =?utf-8?B?VEUva1AxOVRGbXNTWTlRTTdnaFdybk5scVJqL2kvYnRkVXczY3JQekpPUENJ?=
 =?utf-8?B?U3ZKbG1lZzhkck9zaEphNXZ2b3ZIRkJzWitnOFZ1M2o1S0M4bnBCZnZwd2JE?=
 =?utf-8?B?WnNjU21Pbm5qbUZBZ2VndVY2ZE1ETEVXZkxibmFib1hRZ09YczlSQ2dKdDg0?=
 =?utf-8?B?UUw0QVBobkh2bWNvalNkbWZpRzYwZDJRQlNYa1FoSkNJUTZkSEdjVUdkUFNC?=
 =?utf-8?B?Wnh3RG15SGtWdXNRSVJ6elZqZlhOUzBlc0syNTFQWHJBOXdLNUQ3eDYxZGdk?=
 =?utf-8?B?TmQ4NUlJV2JHTEZGMmQwWVFnelRqUVFvVjdqb1dsOGJleXlUa3doK1gzSHhu?=
 =?utf-8?B?bEhnMjBOUWVvaWpBYTZLQUw4OE5ybHQwUmt5OE1jQUxaSDRvenNPQUZtUnBk?=
 =?utf-8?B?TU9IOVBxdVNYSFVnV1VteXkxTWJxMzc5YTZuM2pQRjMvUGMzOG10QTZKaXVG?=
 =?utf-8?B?Q0s1L3N3RW0vYzJIYmlTZWtXRVUzeWFHTWFnbUF2S0Zrb05Eak4rdWxrWjNN?=
 =?utf-8?B?SHJ1Y0JoWXQxQUQvUlphTXBSamQrbXBjYUVVZlhPMU9hZ2Examt0L1pXSzZB?=
 =?utf-8?B?bDNlaXgxNGpsRzlkUllWbnVibFlueElwR3ZMSVZwd3BtQXdOOXpWV25IRHV0?=
 =?utf-8?B?aUxDWmRDVGdRQVlkTVVNVmtSYzhnWUpPUWp5MlEvR1hheng0QTRnK2tGOXE0?=
 =?utf-8?B?d1RyaEhBVmF5YXFWTnJ3RlNQU2FxQ3U4NEEyWlM1MFdtWCszd1lOSWRoL0ty?=
 =?utf-8?B?UXZlcjhFVnJIV3hGR1pZRGhlWXcrNGpDM0hvSG5Qb0h5ak1KS2d3bk9wM3lT?=
 =?utf-8?B?Z2pmbW9JTjM2ZEIxdWxRTTJXRmNHbU9CbFZRUEsvNlRuZmpQaUhHK3A4b0w4?=
 =?utf-8?B?WkxvaHcwUDh1TlU3KzUwR1VkK3N2YXY5a0xsZWNxc0FoNXI3bVIrQlFwL0tS?=
 =?utf-8?B?dmNLK21zdlVrNmJxNGFURHRMcXZna05ZNHJEalJqbmRxSThPTXNBRHBmQUpa?=
 =?utf-8?B?MjFJdWgyVmt3L01jTExMenRXMXdtUnNBZnBLTVdZZkMyeU92WVFibDBHUEJS?=
 =?utf-8?B?SEtqSGhyZ2F5MS9taHpxRE5ML2ZBL3FMQjQzRW9uKzZORldYSWlQRkd1SDZG?=
 =?utf-8?B?T1l5YjYzUWEveU1qaStuTnBKbkhsWW54aTdpSTdQa2xKclhYdjkwUTQwTHJt?=
 =?utf-8?B?UjBmY3h1OUxVL2hnSEZqOFMrWGhaazNMQVBxTm5FZlN6bTZMTXJzZTJyMTlu?=
 =?utf-8?B?bjMvSnZxZzhBTEJWckxza1FpRkdCSDBZWXNQRmJJWUZwYUhwUzc0b3U0Yk5u?=
 =?utf-8?B?YVY4Z2t2SXkzcHE4Tnp6bzdWU2lsdktrczJXTzJhQmpSb0hvRTJWazVMdEpr?=
 =?utf-8?B?WnVKV2w0SkJLUkh4aHFZMjNpRFFLczNXQ2huSE0vM2JMUFR0ZDBDTW96ckc0?=
 =?utf-8?B?QklQMmF3bzhYck1zQmVNNjFZcVZMUmJwUVN3ck4yN1pubU41N250THNCRmth?=
 =?utf-8?B?d1gxMi93Qnk4RkJES1E4eDMxQURjNHVWQ2VHamdBcDhVS3ZDMEZ1dHdoM09v?=
 =?utf-8?B?QzRxQnpWTlR1c2JxanNTcXRnOGplQ1U1WnFvZUlTdzRobUxiTUhpeDMxMUJi?=
 =?utf-8?B?bUtDZWx4SjZnMU9pM2lUTDVkVW9RSzhzSytObjl5U1RkNUkwQ21tcCtiNEta?=
 =?utf-8?B?YnhHaHU3b1RBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFhBNVlEL0p3ZXJHSHBVVDk2V2xLT0ZhdERCSHlMTnArUlRFVkZUZWVvVllz?=
 =?utf-8?B?TDYyMERkUjRhaE1oVUx5S0hLZHRjRXduaDcvMEtudTJYREZMdUtqVVFRK0Va?=
 =?utf-8?B?bFR6dE9TWXVZWDNiaUIrTGdlRmk2V0Vwbk45OXdrSW5QNTEzNkN5cGFOZFc5?=
 =?utf-8?B?eVRFUGtxUmI4K3A0cVYrMzZQUExOeGtLZGVqdkJLR2g5Q2FRME9tUzBFY1dl?=
 =?utf-8?B?dFlINGN1L3MrZW9tYWpSend6Z0o1d1FjVFpTaDk4em1sVjJHUzRVdVZtVm9J?=
 =?utf-8?B?NkJTeGthd3NDeHduMlIvQjV2b0ZMQXNvT2lQd2hsdUlscHM4aWhWY2pyaW40?=
 =?utf-8?B?UGxBdDNqeGxSZUlEb0cvbmMvV1FQcFdyOGxyWk1RdVhYS0xqZ0dZc3RPZDBT?=
 =?utf-8?B?emM5K21kK0MzUkhlRzRldmpvNXpnNnp0eHlDVVhKUi9kYk82cGpwVzdBQjdS?=
 =?utf-8?B?YVNEeXZGWlZCeWpRbW4vTkZzR1FvQWVjRk5kalp4b3pMMTRhREZ6YWJGUjYv?=
 =?utf-8?B?R1M4MHNQZDRRY3VCM1pEa21FWDJmWDYvVWJveW0vekhReWMvZFV2NGtlR0I5?=
 =?utf-8?B?L09uUnVwUzBmMHlmdnVBQ2NoaFVnaEFsYzZTejNUSW83L0xFOFhoS3l2ekM4?=
 =?utf-8?B?SkN2Z1NOUm5SVW84aEdxY0RWMFdZZDc2cmJNWnd2V0JCMDRKVGt3VlNna0pS?=
 =?utf-8?B?Q0FOY1JYNGRjajY5MElPK2hNWVlxT2xjekpSVGRjRktrQmF6ZkhtU0lnc1du?=
 =?utf-8?B?SFhHT01RaFprY09mRDVnck00WEF2S1puMGVXSHBOMnpSZzkzaS8zcyt3aHIv?=
 =?utf-8?B?Mmh1YXVoUi9XVThnS2dQTTh2L2pHOERiTlU0VEdpVncrOVFGaFo5UnA2UnVw?=
 =?utf-8?B?YVMzUHNucDVXTjQxQ1NMU0xnRnoxQVMreUFnWHRGYzlnejA3ME5CT2Vza0Uy?=
 =?utf-8?B?TG9XOXpxcnlOUkozRjBZWTh5elcvdXdGM3Y5TWRMUDRJUi9RaWxJTlFxMU13?=
 =?utf-8?B?dUZSVnVTUzQ1bk9qSkRBVk1kcnVZMXFxNHpPU0ZHdHVPUUQyRzlPTk9MTW0y?=
 =?utf-8?B?d1BJeXRjUWVOeFFjOUx3ZjAwVmZpdUQ5Vnptbm5YL3ZkcVBMd1orcEEycjA4?=
 =?utf-8?B?TldpZlRtUEp0WGlEaVlvUDJzdFhYRnRqQ3J5V3ppYTRVZnhmUVJvQWVGTHI1?=
 =?utf-8?B?UmZEUjF4SzNPajFXZzhNL0tOcHBWMHlhQThDOTh5RTh0dFplTnNDRjhHdGNr?=
 =?utf-8?B?dXlsd1RQeVJhMjFpVjFrblc1WHFlbjBXOXM2M2F0eDl5MExvY2FGTGRkSUc5?=
 =?utf-8?B?U2hTWE5XQXd5NjdwZFZSM2JuSDAwcm1LV2NWVURmZm5kR2V5NWFQcDlRQVQ1?=
 =?utf-8?B?YWVUa0lHZ01pUXlXb0FmSUV3cXdsSUZHdzM5Tm5saCtWSERhQk9Ya1cyalBs?=
 =?utf-8?B?RnBqUVhjUlFUSnhVNlJKWVI1bmxZVHFVUkhFTUg0OU1RV0ZBU1Ixci8vYk1z?=
 =?utf-8?B?THAzWUdReDM1SldiRkYrTXRYbndsbXpXVmpKVGk3WnlnMHdheEVRMUJiK3FV?=
 =?utf-8?B?R2RFVUI3c2FiVTFTTDZVWTkzekxiYVN2OXFaNnNPclMwZi9YS2lDUVg2THdZ?=
 =?utf-8?B?RHc3amlVb3hmY2VYR2ZoNUVSTzJSZ0IzSW05bHFhc2IzM3l5aEdiTjVibVJV?=
 =?utf-8?B?QUtNekIxTjEwT2xMWWhLZDlub21BR3Y2TjU5eDhLQnFFTkY5NkJRbEQ4MFYw?=
 =?utf-8?B?M3FrRUIvRHZWK1hBSXBCbzhOeXpYR0J1QXljaDBiUzJpZVl1M1ZPNnc1Umpx?=
 =?utf-8?B?VWdxTDdXd3RGUXZ4TC9rYmsySjZZNEczbUo1elpjUXcrTWtSbUEybEN5Zmxk?=
 =?utf-8?B?VXF1d0w1VGVRN1FVNzI5NS91VHZYMlluTVpKcG50MjQ3Nzg3Nks0Q0dxQ1NH?=
 =?utf-8?B?SnZmU3pZcGltblMvOUtPeE50TkQyZkExTnFzSWxBVkl0KzYzN1ZmR1BUNmxs?=
 =?utf-8?B?dWV0R0syMDJFMTdwYU1kYmd5VVFjTzhSSnZUanJYN1orR2h5TDErblYyYWdO?=
 =?utf-8?B?QzljMm9iUy8wTDBxMmxPdDMvVk5MeXNYWWtybm0xNlQwVUdaMWJvcHYyd1dl?=
 =?utf-8?B?bW8weC9oOG5JUkxMUERwaWs2TkFOR3Fad05TWjk3SC9COVU5TyszVC8yY2tK?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7480b6a6-9e9d-4862-5a03-08ddf7510288
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 07:49:06.5055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvG3sZUUUSpdDwpO/2LEqbNdqbTFTxWAQI2sCJMHPO7S2z3T6+lzLTBSPzQYXuGKl5sL7BaSUVNhQLHXRp98RAfWLYacEmTSxOHhVpOJERU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10542

Hi Michael,

Am 17.09.2025 um 17:38 schrieb Michael Riesch via B4 Relay:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add the skeleton for a media controller centric V4L2 driver for the
> Rockchip Camera Interface (CIF).
> The skeleton features support for the PX30 Video Input Processor (VIP)
> and the RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  MAINTAINERS                                        |   1 +
>  drivers/media/platform/rockchip/Kconfig            |   1 +
>  drivers/media/platform/rockchip/Makefile           |   1 +
>  drivers/media/platform/rockchip/rkcif/Kconfig      |  18 ++
>  drivers/media/platform/rockchip/rkcif/Makefile     |   4 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   |  54 +++++
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 260 +++++++++++++++++++++
>  7 files changed, 339 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4a18421a53a1..6c023dc54ece 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21770,6 +21770,7 @@ S:	Maintained
>  F:	Documentation/admin-guide/media/rkcif*
>  F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +F:	drivers/media/platform/rockchip/rkcif/
>  
>  ROCKCHIP CRYPTO DRIVERS
>  M:	Corentin Labbe <clabbe@baylibre.com>
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
> index 2f6f77afecfc..54b698c4cd2c 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -3,6 +3,7 @@
>  comment "Rockchip media platform drivers"
>  
>  source "drivers/media/platform/rockchip/rga/Kconfig"
> +source "drivers/media/platform/rockchip/rkcif/Kconfig"
>  source "drivers/media/platform/rockchip/rkcsi/Kconfig"
>  source "drivers/media/platform/rockchip/rkisp1/Kconfig"
>  source "drivers/media/platform/rockchip/rkvdec/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
> index 33e24b47735c..522a7d3e30b0 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += rga/
> +obj-y += rkcif/
>  obj-y += rkcsi/
>  obj-y += rkisp1/
>  obj-y += rkvdec/
> diff --git a/drivers/media/platform/rockchip/rkcif/Kconfig b/drivers/media/platform/rockchip/rkcif/Kconfig
> new file mode 100644
> index 000000000000..efd82ac35bd8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/Kconfig
> @@ -0,0 +1,18 @@
> +config VIDEO_ROCKCHIP_CIF
> +	tristate "Rockchip Camera Interface (CIF)"
> +	depends on VIDEO_DEV
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on PM && COMMON_CLK
> +	select MEDIA_CONTROLLER
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This is a driver for Rockchip Camera Interface (CIF). It is featured
> +	  in many Rockchips SoCs in different variations, such as the PX30
> +	  Video Input Processor (VIP, one Digital Video Port (DVP)) or the
> +	  RK3568 Video Capture (VICAP, one DVP, one MIPI CSI-2 receiver) unit.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rockchip-cif.
> diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
> new file mode 100644
> index 000000000000..c6837ed2f65c
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
> +
> +rockchip-cif-objs += rkcif-dev.o
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> new file mode 100644
> index 000000000000..43a9390526d8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _RKCIF_COMMON_H
> +#define _RKCIF_COMMON_H
> +
> +#include <linux/clk.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +
> +#include <media/media-device.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define RKCIF_DRIVER_NAME "rockchip-cif"
> +#define RKCIF_CLK_MAX	  4
> +
> +struct rkcif_remote {
> +	struct v4l2_async_connection async_conn;
> +	struct v4l2_subdev *sd;
> +};
> +
> +struct rkcif_match_data {
> +	const char *const *clks;
> +	unsigned int clks_num;
> +};
> +
> +struct rkcif_device {
> +	struct device *dev;
> +
> +	const struct rkcif_match_data *match_data;
> +	struct clk_bulk_data clks[RKCIF_CLK_MAX];
> +	unsigned int clks_num;
> +	struct regmap *grf;
> +	struct reset_control *reset;
> +	void __iomem *base_addr;
> +
> +	struct media_device media_dev;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_async_notifier notifier;
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> new file mode 100644
> index 000000000000..a8514e7d3249
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +
> +#include "rkcif-common.h"
> +
> +static const char *const px30_vip_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"pclk",
> +};
> +
> +static const struct rkcif_match_data px30_vip_match_data = {
> +	.clks = px30_vip_clks,
> +	.clks_num = ARRAY_SIZE(px30_vip_clks),
> +};
> +
> +static const char *const rk3568_vicap_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"dclk",
> +	"iclk",
> +};
> +
> +static const struct rkcif_match_data rk3568_vicap_match_data = {
> +	.clks = rk3568_vicap_clks,
> +	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
> +};
> +
> +static const struct of_device_id rkcif_plat_of_match[] = {
> +	{
> +		.compatible = "rockchip,px30-vip",
> +		.data = &px30_vip_match_data,
> +	},
> +	{
> +		.compatible = "rockchip,rk3568-vicap",
> +		.data = &rk3568_vicap_match_data,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, rkcif_plat_of_match);
> +
> +static int rkcif_register(struct rkcif_device *rkcif)
> +{
> +	return 0;
> +}
> +
> +static void rkcif_unregister(struct rkcif_device *rkcif)
> +{
> +}
> +
> +static int rkcif_notifier_bound(struct v4l2_async_notifier *notifier,
> +				struct v4l2_subdev *sd,
> +				struct v4l2_async_connection *asd)
> +{
> +	struct rkcif_remote *remote =
> +		container_of(asd, struct rkcif_remote, async_conn);
> +
> +	remote->sd = sd;
> +
> +	return 0;
> +}
> +
> +static int rkcif_notifier_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct rkcif_device *rkcif =
> +		container_of(notifier, struct rkcif_device, notifier);
> +
> +	return v4l2_device_register_subdev_nodes(&rkcif->v4l2_dev);
> +}
> +
> +static const struct v4l2_async_notifier_operations rkcif_notifier_ops = {
> +	.bound = rkcif_notifier_bound,
> +	.complete = rkcif_notifier_complete,
> +};
> +
> +static irqreturn_t rkcif_isr(int irq, void *ctx)
> +{
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	return ret;
> +}
> +
> +static int rkcif_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rkcif_device *rkcif;
> +	int ret, irq;
> +
> +	rkcif = devm_kzalloc(dev, sizeof(*rkcif), GFP_KERNEL);
> +	if (!rkcif)
> +		return -ENOMEM;
> +
> +	rkcif->match_data = of_device_get_match_data(dev);
> +	if (!rkcif->match_data)
> +		return -ENODEV;
> +
> +	dev_set_drvdata(dev, rkcif);
> +	rkcif->dev = dev;
> +
> +	rkcif->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rkcif->base_addr))
> +		return PTR_ERR(rkcif->base_addr);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, rkcif_isr, IRQF_SHARED,
> +			       dev_driver_string(dev), dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq\n");
> +
> +	if (rkcif->match_data->clks_num > RKCIF_CLK_MAX)
> +		return dev_err_probe(dev, -EINVAL, "invalid number of clocks\n");
> +	rkcif->clks_num = rkcif->match_data->clks_num;
> +	for (unsigned int i = 0; i < rkcif->clks_num; i++)
> +		rkcif->clks[i].id = rkcif->match_data->clks[i];
> +	ret = devm_clk_bulk_get(dev, rkcif->clks_num, rkcif->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +
> +	rkcif->reset = devm_reset_control_array_get_exclusive(dev);
> +	if (IS_ERR(rkcif->reset))
> +		return PTR_ERR(rkcif->reset);
> +
> +	rkcif->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						     "rockchip,grf");
> +	if (IS_ERR(rkcif->grf))
> +		rkcif->grf = NULL;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	rkcif->media_dev.dev = dev;
> +	strscpy(rkcif->media_dev.model, RKCIF_DRIVER_NAME,
> +		sizeof(rkcif->media_dev.model));
> +	media_device_init(&rkcif->media_dev);
> +
> +	rkcif->v4l2_dev.mdev = &rkcif->media_dev;
> +	ret = v4l2_device_register(dev, &rkcif->v4l2_dev);
> +	if (ret)
> +		goto err_media_dev_cleanup;
> +
> +	ret = media_device_register(&rkcif->media_dev);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register media device: %d\n", ret);
> +		goto err_v4l2_dev_unregister;
> +	}
> +
> +	v4l2_async_nf_init(&rkcif->notifier, &rkcif->v4l2_dev);
> +	rkcif->notifier.ops = &rkcif_notifier_ops;
> +
> +	ret = rkcif_register(rkcif);
> +	if (ret) {
> +		dev_err(dev, "failed to register media entities: %d\n", ret);
> +		goto err_notifier_cleanup;
> +	}
> +
> +	ret = v4l2_async_nf_register(&rkcif->notifier);
> +	if (ret)
> +		goto err_rkcif_unregister;
> +
> +	return 0;
> +
> +err_rkcif_unregister:
> +	rkcif_unregister(rkcif);
> +err_notifier_cleanup:
> +	v4l2_async_nf_cleanup(&rkcif->notifier);
> +	media_device_unregister(&rkcif->media_dev);
> +err_v4l2_dev_unregister:
> +	v4l2_device_unregister(&rkcif->v4l2_dev);
> +err_media_dev_cleanup:
> +	media_device_cleanup(&rkcif->media_dev);
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
> +}
> +
> +static void rkcif_remove(struct platform_device *pdev)
> +{
> +	struct rkcif_device *rkcif = platform_get_drvdata(pdev);
> +
> +	v4l2_async_nf_unregister(&rkcif->notifier);
> +	rkcif_unregister(rkcif);
> +	v4l2_async_nf_cleanup(&rkcif->notifier);
> +	media_device_unregister(&rkcif->media_dev);
> +	v4l2_device_unregister(&rkcif->v4l2_dev);
> +	media_device_cleanup(&rkcif->media_dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static int rkcif_runtime_suspend(struct device *dev)
> +{
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +
> +	/*
> +	 * Reset CIF (CRU, DMA, FIFOs) to allow a clean resume.
> +	 * Since this resets the IOMMU too, we cannot issue this reset when
> +	 * resuming.
> +	 */
> +	reset_control_assert(rkcif->reset);
> +	udelay(5);
> +	reset_control_deassert(rkcif->reset);
> +
> +	clk_bulk_disable_unprepare(rkcif->clks_num, rkcif->clks);
> +
> +	return 0;
> +}
> +
> +static int rkcif_runtime_resume(struct device *dev)
> +{
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(rkcif->clks_num, rkcif->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rkcif_plat_pm_ops = {
> +	.runtime_suspend = rkcif_runtime_suspend,
> +	.runtime_resume = rkcif_runtime_resume,
> +};
> +
> +static struct platform_driver rkcif_plat_drv = {
> +	.driver = {
> +		   .name = RKCIF_DRIVER_NAME,
> +		   .of_match_table = rkcif_plat_of_match,
> +		   .pm = &rkcif_plat_pm_ops,
> +	},
> +	.probe = rkcif_probe,
> +	.remove = rkcif_remove,
> +};
> +module_platform_driver(rkcif_plat_drv);
> +
> +MODULE_DESCRIPTION("Rockchip Camera Interface (CIF) platform driver");
> +MODULE_LICENSE("GPL");
> 

Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>

Tested on Wolfvision PF5 (with Wolfvision PF5 IO Expander).

Regards,
Gerald

