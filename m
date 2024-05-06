Return-Path: <linux-media+bounces-10819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF75A8BC5BA
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 04:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D20131C2124C
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 02:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F7740847;
	Mon,  6 May 2024 02:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="N4fZW90r"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4C13E470;
	Mon,  6 May 2024 02:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714962124; cv=fail; b=NRSCJFKn2ZIdnCJAmS6CvX0mV9IpdnXy0bRMm68GGEGl6eoWis8TfLVz+jxv5vVoMNHP+RzMom6Xqs4YQ/ZPfN2W6ZXLBpHIzhwZwvNbTD9o18pSeZC3wClXyjjBGIVLkApROjWbTCP7v08jcMa4zp5/ONlQVea4Ilum6Fnqh1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714962124; c=relaxed/simple;
	bh=0PCM8gp9qfnH3019bGE0gw8iqAZ6sCGR/2IbDfXD8O8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YXtC5/pMYnTR1kCXfOtVyxK7x/hB/kknYm3NhEbkWXbMZfS13refU7VDMCMtxbA9sHwGCbqpGXkU7Hy23zvHg16CkRXtnOhzGc7iGHNZw5XfEE+zdVaQP7Dr87iNLDfbzjpVqbaQ/oXKsNXryHwviW/hQfW0CKe5nsJQftT9zi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=N4fZW90r; arc=fail smtp.client-ip=40.107.21.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fltqQH+GjTPUoBwrwq68p9RiSCru7sVk8kuuiQmzBqOlaGa4avj3Nlmyrt3RCqcUmxxiOi7XDhdwJreZXviqWJaMjsNfwcaZllhNFKvzX4dp84fD1nM2f90q4CIkX0Mk6Q3ZuA5W2TX6PA3lyT0JvaWZrw2LsLr0lOSCbjqesRSS7wmL1NFU8LPJjD3lh7oRua2bhW6MgV78ooKFauZLFS1yRFszArNPJSzKtUWZJ1DQxEEvphW5QBrz+HPQJImQodDYLsL7gqmD8QCJOLlapJ/6WZ1Ofi9V8X/PEiek5thtlh/4Fjtd+DjspxmSYjAq2Zs+51ynLd5vbnqLJLpz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zhkXUW5x7iolAlo4Bi5d3PLFdmZQ544fgRhnBoTV+U=;
 b=NE2ENuzbJCDMS0RVX0iTcW80LAN7tgjNE6Ucg7ePYizpNESFS5r+19LmncwI8mYpm2IKWJYk7I+qFvRMJJ8Qa2oZXmZfFTD8+6DMErBh39UYbLLcDS0cnzIDWjr2LiN9xk9vSKQo/TI2qko2ixjQjkAqSn561I9qSz6FAf+BHh2nMwq4qCToBaEirONd9njNmxHxJ127pryEoq/KLlM7p/85bvHbT0s5EQQLeEQFei5WpOSrQjYk5UwTwNZXJh0azUQwXFjcpXLSQv+xD886UxoPZr/vlptyStRpcoqmo5ndurYcQ21c7lFh11e0ZBL90oU6bOS3TRYB6k2lZBFTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zhkXUW5x7iolAlo4Bi5d3PLFdmZQ544fgRhnBoTV+U=;
 b=N4fZW90rXpnGdnP2jlna2wlN3tm2mwLtbzOKlmhRC34AEyEmr/lD3kgPXVBmWRdfY/H+Va8r0J1roCACN9tDLc1KWaXjrUWI7Xk1h0DaRL+XMOi0wWYS4nxxoo8U+rihFaTWnDQPiJ8+vXMpLVV+DOOZ0V/J2s7asdj2jM7RwjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10185.eurprd04.prod.outlook.com (2603:10a6:102:401::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 02:21:58 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::8589:eb00:ecf3:b4ca]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::8589:eb00:ecf3:b4ca%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 02:21:58 +0000
