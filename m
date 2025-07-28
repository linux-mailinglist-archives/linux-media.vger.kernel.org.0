Return-Path: <linux-media+bounces-38587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5291AB13F02
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 17:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D38166A29
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9581271A84;
	Mon, 28 Jul 2025 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G29a5htV"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB5E1A254E;
	Mon, 28 Jul 2025 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753717359; cv=fail; b=dcg/aQ4sppLn4fm1qzSbAqeO068e3SQ+aLpRksLYuyGkUp0CHshRb8Vg75n3c83mvKI12iknNpF1qGmSxc4HKhgmi1lTbpg8Yghas+hIf6+R/jrYNMOvJSQllH8L2fvP4/Igfi/Ll8+1DlxsHRE/zg5WZ6czYMBDHf0nVyiPyyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753717359; c=relaxed/simple;
	bh=xbPBzZ2CwqtjCDoLvEweY7Jr0TploM/yk0oGdxmME9g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ohn9xeC4s0xNprZMZG1a8v1UhkSEfuc738aU9WKfsYv6HI4g3emh5r9GbOGvmD3PpYubXmAcynpq0fQYNCjtpF/2EutmJl7w+0HlfIE/IQoM35gCVW83HieUPjbhQHerlQkmUI6U7yFpdgMud8R6rI37s3aF2zMAowmvZsRxilo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G29a5htV; arc=fail smtp.client-ip=52.101.65.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWYohqBdPRGzxgvolpCjnXmng/bmmekbggw21ahHf52CBDqSnjQYNSp1m159EMy7Jrgvn1EEmA/Q+leY+QR8miIxAyt8jRGYwv6VQmj/LJ3h+WN8eajWEuTgDOe5wbjZ0igAzjHV7ZWXKbWmCdZNC0lhUz2V5eI9s1ChNRpMCMz3rmBG/m6lMqZgdihOg4NvKJu+nUs9nkLQ2nB6GNyJ2FujuY/2CJ+qXRLNAlFRFReV2td36HAOWH/uWPGGn9coeXTG2+FLiWhaWoozEcpyHenx+Fv6cWBmMENgVnrLy8ntq8fIGIOdi9Net7qWycWGhXQeveJADMfaltCn9Dvz3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dS8i8oSpP/v8FzOwP5WUMNp1+oA3v64l8kLCJJJFbxs=;
 b=oTLiWfX7WiAGTKJbbSjMHpkqdOstb96k9c0wfgLs5rOk2FdYffjt3dchJ7WxVZ6dRtp03IQZVE87PRrkFlX4V+2INorBRz4qDEg1iYw36PfygrKkgpButnuUvQgfZJE3B6Rw/u4CZvd4gECNyll9gX6sSdRaM7pvcXC1yu21aP1S8QZQXqKToAaP7ywwCU8TkEoVz+yE/Kb+Yg2k9/y927QT/QyLHQwDeDqMx0VEpN8xYedLokW8ie64TPNhI4oylp81bW8ZdUFX4m1rQYzPIYOorQtv5rBTqRPRKO6kv7SbDZnrYdczf+CCf9FAbPWwOY4ZoYMY/qUghfoZNXLk3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dS8i8oSpP/v8FzOwP5WUMNp1+oA3v64l8kLCJJJFbxs=;
 b=G29a5htV2YMdO0Fg+UmnmsPgNiua2ZfV4rt+cY5G4RSX9eacYAs23J8KWLGSYVrbpYqjQHskFf8QIfJobo8hUO+nRYwXDkkFQxP9+Cas21LrPAxTKG/i/Tsed6MN2tFqcQdSJAuBqabV5x8MpAxPfmNx6R0n1GK70YcgG1umwHwflbyqxoM+ZjlNO2GUqO9l9dyurYGlUyDIAv782Zdw3g/KwWe1Ve5LWgkcfX3Lkoe2tAI3bvLbEUtXjQseOoofXf5ByJzN3uVlgWeiHwu2cVRwwtlJE3cm+0OwB8JlXrkWlGtJ1kkT1w8i/6NVJrB/URCyANtT/UihMuBz9KA+9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PA3PR04MB11225.eurprd04.prod.outlook.com (2603:10a6:102:4b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 15:42:33 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 15:42:33 +0000
Message-ID: <225d48b1-ea2f-405e-a5c1-8cbf7633357a@nxp.com>
Date: Mon, 28 Jul 2025 18:42:29 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC 0/2] Add standard exposure and gain controls for
 multiple captures
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Vuillaumier <julien.vuillaumier@nxp.com>,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl
Cc: mchehab@kernel.org, ribalda@chromium.org, jai.luthra@ideasonboard.com,
 laurentiu.palcu@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com, celine.laurencin@nxp.com
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250715235952.GE19299@pendragon.ideasonboard.com>
 <20250716001205.GG19299@pendragon.ideasonboard.com>
 <ebff73fd-292d-459a-9ebe-cbbc6ef2b39b@nxp.com>
 <20250723140009.GD6719@pendragon.ideasonboard.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250723140009.GD6719@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0096.eurprd04.prod.outlook.com
 (2603:10a6:803:64::31) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PA3PR04MB11225:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a66f9ca-7a84-4521-0fdb-08ddcded5e94
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WG1IMDZjZGJSK1draGFnZnRtSGxVY01KTWNET21FRlYweEVtNzdHaWNHQ2R5?=
 =?utf-8?B?NmRUeWRkZlI4NUFwbWptamN0ZGJwVVFLaFcrQ2UzdEYxOFF0bHJLdHp4aTF0?=
 =?utf-8?B?cTZzNlVZZFd3QmFibXE2eHoyeEdqUVlsOUFkbWViUVJaRk1vWmlwdXlZQ3hK?=
 =?utf-8?B?NG9jQkFJcDJWNERYaW5vUExaVjdIUVBtZVlmWXBVclY3VVpUVDBPZVFGTk04?=
 =?utf-8?B?OFp2UVltZTlLS0NhUkduL3pvZlBsdVNLOTVZcURzL3ZxdzZhWkZwOUozMFg2?=
 =?utf-8?B?bVplTUNWNUtSb2dPV3ZzMEtYTXFMeUc2NGdPSC9sUmdjRjBmQ0VpNnJhbnZ3?=
 =?utf-8?B?SXhDSEFmNm5KdU52QlgrYVZqaUhndWZ6NUo4SVh1NDVuOStxLzhPTG1RY01q?=
 =?utf-8?B?eHFBTVp1bitwU3R5RnFWSFI0dnZ2WW84Z29Ub1d5M0dVK2d5eVNENkNITmta?=
 =?utf-8?B?akZ4ZEdtWTcyM1RubGtMMnJhOG9jZnFUTng0bVpsdEQzR3R1YmplSTdFaW9R?=
 =?utf-8?B?SmI3QXVnSzMyaUhrSTRXaWdON1dvMDBuT2dLZkJ5T1lMV2xVRlZNV1ZWT0Yx?=
 =?utf-8?B?eDMyMW5VNEhYVFVsT3VIbDJpRzhUQzljemFXYkFhYy8rSEFyR3pDeHJ5MExS?=
 =?utf-8?B?cWxMTGUrZmoxS2FleFZZbFFWTXhYNnJuNE9VR2xZbWowTXYybHVoWTNDTURS?=
 =?utf-8?B?SG0raENndjN4WE1sSFhFWTNMU0tCV0tEdmtLbE5RVjNpQWt5MTRUTDQ3aE9l?=
 =?utf-8?B?TUZKb1hyZytmSkh5N00wYklSYlpsd0hhU3JhdXVMaHRMN3FibDl1N3FQWVRh?=
 =?utf-8?B?clp2dVBzK3paWEx6RGFiVDgxQzZXK3VBNG0xeFFjTm0rR2NzRGdWZWhkRmV0?=
 =?utf-8?B?OGdKWlpsQXRrUVgzSC92b2lReFloMzliNTl6ZEZPUUR4Z3NEb0xIRm1TbVBH?=
 =?utf-8?B?bTlxRDBhL1pmaEo1Rldja3NJMHZWTnhuS2ZZMEVrVGRFL2gyYzZ6VWI1N0hG?=
 =?utf-8?B?ejV0ajNoSWdxQUxPalBteG16MEFqL3k4bjM4N1hGY08wWmNOMURKUXRCZyt2?=
 =?utf-8?B?T2R6bmtsQU95b1pkMHk3N3dvVzYvVXM5R0xuc3F0OFplc3owLzNKS0luR3Yx?=
 =?utf-8?B?czhuM2E1SjhTTWhMdVplSy96QnYxNWhPdnlLeTVxR3lPdElKdDkvMFNWZ3Vm?=
 =?utf-8?B?Mjh4aWJGYnR4OVlXVjNJMEMzejgxZ2dmaDBJS1B0WVMwUGtPVzhJTkRSTVJu?=
 =?utf-8?B?c3p3RTc3clBPVWZHWnJBOUo0YWp3TGpnd0lYWjNweDB2SnkxVThlZWRTUk1L?=
 =?utf-8?B?T0VMZlhwMzcySFlOY2ZMRC8vVEwxVWgwTHVocmpsdjVDQTJQMnJYWWxQdnVv?=
 =?utf-8?B?WTBwUjVncjZxODh1aktMbFlRYWtEZDdpVmVHNXpJcEJUckFiRGlWVzZDaXU5?=
 =?utf-8?B?bXZmaVFGS1VwVTQ5d0FhSVgvamFEaUh2V0g5YjU4dG5JSVJMVGszcStRazRk?=
 =?utf-8?B?UjBpQmkvczFHSmJDbjhQeWFCVzVrUkVISUpTaU5ZT3VGRXRCUDVEZTNrQjQz?=
 =?utf-8?B?MndYcFNiSHU2VkxVaERrMVYrMTZtMlBFejZEQmJTUzRiTXpyaWNWT1BpYWNv?=
 =?utf-8?B?WmxuYXBDV214dTkzZUcyb2xjSVFoc2NlQlozbGIxTmpkb3B2bmYzbmFPTXVC?=
 =?utf-8?B?MldZVjV4TWJUZFBEUmFJSm1WYk1OSmNCQjVXcVE2a2l1R2FTb1M2WDRtOU1i?=
 =?utf-8?B?cFdCMXZrb2N2NjBNWE5Mc280aHlzenNwSXlyNWc5cmhKRzhkYXhKNUtPR3FX?=
 =?utf-8?B?RzFLemVqRVBuSnJoK1ZaNjYxcytSMmFXaXk2V2ZicGcxZm9mWFBqZEl5Q2ZR?=
 =?utf-8?B?RE9hYk5SQkJMWXY2Z2toTGxNb2ducnY0OG9lclc4WmZqVm9wRmF3SHRid1ZV?=
 =?utf-8?B?ZkxYU2lrbTBIS0RVTHZuS0dQbHFTUWp4RkMrNEVZRVBVcTAvbkkwa0o1bzhV?=
 =?utf-8?B?RGRKV2pRT0pRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NE9COXpLQWpYM3Q4cno0NWtWbU9rYkZwRWRkTzZmbjN3aFlqTjBPai9jcFht?=
 =?utf-8?B?YUt5ZGl0Qzdwb2NUc0NQNTdMQmtnazBZQnY0ZGo4Z0QzbW9xdUlwVzdEa1Fj?=
 =?utf-8?B?MXpqRlFnYVVDZk1WWWQvNjVhKzV6WFFucUFZVUZWVUZybTQrZ2E4RUYxM0JW?=
 =?utf-8?B?OU9TaW0way9WMzFzSEFlMDA5Qm1MSUxETVhNdmdCQ0JFOER3b3lCdnJ6b3gw?=
 =?utf-8?B?d0dELzlnZDIwOWhESWhTSWhhTGFhQmpac2g0bitrclRrNHhFMTVEbCs5Smtn?=
 =?utf-8?B?SkpvdVJ0TjNUYXdHMkt3OGZLZDlJUE1vbW1TMXFCZjYzZDVFZTR6RFVCeUt2?=
 =?utf-8?B?QWZjUnRrKzFTM250TnJoNDFsVGhRNU1ML0VqMWY3WjQyWGs0SktnWWVBU1NL?=
 =?utf-8?B?YTNMZ0g1VEp2R0xXWE9iMFF5QkErUGI2cit2SWJyajV6a2pFZTBDdCtwdXgx?=
 =?utf-8?B?TjFYbjVpOVgvb2tZY00yb0RyRGtSWjZwLzlpWWlaNnFHMGVSK3RDbHhpYytI?=
 =?utf-8?B?WUFhTzRoQVplUnF1Q0J2dkNCd3dJNTFwOUpwUG5yRDIvdGNTM29vSlIyMVd3?=
 =?utf-8?B?M2JGcUQ4MGs3eDdtQUJrcXdvTkVEaWw2aFdsZUdJMkNKMlNvTmxkalEyKzd6?=
 =?utf-8?B?OUpwZkFmVUpXY2d1QjJtaUdETGEwTXNWUlFGOFc0WEY4SVZDVnREU2pKSnFG?=
 =?utf-8?B?OThKL0hNUitiMGN6M0pWcUMwM1NsaFhYUDI1TTFwVU1NRERmKzRtR3ZQUkRG?=
 =?utf-8?B?aTgvNWVqMlRKTm82WSt0T2hwUXRSLy8wWlB0SzBTYWFqa3oyY3hDQk5BbkFH?=
 =?utf-8?B?VmtUVGRsdlh4Q2xCd2Q0YjhXbm9wRkpqYmtFbTMwR2MzcE0yN2UrM05UbTMv?=
 =?utf-8?B?QzBlQmYxRVJrbFJkdC95TEZsM3NuUWZRalNrOXpCOUxRZXhXQVN4YnZVemFu?=
 =?utf-8?B?RW1NWGpFdklNMk50Z21QUzBmVjVpdDJRYzYvZUI3d3kxclkxRlRrTCt3ek9x?=
 =?utf-8?B?bzlWK2x6STRSVm5wRE9saVdlMWNmMlRGQnVSUW1McGRSam91SmFZSXJYL2wr?=
 =?utf-8?B?TU9Lck82Tm1aYUc3a3RmTnBmcFBTV3g0aTNid1hqeERWVDZqckNSbGY4QnZL?=
 =?utf-8?B?YzhCZy9uUVhmMDNCVGdkR25VNWZpVFpxbHV3RENlaWQzb29Oamx4K1Z6cmwy?=
 =?utf-8?B?U1FQR0JITUcybUhRWDQ2ZjZtdWJLdHRVWFpwbEM1K3RwR2lDQnZGeHhscTVp?=
 =?utf-8?B?U0Z5MG1QeFFvcUN2Nk1TTHAybFBoUGpuTHN6amwxbVREdUg3N2VPOXFLTEh0?=
 =?utf-8?B?d1NibkhPVk1mTENvdWxwV2txZGV6bmw0RCsrWWpiVmFSbC9PaklUVDB5R0VT?=
 =?utf-8?B?ZlpZOFNYdEtVbHBXYm1CbnVQTDRGZXplK1JzNHFCeWRYbTJjSTgrd2o5dFBi?=
 =?utf-8?B?WU43a2x2RnlmVDhWL0hCOUU2WFJqRlhMblN0V3ZNb0cxVGVVTE5WM3ZidENG?=
 =?utf-8?B?TzVFSUg1RHJqdzB0dzBrSXRFT0Q3L3E2a3ZFbi9MSVVVZVBVV0ozRmFBd2dh?=
 =?utf-8?B?NEV5dVdHbGFpaXNZUXUrOHh2enJpRzhKdzF0dkdGTHpGbDRZK3hWckFVV2ZE?=
 =?utf-8?B?TUdWeWh3TU9IVkhHYnZ2OFpEOHhJR0pXV3AyY3Rka0N0Wkt2a1hNSzFVS1Zr?=
 =?utf-8?B?S25PVXFtUUVjYXZwTlovbkt4K2JsRVZ1TjBLT0JYSWp1K1FJaVpLeU9Hczkv?=
 =?utf-8?B?enRtRVVMdkJQOXFVWEVWSFRxQVJPdktaQ2wvQlN4U1RxUVdkcmVKZzM1L3Qr?=
 =?utf-8?B?QWpvU01pWjgyZk9zTG9wMWlXb2VGVm1IeUVaOFR1MlVEaGF1UXMwZ1R1UGxi?=
 =?utf-8?B?MXQvZkdjU3dwMkFTNkhzMmZkcHUwVmN2U3hBS3VBbnJXMDJBMnFuZWd5TGRt?=
 =?utf-8?B?a3BqNzZ6Nm1icERESEI3Ky9yLzRKQ2NVQW9vYjIxYnErWVVwaU5FYXBkU2xZ?=
 =?utf-8?B?aTllWGJBTjd3VjRyYi9QZm11TC9RQ0pza1N3TVg4ckdiZEx0eVRONVZaZVJm?=
 =?utf-8?B?cVc4SU1RZkR4VllmNkdQNmVtd1RtTlo4Mmp4QnFjdWVKRE5uWGU1MC9pZXVC?=
 =?utf-8?B?QTArSU1Ua1IyUVNFeHJmVjl2V2V1ZzlNUUVvV3pnOFp5UjQ3b3FlLzhzVEhw?=
 =?utf-8?B?Z1E9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a66f9ca-7a84-4521-0fdb-08ddcded5e94
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 15:42:33.6237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CiQPJVBj7BCfpyFyWjCaFmajwvHc5nHun99sr5oX9NEQlK1jmpRQp2JUcOPR7Vim/MwMHCAeEwjOpL6XEtdtWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11225

