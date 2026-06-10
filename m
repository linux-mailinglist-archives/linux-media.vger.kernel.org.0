Return-Path: <linux-media+bounces-64344-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vd8uLr/QKGqfKAMAu9opvQ
	(envelope-from <linux-media+bounces-64344-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 04:49:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D06665814
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 04:49:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="D6Eb0c/J";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64344-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64344-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2115C307ED80
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 02:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B46320A04;
	Wed, 10 Jun 2026 02:49:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011067.outbound.protection.outlook.com [52.101.70.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838752FE566;
	Wed, 10 Jun 2026 02:49:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781059763; cv=fail; b=EvnUrIjPS7ZUfk0A3p+C8Bx0fy5TdiVMs/9FohkK5Tg8mF/quolhoBjD92Bx3/YhjkDqyjtxJ+na2UgzEhip9ok/PBEiMEOx2JzwxnaOhc6QOTOgi53E8uQvuNO750w6bdha9hXgy4xX8zPoosInJSKCpaDo4wxTq/qOeVEy6GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781059763; c=relaxed/simple;
	bh=8jmEAQl93u2CIZvmEs2SpzBMGSz3DS47WFPTN4r/zVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=itwI16sYEwr26AK3xpVCJMxvHhlSJl6iZ1xyTKNPwA4EOupOBPSHZCFYALoBiIDhHEM/YsgNc/DceyUff3H0XJ+7u0vctgUnOas/h6+meptjV7SktaetZW8eqPkkAKptumYuGLVa/2bZYYOvlR3Vj2aFpK/7quCLJv+ycXuX0wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D6Eb0c/J; arc=fail smtp.client-ip=52.101.70.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gny3xaBBTK3NON8Twkc1dr985Zs8gocTHiNPRf300uMnXTrBfrjOIFVrznQTj5MDyOGCUHknrCeCkdbhEWTPVJGwYKodJDy6m6shR0z/b3Tg44xTcL2bw4NtZf9EjpgNRgca/tUhb9b3OvlhJ8gkySoRpIEViVKwb+TLXxUzxQuS4pJR0cEU1TSsGbc8yl6E6Blbn6sn3gaIepvKCBVIo7omqZmqyQk019v1Ik8M+wK4YdQDkM7yC5C75voTGi8Gt25PzMze+1Xf0bW6WmQjD+wHFcs6MYiCrnbTOjypJfVsF42DPnjcY5KsFdj5Md1Js35MDpiopGy3L05Ro9BSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvNE1LTAn7Qb0T2wynKRiWNZAW4MRfY0pGmjAfYwpyU=;
 b=M6OmFCoZlYHRil2B+n92RFJ/nSWYwodU6ArENh2m/wZFim5zEi8XYIgCKj8tdKB9z2uVIi2UjHwYvhEPeuZzQjzHhrQ68PSKhZ+5EcpN9Tgmbaa2AbrlwONig5A6g0oLlZWMykSOkNy8J40lzO9W/DBddHFiF7Qa7ESKIBq6/Ci6eUeQ85JH/5TzkwMAnztDgJCUNUdgBB8yW/eTN7LhuBDHVRDTbaSbl5QJOE7Hwj9RxnRE4wAEyOX4cuek9J7L72AIohgSmMXMX+DBDjm+fAaR4bgJrWqVjlVk8qp7NZLgXScssmz6tdb4wXNrefO6Wc8KnpyfkyU/jozd/VgmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvNE1LTAn7Qb0T2wynKRiWNZAW4MRfY0pGmjAfYwpyU=;
 b=D6Eb0c/Je5tC+K9c3DjsvCLaKyr6lBMTbIGBpEW1nn5kQeJSDDJ0qBCYYfQXAcB08pFE0KviY+9mrxUcgbu7HgAYhwamg/fpAAHL/DCkx+PkVlrTLpi1fLkSPD6vJpfRoRpDK7i8JQIzEEu3mnjRtGYcN85Vv0jYba31T2QBY6TL1DeSlbcS4yFocQETQa6bCpPIEXHk4QrsOl9XVGMCYVFE4F2wgGAsY4B+tikpL9g8eZ5WMTcYk8gxXn4fhbT1vwf7EptZIOkrsIkMUad/3krLY+wC66bTeBT1yW/HuITjfkfyyV6ACJTjLXTZb6xsI1B5ZYSe9jJCtKqfMUwGbA==
Received: from AS8PR04MB8563.eurprd04.prod.outlook.com (2603:10a6:20b:422::14)
 by DB9PR04MB11627.eurprd04.prod.outlook.com (2603:10a6:10:60c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 02:49:17 +0000
Received: from AS8PR04MB8563.eurprd04.prod.outlook.com
 ([fe80::3f00:4490:e559:74a4]) by AS8PR04MB8563.eurprd04.prod.outlook.com
 ([fe80::3f00:4490:e559:74a4%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 02:49:17 +0000
Date: Wed, 10 Jun 2026 11:49:06 +0900
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"hverkuil@kernel.org" <hverkuil@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Eagle Zhou <eagle.zhou@nxp.com>, 
	Elliot Chen <elliot.chen@nxp.com>, Frank Li <frank.li@nxp.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
 V4L2_FMT_FLAG_DYN_RESOLUTION usage
Message-ID: <aijOPSFPEDsVlYFY@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
References: <20260608-flag-dyn-resolution-v1-1-44dc65516148@oss.nxp.com>
 <20260608040616.1A3EE1F00893@smtp.kernel.org>
 <AM9PR04MB857068E0FE59DD8ECB27A9AAE71C2@AM9PR04MB8570.eurprd04.prod.outlook.com>
 <e689df21c92861e35b6d11e391bea3404321484d.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e689df21c92861e35b6d11e391bea3404321484d.camel@collabora.com>
X-ClientProxiedBy: MA1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::21) To AS8PR04MB8563.eurprd04.prod.outlook.com
 (2603:10a6:20b:422::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8563:EE_|DB9PR04MB11627:EE_
X-MS-Office365-Filtering-Correlation-Id: bda7611a-56e8-4b17-3a0f-08dec69adcd8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|56012099006|5023799004|11063799006|3023799007|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2tDxXxSxiIhF/ED3i/svWNXLH4LZKVcM3+TdvvTS+u1OpLpqakvIcTUaJpgqnG/QmVXKIBHEvzoDlQjrmwYS0denuJG7rOqi1u1M5C0g5X7Ea0BYkWQWh5FJeGRbJiAQDS6N5CdqoJA+0kTMMURBHNFqhAgwBPx6wYOkySslQGXMP58DjPThVq6wkpmnpLX2v1Luyyisrgg5eWQXMM1jS6uLchN3Yts1Ru/2FBE75EEDq2xBAjqrlwpeN8ZqUGteDyVevJ83NatUWLNjkaaHkxykcI6q8NXqr8nAeElMBZwedRHx+Uz2xugzjGSKGpp0jSMxS+dkjzmUpsPZKFGD/ONsoW8y8ROQA1+BvZuFw4cMHgtSZJNAbAUbbDUQQVYLoBNilqz2AJOIOaWUzAZH0XvK5WMt1FsrVrtjGhQCONSn2pEDsbUeXv6jN0nKrCXSD9ULR1buSjmf+9Wv/GN4efdzRQ9lEVRIYIhqe18EikkeEj4mXS06q1/Q2YUVmySRB1cyl8BHQ0bmQcY9nGoVhb8FUDAaHtPiFsf64JBY7l9zdJnxotibG01mqLUOybrFq6y1FxmU0oyAAcFN/4R3vguQAax+l0hCCSeBRyEnWVMlhplamqp8tnDqNK1D1Vfi3Q5m/JRteQsdExOSVLkD7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8563.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(56012099006)(5023799004)(11063799006)(3023799007)(4143699003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnM5OUFkTG5YSGdZYWltWUo5M3NuQXhDMzRBc2RYb2VZWmJsKzR0QUlpRDFK?=
 =?utf-8?B?MzhJUGd4MDk2Sm1uUjd0RFN3dTM0eDlqb05xVGx4SCszOWdraXNFckZ5NEFT?=
 =?utf-8?B?ZlJSczcrb09kZnQ2eTY3TzYvZ0xiL1F1ZnFHWW9aVEpwYS9BTnJWNm5uSzhs?=
 =?utf-8?B?clZRU2E2WHIvdGtsN3hhY3llSVMwNlhPNVJ4TFRiblNkVjhPWGhGUGcrOUgv?=
 =?utf-8?B?ejMwbk8vQnhpa29qM21xbWRNV0cxQlAwWmJ3ZDd2c0NMMzRwZ1ZBNEZiTFlr?=
 =?utf-8?B?cVd1Ylh4RTRMRGlqTmV1TjkrTWU2VWZsQ0ZpWERyQ3IyQzM0MHJ0Zlh3czFU?=
 =?utf-8?B?Wk5MTG4xOVR6dlNBcEd0Vk9QSTNydEpzMW5mNGNwUW96aVlMMGh5UERiQ1hq?=
 =?utf-8?B?aWhUcC9FUVdSVExFd3o4QTd6eVhWdk9VdXZYaUI5K01WRGI2N2x6ZWIvaW82?=
 =?utf-8?B?NzZOeVlZOTdjemhxTW1PdGNjQUtEQnpvdmdDVWtoMUlxREZhbXkvZFN1NjJZ?=
 =?utf-8?B?b1d4cG1aQTg3OUpYSi9UQTRCZ3VYU2UrVFkzeG42SC8xejlIWDV2LzI2Nnhh?=
 =?utf-8?B?RHQ4dnNxdFdHR0lUV0tOcGhDTE9KTVh2VDczc0FDOHNFVElxU2hteFUzMjIx?=
 =?utf-8?B?eEZwU1RBcTlOYzBrSTlaOEVZS2VxYkVoVkJkVmRBUFR2WnFlb0J1WElTK0xs?=
 =?utf-8?B?RHdobXo3ZXB4NUZWNDIxZHNZbWhoMG1aUDQwdTVOeVpTNjVIV0xhV3JEU3kv?=
 =?utf-8?B?QVErc3Vtak5sTTBaUGxueUxwMFdtNk5XRlFoaCtmQ3lTVnRycmEzUmkrS1FU?=
 =?utf-8?B?c0dwL0pjb2hDaHpkbVorVyt0L3oyQmE4OHNRUytmV1dBWU5POW9ZdnAwTXFN?=
 =?utf-8?B?aUx1dzc5TlY1LzRXa3hyZmppRVpyTENOM0NZSi9mVTc1b2dIeVVJN29raTl6?=
 =?utf-8?B?Zi95QnJ1K2hOWlJSd0dpa2tteUR3MUtuRkFhWGpNYnlFRkEvTldZN3V0c3hz?=
 =?utf-8?B?cXZpMzVTenZCdDFNcGhIYnQ3M21tcytxUGh2Vldpek94eHNWUTBmWGNqNU9o?=
 =?utf-8?B?ZlVYMTZNRU8yVW1lWTJDK05KNHI2TisybE9abm5sS3IzTXprSUp1ZlBkN2ZD?=
 =?utf-8?B?RWt0WVl3VzVWTmp1VFZWdVJpWGxZanN2MFpqL2c2TFM2eFRaWURMZUhVVHVO?=
 =?utf-8?B?RXcxYTdXblhUV1ZPTkN2cjhOcVYwMktVbGlXeXVQU1VOV01sbVNPOFdNQkN4?=
 =?utf-8?B?WmM4amlwSVF2bnRpdjl6RmpJeHdPQVZVSWlaRWx5N3lSc1pvSTBZcjhtenFy?=
 =?utf-8?B?SU85SS9CRVIvMmFQeUowMmEwdURuSlBWeWMxYlJFMHk0ZWlGV3o3K3NqbUtp?=
 =?utf-8?B?NlZkL3VwU1lGMWVuSWZXZUVidXZEdlN0SEVNQjRQVm5XSEhKb1RuVjJFZytB?=
 =?utf-8?B?SG1LR1YwMk4vWlFMMm1kbkovZk1sTldhKzVmdlNUdENHb00rdm51T0JaUGRF?=
 =?utf-8?B?Rko1cWt6NlR6ZGZHYUhwcDZsa0RQdGFmOVRWbWJPZ0R2S0gwWWJ2dHc5QVNO?=
 =?utf-8?B?ZVVGR3d0ZlU4L1Q2ZUJJK1p0L0JITGdzS1RwWFl4emFCL3dUQ21NZmFpSG9L?=
 =?utf-8?B?eXVsMTdsZ2cwQUc1ZzM0OGdaMVlBTEdqN05DRkpycVVRMWtSU0gzbThjUFN2?=
 =?utf-8?B?RnR2QzdQR2svUGplK2g4QXJaRGdpMjgwSm40K1MxbGd4MnNyRStYR2p3cXV1?=
 =?utf-8?B?UmcrMzFESEI4amdZaVJYN0ZDa29KV0t5L0NzMDN4R0N4OTFYOW9nbExGZTEv?=
 =?utf-8?B?bVdycFlvNGxScmg0aVhNY0dkSlBsYjRjTmNadmgwV00zajBvV3FObEhrbHR6?=
 =?utf-8?B?Q3FULytvSkNsZng0aVlLUmxQZWJYejNIbiszbzc2bWEzU2JHc3J1dVFTajRj?=
 =?utf-8?B?aVhTT2ZsT0Z0ZzdldUJaK0FJdVh2L3FqRlhydlVXaEVwWE5HSXdFVlRjc21J?=
 =?utf-8?B?MEhXWTZyTnMrTmZmdnMxMmVWL2FYdWxPZnJ1VzMzU1VlNmx5ZlcxWEVzNE55?=
 =?utf-8?B?TWVwcTFLZTZ1MWZqOHJVamhKQW1EZnNERW95QWlZc2hiOFhRTCt3T3BpU09Z?=
 =?utf-8?B?dEIyeWJlclhtaVFFVFlteHVzSDUwbHZkaTZmbTVmaG8yQWxWYkYyNlNwd3pU?=
 =?utf-8?B?azM0MlVGajBYQTV3cTB3R0NjNzRDZk84KzFmQjNIWkJXL1k0YW1JSEZiRUhS?=
 =?utf-8?B?MDhzZ09qZ3FEakVDVE5TME9OODhuaG9xaUdkR2haZ1U4T0RpNGpnMCsrV3R4?=
 =?utf-8?B?djhwd3pxNjdQNGFySW1YdWRDUVM3b3hlWWZPVHBEcUFJdzQxdUVFZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda7611a-56e8-4b17-3a0f-08dec69adcd8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8563.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 02:49:17.2345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZC3ZJqYfkpHPo4l23QnxV+TSsMCD+A40X1S7Wq+QMqMkclHyKcVNJOfCaIFTZ0Am5rWzFGozdNKGsZMShk+Lyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11627
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas.dufresne@collabora.com,m:sashiko-reviews@lists.linux.dev,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:imx@lists.linux.dev,m:Frank.Li@kernel.org,m:linux-media@vger.kernel.org,m:eagle.zhou@nxp.com,m:elliot.chen@nxp.com,m:frank.li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64344-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sashiko.dev:url,vger.kernel.org:from_smtp,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,oss.nxp.com:from_mime,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11D06665814

On Tue, Jun 09, 2026 at 02:00:02PM -0400, Nicolas Dufresne wrote:

Hi Nicolas,
> Hi Ming,
> 
> Le lundi 08 juin 2026 à 06:26 +0000, Ming Qian (OSS) a écrit :
> > 
> > 
> > > -----Original Message-----
> > > From: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
> > > Sent: Monday, June 8, 2026 12:06 PM
> > > To: Ming Qian (OSS) <ming.qian@oss.nxp.com>
> > > Cc: imx@lists.linux.dev; Frank.Li@kernel.org; linux-media@vger.kernel.org
> > > Subject: Re: [PATCH RFC 1/2] media: docs: Clarify
> > > V4L2_FMT_FLAG_DYN_RESOLUTION usage
> > > 
> > > Thank you for your contribution! Sashiko AI review found 1 potential
> > > issue(s)
> > > to consider:
> > > - [High] The added documentation conflates
> > > `V4L2_FMT_FLAG_DYN_RESOLUTION` (which designates mid-stream dynamic
> > > resolution switching capability) with the mandatory initial
> > > `V4L2_EVENT_SOURCE_CHANGE` event. By stating "Clients can use this flag to
> > > determine whether the decoder will signal the initial resolution", it
> > > explicitly
> > > legitimizes a flawed userspace heuristic that violates the V4L2 stateful
> > > decoder
> > > specification. The specification mandates that for coded formats containing
> > > resolution info, the decoder MUST parse the stream and emit an initial
> > > `V4L2_EVENT_SOURCE_CHANGE` event (Initialization Step 4). Compliant drivers
> > > (e.g., `coda`) correctly emit this initial event but do NOT set
> > > `V4L2_FMT_FLAG_DYN_RESOLUTION` because they lack mid-stream switching
> > > capabilities. If userspace follows this documented advice, it will
> > > erroneously
> > > skip waiting for the initial event on these drivers, breaking Capture Setup
> > > and
> > > stream decoding.
> > > --
> > > 
> > > commit ec9c0583334c246f7813132b55724e42622e8edd
> > > Author: Ming Qian <ming.qian@oss.nxp.com>
> > > 
> > > media: docs: Clarify V4L2_FMT_FLAG_DYN_RESOLUTION usage
> > > 
> > > This commit updates the V4L2 stateful decoder documentation to clarify the
> > > usage of the V4L2_FMT_FLAG_DYN_RESOLUTION flag. It adds a note stating
> > > that decoders setting this flag will always emit an initial source change
> > > event.
> > > The documentation suggests clients can use this flag to decide whether to
> > > wait
> > > for the initial resolution signal.
> > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > > @@ -361,6 +361,14 @@ Initialization
> > > [ ... ]
> > > > +    .. note::
> > > > +
> > > > +       Decoders that set the ``V4L2_FMT_FLAG_DYN_RESOLUTION`` flag for
> > > the
> > > > +       coded format will always emit an initial
> > > ``V4L2_EVENT_SOURCE_CHANGE``
> > > > +       event with ``V4L2_EVENT_SRC_CH_RESOLUTION`` during this phase.
> > > Clients
> > > > +       can use this flag to determine whether the decoder will signal the
> > > > +       initial resolution before producing decoded frames.
> > > 
> > > [Severity: High]
> > > Does this guidance conflate the V4L2_FMT_FLAG_DYN_RESOLUTION flag,
> > > which designates mid-stream dynamic resolution switching, with the
> > > mandatory initial V4L2_EVENT_SOURCE_CHANGE event?
> > > 
> > > The V4L2 Stateful Decoder API requires an initial
> > > V4L2_EVENT_SOURCE_CHANGE event during the Initialization phase for stream
> > > parsing, irrespective of dynamic resolution support.
> > > 
> > > Compliant drivers like coda correctly emit this initial event but do not set
> > > V4L2_FMT_FLAG_DYN_RESOLUTION because they lack mid-stream switching
> > > capabilities.
> > > 
> > > If userspace follows this documented advice, wouldn't it erroneously skip
> > > waiting for the initial event on these drivers, potentially breaking capture
> > > setup
> > > and stream decoding?
> > > 
> > > --
> > > Sashiko AI review · https://sashiko.dev/#/patchset/20260608-flag-dyn-
> > > resolution-v1-0-44dc65516148@oss.nxp.com?part=1
> > 
> > Hi,
> > 
> > Thanks for the review.
> > 
> > You are right that the V4L2 stateful decoder specification states the initial
> > V4L2_EVENT_SOURCE_CHANGE is mandatory for coded formats that contain
> > resolution information in the stream (Initialization Step 4).
> 
> Be aware that Sashiko is an AI bot, llm words things with extreme conviction,
> and it this case forget about backward compatibility from pre-spec.
> 
> > 
> > However, in practice, GStreamer's v4l2 stateful decoder implementation uses
> > V4L2_FMT_FLAG_DYN_RESOLUTION to determine whether to subscribe and wait for
> > the initial source change event. The reasoning from the GStreamer side, as
> > Nicolas explained [1]:
> > 
> >   
> > "
> > https://docs.kernel.org/userspace-api/media/v4l/dev-decoder.html#dynamic-resolu
> > tion-change
> >     Says:
> >         Not all decoders can detect resolution changes. Those that do set the
> >         V4L2_FMT_FLAG_DYN_RESOLUTION flag.
> > 
> >     So normally that wording should prevent requiring an initial SRC_CH,
> >     or emitting later SRC_CH. Your driver don't have this flag, then your
> >     driver can't emit this event. But a measure we should take into
> >     GStreamer would be to not register (or mark) this event."
> > 
> > @Nicolas, could you elaborate on why GStreamer needs
> > V4L2_FMT_FLAG_DYN_RESOLUTION to handle the initial source change event?
> > Is this something that should be fixed on the GStreamer side (i.e., always
> > wait for the initial event), or is the current heuristic intentional due to
> > legacy drivers that don't emit the event?
> 
> The coda source_change notification is completely fake. It does not dependent on
> the bitstream content. So the event is left there, since its kind of part of the
> ABI, but it does not behave like other implementation, or pre-spec drivers.
> 
> So what we do in GStreamer, is that for legacy driver (no
> V4L2_FMT_FLAG_DYN_RESOLUTION), we pre-allocate both queues, based on our guessed
> dimensions. If it happens that the conformance windows is small enough, it often
> works. DRC will only work if the display dimension changes.
> 
> For any modern driver, that implement V4L2_FMT_FLAG_DYN_RESOLUTION, we strictly
> wait for the event, and on DRC, even if the display resolution changes, we let
> the driver tell us when to actually reconfigure. The legacy method was kept to
> not break coda and older driver, the new method is a lot more reliable, and
> avoid allocating twice the capture queue (wrong guess).
> 
> The userspace implementation is also a bit more flexible, as normally the legacy
> way should kind of work for any drivers, and we still subscribe it seems. But
> the implication is just strange and shouldn't be needed in drivers with
> V4L2_FMT_FLAG_DYN_RESOLUTION support.
> 
> Nicolas
> 
> 

Thanks for the detailed explanation of GStreamer's approach.

I have a couple of follow-up questions:

1. Regarding coda's source change being "completely fake":

   Looking at the coda driver code, its seq_init_work does parse the
   bitstream via hardware (SEQ_INIT command), and the source change event
   is only emitted after ctx->initialized is set — which requires the
   hardware to successfully parse the stream headers. After the event,
   userspace can call G_SELECTION to retrieve the actual display crop
   rectangle parsed from the bitstream.

   The limitation is that coda requires userspace to set a sufficiently
   large resolution via S_FMT(OUTPUT) beforehand (since it validates
   stream dimensions fit within the pre-configured buffer size rather
   than updating G_FMT with parsed dimensions). But the event itself
   does depend on bitstream content and carries useful information
   (visible resolution via selection API).

   So it seems coda could work with the standard init flow — the source
   change event is real, just the information delivery is partial (crop
   via G_SELECTION rather than full coded resolution via G_FMT). Would
   you agree, or is there another reason GStreamer treats it as legacy?

2. Regarding s5p-mfc:

   Interestingly, s5p-mfc sets V4L2_FMT_FLAG_DYN_RESOLUTION but does
   NOT emit an initial source change event. After SEQ_DONE, it simply
   transitions to MFCINST_HEAD_PARSED state and wakes up waiters —
   userspace discovers the resolution by calling G_FMT(CAPTURE) which
   internally blocks until header parsing completes.

   The source change event is only emitted during mid-stream resolution
   changes (RES_CHANGE_FLUSH path). How does GStreamer handle this case?
   Does it timeout waiting for the initial event and fall back, or does
   it use some other mechanism?

Overall, I agree that using V4L2_FMT_FLAG_DYN_RESOLUTION to unify the
behavior (both initial source change and mid-stream DRC) is the right
direction. But the current state has some inconsistencies:

  - coda: emits initial source change, but does NOT set DYN_RESOLUTION
  - s5p-mfc: sets DYN_RESOLUTION, but does NOT emit initial source change

If we want to document that "DYN_RESOLUTION implies initial source change
event will be emitted", s5p-mfc would need to be fixed to comply. Does
that seem reasonable, or should we take a different approach?

Regards,
Ming

> 
> > 
> > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5126
> > 
> > Best regards,
> > Ming



