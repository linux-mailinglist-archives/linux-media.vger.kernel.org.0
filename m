Return-Path: <linux-media+bounces-19415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE91D99A121
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 12:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D73241C228EE
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 10:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D2619B5B2;
	Fri, 11 Oct 2024 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="czAizYMY"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8FB210C09;
	Fri, 11 Oct 2024 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728641870; cv=fail; b=GYLsGmUbtVtUEHzXvRoBmZ75xLMB8JnyFKR4lIVbgULs2NxU5yRv69e/gIqDPWFFkvekaZy0bF1RvJc3OhyEJjuwbZvve/YypHCbe2+7HXJxdTCVoTYBZCPZX/cHsYukCXvE87wP4EjPy+Q/QkD/QEfalcvxz1c1ijb5vQFI/vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728641870; c=relaxed/simple;
	bh=igaiaCdettWdD0mWb//rjiqLdRxHtDOsW99FZDtNaNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TEaaeDjnERKTDRArCFgSL4Co+/30OkMgkXo0dl5B0SWKjF1EF85enaNkwZiVbi764jvamFQcDzh/tN9p4ZRkcu3JlB+osui3BgVoDJxq8jT64lB2MperWtGI6/iQoM2sSH9K/1nP/DCm9SuvYlUbQVWdB6pdWuKYbXZCLV65J7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=czAizYMY; arc=fail smtp.client-ip=40.107.22.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhnjqbo0+CN9cvP700nEJILKZGDAadyGeeWiZjd4fgZ+5Ns4C0lqvPx4aV7UY8GqfsoM7CoMKdhK+Dk9SGJ5+Nv3Sx/Fk3OYEIhm94J4mYb5bb8QHots2fwm06sLxY8ndLWn0lLOy6GPPd5tKdGHRw64ULXjZsUIF6gnVqyHvd474NQSyBOpC97F2DLRn9ZXEt50I0olQkCXekcGwbNw0Otd4tHiUUtnEVFOyBj451p4afsFXJRixFTpZ7C5LYfqd1V+h9P9RhYfL1l8Ij4GboEPtyBOt2yGFNcETvc34q6nKf5rOQxVI46NMgIrbIzSfxytyLkvaDc0vKUQidc7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrToZeAd7gxE7v8SyH4+68ofrASs/O2PjVYiI/J58cs=;
 b=KkoZMXKUsTeycPGc+6bjyCFjVDYRfQHBqeoIZIB6as3wIcJxQgmfLCKtZe6IW3C3UOa5jDunwqQWFOiXH9SFB0Mdgpkn6KzF7H/RUowjn9nNKGLREFMFPTCE0vZPCWvFDq2EO+mP03Uv6wd7MZQXym5mwk+dejYy/20NlUPt4xlYK1mSug5a1CMVGv7WIEJwOx1VAmVfFkNN/4Nq+ud8kRxB79w3/QxZf6dORBKaypBUt9eWzNP01l33kgzK/mpRfPDf2tpTsAmRKOJjzsd+XDFhwM0CuSco++/Mttpmp3snLmqqGUSxxNxsC7fAfVeGDEo/w8hf/QzyrLWqAQ7icg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrToZeAd7gxE7v8SyH4+68ofrASs/O2PjVYiI/J58cs=;
 b=czAizYMYTQGYBLduxGbUTiva1s0XqETnTIJBxLsE+e6OWeNVbL3RTYWTF+RSz2ULzUagKlXA8gLZaRrvBrMaVdzJMtG5IimtyPyYIHR+zySmih+UZ9NdbxhFjPN6p66hJnxjD2JhcDEhv5Q1YdNNkvSqpXn5D6hJubKzl7XXDrLYuTTW1yAWZBYuM6E60ke8vY0xUO1TCWSWOCNDC2e7vgNkDTqkxwp3lMY/G/5mo+c6JSdNC0Zx3GtzWT1ckvQmiqEGepd8LIXVLdLnhfbVVqPKtEXlF5tEPQHANVdbYgUx3TiJaUsd+/6ktr3pk4iRMKAzIU6M+Y+BQeRkWg7Mog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB7649.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 10:17:45 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 10:17:45 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo@jmondi.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.d,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI compatible string