Hi Laurent and all,

On 7/23/25 17:00, Laurent Pinchart wrote:

> 
> On Tue, Jul 22, 2025 at 10:46:16AM +0200, Julien Vuillaumier wrote:
>> On 16/07/2025 02:12, Laurent Pinchart wrote:
>>> On Wed, Jul 16, 2025 at 02:59:54AM +0300, Laurent Pinchart wrote:
>>>> On Fri, Jul 11, 2025 at 01:05:42AM +0300, Mirela Rabulea wrote:
>>>>> Add new standard controls as U32 arrays, for sensors with multiple
>>>>> captures: V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI and
>>>>> V4L2_CID_DGAIN_MULTI. These will be particularly useful for sensors
>>>>> that have multiple captures, but the HDR merge is done inside the sensor,
>>>>> in the end exposing a single stream, but still requiring AEC control
>>>>> for all captures.
>>>>
>>>> It's also useful for sensors supporting DOL or DCG with HDR merge being
>>>> performed outside of the sensor.
>>>
>>> Regarless of where HDR merge is implemented, we will also need controls
>>> to select the HDR mode. We have V4L2_CID_HDR_SENSOR_MODE, which doesn't
>>> standardize the values, and that's not good enough. At least for DOL and
>>> DCG with HDR merge implemented outside of the sensor, we need to
>>> standardize the modes.
>>
>> For the HDR-capable sensors with the HDR merge implemented outside, the
>> short capture(s) are likely implemented as separate streams, in order to
>> match the raw camera sensor model.
> 
> Yes, that's my expectation. They should use a different data type or a
> different virtual channel (I expect most sensors to support both
> options).
> 
>> In that case, the SDR/HDR mode switch, when supported, can be done by
>> configuring the sensor device internal route for the short capture stream.
> 
> That's an option too, but it won't allow us to select between different
> HDR modes. For instance, the AR0830 supports both DOL (2 exposures) and
> DCG (2 gains). We would need a way to select between those two modes.
> 
>> You mentioned the need to be able to select the HDR mode in a standard
>> way. Could you elaborate on the foreseen usage: would it be to select
>> SDR/HDR operation, to select between different HDR sub-modes, to inform
>> user space about HDR capability... ?
> 
> Both. From a libcamera perspective, I want standardized controls for
> this, to avoid sensor-specific code as much as possible.

