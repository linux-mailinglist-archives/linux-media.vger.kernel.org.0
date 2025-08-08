Return-Path: <linux-media+bounces-39162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D86B1F0D6
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B855C7B74D4
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A99B28F524;
	Fri,  8 Aug 2025 22:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PM0uGXc9"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108B428B3F6;
	Fri,  8 Aug 2025 22:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692863; cv=fail; b=b1RzQo/u1Bc9tK4QOE8zmIL9joFeEYpWCFd1913YFbfQj+gVzXV+uo2PvyUQFGt52JLNOVq4GIAC/GegSBlqMHcfDTAb7qwWJkj4LfpJJoD0x2BjaaIfTjzJqazmpFeNYdAdWIhs1aTPdQk8X4KY9IH0KvM82d5wufVkIo5sp2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692863; c=relaxed/simple;
	bh=nsY4kQ5lrVqp8QGK4PMON5/Z4Hx6aVroYqiZQG5pXwk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=akdLKwfv5KGdyIqb0uRZGo61JNzQnnZPS8JxswhCAGLIX/Zz+6De+GWm2MRK8xKC/8+o3W/S7b/B5Y5hqnYd4SFEclWRrBsBcp6N7ii4uIwBZQm+tPUhizalbgENdKybmj3TXMkhlyLP7qCv4UK+GkOptIqEgMM7JyVQrfzRFnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PM0uGXc9; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOXBk7VnHYYMT4hSHjHdHgq10ONa3JbDQzhzcT4SM/PARwnDgcIQQdu9BATyVJnYV/U1mLKUFdAHV/Se07/Pz29uxpEsYOkuvQSfq0dyPmqCbeZmr1DtT+Xf/D8fQz6qy02Dm2mncSi4Uj9TZD3OkK1mIoi8CL+Y1fJGobIB67gGUaZuwB3UhIMZ2uXgjDna/8q1guF7jWm2LVcbcqUTS4YaARDnYfpD8TLeCPO2g/EJcdReITQrkrbSy+S/s81BLg8rhv9YoUwh+P0l6+2s6li5j9v6rFG70twERZ3HtmAn0h6bFtvHvXyeJmYTIQH1uJTnRDuX9HNRzDs9Ry9l5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dB7CX7IdpXcppfZ7hQC/jLotJs/9pmfw24+l3/QzGd8=;
 b=WSdECBzSiDsaxTCqaFArxcAKZHRE2HF06OO0kfKN9OibzAGxCvJci0mmJHcT9u1iJzVKR7UrisltfxmZOP3/sUSSjsl8nkGMlnsao+6nuqgB9gwY/0SoKDO57XuiYf9TO77TWV+44VMkAb7uT3VwdbE9ZKbCN2dWIMBd1RdusnFMRDthQ60Iw1fjrr2D5OTikt9zaz/pocQ/Ea4B26mOyR+UI63O9cMqNJHswhQGPey04RTCFoa11SSARnobeWRF/9qYWNgBqgxIP0hGfc2gYDdBZCBF00OKylIeSZHjY3ko+o1dz3AWqQCTlMIm7qm062vCMNa7Ey8lmuW/UHgJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dB7CX7IdpXcppfZ7hQC/jLotJs/9pmfw24+l3/QzGd8=;
 b=PM0uGXc9nj3K6XOUUb2hrfje7VNVtasTJXlBCB7uNYQ518ivuEfPMj+HozGVGrlIYelTqLDvXAORVxb4SqFD1iiCWPJPN7+Cf4CiX3qqBJwAoNLs5RykaqRorB9KrT0ApM6Pj8LN3PLj5RMWPYt7T+fYi2HatOnvt+9wMGrHd3kbLv/a1dVaDZ3hDYqJC53KLZ3zkRv3DvLSYaLZvITWGEFcgLTrUHAyO4jvwjnxddwH7fs9SdVBfUy6ZcXQXfcfeBE7phExXuLFSlsUSdLPNKX21nM91Jr+XkiUHnRjO0apiWDoClg7fhk8JKAUkbdfCNOpxoxSZmAcGwxAyqoWaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:40:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:40:57 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:13 -0400
