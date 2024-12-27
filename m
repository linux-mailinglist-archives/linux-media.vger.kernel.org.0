Return-Path: <linux-media+bounces-24123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C8D9FD165
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 08:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C0DF163CDC
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 07:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233C2149C4D;
	Fri, 27 Dec 2024 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="HwTxY7Qm"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2098.outbound.protection.outlook.com [40.107.255.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5AE13DDD3;
	Fri, 27 Dec 2024 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735285110; cv=fail; b=QMRiVylmbSj2XazNmyTimdrD8Dvi+m6fibgkGQZP12wZxsfdlPlzk/666u72HEdBJo3LOcT1/BvGsjv87Pld9U09IUc4BfZJPNbpR+gUPiE8LFK7Ak8JeAIDIyh1g0Ve/uEcQMqWGLTpGLTj3OVjUVaFvXTh1UXhFygVedkCxcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735285110; c=relaxed/simple;
	bh=o6b+i28ecyTVFDADTYTK5ivdwSkyqwquhhi3fMOe4zw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UYh5+m2kUBGWk001F/vzb4IopeGESADlvcvzW1Zeu+1cUCeM66ncKanmj0SMG+SDJCW5wIEIr4bIeyjg4XMFSu9YbUuqL7bSwQy3HVe6j9TO7Qgb2ibZmX8ng6yoeCaUKgVfK94RJasRAnD6cTxoZPcdEKVp8A+SUJbChLI97lM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=HwTxY7Qm; arc=fail smtp.client-ip=40.107.255.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEUP05+5bBDSmerY1B0Q0LYT8wBZceIiqxbYjnN3CYhqwTruN+MU/A1AWkzex+KC4MAEFjCD8tyYz20NSKdSj8dxCSrLJBbByY0WddmUZUQRsKREyozGDjmhaZLgk3uABTZhrB4HonUEW/wnxm1yKgVak1Nmm98J9zQFrKpW+dxkNoaS4TSLg/7ZLKBX/ohGIRakwaUpNsLFMEAGWksycz3A4PN9wOFxvMnuLspsKRqAuBSKYUOkwdId/liII1qdNt8cYdw437KO0FiL60RpFcW8EwNR9N4Rnj2GR7SeEepA2G0kfi5Rw7bomYCGH66+dx1P1ZOlfofBoRMxnqt5qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDVg9Q+FwN3r5rx7j+BYMD0n8u2Y1Vgo9PiXSbYdtCk=;
 b=lsV/dNRj8AJK+SEk8rIkZQ6wAEuJ31YQHgurD8uis2MsZjKbBqPRDBCEQQt0t0++VRzN0ybti8YwTQXDrqS13HnPd71JtcB4vT6kLclRP1v0kOrlm+mio9GKVwxhRu40IAjQp0R7c845K8bv26y9NZEfBAhxqsPM+8Z0FavdVHaIN5BZ0Z1tI/Ex+Z8PZygNfNHqJ9Mxp2hAX9PdQmDLn6Z1zVAkve0haHNMYQLp9viUFE7qoLkktb4sAXfSfOp7iHnhhzXUvOdleJCts0Qzvw2mBBZEyfYUoXgkHJdV1L/t2zBFcslGiRCiQXrvQfOtFApe8W9DiO1xCf2OQlH/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDVg9Q+FwN3r5rx7j+BYMD0n8u2Y1Vgo9PiXSbYdtCk=;
 b=HwTxY7QmUVO1igZC6KKm4MLxxtm3+2Pwt/E8Ndqpyk2j3EG7qr3efllFOs2LmB40VMM8elCpwsFiwJWM8DgJelwhTq8MMQmXFjUOzSN1bcBxvyLZY5M+WJcBBwuRtJstN3WucotFjFdECC5eoljfqxhT+ac8BbwZaeMo6VT5tTXTF8j31HxokpYeiduJrrqu2ga1IhqKbhwQTuST12G6bgGM8ubkZK2+LhzV9v53Bym7VnCA1KkGutMJyNfkWyhsqilsKw7HtAuxdeSwZUhnx2GzNkBTCDS4JdCQU3vYcj3Spj3Gf7q9xGeszccZvCcSCqN7BSdixHxV5e/t1tKj4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYSPR03MB7649.apcprd03.prod.outlook.com (2603:1096:400:42a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 07:38:19 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%6]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 07:38:19 +0000
Message-ID: <002e2ffc-3ef7-41aa-846f-3900694de675@amlogic.com>
Date: Fri, 27 Dec 2024 15:38:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] dt-bindings: media: Add
 amlogic,c3-mipi-csi2.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
 jacopo.mondi@ideasonboard.com
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
 <20241227-c3isp-v5-1-c7124e762ff6@amlogic.com>
 <712ed366-233d-477b-b760-907b3d77a7db@linaro.org>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <712ed366-233d-477b-b760-907b3d77a7db@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR0401CA0006.apcprd04.prod.outlook.com
 (2603:1096:820:f::11) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYSPR03MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee3604e-6fa9-456b-ec17-08dd26496ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWV4SGhGeWIvOE5kL1Rnb0FuaGZFMEdjVU43V2ZXZzU3eisxb1hibkZ3cWFB?=
 =?utf-8?B?bGJyTEwzMExrVkJHMWpWOXJ1UE9BcU5ScFl0dW9yOFUrTjZjYmhsdW1LTXZX?=
 =?utf-8?B?RW1tQjVyZDhPbmVJVXg3dUNnSVIyeVQ2TzBpT2MxbWRFYU9XUmFqc0tmQ1Ar?=
 =?utf-8?B?MEF2azM2SzBqaW9pUENxeS81Yk5KS24yYVV4WXp1SXpGelAzT0x3TUlZdkJP?=
 =?utf-8?B?UUxNTWVZNkppU1pUb0RiSlJzMEtrUHJQWktGM0ZnVU1RUi9xcmdWdUNwVURl?=
 =?utf-8?B?V04vVHQ5MXNyS2oydm90cHVwbzBNaFJyZHY1bmdsRC84Qm9nV2tTVTM1VUdu?=
 =?utf-8?B?eVdUZkMyOWJyZFJXa2JicXo2bmpWODVsYmNRd2hZT3BxUmJEQzR6RWVRaG9Y?=
 =?utf-8?B?OHliV3diSC9EbWZZckJBRVMvbjA2ZVd0d2tuYVRTSmJqMldYajNtQm5udjFR?=
 =?utf-8?B?czRpVTZlWnNOYUlXNy81YUVHbHNOcERUd3JLSmdyeXFmOEFGMEppMFM3UTF6?=
 =?utf-8?B?ak5kS1VTZU82OVVtVzdnekwyNEtRU09ON1RTTmtqTjQwUlUyc29vbkVvMjdM?=
 =?utf-8?B?U0VoUXZObkJqaDNCSHJjc3J3U1ZXQlI1TWw1OFlORXZiRUsrSEFzYS9Tc0tW?=
 =?utf-8?B?Sk4xVXZiQkl3clBUcTJHWElhR2llNWZteGkweXhZQ01WRjZUSE90Ny9kMTBD?=
 =?utf-8?B?ZmRNN0ZJQmNBbk95TnRXeTFNMjNuKzRjZkE0b1J5eUZuQmFhNDdmV3BPNzdp?=
 =?utf-8?B?c0JDODBGY2l1amFsUUZPOHgxS05lVGkvWThUNUZ6RTZJNjlBT3NHWGw5SFVQ?=
 =?utf-8?B?ZlpCTEprZGxvT2JsSVVvaGcwVEJob1NEVUYybTBMTVFNRGpydi9mMjBudlZL?=
 =?utf-8?B?b25CQlVERXB3bUtsOTZPcU9ibnJjb3N3cHd3Wk84ZllteExONW5MbjgzSlFi?=
 =?utf-8?B?cVNNSGtmK3RHR2dHLzc4MDhDRmI1THhYMnVJRTEzK1ZTSTNLNHp5eVNOSnlP?=
 =?utf-8?B?dFdVTGQyZjRmZ0YyTGpLSXU0UGVkejRpWmdUeXhrWHQ2N2NjSFprYnpZLzc2?=
 =?utf-8?B?clMzZ1JPZHZUNThDYmxJRzlOb2VNRFBPaWswWXdDamNxUDFacWtBVmRWcCty?=
 =?utf-8?B?eEptbDV6M2VSeTlCaFlRa0IreG5wSDh6aXY2QUF2MWIwQ0MrWFF4VzFMYnhM?=
 =?utf-8?B?V0NtTzQrdWVoTnlvbVNacHZGaEgrb05UdGFrajhyYm1MalRYQXBIcXJkZXpo?=
 =?utf-8?B?eU5EQ0cyTGxUM0ZwSDRpcis1R2Nlb1hWRTBMWUFWdWhteUo4Qlc2QUJXaThL?=
 =?utf-8?B?NUtpekxMM3I0cFpVWE5BY1FYbDk2WTN4dVdZZGJzRzJqSG9PcDVGYUttSFM1?=
 =?utf-8?B?SW45ekVQRWVPeUFLakhsQmZxNHVzSzZTcnJvaXltQ2o2aTRxMVhjaGpObzJh?=
 =?utf-8?B?WEZQeDdDQzk2OGhpelZadVdaK3UwL3FlYWVTd215OUw0dTQ1OTkrSTRETWRC?=
 =?utf-8?B?MklWTzUraHNpQit5VnB3RkpRNEF5RW5RYTdmNlJDNlkxN1ZqVmhzcXZKT3Rx?=
 =?utf-8?B?eWFZdFBMU2hHck96UThldWE3T3lRQ3R0UVFvNlRNa2JEQjYza0luQk5BeFhD?=
 =?utf-8?B?K1Z0YUxWZkxzUndXeW1WVnptUDdZVVF0YmdLZmJRaHJqZUV4VFlITW1XTlBO?=
 =?utf-8?B?ZlRnK3N6SFNYSEUyZU50c2dYeDA5eitBaVJTWFRKbUFmbE14N0ZFM3Z6MUFK?=
 =?utf-8?B?WXRHMFZXd1F3K2Nka1E2QmNXMUtSOVdURnRRYkZTV3ljSzA3OFAxNWJtbitr?=
 =?utf-8?B?Ni9iYy9LeENxQndzSlhJQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3BjWDA5R21td1E0bTM5ekd6dFJ4QlhyVDUzS3hRbzV6M3RXbjkzQkI1cTFq?=
 =?utf-8?B?MGU4Wi84TUQ0ZFhJOUFSUEgvR2Juci9vRDlVRFZwdTlhRWJ5K2hyL1RPWkl0?=
 =?utf-8?B?cUJUK1FhT2VCMFJUVGxLWFJ0QUw5TzliNllFeU1waytnNThFQXhHblFiR09p?=
 =?utf-8?B?bis0SW05WXhmczBBd1ZJRTF4RFNibDZQTWlpNWxBanl3SDhLQ3ZtN1FqNmlQ?=
 =?utf-8?B?elV0anRCVzl5Mlp1dXNTbEFUSllrcHVQOVkyNGRURnZiZ2FqVVNHbWZ0U2p6?=
 =?utf-8?B?bnliM2xya0pCOERxR1ZPbS9OZ3ZMMDhnVnBUYU12QzlRS0diTTB4cWdxZm9P?=
 =?utf-8?B?Q1Y0MDkwOXpTT09DUDVxR2VRMit2VXJRcVovakU5WSszcWg0cVVON3NtM1ZC?=
 =?utf-8?B?Ky80cEtUUmtHNitLaUZSL0liWjIzdXdWYlZBWU83c3k4R3R5NHV6cjMxLzdi?=
 =?utf-8?B?dWtzdi9pdVFrM2F5VHlUYkl2RW4zVDVyeEp2Vmx5U2xlNzl2U2VmSTl2YWZN?=
 =?utf-8?B?VWdsUmF3NU93UkphdjZUMTQxM2RBKzJlM0dIdndJUk9aaDJUVTl2anE1cXlD?=
 =?utf-8?B?K0FmUFhHaHhkeExhTVhIQ2JZaVN4bG1PVTFWMDdvTnJtN0Q0djBpYVI4QmV3?=
 =?utf-8?B?c2lCOENQZGdCd1dqdk9PSlhQV0ZRajl0cWRKUld6eFJDRW90dGw4elR1alJN?=
 =?utf-8?B?Tk1ubUtwOVJNY0RaMy9GaXNXUWxHVzd5UXN1bzdDZ1k1aHZWVFlmYXVVK2tC?=
 =?utf-8?B?bWVZTGQ3a080Uit0cEc4S282TjBpS0R6Y2QzRlZ6amlMdG91eDQzSGYyS1FK?=
 =?utf-8?B?RFRoUktkSnBLbWlKaER4Q3JidERBa25OZEl2M3pFWVhjOEhRdm80Zk1pSUQ3?=
 =?utf-8?B?bVJNYnM5K3hHcnRIKy9SeWp2VnJLekxxeVYwK24xRXdyM2FBanAwNFgrdHFk?=
 =?utf-8?B?Snh5YW8xTjg5N0Y3ekxOQ28yWGtncy9NRlVmS0RWK0U2SHFYQXlWcXdOYk9L?=
 =?utf-8?B?KytJK0taWURSbG82ZVpHcGYxVFB5RE5hb3hCUmpsaWM5N0JQVEJLeU1ISTFT?=
 =?utf-8?B?UWhjbEIyZDlyNithOW5CRVM0REYxdFpMbTRVb1BJTlJTL2NDOS8yRm9DK1FD?=
 =?utf-8?B?UzAvTHVKT04xVXFROFVMR2NQbkZEZnIvLzVIYnlkMHkwV2dxcGlPbFFad3JR?=
 =?utf-8?B?RHhTVFBDODg4RnErWE9YN1VpTGMyZk5wZ00rbzkyY28xZUVHQURQMmJQRXZx?=
 =?utf-8?B?T3A2Q3NvK1VsenV1RmlWbnR6SHhTbUxENjRtaWZpNlJLbW5LS0YwL0dQbWFN?=
 =?utf-8?B?WGpFVVhTZnlUOVl3V1pzdi9mcEpmL0Vvb0JqcWwzbUFmWTlZMDV1VFhmcE5n?=
 =?utf-8?B?Wlp4NDQrZFRDWG9lVklZcHc4UTQvOFJ2UXVlcG9XRGRtMzFCRnJFQzI3VUs4?=
 =?utf-8?B?a1lKcTVtNnptNGVWTzdtNUtreXRudzdVVlYyd3U0bFpQVDZKNjdzdDFQV3dv?=
 =?utf-8?B?UTFaUnlNMDdlYnY1NUlFY1prS2RNdzJDa3BGaDcwTXJFT0ZtL3gzekE5Z21J?=
 =?utf-8?B?dkk2VWY2WnJkVFRKZWpINWVrcDJKNHVSaDBobVNKVVFNMEwwOS9LNWp2bGxt?=
 =?utf-8?B?S01mVzAyZW14TlRwRmFrdnI3bFhWc2dWd21mUGdFMTNNZnVOWGYwaGZpMUc3?=
 =?utf-8?B?cUtTRTk0ZENYaUdUSlpvY2JEUW5PYTRzTlduSGxFcHp2NkNqcDQ1d24raDBa?=
 =?utf-8?B?OFR2bnpVMVdyQlArc0xqQlkrYVBtZUxXcFFqNGc2N2dZWXk4emZWSXJGZnBI?=
 =?utf-8?B?MHRJaFhpYU45d3V2RVg4bFZjQmdMRFo4bUJyYjJOK1F2cGdTdlRScXdMQVE4?=
 =?utf-8?B?YUJES2J1VWMyV3VJejA3L3luRTl3RkxQL1pNYkQ0NG1KMk9PN1RqRkc3YStO?=
 =?utf-8?B?M3ZEbW5hbjFZeWZ3bHJpVTRDb3p6WE94WHRMZnhvUGM2WVp2UWtjQU51cUVv?=
 =?utf-8?B?TWJEeU45RXlxQUIvL08zTXArSW52cy8wbDRaSm1JSXhlNkdpbmlMMk9FRWUz?=
 =?utf-8?B?aXV4MVJ0QWZ1Y0ZvV3F2UVl0N3dRWktmQWM5Syt4MUpIbVRNREJ4N1VDZW9U?=
 =?utf-8?Q?+q44bIgOLzvtCyF/VXIuh5EZ9?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee3604e-6fa9-456b-ec17-08dd26496ec0
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2024 07:38:19.1209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKMV7MLwsBb1V7jtoiEK4xf1dFYlShtu66QPfd3wxfyvmVAVY5+TEKzVWNwK6WEsGdsG8a/ZQ58BLaJ3F1qQsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7649

