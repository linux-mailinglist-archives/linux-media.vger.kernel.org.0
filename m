Return-Path: <linux-media+bounces-52828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kv9sOmLbkWmBnQEAu9opvQ
	(envelope-from <linux-media+bounces-52828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:42:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438513EE34
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B37300DF54
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 14:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9BA2EBB8F;
	Sun, 15 Feb 2026 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mPRtjKsr"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FB2194C96
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 14:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771166555; cv=fail; b=VWixV/DmW/9qs2KmW+OrDcfpTAk0iRZWeecTnk35J6bW6ezPOXkWvx5jSn/vSRS4dCgnyboAfljWuZiQ4hZ8sa675YStBXL6VEuS5Z6nFNXKRPIXxs6gENmV5MmZBcpZqbJt5CrF+cSPq4NDJZKNWxKSzCKwFgxQ28Xx0oo3G84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771166555; c=relaxed/simple;
	bh=HlgR1+QtDoottdYNI1Cx9VY5oUNHmkElqM/B1KB9wy8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e/BjpjuAyQPcKZ0lohcmnY0i9AcAzSkK+0CZEeFOc2wKNSY7qMfoVJ0f1Xh2VoVoFlOBYu9e7MvPRPmd4GWf0DaF+4G/qvtMDlkOua8zjW9TnS7347MqXKrLKAH5ycs/6xDm86CB6xlBW/mwrMx51eN9Xq3T3Kn6LjXmUvFHMO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mPRtjKsr; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxZ5l72/VU2FH4IFqMKzrAk8O+PGC8Pk9bJqRGU280+AQGG1zVemBdyDwV83O0fSIh2sNEUvPpFnVPq1q9TYjVYix2gF253LELyHPMfwM4OfP4nKlig2kp+rfard7vgjyUha5+FdqeI10vGL6U9Zy86qoJZZvfx5s7Cw3UuTxetKjNJuI4pphiigUWuHMQiG02/Q+f4hdIGGQOEC9K/zk4bQJHZ26XIn9iK2L6zTWs/mkPA6rE8bLSfCCaoOO6BLy6hVG00n4i2nskU6PBe/345tGQwg932s9tEM+BdVBUFWPxJk0J7ttz1NB7NXR1UWDJqE7BUmKfgWQitiM9WkmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DXMTB7wbgTgcPV0cMsqEtoTnD4wnOsXuRpNEoNsF7Q=;
 b=OcHCfAlWvQttbCCIkIT2hh5P90Vj1IJXXPL9M7Cm8rpGS+I26LvTYkd6S3RGwtOGG2MEag4uHjKXjQoeJvLZ4NoNZS1u/z2pdbvua727NEC1eZPi/pCv8a1Q62KnejtBu4FZnWqiH8k/NcQOcwxoYHYtttHFyoiK0UEAIUA3Y7U4Zzs4WNablGjWKDRZ+asHo4ZSngv8/qLCvXfH+bvqlnR0Fwi7YS+DggTmBNNHnvlycoTGYm7LCnfllbWWAKGz5y1QIyp6drjP7aQU8McIDGfSgJFFfj1xkNjSCHVEFmzTHpgaopyV0oriKFKqL/F4evzbR5KUhoVG6lIB4zLwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DXMTB7wbgTgcPV0cMsqEtoTnD4wnOsXuRpNEoNsF7Q=;
 b=mPRtjKsrJHHQHCdeLwg7u3BOS2jJXLjww6su0NQOpY213Dk155UD6zcKlvpnyx1hCYCSs8q66xUZ7zexX34Wyr5QdJoZQF4SNzkaWj7Y0PIv5s5qE38bAimvAJaZSgvhbKcR49qtGExVPrwiWCVeaB/I87wi3o96YvNhC0HL1EC9JFRtAMFNuvO+HkPrsNsHygQ0CoYB0OurxyTm7d0vW2bAPQJCuZ/LwSgDn0wQhQuZ/ZjQj24HMISYaZEw1hueTcoSQMi4GqJE3UqDw6R/MGFvp8VLwg9miKE00IpbAahjAaPTehEJrlkqvUrx/aUms7gpzqj9os88cQBrqm0lvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV2PR04MB11861.eurprd04.prod.outlook.com (2603:10a6:150:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Sun, 15 Feb
 2026 14:42:30 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Sun, 15 Feb 2026
 14:42:30 +0000
Message-ID: <08933385-5162-43ae-99fb-9aa5f6265724@nxp.com>
Date: Sun, 15 Feb 2026 16:42:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] media: mc: Separate single link validation into
 a new function
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-7-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20260211090920.1851141-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0228.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::49) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GV2PR04MB11861:EE_
X-MS-Office365-Filtering-Correlation-Id: 63e07ad0-f227-493d-f8ff-08de6ca07235
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VlFWQncyMExPNzF4RVg4UlZnN2IwYlFuT0dTMzB2c1JNdmpqaklFc3A5TE84?=
 =?utf-8?B?QjIyY1poRGtGYWF3NkFiUHkxVDBEMHgrUnZNaDdRNVY5aURRcG15dGwwWUFx?=
 =?utf-8?B?V3pyVHJBYVF6WGcvdlRDUWFBVzYvQit2bmViRURTR21zbkVMcUwzbU4xUU9Q?=
 =?utf-8?B?V1V2UHlZaGRyRjZ1ZGl3Y0NwZGxlSlo2KzhZMW9FdGd0MWJ4UURaUXpMUFVR?=
 =?utf-8?B?WlNTaFpOOVd1QXQ5NVVnRkpMdnkwNzAyUnQrQnU0ekVsa0NOYUcrbC9hZlhr?=
 =?utf-8?B?NFVGOE9tWEwrV0ZSY3NzSFhlb3g1dHZkS1A2alhNamRWVzNTNVp2T0NoRTBS?=
 =?utf-8?B?bmU3VnIyV2ErZy9teWZkb1duVXZ4ck50b3lTaEZLM3YvbndTLytsNXROanJ4?=
 =?utf-8?B?S1l0MlB1UEtuZXJMU0hjVGZ3dmI3SDgxWS9tdEtaR0RYcjhWNHZVUlZMZjVa?=
 =?utf-8?B?V1hoT1NVRWx1VDVpdldhbFJrcmxocmtUL1NqWEZaUDBTajhYUmM4N2d3cVln?=
 =?utf-8?B?eWdRMVpFc2xmb21jSHQvOUpNS1RFazB0THNZWDN1WEhxdXJEU0tTN1BaQXph?=
 =?utf-8?B?K3lvdmJWR0RKaFJ3NGtWR1lURXNaaTYyZVdxTWlqRGN0YnhQUU9vcjFINzQw?=
 =?utf-8?B?aHQ1ZmVIR3NWTkdXZ3RRaDV1QUx1bXZtSG5QU0I2TnQyWDdwS01lUUZOUkJV?=
 =?utf-8?B?aWZZaHdJcldrTE1KSXhGaEIwSUNodStocmFhMVNIWmtFS3gyQkNROE9CT1JO?=
 =?utf-8?B?NlJhckJ1Uk5Hanl4SXhIY3BFWmhueUZTUFdTamk4TlFhTCtPVTZ5dmF0SVlq?=
 =?utf-8?B?eExKV092eEFaLzdYR0tKRlNQSWJ4Yk1JM1R2emVHM3BPd21oMGMrTytBSEZJ?=
 =?utf-8?B?QTZ4WlFuTmdIUVBhTXFPTjVHVkdJKzhoc280QUJ3WDUrK25JNURadXg5ajFN?=
 =?utf-8?B?enVKNVkwV2pxNVhhd091bDZaR2cxVlM4VjVLb3lNQnM0ZlFnSDFGODRrZklT?=
 =?utf-8?B?WURXeEQzRld1R3VRQWNONUt6eHRSZHhNM2JRSnhYNlhiKzNOUklBWHRwcWtW?=
 =?utf-8?B?NmVmT25LU3ROWGFmdFRxZFJKRVZ0WEtiVFdteWpORFEzUm5kVUtBcTVhUmUz?=
 =?utf-8?B?U1FOeUVuaDYxQURGbExkYW1ONEZxWkh1aTgyRjBia09lekJvZmtKdVFibDRN?=
 =?utf-8?B?WmZQZXdTMW5OVTVTKyt6QXJlSm1pUmU3UWVyTGxVWFZIRThudWR2TDVva0R3?=
 =?utf-8?B?TnVWN3RnYU9SUmNJTUNZMEhBaUE5SlJwUkpYZ1NmKzUwMSs2MHpocUtiVVRW?=
 =?utf-8?B?VDRhV3ArQnNpNmhoYWZ0WWFVb2lwVGk0bzFEdEY2N1ZWbGEvc3k4bnArNDBH?=
 =?utf-8?B?RThMU1JDblFQSlZSU0d5ZCtJTFVnbWpFaWVUVWhoWGNicmZZM05JR2tGalR3?=
 =?utf-8?B?T3VPS1d2VTBHdUcrVEhHUVBXWDFQU25oMjdCS3V5V1hEM3k1YUFkK3BTWHNk?=
 =?utf-8?B?cGk2TlExVUI2dTlmZTJ4MXc0UDlUSmw1Ym43M2ZYQVU0aUdqQk0wWjkzRnla?=
 =?utf-8?B?dUVxREk5TjBDYlRzQy91SWcwY1M4MmhzanV4cDFxZE51RGxNc1lHVXJZWlB5?=
 =?utf-8?B?V3R1SnNCRkc3VTVGVk1sN3BZVGxqK3Nab2xUdVFtd3YvekRLNVAxcUdsZ3dN?=
 =?utf-8?B?cVAyb2w2TTVxMnFiQVhDNXpvRkhLc2JZcjUzejFGVGtndVQxOE1tejJYOEJ3?=
 =?utf-8?B?Z2p0L1AyUUxOWm9jcW5oejRPQ1JqY3o0MXRPc2dNeGRpZDZmUlBPQ1RLd3JT?=
 =?utf-8?B?OWpWd3lTL2RQNFBOeWhNek1rVE82ajYzQ0hIWHl4cnVNTzB0SlVNQjhzVWp0?=
 =?utf-8?B?TjdDdWVOOEN4OGJqb0ttUmRMdU4rTlBXblpSc1Joeks1MWZSdDMwdWd5NGM1?=
 =?utf-8?B?bWRTaGRZanE0MkwvNkFGYVlqRkNjcEpLKy9NUEFINlNTM3dMa0FidVFicXdp?=
 =?utf-8?B?RExtd0k0RDdpeERqcEdjckt3ZnZCb2I4RVltM1hvUDRXK0d1RzRKcGxHV2h3?=
 =?utf-8?B?RGZqNGhMSWIxcVMrQWRoaFFEWWNaakwrcDl6ck5mWlVIby85cnAwZFVraXk4?=
 =?utf-8?B?bDlwNEZtZENaOTVCK1RvRkZkZUxMQjZLVER6V0VNSEZ2eEdaZG9GTU1CZDEv?=
 =?utf-8?Q?NYOyFtblQdz9/3XoBehzBbY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bE5Lbkh4ZHowV2Rwd2kyVTY5c2RiODVadDZZMm1nWjVmYmlMTkpuODFEQzNQ?=
 =?utf-8?B?NkVQaEhkT2ZOdkFkZFNRU1hNb1BrdmsrdWdyc3hsS2gyRjRCNUg3THRHa3Ir?=
 =?utf-8?B?bFNzcU1SZUIxbll5ZUlyQzcwOXZBWHhJeTY3UU9jUWJoRWlRMy8yNzkvV2lZ?=
 =?utf-8?B?M0M0WUdIcjBRTXN0VWZvMDJUWXByVTluNks4QUdiVEt0T2FOSklVd2NsOFdz?=
 =?utf-8?B?MDFWZm9vbWdVaXVkQ3NIVyt4ZFlKcmJPWWF4TW9wbWZCdTl5eTd0UjNXWUJS?=
 =?utf-8?B?TlpXcGhFSHQrMmJKVWxlcVJGNVNtby93K0d2SU9Hc3Jna2RuSEJwTHg0eUk4?=
 =?utf-8?B?K1g5VzhlUHJPYkZCVm03dnVvRk1GVEtocE81SlgwTXBtUVk3RHB6MEd1OGx2?=
 =?utf-8?B?SWFRc2p2TDRScWJBNnlVVjk4NFNNMlFmWFlpUEo3U0xGWFJlL0xPRXcvaVhq?=
 =?utf-8?B?RllqODEza251S1BpTFlkOFBOZ29WMWhRSktDNk5uZ0VxL3JnNUhodmRJbFJu?=
 =?utf-8?B?MHRjblEzRmZCV05VTTltKzRUNWRWdXdhb1Z3MVRub0hFd1R4VHBaWDd3Y2Qw?=
 =?utf-8?B?aEVNcWtyUUphVWV0bGxYRGVSS1p2UnVwdnNOVVVTWXBTc01UZzc0YUh2akI4?=
 =?utf-8?B?MjZOMHpQdWZjdHRyTThHNDB5ZnNpUGtYRjNENHltL0lPcXhkNTU0dWdjQmpC?=
 =?utf-8?B?dEV1QmRpNE9uSEFQK1FVRDVhSmoyQzl3RFlPODhhOFcvVkx3UmVvdjdtcDNW?=
 =?utf-8?B?NElGdkIrSjRWc3BCdXpPUTNSeE13cThmeExuZGIwdlMxTzZ1YTVJL0ZwdzJw?=
 =?utf-8?B?SXh5dGRLL24rbG9vbHJMbit1QkRhS0xtQVVEZmN3dDlZdDVPb3pvYWk0czNX?=
 =?utf-8?B?RXphS1JCbjR0T0ROejg1U2hSSXhqdE9BdWl2U1Q2NXBUUWg3OEJncG80Y25q?=
 =?utf-8?B?dXRmRVp2ZXRPZE1oQWlCcllWYjFSZHdPSHJQNlMyZThNL05PbWtJZVpCMkVr?=
 =?utf-8?B?NmMvcUZXTFdGbjhBWFFhQkR1eC94cFdsbVBaUVIwMXN3MlpzS0dBSFZGVFdh?=
 =?utf-8?B?K1Z3V3NwWXRwZ1J3ZlJNbVRadDc2S0M3Rllvd2JueTh2ZkkrSk1wT0Q2d3dq?=
 =?utf-8?B?amJjWkRuZFUrVFhmbThLQUljTXZuUVovdWdoN2RpZVBrWFlGdVhrdXJJYklU?=
 =?utf-8?B?a0hsTDBOK2VJWitMazVlZWVySElvNmpqZ25pTFJSMURBajlDeXBHY1BHU0J1?=
 =?utf-8?B?WnNyeUhBUjJKSTlMb2g0VjQzV21FMmFOYUtFNXU5RG85c1BWM1plUDZQMW9B?=
 =?utf-8?B?dHRLbk9jdVlUQWo1Z1ZWVzhtZE9ZT2wxaDJUY09YV1VNcVJyTFNwWnpJTHpZ?=
 =?utf-8?B?dnNZZG91clc1bm9Db29MaXhicUc1TzFuK2hMT0NzMWZCbUNXSEZyb2QyaTZB?=
 =?utf-8?B?czZlYk9zbUN5OHJXY3J5cWdzbXZKSmtMZ0t5WnpEYm5UYzlGcUdBWXR1dXFS?=
 =?utf-8?B?OVh2Y1VPdEpIZE1jRkVHYkpsRUFQazFXMWpsWDlPZENVYVA4VjYyQjErc3Jt?=
 =?utf-8?B?V1k5b3JOZjY4cmliUGxqa1Erak5UcU9lS0J1V3FiaGtNQ01VRElKeVpkZEZ3?=
 =?utf-8?B?YXZNZzJmZGoyNkhWNEtNTzBzS0ptS2hrRTIyUGdCL0VlcWU0NkJLREVsYldF?=
 =?utf-8?B?V0JvOUd0RG5xWnQxYmNTRHVickVyRUhCN2NWY1dZMFEwU1c4dGVQUVlQNFdm?=
 =?utf-8?B?Y1NpYmwwUkE1Mkc5RnRlYStWb1hwUS9YUHhiL1hRV1RGcXI0WkJzcDZIRGZ0?=
 =?utf-8?B?ck1XUnVkYS85Z0FwSzFaaXlIVTBvRysrZU9kcjUzcE13Q20rRXJCWHY2QzRh?=
 =?utf-8?B?eFgyOUg0NytLeG5zY2RiZXVaUlcxeHNNejROZk1SSFU5OUFITG92TjhzdEpH?=
 =?utf-8?B?RWZPL3VFSXNOYWhTR1g5Y0ZKdUgzbkJ2Rkh0ZlJ1eUMreEpZdXJZK2FhVlFx?=
 =?utf-8?B?WG5KdzFwYnc1eXAxTlhYZnRkYnAxRUJuQzNZZmY1OGU0VlNmUGlHZFZUcW1O?=
 =?utf-8?B?Si95T0xURmV3Tmh6R0N2cXhRUEhQdHZsdnYyNEYrcVV0NW1zUGhXemJiTGZp?=
 =?utf-8?B?ZUhlbWhKVXo2MHRJa091ZU0yeG9EdGRKbGRpRXZMM0w4WkJGZW5YU3Z3U29W?=
 =?utf-8?B?OXZsRklLT3RVNW12UlZxYTQ5RHg2K3NuSXFxdFRjdUlWWWVSaHVZMDNTMS9V?=
 =?utf-8?B?MklSakU3QlJMM3pkNTl1QzlFVG9JWWJlcjZneXRReGptQjVsUDRkdGtHT1pa?=
 =?utf-8?B?TXpUQ3RkOEZuQm5LdHFiTXJ5T2VncCtzc1hVUHZ0TTY3cFhRSGtuUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e07ad0-f227-493d-f8ff-08de6ca07235
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2026 14:42:30.1283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJa1OSPvH39uK2U8LONB9imEsHdOgIP48tF3ZjgSaeXgzheMv3iNN0xgzvBJnSdpvHs/kNblnKBQjisP2kq3Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11861
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52828-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3438513EE34
X-Rspamd-Action: no action

