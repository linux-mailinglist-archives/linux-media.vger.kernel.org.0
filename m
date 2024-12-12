Return-Path: <linux-media+bounces-23258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D08439EE244
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 890C8188962F
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3354020E325;
	Thu, 12 Dec 2024 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="sLVgQqB1"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2130.outbound.protection.outlook.com [40.107.255.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A2813E40F;
	Thu, 12 Dec 2024 09:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733994518; cv=fail; b=XMH38jclUoKFYcOm+u/ZUlhEtBtJc+Lc5gKWo7GwjOVKD7dRiFNX12sRCJmZ7bg6sor/sgeBe1sXChPQAWOkLrAD9jnauNf9vKBlglOgPSsCNfVn7bBVZyjMIb+syeuRHjWbVp0v0cy+DgNpO3Gj5ZbQS7qzxj7YjFcT9X0RTR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733994518; c=relaxed/simple;
	bh=zVEkY3O9eWH0RzQ/s78zDn/5cXwfBu1t7GkHFHuPRbg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hw3aK5EkkmowujXP91Kf9r22fqz+5vtev8rVT6rFpZW/0uF8+jlTu5f1dEr25eci9owXiBimyOI7XkXydrILKu1T7sqT41fvLhviY//309d4ye3LWd4sLVC2YAcUIt5lZEOdHVrsHEk1QXWXaZUIpIpOgRkits7q+FHt9hWKrAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=sLVgQqB1; arc=fail smtp.client-ip=40.107.255.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7KUwWhYM8wwlF4GTFldZLXrB4lYFR2/MwzC3sLetps4/rgvxxeubQLQbr3QDpX9EQrjXxz6h9MFdLo1MktGAxjX8Gcwat+sjN0SdfGVmlu6e0LgRcqN4jTZE9TJOqnYpKQwtIE1+4gG6wV/yWN0Te/vhKvnjl6pGqWUwSgRDRft6GKUP2JFz/g9GFoTE3prSSQ71XmH5dDxA1qeBLomcpSwAGqtHVbWfH4ePLlBw1gCN05Q6wRLzI1XktHQX/FYoMALW7rqE8ZyuvLpvoevXN80bXjZlReM7nKO+bfAnKwgw1vK+qP40SHXt46/ctGmA0LLOzL9jF+em9HW73kkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKRcoEnYLnOFDAJcN3pwUdopnTmHRe1ZNkiux3W2SUk=;
 b=bWsBi1G76njAcdRMzClCTT1zP4MIbnYp5qrr5PIjEDuz9YQiBZVmo8bL72GlWIP024loNQan6DSoBbsKfRAtBMJb2MJWHYetrVNlAxzy1d1l/DcA84dD67PK9XHMo/mfnuqvXa8TtrtC8O34lh3n4cimD1aajP77jTy2q0frLg1+6valvvDTC4Nj2evVPN0zfaUBG3Zo8WC8EoUMVZVyrIhdqxNWQqHXa1iD/yJNCsNgc20AdzXvyBbrv/wFST1bOY30ftiEoGFXuS0R6CG+d1IBctnFybIUxRdfV/Y/ZQZ+BTrISTv87C3Z9+aIFlvRJkA7qxa6Q2e+dnemc/2vpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKRcoEnYLnOFDAJcN3pwUdopnTmHRe1ZNkiux3W2SUk=;
 b=sLVgQqB1f2g6ffSjq3PtrzFevSnJyQSkH/PMmbMFVqIbAJkOFCBHz5kUAbHjxenSPaRj8RQUh9DZiWLT89nremzB74eY94yUszdppoGJ0Xnz+Q1tJvhJSDBZLU0btxA5FVvNpCcAQrF2uFVVgdItI0+PPAzRxgqUpdckanGwFZlCVqojnbaqSNkdYy7n/rtYC1dZVjFJ75dXeFt16qpHIKvNpxJfe+yqSy1dGeA+9sDDAmJDx0Fgv4JJiH/oAFos37VHP1xa7epAYzDuO7P4wIPyrlrJts+OTJ1mjExMv+CrdfHIM4kDycFsd/8KNmu9saEHeNQpbJ9aBYR3x1d2Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by SEYPR03MB7698.apcprd03.prod.outlook.com (2603:1096:101:144::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 09:08:31 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%6]) with mapi id 15.20.8230.010; Thu, 12 Dec 2024
 09:08:31 +0000