Message-ID: <5fbe3159-8ded-4d56-a778-db65d029b77a@oss.nxp.com>
Date: Mon, 6 May 2024 10:28:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: v4l2-ctrls: Add average qp control
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ming Qian <ming.qian@nxp.com>,
 mchehab@kernel.org
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240329092352.2648837-1-ming.qian@nxp.com>
 <25a33db9-3bc1-4d90-83d4-0bdbea9bc5d8@xs4all.nl>
 <46ea74867fee6f0dbefb4c2d24a682d15beb41e7.camel@ndufresne.ca>
Content-Language: en-US
From: ming qian <ming.qian@oss.nxp.com>
In-Reply-To: <46ea74867fee6f0dbefb4c2d24a682d15beb41e7.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10185:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c6fc8c-4d81-44c9-fa8a-08dc6d734e72
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFU2aHRKc0dTTi9MZW81amF5RVpLeU1veWQ1UVloUmx6Tm1DRnFFeDVHRk5t?=
 =?utf-8?B?V0REN0U3WTdPaDlhaGdJN3JUV1pTQjRvRVFmRDYyVTNsSnBvcEdUdWNKeFJZ?=
 =?utf-8?B?anQ0cGxkWGRwblNrSWR4cVpDRUVRSlRGL3dQb1RDYTRVQ1QzT0xSeWgvSnAv?=
 =?utf-8?B?SStPVEd3VUNCck5rV1hHUFV2SU9keWtWdlZtK3lTb04rdUJKNHVaQ2U3azVR?=
 =?utf-8?B?eWNwT0JDeUQ0SGJxelErS1hCNlJxUklBWElHUGM2SXZwQUd2RWxvTmM1TFpX?=
 =?utf-8?B?MkJJUEZzTEdqQlUyVlFacWVwVnY1RkUwNHZKLzhOcDRSdG1LakZXcVp1ZXRT?=
 =?utf-8?B?dVRnRjQ3VzkzNFNRczJMajlZcHdRbmNRNFluZWtLNlI1Z2FKTlVIWnlKWXUz?=
 =?utf-8?B?K1ZvWGMrK3Z0NU5lTktYTDA2UHpmNzZEeTFlV0xJRlBxSDhvV21PTjFLQ1ky?=
 =?utf-8?B?RDNjbHIzVzNoSHlJaXE1QllCaFhDMjk0TFVmUGR3VVZ2VjZ5L01PZ1BBR0RW?=
 =?utf-8?B?YTdXQjMvQXorUFpXL0w0UGtqM3NKQTJyUlJYMXhaQklWWi9VdlNVdkJibmlK?=
 =?utf-8?B?Y3N1RVF1ZWF1blJYUDRDQ0MwM0tTTG9WUzVnZ3lzMTRHcXpVM0hwS20yMEgy?=
 =?utf-8?B?bndVU3RZYytXMllXUW5PbkYycDBBWE82bk1MRU55aG9MUGdrWE5VV0t2d2Uw?=
 =?utf-8?B?c3NEQldyYkdzR1F5dGlLM1M1QzVhZnphL0NKRjh1SThqSE9ZN042a0hmcGFy?=
 =?utf-8?B?bmh6NWRqVnBrUTZZMTJ6SWFKVHEzOEdudjRqMWJ3dGRwSmtjRWMvemxQTDZZ?=
 =?utf-8?B?Y2d0NHFPM2FVR1JxZXJKbDhZOCtMMFhSVHYyeU9IMFFmUDlTUkJyN2NhVkph?=
 =?utf-8?B?NXQ1QnRlQk5KbUtERmRmbXhITXdFc1pEckJIUnVzZWY1WFIvbXorR0ZCTlVI?=
 =?utf-8?B?Mlp5SkRCdm5WRUJFS1NmR3lZNVNTWGF5OEFKRTR5emFDNmtqVi8rcGNhZ2g1?=
 =?utf-8?B?MHRIaGkxMndwanF0bUhwZVJjZVg0cURzZGlVamVWTzBWQ2dNWFZreHRQUGRj?=
 =?utf-8?B?NFdWT2VjY21xazNoNHJXV1hGRE9URTE1bWU2UnNuMk9rcDlJWFFmWmJBVm1J?=
 =?utf-8?B?cE9WYUlzR1BDbG9tNElacE9Cb0VLcU5ETGFmbHJxMHlpWEw4bTVTczJ6eTVN?=
 =?utf-8?B?eElSOGNjMlYzdHM4Tnp2ZFY4YnowaXNwUGMzWFBNUHdQcTBJbXhKRkdqMjBH?=
 =?utf-8?B?SDNtSmFnOG9uV2l1eTJZaVhmRUl1M1JGa2Y0VmVPNXlBVEhvL0tyTHE0alBO?=
 =?utf-8?B?c3dLdHloN3NFa20zeUV2emZVdTZiYmZDZVpxYnpSSWFZOTlqbUVpV1VTdDhK?=
 =?utf-8?B?bTlHd2JENWsrbWNQdUFpTkV6TVhSbGVIZmR3by9rTWxqYmg1c2Noa0MwQ3g0?=
 =?utf-8?B?ek1DQUc4RjNyRUZMZnpZU043THppblgzRkdubDVVSVdnUVpzL1IwL3BQajg3?=
 =?utf-8?B?cS9TK1VLMzhrMis3UHUzQWY3MmdhN2NIbHZBSFZqM0kvZ3lKQnBUL3QvbUp3?=
 =?utf-8?B?TDdSSjBua3RsUXE1eGw3enFJQXdoOVNMR0w2RzZuY0JnVThCQUhZcGdiU3Y3?=
 =?utf-8?B?YXNxVkFFdXBxbHQ5K0RSVFIzMUNhV0g2M25VV0RYc0dtZU5IOGJXakdKZ1Iv?=
 =?utf-8?B?R3JGb0kwVmJFYlc1MVZkZUFSSmtpb2J5bHE5V09CSU1PSTY4VElvU1hnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkdZWHFQNTRONEVqeW1jZlM0K3ZudDg4cHd3REcrR3EyVnQwTzk4NHhZZ0JD?=
 =?utf-8?B?R25Vc2x5YTNyK25PUTNoanQ0djBEWFp1VXQ4SUUrM0p3VitxdzRRR0FrdmE5?=
 =?utf-8?B?TGVZMUNqSU5UMUJxaDRNMTRxUzVxeWVCRXF4eUNNSmw5Y1U4UDQ2emJJdTQ0?=
 =?utf-8?B?OEFrOVowMXFmbGVXODA2MU9oa1pieUlwNU94T1BIeGx5MHpHbTh5MGdXQllS?=
 =?utf-8?B?akVxbjBIcTk4c0l1MjZHMkxBbkNVNVJBNkxpVDFwYzgyTFczZklsanhZbUF0?=
 =?utf-8?B?MDg0NHBsM3BFSVJZcHJlYzljUStBWEE4YWlpQ0I0WDZIM1NGbnRYMm5NNXRs?=
 =?utf-8?B?QUpLeWNjbXlzSWsxelJ3Q2ZSZ1RyRk9Pb0EyaDZrcDlhZU12TUJYTWFTUVF3?=
 =?utf-8?B?QXRza0czaDFqQkJZR2hnaHVVVFBOQjNzWFZSdWJSZjVob3UvNUVhWHFDeGQx?=
 =?utf-8?B?cXRPSEM0R0dBYncvY1JobzdhYUd6Wjlmbko2SHczeGs1ZU55RnM5QkJBL3JQ?=
 =?utf-8?B?NGdHdnhUOWcyMlNCY3ByNHRVMDZaZVc5RVNGRWFoWk9qbGk4dE5PWEVGdGhz?=
 =?utf-8?B?aTFwUThQNkZFSFZwQUN4ZXY0WmtNRmZKNi9OeE1rTEkrVzI3RVpSTVlQK2sv?=
 =?utf-8?B?dmNEM2pEdzJOUWtvbjhRbjZqTmtnc2txVnVFZHR4aFkyd0lnVXhIb0xGSkdT?=
 =?utf-8?B?Y04yRWRNemY3dHRYWTJRNmMyRXNEaU9BNHUwaGxZRkRXdXdKTnBlOGdKN1NP?=
 =?utf-8?B?RUZxU3I3SEJhTFdkUkxiZEwzdWU2NWZCR0trbE5vLzc4OHVGYk9pQ0VSSFZs?=
 =?utf-8?B?QTZUN296bG01N09Ob1JEdi9FNTVFVlRBanN4R0EyNzBrSmZoTlg0eE9FNi85?=
 =?utf-8?B?eFRYZTV0WStabkRQTURTRHZzSDhFbVJpa3hoY2w1SStTTDJTV1A4TnJ6ZVJO?=
 =?utf-8?B?UndleUl4SG1nQ3JBRXJhSHdUZVVvNEg5QnF4Yll6THA4aytDblZrK3plNTRk?=
 =?utf-8?B?aldwM200TndBRVBMQUpXUXJybCtzMjZSR3dBc1FvdmYrRGlTdndRRWJrWEYx?=
 =?utf-8?B?SW5Qd2d0Q3VRbjlSTk5abm94SEdIMWtSTWRFcFVvbGtERkF3ejdmRDVKdWg0?=
 =?utf-8?B?cTRtRk93Szd5QzJ1WDVXZEFjVVpzV00yYTFqMTFkcFRBUkFVOUtxKzNQa0Vq?=
 =?utf-8?B?N0tkOUFrZkltUjUxbCtHWm1rWEJISHJEVDJWaW1DTjJMZmJpdTlHYWZGWXI3?=
 =?utf-8?B?czh2b1huZGd5ZkdDZWFRRXZESkNvektVcGdUVXZoNTlFSHQrMW16d0RKUVcv?=
 =?utf-8?B?THE1a2xIQmxrZjFjRlcyL3phK3Q0aEJiOGFEUEt3VnVUYks3WVN2d1l2K0J2?=
 =?utf-8?B?SnZZemNxKzFPeWhQVnlqdlB2U1krTVRYVmNPMDIyKzY0ZlV5K0pPalhKRzkr?=
 =?utf-8?B?NXpiZnVrMFJlRGJTRmx2N09pSkFTUGlDTnlsYXJCQ21NVWJCaUJXdFh3cG93?=
 =?utf-8?B?UlhqaktLWWNrcG9DNldjRC9ldDdzV3JUZjdjcmlZb1IrOEl3TS8vaVlCLzFC?=
 =?utf-8?B?b2ttNUlJWWdXeUhQQjlTYS9wQ2RnMHdUM1ZMZGlLdHovWGZaQTMrNXNZeDA1?=
 =?utf-8?B?dU5YZ2xmcEhlT2NBdnZhbWRKa2F3NXI2YU9nUXE4ZmZ2L3BjYWNsUDA1elh1?=
 =?utf-8?B?VVNVMEJLYUN6b0dHSStiTytFZVJLOUNKQUNFYVpTcU1Mc1ZiSlpBSk5BQVZX?=
 =?utf-8?B?bFpNc2cyYnNhVTdFbk04bit4Qm82RHRNZFA1bzNKTmhWOTNvRFJUMnpqTkRj?=
 =?utf-8?B?QkpUa3RCKzJLd3JjSVRCQ3AvWmZvYmE2emRkT1R5UGk4d1ArbldJZGN2UXUy?=
 =?utf-8?B?dTRNWHJYa0lpRTUzR1RHL080WUI1WHVhcWZ5SW5iQ2lvQkJUYlNITUVOakFo?=
 =?utf-8?B?UFEzU05teVY4MW4xekQ3TXdjYVdjQW90ck1aZytmeXNMK2Y3TVhFcjRlT2Jl?=
 =?utf-8?B?ZVp3eUhabmg3aWhoOXEzODc1Y3pkWkp5N2xnS0t6YVM5aHJXNmlLNldpRDdt?=
 =?utf-8?B?U1Q5bkV2K3IyQnhnZDh6UnhURXpoRHg5YUlYY2JTM3kzTFl2U1RqN2tZc3NW?=
 =?utf-8?Q?bJsdVajL/JS0OjGrY/7kfo1Js?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c6fc8c-4d81-44c9-fa8a-08dc6d734e72
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 02:21:58.7598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtwZVyzpqvPh5ERI+KwrutypsOBWJ6SBkh2JKF/b/6hjZAk5Tk0MNy1575mn/kOMxBvGtg3nwK+Eat5QM1qNXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10185

