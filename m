Return-Path: <linux-media+bounces-20559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B009B5B8D
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 07:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8388B1C210DE
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 06:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45271D0E2D;
	Wed, 30 Oct 2024 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Go5Ga0g8"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2040.outbound.protection.outlook.com [40.107.22.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0263398E;
	Wed, 30 Oct 2024 06:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730268174; cv=fail; b=riqZ2PuIgPxFHXrqfaSIp3CqBwZNqU/8Ktq+jWgXgENA8FdusvUq/sjq/6Li5gJVShupX7IrIeeubPys0TB2tcoYj5h9C6OTGxhjAahwuevOvzk/vNxXaMTHUDEoeEwx9Fsm6C24SuMgCE09bKGJPYmkmY9mhFRjPoTJv+R016U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730268174; c=relaxed/simple;
	bh=POgi0pRe0zzXThKl1NxsAZq7fSq6ZppYl4c6Al0D2gQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Qofl2EyeLt2tbK3NYMdvqfuh4ewGK+7hfvQUujIs7o74CMcwOCX4BxdYfI0Xaur3onFE3xT4pvooUmNRIhflKwnt98w09mKOyjRsmOiRg40XCGbAHrgXGDhBS+Qy50Pac0/x1EBWVjZPrw3/3chyVD73ddrUBbXQAmbENPKKKlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Go5Ga0g8; arc=fail smtp.client-ip=40.107.22.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4IVN/UbwoJaX1JXZoTnHgsvGq9jdIMOlEvDKF+jAGXX1HuY/WcR1BHM/5re4uYTQnR7FIss8rJ64zhQtTgfuy764+l8KutEJR9GSSKnq5kXBuaE4VUC03GS+cTJoatD3E6/cQjp9MbEBb2QFJ0s/miA6/SEV2eAiehiNKbfJyx+iaIgqg14pFeTmx9U1hcP6PdvdLr9nCwXw99L0+GX1YJr6548rsLa/2trw+pCtHEJqpGyMGJD4o3+vG0aYLGikvTsjntKX6UrJUBnCqOT0HaWIzWOPQ+TjA99HfHUuJrf9tjVg2PVumf07fUrEQ3MFQx4M7YvlSEE0XUoic+Bqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPqbdOsInTZETwZ9ZGxRY2gjhaOkVtcSV+/PfAlCKjU=;
 b=rY8p9hhJkfYO4O8wXva7Xg0oz5Knqx8zPNNTkEi1GoD5m7fildVwFdDTnnU0GB3ofejEZCX4jx1gif8eKRBVfGCrePKsX5EQ04r/mtfHX9B6r4DmDUfH95mD2coGTwmamjmeUkRLkLuGdtyzcjizQ9C54Hd0IO6KY96i3G2fySpZwCtnvp23WWCDLq+LoxeR0W7tEGaCNYLJnM+IHVaOlqr3KoR0dyZ+YZoy0j0sbIWAgK14er6zfbJPJsMkgHL6Mas8UiQ9PidYnL3LQMNaOMSyejLlPTt73KJX9bAWl49VyXs5h8puqH6jgKt9koKbCO9mzYxZqRm/8iDwrETdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPqbdOsInTZETwZ9ZGxRY2gjhaOkVtcSV+/PfAlCKjU=;
 b=Go5Ga0g8NJlgd3S9tT3uIjLRwceUNRgVvNEazQGnFJqxWTviwQW1V/ultFT/TIrJCuHRfObY6LGJ38dQZ6NqyZvBB1TdtQCYhXclazB/IKKt+tr1aIleBa8FFkmxw9166vfs6HLxI2DTG9/gnYoTrj3LMq1s5bEjZYbPx4BgW9pSw7kPOe5IDdF2tP6I7HYQ5/Kn6Afh2pMF3HlSn9K0H4ln17/SZ1/etmjybsPjjdrH9wA/pWpf6wf91kMhykrweisCVRpe1BZTrghpSNHCzYBFVgBosa+MY5tNXFIu2lUKE0wbGWW1QL1qAq0Yr6ig6dILCjE1IbyAIilrKv1yQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8797.eurprd04.prod.outlook.com (2603:10a6:102:20c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 06:02:47 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 06:02:47 +0000
Message-ID: <7cee3358-bf8c-4ae5-a688-12ff18d4b7e0@nxp.com>
Date: Wed, 30 Oct 2024 08:02:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for
 OX05B1S sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, laurentiu.palcu@nxp.com, robert.chiras@nxp.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, julien.vuillaumier@nxp.com, alice.yuan@nxp.com
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-2-mirela.rabulea@nxp.com>
 <c32439a5-4230-4ca5-8d46-fb00d25072e5@linaro.org>
 <20241029115747.GL22600@pendragon.ideasonboard.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20241029115747.GL22600@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P193CA0015.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::20) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: f78cea82-26e5-49f4-c105-08dcf8a87a47
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?d3YyRWRFb2tUczJ2ajlORmZQNVZQaEh6eE1rMUdiVnVhZy9DVGpOemxVM2Y5?=
 =?utf-8?B?c1Y3SFlrLzRyQlZNVE8zalNpckpBejJpK0lmM1hPYXlEWGFjdWtBdy9wVVdx?=
 =?utf-8?B?ZlNmMzFhYnYyQ0N1M0toa3VqdFBZSkdwUzZ5ZGpRcEJWRUNRcWE2SDMxWjFU?=
 =?utf-8?B?bTg4TEt0d2lUUnZoekNWQjBra1Y2cmxBc1NLd2dzbWZUZDZSeW1hcmYwQlA0?=
 =?utf-8?B?eEJ5UWs0VHRzaGpML084YmErUExOZGZud1R6YjZhbGQ1clpZbnpZTHN3YTZJ?=
 =?utf-8?B?M01nRDRqOFFWSHNQZk05MkVuVmhWNnZNdk5hZkorR29ROEtjTlYwczhuS1pk?=
 =?utf-8?B?TjJvbFZxWlJMNmFudFUycGNXVjAzdGVuamdTVkxzUkpUYmxSanJpL0N5eTFn?=
 =?utf-8?B?YmllZWhSOXhqRHM3eEhDdkV4OXlzZ0NydWR5MnM5ZHNGdmZBWk5yeitZbEgr?=
 =?utf-8?B?eWFFcGNKcHI3SUVpcUY5anFOVjhWWGJoTERSakt0dFhUT1dKSWptb1hTMzRt?=
 =?utf-8?B?SkNmRXJBeVN0S01ERXUwSHB3OS9mTEZ5UWhEajlFYzFCZVhHUlQ5MUp2N3hz?=
 =?utf-8?B?eGJTOWphZVJlNElJdXBPd2xiWFhYUFhwM0NzWVQ4NW9aakdUQVpwdjZsMVcx?=
 =?utf-8?B?Nzgvcmg5dXJhamRjZHhaRjVyTUV6cEtZVmg3anZydnR0YzJldXVpK3F6dnVN?=
 =?utf-8?B?ZVpXTEZxY2hHdWw0QksxVUlBSlRrcWtDVUt3MEUrZWh0MVhFcDljTWV6UjJG?=
 =?utf-8?B?ZlVVT1BldWxHT0p3d3FHQnc5TU8zS3N3cmQ0ZUdIWmpNazM0VTJZZEQ2YWpj?=
 =?utf-8?B?bzRaM0F2bVhzdXYwZTFPREtEWE5vN2kyRXVpMW95ZG1uK3VReFlhVkpEN0JM?=
 =?utf-8?B?QURqRElIVkQ1azlaSS8ydmtQTGYzd2o2djNRU3ZVdkM1bnE2SUtrYkVxdXVh?=
 =?utf-8?B?blhoQTdQbEhhWjl4UWxKWWlhNmRaQW80YjZ4YkhqSjZBN2UzdnkyWGtvVHBS?=
 =?utf-8?B?c2RCYWRrS0FyK21Ra2YzZnFxVG5RQjNPTWNEdk9oM1ZCSWtGQkhqUWpaRjMx?=
 =?utf-8?B?eVI0VHlva1BhOHFIS1M3djdMemdqc3N0eXd2YU9kRHR5YXQrbjlJSHVSOHFF?=
 =?utf-8?B?cHpNdFJQUVUxN0ttaFZwNXA0dlZJK1R4ODhCbVhFRksvSEdaS1NUU2h0a1lI?=
 =?utf-8?B?OFIzTllIMWRjOGdRdzNBb3FGVTgrQUV4MFZPbUcySlZwWTByM0dqbnpxN2hI?=
 =?utf-8?B?MW9nWmpDOXpKOGdUbCtXNDdXbUxJZmV3eldVZFVLaTBaOUFGOGNwRGR4cHdJ?=
 =?utf-8?B?L0pPcVRXUWY5a1NiVno2Umlkb3VtUkRjQmFEaUNtOHR6Q0NJMGE5SkpUMWhG?=
 =?utf-8?B?UkxwL09wTkN0ZzlVcFdvUThQVjF4SHA3OEliYVFTSDlGRHhXd1VFM2Fkc01O?=
 =?utf-8?B?R2kxcmpHNm9UQ09Db2lBYTB5b0NYSy91MXJJY1RiRnplZ2dOT2hhVGVRekFp?=
 =?utf-8?B?bjhScWd4aGdwZ0VvcWVrb3pUSkpkMVJrQU9HbTB5SDlxU3hOUnpQVWIxK3JN?=
 =?utf-8?B?VEF1alNCODVaUDJ3L1ZDSXRsK2h6LzNpWHc4ZGRmZlFGeXk1WlhuK3VRcEVi?=
 =?utf-8?B?VGgwVERZWUw1RUNCaE1raWo1LzVFcTljd210Z1RvK0JIaVRoLzVLdHZUUmNy?=
 =?utf-8?B?ektsMHZ1QVVZbkt2b2xSa0E2Nmk5UktEL3VBUXhRdnpGS2lFbmFKTVBMeHYx?=
 =?utf-8?Q?dYeyKpEqOrTkM9RsGE3a55+GmHO5tFAlksfvEMM?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UlovYVV1bjBQaHRETjNaVVV3QXhIZ2lDdlBLVi9FNlovcHFSZG9vdzBVaHdM?=
 =?utf-8?B?OG9NVklsY0kwUGJjbldTbVd1Y1JqT0xmZDhTWGoxT2EzanBvRlZMbHVuYi9K?=
 =?utf-8?B?R2Q2QUkxcjRSd1ErWERqODUrTWt5clltRnZPb3VPNk45akFBZWpiYU84Ymto?=
 =?utf-8?B?UnYwd2pKQkVvMDZaRVFPc0Y0Rk9tS255K21Hc2ROTkJMZStQTVMzZzN3K1RL?=
 =?utf-8?B?SmQ3NFpBbUgzNFBsRy9abkE3SDBmZm9WWFhKMWFUd1Z6anphRURVUkk0L3Qz?=
 =?utf-8?B?TG1WKzR1bURESStUc0hnU3ZFdkd2cUJ5dE9aMnlxdjhQS1hUZGE1VWc3ZFVO?=
 =?utf-8?B?ZFUva2tIbGhZa3dqY2tsc2pwVU5ucmkvbnI4a29SWHFRSmx6RHE4Z2FYNUdr?=
 =?utf-8?B?SG5XQVJTTi8ydTBjRkptckUvWUE4WGx4MXhYMExrSldmanBKVTd0L1ZZNTBR?=
 =?utf-8?B?bnBBWXNkaDA0WmRPWmpSbVRLaFlPalhWOFlSSU5nR2w1OUZ4ZXhVT0JnbHZ4?=
 =?utf-8?B?U1lHcndzVXpIRUNnUUUvRnlwSjY5cnk1T0cwS3RDY2lFOVZubytPS3U5Qmhr?=
 =?utf-8?B?MU5sQTdiQkNNMGpNYXJEdlpGV3NLd0p0WHVBYVBCNGxvd25kZzlDLzFqcUZU?=
 =?utf-8?B?VC9nV2dCQWUyQTJoVnJ6dWpYMTZaWGpVQWRQc3hLK05Md0pIWDhsaitNUlFV?=
 =?utf-8?B?TE4zNWtSaVpER3dTb09UVjlUWWNZU29XY0VnZmlJUW8veDdBYXJKNjFJN0Zu?=
 =?utf-8?B?MlZtWm9SaS9ycXBTVW95NktWeHV4UTRyWlM3cStENFlNNVgxcHV4a2Rma2Uw?=
 =?utf-8?B?SjZ5WTVYOFUwSnF5UnBlL1BSRGoreHp0bURYKzlPL0xrVlFaK21uZHFVRmlr?=
 =?utf-8?B?R0djVjdHOXlvalFRZHhtdU4vemx1THprSDM5aDUzVTRYNDJrWUo1ZWVaSDRz?=
 =?utf-8?B?cXJnVWxIUlRRaG12bGx3T3hKYkRkZHJZZEpqb2pSb0g0M2RhazcvcmNiYmdK?=
 =?utf-8?B?M0FobHFPb2VqdmcwUS8veEZtRDRwQ1FTKzgzc1llSjcwWWY0MWlJcUF6Z3Vp?=
 =?utf-8?B?STc2ckZySFVXQk4rVTBBV0NwV3FQQml2TndWelpsSWltNkhNajR1dHRXZzhQ?=
 =?utf-8?B?S3RGOStyaERNbS9IM3pTL0k5anhzVVZNSmNDZlYya2NndldFeHIzQkpWeTlL?=
 =?utf-8?B?bHR0RDVCMVRIWlV4NGxyM0NwNThZcWM2emYxVW9iZzBiZUVsYVdaS29obFYr?=
 =?utf-8?B?MVpZNkRMS0VKY2x5K2JiUTM1cWR6b2oxclBhaEZNenFmWFU0a2grUEYrUFRs?=
 =?utf-8?B?VUZLa1grQVpJczVXSjliKzFGb2dFNStleGFZOGhrdnFEWkxpajg3L2FjL1Zw?=
 =?utf-8?B?eXNmeHF5WGFwRlFlalpBZDFRM2hNZHZ0MUpnVzJsK3FycCtoMVZMbHFkajBE?=
 =?utf-8?B?cy92SDFTdzQ4OGxIRWxrNFYwMEhWL2hRSXMxb2hHdFQwU2krUXlrSk9hVDZY?=
 =?utf-8?B?Y0pnRHQ4OGRVMktJTnhDekpveGRmQWRSdkJZa2o4ZVBDZ25UU3VtcXBhNWVs?=
 =?utf-8?B?VkxGaEphSjQ5K0hqbnZBR1lMM1lPWmZDOHdIWkhZdWpWNjVUN0tJNzRwUzF6?=
 =?utf-8?B?OEdleGJmcjQvdjg0WXFHQ29WcUpGalE4TGYwLzRKWWRXYWMrTzZINjZIQzJR?=
 =?utf-8?B?d2xNL1JDdS85Zy85OVcxNXF4ZzNZdmtWSGtYWVkrK3F0aWJiekJWVnZvSENL?=
 =?utf-8?B?SnNEZUJWbGM2Uml6U1pBVTRQV1EycHM2R2Z3VlNGZnl4aERzYmJUVGtPeS80?=
 =?utf-8?B?bFQrMUdraUordnRiTVhaaUZWWWR0cytscEsxMnFxbGZBZHZRZWx2TWN2aFh5?=
 =?utf-8?B?K1NoSlBsRGZ1cWxEc3QzRElhcjBJOG1TbFh2d2JjZ1R3QzF3LzNjMTUxUDRC?=
 =?utf-8?B?MWcxbGc3MnlpYWNwOE9heTdTZkx2R1lzaFpURHArM3F4ekdJaW94UXZqb3gr?=
 =?utf-8?B?YlVjMUdWOElqTjBmeng3eUdxRVNTdTJmYml4d3BMaWNnWGh2VkFPNUY2REdv?=
 =?utf-8?B?YllRUlNNQmkxNG85bDhMQlJYU2h2Nnl6bTVrMlBEb0lmVVJyYVhnb2h3UjVR?=
 =?utf-8?B?ZUhIeXZaK1pybDZVYS90UThFUlgvZkpQRmVBTE5STWdkUGl0R0VOZmRlZHk3?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78cea82-26e5-49f4-c105-08dcf8a87a47
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 06:02:47.1194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1YPBm/V+J91/IIs/lKMlMDD908K4/OhvtoI6IP1gfZ24JpBuevWBrzkcxLs9JCtBopKOTPWYBIsWxHaPUSdCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8797

