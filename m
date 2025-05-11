Return-Path: <linux-media+bounces-32247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0212AB2A79
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 21:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 536991891094
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 19:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6028B25CC64;
	Sun, 11 May 2025 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sb+WC185";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I8dKywMf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7B016CD33;
	Sun, 11 May 2025 19:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746990468; cv=fail; b=mLnBOL/Tcg+bNYBo/J1PQdyqfsVkCob9ZSG2oAnQ6PE8wPG948HnBWA1iSUveM7Doit80z57Pt1/4HjmWpO7giBGTnTiLsi1tNF6MR+jYb0q2XH9AhWyhUaM3X4ckr3vTi14h22YS+ulk/ctAM/LgiY7W+j4SgwZ11P2t+EHiLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746990468; c=relaxed/simple;
	bh=Yg88WHDAhY9q07rkwfdrO7qaQDH8lwgrfQLZ6zqVvxE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vDXOMOnPuNUaZssI3400Z40SNvi6P3QrXhM8UpkryF5TBBJKQI0/v0YgZwoDQr85ENSTfwyDGcN1KakxyhHObreY2YuRss4dF+d/z6MS/6GzADWPxSVv+PsRHx9MG8bA0LtYy8fl9S8kRAlovCSz+3nJ7ddpkZaAyNbP/GLSdRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sb+WC185; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I8dKywMf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BI1bvV023317;
	Sun, 11 May 2025 19:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+2JjNtuMfp/OhUGaIktGvrGWwOW8s0gOkhjkTvds+DY=; b=
	Sb+WC185x/LWbzjxhSJPwuMuF1RlRCXwoQ08zigqMd59KYcpMdKj7E2tKc8EkUlS
	hcQsi7fjbHUePDuwNO/tZabjWCa7oJZm5jpNvtbMT+/g6Rzy/mQgLsHCn3zVqHIh
	xBmqUsQ3Iawg00hIc0wM8Tluou5lRQQWqTNb/8Qyl7fHFf5wCs468/5Dn1nSulQm
	wAOJL1j1xcxjcFRpPj9vra9ZqQc1eOL2y/NKyLx9yrPhF/m980+jLQkzMqvNutQp
	TaRZn3YP+Q7ZHs+1BngabARGvs1Pe2PP3SO+fZ65ZihptmJxFK5JPsBheQ8hv41H
	CZe5ISq245wlLpBTki5UcQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0eph8hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 11 May 2025 19:07:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54BFGqFE016086;
	Sun, 11 May 2025 19:07:17 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013075.outbound.protection.outlook.com [40.93.6.75])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46hw86nwdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 11 May 2025 19:07:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPB3FNlrJ00pTxDL7gMo9wsRwLulQU1y1d1ACsJ4RSfvugrFJz4x6FlvL3SPfnQ0c/TwkCOFmuccaqxGds6Bliyhr7j8REnwjU+vIeVkpKc8EACQ85rdk7qmPdb1+dmo5s2T5Yg/Za9pZ545obfqI4xAR8x17KMuKP5zKZD5i58F6veI/UYvyJNiuKJxMg+NMBcrFIqEJt9XIRZ+dyUwoP3tzC2oQTvSRo6Isn9ZmxT/UlSfMq2gim+sO03BMT4HILAdvtDoIlJ6mvxjf2EIP3233W+t3VV/K9UM1LYbfIsMSWtuL7XjacNHi9fl7jpMV6C8zCt9sKmmy/+d/6bQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2JjNtuMfp/OhUGaIktGvrGWwOW8s0gOkhjkTvds+DY=;
 b=lB6vtitRE8YMmQrenUYUpolUgsB1OAFw3DyOQExG/s0+SH381KVth9dWKlY4eoCQa8Wwhd0/DzCpYSUhN/pwWw934qBgvMfnvVMVH08qd5HsniKd67lbK4HVDTy4w/6IZIHpmo58AkpVKkLWVStrlMzqjgqjGe+sdWGwRrxtRhfydcviOLT8snYH0s07Kfxpn98/4BXf0J1GC3LV5+OuZZmC9Olzpp75ifvio3J9HUVDIcOZ7i3oWeim7tJFQlIlJa+uzk+iredw19q/wgvAy4yoIufMCUOY6+wnidtL58Jv0Gw0MwOnaewzOVNhEIPUz6XNIUKwvWiRbcGWpNKvfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2JjNtuMfp/OhUGaIktGvrGWwOW8s0gOkhjkTvds+DY=;
 b=I8dKywMfzlW2zLpqD1Zkd3tJJHDAk/dSCp8ntlduhaI/x37/DLGpl0ozNhMj2AbwpQI0nKkZaKVoFfZPpxQnoTc4Jj/CMCJINP7pn8E+v7ChpalGm7Rmf86W6oXAbD2Ue6ksH0reCl7kmSf0yBuNonYjqDHlCNVmklrI3i0NJGs=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CY8PR10MB7377.namprd10.prod.outlook.com (2603:10b6:930:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 19:07:15 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Sun, 11 May 2025
 19:07:15 +0000
Message-ID: <10d2ae58-8da8-4802-95be-951d8b376551@oracle.com>
Date: Mon, 12 May 2025 00:37:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] media: rcar-csi2: Add D-PHY support for V4H
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
 <20250511174730.944524-5-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250511174730.944524-5-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0023.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::36) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CY8PR10MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ae0a15-a26f-47d6-08dd-08dd90bf0ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NytqdUJqOHlxNzRKZkUzOGt0a2RCYy9lK0FLZG9jaTVwdE5SaCtMdnlDNzBK?=
 =?utf-8?B?SjVSMHdKekJoekpiTmRpVGhaS285ZEUrWmp5TlF2RkVyRDYyU0dnUVlXNXl5?=
 =?utf-8?B?eUtwbCtSKzVpeXhMbkdudE1CcnNSRW8zQzhKRkRBcVJPNW1uaWNPVXdyZkhp?=
 =?utf-8?B?cUFHSHFqWURqVVNEM1AzUGY2QnJQU0g4NUpwcFdQcm81QjV2OXEwMWtJUExi?=
 =?utf-8?B?QytTd2EwWDZCeFBQWHQvbEtwakgxYy9FZE84S29tcTVldzNmRlRUUnJTWkxT?=
 =?utf-8?B?Yk1BRUFONmd2OEpNQ1lWVTJlSGYxVEhlOUZ5UHZhZ3FURTZwK3l5d1dpaWpL?=
 =?utf-8?B?cFRqTVVnMnlXYlFKWC9BZ0w0QW51SHppMXJoU2FURGZNazByR2FjeTdOUXJz?=
 =?utf-8?B?OURlelIyMm9waTN3MmdLQmJjRUpDams5NXRqYzJnVUYwd0ZBaUY3akdBRFJS?=
 =?utf-8?B?dDRKNERLdEY4VndNbFd6Z3FHaG9kWE1pUzE2R0YvVTFhdCtsOUhvdzVkd2lz?=
 =?utf-8?B?cEw0VzZRMzNyUlk3Mm1PZW9BRGNrMW1RVU10YXA1NVhBUkZCUDVpakdlclNG?=
 =?utf-8?B?aGVhZFBrSmc3djRDenlXbUJaNktIcmtDZ0NMUzVGQzhRa20yc053cXVTU2hh?=
 =?utf-8?B?NSs0VmdobTRVTDNuOVgvN2srWlBWeXc2dVVlZjl2YWpYd3hQbUZjYXlKUWdv?=
 =?utf-8?B?YXV2bGtLc2VkZm5YT1RRbHYwMHBQenVaeXJnV1F6Nm0rNDlUN3ZhUThEeWNv?=
 =?utf-8?B?dmNLM2lzTFBIOFNzU3N1d3YzZFcvK0pRK3NxZk15VHNKcnRqTzlRVDE5Vlhu?=
 =?utf-8?B?T1l5T3hlYUtHU0R1QWZzbU9WRWo3enFzS2htM0F1RTdzU01QcEFmemE3aEtD?=
 =?utf-8?B?TG41NjNUK2QrQm03aDZtV1hEM2tBV3diSytGVlpJWHRMT0NaRFBQU094bEs2?=
 =?utf-8?B?ZDNNcXRFOHdDeDNJNlJHcnNldGVadDFhN0ZtZjlpd0dmcG5jbUZxbUw2Vlhm?=
 =?utf-8?B?OVNETWpSaitLZXhiQ0JKWER0T2ZwZzNycjdIbmdXQVg0bEcyeG5YZWljTTht?=
 =?utf-8?B?S3pwanVpZEhFLzgzMlB0NUJQYXp0cUZvRVE2MUdyVHlYZ2NycDRtbGNjQWlq?=
 =?utf-8?B?eFBUUHZobloxYWJlVmpnUnJpOVdpSlNsdzY2UHVkNHA5OHE0NTZHaHZ4NGJ2?=
 =?utf-8?B?ZDJOK2d4R2dWTVNWbis2ZjAzWUNHTUpEbDVWd3ZaTngxb3Mzeno1Wldoam5V?=
 =?utf-8?B?c2JNSmNBOWdvT0ZCUDJGZWxBN1N0Z0ZPYnhQRFM3U0NCNWNmWG9ONm5WNjBl?=
 =?utf-8?B?bDc2NWNrS2tDZlFaUUY3NXk4aFhkMG9CUlZzVWVFKzF6VzFCZEJZTGFKODFu?=
 =?utf-8?B?WkZaZ29RV1hZSkhoVzA4RUNLUVlWd2VGYmFzalB6anJYMnhMamVDUzRoWWlv?=
 =?utf-8?B?b2pwdVRMZUxOL3MranFBZ3gxYmgvZU1neHZPLzlQaXAvRHRhNGdNRlUxN1Rx?=
 =?utf-8?B?UE1OMDEvT3BnK1hVN29VbnZpWm5CK3VRVUVWemhXM0VpVnRJYS8vaDgzNFhR?=
 =?utf-8?B?MFJyU0ErcEtpNVNZNnBGOVVaamkxb2tmN0t5Wm5uTlI2eDNQaXJuUjR0Qkpx?=
 =?utf-8?B?aXJ4NjFFbWxybUsrais3TitncnRBZC9kNEhrdDlmdzNKbjVSZENVakEzN3ky?=
 =?utf-8?B?UjZjd2RpdmNyUi9WaUloSFFLNEVTcnhzZytIOGI5eVRweGlLMkp0bzRSNllY?=
 =?utf-8?B?Ny83WXpYOGwxUnZtM08rcHJIYnk1aThrT25rL240WGRva3UyMWd5YUtYempV?=
 =?utf-8?B?dzlWTk14UHZ5VURjVFJMcmEvOEExc0Q3d2lBTkZwc3lvYkpFNCtQKzE4Rng1?=
 =?utf-8?B?aWQ0eTBHL0YzUG9SeWIzN3VrbDlwdURDOWtrVW1FRnBNVUlYK3VCOStYeFVn?=
 =?utf-8?Q?30DxrR41Eao=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2FyZGI1M1h4VGdlZ3h1U1FxaTNjOWp4M3dnYnR3OWUvcmRqa0NlTkNFWlhZ?=
 =?utf-8?B?T0d3M1BLTktNUTQ5aE8yaFQ1bzdWMFhiL1BwUmRWWCtwMXJHR1pYNmxZRHJ4?=
 =?utf-8?B?OVNWVHZKTlhZdnZITTAxRWJaZ0k3UHlZWmZ2cGQwdlBIL1Qvcm00TnRVZUls?=
 =?utf-8?B?cDdTSFdBUkZhNGwzeHJMN2d2QjJvOW1HQnJZRjN6V1lvenpuTVRBL3lhYkYr?=
 =?utf-8?B?K2d6cVRBOWNqazZaSGt6ZlNab1RMLzJTMllYL2hub2ZhMWwzVDdtMVozY3Ax?=
 =?utf-8?B?ek9BUS95UnkySmpGQy9TSzh0bjU3WnVuOGwwRW9CZHZIaldmSlA2emE1NWRX?=
 =?utf-8?B?amFDNlpDa3BQUFcwSWYxWFZ4ekRZclhFZnVsaGhOZWZQd2J1empnaC9xY3JT?=
 =?utf-8?B?YXgzVUp3aVVYdzIvdTlDajdYS0pmY3huMGZOWWdpeVhCTk1KOFVlS1ZBb1l3?=
 =?utf-8?B?UHBUSkRNUExyVjJ6czFYdUFHK3lxSEJVMzdSVVlKbHZNcHVQdkppV0JFbWRL?=
 =?utf-8?B?REhWdVdwVlJmNnFVMUNSYUFMbDc1UEdKajNaODhkSU9hN3hISGR2d3A1NjVu?=
 =?utf-8?B?WEpzekozazBKdGU2OXUvQWc4eXVtMHU5dTBHR08ydnJERWxJWHB5Ty9HZDcw?=
 =?utf-8?B?YzA4VEhhM2ZmdGt6eHZoWUJicUtwNFc5RUxwWUcvaU5zclBnVlQ2VThVbnFa?=
 =?utf-8?B?RGM0S2lDUlRLd1RLNlA2RlFtYW1nNFdlc2lZeFgzWlkzN2drd3RDbTlaSmlI?=
 =?utf-8?B?cnNaYXlib1pmSG9DSE90aUlFMW1hT250bEphRllnYmZPcDJRUjZSUHZZSDdv?=
 =?utf-8?B?SGppVDJ1bGxIZ09kVXp1Ri9Fakw4T21zNTdrQjRQbWg2a3FyY0VOK3NlYUpa?=
 =?utf-8?B?WGFDRjUyQ3cva0F4Y0hkb3JSRWlOSUl0aEx4L1Z5VGUvMk96ZjZSRDRNcVpN?=
 =?utf-8?B?LytERFRXMmRycGFXZTFsaGFza2Y1WThiTEcxMW9NK3lhdU1rVWsxOWlwa3BF?=
 =?utf-8?B?U0xBY2ZQSFYzL1hXNlJVaTlodzZVb0pGeWg4SEJDb1owcEtvRWM3YUFmdUY3?=
 =?utf-8?B?Qnl0VHUrVVJZdU9INVM3KzB5cXc3VDVwL213cGpDVXFQR1Rzc0xHcDlVTFdv?=
 =?utf-8?B?Y3lmSDI4THB2d2p3RnZzT2dyZUJpVTVMTk1ydDhnb3YyMG5hTURXbVQwdkVM?=
 =?utf-8?B?WFVjRkY5REhjL2Z2UG9IcU5oakJ5VitUbFNYYkMwR1NaaHcyRlA0ZzBIeUlU?=
 =?utf-8?B?dUFlMWZqNytoNExsSjhNUC9DdHVEeGkrVzNxMnNBVVpjUTJLSXFOdXl3bVZ0?=
 =?utf-8?B?Z1lLSEE5YXQ5WDRHOHpvK25RNnorVHJNaE52Y1krNkdkaXZmTXJzZ2l2bEZs?=
 =?utf-8?B?THZ2VHJWcW9iZ0U5TGpOM3N4a3JyMDRTS0tBY2tqRUljV1RuczZSdXZlNk9k?=
 =?utf-8?B?VGE1RDFTWE9YeEFaMTR3ejRONXlncU9Db0w1Y3RERm02TUJ6TjJ2cFJFMEl1?=
 =?utf-8?B?bFRHeDhqWTZNUmtDdUd1VmpocjM2S3BOblBkajAyZnVERDduSU1mZkRyR3Vv?=
 =?utf-8?B?ZE5ka3U5cExzT2tqclZHSUNaQVo5Y0hTZHplZVRIMUhoYy95WUF6ZVJLT1Ey?=
 =?utf-8?B?L1VNSmNaT25zYjF5QnRmRXA4aHF5S1BuOEs1RG9obzhJZUFkeVRSbU5HanNh?=
 =?utf-8?B?eGxkS0pGWUh5Q0VPSkkvc1Q0Q1dNeG9kLy9ha1E4dWtjWUlVKzRvUm1UQTdC?=
 =?utf-8?B?TDdxUktrUDNRWFFYcGZHN044M1h1UC8rMHJPbUFoR0laamk5RlEzSlZTMXRr?=
 =?utf-8?B?dTF5a0lQaXM3cnROVTJjNmE3Rlo0SGplbkRDdG55QzhDYmFnMG5sZVhYUXlP?=
 =?utf-8?B?U0FkU1JlSHdqaTFoMm1lTmFJMmtudEE0Q2wwcU5MVVQvNjhuQUhuNisrMlBm?=
 =?utf-8?B?dVBoci96VnBKWUQwZkNRdk5QV3BaS0VUOXMxSkQ3b3VVQ0YxMENNU1l4RWJs?=
 =?utf-8?B?Wk1oMGI3OHh3WmlwczF4a1pHT3FVc3FzWGlDTHp5eUs5d01oazdDNzhkMnUv?=
 =?utf-8?B?UlZzM1hhODZIL1BtaUJUWmxNSTRjV3ozVVkzdUxaeG8ya0psK2FZakVrV1Qy?=
 =?utf-8?B?eGFkejBodWFrRkFoTGpYN1hwcG0rM0JIYzBkQkp6OVluUWdGamo2TXV1d3lK?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7VfBpYiznDJrbUZtXomNEC6+LNYjUA5X15iTuOcQH+O/7VQyPQ3VkX0NPeFXcGDsLcJw2686v2K5YQtCAW6up0LlIUi7g7CiPCqDWzFtmSTKmZSW9eFKqf/CgRFw9G1aXiXioLzbx4DYOBNFxEcdOIy7gwNim/eUZTGb6qDENde2nGFjUOUz4J9ubaylMhYhRPMCiVN4gp7GIdPB11FijlILkjOqvMeUMamhRXsUWkTUtOtNEnjeGrXf2Wt8JN6Res2ZjCNacyUPPKFzf/Mzqr3EGP3KO8bOLgwKzZ5reMtjLhrBqY2ZU3Np5ttFznJYrvIgQLQBh2vgX4qQcFae6Pm9jGdg4mqkNGSuWKXq4oLhmm9aWqu9yNnh1iiyKLUrA56zJObjDK0ZNCaTp1YWYLNb4lpj+JLNhfDHyVA/vxiJYz4TozOkma8/k2fWh1CdDiD8/obmqAxZaBEw2CfHeO0ow9xKzuLO/3w3SXGddqsIaJx3AcUMFCbnHFrmB+OOofmoSEsDqCiOx+HZkBWgCOx5j3u1AaeRLju1kZwkm0BRZULYE/LxnvXwIa6ZAsLL4rEKm3t7M6d4jvB/rVp2iZr0DcrWTvt9blj3RFAbaaU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ae0a15-a26f-47d6-08dd-08dd90bf0ac7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 19:07:15.2066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Boamyhou7b94mQlKu23jAcVhl1ySgt2n1ji1UHNbYWGhXbLGuqxLckoXpxBJtF3u9YS80fRkrtxlpxS5TUlTCffgUE7wK7aOV5l+CmEug/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7377
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505110201
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTExMDIwMiBTYWx0ZWRfXzVln6x6EECG8 rSSwDbAdZNF+TgA08ZeIvt7C7J7QwFGRGZum6NXMc9jAYDEKu/V7VM38e439Em+ZtZGTFdVKi7y 9o4Z/Xm+worhfXF7KhROZj8XkuJDCaCVCeAf5dc5das8Swle3k3998Ae/ZJWh7N4FdreiRyvCr+
 M+AUfTg+gqmuaDbdAN+VvRUAvrwQAZb0J91rql5mPDiD56wrPGXQb+iCtaUEYS0XY2PRoLKLaWf yoQVzmF1od5Znw2cMgWjJ6YEMxjWB+JEJ0IbzlglntSqL+plimHHOg9wp7RjwtUrw7Kqe2SEunS hm19GiQ1krvTUhC4Jp/V0ctd36sVDd9dNeohXNaSVEU/APSUQvITWYQIOiqdYkTmYAA6ptWv5WJ
 7SRbEzZlofA5O7k+/eTkpzPQ9iAffDBDY+RZzPxh53qqSxV31JwvPLZbcofAIo1xt2E4/d2Y