Subject: [PATCH v2 10/32] media: staging: media: imx6-mipi-csi2: use
 register structure to match hardware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-10-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=10227;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=nsY4kQ5lrVqp8QGK4PMON5/Z4Hx6aVroYqiZQG5pXwk=;
 b=TGIocDaSdC+9P8Jxc9hARHs7aKCHlbgNE7ID6TunZLb3noxkgzsQnS6MYrcRZQjZwMLPLwFwk
 ER8un5Ub2yZBlCxItVM2p18TUYLEyOqmLQ0NJtg6cjlS1/hoopmhoyd
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f5f411-1dd6-4856-3916-08ddd6cca3fb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?N2pvV295eVVaNXNjcVFlN2RjOXpIUGFzNkVTN3R5TC9FN0QzOEtmNlNYV3Z1?=
 =?utf-8?B?OUh3UlJSRmdjd3RnN2xWZnVYTXc0Vmt2RjRLZVQ4NmlDcFJjUWdWcDB2SFNw?=
 =?utf-8?B?by9SczNtM3I5TERGT0QwcCtPVTJHTFlqT0U2aTBHRldXWnNJUXNnekptaU9y?=
 =?utf-8?B?UHQ1UG5SYWJOTkhTMG9uRlBlU2toRW5mQWJmaFpvMmtJNjFvTi9CTVhMMXFQ?=
 =?utf-8?B?Y3ZrYnVsUHJ3NEVXMGQxSzY3WWxnQ3pzaCtrbW11Wkt3M1ZJMDNRd2JGRzJx?=
 =?utf-8?B?WW1jMlpKSC9aRE9Jb0dKb2toMlJPYmUySzF1VU91TmMvazV1RjVNcThUUThM?=
 =?utf-8?B?L0tua0lNeEl6N0pVdzBJSndvQVkrbnROd01oS0EvZUFPZlIyY1J1Z2VHdjBz?=
 =?utf-8?B?OEw1enkxcUtEYlRhM2RKVmF1OVU3RDBQWEFGYytObDlGUzVEek01TzluOFA3?=
 =?utf-8?B?YVVOVXN0a1J2eWdHbnlCcFVQVkJTZTROa3NWdWE1SXoxNFhpNXFHOHltWHNX?=
 =?utf-8?B?WUIrR3RwN2w5YVdYLzMzVkNmeTIycW9yUVBNeGJHZFlTTkRTeEI1NHltWkNu?=
 =?utf-8?B?R25HL0FxUVBkTzlKVHZ3dUNtb25vNHZQMWQ0RnBCd3hBUXZ4eVU2b3VJL1VU?=
 =?utf-8?B?c0M0dHJ3QUJjSmZqWHY4djdlNU11ZkdobnJ3UlMwcEVZSFdGWk9UWXFLc2dN?=
 =?utf-8?B?dEl0NFQvTTRjN0NJSC90WGdMQ2lVOTh2ZUNTbTNjK0o1UnVHUDFHY0JuNnFa?=
 =?utf-8?B?SWNiYzBpb1pheG1qQ3hKUFVJUVVMVFg1RTh3eEJZbHR0TzN0QmtHd0h5WHFH?=
 =?utf-8?B?T3dvN3NkNnFsd2c5cWJzdjU2dWNMQ0VvUmhrNlJHaWJ2eFFaNjBySzluck1z?=
 =?utf-8?B?Uk5WTWtmUlZ5TkxEc1l0RDJmU212bUpQV1UrcTdmakh5ZzIzd3FPVGFyRjlj?=
 =?utf-8?B?blZuNldiT0cyaVdZaEtSLzF2NGNKSy90VXRSdEMreG45blUwaGhLendpZzdK?=
 =?utf-8?B?MEtabG5MeHNhTjlDOGpQYlpYTFA3MS9HNVNCdkIvU0F5WkhhTmdlWUppdkpM?=
 =?utf-8?B?aklnV1doVEdIRnNkaG1DZmlRODJaZVcreFc2NEZ2eE96bU93Yi91RGF3ZWdL?=
 =?utf-8?B?azlBbjlkbEdmQTJjSmEzVzU1TC90T0cyM0p5Mm9rVkRrdy9MaHBCcStrV3F1?=
 =?utf-8?B?ZGlsSmNOUnBGQ3gwQzYvR0tDWWRidUJmMVQ1RmhYb2Y2KzJVcEJtTmordUk0?=
 =?utf-8?B?RW5zL3ZDRUI2VHhaT01Ud21vZTlML3d6YTIzVmFEUUY0anFhUUlqbW5MMVJQ?=
 =?utf-8?B?TENpU3FaTDRQUHNDWU1LWDg2WFlRcWF2UzhGRVNtRmRQZHJ5eUlQb2lTZVQ5?=
 =?utf-8?B?MGRvVjVnKzlad3hrTVJ4YjhnQnZmZ3lwQXFWZU1ZUis4ZXlvYzhtekFWUURW?=
 =?utf-8?B?dU11TjdWTzduLzAwMThQbldlbFNxeks4WUdlSSt2RkREeC9xQm1CTVN6dUpp?=
 =?utf-8?B?a2VJYmQ0V1hPZXpOYVhwb0dXbUpjdUlncXNjUTN6YTVnWi8vcXV5OWlyRkRr?=
 =?utf-8?B?THVITDhXZUNoVlRGeFNMMW1wSmxSVjJZQTF2U1AxYVVYMWRJYUIwZjRGeU9u?=
 =?utf-8?B?Ykw2bHZqc0VldDE4OGp4Zitmdm1rb0o3dkpMeFNUUUs0N3lrV1lkUjlSOHpq?=
 =?utf-8?B?OHdub3dNZzRVek1zWGFSSzZLRCtOK0JyMmc0eGNndENkYkltZFBuWHFZajFV?=
 =?utf-8?B?bytQbE5QSmR1bk1sYVVkMHZvTU1oTkU1QmpCOG8xbEtqKzhKamZSSzRycElv?=
 =?utf-8?B?NE9MQVVyb0FCOHNkVnJ1WVhYRVRueXgzOVlONjdQZnFMWmEvL3BYdjNySDhZ?=
 =?utf-8?B?Wms5Tmo4VHByMDRtT2oxZkhqaGhNdFZyVG5uV2p5Q0lSL0ZGU1JXaWZSWFNx?=
 =?utf-8?B?Q0k2cGI1OFNJMHplS3I5aFk1NlFqK2R6anNaYlV4M3E3QVZEUTIzWVMwc3B4?=
 =?utf-8?Q?I4lR4DBg/yTnr1LBufkYXx9gvGlYvE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZWN6QTIrajBBZXVqZlVza2FlOUdPdXZOT0ZRSFpMY3BSb2FwUytaZ251V280?=
 =?utf-8?B?M2x2NUtERVpWR01KTTRsOXMvVXBuQmp6VjVzaE1GcDdDYnBITW1TV1hlbU1O?=
 =?utf-8?B?YkJLWklsdkJWVGdESDNuS3d2YXRpQ3dNU3Q3aVpnd1N0cWlRMjNZU3FJVVU4?=
 =?utf-8?B?Y0tESndzazluc0hBcTB0Wk95cXN3aHhxZkgxN1VOUUxmY0dZQ3dST3BJQ3Vw?=
 =?utf-8?B?UXl6RVF4enBycTJMM09YS0pkdERaclMwSWEvaFl6SzZxWVVTMnJjRUc5NTN3?=
 =?utf-8?B?UU5TYmFRbDhXMVVIZTEzS216aGsrZ3FLYnlmYzkxQUkxVzZqYXhPTUhBc2Iy?=
 =?utf-8?B?Y0RzdVdQRzhwYTN5YXQ3TEhuNFBiVGJTQXBFRUIxVmNFTDY0QkdyOUo0SWVZ?=
 =?utf-8?B?ZSttdTY1dko5VUhoMU40UFVTOXAzOHFVSk5NckVoOFVCazRmaENPM0hSWG5K?=
 =?utf-8?B?cm5Sais0OFVJNmM1cFZNOTR0N0poanhOZk1CRnhWM3k2UTE5dFM4OWhoL0xE?=
 =?utf-8?B?R3dWQmlqRkRaaURpT00wRWNBaXV4WVhEcWYyalQzMUtxMjBSS3VaN3UwZ2dQ?=
 =?utf-8?B?QXVZOTZvZVM0OGVWSWN0WW5yQmxHZ0tjRTl0T3VLTGJCWXhEMUxzd3VyTlJ5?=
 =?utf-8?B?YzF2bzcwZHh4ZGFoSitGYzlsWGtPdHdWOVdDQXdnR0ZPS2hSWHFxT1JEVDVP?=
 =?utf-8?B?SUpudExmaFJmZVlFZ0g4Y09xejhJekxZcTlVK3p6NFJkV2IydTV5d3N5YlBr?=
 =?utf-8?B?d3lMVVZ2WFpzYWllYTdwOHRNeWFwclBSS09lU3QyRlB4MGppMzhtc0FMUFFj?=
 =?utf-8?B?QXF2UlE3YUlGeVF0UkJwc29rYmtYUDY0a2xwaFl4US8xTDBYUzViS3dWd2N0?=
 =?utf-8?B?NjhDcDBYUzYyUDJXYTRtWXRJQjFRRUZ3ek9Nc2pIWWtYYkllUXNpbGY1Q0tU?=
 =?utf-8?B?WWNiRmlGMTNjL3U0QXdWWXBFcmF2VHU5ZzNpUU92SzdwRkhQMU05TzJpaGdI?=
 =?utf-8?B?UXJBWVJjcm5iYnMyeEdDU0pQQ2phRjFYdFlQYmQrZHFwaUFQN1F1N3Voc2Jq?=
 =?utf-8?B?cVAwdXg4cjZsREtkVVlsdjRQK0o4Ym1NdE00NE1CaGpiUWQ5T1hBTm9NYlV3?=
 =?utf-8?B?WUFRaTVvNU02eEEyWFlJSlAvTXcra3RwL2lHU2FqNFhDYkxNd2dkSEU0cTd4?=
 =?utf-8?B?dGp3MU4wUTZseWFILzJORTdadkN4NzY2Ri9BekNrRlhpVHVqZlZPMis5VnNR?=
 =?utf-8?B?aGNlTzdBNjkxaVI4cVVZdzJ4Zy9rRkRiVWFRdU91TExyTC9JN0RsZEozOE85?=
 =?utf-8?B?RHNuR3Y3amRIV1d6bmlwL0RTbVU0SlRuTVpwMkpFaXpTWHkvZ0NYNitySnZX?=
 =?utf-8?B?V2xoQ2V2VmRaRHI2RFc1amRsOWI3YlNGcWR3bnpOd1VjTjQranVnQ1NMeWY5?=
 =?utf-8?B?cEtsV0pmMFRLdVd2RjIzM08zM0c4ZWtlZ1VHZ0JCcHRDL1NPSm55ZnhKSFVW?=
 =?utf-8?B?YmZDbDV4bkJJRTFidml4QmZ0ZkpNUGRiNStvRmFVWitXOGkwU1hnYVhBQ2lx?=
 =?utf-8?B?NEZ6Tm5CR2xaNjVjdXJldkFyK0lYcERnb3NTdUY1NDE0bXR3U1NuK2ZrRVk4?=
 =?utf-8?B?VUZZam02bmRZcm5LcmNMS1gyc1pnaHFNcE5aZk1YT3dNaHVPbURqSGVvbTdI?=
 =?utf-8?B?U2x1cjl3azJhb1VGZzMrcUVGOW0vTWk3RWN0Q2JsV0JwYzQwSDNTOGJaLzZC?=
 =?utf-8?B?ZCs2WnFyQlU0UlhhOFpmUExkckxnZjVnM1BnUCs3RzNRYkFncDBNYUJ0NzFy?=
 =?utf-8?B?RlVJSzByVTA5MjZiOWNBYVJwZHdPeDVnMmNxUWtaeHBTaHFKdDcwZVIxNzl1?=
 =?utf-8?B?aFZLTGlXVGpoZGxWcXhmNmhpczdNTFduZ1hGd2NQVEdueDUyUFJkRmhUMVB0?=
 =?utf-8?B?bkZHSmNJdjN3RDh4L2hLdVVGbzlab0xoUndGcTBvMjBMcWY4b2Z2VnN3eTFr?=
 =?utf-8?B?Nng4MGlLNm9YdTFPektSdnVNM1VCUjcvd1kramtDWlNEaUQ1RStmVFZBNG5K?=
 =?utf-8?B?eExVTW9LL043VmdSWGxucVd4emlBSnczc2s0UUNDSXV2YXVDMlI4aGFyN0l1?=
 =?utf-8?Q?mLjzul0hIBDi9wv3kVW8c5B3z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f5f411-1dd6-4856-3916-08ddd6cca3fb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:40:57.0947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wL4djna80hhcH+VOy0YQx28l83ZN6JIRc3wnudKVrwfB601+2/FPBTCGdFHUbr8klVE6N+svoUpv5r9woOm/ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Use register structure to handle different versions of the DesignWare CSI2
