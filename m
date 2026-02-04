Return-Path: <linux-media+bounces-52184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ5tJVNKg2m0kwMAu9opvQ
	(envelope-from <linux-media+bounces-52184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 14:32:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA2E6711
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 14:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F00743014687
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 13:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F224246797;
	Wed,  4 Feb 2026 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d5aLuH/d"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEA2335BA;
	Wed,  4 Feb 2026 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211914; cv=fail; b=L3gp4CEteliofzSOhpTUT0Ad2zSewUAYosPCMThMcODxwOISvh4Myh2jRxmiPlnWS+ftctl+zLNuIennoI6Ad2LRvbDPI8YTnPCyhDCcrzi59LXgNqmUN2LzQBYVsUIXPxOV1a4FhbfqWuhGLXmjLgNhRqFNY1hxAtAguBFxDn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211914; c=relaxed/simple;
	bh=58kxucH29g2Tc7UKbVgNAVKRGtSWEluLWtojniraLNI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K002kP46lqQMgBhHZUhFtAdCazl4wr3ibaFfvnn/lQdzdhGXWuA4OTPJzkUsYVoIL3p3fnpbOfEG9gvGrn6aHh/8RAjlx8VaqWxWOLhteMpqL+fFUycbxgL3/dvVCUOYZel/CWxk5B/XDYpSTbEhW5dCjEYFZ6mvyXfpHEfNt9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d5aLuH/d; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQ/XFKPEoQEOXQdhIfkjgu1eqnEviRifC3Dx3rReKqub01ZZq3RC2WoEukHo+w2Dm07cPd54on4rLj3kegfsM1wXsW9mfSbcAytNDjsvc56+BUDGwue11zXv3qi0eKOVh3CM9g7oVFJVXSkIK/kIZ+gB+k02VIslPhIj5ZEUxjoPlTbngTA6uw1O404BsKjgG8bgSYNGtPAydtO/sn04s0MPkmk7ASNHjfnBh/FIrlyWHTSEybw6Mcr+TVAJWFNJo0X+6rf8Gzci8ASicyk6xYkDXyI11MZosZwOkwbllkocG0WVKWT2ketdpVuUiGkdU3RdpRrO9JDviCxv6bZBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reWXVJnbB0b+dccVjXGJ0t4HJxMmmK+uhlT+Nj1J8Pc=;
 b=d0YEFFderd/WSoQR+udaJ84/av+wv60cC87W3iJB+4C1Xij4SOV+EEE5GEAmGKWNrffzOKP0Aq5tZLlCYL8h69shd6JM8yDajE5+amLgomJfPa/2XmX0j/dIAndPdifordN4qsh/xrUYxAO9JoKjV6ADC/uEOVY94S705zJueuZgjt8cNiMDFjdWq0N0HKvKRIkFsh46/4w99d+UhDZ3hpqRhYJw16atU4dt5bNj7LZu7uPo7Z4Il5KovjXatoc8pZ5iTest2W3EGZmXflae17qAo/kLaC0h0VwwAf96GX/GS+vU9K5zNMsBPRzNMg5hSrkFtzlQw6NxC01MiPK17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reWXVJnbB0b+dccVjXGJ0t4HJxMmmK+uhlT+Nj1J8Pc=;
 b=d5aLuH/dK78MDiAM/XzIoXGMKeHEw58iG7w0MtI64HsEt4nHzN96j1NyFxDQkDtDd4D9DAxx8+hfWGcXc4fknEpCYAtAkkZridxVOmHA/dST15N+wNcn+mrdag9lRU6v3+x+djJbu14SJnIr7FQ8SgtC9Sk9pzo+rn8C4uk1D6lkz36K+7zluz5iZiFVVo3qTnjn2dKmWkZvnJW3ZLEA2tGPbr7B5/ZvOg17pq4Nm6ZdoDC0yImeo947fvn/39cZiLt9l0o8tzKssSqY6FIXzagy0McZ9xKo4KtTfsVwpSW7uMCF77AHrB6ZAnrycGF43vE5m0EerkvoEGoZ2Ao9nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PA1PR04MB12198.eurprd04.prod.outlook.com
 (2603:10a6:102:560::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 13:31:51 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 13:31:51 +0000
Message-ID: <b81b6e6a-10b7-43eb-b857-6c0d2636427e@nxp.com>
Date: Wed, 4 Feb 2026 14:31:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC v1 07/11] media: Add meta formats supported by NXP
 neoisp driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-8-antoine.bouyer@nxp.com> <aYIsHfpMc2DZXYBr@zed>
Content-Language: fr
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <aYIsHfpMc2DZXYBr@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::14) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|PA1PR04MB12198:EE_
X-MS-Office365-Filtering-Correlation-Id: b937e0bd-c7e5-4bc6-be04-08de63f1c0e1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bUE4eHgzRzAyVnJxcDcvRlR4RTV1a0dYdWVrZERUOXpMMkRGTndiR1A0N3Fi?=
 =?utf-8?B?YWF4aUlNaWtYc1ZQME0rMWRWNjZuSHE0VlBCazF4akNrSFFoVzU0UW5ycjl5?=
 =?utf-8?B?VGhFc0VJc2s2WVdpSTZmejFmcDRFQWs2OTExWGRwQU9GSkdwVVFYNTdVNCsw?=
 =?utf-8?B?Q2NHcU5mUElncjltSGg3MmhYVkV6Sk5waG0rWUdUS0pNK0Z4VTFMRExLUGt5?=
 =?utf-8?B?NjZEWndQZlBCRkdwQ2lPSmR0QUNscDc3K2Y0UlB2aGFHWWEraFFWVWJSa0JI?=
 =?utf-8?B?Qm1sOTVEa0tzTThuZ3NIQUc0d2VnTGZVTjA3d0ZLc1p4WWVFYTFMNzhQaDMr?=
 =?utf-8?B?aTEyanM2eFMvNDUzSTJIbUZiVU56YTI1VHl4OHA3Z2xkTm9MdWkxRTlONW9D?=
 =?utf-8?B?dzIyS3dmNmVUTngvK0NCbHEzUzFReWI0N3MzWm9wU0lFZzJ5VE56RENrNkVv?=
 =?utf-8?B?UE0rZFFuNHZDQmJtWVN4c01ZbjcwcnZ2Q0JxeWZOMnlmNG9CQnlIS3RyZW1E?=
 =?utf-8?B?YUhEbFRRS1V0WC85UnB3cGxncVpSVGsrRllWWldkMWc1UE9YdjIzeEZKdFNs?=
 =?utf-8?B?cU5qZ20vYWJ4MUZHUEQ3MVNDWmdmcFFwbnU3N0xlTnpEVGcyMUVpMVE3U3pJ?=
 =?utf-8?B?WFdTNGZMN0VkTEJnZHlJU0hwWkFnV0xENHQ4MkJUV3NxK21nUHZBUFVsU0Iw?=
 =?utf-8?B?UFU3b2hkUU9nTk81ZzI3Y2VYRjZNUm92RkxCQXpoMFc3NldZblFRTXlmSC9V?=
 =?utf-8?B?bm9EbzRHTzRuT2ZqWjhFODJKS205eEMrM2lud1pMbE5JK0tqeUFEZW1zU2hF?=
 =?utf-8?B?MlBnQ1BBa2MvWDZnWE12a25NSEY0TFZMaXBZNURoT1M5MTZYN2FFUEsxZlV2?=
 =?utf-8?B?M2VoUHoxUXNBSXJNSTlQYTkwUDAvSThiS0U1eTVrT0VXN3oxbXdkQW16aGFp?=
 =?utf-8?B?TVlWc3R1bXV4Y0RrTk9ZbGlYakcxZEFseDhCd1hkZWFWSmtmY3VoRklUT05i?=
 =?utf-8?B?M2NMY3NYSFByUmVDV3hPb3l6VUVNaGE2ZlltSGNteXBialdBVFpmVy81YUgw?=
 =?utf-8?B?YzQyQTVBekVJNmZJbUt5MXlsUkdKd1ZFRWllM1BKOEwvQ3I5SktpMVZMQi9a?=
 =?utf-8?B?cnAySXBIenpicmtWS2NOWWF4OFZ6aC9neTV3Y2czMUlpQzhmUUVabzNMSENz?=
 =?utf-8?B?NDBWREdvbEFJUzR4M2RFcWpWQmd3dHhFNjJWaHJEb01QRWVJSk9uOUFxSDVH?=
 =?utf-8?B?TFZDYU5lbkNDZzREV2o1WFRzdFJnd056ckRCVHdFc0NzZUFwZ0Riclg0NGFT?=
 =?utf-8?B?WWNLSjNNcFoyMVRLYjFKZlNRVDN3NElGeEluVXBQVDZmQlJVZnVTZG1xQnB6?=
 =?utf-8?B?ajc3VjF0d1AxWXJRSTkraDZFVklKTm40WEVSbG9UK2kxSitwYUR1blZXc1Fy?=
 =?utf-8?B?d05iSjRUR2xPYjhXMlo0N2I5cE9DUUZMNWJWVmNla0RySERZM3hTRHFEY1Bh?=
 =?utf-8?B?UzZaUit6RDFTZ1YrQnB1UFJld3Y3LzkvY0JiekREdXRXMUhKMVlMYTZ6Nnor?=
 =?utf-8?B?QU52dG1XMkpKQ3c3cUZ3bzNnQzNKcEc0dVdHQ3dkaVFjZVAwY0dzVG0zdmcx?=
 =?utf-8?B?alZSakYwVjExVWpWYndBZ2VzRkJYdFpkRDNlQXFGNmlraDdNeC9vdk5aKzNx?=
 =?utf-8?B?MWtYeFY5NVFqdDcrcGhoL2JOVU9RQ3VzZlVmTUJuTmh6dGVxWS80UHJHSmdT?=
 =?utf-8?B?SmhBb3Y4amtvb3U5MlljU1BTWmhmRW1neXMvcjRJKzFiZHp6cmx2T2RhaFNZ?=
 =?utf-8?B?bENsOGZTWFFpVDhxV0pKeUNtcGtubllnRHdlWWdTcGtEeVU3UXdCaUMrRXVi?=
 =?utf-8?B?b0w4c25aZHRiNXZrOC9xVUJCM1ovTkhLTGpWa2xtdHdvOFgwTUlvNVBYYVdH?=
 =?utf-8?B?dWt4VDBkdjBzQ292ODgzNHRhd0ZoZmRzNm5RREN0K2IxcjhSUlNMaUhKWmgw?=
 =?utf-8?B?N2ZDMXc0c2RZWUphQk9WckxVNERPOEI4MWovQUtpQk9CekVIeE1JbE1RUFVr?=
 =?utf-8?B?NDd6Y0RzYTZoN3FNZ0JETjNsKzU1UW12Rlc0UGZ4WnBzb1l6NjRCaG5NcWpD?=
 =?utf-8?Q?kYy4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cVp3aVlpRndYUXFabVVFNmVyc3M0TW5ETzFYVzZ2ZnV6NGxhM0thYmlSenAz?=
 =?utf-8?B?NGFOS1RYTFJRV3Nna0VMeG5qYlgxd1RWcnRUalZudXFlNDVvSGQ1K1pLUFow?=
 =?utf-8?B?V1pNMlhSaGppTDFLRWE0dFpoNE1TWjdGVFhGVmw3eWMzbk5BMUNoU0oreThI?=
 =?utf-8?B?ZWR6UEdXWWZJZFU1MlNCWVhiV3dWbUErMWNZZWtwbURDYmlWdW1PaTNlbTJ2?=
 =?utf-8?B?Njc1VmVnaFk0S2xzTGNDVmJ2U1VrVXJoaldxTVIxSHlNOEl3RFhJcEtrM0VV?=
 =?utf-8?B?SzdVVXp2WEhEd2h0VEhOWE04aGJZeTZ0cHpwYUlSUVI4SzhnQWVVdnpLMC83?=
 =?utf-8?B?cUpvOXp1YWQ3Skd3UVR3SkF6NzFITjlBVFNpQXhhMDByaFJRc2hYd0ZXVzJN?=
 =?utf-8?B?dmZOMmdZVmtVSmJ4dzY1YjJrd21LUS93SGtLc01veWFvdkRHdlZPVG1kM2R5?=
 =?utf-8?B?bngxQmhBeXFOd0VJY0RGUnVTZGpmOXpDM1JNMEVrd1ZZVWdQL0pVZWJ2N2Q2?=
 =?utf-8?B?SGxBY0Z4ZklqOXJFUTNVczNueHIrNXpVVjN0dkZNMC9kNnExSFJpY2lSS1ZR?=
 =?utf-8?B?dXlNWHMxbmxPcTBpSlB4cnRRQ3RORENVUENPNWxZZnREdG96ZVZkMGdxc3No?=
 =?utf-8?B?MGFqMGdZMzM0Sjh2VmcrSFJTcEJhdHdEQk9iTGdMUjdNYkEzUU9CZlAwWncz?=
 =?utf-8?B?TmxyVnZIVjZYTW1jMnIyVFJveFF0RXdMTExsY0ZQWmpxRUoyTE5EM3M5N3k3?=
 =?utf-8?B?YjdlekRZdEhPbGJiRUY1T1A4NjdrK1NRRk9yRnllOVhaVjFFTExMeWlScUFH?=
 =?utf-8?B?dG15dFVSODhmdVBGelhBdkN4ODBKQzQyVnZzRFBRSTFjemdzRjkyZTQ4elRO?=
 =?utf-8?B?cVNVRkhTaWFaeWx3K0ZiQ1BhVU8wSG93ODd6RG1FWW5vc3lZdUV1aVlxQm5Y?=
 =?utf-8?B?QkN1V3Q2eS9NOHE2dk5WcXgzWXA5blNWdTNYZ1FuMnYrYXB4cFA3bDdXZmpC?=
 =?utf-8?B?MnlmYmRmbkRudWQ3Snc4SDB5SEU1NTJEZjNobysrdUpHVXNBRDNYRWE1T1A1?=
 =?utf-8?B?RE9uNEluWDJ5SkFJNjd6TVQyb250MFFZcExqT2FhSkN1ZjhUK2ZTRnhJZ2N2?=
 =?utf-8?B?S2VDNFdxVVhQeGExZDZDNkpzWVJ3MDQyTSs0TVBsaXRRRllMb1FSZlYrYlZE?=
 =?utf-8?B?c0s0cElOc3ZsS0R3aWtiTWxnU01qTjdpV2oyNnZKa0dPNi9ucXhSSkR6Y0RE?=
 =?utf-8?B?empFMHdQcmNWbmY0NGxndmVpR09uTG0zM0I5anliM2FFNXdEcE9hL2dWa1l1?=
 =?utf-8?B?djlWTmFiWnh6Snp2elFHcFEybGtsTjVJc1pWUDlyTHF6cUY4bjJqY0JNQm81?=
 =?utf-8?B?VW9UZlpla1dMWVlVRmJGOWZFMUdMdFlxQkQxZlB6U0JHbThLZ2V1NGl6KzJQ?=
 =?utf-8?B?akZjcjVlbktmT09ra2daSGIvc1lVRFNsUGFQaE45U2FUVDRnR3p2bkJBMnla?=
 =?utf-8?B?OGpHWHdxZ0syNEJCQ3VXM1MvTFF6ekIyTFBUQWk3N3ppVlFFbnV4U1RSZmw5?=
 =?utf-8?B?VzhlOFYwMUEvbjZRV01lL2crVC93RHM2cS9MWjRKNXViZUEyNm12KzQ4L0ZT?=
 =?utf-8?B?UjI5aC9FSmFGRWdoa3hBNDllQTdLSVRvM0NFcDFacG03My9VOFJRY2pHNWJn?=
 =?utf-8?B?UGkwZWVwaVFDQjgzcW5OL0MwZkRLcUJKVzJKcmNLYlU4SmxlclZ0U3o0Ykc2?=
 =?utf-8?B?bHFQWFRoVlZEay9IVXJaSVBoMDZGY08xdDBuY2oybnM0clpXRGlUajdyNTFs?=
 =?utf-8?B?WHNsUWFRYWowNFFBa2I0b1Y0ZlNJcVRjTExUanpGL2VpekQ1YWRBWm5BVGJi?=
 =?utf-8?B?Z1M5eXhPR0d2UkpjbFEydnU2WEtPQ1YyWHhrRkVqaW8rMkJOKzFzSUExeFNY?=
 =?utf-8?B?ZTFJelorNjRPRXRIdjJRaUpWYnlvZWxqWHRlNk8wRitISFBqRlpDUFJTaWIv?=
 =?utf-8?B?RlJQeGZyRmdranYwR205SEJvYjJreVlwTWxiZmNFVTE3SDdHYVd4bENsdmsy?=
 =?utf-8?B?ZmVTZ3R3NlJxTy9XWTNhN1hNN1BKN1l4NHhlS1BHS1UvK3lheHpBY0JiU3Jv?=
 =?utf-8?B?anltYUJaZnE4aUkxN0l3OWhWbERBQzFhKzRPNW0xdHNWQVdCTks0Q25iTUF0?=
 =?utf-8?B?OWcxK1EzZEtTUlczeTNYUFRJTzE5VnptNFZldUdwdnJEYkJsaldWNFE3V3ZX?=
 =?utf-8?B?VTF1VmljVEh2cHVrVG0zRmJxZENxK2VuZk9abzE4ZjRBU3dFNjdiNkhzL1Ny?=
 =?utf-8?B?bjZSR1I4YzRoNHpHZzF4bDY5cnlad2pjQ3BOTzJVb2p4MDRISDdrQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b937e0bd-c7e5-4bc6-be04-08de63f1c0e1
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 13:31:50.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aYcb917m6qKPcjL4w/tlq50IwhPtm6EzN9t319EJMt/zeHC9R1uOLQqeP5Ya4gwQvHIOwXjIizo2CVL9z3zUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12198
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52184-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3DA2E6711
X-Rspamd-Action: no action