Hi Krzysztof

Thanks for your reply

On 2024/12/27 15:19, Krzysztof Kozlowski wrote:
> [You don't often get email from krzysztof.kozlowski@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On 27/12/2024 08:09, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> c3-mipi-csi2 is used to receive mipi data from image sensor.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 131 +++++++++++++++++++++
>>   MAINTAINERS                                        |   6 +
>>   2 files changed, 137 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
>> new file mode 100644
>> index 000000000000..76b68d1e7316
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
>> @@ -0,0 +1,131 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-csi2.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic C3 MIPI CSI-2 receiver
>> +
>> +maintainers:
>> +  - Keke Li <keke.li@amlogic.com>
>> +
>> +description:
>> +  MIPI CSI-2 receiver contains CSI-2 RX PHY and host controller.
>> +  It receives the MIPI data from the image sensor and sends MIPI data
>> +  to MIPI adapter.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,c3-mipi-csi2
>> +
>> +  reg:
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    items:
>> +      - const: aphy
>> +      - const: dphy
>> +      - const: host
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vapb
>> +      - const: phy0
>> +
>> +  assigned-clocks: true
>> +
>> +  assigned-clock-rates: true
> NAK
>
> Adding new properties *INVALIDATES REVIEW*. Otherwise you can sneak
> whatever crap past reviewers.
>
> Drop all new properties and drop my review tag.


OK, will drop all new properties and drop your review tag. Thanks

>
> Best regards,
> Krzysztof