controller, as register offsets slightly differ between versions. Add
register existence bits to detect invalid register access when using
different versions of the CSI2 controller.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 165 +++++++++++++++++------------
 1 file changed, 96 insertions(+), 69 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 73278d9ec2d66afa33b2bea17f2d56bb1391108b..cef9a5dbca40c94a36d5d8473d3b7d9806381bf9 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -34,12 +34,30 @@
  */
 #define CSI2_DEFAULT_MAX_MBPS	849
 
+struct dw_csi2_regs {
+	u32	version;
+	u32	n_lanes;
+	u32	phy_shutdownz;
+	u32	dphy_rstz;
+	u32	resetn;
+	u32	phy_state;
+	u32	data_ids_1;
+	u32	data_ids_2;
+	u32	err1;
+	u32	err2;
+	u32	msk1;
+	u32	msk2;
+	u32	phy_tst_ctrl0;
+	u32	phy_tst_ctrl1;
+};
+
 struct csi2_dev {
 	struct device			*dev;
 	struct v4l2_subdev		sd;
 	struct v4l2_async_notifier	notifier;
 	struct media_pad		pad[CSI2_NUM_PADS];
 	void __iomem			*base;
+	const struct dw_csi2_regs	*regs;
 
 	struct clk_bulk_data		*clks;
 	int				num_clks;
@@ -60,28 +78,53 @@ struct csi2_dev {
 
 #define DEVICE_NAME "imx6-mipi-csi2"
 
-/* Register offsets */
-#define CSI2_VERSION		0x000
-#define CSI2_N_LANES		0x004
-#define CSI2_PHY_SHUTDOWNZ	0x008
-#define CSI2_DPHY_RSTZ		0x00c
-#define CSI2_RESETN		0x010
-#define CSI2_PHY_STATE		0x014
+/* Help check wrong access unexisted register at difference IP version */
+#define DW_REG_EXIST		0x80000000
+#define DW_REG(x)		(DW_REG_EXIST | (x))
+
+/* Register offsets for v0 */
+static const struct dw_csi2_regs dw_csi2_v0 = {
+	.version = DW_REG(0x0),
+	.n_lanes = DW_REG(0x4),
+	.phy_shutdownz = DW_REG(0x8),
+	.dphy_rstz = DW_REG(0xc),
+	.resetn = DW_REG(0x10),
+	.phy_state = DW_REG(0x14),
+	.data_ids_1 = DW_REG(0x18),
+	.data_ids_2 = DW_REG(0x1c),
+	.err1 = DW_REG(0x20),
+	.err2 = DW_REG(0x24),
+	.msk1 = DW_REG(0x28),
+	.msk2 = DW_REG(0x2c),
+	.phy_tst_ctrl0 = DW_REG(0x30),
+	.phy_tst_ctrl1 = DW_REG(0x34),
+};
+
+static int dw_csi2_reg_err(struct csi2_dev *csi2, const char *name)
+{
+	dev_err_once(csi2->dev, "access to unexisted register: %s", name);
+	return 0;
+}
+
+#define dw_reg_exist(csi2, __name) ((csi2)->regs->__name & DW_REG_EXIST)
+
+#define dw_writel(csi2, value, __name) (dw_reg_exist((csi2), __name) ? \
+writel(value, (csi2)->base + (csi2->regs->__name & ~DW_REG_EXIST)) : \
+dw_csi2_reg_err((csi2), #__name))
+
+#define dw_readl(csi2, __name) (dw_reg_exist((csi2), __name) ? \
+readl((csi2)->base + ((csi2)->regs->__name & ~DW_REG_EXIST)) : \
+dw_csi2_reg_err(csi2, #__name))
+
 #define PHY_STOPSTATEDATA_BIT	4
 #define PHY_STOPSTATEDATA(n)	BIT(PHY_STOPSTATEDATA_BIT + (n))
 #define PHY_RXCLKACTIVEHS	BIT(8)
 #define PHY_RXULPSCLKNOT	BIT(9)
 #define PHY_STOPSTATECLK	BIT(10)
-#define CSI2_DATA_IDS_1		0x018
-#define CSI2_DATA_IDS_2		0x01c
-#define CSI2_ERR1		0x020
-#define CSI2_ERR2		0x024
-#define CSI2_MSK1		0x028
-#define CSI2_MSK2		0x02c
-#define CSI2_PHY_TST_CTRL0	0x030
+
 #define PHY_TESTCLR		BIT(0)
 #define PHY_TESTCLK		BIT(1)
-#define CSI2_PHY_TST_CTRL1	0x034
+
 #define PHY_TESTEN		BIT(16)
 /*
  * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
@@ -132,42 +175,42 @@ static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
 static void csi2_enable(struct csi2_dev *csi2, bool enable)
 {
 	if (enable) {
-		writel(0x1, csi2->base + CSI2_PHY_SHUTDOWNZ);
-		writel(0x1, csi2->base + CSI2_DPHY_RSTZ);
-		writel(0x1, csi2->base + CSI2_RESETN);
+		dw_writel(csi2, 0x1, phy_shutdownz);
+		dw_writel(csi2, 0x1, dphy_rstz);
+		dw_writel(csi2, 0x1, resetn);
 	} else {
-		writel(0x0, csi2->base + CSI2_PHY_SHUTDOWNZ);
-		writel(0x0, csi2->base + CSI2_DPHY_RSTZ);
-		writel(0x0, csi2->base + CSI2_RESETN);
+		dw_writel(csi2, 0x0, phy_shutdownz);
+		dw_writel(csi2, 0x0, dphy_rstz);
+		dw_writel(csi2, 0x0, resetn);
 	}
 }
 
 static void csi2_set_lanes(struct csi2_dev *csi2, unsigned int lanes)
 {
-	writel(lanes - 1, csi2->base + CSI2_N_LANES);
+	dw_writel(csi2, lanes - 1, n_lanes);
 }
 
 static void dw_mipi_csi2_phy_write(struct csi2_dev *csi2,
 				   u32 test_code, u32 test_data)
 {
 	/* Clear PHY test interface */
-	writel(PHY_TESTCLR, csi2->base + CSI2_PHY_TST_CTRL0);
-	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL1);
-	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL0);
+	dw_writel(csi2, PHY_TESTCLR, phy_tst_ctrl0);
+	dw_writel(csi2, 0x0, phy_tst_ctrl1);
+	dw_writel(csi2, 0x0, phy_tst_ctrl0);
 
 	/* Raise test interface strobe signal */
-	writel(PHY_TESTCLK, csi2->base + CSI2_PHY_TST_CTRL0);
+	dw_writel(csi2, PHY_TESTCLK, phy_tst_ctrl0);
 
 	/* Configure address write on falling edge and lower strobe signal */
-	writel(PHY_TESTEN | test_code, csi2->base + CSI2_PHY_TST_CTRL1);
-	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL0);
+	dw_writel(csi2, PHY_TESTEN | test_code, phy_tst_ctrl1);
+	dw_writel(csi2, 0x0, phy_tst_ctrl0);
 
 	/* Configure data write on rising edge and raise strobe signal */
-	writel(test_data, csi2->base + CSI2_PHY_TST_CTRL1);
-	writel(PHY_TESTCLK, csi2->base + CSI2_PHY_TST_CTRL0);
+	dw_writel(csi2, test_data, phy_tst_ctrl1);
+	dw_writel(csi2, PHY_TESTCLK, phy_tst_ctrl0);
 
 	/* Clear strobe signal */
-	writel(0x0, csi2->base + CSI2_PHY_TST_CTRL0);
+	dw_writel(csi2, 0x0, phy_tst_ctrl0);
 }
 
 /*
@@ -233,16 +276,15 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
 	int ret;
 
 	/* wait for ULP on clock lane */