Hi Laurent,

thanks for feedback.

On 29.10.2024 13:57, Laurent Pinchart wrote:
>>> +
>>> +  orientation: true
>>> +  rotation: true
>> I think you can drop both of these too.
> Aren't they needed given that the binding ends with
>
> additionalProperties: false
>
> ?
I added orientation & rotation properties in order to support 
orientation and rotation controls, libcamera warns about those (optional 
requirements last time I checked).
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
> The device requires a clock, shouldn't the clocks property be required ?

I intentionally left the clock optional, because NXP has a converter 
board which supports both ox05b1s and os08a20 sensor, and the converter 
board has an oscillator, and we are using that, not the SOC clock.

Here is how the module looks like for os08a20 for imx8mp:

https://docs.nxp.com/bundle/AN13712/page/topics/os08a20_sensor_module.html

There's a newer revision for the converter board for imx95, sorry but I 
do not have a link for that.

For imx8mp, we used in the past the clock from the SOC, then switched to 
the external clock (from the converter board).

I think Omnivision has their own module.

So, I thought leaving the clock as optional allows for more flexibility.

>
>>> +  - port
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        ox05b1s: ox05b1s@36 {
>>> +            compatible = "ovti,ox05b1s";
>>> +            reg = <0x36>;
>>> +            reset-gpios = <&i2c3_gpio_expander_20 2 GPIO_ACTIVE_LOW>;
> This isn't specified in the bindings. Does the example validate ?

Apparently yes, I mean dt_binding_check passed:

$ rm Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.example.dtb

$ make dt_binding_check DT_CHECKER_FLAGS=-m 
DT_SCHEMA_FILES=ovti,ox05b1s.yaml
   DTC [C] 
Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.example.dtb

I have dtschema-2024.10.dev6+g12c3cd5.


The "reset-gpios" is described in this binding, as the GPIO connected to 
the XSHUTDOWN pin.

The <&i2c3_gpio_expander_20 2 GPIO_ACTIVE_LOW> is what works for imx95 
("nxp,pcal6408"), for imx8mp this works:

reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;


Thanks,

Mirela