Hi Jacopo

Le 03/02/2026 à 18:11, Jacopo Mondi a écrit :
> 
> Hi Antoine
> 
> On Fri, Jan 23, 2026 at 09:09:34AM +0100, Antoine Bouyer wrote:
>> This patch adds new v4l2 meta formats definitions and descriptions used by
>> neoisp driver for the parameters and statistics buffers:
>>   - `V4L2_META_FMT_NEO_ISP_PARAMS` used for the legacy fixed-size
>> parameters buffer structure.
>>   - `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` used for the generic v4l2-isp
>> extensible parameters structure, supporting a non-fixed-size buffer and
>> changeable ISP configuration blocks.
>>   - `V4L2_META_FMT_NEO_ISP_STATS` used for the legacy fixed-size statistics
>> buffer structure.
>>   - `V4L2_META_FMT_NEO_ISP_EXT_STATS` used for the generic v4l2-isp
>> extensible statistics structure, supporting a non-fixed-size buffer
>> and changeable ISP statistics blocks.
> 
> Uh interesting, you have existing userspace that needs legacy formats ?

Yes we do have some available here (version with extensible formats will 
be the next one):
https://github.com/nxp-imx/libcamera

Not in mainline, thought.

BR
Antoine

> 
>>
>> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-ioctl.c | 4 ++++
>>   include/uapi/linux/videodev2.h       | 6 ++++++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 37d33d4a363d..c797cf11be38 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1471,6 +1471,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>        case V4L2_META_FMT_C3ISP_STATS:         descr = "Amlogic C3 ISP Statistics"; break;
>>        case V4L2_META_FMT_MALI_C55_PARAMS:     descr = "ARM Mali-C55 ISP Parameters"; break;
>>        case V4L2_META_FMT_MALI_C55_STATS:      descr = "ARM Mali-C55 ISP 3A Statistics"; break;
>> +     case V4L2_META_FMT_NEO_ISP_PARAMS:      descr = "NXP Neo ISP 3A Parameters"; break;
>> +     case V4L2_META_FMT_NEO_ISP_EXT_PARAMS:  descr = "NXP Neo ISP ext 3A Parameters"; break;
>> +     case V4L2_META_FMT_NEO_ISP_STATS:       descr = "NXP Neo ISP 3A Statistics"; break;
>> +     case V4L2_META_FMT_NEO_ISP_EXT_STATS:   descr = "NXP Neo ISP ext 3A Statistics"; break;
>>        case V4L2_PIX_FMT_NV12_8L128:   descr = "NV12 (8x128 Linear)"; break;
>>        case V4L2_PIX_FMT_NV12M_8L128:  descr = "NV12M (8x128 Linear)"; break;
>>        case V4L2_PIX_FMT_NV12_10BE_8L128:      descr = "10-bit NV12 (8x128 Linear, BE)"; break;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 848e86617d5c..5f4992452c66 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -889,6 +889,12 @@ struct v4l2_pix_format {
>>   #define V4L2_META_FMT_MALI_C55_PARAMS        v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
>>   #define V4L2_META_FMT_MALI_C55_STATS v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
>>
>> +/* Vendor specific - used for NXP NEOISP sub-system */
>> +#define V4L2_META_FMT_NEO_ISP_PARAMS         v4l2_fourcc('N', 'N', 'I', 'P') /* NXP NEOISP Parameters */
>> +#define V4L2_META_FMT_NEO_ISP_EXT_PARAMS     v4l2_fourcc('N', 'N', 'E', 'P') /* NXP NEOISP Ext Params */
>> +#define V4L2_META_FMT_NEO_ISP_STATS          v4l2_fourcc('N', 'N', 'I', 'S') /* NXP NEOISP Statistics */
>> +#define V4L2_META_FMT_NEO_ISP_EXT_STATS              v4l2_fourcc('N', 'N', 'E', 'S') /* NXP NEOISP Ext Stats */
>> +
>>   #ifdef __KERNEL__
>>   /*
>>    * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
>> --
>> 2.52.0
>>
>>


