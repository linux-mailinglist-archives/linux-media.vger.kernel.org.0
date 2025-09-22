Return-Path: <linux-media+bounces-42915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52824B8FB91
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 11:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E25F189A1E3
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 09:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DDE28C5A3;
	Mon, 22 Sep 2025 09:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sZZ/JxEb"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010062.outbound.protection.outlook.com [40.93.198.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3257F28AAE6;
	Mon, 22 Sep 2025 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758532772; cv=fail; b=NGSimqpEgeHBnUeH3NVuxc21gvUTlqcA6KJPIzqiuMvYR5l6XtLg7NejS2EdmB9zkeC4rlKE7CuWAtCKPZQhhmVFiL86e4kn0L/4nTps7a5yK8Rz/LMUVJJDpba/1DCJdlUMQleivTFgRXlmdDPx7auXYOECq5mMo4q0oFxZdrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758532772; c=relaxed/simple;
	bh=2OcOgJRad3tHrUTXe33XZuI99F1lo04N62rcp+IV6+w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IwPiA6fYMm3dyShe1TpFcKi5zq7gB4HKceQXBg3jZCS2y6WZQ6nF7kCVMPkOJ2NpC9EdOxDz14fwegd/gK6TLE1Zrhs7TscUB3uoa3aoMAQg6240mvgeUd2BoV9Pt8OUWmSOsyA7q6SO9HSwAk2iMH1x4H9Vw7jYNZVRt4kEdFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sZZ/JxEb; arc=fail smtp.client-ip=40.93.198.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8vfDVsvderMX3byogVeuElklvnwFak1m0tvB2dRatxXz/43O9dXycd9kS7ij+Us0bX4zFWmAlDfwXeuByv8ueMkB1O17H9633ksz/+jz6wsKyEo8auX3alG/OPo+LrFzfNXCNig7nTZxWI697KFft/si1fBOcswoW5NldUap178MV+qnqxpda1xd8oGn1G3uKxjGzqqEME7jEZfCzdkZ05Yua2NEGgEp4Gl+NC1MdR6fMyCI668gv511Fw6K0Xo0jNlejk8KwKYfbU2lX1Pg1TR8fK0vz/Rho/FCd6eFx63wCJt3VqMJV2u9dLldevQ5pY8XJGGVM1+VF2ZURIiDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CF/zzeNYTPKainw/dLS3YPMoBXJ7H/dTp90gtWESRhk=;
 b=Gu0DgE6jbz6cFxGAsPGa4hPPLycupOwf0oqFMeRoqPlwQSllk7UAZm8XJpbny9j6O2yCuDSPSS1pU15pOJexM3po66wyUsz+YBODAuWLlxU1mOjrWKrcBWOzIEy99oFZngg3LvlcLS090yYzvXvTB92M6bXhmEC60JVuMX4U5+EQp5GjMK7ZJ8qmTk98ZtfHlJcisztGkVPNkUEwT1UmyxvhHh3r7l2M+4Q5FMTUjwBrOabJ2NO2/xzggkMivFZI7x8zAmdHid6Ea6r0kV6YMAp8eC4IqE3zTrpB9Z2YaIhNWWndgpGQflzc+nlVXRzlxdq+BpZ/2RL7cLgk/EwOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CF/zzeNYTPKainw/dLS3YPMoBXJ7H/dTp90gtWESRhk=;
 b=sZZ/JxEbbFHzK4r3uDuNBxt5iaQ6P66r1TgPd6qbJjK6Vjkb4jvOtx7Maq0ykrUJIWOmWrKduNpTV42OfzxjyaVIcacvpMHOqWbYP9oLIEJdv1HliBQGbg5utsRLA34RPJgsIp5i1VB+xNmMAd2m0chwblbjPu8dt0qC9TN/HxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by BL4PR12MB9533.namprd12.prod.outlook.com (2603:10b6:208:58f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 09:19:26 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 09:19:26 +0000
Message-ID: <081bc6ed-b1ef-41f2-84dc-a0904c4ed82e@amd.com>
Date: Mon, 22 Sep 2025 17:19:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] Documentation: add documentation of AMD isp 4
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
 anson.tsao@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-9-Bin.Du@amd.com>
 <20250805113719.GF24627@pendragon.ideasonboard.com>
 <e614b565-81e0-49c0-93dc-af1936462728@amd.com>
 <aKXC0Q4IiKmkjoSH@kekkonen.localdomain>
 <63949b3b-ca2d-42aa-bc8d-43f2952d307a@amd.com>
 <aNDrhlLL3UpfyBpV@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aNDrhlLL3UpfyBpV@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0135.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::19) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|BL4PR12MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f1e6d9-fc9a-480b-39ca-08ddf9b92001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWdWMDl6SFBaYzlXcjBUdlYwTUduVnNxc0xqNDJ6VXZtVTNZZHd6QlI3SHda?=
 =?utf-8?B?S1g3Qk40R3llZmV5NzNMNTlzQmNZdjN4UWY3enZZREQ4Ylo0R2RWYS9QWTBy?=
 =?utf-8?B?OHBETFNCVWpaQ2xEcDkvZm1xeDdrdW1yL2tRUk9hci9JaUx4QjlwcDEzRUxv?=
 =?utf-8?B?TWUwaitJd2FrcFVPcUU2SENXNVF4bGZNUDB3UVExOFF4M0creDhlNG90RVNH?=
 =?utf-8?B?VG9WNHlhQTMxbGwzcVlNakpGYVVFamNEaUU5b3EwVCtNbUVOT09Gb01FeE5Z?=
 =?utf-8?B?SVlWOXhsTkpXeEVTZGcyRHMrc0Y4a3NSZ2JBSmNseXNYbC9sUjZHOFRKcUkr?=
 =?utf-8?B?YkwydVFKM012QWw5bktpNFVMLzBwd0NvT1lPUTdMck11KzUvNzRNOE1mTXM3?=
 =?utf-8?B?anZHRTUrN2NQejFWeWZCcVNhYkRXd0dsdTBCNjVSQ1RvWWJMeHZNSEFWY0Zz?=
 =?utf-8?B?LzFXZWxBOVhER2Z6NHdnNVRjUXdUQmpiTFJYN0NrKzl5VW9iVXhmdmdQQkVo?=
 =?utf-8?B?ZitRZXYrc0xxUXdmaWdOZVlFZlQzOWZnVUt2U3JsUjM0YnNmSElvZ1BnaXJx?=
 =?utf-8?B?bXRPM1JUY1JySkRLaGFjTHVZSmhDVzFmSmdxQVZtWjVPd1RmbXRNME1sY2U3?=
 =?utf-8?B?eEZaS1VaeWFRa1dSSmF1V1Q3UG1QbXYzTEdOemp1Sjh2NmF4ek52SDE4U29n?=
 =?utf-8?B?UXRrc2dJMk9LNjcxRFBhS1p1OHhjWXFDUnIrQlhnUFNCYnZWMTFXUU51OWw5?=
 =?utf-8?B?MzZNZllLbGd3R0NCc3dpM1RDbUgwV0pRWEppc3NjV2VvejJtSkNKUWI1MldM?=
 =?utf-8?B?ejVKeWNCYllzdGg5MkFGbXdveGhrdnBFYWU4ZTMzMm5ISGZIVk9wWm9Fbmwy?=
 =?utf-8?B?cGR0dFV0bzlNVmFPNDE0WXpZdEdJelg4c1VYWVdmR0Z5QzVRQll3MEJ0UExD?=
 =?utf-8?B?Z1ZtTFBLNnNXaHdCTTdSYjdYM0NDdWJwNlNwSmZDbGEvQ1JSOXlJbm1EcUVa?=
 =?utf-8?B?Ky9rTVFYbFF5Zm1QNFZkN2gzbEVuWmpTS1BEbmlQV1RYWjhMa3h0Z3RZaVpz?=
 =?utf-8?B?T2lVdHR4VG5qY0RqS0puVWRKRE5mUkI2QWxDRWsveGh3aUtNUFgyOU5GeURU?=
 =?utf-8?B?WEJvSktFSmRBbkZ4Y3VtTnBrb0hWbk5lZzNVT0FhL3d0Y3p1WkF2WjRrUnZB?=
 =?utf-8?B?ekxianpNZ2d1OXNZaDBvQXBwTHhXTUdXQnhYemFwaUVDbkVERVZYcDNkWTFl?=
 =?utf-8?B?NkE0SkZlSjh4SHZIVm1tcHE1M2ZJZWJobEdrNFBOVUFXejlaaEtaMnRLM0NM?=
 =?utf-8?B?SXNoSTBVV1ZSSVUvS1JDT0czMVBvbHVuRFlPMVl4cEJFS1V6RFh3Y2w4cVNG?=
 =?utf-8?B?MEZ4a1dCeFdWcml0VkZuZ24zdmR1QVNJZkNnSDdDWnhLQnEzWG5POHFnUHk1?=
 =?utf-8?B?QWxMR2R2V0ZoU2pXSUtvUDlWTlB3QzZ3Y0h0ZjlNN0Jwb3RScUVWdFZYN2lU?=
 =?utf-8?B?d3NqVWpaUTdsT0tGNGEzRjZmZFJBaW9ON1VhbkpvMU02NVZiazk5NEYwVE41?=
 =?utf-8?B?RVJMNlBFRTcralNXZ2tKZjJQNTJVNnFlT3h4TmZqZlpFSC91S2hBRHRNSzNU?=
 =?utf-8?B?Uk1rRVAvMUNlRlVFQjRqcGREbXVidWFHMXhrdWJrUUhrV1NGdDF4VmRDUmMz?=
 =?utf-8?B?OHZ2Szg4QlZ0d1lmZ25wSnNkVTZaWnA1V25DSU5TZ0NPKzE1SS9IeXI1NnR2?=
 =?utf-8?B?c2FaRTNrNnAzSGVhaDZhQ0lNclZMVVRzR2xpbGxIRXMxUEtJSlBDNWFpbXkv?=
 =?utf-8?B?Ny9oSk0wVjhUdldIUjhka1ByQmhnNUZKbXFUVFI1bXl3YTlYRkE1dFhQR09v?=
 =?utf-8?B?YlkxUUNZVEp6ZkFJR25YVmZVMEVMUkVPaWFmV1REcjRHMGdLd0N2UjExTkJJ?=
 =?utf-8?Q?9YNs8Fj35nc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTBNUmNEbWp6QkNaZFZGK3ZiYjFGc2l2WSttdFRmWTdTM0R3T2F4NmhVRHdX?=
 =?utf-8?B?K1Uycm1QTmtLRVBRSTNScERpa1pOK2hWM3ZBUnlnNVZ2WFVsOVc0OGNZM3R4?=
 =?utf-8?B?NDBiQlZyNFVJMW02MjFlVnFQalZMZEtzVWp2SUpXWlpoNlpVdTBkamwybkpz?=
 =?utf-8?B?VTZjWUl4U25GVFk4QnMxcHFpNkVyQ090WDdkNG4vTC9jZFRUbUNXeWMwanVn?=
 =?utf-8?B?WUtabG1FSEdVRC9WS2FJc1NvMFZhTTdFL2NZOWpxODFxQVhtamxrU0Rocmpo?=
 =?utf-8?B?YTZadlg3eDloQk4vYjdFa0hFU2RnL2VEc1Rmb1RqZkc3aXg4Y3dRTE0rQ0tl?=
 =?utf-8?B?Qi9mdjdRTTdkNVR4K1FxU1Ryem9VeUtVbDZyUWh2Qi8razNrVytabnFOelJO?=
 =?utf-8?B?S284aEw5L2Y5WTdLOXNXNExWdWJ2VGRtVzJSZ29jc2lZYlR3OVA0amxSWDJn?=
 =?utf-8?B?aVZZS09DM1g1ZnErU3k5TVloZGNSb2NORTdVNDdLVml5c3JtWUFKb2I5V0lH?=
 =?utf-8?B?TDFUSXpmTkhwb29LVk1KWmtGWGlMeW1iU0kwenVQMUhZR3paOCtOOFg4SkZN?=
 =?utf-8?B?d2FLM2MvaXZyYTRMZHJQTkF4YlZta1VNVUtBajJ4SGIzUHdNSHJwd0Z0TWlZ?=
 =?utf-8?B?N0p5TVFsTDBtQ0NoVStOME1nSS9VWXI1VkZDL3JHalMvdVljWDV4WUs1L0NE?=
 =?utf-8?B?eUd4ZTdSK0pNUkdLTDJ6RENCSWp6dzFnaENzU0VOZ21JUGJwVEl3WU8vRnBC?=
 =?utf-8?B?aHF6LzAwVGxZNWRuUUVSeUw5UzVnVWlTTUdNUkNySk1zNU5BQUxaNnVyckdD?=
 =?utf-8?B?c1E5RTBMRlQ1UkZ2Q0NjS0RHSTR1djNVbEl3YmdBNVJ4Y2pGeHJSV3RjTDZP?=
 =?utf-8?B?NmNyWjNUS1Fva3ZGbmQ0WmpRV3N5a0pmWTdNU0lIS0FVeG9Nbmxndm9adnA1?=
 =?utf-8?B?cUtOT05rTmhYeUlGOG9EcGRlYmJ1SjMzcmFLUlNpSVhneTMvYm9WalU3NTVM?=
 =?utf-8?B?WnFIdFlabVUvZEVMNGJpOFBTVlgvUlU1ZHZnM3Z5R0JDZ05sRytjUUZjZm4z?=
 =?utf-8?B?NzBSSUR1eVlFcWVab1NON3J1aUJScUw4a1Z6eE5haHpQdzdUMmhoUE5aaDM5?=
 =?utf-8?B?bW9aWExYWXAwejZrYnBVZWtCU05vOWJXWGtGbXI2djZaNXUrSEIwWklnV2I1?=
 =?utf-8?B?UG5LaW9FbUIxNVRMME5FUUtIaE8vZHB6ak1EWkk4WXp1MnErVVRDR1hETEg1?=
 =?utf-8?B?ZEFCYjdMb2pMSDhSd0NjOHVzT0ozTml0UWJ0TUpObkV2QjRqRFpBZitZamNW?=
 =?utf-8?B?RXNFQzdSeThycUdPOHJHcnVDcWlUa3hjQlFML2xGa2Zjb0pwTVRjem1tY2Ri?=
 =?utf-8?B?bVRGd0d5bVltSnJHUGVPKzF1Q2ZvUmFoU0RDcnJqMHc0TG9kK2ZUbXhPcE9K?=
 =?utf-8?B?L3hUakhmR0xmTDZBQVJybDdRWGZrellxZGYvMlBGakZDVE5NMmM5cXpMRjNC?=
 =?utf-8?B?N2U3L0JvUitCQ1lrQWtLOGRHeGE2ZXoxWDVINUJLVkcvMTkvWjJrV0lPUkVI?=
 =?utf-8?B?ZkNJWGpEU3hiQXFxUi9NTkNPSlkremdsTjFYcXNtMVFyeFJPZTIxbEMzamZj?=
 =?utf-8?B?M1pFWFl4d0R2Wi85V3BQalVJOHIxaklEaE5HRkZHUFRSNmZ4QWJlTjlibWJS?=
 =?utf-8?B?Wk1vT1VVd2x6NnBUcUxOdEp6Szc4Mlp1RWN1VkZKTEkyeGVIMEh3QkZ0aG5a?=
 =?utf-8?B?MThjNW8yZUh0aVB1cmJVZkw0U28xVDN1Y3JlRndxTTVQSEtINlBmdmxNRTVW?=
 =?utf-8?B?cjNHbCtJUkJJMUR1cVFnT2JXNmRTenlOU3N5dHdTbUNhcnk2cU5TTXpqZmsr?=
 =?utf-8?B?TWJXMTJiQ2FFSXh4Q2FQUHF3a2lFSm8rUUdKQkFwckJyczJzYnN3ZVdhczZ2?=
 =?utf-8?B?OGszdytOd1ZGNksrOVNHZU5rQXJTWDhDRHNvYnp4YUppYy8veXR4NG43Rk5O?=
 =?utf-8?B?QlZuOE01N3duOVpSRmpCcW5yaVVoNlV0OU93bkNEcy9peHRnRG4vS2tYb21R?=
 =?utf-8?B?allEL0RIakRxUzdMT3ZyM1hHV1kvR3lFeEpCN1BsY3JiOXMyZVlmaGUwSmFq?=
 =?utf-8?Q?kKbI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f1e6d9-fc9a-480b-39ca-08ddf9b92001
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:19:26.5017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkSKgJ25a5UEZnxne6HjIdB2RzNIGaZif+lj2aRtpQ6fVnmoSTbwntHoJ2wpZ753
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9533