This sounds complicated to achieve, at least with the one existing 
V4L2_CID_HDR_SENSOR_MODE control. There are a multitude of modes and 
technologies used around HDR sensors.

A few things we can handle with existing API's:
- number of exposures (the ones that have a separated stream)
- bitdepth (by mbus code, can give a hint on compression type)

There are other aspects we need to offer user-space some controls on, in 
order to be able to select the desired mode:
-number of exposures, even when not exposed as a separate stream
-number of captures (which in some cases may be different than the 
number of exposures)
-type of gain, or number of gains (DCG, LCG, HCG)
-type: sequential/ staggered / interleaved
-type of companding (none, PWL, other types?)
-LFM indication
-LFM replacement enable/disabled
-SPD data present (Split-Pixel Detection, as LFM enhancement)

For ox03c10, the sensor hdr mode can be determined by these factors: 
number of exposures (dual/triple), staggered/unstaggered, companded (pwl 
20/16/14/12)/uncompanded, LFM/LFM+SPD/none, with all combinations 
possible. HDR data is on VC0, LFM/SPD if enabled on VC1.

For os08a20 there is staggered hdr mode or sequential hdr mode (via 
context switching, up to 4 set each group having different exposure/gain 
sets). For staggered HDR mode there are 2 possible output modes: on 
separate 2 virtual channels for long/short exposure, or on single VC 
with dummy lines.