-	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
-				 !(reg & PHY_RXULPSCLKNOT), 0, 500000);
+	ret = read_poll_timeout(dw_readl, reg, !(reg & PHY_RXULPSCLKNOT),
+				0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_err(&csi2->sd, "ULP timeout, phy_state = 0x%08x\n", reg);
 		return ret;
 	}
 
 	/* wait until no errors on bus */
-	ret = readl_poll_timeout(csi2->base + CSI2_ERR1, reg,
-				 reg == 0x0, 0, 500000);
+	ret = read_poll_timeout(dw_readl, reg, reg == 0x0, 0, 500000, 0, csi2, err1);
 	if (ret) {
 		v4l2_err(&csi2->sd, "stable bus timeout, err1 = 0x%08x\n", reg);
 		return ret;
@@ -259,8 +301,7 @@ static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2, unsigned int lanes)
 
 	mask = PHY_STOPSTATECLK | (((1 << lanes) - 1) << PHY_STOPSTATEDATA_BIT);
 
-	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
-				 (reg & mask) == mask, 0, 500000);
+	ret = read_poll_timeout(dw_readl, reg, (reg & mask) == mask, 0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_warn(&csi2->sd, "LP-11 wait timeout, likely a sensor driver bug, expect capture failures.\n");
 		v4l2_warn(&csi2->sd, "phy_state = 0x%08x\n", reg);
@@ -273,8 +314,8 @@ static int csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
 	u32 reg;
 	int ret;
 
-	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
-				 (reg & PHY_RXCLKACTIVEHS), 0, 500000);
+	ret = read_poll_timeout(dw_readl, reg, (reg & PHY_RXCLKACTIVEHS),
+				0, 500000, 0, csi2, phy_state);
 	if (ret) {
 		v4l2_err(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
 			 reg);
@@ -556,34 +597,20 @@ static int csi2_log_status(struct v4l2_subdev *sd)
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 
 	v4l2_info(sd, "-----MIPI CSI status-----\n");
-	v4l2_info(sd, "VERSION: 0x%x\n",
-		  readl(csi2->base + CSI2_VERSION));
-	v4l2_info(sd, "N_LANES: 0x%x\n",
-		  readl(csi2->base + CSI2_N_LANES));
-	v4l2_info(sd, "PHY_SHUTDOWNZ: 0x%x\n",
-		  readl(csi2->base + CSI2_PHY_SHUTDOWNZ));
-	v4l2_info(sd, "DPHY_RSTZ: 0x%x\n",
-		  readl(csi2->base + CSI2_DPHY_RSTZ));
-	v4l2_info(sd, "RESETN: 0x%x\n",
-		  readl(csi2->base + CSI2_RESETN));
-	v4l2_info(sd, "PHY_STATE: 0x%x\n",
-		  readl(csi2->base + CSI2_PHY_STATE));
-	v4l2_info(sd, "DATA_IDS_1: 0x%x\n",
-		  readl(csi2->base + CSI2_DATA_IDS_1));
-	v4l2_info(sd, "DATA_IDS_2: 0x%x\n",
-		  readl(csi2->base + CSI2_DATA_IDS_2));
-	v4l2_info(sd, "ERR1: 0x%x\n",
-		  readl(csi2->base + CSI2_ERR1));
-	v4l2_info(sd, "ERR2: 0x%x\n",
-		  readl(csi2->base + CSI2_ERR2));
-	v4l2_info(sd, "MSK1: 0x%x\n",
-		  readl(csi2->base + CSI2_MSK1));
-	v4l2_info(sd, "MSK2: 0x%x\n",
-		  readl(csi2->base + CSI2_MSK2));
-	v4l2_info(sd, "PHY_TST_CTRL0: 0x%x\n",
-		  readl(csi2->base + CSI2_PHY_TST_CTRL0));
-	v4l2_info(sd, "PHY_TST_CTRL1: 0x%x\n",
-		  readl(csi2->base + CSI2_PHY_TST_CTRL1));
+	v4l2_info(sd, "VERSION: 0x%x\n", dw_readl(csi2, version));
+	v4l2_info(sd, "N_LANES: 0x%x\n", dw_readl(csi2, n_lanes));
+	v4l2_info(sd, "PHY_SHUTDOWNZ: 0x%x\n", dw_readl(csi2, phy_shutdownz));
+	v4l2_info(sd, "DPHY_RSTZ: 0x%x\n", dw_readl(csi2, dphy_rstz));
+	v4l2_info(sd, "RESETN: 0x%x\n", dw_readl(csi2, resetn));
+	v4l2_info(sd, "PHY_STATE: 0x%x\n", dw_readl(csi2, phy_state));
+	v4l2_info(sd, "DATA_IDS_1: 0x%x\n", dw_readl(csi2, data_ids_1));
+	v4l2_info(sd, "DATA_IDS_2: 0x%x\n", dw_readl(csi2, data_ids_2));
+	v4l2_info(sd, "ERR1: 0x%x\n", dw_readl(csi2, err1));
+	v4l2_info(sd, "ERR2: 0x%x\n", dw_readl(csi2, err2));
+	v4l2_info(sd, "MSK1: 0x%x\n", dw_readl(csi2, msk1));
+	v4l2_info(sd, "MSK2: 0x%x\n", dw_readl(csi2, msk2));
+	v4l2_info(sd, "PHY_TST_CTRL0: 0x%x\n", dw_readl(csi2, phy_tst_ctrl0));
+	v4l2_info(sd, "PHY_TST_CTRL1: 0x%x\n", dw_readl(csi2, phy_tst_ctrl1));
 
 	return 0;
 }
@@ -719,7 +746,7 @@ static int csi2_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	csi2->dev = &pdev->dev;
-
+	csi2->regs = &dw_csi2_v0;
 	v4l2_subdev_init(&csi2->sd, &csi2_subdev_ops);
 	v4l2_set_subdevdata(&csi2->sd, &pdev->dev);
 	csi2->sd.internal_ops = &csi2_internal_ops;
@@ -774,7 +801,7 @@ static void csi2_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id csi2_dt_ids[] = {
-	{ .compatible = "fsl,imx6-mipi-csi2", },
+	{ .compatible = "fsl,imx6-mipi-csi2"},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, csi2_dt_ids);

-- 
2.34.1