Hi Nicolas,

> Le mercredi 24 avril 2024 à 12:03 +0200, Hans Verkuil a écrit :
>> On 29/03/2024 10:23, Ming Qian wrote:
>>> Add a control V4L2_CID_MPEG_VIDEO_AVERAGE_QP to report the average qp
>>> value of current encoded frame.
>>>
>>> Signed-off-by: Ming Qian <ming.qian@nxp.com>
>>> ---
>>>   Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 4 ++++
>>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 5 +++++
>>>   include/uapi/linux/v4l2-controls.h                        | 2 ++
>>>   3 files changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> index 2a165ae063fb..cef20b3f54ca 100644
>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>>> @@ -1653,6 +1653,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>>>       Quantization parameter for a P frame for FWHT. Valid range: from 1
>>>       to 31.
>>>   
>>> +``V4L2_CID_MPEG_VIDEO_AVERAGE_QP (integer)``
>>> +    This read-only control returns the average qp value of the currently
>>> +    encoded frame. Applicable to the H264 and HEVC encoders.
>>
>> qp -> QP
>>
>> Why is this applicable to H264/HEVC only? I think it is fine for any codec.
> 
> Same question, though we should document the range, which will differ per-
> codecs. We should also document to always use the specified range, rather then a
> HW custom range. This way we don't endup with issues we have hit with other ill-
> defined controls.
> 
> Nicolas

