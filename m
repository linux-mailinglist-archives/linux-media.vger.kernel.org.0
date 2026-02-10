Return-Path: <linux-media+bounces-52513-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFQ8ORQji2lyQQAAu9opvQ
	(envelope-from <linux-media+bounces-52513-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:22:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4947411AB77
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 13:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A10BC30530F4
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 12:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E898C328B69;
	Tue, 10 Feb 2026 12:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DT+PXhP7";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DT+PXhP7"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8377E328B76;
	Tue, 10 Feb 2026 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.22
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726120; cv=fail; b=U1VQt/BPAGqnKdC2Ah3zHybxxSYXOhDw6sgW3s057G1sF2IoHOG6U4yHkBqvh6EjxvqBgSg07Qyfz4+SZCAYpdIL5DsJcHaSuDC2HfPGLPv7nogoGxiJAuq9IyOJyOAfGOO9eOnHn8JJA9KncAYrVMMfIUMbBBXiGYiRgc+rpXE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726120; c=relaxed/simple;
	bh=NvXoifhYa6/PEjwaDgTS4206g2rlNDU4J85vJZrTKFc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YLPNJ/ry5oFwjnpisENLeLhm7dFhHW2+Aiq/UEJWQAnQ8HMi6QykE/dCdyQgD0Qpf/nEeV5vuonDrtd7SUbfY+vZEQfhM9FClVMMveOPsHKeQWnO+ueopewKYM5E8GLXQeZ396ihltr1Gk8gXflcz/ES/KuICISohOv7TiExd4A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DT+PXhP7; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DT+PXhP7; arc=fail smtp.client-ip=52.101.66.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KldZUfebb4Quao6ElrlaMh3WopdUyWKRaVAa2peyj5cUHDXH/O3a142YF1NSZHqTFBL/pFJvoWRRC0/ZBzeE41jOUAtSNWZau3Zx0MQpCQ39RZoFBzl0tFlmj35ea+SadMk6vRmBVNmJP67Yx+pPOQTVBd5k6I8lhuMCgQlDyTEEECA9zS1aa19VtNI7bUiKhrKeR3hk6RzTWfr4bnvDPmEGVQVWusIZrjeYyrtIVrW0a6XfRjJSWRRRNBGF9BGY882GFo2uVFLKYP7WGeztHv4dkbP++l+0yUKEUWvQyfJdCqtSLWg2HcF2zYE+EyvsaqiveQ0Herxldda+EXpAHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKJl0QmFG0InHHy5CNJ3Z+1DVbvE1rB2Imx+kqwKvWI=;
 b=jkPg4zsLwZ5Daaf8ydJBThB/c3qHT+SD0EEiaUdknPUzZdutmFGe9POj16b+bgZnfqaQpvN7gf3C4UqtzPCZhqNSCITGieou18Xp0N0MxUs8VcXwmcd8RfMP2ZyOVHy0CHpyLj5B2SS6AXu93Mpr5WRzUgZTWh+M6Z4qDjDBJSxHpYjR+7HtbyXVQkRgM35CEA/wl9PUGc1qlTALCQdE46H1JL2jfpoGzumyh+LzvpBjbxGojdRPmJKqxbbzL7NhOexjA7uospkGgt9cs+7a5jfxeYo8syycIiEAT3Zi6HHYao/FKc+foAjp7n/WstmxZ9fRn99Pm4I5088HQJw/ow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKJl0QmFG0InHHy5CNJ3Z+1DVbvE1rB2Imx+kqwKvWI=;
 b=DT+PXhP71UkESCWLtijZa9yqwKlbvscHyAwAIny342NvUA5TaQnizTIJFpS1NepY4i5tHOGICLncXSvaRN7ZjIZasFKhLOD0PSX9o2WvTYYe/L17mi8W5l88UAP27ANPRCBFKsgGO3lAKa8c2nflWwYsvAt+0GgaR1BDgYad2TY=
Received: from AM9P193CA0015.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::20)
 by DB4PR08MB9240.eurprd08.prod.outlook.com (2603:10a6:10:3f8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 12:21:52 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21e:cafe::a2) by AM9P193CA0015.outlook.office365.com
 (2603:10a6:20b:21e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 12:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.0 via
 Frontend Transport; Tue, 10 Feb 2026 12:21:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAXAoqS/oneaV8aduUi9fNuLrOWFw3zn81NdR+zfGhTo23uF8tzyN6rlVOUM1m4QFjI1lDP4Gb2HVeDtc4dq+S14vrRxNzmL3bKcYYTUzevp6se61F4S4kn9K1XrAYeh9+lDBcevF8b1b+n3M52+LL7AjJEXjPImUUCd08VQwLQ0up49Il/zrZMQNq3pkeLTqcbDJ6FvoZLX9lGo3d2Z3f3qG2t86CTCxkeXVXZzyZUuLMwYQqJTb/naxUnQSyAR5NHWbV8WGtPmwcSf6I7M4HMwVfM8b06L6rvkKCfJvHNym6qcLy3/nnjtLrVI98EP9FyB9OMdxih/MJjunq6aAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKJl0QmFG0InHHy5CNJ3Z+1DVbvE1rB2Imx+kqwKvWI=;
 b=h+JI4V1oaXkpZ99COSQx+AqcGVeJqHUfKtZ13HxaWkjcC52zOUk8Rbi/2PR/E7KgrGO5ckGdjBHPd3aAUJZtXubb35XE/gaK+ZkrXVCx0vYKnyMzjubkfPDY2/akBCaFDMcwF+jzFmapeJY89vlUO1Y9sqA6rliqbpAOTMZIsCP8oe81CF69xruptma/M0f2M64VqqiABRcuYauHJdVlBoto5dHY9dwEh15tH9IwX7oVndFqhxEPq1nvTNDb6IhYlbe/JU+GSGiLJap8TGr0RhKIk+Al7jSEo2kEUDmjkkm/dqz5UEOziOdqn7KhFcB+Rj8UACd597lTxjvW+AyeUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKJl0QmFG0InHHy5CNJ3Z+1DVbvE1rB2Imx+kqwKvWI=;
 b=DT+PXhP71UkESCWLtijZa9yqwKlbvscHyAwAIny342NvUA5TaQnizTIJFpS1NepY4i5tHOGICLncXSvaRN7ZjIZasFKhLOD0PSX9o2WvTYYe/L17mi8W5l88UAP27ANPRCBFKsgGO3lAKa8c2nflWwYsvAt+0GgaR1BDgYad2TY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11797.eurprd08.prod.outlook.com (2603:10a6:800:313::6)
 by GV2PR08MB8631.eurprd08.prod.outlook.com (2603:10a6:150:b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 12:20:45 +0000
Received: from VI0PR08MB11797.eurprd08.prod.outlook.com
 ([fe80::c4d3:baed:b106:2ba4]) by VI0PR08MB11797.eurprd08.prod.outlook.com
 ([fe80::c4d3:baed:b106:2ba4%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 12:20:44 +0000
Message-ID: <2b64aa6c-b3d3-4b96-b603-1ceb3497dce2@arm.com>
Date: Tue, 10 Feb 2026 12:20:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 00/11] Add iMX95 neoisp driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>,
 Michael Riesch <michael.riesch@collabora.com>, julien.vuillaumier@nxp.com,
 alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com,
 frank.li@nxp.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 niklas soderlund <niklas.soderlund@ragnatech.se>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
 <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
 <22b3916a-a12f-4ea2-8863-8ebd9cb498b0@collabora.com> <aYI0CrKLGeiZMlD8@zed>
 <aYN8v3UGFKfzkl4_@zed> <86109309-8200-464a-a167-ae9cef3f41b7@nxp.com>
 <aYRSMXHjFC0M_DM_@zed> <a4c62fb8-51f5-47eb-a1aa-ec0e4f6a9707@arm.com>
 <20260210002053.GJ2405149@killaraus.ideasonboard.com>
Content-Language: en-GB
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <20260210002053.GJ2405149@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::9) To VI0PR08MB11797.eurprd08.prod.outlook.com
 (2603:10a6:800:313::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11797:EE_|GV2PR08MB8631:EE_|AM4PEPF00025F96:EE_|DB4PR08MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 979dbbde-cf8e-482d-960b-08de689ef8f0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cDB6VVF5OSs1YXJUYmRKa0N2RzBtUWNpVGFySlEyY3pWK214ZDlRNUdyckI4?=
 =?utf-8?B?OVlMRHo4NGkxMWZVY2UrK3RKc1F3TEFTaXIzZnhSMDhZWEdkSldlRlJNQkpO?=
 =?utf-8?B?MCs3dnVKUmU1R0svekc1R1NlaEpSM0puMzZUTnoyQmo2cWJqUWw2VFd5Q25u?=
 =?utf-8?B?WjdSVGtxRFYrRDY3SmxXZ3huZEQwOWUvUE93Y08wSmdrZkJCYmtrbjVYcE9Z?=
 =?utf-8?B?WG1pT2hocGMzcHhHNGtiKzE2Yll0QVhuVkJnMlM2R2VxbU9NOS9nY29yRkhC?=
 =?utf-8?B?bUc3Y25RTEYwZWJTSkpqQ2N5S3lYVTBvbHY3NktCYm02bUh1YUhCOHZKcklE?=
 =?utf-8?B?dlBEd3ZzOHkyS1FFam4yYXU0Ni8wTTdnL1RXa3ZDb2R2K3FBa1Rockd6bE5S?=
 =?utf-8?B?RXN1bkpZYk9NWjV3SG5UMTVEU0h4eDVKRE56OUZFbml6WlhjRSt6MDNRYkVM?=
 =?utf-8?B?NHowZzY5em9VRGxoaDAxMHJZOHRkdHVwK0N1ZWRHTXUzbEtCNW55aG4xUUJv?=
 =?utf-8?B?dUhWa3VBelQ0VEJPM1JqeDRBejhDdXYzQzdKdTRHMlRIZVZrMFZmYXM3SXVZ?=
 =?utf-8?B?MlMwYnB1U0ZYUWJyVTNDcjd0d3lhUUZ2dVJBRTFqV0NZT04yNDFpSjJQTGl0?=
 =?utf-8?B?WkpQUnlDY3ZtalZWRDJqbFRSa0RnMDlIY2JGbm1takVBS0VLa3JzUjlBMzlE?=
 =?utf-8?B?UDA4SDlXcFVlVHVLNTdlbUJ3UXVrMzNEWmRoSVU3azdlZHBSL0wvTmw2R083?=
 =?utf-8?B?eWovZHdUU3cwQVpUREQ5eVoyckRhZ1kzcjJMcVF4cXVaVWp6WGZuQ2MvSjNv?=
 =?utf-8?B?Snc1amJydDZ6TkpHbFVYN3FyMmtpVFhPamp2akkwUUxiYmIxK0ZRUElvNk14?=
 =?utf-8?B?dGdGclAva1JmYU5oVEdXQ2svTWd5ZG4vWWlFVDQrY2hnRXRQQ3RxR041cjFt?=
 =?utf-8?B?YS9mMEx2OHJzUTlaNHlhUFExL3E3dG1acFgwU0FyNFNEUlMxVllITGI0VXVD?=
 =?utf-8?B?TEVGaTBzL2dpcVA4Q0VTKzlLK2VKbkxLcXNNeE9UOE50NlJhVWNkM09XaXdn?=
 =?utf-8?B?QUV5YjJZekZqQ01sbE1IOUVpdkt4Y2R4eUdoYjRoaGYyS0dOdXNWeVJDV3Y1?=
 =?utf-8?B?aTVYaXN3YkdxYS9zZlRocVRoWFNjSHhRZ1ZEd2Q3UDFVY3BBNENIMXQvY2Ri?=
 =?utf-8?B?K1YzMU5vOWQxUHNlS3Y4aXdPYW4zcWFKdmx6Z05VaEhtWThCcEI0dkxkaUR4?=
 =?utf-8?B?N1pDQXk0MFBvU2NqcUNVbVpJcnNqYW9CRnZ6ckFQZ2I5anBydmJ6YjJkd0ZY?=
 =?utf-8?B?ZzFLS05aZmMxZWRqU2NtNDR0RlI2Vmtqbk1mZUFEbEEwUWhOQ0lvUnVNb2hP?=
 =?utf-8?B?czM0djhkVVVRb0x4cEdQQUVMZStxVStkTm1jMlhxVytyRDVPMW1QN3c4YXhV?=
 =?utf-8?B?WjhQVE96QVVEMjBDTHUxcm8zd2lZcUZwMmU2SkV5cHU4M0J2N25OTlQxbnlZ?=
 =?utf-8?B?eGxaU3JpS2p3aHU1ZWYzRTdKaHFFWkg4WkRhL1VOZ0kxVExGM3o4dm5mL29X?=
 =?utf-8?B?emdJcTNWTEhjWlRCY0t5cVFaQnZaQkUzTlh3bGdVTklvZ2taUWZWajRHeEJL?=
 =?utf-8?B?b1dweE15TjlyWk9xbU5JY1ZEcTJnTXhkS2N6U24rMXZ0N1NtTVJyZ3BCK2cx?=
 =?utf-8?B?WHhObXM5WkUzOTZlZS9nWUN6Wm9ST09ZOGs3ZW1sOHd6cXVrNVZOWGdLR0dm?=
 =?utf-8?B?ZmNXYzFWTkRZQVVhdFpjczlmRVdrRVBrNVJnOWw4NGxCTnJycTBTWWE1Umg0?=
 =?utf-8?B?dGtwNnZSZFlEajNsTU44M2JJZnRJcC9SOERyNkp3dEV5YmRUa2I5bVZZZHBC?=
 =?utf-8?B?RzY3NlJNWWUwMkd4VHdhU01LZ0NaOHp1OW5EcldaTG1rczdRNnA4dHJHTjhD?=
 =?utf-8?B?aE9aUDFHRjNDdy9BVzd6WjRxdndZaUtFcnVTdlFPYTh3SU1nNExwWnJjN0hS?=
 =?utf-8?B?R2VtTTF4UFFWWFJnQXJMM3BuUDkxTXJnei95UE1HV2JqTmVVZlk0RHZNWDRQ?=
 =?utf-8?Q?GOrONY?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11797.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8631
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e41eb229-60f1-48fd-3ff2-08de689ed0a6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|376014|7416014|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3ZMSldVdUZ6TERoL3FXYnVkVVR4NFdOam5lOElSRkhOZ1QxRTI3L1NCQ0Nv?=
 =?utf-8?B?aXkxbU5oYUxFV1hjWGdLWUNJV0Z4anRvaXdDMHoyUU9LamwxQS9pWlQ2YTRL?=
 =?utf-8?B?TnRRMTdxY3VSZ0hYWEUrSmJHcmpiT3FlUDhiT1lPeVlsSklhVDBCQzFucUU3?=
 =?utf-8?B?ZDdvVzZLbFBjL1l1SzNXdEF0dWlrbmVNdDZyMExCcG1pdDZMZFpOQnlaYm9q?=
 =?utf-8?B?VzQwTU1nYjdwbTRsdWZrQlk0M2RJR0xESXIyc0JEdDJ4bEVUeUUzVHVCV1Vn?=
 =?utf-8?B?aW5QbmdqU1UxSFNCQW5DdW5FU3RNS0xNWUNsZzFacGxlZlNVL2xSWG5oWEhB?=
 =?utf-8?B?SWVxUmgyS0RjcWxKenpIaElmZ0NvODRLNUtlZXQ5R0lZUlhBRjVNOVIyMk95?=
 =?utf-8?B?ZTdCNFoxQWVENHBCK2x2d0ZqaDVaS1pDWWJqZkhzc09RYTJaTWY4OVhTZ2Ix?=
 =?utf-8?B?ZkdQeXVYK1RrWmM5S2JRQnV1Y3Nrc3dNVFBzc3pFTms1Q3ZWZjRLRDFhZzdO?=
 =?utf-8?B?VjhQOWpweVE3amlKRy8vSkJadEhiMVc1WWFuWmpydTQ3TUlNQU5GbWVyeTBR?=
 =?utf-8?B?UDRta2pxY2FmTTA2Tm80VTNabHY4SEZta0d5QlA3ZisxS0lYTWVDa2dHNENQ?=
 =?utf-8?B?YitCUzN3a2Q0cHIvbEs4QXRzakJqVklXYXI0WDlTZDN3dGZFR3ZBQit1WkVy?=
 =?utf-8?B?ejErc2txVm9yVFAzNTY5K2diSFpaTVpna0NISzloTTJYV0ZVeGJvdytnR2RO?=
 =?utf-8?B?Y1lzZURvL1lkVERKZ2NQQlpiSnNMZWFjUXZXSGM0dHVVcnEzbytiOFFrVk5o?=
 =?utf-8?B?UnU5My9oWU9PaFFEc0lMSEtqMFlPa2t2M3Y5Vk1iWFFORXJBSFA5S1FXMTYx?=
 =?utf-8?B?c2NyU282Q0JCZXpyREZDYWI5OXJQUHhuM2dVT3I1MXZUaS9iQ2JsWldtT1B2?=
 =?utf-8?B?U2M1WTRPbE0zNlMyam40UVo0RU1SVm5tVGJDQU1tVUFpUkxsZWd0Z1NzcWR0?=
 =?utf-8?B?MFZnc2wwNXRnNnBkUDJtUi9xQW1yYnNabllZaXBISEhPaVppQU5tanRNdGlh?=
 =?utf-8?B?MTZmWDhMN0puMmZxTS9jMVRDaHNnbzk2OUtteHV5bHhicE9kRzFVRWFjYmFU?=
 =?utf-8?B?R2tCZ2t6ZGVJTzZaWHJXdjh0TDhUei9zeVBSd2l2MXVRblZocWpxYzZoOHlr?=
 =?utf-8?B?YUtOeU9FZGs2WWFjUjI4RWp3M2NtU21KSGdiRjJtL202alRjUG9QeWhKaXlv?=
 =?utf-8?B?Z2hERkk1Vjl4dnVoN05XRC9qY0M2UVQ0ZU1TODBSUytTUzcrOXY0TG53RVJ2?=
 =?utf-8?B?TkRqUzlFelc1Y3p4cTZHaUR4aGt2UkRYZmJ5RkVkQUU2Z3BqMmJnZmtWbjFx?=
 =?utf-8?B?dWUwMkhoU1U2dVk0OEVRMWdZWjlBMlJtWUdmVGRZMUlpMjE5YjhINmM1UWRP?=
 =?utf-8?B?d3hQUkhTOU4rWmVsdnl3VXlaTFhETEVvK1dmbGppT0EwcHlEbDdoM3Nyam0z?=
 =?utf-8?B?cG9uVnhCTDlKMCtNdlNHT2JtOWM4M3drV2x4TXFBQXJnMWt0b0ZSYXh3SDNK?=
 =?utf-8?B?UjhMbUZpczljRWlPK09ZV1F0WU1GOVZKZDA5S0pVRWxJN1BnbytZMUZVakhw?=
 =?utf-8?B?c2g0K1d4SkdYREFFbGlOMVg3MkNlUDNWMnFILzNsZ29PbnNDdHlDajFKYUVE?=
 =?utf-8?B?NTE4OEU0ajVjalltZ1lyZWg4eTFsOHNSQnY4VTZjWUNXazhkNVFWMEowUG5M?=
 =?utf-8?B?cVBRTkNMRGVOUElwSklOMVZnaHhoYlhXaVFuUzJ1aC9lWHZwYk9iNXJPUWxI?=
 =?utf-8?B?bnZtWDF0WXhTeDljSWMzajNzQUs2UmpkSkNIekFxci9BMjdkaDFBM1JTYnA3?=
 =?utf-8?B?b2hyOGNWdkhMRnN0ait0Nml3VEptdjdMV1FLMUV6WWpvVG5IQW9lb1QzcmlJ?=
 =?utf-8?B?VFJmT2VaQ1ZhZ0o3RXFxWThlU0VvSkR6QXpuTGFJRXhYQ2VwUDdoZU96OGJT?=
 =?utf-8?B?NTFXMDgzdHdPS1JiSnI5ZHBkcWdzWm9QdFJDcTRTK0JOeE5mNGdtYkpBQ2Rh?=
 =?utf-8?B?dlVRS2hOUk5DOTVSUDRmek5BMGpPeTV2WEVsamkvdkUwcmFwU1ZDVW93cW5P?=
 =?utf-8?B?RE85UmxMRGhjL2lOVFYzOVNZcDM5MGRVaHdOSkEyUWF2Q3dBSVNwd3hDUXAz?=
 =?utf-8?Q?CNjYPC4uCf3RXWh1ZLeEeEE=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(376014)(7416014)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I9zlOPPJIYJeMH8Jxp2Bc46x3lHvQX86mldvwomRVcYU1GCkZ+zQfu9t4gFrhmqj4S0rOkJdBbsLetyUq+D7DzZqBmXHOJnOOhkA+mbiZ0HelJKDQAhOj1Ks4uUM0Rijan35It+X+M60MiQHrtJGXDONGGyk8J52ylr76lXxldLdCOWOZuNd9+2a7J87rYU/KfVTYWtlMqhz2v4Dq8neVZV66Iu4pp3sjsQq2HDs0Ksu1TJo9lAlq4ZHTuODTqoqw/hU46FhPn18Q0n1p29HRXqnXClzRYRk45td6r7/vbTaE9650vuRiGBjkmkoJHnO7C1ShMlj8km1PC1R26vvNpQJ/mszZQps6PNkoKSQBn3PF1bgQcHz3w5dvKXoXwJIvRgCb8nC5NZav3vVAQKvOL7k7ZuNzB60iZhbKugefLw9RpsMWJ4c9HT8FD6j02T7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 12:21:52.2923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 979dbbde-cf8e-482d-960b-08de689ef8f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9240
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52513-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[libcamera.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:mid,arm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,nxp.com,collabora.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org,ragnatech.se];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.mcgivern@arm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4947411AB77
X-Rspamd-Action: no action

Hi Laurent,

On 10/02/2026 00:20, Laurent Pinchart wrote:
> Hi Anthony,
>
> On Mon, Feb 09, 2026 at 01:19:43PM +0000, Anthony McGivern wrote:
>> On 05/02/2026 09:40, Jacopo Mondi wrote:
>>> On Wed, Feb 04, 2026 at 07:30:18PM +0100, Antoine Bouyer wrote:
>>>> Le 04/02/2026 à 18:12, Jacopo Mondi a écrit :
>>>>> On Tue, Feb 03, 2026 at 07:37:34PM +0100, Jacopo Mondi wrote:
>>>>>> On Thu, Jan 29, 2026 at 12:00:24AM +0100, Michael Riesch wrote:
>>>>>>> On 1/28/26 09:17, Antoine Bouyer wrote:
>>>>>>>> On 1/26/26 10:44 AM, Michael Riesch wrote:
>>>>>>>>> On 1/23/26 09:09, Antoine Bouyer wrote:
> [snip]
>
>>>>>>>>>    - How many media devices are registered and which driver registers it
>>>>>>>>>      or them?
>>>>>>>> That will be part of the evaluation. My initial assumption is that
>>>>>>>> neoisp would be the appropriate component to register the media device
>>>>>>>> in this mode, since ISI is not involved, and ISI currently performs the
>>>>>>>> registration in the M2M configuration.
>>>>>> Isn't the ISP registering its own media graph ?
>>>> Yes, 8 copies of ISP media graph, that can be used with the 8 output video
>>>> devices of the ISI media graph.
>>> I suggest you do what RPi does. The mainline driver only registers one
>>> instance and they carry a little patch downstream that implements the
>>> for() loop where multiple instances are registered. Duplicating media graphs
>>> is not desirable (at least in mainline) as we can have ISPs with 256
>>> contexts, we don't want 256 media graphs.
>>>
>>> A framework level solution with proper priority handling and job
>>> scheduling is what is required and that's what the context work should
>>> end up being.
>> Our Mali-C720 ISP can support up to 16 contexts, each with over a dozen
>> subdevs and capture nodes. As we imagine this will not be feasible for
>> upstreaming :) So using  this framework is definitely the way we would
>> like to go. We are mainly limited by the lack of per-context graph/streams
>> configuration at this point.
>>
>>>>>> Can we get a copy of all media graphs on an i.MX95 system including
>>>>>> the ISI and the CSI-2 receiver ?
>>>> Here is an example with multiple sensors. Or do you need it in another
>>>> format ?
>>> No it's fine, thanks!
>>>
>>>> digraph board {
>>>>         rankdir=TB
>>>>         n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3 | <port4> 4} | crossbar\n/dev/v4l-subdev8 | {<port5> 5 | <port6> 6 | <port7> 7 | <port8> 8 | <port9> 9 | <port10> 10 | <port11> 11 | <port12> 12}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n00000001:port5 -> n0000000f:port0 [style=bold]
>>>>         n00000001:port6 -> n0000001a:port0 [style=bold]
>>>>         n00000001:port7 -> n00000025:port0 [style=bold]
>>>>         n00000001:port8 -> n00000030:port0 [style=bold]
>>>>         n00000001:port9 -> n0000003b:port0 [style=bold]
>>>>         n00000001:port10 -> n00000046:port0 [style=bold]
>>>>         n00000001:port11 -> n00000051:port0 [style=bold]
>>>>         n00000001:port12 -> n0000005c:port0 [style=bold]
>>>>         n0000000f [label="{{<port0> 0} | mxc_isi.0\n/dev/v4l-subdev9 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n0000000f:port1 -> n00000012 [style=bold]
>>>>         n00000012 [label="mxc_isi.0.capture\n/dev/video8", shape=box, style=filled, fillcolor=yellow]
>>>>         n0000001a [label="{{<port0> 0} | mxc_isi.1\n/dev/v4l-subdev10 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n0000001a:port1 -> n0000001d [style=bold]
>>>>         n0000001d [label="mxc_isi.1.capture\n/dev/video9", shape=box, style=filled, fillcolor=yellow]
>>>>         n00000025 [label="{{<port0> 0} | mxc_isi.2\n/dev/v4l-subdev11 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n00000025:port1 -> n00000028 [style=bold]
>>>>         n00000028 [label="mxc_isi.2.capture\n/dev/video10", shape=box, style=filled, fillcolor=yellow]
>>>>         n00000030 [label="{{<port0> 0} | mxc_isi.3\n/dev/v4l-subdev12 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n00000030:port1 -> n00000033 [style=bold]
>>>>         n00000033 [label="mxc_isi.3.capture\n/dev/video13", shape=box, style=filled, fillcolor=yellow]
>>>>         n0000003b [label="{{<port0> 0} | mxc_isi.4\n/dev/v4l-subdev13 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n0000003b:port1 -> n0000003e [style=bold]
>>>>         n0000003e [label="mxc_isi.4.capture\n/dev/video14", shape=box, style=filled, fillcolor=yellow]
>>>>         n00000046 [label="{{<port0> 0} | mxc_isi.5\n/dev/v4l-subdev14 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n00000046:port1 -> n00000049 [style=bold]
>>>>         n00000049 [label="mxc_isi.5.capture\n/dev/video21", shape=box, style=filled, fillcolor=yellow]
>>>>         n00000051 [label="{{<port0> 0} | mxc_isi.6\n/dev/v4l-subdev15 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n00000051:port1 -> n00000054 [style=bold]
>>>>         n00000054 [label="mxc_isi.6.capture\n/dev/video22", shape=box, style=filled, fillcolor=yellow]
>>>>         n0000005c [label="{{<port0> 0} | mxc_isi.7\n/dev/v4l-subdev16 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n0000005c:port1 -> n0000005f [style=bold]
>>>>         n0000005f [label="mxc_isi.7.capture\n/dev/video23", shape=box, style=filled, fillcolor=yellow]
>>>>         n00000067 [label="mxc_isi.output\n", shape=box, style=filled, fillcolor=yellow]
>>>>         n00000067 -> n00000001:port4 [style=bold]
>>>>         n0000006e [label="{{<port0> 0} | 4ac10000.syscon:formatter@20\n/dev/v4l-subdev17 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n0000006e:port1 -> n00000001:port2 [style=bold]
>>>>         n00000073 [label="{{<port0> 0} | csidev-4ad30000.csi\n/dev/v4l-subdev18 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n00000073:port1 -> n0000006e:port0 [style=bold]
>>>>         n00000078 [label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3} | max96724 2-0027\n/dev/v4l-subdev19 | {<port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n00000078:port4 -> n00000073:port0 [style=dashed]
>>>>         n00000081 [label="{{} | mx95mbcam 8-0040\n/dev/v4l-subdev20 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n00000081:port0 -> n00000078:port0 [style=bold]
>>>>         n00000085 [label="{{} | mx95mbcam 9-0040\n/dev/v4l-subdev21 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n00000085:port0 -> n00000078:port1 [style=bold]
>>>>         n00000089 [label="{{} | mx95mbcam 10-0040\n/dev/v4l-subdev22 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n00000089:port0 -> n00000078:port2 [style=bold]
>>>>         n0000008d [label="{{} | mx95mbcam 11-0040\n/dev/v4l-subdev23 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>         n0000008d:port0 -> n00000078:port3 [style=bold]
>>>> }
>> This was an interesting point from our sides too regarding the context framework,
>> how would shared inputs be linked to independent contexts? For example, one input
>> port with 4 sensors where each is processed by a separate context.
> If the multi-context ISP operates in M2M mode, the capture and ISP
> pipelines will be disjoint (even if they're in the same media graphs).
> Linking the two will be done by userspace, through memory buffers shared
> between the pipelines.


In our ISP we don't have to operate in a pure M2M mode for multi-context.

Instead, we have a time division mode for multiple inline sensors simultaneously.
The context management unit writes incoming frames from multiple sensors to memory
buffers and automatically schedule them for processing, injecting the buffer into
the pipeline once it is available.
In the driver we just configure the context, provide internally allocated DMA buffers
and the scheduler automatically handles the rest. Of course we can get interrupts
for these events if we have use for them.
While we could do this through userspace, it doesn't make full use of the ISP's
capabilities such as its hardware scheduling. From a media graph perspective, I
think it should be considered as an inline ISP with the buffers simply acting as
temporary storage while the ISP is busy.


I guess my thought was the camera "frontend" would effectively have some shared
state across all contexts, but the outputs from this would go to per context instances.
Perhaps a similar thing would apply with this CSI-2 receiver and the ISI since they
appear to deal with multiple sensors that are then divided across their 8 contexts?


>> As a test of multi-context with duplicated media graphs, we would segregate our
>> inputs between media devices, though this is less flexible as it strictly ties
>> one sensor to a particular context.
>>
>>>>>> If I'm not mistaken you'll have 8 copies of the ISP media graphs, and
>>>>>> that's exactly what we're working on with the context framework :)
>>>> Ok. Then I should have a look to context framework too ...
>>> Please, I hope to be able to resume working on it sooner or later
>>> given the right use case.
>>>
>>>>>>> ... since it is not, your assumption seems very reasonable.
>>>>>>>
>>>>>>>>>    - How can the user decide whether direct (csi2isp) or indirect
>>>>>>>>>      (mem2mem) streaming shall be used?
>>>>>>>> That will also be part of the evaluation. From dts would be my first
>>>>>>>> option, but may prevent using both modes on same platform then.
>>>>>>> Of course this depends what the hardware is able to do, but in case the
>>>>>>> HW is reconfigurable easily, I doubt that device tree is a good choice
>>>>>>> to solve that.
>>>>>>>
>>>>>>>>> While it is certainly OK to introduce this support only at a later
>>>>>>>>> stage, it makes sense to consider this right from the start to avoid
>>>>>>>>> some nasty changes e.g. in how this hardware is exposed to user space.
>>>>>>>>>
>>>>>>>>> Also, we are facing a similiar challenge with recent Rockchip ISP
>>>>>>>>> hardware (RK3588, RK3576, ...) and it would be great to hear your
>>>>>>>>> thoughts about that.
>>>>>>>> Is there an existing discussion thread available on this topic? I would
>>>>>>>> be very interested in following it.
>>>>>>> Not yet, I am afraid. But there should be one or two soon (TM) :-)
>>>>>> It's probably time to have one :)
>>>> Good. Please loop me in ;)
>>> You are in, this is the conversation ;)
>>>
>>> It might be a good discussion point for the media summit in Nice
>>> co-located with Embedded Recipes if people with interest in the topic
>>> will going the be there.
>>>
>>> I'm also adding Anthony from ARM as I know he's going through the same
>>> inline/m2m duality you're now facing.
>> We make the issue even more complex as individual contexts can run in either
>> inline or m2m mode simultaneously... Though in our case the ISP does not
>> have any external dependencies for this like with Mali-C55 + IVC.
> Simultaneously ? Can a single ISP instance run in inline and offline
> mode simultaneously ? How does that work ?


Technically speaking the inline still require memory buffers but once configured
the ISP can run without involvement from the driver. The buffering is effectively
invisible at this point.
The context management unit facilitates this through the aformentioned hardware
scheduling. Each individual context may choose to use inline mode or M2M mode.
In inline mode, that context is "schedulable" when it's input buffer isready,
which occurs automatically once the image is fully written to memory.
In M2M mode, the context is "schedulable" when the user triggers it via SW.


>> As a side note, was there any thought into how Libcamera may support a pure m2m
>> usecase, say by passing user provided frames rather than indirectly coming from
>> a sensor? Perhaps there is already something for this that I've missed.
> https://lists.libcamera.org/pipermail/libcamera-devel/2025-December/055627.html
>
> I expect more work to be needed before we can finalize an API, as I
> think different people will have very different ideas of how this should
> work.


Ah nice thanks :)

I took a quick skim through and it seems pretty good. When I have some time
I will try pull this series to test on our side.


Thanks,
Anthony
>>>>>>>>>> This series is posted as RFC because extending the v4l2-isp interface may
>>>>>>>>>> overlap with ongoing work. If similar development already exists, I am
>>>>>>>>>> happy to rebase or adapt the series accordingly. If preferred, the series
>>>>>>>>>> can also be split into two parts: the v4l2-isp rework and the Neo ISP
>>>>>>>>>> driver introduction.
>>>>>>>>>>
>>>>>>>>>> A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
>>>>>>>>>> consistent with the existing style in that file.
>>>>>>>>>>
>>>>>>>>>> Testing was performed on the i.MX95 EVK using the media/next kernel in
>>>>>>>>>> standalone M2M mode. End-to-end camera-to-ISP capture has been validated
>>>>>>>>>> using the downstream NXP kernel, as some hardware dependencies are not
>>>>>>>>>> yet upstreamed.
> [snip]
>