Many thanks Sakari for the update. All clear on my end — feel free to 
take the time you need.

On 9/22/2025 2:24 PM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Fri, Aug 22, 2025 at 10:20:01AM +0800, Du, Bin wrote:
>> Many thanks Sakari Ailus for your deep insight
>>
>> On 8/20/2025 8:42 PM, Sakari Ailus wrote:
>>> Hi Bin,
>>>
>>> On Tue, Aug 12, 2025 at 09:36:04AM +0800, Du, Bin wrote:
>>>> Many thanks Laurent Pinchart for the review.
>>>>
>>>> On 8/5/2025 7:37 PM, Laurent Pinchart wrote:
>>>>> On Wed, Jun 18, 2025 at 05:19:59PM +0800, Bin Du wrote:
>>>>>> Add documentation for AMD isp 4 and describe the main components
>>>>>>
>>>>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>>>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>>>> ---
>>>>>>     Documentation/admin-guide/media/amdisp4-1.rst | 64 +++++++++++++++++++
>>>>>>     Documentation/admin-guide/media/amdisp4.dot   |  8 +++
>>>>>>     MAINTAINERS                                   |  2 +
>>>>>>     3 files changed, 74 insertions(+)
>>>>>>     create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>>>>>     create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>>>>>
>>>>>> diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
>>>>>> new file mode 100644
>>>>>> index 000000000000..417b15af689a
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/admin-guide/media/amdisp4-1.rst
>>>>>> @@ -0,0 +1,64 @@
>>>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>>>> +
>>>>>> +.. include:: <isonum.txt>
>>>>>> +
>>>>>> +====================================
>>>>>> +AMD Image Signal Processor (amdisp4)
>>>>>> +====================================
>>>>>> +
>>>>>> +Introduction
>>>>>> +============
>>>>>> +
>>>>>> +This file documents the driver for the AMD ISP4 that is part of
>>>>>> +AMD Ryzen AI Max 385 SoC.
>>>>>> +
>>>>>> +The driver is located under drivers/media/platform/amd/isp4 and uses
>>>>>> +the Media-Controller API.
>>>>>> +
>>>>>> +Topology
>>>>>> +========
>>>>>> +
>>>>>> +.. _amdisp4_topology_graph:
>>>>>> +
>>>>>> +.. kernel-figure:: amdisp4.dot
>>>>>> +     :alt:   Diagram of the media pipeline topology
>>>>>> +     :align: center
>>>>>> +
>>>>>> +
>>>>>> +
>>>>>> +The driver has 1 sub-device:
>>>>>> +
>>>>>> +- isp: used to resize and process bayer raw frames in to yuv.
>>>>>> +
>>>>>> +The driver has 1 video device:
>>>>>> +
>>>>>> +- <capture video device: capture device for retrieving images.
>>>>>> +
>>>>>> +
>>>>>> +  - ISP4 Image Signal Processing Subdevice Node
>>>>>> +-----------------------------------------------
>>>>>> +
>>>>>> +The isp4 is represented as a single V4L2 subdev, the sub-device does not
>>>>>> +provide interface to the user space.
>>>>>
>>>>> Doesn't it ? The driver sets the V4L2_SUBDEV_FL_HAS_DEVNODE flag for the
>>>>> subdev, and calls v4l2_device_register_subdev_nodes().
>>>>>
>>>>
>>>> We have exported subdev device to user space during the testing with
>>>> libcamera sample pipeline.
>>>>
>>>>> As far as I understand, the camera is exposed by the firmware with a
>>>>> webcam-like interface. We need to better understand your plans with this
>>>>> driver. If everything is handled by the firmware, why are the sensor and
>>>>> subdev exposed to userspace ? Why can't you expose a single video
>>>>> capture device, with a media device, and handle everything behind the
>>>>> scene ? I assume there may be more features coming later. Please
>>>>> document the plan, we can't provide feedback on the architecture
>>>>> otherwise.
>>>>>
>>>>
>>>> Currently, isp fw is controlling the sensor to update just the exposure and
>>>> gain, since the 3A algorithms run on ISP HW rather than on x86. In a future
>>>> version, we plan to introduce raw output support in the ISP driver, allowing
>>>> users to choose between AMD’s 3A running on ISP hardware or a custom 3A
>>>> running on x86. If the user opts for the x86-based 3A, the firmware will
>>>> relinquish control of the sensor, and hands over full control to the x86
>>>> system.
>>>
>>> There are a few problems I see with this approach.
>>>
>>> Camera sensors are separate devices from the ISP and they're expected to be
>>> controlled by the respective camera sensor drivers and these drivers only.
>>> The firmware contains the camera control algorithms as well as tuning; this
>>> is something that's better located outside of it.
>>>
>>> The complex camera system comprising of a camera sensor, an ISP and a
>>> microcontroller within you have is right now semi-integrated to the SoC and
>>> I think it needs to be either fully unintegrated (the ISPs we currently
>>> support) or fully integrated (e.g. UVC webcams).
>>>
>>> There are two options that I can see here, in descending order of
>>> preference:
>>>
>>> 1. Control the ISP processing blocks from the AMD ISP driver, via a
>>>      documented UAPI. This includes setting processing block parameters and
>>>      being able to obtain statistics from the ISP. This is aligned with the
>>>      other currently supported ISP drivers.
>>>      This option could include support for the CSI-2 receiver only, with the
>>>      processing taking place in SoftISP. Fully supported ISP would of course
>>>      be preferred.
>>>      Right now I don't have an opinion on whether or not this needs to
>>>      include libcamera support, but the ISP driver wouldn't be of much use
>>>      without that anyway.
>>>
>>> 2. Move sensor control to firmware and make the AMD ISP driver expose an
>>>      interface that looks like a webcam, akin to the UVC driver. In this case
>>>      there's also no use for the sensor driver you've posted earlier.
>>>      Overall, the ISP/sensor combination will probably be limited to use as a
>>>      webcam in this case.
>>>
>>
>> Based on our internal discussion and validation, will make option 2 as our
>> current upstream target, after that, will plan option 1 with more
>> considerations, a. Whether to provide the capability and interface so user
>> can do switch between option 1 and 2. b. Whether and how to expose interface
>> so host can leverage the ISP HW feature to accelerat some processing. Though
>> sensor driver is not used in option 2, we still plan to upstream it because
>> of option 1 as next step.
> 
> I expect this to take some time.
> 
> In the meantime, I'm inclined to merge ov02c05 driver from Bingbu / Hao in
> case they can provide an upstreamable one as that driver would have users
> already today. That being said, it won't be a problem accommodating the
> needs of both into the same driver.
> 

-- 
Regards,
Bin


