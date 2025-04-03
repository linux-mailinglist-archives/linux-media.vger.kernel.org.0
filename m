Return-Path: <linux-media+bounces-29278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A39A799D5
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 03:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E05C13B3AEF
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 01:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5871531E9;
	Thu,  3 Apr 2025 01:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="iFwNlG3h"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2123.outbound.protection.outlook.com [40.107.215.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830111EB5B;
	Thu,  3 Apr 2025 01:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743645545; cv=fail; b=eg7FiJJgtUHurrHaQNAafKwHuxs8ap8YAHiSOIRf53IugQ3XhJZ3xHWOU1ghKKh1yYtMoDn4hfDCNLDMpL2Z9ihUp5vEjFuHDKYkyj74cqSjCEvC0cCNn9gLBUaDTmQIt08OATGFpnAnU57XQ/wWT4kTkE1u7j+yk0yS2VOIAXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743645545; c=relaxed/simple;
	bh=jjmqDV9Sfq8NpdYYB+E0jfExf764kuCnDWs+BXq5ld8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XnrpDpOp9ZdKWfBcwHl/56q2OvQUBajU9tYTww9Ix6wXbQMlclWmPWi/+BQ5uI2uxY/HpgCKOjofTaW+SNhnXL+7TQDJ/oawvsvV44E/QuEDx5YOQIcig5qf1aOaQ1SJhhYNJ3ckzmlW/YdcjltiE8PcQ4kR3CF/YfP/V2e7rqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=iFwNlG3h; arc=fail smtp.client-ip=40.107.215.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/Lso9vTLvhxFH+SvunBTBwwaTdnQb0BhVm+x3mcjjEm3jNAhX/ATeSNFdmWj/b6i1/UNe5H7JGQNNnSyqIMxfUxRRffsWPTULIme1J6abdMYsXzFV6sxGnYZbFoO10LlOm0D8sZGs0FFQgPNmwg8aKWgxNEV81NPiEoRb+QjC4Sdn0bY4BlgpWKtiX4SSNrDzMQAlbW30ctkpLgfdWwO34NxsBBWV8AeR3r/3E/Kt6m79hH3Zz7Z+R9XNMwSonxo2T3GUfeaI3dchiaSgB+am4+/qNkntJx+q/kDhZmhK2PVxQbd0CGw2oH4UyAZGAjH/6koMjb1aTZZs1JI8A4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qf9SiD21tyEtCbErx7fpp9ny9WSiO0fweHd0dOf6nP8=;
 b=g8mCAkEbnYU+2GvetGkcLwOKHZDoh3NBvyWuZLryDP2eHIpjdv4hXKW/2lmVIICiYD2E4MLsFGabujO0GU7dcZiM6UqmqoKiOssCOFjeNqSNVgopok+S179RYE+XBvUTW0HZfdRQ3CwO0bt0zfiRC0gA/mkOFG3zd38/9J9Hu/HBw/v6ZlfZJ2TgOTnCMC/55QWA0BhEFt17YAt1zsJcrGUgfgk/sGOYaNsxW3pYeSYeySMOaEnpmjaGNus+DKH6qKnNWTIPA5COOQOmj+h5OfNjfHMHwprGHLZaAcgvBFgKmOXaYFx3Gn2F4WJdBo/Z8SdJ+bDfCemgBvqElwLRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf9SiD21tyEtCbErx7fpp9ny9WSiO0fweHd0dOf6nP8=;
 b=iFwNlG3hyqJK1qTpB/kwLGlxpxS5suqVOvgbdXaE7LZWk+mG/jyjtiNd1uqgWjMm65EhNbZPSbDhwrSmv7+Oo7IWl7GJAdGZSZGjQqMwzUXTCSVkwhWaQJIPsmzn10FWxfpyCa5qzHpjCr4+fKKQI9W9TDVjqcaCmVybQdxME8P0auB87KAXsNnIzbu6+EOxwS8oaUcTCr0ABTTY4BemQB8eRKhE97Tdr61I/cQJwtVC8nBRk0L+ElASxwaG9wpMlC2q9Aq0RQMzeoFmTkwu8GfsMcNXu6C+9yfFLb0iLJGJq+x9xoOz3OvU/iMvpUCmhRnjsVWZB4ZXiTTzaSuvoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYSPR03MB7352.apcprd03.prod.outlook.com (2603:1096:400:432::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Thu, 3 Apr
 2025 01:58:55 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%3]) with mapi id 15.20.8583.036; Thu, 3 Apr 2025
 01:58:55 +0000
