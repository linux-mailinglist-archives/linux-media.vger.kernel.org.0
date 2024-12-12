Return-Path: <linux-media+bounces-23245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D069EDF94
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 07:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F18D11884290
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 06:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B08204C2C;
	Thu, 12 Dec 2024 06:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="IDt4qYDR"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2126.outbound.protection.outlook.com [40.107.117.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E91F204C1E;
	Thu, 12 Dec 2024 06:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733985779; cv=fail; b=D5z0qcQjBxqe70crDDX7X9qK+1Kx5mc6t4y7iWAe+U72MqM5BYZ3GdSp0ByGhQI+k++nsOil/fMBBcz9bjwTBU0hfKK2be+2AGIlGbmk6ZhyPZAm3+vSjkdLLSvidgUc5QOAW+nOJyNSAmAszSiY+zMglFWPwVkaNfNkHoBMclY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733985779; c=relaxed/simple;
	bh=fa+1OUUh3pCEBskNYpOR/LWaodgOqc+p018QMxrlVEk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cdFHt3YcMqz7EI0RTOArVRI0ZreSdF+MDRpK4f4dQ6xWIbWGZCAZkpFDbJT1XkNA06J1+CyKhIcFT65siEHmpvC8+H4svTes2/dZQaYqRexMGVh8/O6ZkV0VOWcKlBslPBCJVv98pX5rbDNNoaoaPVLD0qnXH+QCgzqjysn28Wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=IDt4qYDR; arc=fail smtp.client-ip=40.107.117.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ub3nm77uUS8db46IpPTN21Nxog5ESjG6nMmlfBk32CeWbrE6+qEQ4X0JgDo3nlcpVyiBSlw+73wQoN9SE8pVrsSnLLS9IpbivMGAqU8puHy7qGkG3jbIKXEmAGCYUNFW/9nOp/jItJSUf3NdDAuASaIDebHtYdCLu7o8m1TLMIXqJMpUSJhc/LGs+cBW7/B6BM3klISDcrGLANT2AXftXOFwVyCgRxSZePYPRoRNimLFThu/mFgF3qlRUWV9clxjUEY/qYmwH+XT4uk+NhCCseldllX12fbU9gBVOdBS5VAK+60J9zT9EA51gFMhR27t6kF2/bq9b+GarR5KJ6Pv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eJIRtlOg2jav8RgqjPMQ3+Q53H167/yNmfvxegay4U=;
 b=lws425p1dM2VjaSboXMOKvKnNvizdvxhHFZj2GPwKt8z0Ej/KlxbN0+5+qRMtQr4XvQcE017UFll8MJtfLBvtWQ/R2s1MuUAO2l1V0WW4t1WIoGaa9/w9M+NevzcHJoM4CCTGCZyhvwbKYoycvP72C0afprBBJ44BPlw0hH51uQ0XfkOW5RC25oXo6cmsTMcjiexf6EU8zOphzcRPZoDjwv3hCxczPYvMYu4VIXaHeT7j5/f51QDnoWFas5zRfqHDEWpEpwNQsaMp44n3Ey8S9w33xxdztHNSwW4d3Zo6nM1HlWUFS/T64uKHPTbrsT2YJReqxcmFobD3tIeuSLBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eJIRtlOg2jav8RgqjPMQ3+Q53H167/yNmfvxegay4U=;
 b=IDt4qYDRWx7BSRhIXzUQqUjp9xU1Jv61nRc8ZDeyGk4Nplq/yS+XyzRKTYshJEuNyvSOzjuxccv+/j3pyopEXcCr+kML0oDAwyf+acWXO2686VlynbglW75eg08WpIf90fgoUHe28czQbhqNJx/lqaS29HUwEG0d93PGtLjfSyAJbG5neazX9nvKewe6xX/+u7VSGfWdUUaB+GuZ509/zv4o0gaSGc3yHy/66O1axq8EDQ7IYb/faYf8btsbeTlvq8wy/cd0nsvelc/M+RnHuMhR7oUCi35pyFfuXRZYQ4NNJVlQ6LxuIHvkeiN5fsZiUd2fTGnPtZdZGbyTb1WctQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by SEZPR03MB6957.apcprd03.prod.outlook.com (2603:1096:101:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 06:42:54 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%6]) with mapi id 15.20.8230.010; Thu, 12 Dec 2024
 06:42:54 +0000
