Return-Path: <linux-media+bounces-40546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC5FB2F3E2
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 054D95A7670
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC782D3A9E;
	Thu, 21 Aug 2025 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zq8N514C"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C7C2D9ED0
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755768256; cv=fail; b=u79Ztaa+tennOk42jBeW8Uc84XF1gyU9W6aVHWTAaKZ6EO2YH/tpTnh3XhnN/V9ZZazlumsztNa/fhPKIa1B3qIJu9Rs8HscXMPSIz7QpKRQUPX4x1kY543G2wxjkZTxao2wfONcczUyJV7ScwooCglk89ynnj/Wwgr5h9VBZlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755768256; c=relaxed/simple;
	bh=yE4mEbFk19DrqnE6ve+TRgdYkhv6lGWQVnYjDNmQNKY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cfa0mFb0xGOYH9lHb1lPOojhmqWzA9NbGimSX34y/P5xm6uItfOptJ3sK3qtC5XJY6as8B6CoZ/mWxJGZqtUYZVN6tA8/G6azXW6xNQdetYH1vK6bRaBXkgC3rPoTABIgP9ux8wu48BvM26I8UoHceMmEmhNa11Yv5kKpGML59c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zq8N514C; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxBI+H3X4s53BhHKWGQrybir4I3/npKRMR46RJqnAjqBxCZXATicpezOBLqmWaxlcniS9Sj8NzO4bYjLAxxHXGc8rgvCSCOHH4xg0IQslaM+m1y05gK80is6kz89q4+Z8X2KaT1QuxP3UyZd+iZxLpWdiIioi/UTT9y7Bb24WG8bDKBVzLXdzGU2czRBBjsoWOziA81VvTJXA1kCxF1qrmLTOUxBUEadkNO0GV9sKd2ZnpSVrrU5KXk+d0OWPx4XXd7Vlq0S+MGLg2J60o2EEXL6y9XDXnT1mnCIhV3zif+V4Gn8cnZlgEEncGHgkybn9GvNn1Mev4vV7Nhrc0m5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWo3edWAiGjufwhN1yZGm6tjgJo12yilXiV/OqI7hyk=;
 b=JOCOilc7sqk6yJwbiTtLFU88p4EDAks5bUfqelKZ9vwuobwj9Ov9ZjkskuF7exkdbWebroG0JSf1R2wOplyC/j3K/6f6Vi48dv0zJS4T9PwOl/Ydp9BVd6FPfve4F8Lj2RfOcQ+rKFMLwWrFjHB9bd/xY8GsuHhlC6rQcWskGhB9hxiRiT1o0YkivDB/2Nb+OxDZPZdsqeeC7h0pQJxnelHqbq69zSpH+LL/21yFiHMz+NxmYeZMX26VuIazNSoJlSsfatIToCcvySDwASybX2D/2YbzRSl6QbhJzJKKamGACmrLgZDHl9ygbyohGxukZa6m82ECNAQbz95qu1Yhow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWo3edWAiGjufwhN1yZGm6tjgJo12yilXiV/OqI7hyk=;
 b=Zq8N514CFp3h7Orl+hRxZyB1HQEYhUjFy2iS/oio4Cz7vE2s+YeBcFRFKOQSGumoKkD7Qdaq2gNW610RkiSPZ1ffFaTMdUPAW6/ptVOCqwLz/ugEzufaHd8Zl4DD2xkL2qIZo2rv6JyyR/hmR9Ee8t+ZlgTZYBXtY30UStnxcGICOSoyEc3FFK1zYHy4j0UODTjnnpgN53AjBqaw6pc61engO+DElxq1jS2InhJ5BRuGXRCW0Bwm/pNCSz5xEYzeKiPak/hW2bG3hvedvU++26Z9HgxvxZmis5MPmAuPU2SMmfOFGAwtCoygHzbOC79+EzCPuND569qbLeGyZswmaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 09:24:10 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 09:24:10 +0000