Message-ID: <0fc7f15c-66be-4ba0-9549-51ba87f48690@amlogic.com>
Date: Thu, 12 Dec 2024 17:08:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] media: platform: Add c3 mipi csi2 driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
 <20241205-c3isp-v4-2-cb1868be0105@amlogic.com>
 <5sen6lv5xg4hjdc4j2l6k5iywqpllbutoaebyln74aeuplawtu@nmpmzgwkkgih>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <5sen6lv5xg4hjdc4j2l6k5iywqpllbutoaebyln74aeuplawtu@nmpmzgwkkgih>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|SEYPR03MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: 466a5071-c4a9-4651-0671-08dd1a8c8c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlJaYlVTV1Y5eWU2dk9FK2oyVUtmN3hVTEtXcTczNEluSHhaU1A1cHB2SGpu?=
 =?utf-8?B?dDB6Y3lsKzNvcDZGSERIeVU0NkZZSU0vd2FXVlJtVlhOKzJLNmRKTFlZTXBY?=
 =?utf-8?B?b0p2YnE2WThDVVpnaCtJaHNjQkd1SGphZVY4WmFHQmFDWFovQWNQa1JIczZL?=
 =?utf-8?B?S0dlWnpUVktjcm1uOXZ4VzhNQlpJeTd2ZzF1UjJoS1FTMktHb2ZaT3M5M2tE?=
 =?utf-8?B?M1NHZGdOd1c5UEhuTUE5dXJ1bnNUNlVIZ24rZ1NLWmZqdDd2YkdyVjZGQnky?=
 =?utf-8?B?QTY4cm1EWW5JeHhIK1BURXJNbDR1ek52d2hsN0gyQjNNNmtwSkpZV3pjRTUw?=
 =?utf-8?B?OHFlem5HNGF3bWJtdkt1d1dpSEh2RFlzdENXMkRwelFpb1g5L3hjbENKRWpl?=
 =?utf-8?B?c3FFeXVlTDVJNGNNRS9JVzh0MmZ1L1ZmWFJaclZxVkM1TDF3Yy96a3kxci8y?=
 =?utf-8?B?WngxWTV4ZG9Eb1FpUUVDYi9hM2Q0MVVsNmhFbnFXWXFBRTFHOXB3amQ5U3pX?=
 =?utf-8?B?dGhtdjRLR05rTEdSM0doT3FDNlBEMVFxRldIKzA1bkZ0WXhUM2FUV3Y3bVF5?=
 =?utf-8?B?TDBVdW5DYTZQSE40SnFjWGdNT1NObGp6RDMxd3VlQlB6ODdQakpZRzRsTXJV?=
 =?utf-8?B?bVhkaXJERHQ0RG9GVHJXeUhmaGZub1RuYXFDR3cvYkpZbjNsZTFRTFZ5a2hs?=
 =?utf-8?B?REZXTVdNRjY5amE1ZVNQZkhyQlVncjR4aFBzYTlpb3VjK3Y1Um1uZ0o0eWhP?=
 =?utf-8?B?MGhLRHRoMFBRdWE0bUloRkwvUEJqUngzcHZoV0d4SUtMMkowWC9MQ1pFajlC?=
 =?utf-8?B?NUNQVW5Ra2xDcUdrdlMxNmhqK2h4LzFJcmxHU1Blenk0VTNDaUpqb1lNSnFT?=
 =?utf-8?B?SDZBYWd0Mlc4N29pNlFROU1taGw1KytXd2lCU01GMjdCclBBZDZBZ1Y5c3ZK?=
 =?utf-8?B?VFZFMlhFdDZlSFEwNnJTY1BUK21zMzA4YnlzRllOZUpaYVVNQk5XTlpnOC8y?=
 =?utf-8?B?V21OTldYUVVJQzBJVDdsOFZqZ0ZOMVZKV0tXSmlUNEZTczduRXYrT0tXNDNi?=
 =?utf-8?B?dDVtbGgzZXlyemEzZlBwaHk2alhLVFF2bVpqME94MDlibjM4cVViVXVFeXhU?=
 =?utf-8?B?Sk9ieWFENFJkbmQ1TzhIWjA5VS9mWGNtdUFyeVFCZUZOOVlGSWhKbUVFUWFP?=
 =?utf-8?B?UExxNyt4NTRTd21LMHllVVlyMENkTWR5WDIzRHpkUmtTS0JTY1RERHdzUVRZ?=
 =?utf-8?B?OWV1MEx5WFNvWXJpcGd4REU2SUJuK2RaTjZNNFRzdHB5ekhkSXF2ck1hZHpZ?=
 =?utf-8?B?N0E4QjN0dDN3UnpTTFZ1NnpsREpZcC80a21pZi94MFlwU0t0NWNoT0pIeUZJ?=
 =?utf-8?B?TkcvQXZSdzRveFg5WXZSQzQwRmpDeTVBa0tlOHdtd2dOS1d5OVAwRU55YU1n?=
 =?utf-8?B?QlB2cHE3MWJ0V09QSzRZM1EyRmJza3pjSlNlK1d2b05aWk1ZMUsybnFwVFc3?=
 =?utf-8?B?bThZTkNOTEpET3VhdngxM244VzJwcFRnaDk1bXhYcG4vNm9vYUtoYWhhTnhP?=
 =?utf-8?B?eDJjQm91bDloUVJVcktjblN0SURCamJCNXUxTXJUTzNoQ1dzOW0wQ1hwemlx?=
 =?utf-8?B?M290c1pOZ1JrdzRJbVVpUEFaSGlRa3ZuWjlqcU9MTm52VkYxQ2VpbXdsaHdX?=
 =?utf-8?B?UE8yQ0xiU1pXK1h4R3FtVmZpN0kzYWZrclBJSk9ndnNDdnJRa0piNVMxWTV4?=
 =?utf-8?B?WS8wQ2RvdW5FNTYwRHFnQ2pNUW5aMmdBSXMxRjNBcXl0STA2UjJlcXJpVWE3?=
 =?utf-8?B?aisvMlF3WGRoVzBoQmxXUmRaT3ZEaGJCUFBUWGJXZ0lINFlvclVRNHZwS3FR?=
 =?utf-8?Q?EjmQnJsaoYb14?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzBUcDhtLzhmeHh5OC9LelFaaVYzN3FHNEtGSTNTTWc3TWFUMHhndHdMeEN0?=
 =?utf-8?B?aTFyZW9lVlNFRGZzcGh0MVJYditERVJmM0RVWHFhZ3lVdEJLeHdUOGFXL1Iz?=
 =?utf-8?B?NTlBRDhMSGxDakhVQ1Zud3V3S3ljWUMxWGFYdGRsaWlTTTFwQ1Y2UW1mT3dM?=
 =?utf-8?B?S0YrR2VJbGFtbThvQmFGVXFjQmowNzk4WGxzdnRaOThTMjMraHhVK2M5eEVX?=
 =?utf-8?B?MHp0WkppQXpCd1FmblVndHdySkNzTGJ2YVhvbUovZDBDUVRBUnZxa2JGMlg0?=
 =?utf-8?B?QVJ3RHhhY0NrRVNobkJTZkpkOE1KcDdpZms3QlcrbktLSE9KZVJvRk55SWdi?=
 =?utf-8?B?VWxGckxJL0o4SnN5TXorSFNRQ2ZBTXlHcldUUWZyaDlQRjBEWnREd3FIOTNk?=
 =?utf-8?B?dTVHMW1uaC9aNUhYYWNyR1M4VzdVWFZXSlBGSFI0aHY3cVdhZ0hLMzFnczhB?=
 =?utf-8?B?YXhHU3JNSXJNd2pSYktpQTl6UDhFOENhaGt1QW5GbjFsNjNVOXpuTE5ra1Q2?=
 =?utf-8?B?UFNqV3lzWXBVcmUwYXpTc3B6eWpYL25XMzlkSGM5T20zckFVZ1BSWDczckc4?=
 =?utf-8?B?d1d2am5hYmJXYlVhWWFwTjRzdUtodzlpNDlBNWJ5WHFRVGZHaHFkNEdZRGdL?=
 =?utf-8?B?dGNFekIyUFBxU2tGZGczMGEvam9zRW5LM1A0MlVqUXFZSjI0eStHZGhpdDZS?=
 =?utf-8?B?M2pYK25yMGdpSWw0YThIRGlzcFhWZSt5S2tGQXBwVjhnMWZMMUlmcHhvWUxC?=
 =?utf-8?B?Tm5qQmdQc3Njd0ZHenVWckhhMmZYd1N4aU01VDBMQTZmNjBtQlJqOW8wUmJl?=
 =?utf-8?B?U2xQTExjV0V5QWd2SFdIYmRzc3phOFVZMyswYjZ0MTZPR1BzRnp6RHRFekdV?=
 =?utf-8?B?aG1udTJoWHV1SEtaNnMxR2cwRzdvVENDaVhuY0txeDhQbTZiY2JhdWZiSDFE?=
 =?utf-8?B?TDVrMTVPL2Fia2VZdnlULzEyTWZXUzY5VERHVnlBT3JGZ3cxYjBqTjdKSm9K?=
 =?utf-8?B?d0U3RGR0WXF0aS9RNVlCT2ZHSDIzenhFZnN0bjFFSHlqVmREU0w2ckxQU2Jr?=
 =?utf-8?B?MVZsL0Eyc2FGMU1SVURaTHhTT25zSEZ3OUhkbkZHbmhROFNDNEpiUTBPWGc3?=
 =?utf-8?B?SVVCbnYySmdWbTZXb1kvSnEvL05hdzcwb2NHdXQzUmsxSlMxRzJaMmhwSFov?=
 =?utf-8?B?TUxnTld6MWxYNnlmQmNhMWsvWjBUNnRUTmNxV3ZiUkI1NHBvUDlGTXBVNGY0?=
 =?utf-8?B?emo5RnZyZTZhK1ZrMG0wMXFYeXdKNDV5UHIzUHM5OXlOM0p0RURvRnZ4REdm?=
 =?utf-8?B?U2hsTVhVM3l2TUVGaHFzMU91UzlTYTlQdFdYcmNyOVJ3eU1VLzVMQzNSTlpi?=
 =?utf-8?B?TUZLUGZmMGpYUmJpVE1McnNFUUU0dGxTYUNoNnpJNmluVzdjSXB2dGpSNEEr?=
 =?utf-8?B?a0ZNYXFXTE9udXVIQzc4RTZrSXRRUlZaQUo0aVh5K2Z1Q1duM3RQZHZMSDAv?=
 =?utf-8?B?UUMwd2FpbExKa0djK1A0Sll2WFlwTzduS3lwRXBVQnYvVllTSzJJTEIwSU52?=
 =?utf-8?B?OGtaZGxrSnJmSXZSRTBkRExDVHo5TGpheWdIODR1VmRmQXMybDk5MUVqZGxC?=
 =?utf-8?B?VjZFRzBxa1dhdVJscjI5NnEvbkc0RzlPYTBETDFpY1JsUmQyaXpqTXNmeXlu?=
 =?utf-8?B?dDhvd0ZwRDRKWU84cU0vWkhwWmErSkhGUm9kdHlQQkk1dnRRMk90alkvdzAy?=
 =?utf-8?B?eXhuS0VTQUxGWlNwL0ptTmFHWmVBQzJLSkw0dnp2eXh6d2l4aDllWDR4N3NM?=
 =?utf-8?B?VGpITVBXUnYyNmVxVmN6L3gwY2VuaHVpMSt1S1J3MzdQbW9CUnFYTStGYmJv?=
 =?utf-8?B?YUgwWm9NNGpjT05kOGp2Z3MyeVVVbnN4Qk5iVXR3MnRiTlFWZ3A5c2xWamdK?=
 =?utf-8?B?Y3EzQWRza0ZlMndQQ1RLRnUzcXNJOVVLSjllODV2UnFLcWRVV295Y2c1YWVk?=
 =?utf-8?B?WFcrMWplSTduWjFyLzkraFlsNFJvQVl5TTFRdFFBVXlhS3dwSmlyTmNzQll1?=
 =?utf-8?B?OUIxN0d1UjUzeGtTUnBmRHBISW1aMi9uL2NUODdDeGtZRW0xM2hnSDVLS00y?=
 =?utf-8?Q?9IulIW13kCbaigzjM/Aej40mB?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466a5071-c4a9-4651-0671-08dd1a8c8c90
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 09:08:31.3904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAgfDkrhiwQblHzT46pOCfTQDFg31C35ssCQi9WXlS8vMMMKZce+XCBCDo+KRsF/0f2xnEx74mxPcjn7NAuBWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7698