Thanks for the tip, I will add a description of the value range in V3
patch.


> 
>>
>> This needs to document that the value applies to the last dequeued buffer
>> (VIDIOC_DQBUF).
>>
>>> +
>>>   .. raw:: latex
>>>   
>>>       \normalsize
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> index 8696eb1cdd61..88e86e4e539d 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> @@ -972,6 +972,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>   	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
>>>   	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
>>>   	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
>>> +	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP value";
>>
>> value -> Value
>>
>> Also move it up two lines so that it follows V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
>> rather than FWHT controls.
>>
>>>   
>>>   	/* VPX controls */
>>>   	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
>>> @@ -1507,6 +1508,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>>   		*max = 0xffffffffffffLL;
>>>   		*step = 1;
>>>   		break;
>>> +	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:
>>> +		*type = V4L2_CTRL_TYPE_INTEGER;
>>> +		*flags |= V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
>>
>> Drop the volatile flag, this isn't a volatile value.
>>
>>> +		break;
>>>   	case V4L2_CID_PIXEL_RATE:
>>>   		*type = V4L2_CTRL_TYPE_INTEGER64;
>>>   		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>> index 99c3f5e99da7..974fd254e573 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -898,6 +898,8 @@ enum v4l2_mpeg_video_av1_level {
>>>   	V4L2_MPEG_VIDEO_AV1_LEVEL_7_3 = 23
>>>   };
>>>   
>>> +#define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
>>> +
>>>   /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
>>>   #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
>>>   #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)
>>
>> Regards,
>>
>> 	Hans
>>
> 