Message-ID: <218903ea-82fa-45f8-9826-481ded93281a@oss.nxp.com>
Date: Thu, 21 Aug 2025 17:24:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-jpeg: Fix JPEG encoder ready race condition
To: Marek Vasut <marek.vasut@mailbox.org>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820162938.209892-1-marek.vasut@mailbox.org>
 <4a8531f9-801b-4744-8821-923961211199@oss.nxp.com>
 <1a25c41e-1139-41da-b056-50be47016138@mailbox.org>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <1a25c41e-1139-41da-b056-50be47016138@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM9PR04MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f65e31-f234-4a9c-ac96-08dde0947c16
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZTNUUGRLUWZ4b1ZBM2xscjNSV3dzOUpJbzMra0ZTWkcwaHgydXlEZ0xNVVRp?=
 =?utf-8?B?b3h6L3UvZDVQaXlVYVZETlUybm01Nnp4aHdIN3BWNG5SVGZJUnFsZWVFZDNO?=
 =?utf-8?B?VTVNdVdvaEF4c3ozdXQzZUl3QStkY05UUHA4QzQ4SW1iSWlqYkc5UlVpa0V3?=
 =?utf-8?B?K25LNEp3VTlCOVNva1FZdEJML3Nwb01RcytDNnRscFRmRlRIRXF6TnU4U0xG?=
 =?utf-8?B?TVFiVzc5VUg4eG9VNE00NHR1L09lSzdaYmFkMllpSWl6VjE0cHZoQmJ5YjJv?=
 =?utf-8?B?MkFZaE5jUHoxdzZsL3F2ck1vQnpubWhGTlBNM0RTejREaXQ0WGFQNndLV0tV?=
 =?utf-8?B?b2kzODBuU1h2djdJVENKRlA2bkJnWk00NDdhbGxaaHZOeVRvN1EzclJFMDhX?=
 =?utf-8?B?RXE4eFQ2aWc4T2loUENFUlNRU2FrLytLQ2dFTU56T1lib1pUZ3hBTVlrb1Zm?=
 =?utf-8?B?WHRRR1hiKzV1UnVQQURCZTFISXp0RzBtK01KMDdFVWhxRWRnL1BQNnNxeHpN?=
 =?utf-8?B?UTM2cWE2NjR5SmI5MlkxZGlkSzdXenc0SHhYQVEwZTlpVFlFL1RQUHUxeXdn?=
 =?utf-8?B?YUt6U25Sc29oWFhQSXVXczQyY1JZSEF2M2FrVXF3UVFtdTVXQ21EelQ4eXY3?=
 =?utf-8?B?aTJYempHVGRqNXk4UjlDWTd6RW52OXdFMXZmT241M0lCYkk4THBqTkNmNlQy?=
 =?utf-8?B?dDJyNFBxZGE4SmtjTC9hKzA2c3lvYmMxeEhGRk9XVmJDWG5iR1NEVURpU3hz?=
 =?utf-8?B?TUFXM0JocTNHb3NMaWNiUG5hbW1hbk84TXY0eVJNc3kxelZzMzMxcFAwNFhO?=
 =?utf-8?B?TjVTTS9ndkdqZVE5MC9ZckpzaGwvbTh5VEJCYUcxckQ4cCtNRmtnZ0tkb0JN?=
 =?utf-8?B?cnpmNEthWk1ySGdpU04wZGNpNzQvUjNQVVZYWWFheUhyYTRZTnpuN2IzZWRt?=
 =?utf-8?B?WWIzK1JSUnZWenZWU1FaRFhlT2JaZmFyVUMwZlMxYzM1ZkhqZzg2NTB2bDlB?=
 =?utf-8?B?c1pORTZPMm5wdUdqckFQR3MzNmcvM0tYYlJyLzZnQkNkM1VWYWVpeFFHaWp3?=
 =?utf-8?B?bXFvNXZxUG1mN3hYZFoyNStIMmVTSGFvRXozMFZQTXZIK3U0aThESUZIbEdG?=
 =?utf-8?B?TFZ2QW5VOTgxUTlHQmNjNUVkY0pBZUVWb1ZveWFkQXRQZ21FVk80cUI0QUpp?=
 =?utf-8?B?U3lkU1FEZWJRUGRwTGoyeC9VL1EzM1ZZeDlwVTBKVFA1RzV1VHNBQjVieHpL?=
 =?utf-8?B?a1JXTzFES2xGbzhLTG5RMC9xUGQ0R2xtQXUwRjYyOC9XS3diU3VQWk1EemxC?=
 =?utf-8?B?cHg0cnN5Nk9pOWdBME1SdmVWWjNjS1J2SE1rOVJIaFFWbW9FSTVjWUkzcm16?=
 =?utf-8?B?ZDB0SVJJcksyN1dSQlo4L0hzUzJ6R1ZkRkl4WmRoOHVQRitiZDdzVmN3UHhq?=
 =?utf-8?B?RGoxTGtTUTRzeGxPdTNrWWUrRGF0Ymw4QUVBVCt1a2MyTURHNjBLMkEzNWtz?=
 =?utf-8?B?enF4TEErYmNDMGNTaEo4QVp2RnBFU1Mxb3YyV3phS2hmT3lJZ1AzUE92VWU4?=
 =?utf-8?B?a053Yi9SWkZlUmpicCsydzhmV2hBM3plOW9FWXhHSmU4dU1wcXZxSmh2NVht?=
 =?utf-8?B?N2ZDcGIzWTFOK1NpNGg0b1pZVzJyK3Z3QWRhU2Z3MUZMTUZRSjM4WEVWNkRC?=
 =?utf-8?B?VW9SQnIyZHliTlEvS3ZHQTI2MVgvVm5Cd0RrNXFRNG1rSk8wUE8ycE95S3VQ?=
 =?utf-8?B?QkcyeEtGTTFhT0lXdi80QW1lakZjQVpBU1JQOUdTVzRERHdsQ1d3bzNCbUJa?=
 =?utf-8?B?eDdwWmxXMEpueWIwQ25JNnI0WTAvY2VFM01pbE02N3pOL3psOWg2M1lmekhO?=
 =?utf-8?B?RGgyamY3VlQvb2x1L2VLY0hLUE8vVEMveGtXcGROMWcxL0FxOE1PLzdGOVdj?=
 =?utf-8?Q?K0KGhmuyFGY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RGo2cFJ5QXMzaU02NFRDckkzSjJqbEZseHc5SkE3blBXOHZHKzNXVmdaMTVI?=
 =?utf-8?B?b0NJczBFVk1ta0EyczhFd0FHbUVBU1cxYWxyaGtGK0tHWTFRelU5ZEp4SzFC?=
 =?utf-8?B?MEpZZTBKMVNucVhVQy9mYnRFMUZBcytpRE53MmZpWlhOU0xBeG8xaHRaaEw4?=
 =?utf-8?B?d050OFFMQnRRVVdrZHd5dFcxcXZLbkI0c05RTVJaMzhuYUxSaS9UNmtDQUZs?=
 =?utf-8?B?VTlTSE1ZVGJORmVHVkxsbWpudFN2WEVNNjNuelBKVHBqbENNcE5CMEl1ejhn?=
 =?utf-8?B?TER3ZU92bDkxa0twY0hDbU1FWGE0SnlJZy96aU1rQ1lFampUVW15ckluenVF?=
 =?utf-8?B?TVhuUzFqTXlNTFNVKytZTjFqcDBWZ1BEYUZoL0g1RXYxd3FGamU5MzRBWUw4?=
 =?utf-8?B?bUlRYnBEbWxIazVaQXlDemhsUk9WUFA3bzRmeCtMSnBTUTErWnBqYWM4WTIy?=
 =?utf-8?B?UDRiUWVNcS9idmpKZHE1Rk9QTnNyZS82a2lQSGtnelhqbzlTSFRZdVZrOHJT?=
 =?utf-8?B?RTNlalJNZFZEdkE1UGVxdytkN1JBd1Z6TE00d0FqaDQwVHFKQnYvbjJIVTdV?=
 =?utf-8?B?VWFQVThUVkVjcEt4Z1FJbFlaWWw0MHhFRGhGVlBnSU9oOC9lckxXcjc1NUpM?=
 =?utf-8?B?WHNBTE12THZMVDNuN2pKbmF1RjMxT2pSQ29iclJBS2ZOOS9iSkh6eHl0UU1R?=
 =?utf-8?B?MkJJcmRoSk1FbytsaWQvdkYySFJ5MlhQWGpOYU1aK2VFa3ZhMlBFbjNDb091?=
 =?utf-8?B?WUsyS3FKM2QzVlplUG1PRUU5bTFXczhaQi9hRk1IZTJEcHJvUS9sMFlCazJF?=
 =?utf-8?B?MFREZ09kMmNhZTBESUVqRkFacWtGVjlTbHNPeDIzRlR3UUtnYWhDVzFWT1Ji?=
 =?utf-8?B?TFhZa0doUFk0RlQ0amQzSnlBcGw5aEljN1Z2S0NTT0xEQXpoOE14TkhtNExG?=
 =?utf-8?B?SUFLQytYNFZJUVB2dWpQVzEwWVM4UUZHbWU2czhlcGtwTHBTd3cxRkE2UWEv?=
 =?utf-8?B?cUI4WU5MVW1lMEVSSFU1dHR5VUdBS0h0anhPSXk2cUtNK3hSWU1scE1Gckpr?=
 =?utf-8?B?MHNrK2RtNDJuKzFyeXYvckdwdG5KVVF1UXVRelZOamhtNjZzUmd4U293QU52?=
 =?utf-8?B?aWdkSmU5emYzRDRlVVZOY3hxeGhiR1VqblQ0WVZleTFjRzB4c2JGV2U5NHBL?=
 =?utf-8?B?bnFaQmg4S29rcWhUNG84TVNqdnorK1ZleVR0b081S2cyNXR1aWE1NWVyc09C?=
 =?utf-8?B?b2JYeVBTQS8wYllVNlI5SS9rWmZCT0ZHUlhESkRVRU5ueWdnaG1JZFdHVGhI?=
 =?utf-8?B?ODBMeUhnZTRYWjM5WE9jN3lGY0JySjZkRVdkT1JET0VuM1c5YnN3bkdFT29n?=
 =?utf-8?B?TkdSb2JFWUcwYmJud2djdDRxUU9nNmhpcWRJUkZaVWl0SWUydHl3ZTVISlQ3?=
 =?utf-8?B?M1BVd2lvNk13ZkMyei9ZdEl5UEFDUTZFaFNEUEZYNzVHeG1XSyszNnF1blkv?=
 =?utf-8?B?VFVXY2U4TE9lYisvc2xrZVA2WjlYamN5WW02V2VUMXk0T1QrbEpHY09yMDFL?=
 =?utf-8?B?a2kwcFdBZ0NnOTRKbldlYVlLUEREcWRrUVBxek15SjVGb2szanB5VkhGTm5D?=
 =?utf-8?B?RVpud3YyaTZiU3pGdGJPZmE3YndnaVRmbHpIVHcrNm44eVBFVC91UWlraUdF?=
 =?utf-8?B?VmMyMlMwYXRQdTJnZ3N6QTNRZ0hER3RLcDZEdHlRTGFJYU15Uk1GdzNZRlBk?=
 =?utf-8?B?dkhSY1cvTUZQWURtVDhlMFIycnp6Qi95OWY3eDhCdXZTZTZLUldQNnRFcjgx?=
 =?utf-8?B?VFNJd1I2bGlQU3pEMkJqTkFKei9mdlAvZGxZR1V4QTUyUlRMYks0dkR4ZlVS?=
 =?utf-8?B?azUrWkcvd21lMkZ6OGNob1FKTFRHRWxTVUhDamJUdHE0V01GYSt6TFJTU2FX?=
 =?utf-8?B?aGszN1J3L3FYaUF4SjhmNjlyUWNnaXVwTGdwTTR5RzliVEVsTjBqL3dtWEwv?=
 =?utf-8?B?aXVKWVJnbWpZR3kyaW9vMmJ0clpNZFpxamRvdTN3aFVaM2ZNYzlXL05Ja1Np?=
 =?utf-8?B?ZHQ2UHpqbG9iQmd1ZlJYdnU2QWhzbXpXSXFtYUdKYjQ2ZkhLQjZMQVBDMno3?=
 =?utf-8?Q?gKzH1f8tYNnesQlIl7G6m/a/z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f65e31-f234-4a9c-ac96-08dde0947c16
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:24:10.2928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/Qbi9/UTl6vVaKuzfvqzIA3UpgUmuZ49bpof79+eVcsBbREZETDxe48iUehCPTALARaC/TUBVmq97PBcCgiNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682

