Return-Path: <linux-media+bounces-34698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACFFAD8130
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 04:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 270CB16A617
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 02:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A1C244681;
	Fri, 13 Jun 2025 02:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XmLs55Mi"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E99242927;
	Fri, 13 Jun 2025 02:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749782599; cv=fail; b=d+DbDu0rNPVieVt9aVkvi1btkuiKPSDXzsTWEr+uQPSVqT6nORry3GP7XeGIXZg7pOxzQhwKolw+05lfR0pgRdf4ihJcAWGeH+48msPDbB1vWvOli3J/P9PS7yfAS5OC1QjWxXmmIxbXAfS4ClAaTat+fkgQkOpWn5tvWpkcAGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749782599; c=relaxed/simple;
	bh=pFQop7uOHhPZ3IODTGQaP1HchQ0QZ3Jx8KPh9u8yP4Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eYM4rwWyQHKle1zAq51CkwvwGtRQk21QaAR/ZKYmSwR3v8JVIan5IjMQnXMWxUJ0+DZ3Sm5exH38pOCVLw0voo8VPvF5NkUzi7+8FxZaXz+P+xEoQGH+5cgz1EA5Hsvbnh8kQcslrmXJte2cf1Tkeog5efFZyHccmvMaAM66aWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XmLs55Mi; arc=fail smtp.client-ip=40.107.244.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4M99nNbeR3N6Eb0Z4xXFH/ffKRwgb7cYfSeb7UZta0NfZ9e7OsWBHmkbKZpU/0gXENlGQ3NYNnIMJk8DbBpPC5y22cscWi7sP80PO+vmgGoljAtJSIden0e+usBN4tTthQfhU75Xmr4phDiD3/JWERl+9N9lhP/WP+9CqF/LolrhGTQGXeqaeuA7IaJfTCshmpJtJht+hWaTKctDDFlM/gwvbExz63JEQFWrQtiUoaZfmstgQ3HGLjR0krfgpSvhynyJGrmEik6y5yDTvRuz3v6dC1l6lLs6uWd5eKbRCAbJVjb3+XgkrAYSRO6d1ZB33OwQ9Y3fFkJvPiBZvq/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV08vtQynWfEPNSk6dgE/oEkaP26fkwFhCCEUe0kTXM=;
 b=fejMSk5l51NLriYDqD7IRx7J82QdUmDzeDkDLIOeylTgjzizvG62sa8dHurqt3WeMpvx/MqRAyNd272HLkCkIabqBH0EhIr71ywv7iwwSP9DI0kzhqc4q9EX+Qfjd3+LtgzbbxVw7WPl0QtfZO0XD+46qPqBG8i6kVbNIHDSMqZ7WJCI8K8pU8l0eIbF417ePOc9qMEIqJ6JsdueT8zeAT/cppW2+yrbG3xTzDnBqSIm+hneE6Ay/ewPlVmKgGJIig0kOvVjMlLIDhE8V09Y2WXmv6V8I/sKrt0fGjK650eNUE0xcdbxQhCLn/RRTcuYRPBvDpYod9peYx5bQzAntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV08vtQynWfEPNSk6dgE/oEkaP26fkwFhCCEUe0kTXM=;
 b=XmLs55Mi08uRePfRj9XdBbkrzD/zDMIpNpUa0wgRo7ZiorxTHtGNb27N5++hvAakxV12aRDomALs5wesoOeRo1p/MGGIvKRBUap2KNsin2pNfvmvPStGBqxXHp1fh0bQMBZ5ZPlw9yotkelkWvL35SZATn5kA/L5kX2CUE6O7a4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Fri, 13 Jun
 2025 02:43:15 +0000
Received: from MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137]) by MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137%7]) with mapi id 15.20.8792.040; Fri, 13 Jun 2025
 02:43:15 +0000
Message-ID: <d0ebcd6a-8368-4338-a386-fabddf8a7304@amd.com>
Date: Fri, 13 Jun 2025 10:43:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/9] media: platform: amd: isp4 debug fs logging and
 more descriptive errors
