Return-Path: <linux-media+bounces-48743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA0BCBC3D1
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 03:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87CD7300D15C
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 02:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292F7263F44;
	Mon, 15 Dec 2025 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="yRk9kj8h"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022089.outbound.protection.outlook.com [52.101.126.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394B98834;
	Mon, 15 Dec 2025 02:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765764971; cv=fail; b=ZB9JHqAR91/POS96MVvHZ5qRUOFU5P3R+UJ+mimSQmEIPVF/o9AcKNHDwBltuKYJg+/7AcoQqi8POO6I2j+DZjRv+F6EKaPoPo9MxRD3Ui2gUanFxFP/2nv9Ca5HaPOttdhAAgWXA9vNFyw3AknDVbXPxvLF6FVuYY4OXFw85wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765764971; c=relaxed/simple;
	bh=fDmhVBtvhc7NkIqXHlcvCJUsoAQQTO34dMfyJSctwnY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mw+apexF/euJ9w0+cdpFEbH8f9CktjtfpAdC3fN1EaGRza8ytej7zD1tntn0qOyU415vWnpWdBxEPQjCtul8RWsfAy4pdOV4z3c1/vTHehLvK3H6Wl7qy2l6wYbLRr1qVzlJhCFdHaKACRnAnVtobrQzzltDsPHTuzcW58EKk1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=yRk9kj8h; arc=fail smtp.client-ip=52.101.126.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFWfwq2bxV6f+XbQvX2dWZND3pLvOo9cBCd0LCvFN3kb1Omvxi59DDqddp1SrfiNOaN8e8gM/1OaHDHAQXv48+PnEH2gHzcuybOCyyiwuPmsUKedJHgNgmhfyAmo/Hha03WgDo/d5987PVga/ajbxwCkepcSioq4kO68dWn1YfRjMonR2LrkNoGpgOP46hgatk6zBrATibIPbBMU+0fbcxe1L1xgBweYsscbyfbYGluIKsbTDWuAHEC+BnhnWW0YtDDNCr29dJCuMqkhj1IGuHfILYy7ide9MCYteYRaTYu+DYn2ZBctueNI2d5BW5tpM8Un5z2mhARyBjOrrjXF8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDmhVBtvhc7NkIqXHlcvCJUsoAQQTO34dMfyJSctwnY=;
 b=lvMv4yoxSG8ZrqlFFehBWJaB+mv0IBzBvEtwIbd91sTEineQuFA5gjmuyEfoopIlxXJX1f8UPqgtrGZp84rmSV1fR4eDTGctposQuLtAouc62rV3Uoy2jKHoJ/AGPb8iuXxiEH2rO+FFH1/zhXoCOZlJ1QzaWNXpeaDWszmZYTV0IsGg1h9wxeaCWQf0kWOkTvYXDSu3wHe/ey4PY8dPvoA2G8cGYsew5Y8dHoGvjdwd+pnPBmeDUCslonuZBfskCMB/qJ1fl5Q6FolaXeOfhGDqZZqQ8ks1llro95CAGIRko/zKR2qUBd57na08HLFOijfwcezlzizxuIDTlYHrnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDmhVBtvhc7NkIqXHlcvCJUsoAQQTO34dMfyJSctwnY=;
 b=yRk9kj8hsAsC4aMpLQxi8gi0Le7h85MwfV3voTnjdRqPV9uin0W/CuEuEZ3B90FT/3M4efKTi86aaU06Jq/+nv9zgQMK4RRybrhBgv/r/bBYkp9e882geeKOhkv5FJAsrMfVFbiXuqJYgrjjmkxk6CV0Z4lO9kvBe3S82WkCSmGUbqVvafslxFvzJi4PlpDG1BuhSytl9x4cKKVASBq0vBYxzRP2ucuEcE0/OYbUeuKrfryWPXefJqWwR+HTUjhErEHGVuQhWTB9VOb7bLW5Nl7zQQ8kB+kwIy9mpEPCp4qPaxce2B0DPYK4gvU4A76xDPemOofmMy8Vwb4J3v2rQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by TY0PR03MB6906.apcprd03.prod.outlook.com (2603:1096:400:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Mon, 15 Dec
 2025 02:16:02 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 02:16:01 +0000
Message-ID: <9ab31529-8146-4ca7-8389-04c69f7d1b49@amlogic.com>
Date: Mon, 15 Dec 2025 10:15:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/3] decoder: Add V4L2 stateless H.264 decoder
 driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
 <20251124-b4-s4-vdec-upstream-v2-2-bdbbce3f11a6@amlogic.com>
 <9b74086ac938475328904960add2c284b81efd4a.camel@ndufresne.ca>
 <12f26bf8-409b-4206-a39b-4bb2a14edec0@amlogic.com>
 <f9c113914290a0701614c64b5e2167d4b3e21646.camel@ndufresne.ca>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <f9c113914290a0701614c64b5e2167d4b3e21646.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|TY0PR03MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: 224ea853-4f14-48c2-8bd9-08de3b7fe493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTRVaWlNMmJuVmdPUlJvYUZmK1dhWmt6MlFZWXlHV0JZejFHSThPQUZnMlEx?=
 =?utf-8?B?bnFGS3ovMnVuNEkwRzZUSitvcHM0RHRDZTJaTlZNQ1dPa0x2ZldHdWpod0Ux?=
 =?utf-8?B?NFZEWFc5ZHJhWWxGeFBJMlU1OTlvbHNCZGxvaDR3dkt5Vmh5SWRFUU56TVNj?=
 =?utf-8?B?eDd1YjdDODJoc0V2NC9NS25ZYnpHaDNtaTA5TVNlQjRCbHZ6NmFCNmM2WTlM?=
 =?utf-8?B?YkIxSEZPWVc1UlJPK3FpbDdEeUxHY0dTRTBkUGFrdlVBakhkSHBFeitOVTRZ?=
 =?utf-8?B?V3I4V3ZjYko2bmVGaTV4akJJQXNpVXFUQXFyUkRhSm1PZmtnQnRwL3Z5aDA0?=
 =?utf-8?B?Tmd2NWFUaXIvdWdaZUd2RUNsT3JRSmxRVFFrclE3eFo5N0JBMHdNOW5IZE1X?=
 =?utf-8?B?T24zbnkyTC9rVTQvKzY2YlNzMG5HSi9QSlNzQ011V1dDL0s5ejBmWm9Od0Ji?=
 =?utf-8?B?LzdsWUI4RkdHTmI3cFBZYlhrdUJWTittcEVvbXVOVnRkQUxLdzQ5UE9ZdDNH?=
 =?utf-8?B?SzNPTzN3NlpRaTFxNlJvSHdpL2l3cjczaGgyeTZidVBzTkl2SnRLMERURk0r?=
 =?utf-8?B?cDhQa2RXRGdZMkRSeUFJSFNLMzRZd1BCN21oU0lwSFZTcVEzbGNKRlJEdzlJ?=
 =?utf-8?B?ZzJhemxjTFZnQkRjSkY4M0FZUkx1eU94RGVOeWVaNjV4MnJ2T2JIWTNhSDNS?=
 =?utf-8?B?dm5nN0NzU041ZC9YazNpcHY2czB2ZmF5U2JxL1kwRUV1eGhEQkt4eG02QUZT?=
 =?utf-8?B?dTk1bXNGaXJGMUJpYm54VldmVldLaElWTEh0cmlwSmo2Y1poMzdpNW5pdTdl?=
 =?utf-8?B?WDUxZEFlU2xESGFtVk9JM1dUWFZ4Q0grcll4QjM3aHFqY0VSdytrVy84Zk9D?=
 =?utf-8?B?dDlWUEtZR005cXNkTFM3TkxnQlYvS3p3Mjk3VTVLeGkzZVNubXU3YTNxMnd0?=
 =?utf-8?B?RnJxa29yM1BlTjdzc3ZFS0Npek85cnJ0TkdRLzRsam1rREFMczJTMiszdWFy?=
 =?utf-8?B?ZC9MeFVOMVFMSFoyMXQ4OFliL2pyQUJTVzFFV2RIYlROVzBkaTlubG93Y0FF?=
 =?utf-8?B?MG9TaFVVOU5jd2tFbVM3bXF0UVgzdWRqWDdDSHJlaDdVNGpXQVhjYnY0TDJZ?=
 =?utf-8?B?YWRlWkRaeWlkeGR0R05DNW5GcjUrV1FSUVRXUUduSHRhSzBhTnJoU2x0Qktu?=
 =?utf-8?B?NXJINUs4cU9LOTY1SXI0SjZNeFh3cTQrc3NUZzYxb2NyWEVnWmYxVGFaanlQ?=
 =?utf-8?B?TnFHUW5sWm5aaVhyS243VSs0SllncFBuSS9uQU1TVVhqNlNlSXV2QklFc1BD?=
 =?utf-8?B?MjIwVkdJbzM5aW1pUmxiMFRCZEYzWCs4aldNUURJb2tQdDlrdXNXRFZJcnhP?=
 =?utf-8?B?b0tBK0VHbFpMTXNWK2wzU1FLZjI5akVodWdubmR5Q3I1TEVkQjJZVXFxeHVT?=
 =?utf-8?B?dnVibHgrV1pPNXQybmN0WEk3TWFPQ3ZMKzl6YmY1alBDYlRybW9YNEloQXhY?=
 =?utf-8?B?Y1hnVzNQM2xDaURNTDJvKy9DRnBha2F5MkdBWUE1dE4wZ3RDVUNDRE9mVGVD?=
 =?utf-8?B?MUwwK1dlVW1mMU5pNk52UWEvUmxhbTF2a25JcGo4RTYvamNrbk9rQ0tMOG1i?=
 =?utf-8?B?cTJmakdaZ1lDZWk3cWNQTUtxb3FreTI4bEdqb3oxWEkvMVJhWDExQUdpZkho?=
 =?utf-8?B?UEl6d0dNU1AyYzBiOGV4T2d4VUorcDJQOW9wNFRqZUVvV1M3Tnlpbk41bG0y?=
 =?utf-8?B?SXlJdHBPdGZUb25sYnNKT2NqNmxjZ1N6VlF6L1dMSFVZcWlnVmVkNkErem9J?=
 =?utf-8?B?T2RXcjNqeGRTclQxbEZOVzFFUldiK2x4RFdBWlhTYjJJc0xvVHlHbGtvd2hu?=
 =?utf-8?B?NEVhZG5zY0F1MzlLcW5nNVUwMjVBWU5ybFNkeVljSXFKN2o3T3J4K2poQUMv?=
 =?utf-8?Q?R9/GJIsSUEXFFUZ4osLKSSnxpjKJSZ6g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnQ2MHhRN0Q5RVZZRmY1QVpqWmVBeDVkVG5abWVjYmZycUJYNElSZHViTTA5?=
 =?utf-8?B?bm5jTFdObis4V0JSVGZZRmxZeThTTDRMcnpGVTIwWGo2b0s2dzBZM2hJTk53?=
 =?utf-8?B?ZlZ6b3o4THY1WWcxM1BsVkp6aE4vMHBxRzA4eVl5VWVxaFJ2Z01LT3lNdnZy?=
 =?utf-8?B?aG9zVE44alBTTzRYcFF3U2NQeGhJam9aSDNuT3p6VFRMd3RuSk1oWmUrcXky?=
 =?utf-8?B?dExYRUlJN3MzeG9NWFRBT2ZjcXRRZUNLZU9sdG1mN1FmYmpjcmNwRmE3SUYv?=
 =?utf-8?B?UjB2OXRQcHljZ2pqK2F2YXBvcmIrVVlnSFRYUWRvNmJ3Z3RZMmc0VXZFaSt0?=
 =?utf-8?B?Y2N6TkwxQk92bVdDb3M4MHB5RkV3eFVydGhHaGxzT01TdGJzdHFpZk9uem1v?=
 =?utf-8?B?VjRNK21WN00xbzNoTnF2QUVxZzI3MFo4cHd0b2IwVXA5dVYwazlEeVpHMG5t?=
 =?utf-8?B?U3kzcHZyaXhHeFovSHhiQWlaRnAyMHVIS0x5R3ExWlExanAvUWVGcEhackN3?=
 =?utf-8?B?YXlqVjhtY2NDMUFvZHpBb09WQ200b3JIV3ozazE3UC9ERmFuUllmMHpyQkNT?=
 =?utf-8?B?TEhVU09VRFJvU3NWWlAycjdIRTUvakZ2UzV3dkZrQzlFaWJiNWp4ckN4djBn?=
 =?utf-8?B?M0FZZUI0T3E4Y0pZR21idVFFeVo5R21kNW1JeVA2L0NxZ3VPQkt4VHMza09w?=
 =?utf-8?B?RjB6Q0ROeFNIZnRWeVZ1eWhZY3ZkWStMQWVycHJFbGY2VktGckdiZVM3SC9a?=
 =?utf-8?B?QlZnN0V1RjZvNDVqVzd5Q0lzWUF3dTZNa3NJemdTY1FsZHdUVlFDM2prUE5w?=
 =?utf-8?B?bzVtS2FYOUN2Q0ZFbVR0Y1NTSHFrbldiVkRCbE4wbksrWm5uaTU5ZGkxZkdB?=
 =?utf-8?B?VGNpYWhzbGxzcmJjMlJZdGY0ZCtVL3dCdkJBVnVLWXV5N2ZMQUE4NC91ZjI4?=
 =?utf-8?B?SkdmOWhSSFFuZWJpcmhMREZBU1RkSnJkdHU0eFNnNkt5N3ZZUThVdkVVM3dY?=
 =?utf-8?B?TnRCN2NGVjdRUHY5SFNUcEdHQnk0QitBbFBvTlM2bkNtRWZDQXdBSy9OaWpk?=
 =?utf-8?B?VU9uSUdnUElXd3VKbnd2WG55ZU1DYStjQUVFN1NOSndaeEJvQlZVOE54Zk5T?=
 =?utf-8?B?VmQ5UWxTcW00MGcvNTJxL25CWDlGelAvRVBhd0dwdEhrNURTcTFIckpzOWdr?=
 =?utf-8?B?RU0xNzUraEU2ZjFtRXN5aHhiWlovWnZ4c2twNlJrWEN0MGVFVWpCZ05mOU85?=
 =?utf-8?B?NWxSQk11b2NhaDY1VlZ3NkNSNFVvd1JaNmFXczM1cmFhbWhSN1VaS1JJMGEx?=
 =?utf-8?B?YjhYL0R1OVgvZ3Y0Z2RZdVlqeGN1MXROZGVqQnFVTzVwM0ZQL3dMcXlwcW5C?=
 =?utf-8?B?OE9FZlNGZndXeTFvUS9sTFM4Q2k5cjl0TDNFblpxRktCN3NRaFp5WkFuR0pN?=
 =?utf-8?B?a0l0K2dPZkxodGJLN1VRMU9USzF4eTFQZW81OGdjRFIzL0JXMW91QUFTdGpx?=
 =?utf-8?B?d1dHUzZJVWRjaUpKNUdMUzRqbDRkOTNjYWpzR2NySUdHbjdNSWNYQm55N1dW?=
 =?utf-8?B?aG1GTHZoWXJ5TG9TVGsrSGFoWW1SRC9pL3k5RktlYnVpTklRSjU2bVZOQWpD?=
 =?utf-8?B?bExud2tYdXkyZjgzeXdDQk5qcmRnVFVQdVpoK1AvRXRRUkJpaXZMNWYxay9w?=
 =?utf-8?B?ZHdrUm9qWFpnWHY4bVR1RXFORG1nd1p2SDZySkVwQzVYa0Y4M2pmc1M5ZTIz?=
 =?utf-8?B?R1Y1OWdES1ZzM1BWQWZxaHNQcmpCcVJUVXlpTS9ZOHE3UzJBanNKdWdTQURH?=
 =?utf-8?B?K2dvdXM1NE1uUHpzWXNrUEtIVkwvbTFFMGQ4S25vdGhPMll6dnlzQVFUOUVl?=
 =?utf-8?B?VnBaeXF2WmduSnR0dWtWNEJnUkhkWGoxRXZJM3REakFQNWxxb2dVOFlIN3Zu?=
 =?utf-8?B?M2NKcGlyWkhpOExKZWg1c0ZSTDFESzFSNk1GdFFZdUx3Qlc4emUrOEZsMDBm?=
 =?utf-8?B?UTJSSEY0S1hXbHlIK0haZG9FWW5qN2pHb0dWUm9qYkw5aWFBS0xHOUFoV1B1?=
 =?utf-8?B?akkvSXh0eWl4b2E2a091SHFaNlUzcWd3RThRYjRLTmpIUStWMTErSjIyeWZB?=
 =?utf-8?Q?psIjgVd3FuvY3m5CHKNdJzWMY?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 224ea853-4f14-48c2-8bd9-08de3b7fe493
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 02:16:01.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n65oXMNv5/y88/os99xATpLuW7buSNKf5rici/R0JXmrPaXtqLVZzxaqZsfygJjAbK3xqHeLnKHKRreAVsMsRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6906


在 2025/12/12 21:51, Nicolas Dufresne 写道:
> Hi,
>
> Le vendredi 12 décembre 2025 à 12:11 +0800, Zhentao Guo a écrit :
>>> strcpy() would be the preferred helper for this, no need to fill the leading
>>> zero liek this, see include/linux/string.h
>> Ok, it should be more suitable to use strcpy.
> I have to correct myself, I meant to suggest strscpy(dst, src, size). Passing
> the size for safety seems important, and unlike strncpy() it takes care of the
> leading zero.
Yes, we use strscpy() for copying all the strings.
>
> Nicolas

Thanks

Zhentao