Hi Marek,

On 8/21/2025 4:59 PM, Marek Vasut wrote:
> On 8/21/25 9:06 AM, Ming Qian(OSS) wrote:
>> Hi Marek,
> 
> Hi,
> 
>> On 8/21/2025 12:29 AM, Marek Vasut wrote:
>>> [You don't often get email from marek.vasut@mailbox.org. Learn why 
>>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> The current mxc_jpeg_job_ready() implementation works for JPEG decode
>>> side of this IP, it does not work at all for the JPEG encode side. The
>>> JPEG encode side does not change ctx->source_change at all, therefore
>>> the mxc_jpeg_source_change() always returns right away and the encode
>>> side somehow works.
>>>
>>> However, this is susceptible to a race condition between 
>>> mxc_jpeg_dec_irq()
>>> and mxc_jpeg_start_streaming(), where mxc_jpeg_start_streaming() might
>>> start decoding another frame before mxc_jpeg_dec_irq() indicates 
>>> completion
>>> of encoding of current frame. Add new state, MXC_JPEG_ENC_DONE, which is
>>> set in three locations, first when streaming starts to indicate the 
>>> encoder
>>> is ready to start processing a frame, second in mxc_jpeg_dec_irq() 
>>> when the
>>> encoder finishes encoding current frame, and third in 
>>> mxc_jpeg_dec_irq() in
>>> case of an error so the encoder can proceed with encoding another frame.
>>>
>>> Update mxc_jpeg_job_ready() to check whether the encoder is in this new
>>> MXC_JPEG_ENC_DONE state before reporting the encoder is ready to encode
>>> new frame.
>>>
>>
>> The jpeg encoder and jpeg decoder are 2 different devices, so they won't
>> compete with each other.
> 
> I know.
> 
>> For encoder, we always want mxc_jpeg_job_ready() to return true.
> 
> For encoder, mxc_jpeg_job_ready() currently returns !ctx- 
>  >source_change , which is only set by decoder side of the driver. This 
> seems wrong.
> 

That is what we want, the ctx->source_change of encoder is never set, so
mxc_jpeg_job_ready() will always return true.
If you think this is not clear enough, maybe the following code is
enough:

	if (jpeg->mode == MXC_JPEG_ENCODE)
		return 1;


>> And v4l2_m2m has ensured that there will be no race condition between
>> mxc_jpeg_dec_irq() and mxc_jpeg_start_streaming().
>>
>> After v4l2_m2m_job_finish() is called in the mxc_jpeg_dec_irq(),
>> then it is possible to start encoding the next frame.
> This part would be true if the IRQ function couldn't be called by 
> anything except end of configuration or end of encoding, but it can be 
> triggered by other things, like AXI READ error IRQ.

The mxc_jpeg_dec_irq() has filtered out the irrelevant interrupts:

	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
	if (WARN_ON(!ctx))
		goto job_unlock;

	if (slot != ctx->slot) {
		/* TODO investigate when adding multi-instance support */
		dev_warn(dev, "IRQ slot %d != context slot %d.\n",
			 slot, ctx->slot);
		goto job_unlock;
	}

	if (!jpeg->slot_data.used)
		goto job_unlock;


In other cases, it means the v4l2 m2m job has been started, we just need
to call v4l2_m2m_job_finish()

If CONFIG ERROR occurs, driver still call
v4l2_m2m_job_finish().

So I don't think this patch changes anything.

Regards,
Ming