Date: Fri, 11 Oct 2024 18:17:14 +0800
Message-Id: <20241011101711.704226-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011101711.704226-1-guoniu.zhou@oss.nxp.com>
References: <20241011101711.704226-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0070.apcprd02.prod.outlook.com
 (2603:1096:4:54::34) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 0002a7c9-73cd-47e3-728e-08dce9ddf2b2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?aFJiaUkvWDdYSGNLR3JuM2hSbzBFbDEyS0ZqVWYzRWU0dVNMZFRScjRNZGUv?=
 =?utf-8?B?MWdhMkpPeXpub0trYnRiUnhjMThleUd6UGcxcHRCOG5CWW5pZzZNZGI0cDEv?=
 =?utf-8?B?VDltRmNIQUt3ZzZvbHFleVFLeW1xRTVlSi9zMkNsYkpWRGRHaUlaalpockh2?=
 =?utf-8?B?YnhDM2EybStSbEhXWXVFcHRMYjg0ejdzWWo3SFcwTnNiMGRWdmQrd3grUm83?=
 =?utf-8?B?M05KVktrUFFpUGJpK3pVN1pGeU1VZ00vbFN5UkQ5M0kzemRHRitMdmxyV3M1?=
 =?utf-8?B?alFjOUxrN05HRzlKRXdhZm5ZVDRpTm1RbGxPVlVBZjBjOWIrZWIyblNMUFhT?=
 =?utf-8?B?TVZDOWdiV0k2R1p2YXAyczZIKyt4RmlQaUk1WDlKTEY0SFBobE96T3lqRTV6?=
 =?utf-8?B?ZE5NWkpTTWVoN2IzR2VsbHorQ2E4dGR1Wkc1b1NUbDdmN1V3Y205cGJvVHMx?=
 =?utf-8?B?WUQzdnZwc0ZMM2dUa3djNE1JcDQ1ZVZ3QU40YzFBb3EzZk45QXA4WnFJUlJo?=
 =?utf-8?B?ODBtcUlKVVdGcHhzaTJnWEVyMjlqZ1VIKzdrbmpYNjdaQUNoWW9uL200Q0hJ?=
 =?utf-8?B?N1VOS2hBWHR5OXBWL0lzbERUM3dTN1lOY1dVNFdTbng3U1RqTnZzSDh4bWor?=
 =?utf-8?B?cFJOaE1LTVB1REtDbmJPOG90bGhodDkyRVNPdXJqdTNjWjdsbWJnWmVoTENG?=
 =?utf-8?B?OWROa29Pb29CTk84d3hpa29PeDZDbDh4UE8vWVFud2R4RmxDQTZHK2FDVkpN?=
 =?utf-8?B?SWhKTktMYS9vQUYwbkc4YzluR1RwdTdMMGx3MWFwNHJoR05SbVh0dkdTZUNi?=
 =?utf-8?B?STgrZ05BeDFWdThJd00wV3B3ZWZ3T2ppc0JzS0lSbFJ1SnloT055MXNlbzhL?=
 =?utf-8?B?OG5hUEF0dk9HWlA4ejRBZGMyYlUxMlA1YmFHcFpRNG9IYjlhQVJwUVpsN0I2?=
 =?utf-8?B?MGlUSEc5Z0djR0JqR0ptMHFrUGNBL29ySEpvNkFCT0tDNkVHc0Z4VGY3MWJt?=
 =?utf-8?B?cGMwUWo4ODhrcDFsVTRkdlJWa1NSMWpZV0hlaEluWlVzbWliMEd2SGxMUEZr?=
 =?utf-8?B?R25kWHNIVzRUczFhY3JubVJaTmUxTHlsMXFMVGV6aE9XYVo0SHpsYVBScktI?=
 =?utf-8?B?RXU3TmF2SEl0UU00QWZXSzdUL05ybUhsM1FsaE04Ynl6Qkc1Nk94N3F1bWNH?=
 =?utf-8?B?OHI1NTkySTBWcUt4aFk1NXRRbWZFVnNzOVFnOWpzbi9DQmFDZ2VLTnZEMEtk?=
 =?utf-8?B?ZWxya3hWaDVIdEdqVkcxcGd1UlNKREI3YytPYU9udkRlYTFjNmgzN2Y3SGta?=
 =?utf-8?B?eHZ0OXBiUlppQVZ6OTVEOW1mSHFKZ1RwU2tvTzhKVWVkTjNIVHNlUFVqYzVl?=
 =?utf-8?B?RWFlYWFDTVZ0QVVRSzM1c0g5K2NKR0xhandzMDRPa0pEdkw3SVJQNE5ndGlM?=
 =?utf-8?B?MGxnYytRTU1iNGVHNkY2Qzd6dVlzKzByaVpFS0ZhMFhUTUFzOXVkc3JpYk5V?=
 =?utf-8?B?S0cxc0ZzSGJNT1I4MGxFd3dnOEw5NGtubXUvL0ZSSHpVdytFRE1tSmllNWJ0?=
 =?utf-8?B?M0NSUmRiSXprSk9wU01wTGh5RmlqamlwU3dHaDBSK1lza0lHakJrR3l4ZFNN?=
 =?utf-8?B?TjVaM0s4SHhtdEtNaEhDaS92Wkgzdm1DNXhTQm9WMHRHYVhWTHdlYUJWUEl2?=
 =?utf-8?B?ZkRkODY1cXlrWGthNEh3SnVXb2V4U0xOcS82ZExPelBzTklJb1NsRzNoa2hv?=
 =?utf-8?B?MXo3d21pVnRpeUpRV0JPUUJKYkk2cmExOVZVUzM0UHJiZVJZR0liQmFpNitz?=
 =?utf-8?B?amRoNk1ZaTFVVjdPdXo5UT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UGVpcjMxMXdsL1BnSi9jalJDM0liL3lmTUwxZDF5TUpGcnZ1dWl3RVltUDg0?=
 =?utf-8?B?RmRpSEVLenVabzFFUzJqeE9MMVVYVnIvM0c0Q05VbUc2VUtEVGdBMUhRbGlU?=
 =?utf-8?B?SzNSZktpWlBjOVphY3hNdGs2Y1J0R09EZitDd3czb3F2bk51dVVad3RHV3V1?=
 =?utf-8?B?a0VOV1FqK0JLekdiSllRQmJ1L3M3T2xQUE9GcnV5UTR4K05DWDFtYTVTTjBG?=
 =?utf-8?B?MGVtMTlXVXdrdVh0LzgxczZzeGttSDJ5c3d1dDhYZUdRYXJPeUZ4M0lHN0Nr?=
 =?utf-8?B?emJrMDZDd3dzT2VabUNUMUZ1eFpyZWNLNDhPMlphWGlxWEQxMm44aWVtMHhy?=
 =?utf-8?B?djVVSlNrMzJoQUFNRDYyc1VzNGFuREhEMysvbjY1MTYyWmlEVkxOS2tFSmpU?=
 =?utf-8?B?VlptQktWbVVUbjVXS2N5aWgvT2lJYXZpRVpER3ZRU09ENGt2dHBzR1ZlNHNh?=
 =?utf-8?B?a2FQSnVTbExWcW9xRXVLbXpCbW5ja01GYUhlQW9Deloxc20zS1JqNlh2M0VC?=
 =?utf-8?B?UGtuWVprR1Uwc1M4MHBqK1gxWTk4MUNGdks0bWJiRDE0aDZ5djI4ZDB5V082?=
 =?utf-8?B?Z0ZLUUgyQWYxRE1uQ3FTUCtyZUpqVGdsUXhKR2JkaWtONXBOUThtRHNuSzV2?=
 =?utf-8?B?Y3d2dTRwU0h0UDJkVlBkQ1J4ekdKT25PZ3V0M3VTWG9EWTY5eW1UWDdWTklW?=
 =?utf-8?B?VmZJSDl3MU9aY1M0UG5lZFU4SlVuMlp3Z1RZU3dQZ3hGeE52Tm8wbnJibWlO?=
 =?utf-8?B?eFRETmVXQ25KQ05qOHA1anJhdTRqTC9obHYwS1R3ZUE1bWFqVHNQblllb1pa?=
 =?utf-8?B?VWtyU1Mza2lMaWxLcEZoODJra0NkZnJuYTRqWXQyVEpFZm90RkY0ZC9iMEIz?=
 =?utf-8?B?blRpUW04aE5Cc05TZFpILzJmQXYwc1BsbkdGcGVpWThGajgyQTgwNUZHZjh4?=
 =?utf-8?B?T1E0NDJ4eDMzNkZZVWRPK29GSmpuZVVCOTRsaFNtOElvVzFxZnNpWVgzeE1m?=
 =?utf-8?B?bVFPcS8wMHhabnJkRkFhcm4vRXdQUHJWWG1sZTAzY1VIVGFnbVo1N2JBdnBP?=
 =?utf-8?B?STI4ZjJRNml6WVBxWE8zdUYyc3dvU3UvQ2V4TW1IUGE5eGZSMWs3cWZBbU4v?=
 =?utf-8?B?RTM4SGx5ZUI1eURvTlZYZzkza1BMOE9mVk5QcDF6c0dwcE4vTnRCbVNVT0N0?=
 =?utf-8?B?b3hZQVR6SVdLd0tsdDBTMzZMWXNIOG5OdGlSc2d1TGc3UzEwRVQ5R1hHNCtO?=
 =?utf-8?B?U3NOeW5mU0I0Z3ZUYi9tYnJ4a1JjUG1IZnRobDl1alhWdzJqaWNPNW03Zkh5?=
 =?utf-8?B?cXo5S3VUNVJKYWtBVklVV1hpRlBaK0dWdXp5YUFXL0locHVaWHIzWXV5RDJv?=
 =?utf-8?B?OGxVRzFZTXROclJKZlZGRnc1aXJxdGdXdFQzTEZoK2RjY1VxNjQ5T0UxSzR5?=
 =?utf-8?B?eFVmaEV3UVNIeEVEK3h1WHZ2TFcwQmgyMUtEbjB4QmJLQVBlNi9xQTZiNmlQ?=
 =?utf-8?B?RHdXV2o0cXZTYWpZR25SM0FMaXZRMHJZTFpDUmVGVEtPeHRmMHFia1dsbnly?=
 =?utf-8?B?N0VVNmZ5Nm5oblU3bm90cUdvSzhQQUFGU0VUMmZDckhHYVJWNEpTbUNKQ2Ri?=
 =?utf-8?B?Y1RMUmlRb1NIaDVoZ29aMEk0WWlneEdvVUwza3VIYUFObG92V2s4b3BDRWhi?=
 =?utf-8?B?NklydHdIQ0laUXlLT25XSnZBUFF2R2pDd2trQm5uaURnUFlwR0lDeHQxTTI5?=
 =?utf-8?B?YTAya2hTQTgwMnBjakhmTHB1QWlyT0pHdFhrODRJMmVKRERlblZqc1dkbUxS?=
 =?utf-8?B?RnNFK2ppNVlGZEhKQzExWDJDRWYxSWNlb0hNRDRSRnI3MHZMMkk1YVZUeVhl?=
 =?utf-8?B?MmZ2eTJsOHdJdXZGM2RQamkzR1VDR1lpNmplWGg5ZUZsSkFPOGxqNzh6SUIw?=
 =?utf-8?B?NHhpeXhZVUVGbUlWdGdWU3J0SUdzSzM2cThUbjFmWEFzbUdlM1FqQU52NlVx?=
 =?utf-8?B?VWdLUU1YWjBLUmowWXVIaTVMT3JiVGw4ZnROVVhBOWZCd2dxZkV5U0hveDg1?=
 =?utf-8?B?UFl5a3lQWUV3ZkYrby9XYk9pRVY0TlpqUVZITWVJR3BLZ3cveEZuTzh4azNh?=
 =?utf-8?Q?jCYXSoYhUsFa+Aety5xP1rp/g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0002a7c9-73cd-47e3-728e-08dce9ddf2b2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 10:17:45.1564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5EgCHk08f7vPla52tH6GW0nseOBT0ZKaSRIx6gF2hSwOodUDk7b03rLBlXYvn1o8T6yG2fFXxix0h3nYYojfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7649

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add the compatible string support for i.MX8ULP ISI.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index 4d5348d456a1..f43b91984f01 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - fsl,imx8mn-isi
       - fsl,imx8mp-isi
+      - fsl,imx8ulp-isi
       - fsl,imx93-isi
 
   reg:
@@ -75,6 +76,7 @@ allOf:
           contains:
             enum:
               - fsl,imx8mn-isi
+              - fsl,imx8ulp-isi
               - fsl,imx93-isi
     then:
       properties:
-- 
2.34.1