On 2024/12/12 16:41, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke,
>    a question for Laurent and Sakari
>
> On Thu, Dec 05, 2024 at 05:04:28PM +0800, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> This driver is used to receive mipi data from image sensor.
>>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
> [snip]
>
>> +
>> +static int c3_mipi_csi_configure_clocks(struct csi_device *csi)
>> +{
>> +     const struct csi_info *info = csi->info;
>> +     int ret;
>> +     u32 i;
>> +
>> +     for (i = 0; i < info->clock_num; i++)
>> +             csi->clks[i].id = info->clocks[i];
>> +
>> +     ret = devm_clk_bulk_get(csi->dev, info->clock_num, csi->clks);
>> +     if (ret)
>> +             return ret;
>> +
>> +     for (i = 0; i < info->clock_num; i++) {
>> +             if (!info->clock_rates[i])
>> +                     continue;
>> +             ret = clk_set_rate(csi->clks[i].clk, info->clock_rates[i]);
>> +             if (ret) {
>> +                     dev_err(csi->dev, "Failed to set %s rate %u\n", info->clocks[i],
>> +                             info->clock_rates[i]);
>> +                     return ret;
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>> +
> [snip]
>
>> +
>> +static const struct csi_info c3_mipi_csi_info = {
>> +     .clocks = {"vapb", "phy0"},
>> +     .clock_rates = {0, 200000000},
>> +     .clock_num = 2
>> +};
>> +
>> +static const struct of_device_id c3_mipi_csi_of_match[] = {
>> +     { .compatible = "amlogic,c3-mipi-csi2",
>> +       .data = &c3_mipi_csi_info,
>> +     },
>> +     { },
>> +};
> All the drivers in this patch series implement the same pattern when
> it comes to handling clock. There's a list of clock providers in the
> driver associated with a clock frequency. The driver bulk_get the
> clocks and set_rate() using the per-compatible info table.
>
> Do you think this should rather come from dts using the
> assigned-clocks and assigned-clock-rates properties ?

Yes,  I think your suggestion is OK.

Will test it.

If apply your suggestion, do I need to modify the relevant yaml file?