For ov2775, besides no hdr(either HCG or LCG), there is single exposure 
hdr (DCG) or dual exposure hdr (DCG + VS). The DCG data may be combined 
or not (HCG+LCG). Compression may apply.

I'm sure there are a lot of other fancy HDR related technologies around.
Do you think this can be standardized? Up to what level of detail? I 
think most sensor drivers will only support a limited number of hdr 
modes, out of the multitude supported by the hardware. Parameters that 
may be relevant for one sensor may have no relevance for others.
What exactly is disturbing with the current approach, where each driver 
defines the hdr modes it supports, and what do you expect to have for 
libcamera?

Is this standardization talk something you would like to conclude in the 
context of multi-controls, or can it go as a separate topic? I propose 
divide-et-impera, conquer one by one ;)

Thanks,
Mirela

> 
>>> Can you tell which sensor(s) you're working with ?
>>>
>>>>> All controls are in the same class, so they could all be set
>>>>> atomically via VIDIOC_S_EXT_CTRLS, this could turn out to be
>>>>> useful in case of sensors with context switching.
>>>>
>>>> Agreed, we should be able to set them all. Are we still unable to set
>>>> controls from multiple classes atomatically ? I thought that limitation
>>>> has been lifted.
>>>>
>>>>> Each element of the array will hold an u32 value (exposure or gain)
>>>>> for one capture. The size of the array is up to the sensor driver which
>>>>> will implement the controls and initialize them via v4l2_ctrl_new_custom().
>>>>> With this approach, the user-space will have to set valid values
>>>>> for all the captures represented in the array.
>>>>
>>>> I'll comment on the controls themselves in patch 2/2.
>>>>
>>>>> The v4l2-core only supports one scalar min/max/step value for the
>>>>> entire array, and each element is validated and adjusted to be within
>>>>> these bounds in v4l2_ctrl_type_op_validate(). The significance for the
>>>>> maximum value for the exposure control could be "the max value for the
>>>>> long exposure" or "the max value for the sum of all exposures". If none
>>>>> of these is ok, the sensor driver can adjust the values as supported and
>>>>> the user space can use the TRY operation to query the sensor for the
>>>>> minimum or maximum values.
>>>>
>>>> Hmmmm... I wonder if we would need the ability to report different
>>>> limits for different array elements. There may be over-engineering
>>>> though, my experience with libcamera is that userspace really needs
>>>> detailed information about those controls, and attempting to convey the
>>>> precise information through the kernel-userspace API is bound to fail.
>>>> That's why we implement a sensor database in libcamera, with information
>>>> about how to convert control values to real gain and exposure time.
>>>> Exposing (close to) raw register values and letting userspace handle the
>>>> rest may be better.
>>>>
>>>>> Mirela Rabulea (2):
>>>>>     LF-15161-6: media: Add exposure and gain controls for multiple
>>>>>       captures
>>>>>     LF-15161-7: Documentation: media: Describe exposure and gain controls
>>>>>       for multiple captures
>>>>
>>>> Did you forget to remove the LF-* identifiers ? :-)
>>>>
>>>>>
>>>>>    .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
>>>>>    drivers/media/v4l2-core/v4l2-ctrls-defs.c            |  8 ++++++++
>>>>>    include/uapi/linux/v4l2-controls.h                   |  3 +++
>>>>>    3 files changed, 23 insertions(+)
> 
> --
> Regards,
> 
> Laurent Pinchart