Message-ID: <ae77936c-e9a7-432f-89a0-b4b7574690ea@amlogic.com>
Date: Thu, 3 Apr 2025 09:58:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] Amlogic C3 ISP support
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250311-c3isp-v7-0-c3551bed9005@amlogic.com>
 <174361329012.494853.7010939852362232231@ping.linuxembedded.co.uk>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <174361329012.494853.7010939852362232231@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0180.apcprd04.prod.outlook.com
 (2603:1096:4:14::18) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYSPR03MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5d2d45-d4f0-4be3-9032-08dd725316c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlovUFVuVEYvTzhNUlFkT1Z3VmVObkNKdmc1Q1dPbjQxS3oxaElZMzZ2cFIz?=
 =?utf-8?B?ejVOOG0wTjNid0VXUDV0RURDNDBOdlhjSmduV0hoeEdFWFpZdnE1U2pkalpp?=
 =?utf-8?B?YUZ4SFRLUno0a2U0SnVUai8xMlNBNDJSSGo3THBNZW5VK3VxZmx6TUZpNVhj?=
 =?utf-8?B?eDNBYmtXbmF4a2JpRklBUnlTSWQ5M0xUVTA3YnN2ZENrNDNHMkNpU2hpSWV2?=
 =?utf-8?B?eUJUeHkwNTl1NU9uRWNNNkJFMlBzOHhLd1lzckNXZ0UzTlgvLzlmaFh0Q0Jw?=
 =?utf-8?B?akN6QkRVWFhMWi9tbHREVzA2bjVOTWdQb3RPR2txQk5iU1VRNThQeGNMOHdK?=
 =?utf-8?B?SWMyYkRMbGhGNU9CN0ZCNC90SXJFVDhWQkdFSTl6LzJlb1ZYK3M4eFR5MTdl?=
 =?utf-8?B?VmEzREJ4VzZnaHlKZlM5TmQwcFhxb09qbmkzb3lhK3lUM1pnWm8xMEJiUnRZ?=
 =?utf-8?B?aVVvUkY0UG8wWTIyZ0lOQnVzRFNIQnZFVi9uNVphamJrdHhrQWg4WjhLaGtm?=
 =?utf-8?B?ZXRndm9PMUFOWHBRVzJiSm9nRTY0Q0dsZ2MzT1Exb254MVk1S0dOOVNESkhF?=
 =?utf-8?B?Y052WEtxSllvaEFBVkJPdW5HMm5xSGJyemw3VW1iK1lqdURTeTVFcnVBdzJB?=
 =?utf-8?B?VjQzRXNybU1MRnk1emJlQnJwamZFbHJoTVVVdFpIcnJicGQyazBpcFRMUWV4?=
 =?utf-8?B?d3ZUL2RhQ0xyOG9uOFA2cjZpYzZESnVFS2FKRUdKamxYNy84UTNYdEZxaE5k?=
 =?utf-8?B?cVhqWlhLbktmOGc3VlgrWTNCUEVxSWlqSnYxakJIMnBZVllnYmUxZ21iSzZl?=
 =?utf-8?B?bFYwVFQ0TnJZQ1MzRnNNSTRqelZhVzdVTm43UnpXTHRGRVpTSndWa1VDWUZO?=
 =?utf-8?B?bHk1RE1rSVJkN1A5NGhhcU9KOXRyTFJnbitPMno1bksxdDZoOHVYK252c2Mr?=
 =?utf-8?B?VnNZTG8yTWcrbUlVT1IvdDJ6OUNIajdFR2c3NHhTN3hqbUNtbWtuZ1NwcVZF?=
 =?utf-8?B?cGxZSFhHdzBoWkxxakZYNDR2Z2xHaDNmQXhKWmtCQWxqaDJSTm9UTS9SSXhi?=
 =?utf-8?B?UU9wWHRkWjFTRnQ1U3JQbDgwTWd0WG9LVUtjN3pKdUljOU42RDJ6OGZQcjVG?=
 =?utf-8?B?YmNCTjAycUNMRVd0UWJGNDVvZC8rc3NKOTJ4dXBLR2pzNU9Gam8vZjgrbDZn?=
 =?utf-8?B?TUVUQzZvVFl4OGxzU20xSGh1VmZsUWZwOVREQ2FDNFVpVU40RXI3aFoxcTNh?=
 =?utf-8?B?NVVkdHZUcm9nNldwNXF1bmVBNHJtTTN6K3pET3kyd0hVUXpPYzlYekthWWZQ?=
 =?utf-8?B?cExtNDBJM2NYTkp2Mkc4ZnBUaUczM3JPYUJGclRSMGlkS043RzdoSHdaWEhp?=
 =?utf-8?B?OUlVRjdIc0lJbi9pQXlxS0VxcERpSkd2RitxRU5DR3Noc1A4clhwSDMzVGht?=
 =?utf-8?B?M3ZseldXZTN2S1dPdkdaVjdUTjI0N002SVZPVXRyVmpTaWtwT09KajlKQXpI?=
 =?utf-8?B?cHNQSEZkdDh1cDk5VmtpVDFsZ1oza04xSVRPTXBDRy9oa1o2RHpyZGs2S3hy?=
 =?utf-8?B?SnJYY0N5aG9mbXB6aC9vQ29wMEE2ellDMTc0a1NhNEw1c3VQNlJsOUw2UktQ?=
 =?utf-8?B?ci9PMzJiWHg0WElMMUMrOTBXVXRYbDZwb2dxWUlGY0NwdW14OVhHQUFiZnVx?=
 =?utf-8?B?QUdIM0tZUk1PWGJBbTNLaHg1N3hVY1RlZWE0VHlWWjNYWHdHMWpoTndRN1U5?=
 =?utf-8?B?UFFhVE9Wc2ZGK3IzZlYySFQwa3N5TVRoY0FvUnR4REFYdkM4YzVuT3V4OVVk?=
 =?utf-8?B?Y1V6VFpRVUYxSmpLWlQxRVNsTnpXVnJ5ZUt0cTBvalJCT000cWpqc1FPRk9E?=
 =?utf-8?Q?BYWAQoYfA72eQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0JWR0xqQ1crUFhpQk8zNTJiemNtcThlNmJIN1ZpY2RiQWlhZnBhN2lMcTcz?=
 =?utf-8?B?UlZmeEhIbTZnalNVOWVKWGJOWjg2M3RiYWRWZk5WWmMyYzA4cTBVTTd4M08y?=
 =?utf-8?B?Qi9JSW9QaU4wRFY4VUdSeEo2TVRwZmpIKzBVWEI4bndxMW5xaG1ZK3JXbkgy?=
 =?utf-8?B?UFlKcUE2Rk1mQ3J0UUNFYVExNDFJU0dCRWFjSitrdUtaVTFxTERuRjBuVi8x?=
 =?utf-8?B?WHR0WE1BV0JTY3pjaC9GRVVnY2ZhMkNIUGZwUUZTMmc2WWRUTkFGMkp1SmFZ?=
 =?utf-8?B?eDlSbUE3VWwzN2pEdHNBZjJZNzUyVFVNUkpKV2lXRllWOERjV1h4VGhTN3JC?=
 =?utf-8?B?UGNhL3ZLRTI2NVJLNTVtYXRNY043MkFrL3hYUmEvWUZ2NElEYTdDSGxpdFln?=
 =?utf-8?B?SUU1Ym9vTGVOTzlJNWJwL2JjVVBISFYvT0ZRWHNkVXptb1c0VS9FbVlvczlJ?=
 =?utf-8?B?dS93N3pxTVd0aktLSVphQzJFZ0pwaEo3dXpqQmxlSTJ2M3JBeGRGT1k0cWVT?=
 =?utf-8?B?VHpiRVdaSE5SeU9saGJnY0FWalBQTC81RmRGMHk0c0tJRExCWFc5WmhsZjNx?=
 =?utf-8?B?eHp2Q0FqR2VHVkswWGhuWExXeWhvMkFHV29xbElzU0NXK0RWa1NSQmZhWmJ2?=
 =?utf-8?B?eGFzNUN0ekRPRUNzV21VUko0Vk14ZDI0SUxKY2dpcXozeTdmektmRTBFYjhT?=
 =?utf-8?B?enRZczduVUpWL1pOeFFNemtQMGNmcVdmN3k5d3prUGlLRWZ2K2V3SndDTU9a?=
 =?utf-8?B?UEw2TmsyWlYrdnBTQmNJT3BHenduSzJVZUlTVUNjQnY3Q3lPN0dCWEkzamhp?=
 =?utf-8?B?VW1VWUtrK1NKOVBROVozQTNGOW5vV1IvVHNqcWI1cVp6QkQ5VGNGNVN2emRh?=
 =?utf-8?B?cCs2cThJdzhrb3VvZU5KaURCYzI3STRwLzdYcXJ0MnRBMXRaelgzTVl0SEcy?=
 =?utf-8?B?emtBQ3JwbzdjUmxQeThTNkRlYm50dFl5eXlvVXFuQVhicVhlWDBFWXFsYXpR?=
 =?utf-8?B?SVZOK1ZzQW5ncS9acUF5cDVGYXozaXpkak83L3YrUEZ3ZTBJZlplRlloSzZX?=
 =?utf-8?B?ZTBreTFvK3gxcVk5S0d4emtSOVJPUWlqMUNReVUzK0dNT0tvRzRqS2dCcEIv?=
 =?utf-8?B?cFBHRGpjcmFQRlR3QTNQcFNEQVN5WWdJTG9JU0tCbUt5bjEyRkQyMURaZldN?=
 =?utf-8?B?UW44elRKay9zSFdDZUl3eHZyblMrdWp0akdDSERZQXhkRTBxTFlKUjlGQjUw?=
 =?utf-8?B?ZlJWRE4xdTVXUCtZT2RGalRtaEcvMlJxemNoVTBtemRHOGxyckdOSU9hQ3A0?=
 =?utf-8?B?ZGUybUdvVGkwUjBkVExncG9YMFZWbis1THdZTzNuRWxuSzRRaUNvTXI1ZW1S?=
 =?utf-8?B?aEFxTU8zdmR3MmF4Y29TeWxFb0kwM1ZHLzBvS1E3a3VpQ2kwdmUyRzJYY0lv?=
 =?utf-8?B?V00ycHZoSmx6VlF3RTRWb0hqSHNHMDA3aUk3bnNRMEpJZ0V2MDJ3VDBMTlAz?=
 =?utf-8?B?eGNZUGdCUTVVOU5FNC9EUVJPRlRQL2xKZWxzUnZrV01NeGRHNVpGUFdkbTd3?=
 =?utf-8?B?V09oWVBHam9UbHA3Mnh0dnN3YmlnOE5UYXkzL0U5Rlczd3pMSGsySzZwaGgv?=
 =?utf-8?B?Vmw5UjBZUXlEdnlBbWI0NFBUdktPdSswbVQ3dzdtUXdoNXdVczhmbCt5bWYw?=
 =?utf-8?B?UCs5NjJFRjkrdnJwOEJKcXNnLyt5SmFOeVBZY0lVZldQeGl4dXdTQlZoYmFz?=
 =?utf-8?B?R1dXOGFZVUNscXNjTnNHVHhPSDkxbHdLRFU1Nk80RDJLSzBGMmR0aWJia0d6?=
 =?utf-8?B?K0xIRmFDeHRRODQ2bmF3anNmUjRCV3NWcUlxckhpV0p3ZVUwRWh0dUJ4UWdM?=
 =?utf-8?B?cHUySFRZMmIzSGJiOFZzaElxSzRiQjdLVW85TGJOVlhIK0FpZHExVjZRdWh4?=
 =?utf-8?B?SktIQ2ZVUEtzb2hXeTRiU2M2VldYa3MxZUo5M1NJMHJPeXdDbGR3VGgyblJG?=
 =?utf-8?B?UUhWVmhrVWl2dHpSZUFJZmQ5ZG9aMXIvbXkybDc3UzgrekFPSHlLUzhyQXhs?=
 =?utf-8?B?dXozWkdyWWZOdWw3c3I4dVZzNXhCZnN1VWxlWml2dGpMQzVkYzYyTjh4cmFr?=
 =?utf-8?Q?kKz5Ijdh1XafzZxU3hEP1xkWX?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5d2d45-d4f0-4be3-9032-08dd725316c8
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 01:58:55.0685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGYPngrw9uXTA40bs7Xk+ujL/Wt91FAwwdaCHJ0KlCi7dSQsCDGU0Re5W46YcOy4rsKB9jM9wIcmx0nnXcbdng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7352