X-Authority-Analysis: v=2.4 cv=DO6P4zNb c=1 sm=1 tr=0 ts=6820f566 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=OaehxD-sZR5X1R0o8oIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: iDtXxVsYGkhG0hVELUR8lMzQE9NSUNAN
X-Proofpoint-GUID: iDtXxVsYGkhG0hVELUR8lMzQE9NSUNAN



On 11-05-2025 23:17, Niklas Söderlund wrote:
> +
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 5), 0x0100);
> +
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 6), 0x2d02);
> +
> +	for (unsigned int l = 0; l < 4; l++)
> +		rcsi2_write16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 7), 0x1b06);
> +
> +	if (lut) {
> +		/* Documentation LUT have two values but document writing both
> +		 * values in a single write.
> +		 */
> +		for (unsigned int l = 0; l < 4; l++)
> +			rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 3),
> +				       lut->rw_hs_rx_3_83 << 3 | lut->rw_hs_rx_3_20, 0x1ff);
> +
> +		for (unsigned int l = 0; l < 4; l++)
> +			rcsi2_modify16(priv, V4H_CORE_DIG_DLANE_l_RW_HS_RX_n_REG(l, 6),
> +				       lut->rw_hs_rx_6 << 8, 0xff00);
> +	}
> +
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0404);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x040c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0414);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x041c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0423);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0429);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0430);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x043a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0445);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x044a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0450);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x045a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0465);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0469);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0472);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x047a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0485);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0489);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0490);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x049a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04a4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04ac);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04b4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04bc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04c4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04cc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04d4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04dc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04e4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04ec);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04f4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x04fc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0504);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x050c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0514);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x051c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0523);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0529);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0530);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x053a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0545);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x054a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0550);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x055a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0565);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0569);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0572);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x057a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0585);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0589);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0590);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x059a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05a4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05ac);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05b4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05bc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05c4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05cc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05d4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05dc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05e4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05ec);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05f4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x05fc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0604);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x060c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0614);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x061c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0623);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0629);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0632);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x063a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0645);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x064a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0650);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x065a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0665);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0669);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0672);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x067a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0685);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0689);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0690);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x069a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06a4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06ac);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06b4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06bc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06c4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06cc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06d4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06dc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06e4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06ec);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06f4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x06fc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0704);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x070c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0714);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x071c);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0723);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x072a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0730);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x073a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0745);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x074a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0750);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x075a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0765);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0769);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0772);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x077a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0785);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0789);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0790);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x079a);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07a4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07ac);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07b4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07bc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07c4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07cc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07d4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07dc);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07e4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07ec);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07f4);
> +	rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x07fc);


Instead of manually writing each call, it could use a loop ?

for (int i = 0x0404; i <= 0x07fc; i += 0x08) {
     rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, i);
or if values are not strictly sequential, iterating over the array.
static const u16 register_values[]= {0x0404, 0x040c, 0x0414 etc,,}
rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 
register_values[i]);

Thanks,
Alok