Hi Sakari,

On 2/11/26 11:09, Sakari Ailus wrote:
> Add a new function __media_pipeline_validate_one() to validate a single
> link in a pipeline. This will soon be used for performing validation in
> multiple phases.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/mc/mc-entity.c | 80 +++++++++++++++++++++---------------
>   1 file changed, 47 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 9519a537bfa2..ef959e9bb313 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -768,6 +768,49 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
>          return ret;
>   }
>
> +static int
> +__media_pipeline_validate_one(struct media_pad *origin,
> +                             struct media_pipeline *pipe,
pipe parameter is not used
> +                             struct media_pad *pad, struct media_link *link,
> +                             bool *has_enabled_link)
> +{
> +       struct media_device *mdev = origin->graph_obj.mdev;
> +       struct media_entity *entity = pad->entity;
> +       int ret;
> +
> +       /* Record if the pad has links and enabled links. */
> +       if (link->flags & MEDIA_LNK_FL_ENABLED && has_enabled_link)
> +               *has_enabled_link = true;
> +
> +       /*
> +        * Validate the link if it's enabled and has the
> +        * current pad as its sink.
> +        */
> +       if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> +               return 0;
> +
> +       if (link->sink != pad)
> +               return 0;
> +
> +       if (!entity->ops || !entity->ops->link_validate)
> +               return 0;
> +
> +       ret = entity->ops->link_validate(link);
> +       if (ret) {
> +               dev_dbg(mdev->dev,
> +                       "Link '%s':%u -> '%s':%u failed validation: %d\n",
> +                       link->source->entity->name, link->source->index,
> +                       link->sink->entity->name, link->sink->index, ret);
> +               return ret;
> +       }
> +
> +       dev_dbg(mdev->dev, "Link '%s':%u -> '%s':%u is valid\n",
> +               link->source->entity->name, link->source->index,
> +               link->sink->entity->name, link->sink->index);
> +
> +       return 0;
> +}
> +
>   __must_check int __media_pipeline_start(struct media_pad *origin,
>                                          struct media_pipeline *pipe)
>   {
> @@ -838,40 +881,11 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>                          if (link->sink != pad && link->source != pad)
>                                  continue;
>
> -                       /* Record if the pad has links and enabled links. */
> -                       if (link->flags & MEDIA_LNK_FL_ENABLED)
> -                               has_enabled_link = true;
> -
> -                       /*
> -                        * Validate the link if it's enabled and has the
> -                        * current pad as its sink.
> -                        */
> -                       if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> -                               continue;
> -
> -                       if (link->sink != pad)
> -                               continue;
> -
> -                       if (!entity->ops || !entity->ops->link_validate)
> -                               continue;
> -
> -                       ret = entity->ops->link_validate(link);
> -                       if (ret) {
> -                               dev_dbg(mdev->dev,
> -                                       "Link '%s':%u -> '%s':%u failed validation: %d\n",
> -                                       link->source->entity->name,
> -                                       link->source->index,
> -                                       link->sink->entity->name,
> -                                       link->sink->index, ret);
> +                       ret = __media_pipeline_validate_one(origin, pipe,
> +                                                           origin, link,
> +                                                           &has_enabled_link);

Shouldn't this be __media_pipeline_validate_one(origin, pipe, pad, link, 
&has_enabled_link) ?

Also, before refactoring, there were 2 checks, I think the first one was 
unnecessary:

                         if (link->sink != pad && link->source != pad)
                                 continue;
The second one was more complete, it is the check that should remain in 
the end, either before calling the new function, or inside the function, 
but please adjust also the comments according to the actual code:
                        if (link->sink != pad)
                                continue;

Regards,

Mirela

> +                       if (ret)
>                                  goto error;
> -                       }
> -
> -                       dev_dbg(mdev->dev,
> -                               "Link '%s':%u -> '%s':%u is valid\n",
> -                               link->source->entity->name,
> -                               link->source->index,
> -                               link->sink->entity->name,
> -                               link->sink->index);
>                  }
>
>                  /*
> --
> 2.47.3
>