Hi Kieran

Thanks for your reply.

On 2025/4/3 01:01, Kieran Bingham wrote:
> [ EXTERNAL EMAIL ]
>
> Hi all,
>
> Quoting Keke Li via B4 Relay (2025-03-11 09:11:10)
>> The Amlogic C3 platform integrates an ISP capable of supporting
>> multi-camera, multi-exposure high dynamic range (HDR) imaging with up to
>> 14-bit raw RGB Bayer data.
>>
>> Capturing images on the C3 involves operating the CSI2 receiver and PHY,
>> an adapter layer that integrates the inline processing from the PHY to
>> the ISP, and the ISP driver itself.
>>
>> This implementation consists of several distinct module drivers and
>> is expected to support different platforms in the future.
>>
> There is a corresponding series for libcamera based on this kernel
> support.
>
> I chased to see what's needed to get this ISP driver merged, and saw
> that the CI couldn't apply the patches. Does this need to be resent on a
> specific base to support the CI?
>
> (https://patchwork.linuxtv.org/project/linux-media/list/?series=14706)
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20250311-c3isp-v7-10-c3551bed9005@amlogic.com/
> shows the CI failure : "Failed to cherry-pick patch series "

This patch series is based on "linux-next specific files for 20250307".
I am preparing the next version.

> --
> Kieran
>
>> ---
>> Changes in v7:
>> - Modify the issue of an initialization field being overwritten in
>>    c3-isp-capture.c
>> - Link to v6: https://lore.kernel.org/r/20250227-c3isp-v6-0-f72e19084d0d@amlogic.com
>>
>> Changes in v6:
>> - Drop assigned-clocks and assigned-clock-rates in amlogic,c3-mipi-csi2.yaml
>>    and remove the Review-by tag.
>> - Drop assigned-clocks and assigned-clock-rates in amlogic,c3-mipi-adapter.yaml
>>    and remove the Review-by tag.
>> - Drop assigned-clocks and assigned-clock-rates in amlogic,c3-isp.yaml
>>    and remove the Review-by tag.
>> - Add the reset configuration in c3-mipi-adap.c.
>> - Support RAW format output in ISP driver.
>> - Link to v5: https://lore.kernel.org/r/20241227-c3isp-v5-0-c7124e762ff6@amlogic.com
>>
>> Changes in v5:
>> - Add assigned-clocks and assigned-clock-rates in amlogic,c3-mipi-csi2.yaml,
>>    amlogic,c3-mipi-adapter.yaml and amlogic,c3-isp.yaml.
>> - Remove clock rate configuration in c3-mipi-csi2.c, c3-mipi-adap.c and
>>    c3-isp-dev.c.
>> - Indenting with Tab in register macro definitions for all drivers.
>> - Support V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE in c3-isp-capture.c
>> - Enable and check frame start interruption in c3-isp-dev.c.
>> - Align struct c3_isp_params_xxx to 8 bytes in c3-isp-config.h
>> - Remove c3_mipi_csi_cfg_routing() and c3_mipi_csi_init_routing() in c3-mipi-csi2.c.
>> - Remove c3_mipi_adap_cfg_routing() and c3_mipi_adap_init_routing() in c3-mipi-adap.c.
>> - Remove c3_isp_core_cfg_routing() and c3_isp_core_init_routing() in c3-isp-core.c.
>> - Link to v4: https://lore.kernel.org/r/20241205-c3isp-v4-0-cb1868be0105@amlogic.com
>>
>> Changes in v4:
>> - Create c3 directory in drivers/media/platform/amlogic/
>> - Move isp, mipi-adapter and mipi-csi2 drivers to c3 directory.
>> - Create amlogic directory in include/uapi/linux/media/
>> - Move c3-isp-config.h to include/uapi/linux/media/amlogic
>> - Add .enable_streams() and .disable_streams() interface
>>    in c3-isp-resizer.c.
>> - Remove .set_routing() interface in c3-isp-core.c,
>>    c3-mipi-adap.c and c3-mipi-csi2.c.
>> - Update the parameter comments in c3-isp-config.h
>> - Update the bit macros of register in c3-isp-regs.h, c3-mipi-adap.c
>>    and c3-mipi-csi2.c.
>> - Move parameters validation to .buf_prepare() in c3-isp-params.c.
>> - Add c3_isp_core_queue_eof() in c3-isp-core.c
>> - Improve the c3 ISP documentation in c3-isp.rst
>> - Update the v4l2-compliance report.
>> - Link to v3: https://lore.kernel.org/r/20240918-c3isp-v3-0-f774a39e6774@amlogic.com
>>
>> Changes in v3:
>> - Moved change log here.
>> - Use "port" instead of "ports" in amogic,c3-isp.yaml.
>> - Reworked c3_xxx_vb2_queue_setup() to meet the request for larger size.
>> - Reworked c3_mipi_csi_write(), c3_mipi_csi_update_bits() and
>>    c3_mipi_csi_update_bits() to return void.
>> - Reworked c3_mipi_xxx_set_fmt() to return v4l2_subdev_get_fmt()
>>    in second "if" segment and delete the first "if" segment.
>> - Switched back to .remove() in struct platform_driver c3_xxx_driver.
>> - Adjusted from three lines to two lines in some places
>>    where registers are changed.
>> - Rename the title of the drivers in MAINTAINERS file.
>> - Update the v4l2-compliance report.
>> - Link to v2: https://lore.kernel.org/r/20240909-c3isp-v2-0-3c866a1cea56@amlogic.com
>>
>> Changes in v2:
>> - Drop "minItems" and some blank lines in amlogic,c3-xxx.yaml.
>> - Rename items of the reg-names in amlogic,c3-mipi-csi2.yaml and
>>    amlogic,c3-mipi-adapter.yaml.
>> - Replace dev_err and return with dev_err_probe in probe function.
>> - Change clock[] to clocks[] in struct c3_xxx_info.
>> - Change clock_rate[] to clock_rates[] in struct c3_xxx_info.
>> - Change clock[] to clks[] in struct xxx_device.
>> - Link to v1: https://lore.kernel.org/r/20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com
>>
>> The rest of this message is the v4l2-compliance report for the driver.
>> The v4l2-compliance reports 4 failures and 2 warnings. The 2 warnings
>> are from imx290 driver(drivers/media/i2c/imx290.c). The 4 failures are
>> because height and width are set to 0 for MEDIA_BUS_FMT_METADATA_FIXED
>> in isp-core subdev, but this is a document requiement.
>>
>> v4l2-compliance 1.29.0-5246, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: 201ccf743cde 2024-09-06 07:16:29
>>
>> Compliance test for c3-isp device /dev/media0:
>>
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>>
>> Required ioctls:
>>          test MEDIA_IOC_DEVICE_INFO: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/media0 open: OK
>>          test MEDIA_IOC_DEVICE_INFO: OK
>>          test for unlimited opens: OK
>>
>> Media Controller ioctls:
>>          test MEDIA_IOC_G_TOPOLOGY: OK
>>          Entities: 12 Interfaces: 12 Pads: 22 Links: 23
>>          test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>>          test MEDIA_IOC_SETUP_LINK: OK
>>
>> Total for c3-isp device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/video0:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x84201000
>>                  Video Capture Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04201000
>>                  Video Capture Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x03000018
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000016 (22)
>>          Name             : c3-isp-cap0
>>          Function         : V4L2 I/O
>>          Pad 0x01000017   : 0: Sink
>>            Link 0x0200002f: from remote pad 0x100000a of entity 'c3-isp-resizer0' (Video Scaler): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video0 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK
>>
>> Total for c3-isp device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/video1:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x84201000
>>                  Video Capture Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04201000
>>                  Video Capture Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x0300001c
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x0000001a (26)
>>          Name             : c3-isp-cap1
>>          Function         : V4L2 I/O
>>          Pad 0x0100001b   : 0: Sink
>>            Link 0x02000033: from remote pad 0x100000d of entity 'c3-isp-resizer1' (Video Scaler): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video1 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK
>>
>> Total for c3-isp device /dev/video1: 49, Succeeded: 49, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/video2:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x84201000
>>                  Video Capture Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04201000
>>                  Video Capture Multiplanar
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x03000025
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000023 (35)
>>          Name             : c3-isp-cap2
>>          Function         : V4L2 I/O
>>          Pad 0x01000024   : 0: Sink
>>            Link 0x02000037: from remote pad 0x1000010 of entity 'c3-isp-resizer2' (Video Scaler): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video2 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK
>>
>> Total for c3-isp device /dev/video2: 49, Succeeded: 49, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/video3:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x84a00000
>>                  Metadata Capture
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04a00000
>>                  Metadata Capture
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x03000029
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000027 (39)
>>          Name             : c3-isp-stats
>>          Function         : V4L2 I/O
>>          Pad 0x01000028   : 0: Sink
>>            Link 0x0200003b: from remote pad 0x1000004 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video3 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK
>>
>> Total for c3-isp device /dev/video3: 49, Succeeded: 49, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/video4:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x8c200000
>>                  Metadata Output
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x0c200000
>>                  Metadata Output
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x0300002d
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x0000002b (43)
>>          Name             : c3-isp-params
>>          Function         : V4L2 I/O
>>          Pad 0x0100002c   : 0: Source
>>            Link 0x0200003d: to remote pad 0x1000003 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video4 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK
>>
>> Total for c3-isp device /dev/video4: 49, Succeeded: 49, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/v4l-subdev0:
>>
>> Driver Info:
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x00000000
>>          Client Capabilities: 0x0000000000000002
>> interval-uses-which Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x03000043
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x00000001 (1)
>>          Name             : c3-isp-core
>>          Function         : Video Pixel Formatter
>>          Pad 0x01000002   : 0: Sink
>>            Link 0x02000014: from remote pad 0x1000013 of entity 'c3-mipi-adapter' (Video Interface Bridge): Data, Enabled, Immutable
>>          Pad 0x01000003   : 1: Sink
>>            Link 0x0200003d: from remote pad 0x100002c of entity 'c3-isp-params' (V4L2 I/O): Data, Enabled
>>          Pad 0x01000004   : 2: Source
>>            Link 0x0200003b: to remote pad 0x1000028 of entity 'c3-isp-stats' (V4L2 I/O): Data, Enabled
>>          Pad 0x01000005   : 3: Source
>>            Link 0x02000031: to remote pad 0x1000009 of entity 'c3-isp-resizer0' (Video Scaler): Data, Enabled
>>          Pad 0x01000006   : 4: Source
>>            Link 0x02000035: to remote pad 0x100000c of entity 'c3-isp-resizer1' (Video Scaler): Data, Enabled
>>          Pad 0x01000007   : 5: Source
>>            Link 0x02000039: to remote pad 0x100000f of entity 'c3-isp-resizer2' (Video Scaler): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev0 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 1):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
>>          test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
>>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 2):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
>>          test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
>>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 3):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 4):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 5):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev0: 89, Succeeded: 85, Failed: 4, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/v4l-subdev1:
>>
>> Driver Info:
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x00000000
>>          Client Capabilities: 0x0000000000000002
>> interval-uses-which Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x03000045
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x00000008 (8)
>>          Name             : c3-isp-resizer0
>>          Function         : Video Scaler
>>          Pad 0x01000009   : 0: Sink
>>            Link 0x02000031: from remote pad 0x1000005 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled
>>          Pad 0x0100000a   : 1: Source
>>            Link 0x0200002f: to remote pad 0x1000017 of entity 'c3-isp-cap0' (V4L2 I/O): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev1 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 1):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev1: 61, Succeeded: 61, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/v4l-subdev2:
>>
>> Driver Info:
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x00000000
>>          Client Capabilities: 0x0000000000000002
>> interval-uses-which Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x03000047
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x0000000b (11)
>>          Name             : c3-isp-resizer1
>>          Function         : Video Scaler
>>          Pad 0x0100000c   : 0: Sink
>>            Link 0x02000035: from remote pad 0x1000006 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled
>>          Pad 0x0100000d   : 1: Source
>>            Link 0x02000033: to remote pad 0x100001b of entity 'c3-isp-cap1' (V4L2 I/O): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev2 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 1):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev2: 61, Succeeded: 61, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/v4l-subdev3:
>>
>> Driver Info:
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x00000000
>>          Client Capabilities: 0x0000000000000002
>> interval-uses-which Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x03000049
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x0000000e (14)
>>          Name             : c3-isp-resizer2
>>          Function         : Video Scaler
>>          Pad 0x0100000f   : 0: Sink
>>            Link 0x02000039: from remote pad 0x1000007 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled
>>          Pad 0x01000010   : 1: Source
>>            Link 0x02000037: to remote pad 0x1000024 of entity 'c3-isp-cap2' (V4L2 I/O): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev3 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 1):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev3: 61, Succeeded: 61, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/v4l-subdev4:
>>
>> Driver Info:
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x00000000
>>          Client Capabilities: 0x0000000000000002
>> interval-uses-which Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x0300004b
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x00000011 (17)
>>          Name             : c3-mipi-adapter
>>          Function         : Video Interface Bridge
>>          Pad 0x01000012   : 0: Sink
>>            Link 0x02000021: from remote pad 0x1000020 of entity 'c3-mipi-csi2' (Video Interface Bridge): Data, Enabled, Immutable
>>          Pad 0x01000013   : 1: Source
>>            Link 0x02000014: to remote pad 0x1000002 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev4 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 1):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev4: 61, Succeeded: 61, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/v4l-subdev5:
>>
>> Driver Info:
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x00000000
>>          Client Capabilities: 0x0000000000000002
>> interval-uses-which Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x0300004d
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x0000001e (30)
>>          Name             : c3-mipi-csi2
>>          Function         : Video Interface Bridge
>>          Pad 0x0100001f   : 0: Sink
>>            Link 0x02000041: from remote pad 0x1000040 of entity 'imx290 2-001a' (Camera Sensor): Data, Enabled, Immutable
>>          Pad 0x01000020   : 1: Source
>>            Link 0x02000021: to remote pad 0x1000012 of entity 'c3-mipi-adapter' (Video Interface Bridge): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev5 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 1):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev5: 61, Succeeded: 61, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for c3-isp device /dev/v4l-subdev6:
>>
>> Driver Info:
>>          Driver version   : 6.14.0
>>          Capabilities     : 0x00000000
>>          Client Capabilities: 0x0000000000000002
>> interval-uses-which Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x0300004f
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x0000003f (63)
>>          Name             : imx290 2-001a
>>          Function         : Camera Sensor
>>          Pad 0x01000040   : 0: Source
>>            Link 0x02000041: to remote pad 0x100001f of entity 'c3-mipi-csi2' (Video Interface Bridge): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev6 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 0):
>>          Try Stream 0
>>          test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>                  warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          Active Stream 0
>>          test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>                  warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>          test VIDIOC_QUERYCTRL: OK
>>          test VIDIOC_G/S_CTRL: OK
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 12 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev6: 54, Succeeded: 54, Failed: 0, Warnings: 2
>>
>> Grand Total for c3-isp device /dev/media0: 701, Succeeded: 697, Failed: 4, Warnings: 2
>>
>> To: Mauro Carvalho Chehab <mchehab@kernel.org>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> Cc: linux-media@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: kieran.bingham@ideasonboard.com
>> Cc: laurent.pinchart@ideasonboard.com
>> Cc: dan.scally@ideasonboard.com
>> Cc: jacopo.mondi@ideasonboard.com
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>>
>> ---
>> Keke Li (10):
>>        dt-bindings: media: Add amlogic,c3-mipi-csi2.yaml
>>        media: platform: Add C3 MIPI CSI-2 driver
>>        dt-bindings: media: Add amlogic,c3-mipi-adapter.yaml
>>        media: platform: Add C3 MIPI adapter driver
>>        dt-bindings: media: Add amlogic,c3-isp.yaml
>>        media: Add C3ISP_PARAMS and C3ISP_STATS meta formats
>>        media: uapi: Add stats info and parameters buffer for C3 ISP
>>        media: platform: Add C3 ISP driver
>>        Documentation: media: add documentation file metafmt-c3-isp.rst
>>        Documentation: media: add documentation file c3-isp.rst
>>
>>   Documentation/admin-guide/media/c3-isp.dot         |   26 +
>>   Documentation/admin-guide/media/c3-isp.rst         |  109 +++
>>   Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
>>   .../devicetree/bindings/media/amlogic,c3-isp.yaml  |   88 ++
>>   .../bindings/media/amlogic,c3-mipi-adapter.yaml    |  111 +++
>>   .../bindings/media/amlogic,c3-mipi-csi2.yaml       |  127 +++
>>   .../userspace-api/media/v4l/meta-formats.rst       |    1 +
>>   .../userspace-api/media/v4l/metafmt-c3-isp.rst     |   86 ++
>>   MAINTAINERS                                        |   25 +
>>   drivers/media/platform/amlogic/Kconfig             |    1 +
>>   drivers/media/platform/amlogic/Makefile            |    2 +
>>   drivers/media/platform/amlogic/c3/Kconfig          |    5 +
>>   drivers/media/platform/amlogic/c3/Makefile         |    5 +
>>   drivers/media/platform/amlogic/c3/isp/Kconfig      |   18 +
>>   drivers/media/platform/amlogic/c3/isp/Makefile     |   10 +
>>   .../media/platform/amlogic/c3/isp/c3-isp-capture.c |  806 ++++++++++++++++
>>   .../media/platform/amlogic/c3/isp/c3-isp-common.h  |  340 +++++++
>>   .../media/platform/amlogic/c3/isp/c3-isp-core.c    |  641 +++++++++++++
>>   drivers/media/platform/amlogic/c3/isp/c3-isp-dev.c |  421 ++++++++
>>   .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 1010 ++++++++++++++++++++
>>   .../media/platform/amlogic/c3/isp/c3-isp-regs.h    |  618 ++++++++++++
>>   .../media/platform/amlogic/c3/isp/c3-isp-resizer.c |  892 +++++++++++++++++
>>   .../media/platform/amlogic/c3/isp/c3-isp-stats.c   |  328 +++++++
>>   .../media/platform/amlogic/c3/mipi-adapter/Kconfig |   16 +
>>   .../platform/amlogic/c3/mipi-adapter/Makefile      |    3 +
>>   .../amlogic/c3/mipi-adapter/c3-mipi-adap.c         |  842 ++++++++++++++++
>>   .../media/platform/amlogic/c3/mipi-csi2/Kconfig    |   16 +
>>   .../media/platform/amlogic/c3/mipi-csi2/Makefile   |    3 +
>>   .../platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c   |  827 ++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
>>   include/uapi/linux/media/amlogic/c3-isp-config.h   |  564 +++++++++++
>>   include/uapi/linux/videodev2.h                     |    4 +
>>   32 files changed, 7948 insertions(+)
>> ---
>> base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
>> change-id: 20240903-c3isp-7cfe70bb2583
>>
>> Best regards,
>> --
>> Keke Li <keke.li@amlogic.com>
>>
>>