Message-ID: <fa258e39-2492-4c9b-892f-b54cdeb4bd8d@amlogic.com>
Date: Thu, 12 Dec 2024 14:42:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] media: Add C3ISP_PARAMS and C3ISP_STATS meta
 formats
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
 <20241205-c3isp-v4-6-cb1868be0105@amlogic.com>
 <6h2epavsgxonytbar2wv7qv6ojuzryst6gqjcceuccoxubwh64@5wqchwktrivu>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <6h2epavsgxonytbar2wv7qv6ojuzryst6gqjcceuccoxubwh64@5wqchwktrivu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR01CA0105.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::21) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|SEZPR03MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abb502c-1f0b-4db1-f817-08dd1a7834cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTluaGdhU1FCaldPWHdIbHBoZGJyRk9uNi9GdW9NU3V3d2lVRzJzbUtOZG5U?=
 =?utf-8?B?MDZOcUNxVHhNSmVmVUd4clhYZXcrT2xITHI2cFFlYjEyMEMwdlpLWFh2Mmpo?=
 =?utf-8?B?aEptbnRpVlhVc2JINmJhSU9UNksvZit4bzhrTWFmZWxIM1ZnWmtPTHRJSlNz?=
 =?utf-8?B?RjNaSmVkemhmRXQ1VmU1UmEwd21oYUVOVkJhQ0pJaWRCOG9Lb3owZGdDVitS?=
 =?utf-8?B?VGFpbXVLMGY5b01jblBQZm1UQlRRVFdhTnVvUHMwRU8ydDNhU01WUU5kcVE1?=
 =?utf-8?B?ZThmTjlkQWFlQkdPOUFiZFhJdVNqeUlOc3lqSnJGN3V6RnNkM0dHS0NPTzRO?=
 =?utf-8?B?TGE1czVwM3FiZW1XNkNtVGVvWlNTblhCZ1NXemZaZlZwalI3L3NpVERxc1Jx?=
 =?utf-8?B?UjJ0bjNQcWhNajIrMXJLV0oxVEp5ODVZVEwyS050dzBHT2ZCa1hxT29uOFhI?=
 =?utf-8?B?Rk9SUGdqWVhVSjBscXZlU0ZZQTl2T1JtYTRtOHEzbFRDeXYxVUwzSHFEdUJ3?=
 =?utf-8?B?VmdPa3lKaUd5Ykg4a1I3aCszdlkxcjVyRTVzOUlqYUdqdTk1dldtWWJjWkdz?=
 =?utf-8?B?L3dhdXdTbnUxNFJXaHlSbjNPSTY2MDBmQnQ3WC9tdkhTRGtOcXB2ZmIwWmYx?=
 =?utf-8?B?bThiVVZjWjFIWldJTnd1L2FGT3ZxalZXckpKZnRPZHkxM2p3QmIxdlN4dXk3?=
 =?utf-8?B?aWRHcTlNZUxBdVhjR01YeGZlZGtNMEFpVEIxM29QWTdpMXdMeThzQWRhVi9S?=
 =?utf-8?B?QUg5Mk80S2VvVEpXQVF0djFCRVorMFJ2RTNlWU1XK3FYV0lOOS9zQVdjUlRn?=
 =?utf-8?B?S2hGcmZkMFNHcGw5VldjdHNvZWw5L3FzWXA4WXdrazVieUVMZGtCTlU2dHQ0?=
 =?utf-8?B?UFBqMjJXTFgybktyR1VTbUJLTC9paTE3QVMvSnlsWmdWbVVjN0FqRW9yKzRn?=
 =?utf-8?B?b2UrZXFaTXArWXZsendYNjdNVUpHMW9JcmRrL2pZSTZqMzIxbk1RRlVuL2w1?=
 =?utf-8?B?VDVEbVdDMFpqeUdTem83UFFTZkhDMStLdVZkTFBHeUo1ZHdsUnNrRTBicmFL?=
 =?utf-8?B?Y1I2ZXVBM1pENFdURk5vQ1ZuVTFScFpqZ3Q0aUJPeWVrZmFIOHNxbFFra3Uv?=
 =?utf-8?B?Y3FZTXN5WXBjcFd0eThWcUpnWEVYNXJPWDVncXFLdm01bWVoRkhpMVFJTldq?=
 =?utf-8?B?V0NEZXZtUG1mZU4xUWlwaVZ1a1Z1YnVQditkaEh5MmxCZzlNMG1qR25ONnBW?=
 =?utf-8?B?VVBoSmdaWEI5ejV5MENJL0gzQWxnNFJNcEZNanA3RzlSSnF0SkZqUUhENW5I?=
 =?utf-8?B?amx0ZzMxWStON1E0TThDeGxOQ2VGUTZ5bHFMcCsrYlIvR24yOGpmejJEMnhM?=
 =?utf-8?B?VlFXc245N0RlQjRVTUllR0V6eDBEcWowbHlSODVxRTBCMGt2NVVpUFUvdy9w?=
 =?utf-8?B?dzJ4eWhBcjVNVS9SbjlOT1VkbzAwclRPcHBjTUc5VGlvSzI1eHI1aEtzcmFG?=
 =?utf-8?B?WTQ5NW42QTB0dmFuckl6ME41SDQrNUpNK2k5U3ZFcUFVUHU4RVoydThRalRC?=
 =?utf-8?B?RVcrZjNEcExQZXMyUndPdHNLZEoxbEJQZU02YUZXNTROc2l3djF5SnhkTVNK?=
 =?utf-8?B?WnVFNWd5cGRkcTYwNXZDTnlWWm5MNHRLMGlWUURDeHZEUUtvd2RIZzI3Qm9a?=
 =?utf-8?B?REdWRFFidzA1NDh2dUc1QWdXTU0vMGI3MVg3ckFDOTdBcmlFVy9KVS94Rmp6?=
 =?utf-8?B?SEVtdUswbU1FZytxVyszTkFhRlN4dm1rbVlFMWY2TVN4ODVkN2NwS09BU20w?=
 =?utf-8?B?LzBpMGJBWFJLNGJxd2NCTTRzMmxpOHl5RWJNbjV6eTc3UjhEQUJxckNIZ0p6?=
 =?utf-8?Q?KNzlPj6iC/ZtY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anZSN3RwOGZsaFZNTWNrSUwrSGh1MHlnMEREOWlkaGJJSDFKSVhvUnJMNDlx?=
 =?utf-8?B?OWxhU0ZFNjJZcktMT1VISzIxZkxpRXl5KzMxQnVRVEUvM3djV0p1Q2kzcGRw?=
 =?utf-8?B?a0txbmlqY3pIbVdWeFc4aTNaWVpKd2tjc2ozT0hhSDdLNWRXNDJ0SkxLNkhl?=
 =?utf-8?B?dGdsMVI5ZUZMb3RxUXVsSzZWeS9WN1h1QnpXZ0lWSUhXVGdzaFVXNE0yS29w?=
 =?utf-8?B?aW94Q3poWjAvU2tXaXFYcVcyTk1ESnJIN3VBVVQxZVl2VllxZHpoUC9GMEdG?=
 =?utf-8?B?OExmM3hwNjc4ODVoV0RZYWh5cU8zQlA1a0I2M2hHcWJnUnQwYlVpdDBTL0NO?=
 =?utf-8?B?Q3k5OWNDamNGWGNPZ25NY2RyejIzd0h4djBiSVRDeUpVdmV3UDRkQmpIRzRn?=
 =?utf-8?B?TkdINDZIN1hIbW9KaDlORks1ZjJqWlhQUzA3WUVVcWpRT0k3YkxFcXVMNE10?=
 =?utf-8?B?aGtDWjB3bG1qbzhJN0UxcklZYUFNL0ZkT1lOS0ZtaVpPZVBOZzNZNGlhUFFS?=
 =?utf-8?B?MUpVcGEva0xCY0twbHRzUTdSQVI4UnhDa3BnWnhacFZsSzlRZmRZbXdwd1NU?=
 =?utf-8?B?UVZES3dOMExWSWdRMjJLZXlkQ1BNZUk3UEYwTmQ0SU5NeE5tbVZ3Y3NKZ1A3?=
 =?utf-8?B?c04yZlpRWGZKbUNxc0VPZkNvZ3FXWkpaNTB4RitCa0hGeXd5QXF1M3U3SWpD?=
 =?utf-8?B?NlF5cnpCTEwySks4YWZ2VFlsaWg4UzN4RXphOHF2WnhIanpjVzE0d25rVFo2?=
 =?utf-8?B?dlFxcllqODBOZzUvbDZhNmtlV1lsNm1PcW84N00yZzdkaHFEVUdMdkdoVWhZ?=
 =?utf-8?B?Mmc3a1d3eENYc0RHN0ptZjFkWDVENU5xMEVSQ0F6ODBmRDQyYmROSVFsNll1?=
 =?utf-8?B?MWEzYUZUdHpxNEFBTS9RRXJNajFqaWpaY1VWaSs4UnRJd0NaVW9TZVNHYklx?=
 =?utf-8?B?ZTlkV2tBOHA5MFB4VFFjY0RzcGU0MnF0azZ2S09ZYmFBRmdMRlZUeEUra2hQ?=
 =?utf-8?B?dUhSbnR5MnJMOEFMeks5K3VNVHNteUR2UUVSNUFQTUJiMXdsYUdjL0Nxdjh5?=
 =?utf-8?B?OXM2V3lITW9yR2ZpK056bXY0VU96eUptclRzS2NvaVJ0Wm55VzJaZ3pWa0ZY?=
 =?utf-8?B?ak1oSVNKVkJzSndzdjFqTXVwRTNwWDVSQUw4bnlCVGdwTEEyb3VQY2ZQZVh2?=
 =?utf-8?B?cHUyd2d2VHJiMzZxQnVFcDR5NE8yWDN4ZVRibDlUNlVJQzF0MU5jWXZXdCtv?=
 =?utf-8?B?S1FyQlVMRzlXVTFBMW5VR2djZW1RTDhRNWlZTFdMYXRzSnhRUkhUMFFMcmtV?=
 =?utf-8?B?Y3NqT2JOMnRnZDZyVFhqUzVmSUVoZFIwQUJCWWZXR1AzbEZXdGwwcjUwWC9p?=
 =?utf-8?B?aE5kaXVBRmRHb01MRVVpQzljMWRwL3ZXYzNnWDlZOFBwZWp0ZCtQYmxFbUg4?=
 =?utf-8?B?clJvV3BFMTN4eXh0K1BzTFk1dnZSZEtkQldCOVNka0hRT2thZzhmYk16d2xT?=
 =?utf-8?B?dlpjZjNwTzM0ZE1tYlN2SzVrZ1lRSFNFMXpIMkdDWURPK2FRZXZsWWdxb1ZB?=
 =?utf-8?B?ME9YaUFocXZMd1ZHTWNFeUw3eGE3bVNJcklhTXBsRStrSnpTeWtxQzk4Vnln?=
 =?utf-8?B?Y0UvdTNpdWY2QUVZOXlnS21WNE5JY1hiZHY5MndtWFBsSkRhcjZiWE1PTlN4?=
 =?utf-8?B?SlVlSFRTM0VlNXRqQU9CRW1mOFo2YzIwdlZlN0ZONmwwSllrSHY5amJrd2pu?=
 =?utf-8?B?bVREL2VZblIxVCt1OStxQUxtQWlRWUMzbjlvMHpDOW9Yd01vNEpZYjZEWHgr?=
 =?utf-8?B?L0M4akorQ0F5ZmJjLzlRSGhsS0c0bDJZc2NZbG40dUN6TWhIYWRGOEU2dGQ2?=
 =?utf-8?B?b0R3TWRta2VSYkFkZ29EbmdxUEcyVmVXYmJsSDRibEF1QytkSVJBdnpYakdB?=
 =?utf-8?B?Ukt5NHdsWnJ5WlRySW9HWmZQMWxXcEpibEVoRGZPUVJnT05KOFc0YjBvODJN?=
 =?utf-8?B?czgzRnU3NHNSaGZVblVKZFVHRFF6VG1sSWlpcERjMnNZbi9lSmVrbHFpdEFK?=
 =?utf-8?B?VkFLNHRMaENUWWh2bXErUzlnYVp5ZHc5dGxiUGpRSzhYMWhXaW5KOVRjYUNR?=
 =?utf-8?Q?Wiscxoal8NHosgXQ34k5xeB0w?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abb502c-1f0b-4db1-f817-08dd1a7834cc
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 06:42:54.3114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DL7lMnAqib8gnq3jbePu9W6+93BerA+YNEyg5tx/SDi5XGlfak2nGjrfLrshjwVmz45mMwkR5LsMgp4H1SBFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6957