To: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250608144916.222835-1-Bin.Du@amd.com>
 <20250608144916.222835-8-Bin.Du@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250608144916.222835-8-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0121.apcprd03.prod.outlook.com
 (2603:1096:4:91::25) To MW5PR12MB5683.namprd12.prod.outlook.com
 (2603:10b6:303:1a0::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5683:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: a2390a64-0814-43f6-1c7a-08ddaa240bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkxsZ25uVitqNlBxWHpSVm5pTWQwMCtYamhNdTNsYUhrSTBxTVFLZnlJRFdM?=
 =?utf-8?B?MnJpZXI3c1FZaHRqQWZIZnpkZzFmdkFuTytNL2NLa09vYkJHZE5hemV5R0Zs?=
 =?utf-8?B?andxUTAxUFJKbHU2Y2xVU05ocjVxWFlqMXJsWTdjcHdhMFVBMW42MTVVWUpY?=
 =?utf-8?B?TXBYYjdiWnpmU1IzMTVuOXpDTTlZR3F3V21HY3pSUXo0RmtYV29zdDRuWm9k?=
 =?utf-8?B?aytiN1Y2N25KRHNtdU5BeXBpTHZRa2hXWW13eEhSRjNRRmRwRmVBbTgwYUZG?=
 =?utf-8?B?RExCT2VoRDNBdjVqZGJzdjVLYytmSDVPRzR1STZRaHp6dXcxVFNablJraEht?=
 =?utf-8?B?NjczTmRtV1JRZ1I3RjlUU2Y4QjE0U1hOL3h2Y1J6R2hDWGw0SExUYmlkb1dR?=
 =?utf-8?B?LzJNd3E3WmZmM0w5ak5mdFdlemlJUERQMW9tbWoyWVh2Z3AvTXRkVzJWUlBp?=
 =?utf-8?B?d2RxdTZYdlBaVytNa013K3pHTkowcHV4VlkvR0VvOUw4TG02SHJ3TUNRSm8v?=
 =?utf-8?B?a1IwTHozWTVWUm1qaFpZekZkUjh6OG1IZFRpWkZ0U0hXK25LY1FyQ3BEb29V?=
 =?utf-8?B?L3FuZ2dQeXRpNnd3ZWpYdDZRcVBoc3NMdEJ5THhyTTl5Uzc4YTV3b3dmMm8v?=
 =?utf-8?B?b2VoWmtnZkluSnVYdDAvR2NXV3RPUDA4b0k1blhLbGd5WjVuSDR1QzZGd1By?=
 =?utf-8?B?cVRjVkcweWRsUXFiekhLRDRwRllHcUhUajFsSmF2OG5KYklQTXJKMmlnODFF?=
 =?utf-8?B?bmd3WDBXc2JrdmlpVTJKRTJxdmNESlJGd05Hb0p5dkxZcmp4MjBzcTdZK1Zj?=
 =?utf-8?B?VzhmbytrL1c4WCt3TkpON2ZhSzZmNlF0clAwZ1ZoL3hhRk1Jd3N4VmxkR2FF?=
 =?utf-8?B?OGJ0UVRGblA1UmpmbEV0SHY1a204YzBHSmpSZGVJcmVJWWQ4dVB5cW9rTGIx?=
 =?utf-8?B?cVhmejBHdE1HZ0pzZ0xmYUxGUStaZjMrbkFqZ1U3TmoyVGcvQW5TdUt0MGhn?=
 =?utf-8?B?a01FRUs2SWVYNHJpaUxrR3BUYXJOS2lzSTBCNExlclh6OTJqblN3NDBEcWJj?=
 =?utf-8?B?V1RzeXdidXd6RTZjUkN4T0hNMWtMbzlyZzBiOUJNdVNDVGJNMTE4cEpoeFJx?=
 =?utf-8?B?Y0cvak9BdGZ6UGx1VnlyenpmK202QlFuajVqTHl2aWZuY1JlRkp2R2xaU2N2?=
 =?utf-8?B?OTBOUHNuM1RFSm4wQjVxNnhsN2hIaDgxREg4RlY2VVVGWDJTMldmSHFHdE85?=
 =?utf-8?B?Ri9JQSsxQWE0R2tlc0d5YmZGa0NWMkRzSk05YnNBQ3NPNnBNMlRtWFdMc2R1?=
 =?utf-8?B?K1p0M2xKeTRQR3d6VU5rVTJXeUFGWER4cFRLa1Budm1aVGNkbGk0dlk3dFZM?=
 =?utf-8?B?Wi8xYVJVSVRKb0twMFlhWVcrSm1EbXNNdEZmYWRkQVdVZjZueStuWjZSY0k1?=
 =?utf-8?B?cVNYZ1BGUS94WStWVGJGWUtrbzhMQ25VeTc5QlJXRFNGaGk1cCtxdlczOGdM?=
 =?utf-8?B?RzhwaGVYVTNuNWZJbm9SUEpueVFUdmlaZ0FGcWNWVUFPVkJMNk5BZnNjcU5r?=
 =?utf-8?B?RWZmNnJuazROY29pa1BFN3AzMlUydlJBamFXd2s1dS9NeVloQlFRZlNTVmY5?=
 =?utf-8?B?U2RoWnh6UFJJMGdSRTNjSTh4QTVwQkVDSCtrZytHanZXYXpHSDMrUnFIbHF6?=
 =?utf-8?B?Tzlybkw3Sk8rcXVvS3AvWlc5WDJZL1ExQzZmMVorRHZXS24rNnRZazhGRURD?=
 =?utf-8?B?cWx2YjU1MnZqVm9aL0F2R3NiejMzMUJRUDF6UTZkc3B4QTdpS0I4VXV1WVZ0?=
 =?utf-8?B?TkRGYWc5Q2ZOZnpTRGdWVk40Wlg3UjRsMnFzNjh0RmpjSXhzazgxVWdBR0x1?=
 =?utf-8?B?SkJiMTlnMDJpZDJqU1N0RDFaby8zT1M5dUtzTVVHdmxHak8wV2pOUXZCdUhx?=
 =?utf-8?Q?5Zx9PD+c95o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR12MB5683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZitxT3czZ2xUcEF3Zy94K3dEVFdyNC9Yc0ZKUHZESlpMRXhUOTlWSDBtM3Ey?=
 =?utf-8?B?SThHb29nZytCcUtZZ1E5YW5qR0JxUGdIKzJmOVBmSHhUWkpIZ3dMdjVPaFlZ?=
 =?utf-8?B?NDhOWlN0WTJ4azJpRnkwdkRYSUx3ZGRrNzlwVlNWaTUwUjF1RGFyRU1XUWg1?=
 =?utf-8?B?NjcxOFNad25TSnZYQ2ZsVG53bUQ1RXpGVlFNZlFMMU5YcTFaV3NnR0s5NXFM?=
 =?utf-8?B?V1BiY1BCYlZPYldyeVp6OXR0TUd3Q1BNcW5PdytMdDdPc01oSjNXVm0ydnU0?=
 =?utf-8?B?NU45SXYyb3FuN2RQLzdkUXYrbkNpWFZCbkU4dmptN3pzcE1GZmQzUFU3NGVG?=
 =?utf-8?B?WStzYk5lbEpSVzZYdWpCN3c2Zlc3NW9UTldMK2FXQjBiUkVMREI3RjdCZHcx?=
 =?utf-8?B?UGxNeURFVDlodFdaWDdjQkJQc1hmNENpS2dNY0pDWlZVOTNoK2FsTlhSeU11?=
 =?utf-8?B?eTJwUUpiSDVIcFZmd2Z3NkJVOVNna016VnBVdGNjb0ZvcGtPcXFxVEZvNWps?=
 =?utf-8?B?em9hZFNPdVV4TVUzUjZUcXVoYkZpUk5adnIwOEIrZ2NLaVBvdzAwd1VaVlVD?=
 =?utf-8?B?blNPeWMxK1ArcTA5algrWTdyQ21BWUljNjBJQ2IyZnlybTcrMU1lajVZdDZL?=
 =?utf-8?B?K0sxMHpYYnBTbnBtTUNnSzhYUnQ1NlRmcTFUTjBMUDIrS0U5YWFJemw3WGZj?=
 =?utf-8?B?ZlQ0c1JSVFZIUG5kZ05SdmlNSEFDNDRQemxJc0pZdyt2d1VCRjE4eEZHT3BU?=
 =?utf-8?B?UVpTWWNkaEYyRW5tbUFKaUlKNC8vWnFOTFhBZS95QWI3a1JnZWJsdTBOZG90?=
 =?utf-8?B?REF4QTVUay96aEhkZVUzeStvNUY4aDQ0bW8wUXBhcEg1TEJBS3FqWHFpVWpL?=
 =?utf-8?B?c0h3Qys5ekhJYnE2MUJnU0V4N1NVSEdpVHovb1dmTzFUMm9hSWNLc1FBV0N5?=
 =?utf-8?B?bTF2NThnQ1FMa0IyZ0QwMnExZnByR0pQM3hsVnNKRHlYVjk4V1N4cnRqOUVJ?=
 =?utf-8?B?Yjl6OWo4V2N3bmFyellEV2lFVXNqeno1QnFTZHZpTUNWUTc1aG5xZkdleTNC?=
 =?utf-8?B?TXNqMmc5dXdXVmRPUGVDb25HNmF5V2p5dmI4V3F6eFdjOEZaL1hLS1hnQkFw?=
 =?utf-8?B?U3hXV2FBeHlXdXRIU0liV3ZockUxV1JIdithdStDY2dVSXg4NHV0anF6cHFn?=
 =?utf-8?B?OTh5Zkp6dXJCV3d6Q3dOU3dJTHdkSVJXaDlkQU9nYktkZlAyMm9EZFZYMWRO?=
 =?utf-8?B?VURZMkkrb0dURjZTdk9GbmVPMGhud3JWN0V5azlodzFTQmMwRzI4bkIrVVVJ?=
 =?utf-8?B?WHRLTFVXOE43VWkxVXhTdUZpdGNDV0l1b0ZnSmp5clcvOUV2QXh4YjNIQjJZ?=
 =?utf-8?B?SDdmMVp2cEtQeGc2U0V5RzR4dDYwaS93V3ZyekY0MTFBaGVydUhlWjhEcGtj?=
 =?utf-8?B?ZUdTZmNodXNwRFk1MWZHY3RZMG5qeWZMcjlZSnp3cUhwMW1KQlE2NVY1Ymlk?=
 =?utf-8?B?RlppdEI0Y2NxQmoyZHZNMGpndHVzVml2ZG1TaVg1Q3l3WlVCWkpWWjRtbjM1?=
 =?utf-8?B?cUhxSmxqcWRQTkRQdDVSby9mR1BLSzI4a0dDYVpMNERuQnJjQnRYSXZtNHpC?=
 =?utf-8?B?UFJER3FHazlVUmlSdWVvZXV2WUREaHo2OEVKak42Yk9tdWppNjdRZG9ZL2Mz?=
 =?utf-8?B?eEhOQUdJdkp6RVl3N1l6bjRZcmtBQlJhVlhQdG1RYVBXMFIwS2FCVkJPL0RH?=
 =?utf-8?B?UnV2cm5kaWVLYzJHTW9Db0xiYVBnYVFRYUVRWGRHTkdWclJIYmlvcFRHejA3?=
 =?utf-8?B?TmYzZ0pSdVJwOHdnTVpjWUdsQWtzdUYxcHVvS2gwSzI1cmY2Q3l1ZDY2bldU?=
 =?utf-8?B?VXdjUXNUVFNMajJPTW9rSEFnZDRTb25pUWdnVGdvWlBKS05aRnVONXI5Mkxj?=
 =?utf-8?B?cjNKZUZzU1VnZEhPS1VlcEE0WDZOeGc4d25kMkZaaEpnNGZZdkFxd0RBbUZP?=
 =?utf-8?B?YVdZNkxPSlMxQW1jbjlQRVZGZDVyRnR6OUs4dXRrUGFSeDA3S1dFYXZUODZJ?=
 =?utf-8?B?YmVCbG83Z1NERnpaOUpBdGN1ZDBMM2lKZWJsWEFqOUxRa3h3RkFIWnppVHRi?=
 =?utf-8?Q?rh1w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2390a64-0814-43f6-1c7a-08ddaa240bd5
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 02:43:15.2783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0WZXteW7ZMrMQQyIUmrGF8UgNaibr8M+6sjgOOumMT7Uawmmmzs0ykzBscVjbDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796

Change-Id should be removed and will be fixed in V2

On 6/8/2025 10:49 PM, Bin Du wrote:
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Change-Id: I3ce167dbeb612b94c89df0b48f7ffa0988b5336f
> ---
>   drivers/media/platform/amd/isp4/Makefile      |   1 +
>   drivers/media/platform/amd/isp4/isp4.c        |   5 +
>   drivers/media/platform/amd/isp4/isp4_debug.c  | 272 ++++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4_debug.h  |  41 +++
>   .../media/platform/amd/isp4/isp4_interface.c  |  37 ++-
>   drivers/media/platform/amd/isp4/isp4_subdev.c |  29 +-
>   6 files changed, 365 insertions(+), 20 deletions(-)
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
> 
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> index a68f18fe79b4..da1e047cdb7d 100644
> --- a/drivers/media/platform/amd/isp4/Makefile
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -4,6 +4,7 @@
>   
>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>   amd_capture-objs := isp4_subdev.o \
> +			isp4_debug.o \
>   			isp4_phy.o \
>   			isp4_interface.o \
>   			isp4.o	\
> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> index 3beb35293504..f7e716ec47da 100644
> --- a/drivers/media/platform/amd/isp4/isp4.c
> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -10,6 +10,7 @@
>   #include "amdgpu_object.h"
>   
>   #include "isp4.h"
> +#include "isp4_debug.h"
>   #include "isp4_hw.h"
>   
>   #define ISP4_DRV_NAME "amd_isp_capture"
> @@ -325,6 +326,8 @@ static int isp4_capture_probe(struct platform_device *pdev)
>   	pm_runtime_set_suspended(dev);
>   	pm_runtime_enable(dev);
>   
> +	isp_debugfs_create(isp_dev);
> +
>   	return 0;
>   
>   err_unreg_video_dev_notifier:
> @@ -342,6 +345,8 @@ static void isp4_capture_remove(struct platform_device *pdev)
>   {
>   	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>   
> +	isp_debugfs_remove(isp_dev);
> +
>   	v4l2_async_nf_unregister(&isp_dev->notifier);
>   	v4l2_async_nf_cleanup(&isp_dev->notifier);
>   	v4l2_device_unregister_subdev(&isp_dev->isp_sdev.sdev);
> diff --git a/drivers/media/platform/amd/isp4/isp4_debug.c b/drivers/media/platform/amd/isp4/isp4_debug.c
> new file mode 100644
> index 000000000000..0b8b1ad87525
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_debug.c
> @@ -0,0 +1,272 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include "isp4.h"
> +#include "isp4_debug.h"
> +#include "isp4_hw.h"
> +#include "isp4_interface.h"
> +
> +#define ISP4DBG_FW_LOG_RINGBUF_SIZE (2 * 1024 * 1024)
> +#define ISP4DBG_MACRO_2_STR(X) #X
> +#define ISP4DBG_MAX_ONE_TIME_LOG_LEN 510
> +
> +#ifdef CONFIG_DEBUG_FS
> +
> +void isp_debugfs_create(struct isp4_device *isp_dev)
> +{
> +	isp_dev->isp_sdev.debugfs_dir = debugfs_create_dir("amd_isp", NULL);
> +	debugfs_create_bool("fw_log_enable", 0644,
> +			    isp_dev->isp_sdev.debugfs_dir,
> +			    &isp_dev->isp_sdev.enable_fw_log);
> +	isp_dev->isp_sdev.fw_log_output =
> +		devm_kzalloc(&isp_dev->pdev->dev,
> +			     ISP4DBG_FW_LOG_RINGBUF_SIZE + 32,
> +			     GFP_KERNEL);
> +}
> +
> +void isp_debugfs_remove(struct isp4_device *isp_dev)
> +{
> +	debugfs_remove_recursive(isp_dev->isp_sdev.debugfs_dir);
> +	isp_dev->isp_sdev.debugfs_dir = NULL;
> +}
> +
> +static u32 isp_fw_fill_rb_log(struct isp4_subdev *isp, u8 *sys, u32 rb_size)
> +{
> +	struct isp4_interface *ispif = &isp->ispif;
> +	struct device *dev = isp->dev;
> +	u8 *buf = isp->fw_log_output;
> +	u32 rd_ptr, wr_ptr;
> +	u32 total_cnt = 0;
> +	u32 offset = 0;
> +	u32 cnt;
> +
> +	if (!sys || rb_size == 0)
> +		return 0;
> +
> +	mutex_lock(&ispif->isp4if_mutex);
> +
> +	rd_ptr = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_LOG_RB_RPTR0);
> +	wr_ptr = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_LOG_RB_WPTR0);
> +
> +	do {
> +		if (wr_ptr > rd_ptr)
> +			cnt = wr_ptr - rd_ptr;
> +		else if (wr_ptr < rd_ptr)
> +			cnt = rb_size - rd_ptr;
> +		else
> +			goto unlock_and_quit;
> +
> +		if (cnt > rb_size) {
> +			dev_err(dev, "fail bad fw log size %u\n", cnt);
> +			goto unlock_and_quit;
> +		}
> +
> +		memcpy(buf + offset, (u8 *)(sys + rd_ptr), cnt);
> +
> +		offset += cnt;
> +		total_cnt += cnt;
> +		rd_ptr = (rd_ptr + cnt) % rb_size;
> +	} while (rd_ptr < wr_ptr);
> +
> +	isp4hw_wreg(ISP4_GET_ISP_REG_BASE(isp), ISP_LOG_RB_RPTR0, rd_ptr);
> +
> +unlock_and_quit:
> +	mutex_unlock(&ispif->isp4if_mutex);
> +	return total_cnt;
> +}
> +
> +void isp_fw_log_print(struct isp4_subdev *isp)
> +{
> +	struct isp4_interface *ispif = &isp->ispif;
> +	char *fw_log_buf = isp->fw_log_output;
> +	u32 cnt;
> +
> +	if (!isp->enable_fw_log || !fw_log_buf)
> +		return;
> +
> +	cnt = isp_fw_fill_rb_log(isp, ispif->fw_log_buf->sys_addr,
> +				 ispif->fw_log_buf->mem_size);
> +
> +	if (cnt) {
> +		char temp_ch;
> +		char *str;
> +		char *end;
> +		char *line_end;
> +
> +		str = (char *)fw_log_buf;
> +		end = ((char *)fw_log_buf + cnt);
> +		fw_log_buf[cnt] = 0;
> +
> +		while (str < end) {
> +			line_end = strchr(str, 0x0A);
> +			if ((line_end && (str + ISP4DBG_MAX_ONE_TIME_LOG_LEN) >= line_end) ||
> +			    (!line_end && (str + ISP4DBG_MAX_ONE_TIME_LOG_LEN) >= end)) {
> +				if (line_end)
> +					*line_end = 0;
> +
> +				if (*str != '\0')
> +					dev_dbg(isp->dev,
> +						"%s", str);
> +
> +				if (line_end) {
> +					*line_end = 0x0A;
> +					str = line_end + 1;
> +				} else {
> +					break;
> +				}
> +			} else {
> +				u32 tmp_len = ISP4DBG_MAX_ONE_TIME_LOG_LEN;
> +
> +				temp_ch = str[tmp_len];
> +				str[tmp_len] = 0;
> +				dev_dbg(isp->dev, "%s", str);
> +				str[tmp_len] = temp_ch;
> +				str = &str[tmp_len];
> +			}
> +		}
> +	}
> +}
> +#endif
> +
> +char *isp4dbg_get_buf_src_str(u32 src)
> +{
> +	switch (src) {
> +	case BUFFER_SOURCE_STREAM:
> +		return ISP4DBG_MACRO_2_STR(BUFFER_SOURCE_STREAM);
> +	default:
> +		return "Unknown buf source";
> +	}
> +}
> +
> +char *isp4dbg_get_buf_done_str(u32 status)
> +{
> +	switch (status) {
> +	case BUFFER_STATUS_INVALID:
> +		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_INVALID);
> +	case BUFFER_STATUS_SKIPPED:
> +		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_SKIPPED);
> +	case BUFFER_STATUS_EXIST:
> +		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_EXIST);
> +	case BUFFER_STATUS_DONE:
> +		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_DONE);
> +	case BUFFER_STATUS_LACK:
> +		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_LACK);
> +	case BUFFER_STATUS_DIRTY:
> +		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_DIRTY);
> +	case BUFFER_STATUS_MAX:
> +		return ISP4DBG_MACRO_2_STR(BUFFER_STATUS_MAX);
> +	default:
> +		return "Unknown Buf Done Status";
> +	}
> +};
> +
> +char *isp4dbg_get_img_fmt_str(int fmt /* enum isp4fw_image_format * */)
> +{
> +	switch (fmt) {
> +	case IMAGE_FORMAT_NV12:
> +		return "NV12";
> +	case IMAGE_FORMAT_YUV422INTERLEAVED:
> +		return "YUV422INTERLEAVED";
> +	default:
> +		return "unknown fmt";
> +	}
> +}
> +
> +void isp4dbg_show_bufmeta_info(struct device *dev, char *pre,
> +			       void *in, void *orig_buf)
> +{
> +	struct isp4if_img_buf_info *orig;
> +	struct isp4fw_buffer_meta_info *p;
> +
> +	if (!in)
> +		return;
> +
> +	if (!pre)
> +		pre = "";
> +
> +	p = (struct isp4fw_buffer_meta_info *)in;
> +	orig = (struct isp4if_img_buf_info *)orig_buf;
> +
> +	dev_dbg(dev, "%s(%s) en:%d,stat:%s(%u),src:%s\n", pre,
> +		isp4dbg_get_img_fmt_str(p->image_prop.image_format),
> +		p->enabled, isp4dbg_get_buf_done_str(p->status), p->status,
> +		isp4dbg_get_buf_src_str(p->source));
> +
> +	dev_dbg(dev, "%p,0x%llx(%u) %p,0x%llx(%u) %p,0x%llx(%u)\n",
> +		orig->planes[0].sys_addr, orig->planes[0].mc_addr,
> +		orig->planes[0].len, orig->planes[1].sys_addr,
> +		orig->planes[1].mc_addr, orig->planes[1].len,
> +		orig->planes[2].sys_addr, orig->planes[2].mc_addr,
> +		orig->planes[2].len);
> +}
> +
> +char *isp4dbg_get_buf_type(u32 type)
> +{
> +	/* enum isp4fw_buffer_type */
> +	switch (type) {
> +	case BUFFER_TYPE_PREVIEW:
> +		return ISP4DBG_MACRO_2_STR(BUFFER_TYPE_PREVIEW);
> +	case BUFFER_TYPE_META_INFO:
> +		return ISP4DBG_MACRO_2_STR(BUFFER_TYPE_META_INFO);
> +	case BUFFER_TYPE_MEM_POOL:
> +		return ISP4DBG_MACRO_2_STR(BUFFER_TYPE_MEM_POOL);
> +	default:
> +		return "unknown type";
> +	}
> +}
> +
> +char *isp4dbg_get_cmd_str(u32 cmd)
> +{
> +	switch (cmd) {
> +	case CMD_ID_START_STREAM:
> +		return ISP4DBG_MACRO_2_STR(CMD_ID_START_STREAM);
> +	case CMD_ID_STOP_STREAM:
> +		return ISP4DBG_MACRO_2_STR(CMD_ID_STOP_STREAM);
> +	case CMD_ID_SEND_BUFFER:
> +		return ISP4DBG_MACRO_2_STR(CMD_ID_SEND_BUFFER);
> +	case CMD_ID_SET_STREAM_CONFIG:
> +		return ISP4DBG_MACRO_2_STR(CMD_ID_SET_STREAM_CONFIG);
> +	case CMD_ID_SET_OUT_CHAN_PROP:
> +		return ISP4DBG_MACRO_2_STR(CMD_ID_SET_OUT_CHAN_PROP);
> +	case CMD_ID_ENABLE_OUT_CHAN:
> +		return ISP4DBG_MACRO_2_STR(CMD_ID_ENABLE_OUT_CHAN);
> +	default:
> +		return "unknown cmd";
> +	};
> +}
> +
> +char *isp4dbg_get_resp_str(u32 cmd)
> +{
> +	switch (cmd) {
> +	case RESP_ID_CMD_DONE:
> +		return ISP4DBG_MACRO_2_STR(RESP_ID_CMD_DONE);
> +	case RESP_ID_NOTI_FRAME_DONE:
> +		return ISP4DBG_MACRO_2_STR(RESP_ID_NOTI_FRAME_DONE);
> +	default:
> +		return "unknown respid";
> +	};
> +}
> +
> +char *isp4dbg_get_if_stream_str(u32 stream /* enum fw_cmd_resp_stream_id */)
> +{
> +	switch (stream) {
> +	case ISP4IF_STREAM_ID_GLOBAL:
> +		return "STREAM_GLOBAL";
> +	case ISP4IF_STREAM_ID_1:
> +		return "STREAM1";
> +	default:
> +		return "unknown streamID";
> +	}
> +}
> +
> +char *isp4dbg_get_out_ch_str(int ch /* enum isp4fw_pipe_out_ch */)
> +{
> +	switch ((enum isp4fw_pipe_out_ch)ch) {
> +	case ISP_PIPE_OUT_CH_PREVIEW:
> +		return "prev";
> +	default:
> +		return "unknown channel";
> +	}
> +}
> diff --git a/drivers/media/platform/amd/isp4/isp4_debug.h b/drivers/media/platform/amd/isp4/isp4_debug.h
> new file mode 100644
> index 000000000000..acf99bf129ae
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_debug.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_DEBUG_H_
> +#define _ISP4_DEBUG_H_
> +
> +#include <linux/printk.h>
> +#include <linux/dev_printk.h>
> +
> +#include "isp4_subdev.h"
> +
> +#ifdef CONFIG_DEBUG_FS
> +struct isp4_device;
> +
> +void isp_debugfs_create(struct isp4_device *isp_dev);
> +void isp_debugfs_remove(struct isp4_device *isp_dev);
> +void isp_fw_log_print(struct isp4_subdev *isp);
> +
> +#else
> +
> +/*to avoid checkpatch warning*/
> +#define isp_debugfs_create(cam) cam
> +#define isp_debugfs_remove(cam) cam
> +#define isp_fw_log_print(isp) isp
> +
> +#endif /* CONFIG_DEBUG_FS */
> +
> +void isp4dbg_show_bufmeta_info(struct device *dev, char *pre, void *p,
> +			       void *orig_buf /* struct sys_img_buf_handle* */);
> +char *isp4dbg_get_img_fmt_str(int fmt /* enum _image_format_t * */);
> +char *isp4dbg_get_out_ch_str(int ch /* enum _isp_pipe_out_ch_t */);
> +char *isp4dbg_get_cmd_str(u32 cmd);
> +char *isp4dbg_get_buf_type(u32 type);/* enum _buffer_type_t */
> +char *isp4dbg_get_resp_str(u32 resp);
> +char *isp4dbg_get_buf_src_str(u32 src);
> +char *isp4dbg_get_buf_done_str(u32 status);
> +char *isp4dbg_get_if_stream_str(u32 stream);
> +
> +#endif
> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
> index d46d7487a994..2a57707925cf 100644
> --- a/drivers/media/platform/amd/isp4/isp4_interface.c
> +++ b/drivers/media/platform/amd/isp4/isp4_interface.c
> @@ -7,6 +7,7 @@
>   
>   #include "amdgpu_object.h"
>   
> +#include "isp4_debug.h"
>   #include "isp4_fw_cmd_resp.h"
>   #include "isp4_hw.h"
>   #include "isp4_hw_reg.h"
> @@ -392,7 +393,8 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif,
>   	len = rb_config->val_size;
>   
>   	if (isp4if_is_cmdq_rb_full(ispif, stream)) {
> -		dev_err(dev, "fail no cmdslot (%d)\n", stream);
> +		dev_err(dev, "fail no cmdslot %s(%d)\n",
> +			isp4dbg_get_if_stream_str(stream), stream);
>   		return -EINVAL;
>   	}
>   
> @@ -400,13 +402,15 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif,
>   	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
>   
>   	if (rd_ptr > len) {
> -		dev_err(dev, "fail (%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
> +		dev_err(dev, "fail %s(%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
> +			isp4dbg_get_if_stream_str(stream),
>   			stream, rd_ptr, len, wr_ptr);
>   		return -EINVAL;
>   	}
>   
>   	if (wr_ptr > len) {
> -		dev_err(dev, "fail (%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
> +		dev_err(dev, "fail %s(%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
> +			isp4dbg_get_if_stream_str(stream),
>   			stream, wr_ptr, len, rd_ptr);
>   		return -EINVAL;
>   	}
> @@ -501,7 +505,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif,
>   			rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
>   			wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
>   			dev_err(dev,
> -				"failed to get free cmdq slot, stream (%d)\n",
> +				"failed to get free cmdq slot, stream %s(%d)\n",
> +				isp4dbg_get_if_stream_str(stream),
>   				stream);
>   			return -ETIMEDOUT;
>   		}
> @@ -553,8 +558,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif,
>   
>   	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
>   	if (ret) {
> -		dev_err(dev, "fail for insert_isp_fw_cmd camId (0x%08x)\n",
> -			cmd_id);
> +		dev_err(dev, "fail for insert_isp_fw_cmd camId %s(0x%08x)\n",
> +			isp4dbg_get_cmd_str(cmd_id), cmd_id);
>   		if (cmd_ele) {
>   			isp4if_rm_cmd_from_cmdq(ispif, cmd_ele->seq_num,
>   						cmd_ele->cmd_id);
> @@ -783,13 +788,15 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
>   	wr_ptr_dbg = wr_ptr;
>   
>   	if (rd_ptr > len) {
> -		dev_err(dev, "fail (%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
> +		dev_err(dev, "fail %s(%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
> +			isp4dbg_get_if_stream_str(stream),
>   			stream, rd_ptr, len, wr_ptr);
>   		return -EINVAL;
>   	}
>   
>   	if (wr_ptr > len) {
> -		dev_err(dev, "fail (%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
> +		dev_err(dev, "fail %s(%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
> +			isp4dbg_get_if_stream_str(stream),
>   			stream, wr_ptr, len, rd_ptr);
>   		return -EINVAL;
>   	}
> @@ -804,7 +811,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
>   				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
>   					    rreg, rd_ptr);
>   			} else {
> -				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
> +				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
> +					isp4dbg_get_if_stream_str(stream),
>   					stream, rd_ptr, len, wr_ptr);
>   				return -EINVAL;
>   			}
> @@ -832,7 +840,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
>   				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
>   					    rreg, rd_ptr);
>   			} else {
> -				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
> +				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
> +					isp4dbg_get_if_stream_str(stream),
>   					stream, rd_ptr, len, wr_ptr);
>   				return -EINVAL;
>   			}
> @@ -855,7 +864,8 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
>   				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
>   					    rreg, rd_ptr);
>   			} else {
> -				dev_err(dev, "(%u),rd %u(should<=%u),wr %u\n",
> +				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
> +					isp4dbg_get_if_stream_str(stream),
>   					stream, rd_ptr, len, wr_ptr);
>   				return -EINVAL;
>   			}
> @@ -872,9 +882,10 @@ int isp4if_f2h_resp(struct isp4_interface *ispif,
>   			checksum, response->resp_check_sum,
>   			rd_ptr_dbg, wr_ptr_dbg);
>   
> -		dev_err(dev, "(%u), seqNo %u, resp_id (0x%x)\n",
> -			stream,
> +		dev_err(dev, "%s(%u), seqNo %u, resp_id %s(0x%x)\n",
> +			isp4dbg_get_if_stream_str(stream), stream,
>   			response->resp_seq_num,
> +			isp4dbg_get_resp_str(response->resp_id),
>   			response->resp_id);
>   
>   		return -EINVAL;
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index 816fa3a127f5..11210b13cd02 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -7,6 +7,7 @@
>   #include <linux/pm_domain.h>
>   #include <linux/pm_runtime.h>
>   
> +#include "isp4_debug.h"
>   #include "isp4_fw_cmd_resp.h"
>   #include "isp4_hw.h"
>   #include "isp4_interface.h"
> @@ -304,7 +305,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
>   		return -EINVAL;
>   	}
>   
> -	dev_dbg(dev, "channel: w:h=%u:%u,lp:%u,cp%u\n",
> +	dev_dbg(dev, "channel:%s,fmt %s,w:h=%u:%u,lp:%u,cp%u\n",
> +		isp4dbg_get_out_ch_str(cmd_ch_prop.ch),
> +		isp4dbg_get_img_fmt_str(cmd_ch_prop.image_prop.image_format),
>   		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
>   		cmd_ch_prop.image_prop.luma_pitch,
>   		cmd_ch_prop.image_prop.chroma_pitch);
> @@ -327,6 +330,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
>   		return ret;
>   	}
>   
> +	dev_dbg(dev, "enable channel %s\n",
> +		isp4dbg_get_out_ch_str(cmd_ch_en.ch));
> +
>   	if (!sensor_info->start_stream_cmd_sent) {
>   		ret = isp4sd_kickoff_stream(isp_subdev, out_prop->width,
>   					    out_prop->height);
> @@ -489,8 +495,9 @@ static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
>   		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
>   	struct device *dev = isp_subdev->dev;
>   
> -	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
> +	dev_dbg(dev, "stream %d,cmd %s(0x%08x)(%d),seq %u, ele %p\n",
>   		stream_id,
> +		isp4dbg_get_cmd_str(para->cmd_id),
>   		para->cmd_id, para->cmd_status, para->cmd_seq_num,
>   		ele);
>   
> @@ -551,8 +558,9 @@ isp4sd_preview_done(struct isp4_subdev *isp_subdev,
>   			pcb->preview.status = ISP4VID_BUF_DONE_STATUS_SUCCESS;
>   		}
>   	} else if (meta->preview.enabled) {
> -		dev_err(dev, "fail bad preview status %u\n",
> -			meta->preview.status);
> +		dev_err(dev, "fail bad preview status %u(%s)\n",
> +			meta->preview.status,
> +			isp4dbg_get_buf_done_str(meta->preview.status));
>   	}
>   
>   	return prev;
> @@ -612,14 +620,18 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
>   	pcb.poc = meta->poc;
>   	pcb.cam_id = 0;
>   
> -	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,(%i)\n",
> +	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,%s(%i)\n",
>   		ktime_get_ns(), stream_id, meta->poc,
>   		meta->preview.enabled,
> +		isp4dbg_get_buf_done_str(meta->preview.status),
>   		meta->preview.status);
>   
>   	prev = isp4sd_preview_done(isp_subdev, meta, &pcb);
> -	if (pcb.preview.status != ISP4VID_BUF_DONE_STATUS_ABSENT)
> +	if (pcb.preview.status != ISP4VID_BUF_DONE_STATUS_ABSENT) {
> +		isp4dbg_show_bufmeta_info(dev, "prev", &meta->preview,
> +					  &pcb.preview.buf);
>   		isp4vid_notify(&isp_subdev->isp_vdev, &pcb);
> +	}
>   
>   	isp4if_dealloc_buffer_node(prev);
>   
> @@ -640,6 +652,8 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
>   	if (ispif->status < ISP4IF_STATUS_FW_RUNNING)
>   		return;
>   
> +	isp_fw_log_print(isp_subdev);
> +
>   	while (true) {
>   		s32 ret;
>   
> @@ -657,7 +671,8 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
>   						  &resp.param.frame_done);
>   			break;
>   		default:
> -			dev_err(dev, "-><- fail respid (0x%x)\n",
> +			dev_err(dev, "-><- fail respid %s(0x%x)\n",
> +				isp4dbg_get_resp_str(resp.resp_id),
>   				resp.resp_id);
>   			break;
>   		}