Hi Jacopo

Thanks very much for your reply.

On 2024/12/12 00:04, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
> On Thu, Dec 05, 2024 at 05:04:32PM +0800, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> C3ISP_PARAMS is the C3 ISP Parameters format.
>> C3ISP_STATS is the C3 ISP Statistics format.
>>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>>   include/uapi/linux/videodev2.h       | 4 ++++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 0304daa8471d..dae34b1170d7 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1460,6 +1460,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>        case V4L2_META_FMT_RK_ISP1_PARAMS:      descr = "Rockchip ISP1 3A Parameters"; break;
>>        case V4L2_META_FMT_RK_ISP1_STAT_3A:     descr = "Rockchip ISP1 3A Statistics"; break;
>>        case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:  descr = "Rockchip ISP1 Ext 3A Params"; break;
>> +     case V4L2_META_FMT_C3ISP_PARAMS:        descr = "Amlogic C3 ISP Parameters"; break;
>> +     case V4L2_META_FMT_C3ISP_STATS:         descr = "Amlogic C3 ISP Statistics"; break;
>>        case V4L2_PIX_FMT_NV12_8L128:   descr = "NV12 (8x128 Linear)"; break;
>>        case V4L2_PIX_FMT_NV12M_8L128:  descr = "NV12M (8x128 Linear)"; break;
>>        case V4L2_PIX_FMT_NV12_10BE_8L128:      descr = "10-bit NV12 (8x128 Linear, BE)"; break;
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index e7c4dce39007..eda30640a7a3 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -858,6 +858,10 @@ struct v4l2_pix_format {
>>   #define V4L2_META_FMT_RK_ISP1_STAT_3A        v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>>   #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS     v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
>>
>> +/* Vendor specific - used for C3_ISP */
>> +#define V4L2_META_FMT_C3ISP_PARAMS   v4l2_fourcc('C', 'P', 'R', 'M') /* Amlogic C3 ISP Parameters */
>> +#define V4L2_META_FMT_C3ISP_STATS    v4l2_fourcc('C', 'S', 'T', 'S') /* Amlogic C3 ISP Statistics */
> I would have used ('C', '3', 'P', 'M') and ('C', '3', 'S', 'T').
> Matter of tastes I guess, but if you will happen to have a different
> format for, say, C7, this would help keeping them separate.


Will use ('C', '3', 'P', 'M') and ('C', '3', 'S', 'T').

>
> Up to you
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> Thanks
>    j
>
>> +
>>   /* Vendor specific - used for RaspberryPi PiSP */
>>   #define V4L2_META_FMT_RPI_BE_CFG     v4l2_fourcc('R', 'P', 'B', 'C') /* PiSP BE configuration */
>>   #define V4L2_META_FMT_RPI_FE_CFG     v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
>>
>> --
>> 2.47.0
>>
>>
>>

