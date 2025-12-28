Return-Path: <linux-media+bounces-49605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE02CE4993
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 07:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44332300FF94
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 06:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0369D2798E8;
	Sun, 28 Dec 2025 06:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="TKEvagKy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE745219FC;
	Sun, 28 Dec 2025 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766904725; cv=fail; b=H/KFrxzLLRowuyqGzAeZu0bChxJJJmJF/kHCTHrT16g7Nt1X5EKnEmZl+rN2GHV8Kh72B3bzToHN9Ze74FjcSixkbkMeksCGmYbXRXWiXbH/G6QKp0QkqgheVJUlq4KCy8D6H2rAoX/e0os8qAyU3/157en58hE4MNJLJyniz2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766904725; c=relaxed/simple;
	bh=X+QRYBOsGdLHLCz9PBJCMxIgU8jcBZj7GJDe/xchOrk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BBcHTY4aF18m0sAyWDSoAuOz3fZwpAFKJ2o8TUGLHe9/igDu7Ym5plvgPEagqNUGXHdg93X5rAOEu1+SqeUXcrHM1kxKz3j8RemwK8+5ZSgL+8YjT4neOThh9pJhRCqeNwebjnc+IdFo2apxKJm11JJf+wT/Z7/20S7gEKnEdNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=TKEvagKy; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS6A1vv3943800;
	Sun, 28 Dec 2025 06:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0T+jsKY+L+/j+K1MzwjzLqCvVb8CZvClBJyFDVvtXOQ=; b=
	TKEvagKyA+hKXLqBi+W2anAwSoHDtUsrGDIi/01ukT0HDLIYm3pDMu18iQTTr+9A
	YrfDek+lBzZnNowLBzqRnUrVi0RhROjyHTBnxYWSKHXuptBZzPvomotv6iOUaxpy
	Wj9142YL9i35cxWx5ciLK5cn7eiUY5EjDWhZkbPDX2Lhv32ghlOcc2RVCOPzcUJx
	hN7Wy1Akh71NhijR45LdbN7l0i2xRRD9xrYcfi1uQUw99tN/Ixs6gNZG96tuD5CQ
	LW20w+oQmLWH+4Cyy95bB4p7CySWlklW5kPzysBUhhNPWfZ/9kgNMOEMBwLHfFyb
	9vRM1pYmyvCzYFiYvy7LhA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4rqr4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Dec 2025 06:20:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iz+RyVJOKOlwRgfZ9TsTICpfeOLRfxaR99Z6ccpVw6ZGmErKWLPYwdb8vgODbdHXBRtqHn99DMCDEi1Jm+T40de5eW0HlOFrpq4ceRB+n4h3LjRYaMc4SOD/WbxO88MrvV4/S4o5BaIxKox2Dtrk5jL/kwSrUL4PczPShVjUfOFTOcojN0BBmfLSq5MLhYypY2LWfAmnkgp4mm20hSgjB1rv0ZYoNgrj5PopBAf//ehI/uXRoTVJhKmrbscPD5x9nJYOhkr8T+mNHsvSdHpP/BkupqGbmP9c1wC82jWncuHPk/idRnWI6hqlr/fpw2/ZYMbpW9Qw1knpR/uwC5ChoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T+jsKY+L+/j+K1MzwjzLqCvVb8CZvClBJyFDVvtXOQ=;
 b=ek0tm9VxTYBTKjGSpo5RyR3i5CpWaFK5tP9nGWFU9/Cy8TIjtPsSO1m0vXcxTCCccW3CFOaBZuHnx5cZh2S4Wg/1PwPMTZVI6hkP+d1cI0cMjqNjDGLhUuW35Ow0RuBv6OdVfOzioOpSiuIApbRcs8naL9hT3Wgxo02TNSM0GaAbwz5SPlO9gElpq0jhNfeS8yBXzliZ1SOYr+c/3yx415M72mj7T/f3/GJ0oRda35sXrIQO7yCvLusr8wtiFFl4KKBuE8zKSF6YK7VFNMctzgbjPzYGFtrCs63Qk9jvsehaurK80sDYWgarqdV+eSeEpOkmkVqCIT4PAiduAfBxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH0PR11MB4888.namprd11.prod.outlook.com
 (2603:10b6:510:32::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Sun, 28 Dec
 2025 06:20:11 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9456.013; Sun, 28 Dec 2025
 06:20:11 +0000
Message-ID: <0e979750-3f65-41c8-b73f-51721be57a25@windriver.com>
Date: Sun, 28 Dec 2025 14:19:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: i2c: ov5647: Convert to CCI register access
 helpers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251226031311.2068414-1-xiaolei.wang@windriver.com>
 <20251226031311.2068414-2-xiaolei.wang@windriver.com>
 <20251227113150.GH4094@pendragon.ideasonboard.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <20251227113150.GH4094@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH0PR11MB4888:EE_
X-MS-Office365-Filtering-Correlation-Id: b41bb657-6d8c-4268-e5ac-08de45d927e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlRxZkJsWVlDZU5oTWNGdVJBa3BoQ0pUcGQrSWhJeko5alN6aEhuWTNKYUF2?=
 =?utf-8?B?NUxJN2FqNmlEYVVhVjArN2hSMDlTbkFselZFYUpqSTlWdGtqUTZaSWgvSE1a?=
 =?utf-8?B?ZUVnbDFScW1MeSsyV2o1eHFuUU1ablJZZ01ZV25Pd0dLaEFHa0xaZUFwZHF4?=
 =?utf-8?B?eVJENWNGS0F4MTE5aktTRUFWSDhNUFc5QUhaVHFRVGdLUWxBRFFKSE1uY3Nq?=
 =?utf-8?B?dW9VdmxLRmZXOHRlVTJsQ0FNTjBZWXlpZnhTc2ovNXpUWXlhTjFKbVk4VUhP?=
 =?utf-8?B?QXMvMitmMEtEQzlOVkNHYlBOUVNYRkd3NW4zQ3d5SGJNbitCVjhpdVJyOGY5?=
 =?utf-8?B?dDBTbkRBRFlZRnFuR2hKcFVTOTBWa0dPYVJiR3RUVDlXMmhxTE44WDk5Qm5N?=
 =?utf-8?B?TGJ5Wm1EakpMdzJzNGFkVW1sTWFOSzd4Ymp4SGlrWG5aWk0yYU9vRDRvQk5u?=
 =?utf-8?B?NVlWY1NyZkNFNTdKU2FvalFRWTN1T1lXdTY4d3BYTnZjWVJ3RjJ0ZTlHbnA3?=
 =?utf-8?B?SEI2Mm9ZbWFiS00vMDRhNWg1Umo4bU9xNHhMQlM2TElqN01xengxKzUzbXN1?=
 =?utf-8?B?ajdLYzhuQ3JMUEFHZkY1L0xZaTZjbUluV2VQRVVUb05uMHpaU3E2TnNnK0x2?=
 =?utf-8?B?SFVmVFZMN1NsblVEL0NKa3lreXJRYkJCbzJyL29lVSs0QklUZHkwa2V5Umx1?=
 =?utf-8?B?bFFCNTJKemVWV1JSZVM0OFhSRGthcTFIMThyOVlyVDU4YzVjOXYxTnJDRHRq?=
 =?utf-8?B?MG9QM1lEc3p2d3hCNUhyckdHcnhVOVYwY0RrcUhOYlhjSnhWaUF1S1l1VmN0?=
 =?utf-8?B?OUlScmxZWFByN3hPUlZxUGttc0I1R3JnY2FDSzU3cGJPWnIzbHdvQ3hPc1V0?=
 =?utf-8?B?d3FTK1dtRlhMRFVDT2F4N3I4WGpBdmU4SHEwWjNKNXlpejJhYVcxR0hvdVUw?=
 =?utf-8?B?dDlIWkk5Q3RobExVVDVaMlM5azRzcjRXWExqSElhaCtoVS9pc3lkOHdjc2cy?=
 =?utf-8?B?NllJTlIwaGtpWEJEK2p1WEpDR3JkK1RxZU4zNk9iNnlLYVNYVDRHZ3gxbEd6?=
 =?utf-8?B?N2wvYVp5SlhCL1hwUDg1L0owYkE1RG9YbjN3WllqUEdxOHUzUnJQeDE4Szdo?=
 =?utf-8?B?aGpkbzFsSDFOOWZOeSsvYTVQWW5CNHZLeWlsTGlxV3RGd2V1bHRKcmJZTzdm?=
 =?utf-8?B?U0J5Y1IvSlpWL01rd0hhVnNnN0NKN0hVNDJwajlUYlhUSzRpTDhodzJYSmxs?=
 =?utf-8?B?ZkJ1TW9yQUFJQVMvQWxsWkZkTU82YWhYZEg3NXFHT2FvSHhyKy9pa3VkY05O?=
 =?utf-8?B?NG93RnZFMkcwS0N6K3hoUGpnTkhFSk5sQVg4Z2xOOEo5TndrVHpyWGtIMWNy?=
 =?utf-8?B?MXZiTFRzR1M3MFFmRVEwZXRxckVrTHVHUUFsdG9wK3VPMkRpME5CaTZVM0Ja?=
 =?utf-8?B?N3ByOXFObnpNMGRXa1haYVBWN0FMaEsyWjJTN0JBRDBIc0lmcy9sMUZ0VzI4?=
 =?utf-8?B?QjF3TU80b0FESDVtU0tXa0tEaVp5VlNsVFhtN1NoSHgvbVIxYWV5VkFPd3du?=
 =?utf-8?B?WTVIVCtHWXJrbG1uTU5TdUJ1bTAwemZiM0ZGei85TEZQcUVqc2hoN2N0aCta?=
 =?utf-8?B?WElNcHJJelE3NEZVYUZwWnoxWnB3S1haM0pJemZLQ1Y5UEM2SlFKcnJRdndH?=
 =?utf-8?B?SG9XM2JNNmkxNTZSYnp2T1VqeGJ5cHJYcVB0R042ZWV4TitwR1lYa2E2K2RE?=
 =?utf-8?B?YkVSZi90T3gzVWZNU0YrSXJFMDBjU0thSUNrV3NVaTJQTk9La1FNa3pIdUwx?=
 =?utf-8?B?M012N1RhdVRmakp0VkdZWnZPSHJWUENONzZscXBBUVlRazFYVG1jdGE0aGVw?=
 =?utf-8?B?VnhndVN0MkNoSnhIZGNoQmhpdWZNRHR2RHFlYXVISC9UUE5rKzd6bUp6Yklo?=
 =?utf-8?Q?NVotKxgKt2p67H2dWNLFALfpPnD6kOYH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yy9uUmprVzFnSmVnMzZTVGY2eVJuaXVqYTExbVQ2WkxwQmlMMHloQmFWVWRF?=
 =?utf-8?B?QnBhSW1TSWdCSzhkN0tHSzU2MnpVN3kvZnhGOTVyZ0oyaVVXSjJZYU9CeE9h?=
 =?utf-8?B?MFd3TWRuaVdkZVJFak1sZnR4QjVJK3kybW9qMERlaGdBN3kvSG9ScGZHRW54?=
 =?utf-8?B?TTBBS1ptTlArSVgva3lOWjFjeDNnUFN0WTVTQ1B5c29Qc0djcjFyNmF4alU5?=
 =?utf-8?B?alluRGdpU2xMRS9xU1lra0piNjdDOUtoM0laVEdUOTZNd3pYUGpXaExzK1Jx?=
 =?utf-8?B?QURYTlNMcURob2FLRkE2L2FMVFh0UDMwbjQ1QjlpbE14SDZuZXFRczZ0SFFa?=
 =?utf-8?B?bEZJditIRDBlMEFGUzZuelhNSG1pUmhaT0JsTDVoVThmMkZLWkZ0SENqSTIw?=
 =?utf-8?B?cHV4bXkrdXdGbmRqbC9Pci96K1BkQk5OZVg5dktLbVVDK1dhVWJ1RHFNSDln?=
 =?utf-8?B?NlhXVTlWd1A0ZUpKQmdWQm0vdjNvTUZ0cXBUa21ab1JrZ1BTbVR1ZkY0bG82?=
 =?utf-8?B?dzdod3ZrOWoxbVNITVAxdWxIT3FaU09QT2h1ckdBQ1NxdTVxTVZmNXFNZDJU?=
 =?utf-8?B?QnNyL1J1N0dkZjR5NExDajUzQ3lUcVhXdHZSWlFwaURja2dBVHBvdXlZaVlz?=
 =?utf-8?B?REFyT0dhT2ZCM0NjYjJwZ3hyNWRuM1htREJuSFdrVzlzUkozUFNjSGovckFm?=
 =?utf-8?B?bVNMOGVqZHpkaWdrUjFuQSt6dkU2eUp5NjYwdDl4VGVwZ3FGZjdPSkt1dG1n?=
 =?utf-8?B?ViswNEhueW1qNGNPUjlQaWJkWE1vUmRLaVhsRTFDTTNTTXRmNkttU0I3blBu?=
 =?utf-8?B?WW5PWlBxbTNWZlNMZjJ5VFlHRWx2YWVUNEFOdzY1djI3cFk1SjBYWS8vNWp4?=
 =?utf-8?B?QXdsSS85UmNNZkhndFcwU2U3Wm1MQWRDc1g0TUhoWjYxNnJmYnN2ZmFqZFA3?=
 =?utf-8?B?NkZ2ckZlbkl2MldMSnF1R21jZVZjR09iYWZ5WVYwU2VHZG9mS3ZhSHh5bGZj?=
 =?utf-8?B?U1d0TTcrZ3NWVnVGOUVuNFBDdDRpY0ZhTkt0QzhvalE3eDFIQTd5N3Y1V0J6?=
 =?utf-8?B?U2NBMVhnVWEwcEU0dEd3b1lheEU4MEVjb05jLzJGWFBqTHFPdVoyano3NU5k?=
 =?utf-8?B?bWcxdVpubXl1azZjcUJHTlNlTENMQXdGNzYxZENaYWRmZnRYTEtYQ0tkQ1Bs?=
 =?utf-8?B?V0ZYZ0k3eWQ1YmVZL0dBRTdFR2JZaUMrSDZzUTRuZVV4cXU3Z1dDRy9yMkJ2?=
 =?utf-8?B?QjJnaEtEdnU1QWk3V3g3dTN0MUg0WUIzWWE1MXd0MmpSMk96MVR5RDQ0QmpG?=
 =?utf-8?B?cDg3Vlpta1l1NXliWmJWSmlrY1ZSQnExZXhrb0QzUXUxQ0VabnBOYXRBNDJE?=
 =?utf-8?B?WkZJenc5SWZWNFNkVFdkVDBzNWpzWFBFQ1dyM3hOM3JNUitieU1WNXRIQ1hH?=
 =?utf-8?B?cm5QMm9WWUVNY2RVWklTUzhxd2o5RFdyQTNUOGp5R3dzWFNYT3p1SG9EeHR6?=
 =?utf-8?B?eW9rZzQrNjhBS3RNZVVHMDY2ekg5Snc0L0lFMmNlV1k2VTFpUTZjanVSZE1R?=
 =?utf-8?B?SEdGTng1QW90WnZyRTk3ZEEwZXREbC9PVDBLcE4xbzNaVU44MHBEQm5La3Zj?=
 =?utf-8?B?N0VZSjZkaWR0VEJENm4vN21uazcwNkRVRVByelBrVWdCQURYeDZjeTA0Q2Vq?=
 =?utf-8?B?NmlVQmtpYXpTY1VLdk81anR2OTBlNDhzbG1qTUZKOGpoV1MrVnlVUGZyTVF0?=
 =?utf-8?B?THhqVFdjZ04yUGh6cVJ3NFQwZ2R3UmdnOTNVVWlXNG9aQlViajIyL1QrNVQ5?=
 =?utf-8?B?clVKTlFqTnJ1dFRMWTJPWTNNMWVJUEFUM3ozSzYwOXJiYzFSNjFPN2xSV21h?=
 =?utf-8?B?OEJMeGtuaVFFcGpLMXBRWkxYTUFtTDFpZkxiTkg0Q2RpQlQzcktjNkJWdnJE?=
 =?utf-8?B?T3FFUGFsZDk5Y2YwVEZ3Yi9EQkdTWUhFWGVWWkcrRHhGelRJT2JnQnAxb1RG?=
 =?utf-8?B?cXR3WGdKTm5STGNINWtLb2NjQXJYV1hsYTJSQ2hvak9zeXZiTW5wdy9wa2RQ?=
 =?utf-8?B?cEpKWFJTaDRiM1pCSExpaGVHRVE3eW40N0lpcU5KV05TU016cnE2d2RuamhU?=
 =?utf-8?B?NXd6YVFkL1ZzK2NaTnloTGd0V2s1YkMraGZtc2I3dURZQmZSRTBnSStMTS8x?=
 =?utf-8?B?MmV6Qllxd1N4T2syRE11VmFnYU4xelp5eDZLc0pzQ2VqNTFXa212Y1B2S0Zt?=
 =?utf-8?B?elh5WVE2S2NOb09JMzZIcnpORVdpUGVpTWQzaWxNWk14VzZYTHk3dlpLeTRx?=
 =?utf-8?B?dmxwWlRBREl6OElXdXhBN0xNdFNOSTR2RnhyWSsyUnlRbUtnWUtvOXo0ZUtQ?=
 =?utf-8?Q?k5bfxVpBGEbQI1g5uzUu3H8qGM/2zV1BnuVCrBjzTa3m3?=
X-MS-Exchange-AntiSpam-MessageData-1: KsULi+YGIMfi9dG/XG87tkYG5zI2l/2kVmM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b41bb657-6d8c-4268-e5ac-08de45d927e2
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2025 06:20:11.8080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTN96o7Fm4uVTvwQZUa8beGg1oG16WfvGnrKi7asKMmrbZQQOuTHntzOPv+4mP/KAwC3Pyw1UpLpVrkbIfbf0wUiHf4xhb9dlRA8Qogy/aQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4888
X-Proofpoint-ORIG-GUID: DdQSXknl4g_ufsMOR8ed_8eqfL5Wbe1u
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=6950cc1e cx=c_pps
 a=scPzG5pGSpQ412Sx4Fqw/g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=zPl10YNLVm-ylWLrDfwA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DdQSXknl4g_ufsMOR8ed_8eqfL5Wbe1u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDA1NiBTYWx0ZWRfX2hdzdN9qAFlk
 6gsSABFt7hCVtduktDwOh3bVKqmYo9OBUBUkKPe1IKb5SlrQBrJyHdHeTzCKSo3mdC3VtMlk/gU
 mPXYixky+gXqI9GweU0U3FDnPztnm64/WU8md8kBnbZIJr5jTol1yykHzrBEiAvkr+QQzxPyqYK
 2bYd3gZsscKn0wj6f4GUAxNe5g2IJWHsky+mx7o3WRNhWuDOW0XsU2sdpeFVW5ETXXZfFkax+HE
 0NhuWFRBctcrghWYgZCK55c9OlXPtnjjEldW6xGT9qeQ30Z6LMUyMa8FDNWo7FByEYJUwQqBe1/
 cXvz64Z5UxOWriPxpNZ1FiyKCeeSVbicd36vycNFAZR+Z2qkJQQCjJVuli1PXphkB75mStRH1oz
 SFeJZCN9YLyaGZHcTybgEhvVlEZ3kY63qZD146XloAuIvAVHdvDgbP/5XG2sa4dSve5MLS12Lx8
 +WAgqrtMeRSsxvw8mbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280056

Hi Laurent,

On 12/27/25 19:31, Laurent Pinchart wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
> Thank you for the patch.
>
> On Fri, Dec 26, 2025 at 11:13:10AM +0800, Xiaolei Wang wrote:
>> Use the new common CCI register access helpers to replace the private
>> register access helpers in the ov5647 driver. This simplifies the driver
>> by reducing the amount of code.
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/i2c/Kconfig  |   1 +
>>   drivers/media/i2c/ov5647.c | 964 +++++++++++++++++--------------------
>>   2 files changed, 454 insertions(+), 511 deletions(-)
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 4b4db8c4f496..cce63349e71e 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -529,6 +529,7 @@ config VIDEO_OV5645
>>
>>   config VIDEO_OV5647
>>        tristate "OmniVision OV5647 sensor support"
>> +     select V4L2_CCI_I2C
>>        help
>>          This is a Video4Linux2 sensor driver for the OmniVision
>>          OV5647 camera.
>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
>> index e193fef4fced..1f8e173417b8 100644
>> --- a/drivers/media/i2c/ov5647.c
>> +++ b/drivers/media/i2c/ov5647.c
>> @@ -28,6 +28,7 @@
>>   #include <media/v4l2-fwnode.h>
>>   #include <media/v4l2-image-sizes.h>
>>   #include <media/v4l2-mediabus.h>
>> +#include <media/v4l2-cci.h>
> Alphabetical order please.
>
>>   /*
>>    * From the datasheet, "20ms after PWDN goes low or 20ms after RESETB goes
>> @@ -41,24 +42,24 @@
>>   #define MIPI_CTRL00_BUS_IDLE                 BIT(2)
>>   #define MIPI_CTRL00_CLOCK_LANE_DISABLE               BIT(0)
>>
>> -#define OV5647_SW_STANDBY            0x0100
>> -#define OV5647_SW_RESET                      0x0103
>> -#define OV5647_REG_CHIPID_H          0x300a
>> -#define OV5647_REG_CHIPID_L          0x300b
>> -#define OV5640_REG_PAD_OUT           0x300d
>> -#define OV5647_REG_EXP_HI            0x3500
>> -#define OV5647_REG_EXP_MID           0x3501
>> -#define OV5647_REG_EXP_LO            0x3502
>> -#define OV5647_REG_AEC_AGC           0x3503
>> -#define OV5647_REG_GAIN_HI           0x350a
>> -#define OV5647_REG_GAIN_LO           0x350b
>> -#define OV5647_REG_VTS_HI            0x380e
>> +#define OV5647_SW_STANDBY            CCI_REG8(0x0100)
>> +#define OV5647_SW_RESET                      CCI_REG8(0x0103)
>> +#define OV5647_REG_CHIPID_H          CCI_REG8(0x300a)
>> +#define OV5647_REG_CHIPID_L          CCI_REG8(0x300b)
> You can use a 16-bit register here.
>
>> +#define OV5640_REG_PAD_OUT           CCI_REG8(0x300d)
>> +#define OV5647_REG_EXP_HI            CCI_REG8(0x3500)
>> +#define OV5647_REG_EXP_MID           CCI_REG8(0x3501)
>> +#define OV5647_REG_EXP_LO            CCI_REG8(0x3502)
> And a 24-bit register here.
>
>> +#define OV5647_REG_AEC_AGC           CCI_REG8(0x3503)
>> +#define OV5647_REG_GAIN_HI           CCI_REG8(0x350a)
>> +#define OV5647_REG_GAIN_LO           CCI_REG8(0x350b)
> 16-bit register.
>
>> +#define OV5647_REG_VTS_HI            CCI_REG16(0x380e)
>>   #define OV5647_REG_VTS_LO            0x380f
> 16-bit register.
>
>> -#define OV5647_REG_FRAME_OFF_NUMBER  0x4202
>> -#define OV5647_REG_MIPI_CTRL00               0x4800
>> -#define OV5647_REG_MIPI_CTRL14               0x4814
>> -#define OV5647_REG_AWB                       0x5001
>> -#define OV5647_REG_ISPCTRL3D         0x503d
>> +#define OV5647_REG_FRAME_OFF_NUMBER  CCI_REG8(0x4202)
>> +#define OV5647_REG_MIPI_CTRL00               CCI_REG8(0x4800)
>> +#define OV5647_REG_MIPI_CTRL14               CCI_REG8(0x4814)
>> +#define OV5647_REG_AWB                       CCI_REG8(0x5001)
>> +#define OV5647_REG_ISPCTRL3D         CCI_REG8(0x503d)
>>
>>   #define REG_TERM 0xfffe
>>   #define VAL_TERM 0xfe
>> @@ -81,23 +82,19 @@
>>   #define OV5647_EXPOSURE_DEFAULT              1000
>>   #define OV5647_EXPOSURE_MAX          65535
>>
>> -struct regval_list {
>> -     u16 addr;
>> -     u8 data;
>> -};
>> -
>>   struct ov5647_mode {
>>        struct v4l2_mbus_framefmt       format;
>>        struct v4l2_rect                crop;
>>        u64                             pixel_rate;
>>        int                             hts;
>>        int                             vts;
>> -     const struct regval_list        *reg_list;
>> +     const struct cci_reg_sequence   *reg_list;
>>        unsigned int                    num_regs;
>>   };
>>
>>   struct ov5647 {
>>        struct v4l2_subdev              sd;
>> +     struct regmap                   *regmap;
>>        struct media_pad                pad;
>>        struct mutex                    lock;
>>        struct clk                      *xclk;
>> @@ -130,377 +127,377 @@ static const u8 ov5647_test_pattern_val[] = {
>>        0x81,   /* Random Data */
>>   };
>>
>> -static const struct regval_list sensor_oe_disable_regs[] = {
>> -     {0x3000, 0x00},
>> -     {0x3001, 0x00},
>> -     {0x3002, 0x00},
>> +static const struct cci_reg_sequence sensor_oe_disable_regs[] = {
>> +     {CCI_REG8(0x3000), 0x00},
>> +     {CCI_REG8(0x3001), 0x00},
>> +     {CCI_REG8(0x3002), 0x00},
> While at it, please add spaces within the curly braces:
>
>          { CCI_REG8(0x3000), 0x00 },
>          { CCI_REG8(0x3001), 0x00 },
>          { CCI_REG8(0x3002), 0x00 },
>
> Same below.
>
>>   };
>>
>> -static const struct regval_list sensor_oe_enable_regs[] = {
>> -     {0x3000, 0x0f},
>> -     {0x3001, 0xff},
>> -     {0x3002, 0xe4},
>> +static const struct cci_reg_sequence sensor_oe_enable_regs[] = {
>> +     {CCI_REG8(0x3000), 0x0f},
>> +     {CCI_REG8(0x3001), 0xff},
>> +     {CCI_REG8(0x3002), 0xe4},
>>   };
>>
>> -static struct regval_list ov5647_2592x1944_10bpp[] = {
>> -     {0x0100, 0x00},
>> -     {0x0103, 0x01},
>> -     {0x3034, 0x1a},
>> -     {0x3035, 0x21},
>> -     {0x3036, 0x69},
>> -     {0x303c, 0x11},
>> -     {0x3106, 0xf5},
>> -     {0x3821, 0x06},
>> -     {0x3820, 0x00},
>> -     {0x3827, 0xec},
>> -     {0x370c, 0x03},
>> -     {0x3612, 0x5b},
>> -     {0x3618, 0x04},
>> -     {0x5000, 0x06},
>> -     {0x5002, 0x41},
>> -     {0x5003, 0x08},
>> -     {0x5a00, 0x08},
>> -     {0x3000, 0x00},
>> -     {0x3001, 0x00},
>> -     {0x3002, 0x00},
>> -     {0x3016, 0x08},
>> -     {0x3017, 0xe0},
>> -     {0x3018, 0x44},
>> -     {0x301c, 0xf8},
>> -     {0x301d, 0xf0},
>> -     {0x3a18, 0x00},
>> -     {0x3a19, 0xf8},
>> -     {0x3c01, 0x80},
>> -     {0x3b07, 0x0c},
>> -     {0x380c, 0x0b},
>> -     {0x380d, 0x1c},
>> -     {0x3814, 0x11},
>> -     {0x3815, 0x11},
>> -     {0x3708, 0x64},
>> -     {0x3709, 0x12},
>> -     {0x3808, 0x0a},
>> -     {0x3809, 0x20},
>> -     {0x380a, 0x07},
>> -     {0x380b, 0x98},
>> -     {0x3800, 0x00},
>> -     {0x3801, 0x00},
>> -     {0x3802, 0x00},
>> -     {0x3803, 0x00},
>> -     {0x3804, 0x0a},
>> -     {0x3805, 0x3f},
>> -     {0x3806, 0x07},
>> -     {0x3807, 0xa3},
>> -     {0x3811, 0x10},
>> -     {0x3813, 0x06},
>> -     {0x3630, 0x2e},
>> -     {0x3632, 0xe2},
>> -     {0x3633, 0x23},
>> -     {0x3634, 0x44},
>> -     {0x3636, 0x06},
>> -     {0x3620, 0x64},
>> -     {0x3621, 0xe0},
>> -     {0x3600, 0x37},
>> -     {0x3704, 0xa0},
>> -     {0x3703, 0x5a},
>> -     {0x3715, 0x78},
>> -     {0x3717, 0x01},
>> -     {0x3731, 0x02},
>> -     {0x370b, 0x60},
>> -     {0x3705, 0x1a},
>> -     {0x3f05, 0x02},
>> -     {0x3f06, 0x10},
>> -     {0x3f01, 0x0a},
>> -     {0x3a08, 0x01},
>> -     {0x3a09, 0x28},
>> -     {0x3a0a, 0x00},
>> -     {0x3a0b, 0xf6},
>> -     {0x3a0d, 0x08},
>> -     {0x3a0e, 0x06},
>> -     {0x3a0f, 0x58},
>> -     {0x3a10, 0x50},
>> -     {0x3a1b, 0x58},
>> -     {0x3a1e, 0x50},
>> -     {0x3a11, 0x60},
>> -     {0x3a1f, 0x28},
>> -     {0x4001, 0x02},
>> -     {0x4004, 0x04},
>> -     {0x4000, 0x09},
>> -     {0x4837, 0x19},
>> -     {0x4800, 0x24},
>> -     {0x3503, 0x03},
>> -     {0x0100, 0x01},
>> +static const struct cci_reg_sequence ov5647_2592x1944_10bpp[] = {
>> +     {CCI_REG8(0x0100), 0x00},
>> +     {CCI_REG8(0x0103), 0x01},
>> +     {CCI_REG8(0x3034), 0x1a},
>> +     {CCI_REG8(0x3035), 0x21},
>> +     {CCI_REG8(0x3036), 0x69},
>> +     {CCI_REG8(0x303c), 0x11},
>> +     {CCI_REG8(0x3106), 0xf5},
>> +     {CCI_REG8(0x3821), 0x06},
>> +     {CCI_REG8(0x3820), 0x00},
>> +     {CCI_REG8(0x3827), 0xec},
>> +     {CCI_REG8(0x370c), 0x03},
>> +     {CCI_REG8(0x3612), 0x5b},
>> +     {CCI_REG8(0x3618), 0x04},
>> +     {CCI_REG8(0x5000), 0x06},
>> +     {CCI_REG8(0x5002), 0x41},
>> +     {CCI_REG8(0x5003), 0x08},
>> +     {CCI_REG8(0x5a00), 0x08},
>> +     {CCI_REG8(0x3000), 0x00},
>> +     {CCI_REG8(0x3001), 0x00},
>> +     {CCI_REG8(0x3002), 0x00},
>> +     {CCI_REG8(0x3016), 0x08},
>> +     {CCI_REG8(0x3017), 0xe0},
>> +     {CCI_REG8(0x3018), 0x44},
>> +     {CCI_REG8(0x301c), 0xf8},
>> +     {CCI_REG8(0x301d), 0xf0},
>> +     {CCI_REG8(0x3a18), 0x00},
>> +     {CCI_REG8(0x3a19), 0xf8},
>> +     {CCI_REG8(0x3c01), 0x80},
>> +     {CCI_REG8(0x3b07), 0x0c},
>> +     {CCI_REG8(0x380c), 0x0b},
>> +     {CCI_REG8(0x380d), 0x1c},
>> +     {CCI_REG8(0x3814), 0x11},
>> +     {CCI_REG8(0x3815), 0x11},
>> +     {CCI_REG8(0x3708), 0x64},
>> +     {CCI_REG8(0x3709), 0x12},
>> +     {CCI_REG8(0x3808), 0x0a},
>> +     {CCI_REG8(0x3809), 0x20},
>> +     {CCI_REG8(0x380a), 0x07},
>> +     {CCI_REG8(0x380b), 0x98},
>> +     {CCI_REG8(0x3800), 0x00},
>> +     {CCI_REG8(0x3801), 0x00},
>> +     {CCI_REG8(0x3802), 0x00},
>> +     {CCI_REG8(0x3803), 0x00},
>> +     {CCI_REG8(0x3804), 0x0a},
>> +     {CCI_REG8(0x3805), 0x3f},
>> +     {CCI_REG8(0x3806), 0x07},
>> +     {CCI_REG8(0x3807), 0xa3},
>> +     {CCI_REG8(0x3811), 0x10},
>> +     {CCI_REG8(0x3813), 0x06},
>> +     {CCI_REG8(0x3630), 0x2e},
>> +     {CCI_REG8(0x3632), 0xe2},
>> +     {CCI_REG8(0x3633), 0x23},
>> +     {CCI_REG8(0x3634), 0x44},
>> +     {CCI_REG8(0x3636), 0x06},
>> +     {CCI_REG8(0x3620), 0x64},
>> +     {CCI_REG8(0x3621), 0xe0},
>> +     {CCI_REG8(0x3600), 0x37},
>> +     {CCI_REG8(0x3704), 0xa0},
>> +     {CCI_REG8(0x3703), 0x5a},
>> +     {CCI_REG8(0x3715), 0x78},
>> +     {CCI_REG8(0x3717), 0x01},
>> +     {CCI_REG8(0x3731), 0x02},
>> +     {CCI_REG8(0x370b), 0x60},
>> +     {CCI_REG8(0x3705), 0x1a},
>> +     {CCI_REG8(0x3f05), 0x02},
>> +     {CCI_REG8(0x3f06), 0x10},
>> +     {CCI_REG8(0x3f01), 0x0a},
>> +     {CCI_REG8(0x3a08), 0x01},
>> +     {CCI_REG8(0x3a09), 0x28},
>> +     {CCI_REG8(0x3a0a), 0x00},
>> +     {CCI_REG8(0x3a0b), 0xf6},
>> +     {CCI_REG8(0x3a0d), 0x08},
>> +     {CCI_REG8(0x3a0e), 0x06},
>> +     {CCI_REG8(0x3a0f), 0x58},
>> +     {CCI_REG8(0x3a10), 0x50},
>> +     {CCI_REG8(0x3a1b), 0x58},
>> +     {CCI_REG8(0x3a1e), 0x50},
>> +     {CCI_REG8(0x3a11), 0x60},
>> +     {CCI_REG8(0x3a1f), 0x28},
>> +     {CCI_REG8(0x4001), 0x02},
>> +     {CCI_REG8(0x4004), 0x04},
>> +     {CCI_REG8(0x4000), 0x09},
>> +     {CCI_REG8(0x4837), 0x19},
>> +     {CCI_REG8(0x4800), 0x24},
>> +     {CCI_REG8(0x3503), 0x03},
>> +     {CCI_REG8(0x0100), 0x01},
>>   };
>>
>> -static struct regval_list ov5647_1080p30_10bpp[] = {
>> -     {0x0100, 0x00},
>> -     {0x0103, 0x01},
>> -     {0x3034, 0x1a},
>> -     {0x3035, 0x21},
>> -     {0x3036, 0x62},
>> -     {0x303c, 0x11},
>> -     {0x3106, 0xf5},
>> -     {0x3821, 0x06},
>> -     {0x3820, 0x00},
>> -     {0x3827, 0xec},
>> -     {0x370c, 0x03},
>> -     {0x3612, 0x5b},
>> -     {0x3618, 0x04},
>> -     {0x5000, 0x06},
>> -     {0x5002, 0x41},
>> -     {0x5003, 0x08},
>> -     {0x5a00, 0x08},
>> -     {0x3000, 0x00},
>> -     {0x3001, 0x00},
>> -     {0x3002, 0x00},
>> -     {0x3016, 0x08},
>> -     {0x3017, 0xe0},
>> -     {0x3018, 0x44},
>> -     {0x301c, 0xf8},
>> -     {0x301d, 0xf0},
>> -     {0x3a18, 0x00},
>> -     {0x3a19, 0xf8},
>> -     {0x3c01, 0x80},
>> -     {0x3b07, 0x0c},
>> -     {0x380c, 0x09},
>> -     {0x380d, 0x70},
>> -     {0x3814, 0x11},
>> -     {0x3815, 0x11},
>> -     {0x3708, 0x64},
>> -     {0x3709, 0x12},
>> -     {0x3808, 0x07},
>> -     {0x3809, 0x80},
>> -     {0x380a, 0x04},
>> -     {0x380b, 0x38},
>> -     {0x3800, 0x01},
>> -     {0x3801, 0x5c},
>> -     {0x3802, 0x01},
>> -     {0x3803, 0xb2},
>> -     {0x3804, 0x08},
>> -     {0x3805, 0xe3},
>> -     {0x3806, 0x05},
>> -     {0x3807, 0xf1},
>> -     {0x3811, 0x04},
>> -     {0x3813, 0x02},
>> -     {0x3630, 0x2e},
>> -     {0x3632, 0xe2},
>> -     {0x3633, 0x23},
>> -     {0x3634, 0x44},
>> -     {0x3636, 0x06},
>> -     {0x3620, 0x64},
>> -     {0x3621, 0xe0},
>> -     {0x3600, 0x37},
>> -     {0x3704, 0xa0},
>> -     {0x3703, 0x5a},
>> -     {0x3715, 0x78},
>> -     {0x3717, 0x01},
>> -     {0x3731, 0x02},
>> -     {0x370b, 0x60},
>> -     {0x3705, 0x1a},
>> -     {0x3f05, 0x02},
>> -     {0x3f06, 0x10},
>> -     {0x3f01, 0x0a},
>> -     {0x3a08, 0x01},
>> -     {0x3a09, 0x4b},
>> -     {0x3a0a, 0x01},
>> -     {0x3a0b, 0x13},
>> -     {0x3a0d, 0x04},
>> -     {0x3a0e, 0x03},
>> -     {0x3a0f, 0x58},
>> -     {0x3a10, 0x50},
>> -     {0x3a1b, 0x58},
>> -     {0x3a1e, 0x50},
>> -     {0x3a11, 0x60},
>> -     {0x3a1f, 0x28},
>> -     {0x4001, 0x02},
>> -     {0x4004, 0x04},
>> -     {0x4000, 0x09},
>> -     {0x4837, 0x19},
>> -     {0x4800, 0x34},
>> -     {0x3503, 0x03},
>> -     {0x0100, 0x01},
>> +static const struct cci_reg_sequence ov5647_1080p30_10bpp[] = {
>> +     {CCI_REG8(0x0100), 0x00},
>> +     {CCI_REG8(0x0103), 0x01},
>> +     {CCI_REG8(0x3034), 0x1a},
>> +     {CCI_REG8(0x3035), 0x21},
>> +     {CCI_REG8(0x3036), 0x62},
>> +     {CCI_REG8(0x303c), 0x11},
>> +     {CCI_REG8(0x3106), 0xf5},
>> +     {CCI_REG8(0x3821), 0x06},
>> +     {CCI_REG8(0x3820), 0x00},
>> +     {CCI_REG8(0x3827), 0xec},
>> +     {CCI_REG8(0x370c), 0x03},
>> +     {CCI_REG8(0x3612), 0x5b},
>> +     {CCI_REG8(0x3618), 0x04},
>> +     {CCI_REG8(0x5000), 0x06},
>> +     {CCI_REG8(0x5002), 0x41},
>> +     {CCI_REG8(0x5003), 0x08},
>> +     {CCI_REG8(0x5a00), 0x08},
>> +     {CCI_REG8(0x3000), 0x00},
>> +     {CCI_REG8(0x3001), 0x00},
>> +     {CCI_REG8(0x3002), 0x00},
>> +     {CCI_REG8(0x3016), 0x08},
>> +     {CCI_REG8(0x3017), 0xe0},
>> +     {CCI_REG8(0x3018), 0x44},
>> +     {CCI_REG8(0x301c), 0xf8},
>> +     {CCI_REG8(0x301d), 0xf0},
>> +     {CCI_REG8(0x3a18), 0x00},
>> +     {CCI_REG8(0x3a19), 0xf8},
>> +     {CCI_REG8(0x3c01), 0x80},
>> +     {CCI_REG8(0x3b07), 0x0c},
>> +     {CCI_REG8(0x380c), 0x09},
>> +     {CCI_REG8(0x380d), 0x70},
>> +     {CCI_REG8(0x3814), 0x11},
>> +     {CCI_REG8(0x3815), 0x11},
>> +     {CCI_REG8(0x3708), 0x64},
>> +     {CCI_REG8(0x3709), 0x12},
>> +     {CCI_REG8(0x3808), 0x07},
>> +     {CCI_REG8(0x3809), 0x80},
>> +     {CCI_REG8(0x380a), 0x04},
>> +     {CCI_REG8(0x380b), 0x38},
>> +     {CCI_REG8(0x3800), 0x01},
>> +     {CCI_REG8(0x3801), 0x5c},
>> +     {CCI_REG8(0x3802), 0x01},
>> +     {CCI_REG8(0x3803), 0xb2},
>> +     {CCI_REG8(0x3804), 0x08},
>> +     {CCI_REG8(0x3805), 0xe3},
>> +     {CCI_REG8(0x3806), 0x05},
>> +     {CCI_REG8(0x3807), 0xf1},
>> +     {CCI_REG8(0x3811), 0x04},
>> +     {CCI_REG8(0x3813), 0x02},
>> +     {CCI_REG8(0x3630), 0x2e},
>> +     {CCI_REG8(0x3632), 0xe2},
>> +     {CCI_REG8(0x3633), 0x23},
>> +     {CCI_REG8(0x3634), 0x44},
>> +     {CCI_REG8(0x3636), 0x06},
>> +     {CCI_REG8(0x3620), 0x64},
>> +     {CCI_REG8(0x3621), 0xe0},
>> +     {CCI_REG8(0x3600), 0x37},
>> +     {CCI_REG8(0x3704), 0xa0},
>> +     {CCI_REG8(0x3703), 0x5a},
>> +     {CCI_REG8(0x3715), 0x78},
>> +     {CCI_REG8(0x3717), 0x01},
>> +     {CCI_REG8(0x3731), 0x02},
>> +     {CCI_REG8(0x370b), 0x60},
>> +     {CCI_REG8(0x3705), 0x1a},
>> +     {CCI_REG8(0x3f05), 0x02},
>> +     {CCI_REG8(0x3f06), 0x10},
>> +     {CCI_REG8(0x3f01), 0x0a},
>> +     {CCI_REG8(0x3a08), 0x01},
>> +     {CCI_REG8(0x3a09), 0x4b},
>> +     {CCI_REG8(0x3a0a), 0x01},
>> +     {CCI_REG8(0x3a0b), 0x13},
>> +     {CCI_REG8(0x3a0d), 0x04},
>> +     {CCI_REG8(0x3a0e), 0x03},
>> +     {CCI_REG8(0x3a0f), 0x58},
>> +     {CCI_REG8(0x3a10), 0x50},
>> +     {CCI_REG8(0x3a1b), 0x58},
>> +     {CCI_REG8(0x3a1e), 0x50},
>> +     {CCI_REG8(0x3a11), 0x60},
>> +     {CCI_REG8(0x3a1f), 0x28},
>> +     {CCI_REG8(0x4001), 0x02},
>> +     {CCI_REG8(0x4004), 0x04},
>> +     {CCI_REG8(0x4000), 0x09},
>> +     {CCI_REG8(0x4837), 0x19},
>> +     {CCI_REG8(0x4800), 0x34},
>> +     {CCI_REG8(0x3503), 0x03},
>> +     {CCI_REG8(0x0100), 0x01},
>>   };
>>
>> -static struct regval_list ov5647_2x2binned_10bpp[] = {
>> -     {0x0100, 0x00},
>> -     {0x0103, 0x01},
>> -     {0x3034, 0x1a},
>> -     {0x3035, 0x21},
>> -     {0x3036, 0x62},
>> -     {0x303c, 0x11},
>> -     {0x3106, 0xf5},
>> -     {0x3827, 0xec},
>> -     {0x370c, 0x03},
>> -     {0x3612, 0x59},
>> -     {0x3618, 0x00},
>> -     {0x5000, 0x06},
>> -     {0x5002, 0x41},
>> -     {0x5003, 0x08},
>> -     {0x5a00, 0x08},
>> -     {0x3000, 0x00},
>> -     {0x3001, 0x00},
>> -     {0x3002, 0x00},
>> -     {0x3016, 0x08},
>> -     {0x3017, 0xe0},
>> -     {0x3018, 0x44},
>> -     {0x301c, 0xf8},
>> -     {0x301d, 0xf0},
>> -     {0x3a18, 0x00},
>> -     {0x3a19, 0xf8},
>> -     {0x3c01, 0x80},
>> -     {0x3b07, 0x0c},
>> -     {0x3800, 0x00},
>> -     {0x3801, 0x00},
>> -     {0x3802, 0x00},
>> -     {0x3803, 0x00},
>> -     {0x3804, 0x0a},
>> -     {0x3805, 0x3f},
>> -     {0x3806, 0x07},
>> -     {0x3807, 0xa3},
>> -     {0x3808, 0x05},
>> -     {0x3809, 0x10},
>> -     {0x380a, 0x03},
>> -     {0x380b, 0xcc},
>> -     {0x380c, 0x07},
>> -     {0x380d, 0x68},
>> -     {0x3811, 0x0c},
>> -     {0x3813, 0x06},
>> -     {0x3814, 0x31},
>> -     {0x3815, 0x31},
>> -     {0x3630, 0x2e},
>> -     {0x3632, 0xe2},
>> -     {0x3633, 0x23},
>> -     {0x3634, 0x44},
>> -     {0x3636, 0x06},
>> -     {0x3620, 0x64},
>> -     {0x3621, 0xe0},
>> -     {0x3600, 0x37},
>> -     {0x3704, 0xa0},
>> -     {0x3703, 0x5a},
>> -     {0x3715, 0x78},
>> -     {0x3717, 0x01},
>> -     {0x3731, 0x02},
>> -     {0x370b, 0x60},
>> -     {0x3705, 0x1a},
>> -     {0x3f05, 0x02},
>> -     {0x3f06, 0x10},
>> -     {0x3f01, 0x0a},
>> -     {0x3a08, 0x01},
>> -     {0x3a09, 0x28},
>> -     {0x3a0a, 0x00},
>> -     {0x3a0b, 0xf6},
>> -     {0x3a0d, 0x08},
>> -     {0x3a0e, 0x06},
>> -     {0x3a0f, 0x58},
>> -     {0x3a10, 0x50},
>> -     {0x3a1b, 0x58},
>> -     {0x3a1e, 0x50},
>> -     {0x3a11, 0x60},
>> -     {0x3a1f, 0x28},
>> -     {0x4001, 0x02},
>> -     {0x4004, 0x04},
>> -     {0x4000, 0x09},
>> -     {0x4837, 0x16},
>> -     {0x4800, 0x24},
>> -     {0x3503, 0x03},
>> -     {0x3820, 0x41},
>> -     {0x3821, 0x07},
>> -     {0x350a, 0x00},
>> -     {0x350b, 0x10},
>> -     {0x3500, 0x00},
>> -     {0x3501, 0x1a},
>> -     {0x3502, 0xf0},
>> -     {0x3212, 0xa0},
>> -     {0x0100, 0x01},
>> +static const struct cci_reg_sequence ov5647_2x2binned_10bpp[] = {
>> +     {CCI_REG8(0x0100), 0x00},
>> +     {CCI_REG8(0x0103), 0x01},
>> +     {CCI_REG8(0x3034), 0x1a},
>> +     {CCI_REG8(0x3035), 0x21},
>> +     {CCI_REG8(0x3036), 0x62},
>> +     {CCI_REG8(0x303c), 0x11},
>> +     {CCI_REG8(0x3106), 0xf5},
>> +     {CCI_REG8(0x3827), 0xec},
>> +     {CCI_REG8(0x370c), 0x03},
>> +     {CCI_REG8(0x3612), 0x59},
>> +     {CCI_REG8(0x3618), 0x00},
>> +     {CCI_REG8(0x5000), 0x06},
>> +     {CCI_REG8(0x5002), 0x41},
>> +     {CCI_REG8(0x5003), 0x08},
>> +     {CCI_REG8(0x5a00), 0x08},
>> +     {CCI_REG8(0x3000), 0x00},
>> +     {CCI_REG8(0x3001), 0x00},
>> +     {CCI_REG8(0x3002), 0x00},
>> +     {CCI_REG8(0x3016), 0x08},
>> +     {CCI_REG8(0x3017), 0xe0},
>> +     {CCI_REG8(0x3018), 0x44},
>> +     {CCI_REG8(0x301c), 0xf8},
>> +     {CCI_REG8(0x301d), 0xf0},
>> +     {CCI_REG8(0x3a18), 0x00},
>> +     {CCI_REG8(0x3a19), 0xf8},
>> +     {CCI_REG8(0x3c01), 0x80},
>> +     {CCI_REG8(0x3b07), 0x0c},
>> +     {CCI_REG8(0x3800), 0x00},
>> +     {CCI_REG8(0x3801), 0x00},
>> +     {CCI_REG8(0x3802), 0x00},
>> +     {CCI_REG8(0x3803), 0x00},
>> +     {CCI_REG8(0x3804), 0x0a},
>> +     {CCI_REG8(0x3805), 0x3f},
>> +     {CCI_REG8(0x3806), 0x07},
>> +     {CCI_REG8(0x3807), 0xa3},
>> +     {CCI_REG8(0x3808), 0x05},
>> +     {CCI_REG8(0x3809), 0x10},
>> +     {CCI_REG8(0x380a), 0x03},
>> +     {CCI_REG8(0x380b), 0xcc},
>> +     {CCI_REG8(0x380c), 0x07},
>> +     {CCI_REG8(0x380d), 0x68},
>> +     {CCI_REG8(0x3811), 0x0c},
>> +     {CCI_REG8(0x3813), 0x06},
>> +     {CCI_REG8(0x3814), 0x31},
>> +     {CCI_REG8(0x3815), 0x31},
>> +     {CCI_REG8(0x3630), 0x2e},
>> +     {CCI_REG8(0x3632), 0xe2},
>> +     {CCI_REG8(0x3633), 0x23},
>> +     {CCI_REG8(0x3634), 0x44},
>> +     {CCI_REG8(0x3636), 0x06},
>> +     {CCI_REG8(0x3620), 0x64},
>> +     {CCI_REG8(0x3621), 0xe0},
>> +     {CCI_REG8(0x3600), 0x37},
>> +     {CCI_REG8(0x3704), 0xa0},
>> +     {CCI_REG8(0x3703), 0x5a},
>> +     {CCI_REG8(0x3715), 0x78},
>> +     {CCI_REG8(0x3717), 0x01},
>> +     {CCI_REG8(0x3731), 0x02},
>> +     {CCI_REG8(0x370b), 0x60},
>> +     {CCI_REG8(0x3705), 0x1a},
>> +     {CCI_REG8(0x3f05), 0x02},
>> +     {CCI_REG8(0x3f06), 0x10},
>> +     {CCI_REG8(0x3f01), 0x0a},
>> +     {CCI_REG8(0x3a08), 0x01},
>> +     {CCI_REG8(0x3a09), 0x28},
>> +     {CCI_REG8(0x3a0a), 0x00},
>> +     {CCI_REG8(0x3a0b), 0xf6},
>> +     {CCI_REG8(0x3a0d), 0x08},
>> +     {CCI_REG8(0x3a0e), 0x06},
>> +     {CCI_REG8(0x3a0f), 0x58},
>> +     {CCI_REG8(0x3a10), 0x50},
>> +     {CCI_REG8(0x3a1b), 0x58},
>> +     {CCI_REG8(0x3a1e), 0x50},
>> +     {CCI_REG8(0x3a11), 0x60},
>> +     {CCI_REG8(0x3a1f), 0x28},
>> +     {CCI_REG8(0x4001), 0x02},
>> +     {CCI_REG8(0x4004), 0x04},
>> +     {CCI_REG8(0x4000), 0x09},
>> +     {CCI_REG8(0x4837), 0x16},
>> +     {CCI_REG8(0x4800), 0x24},
>> +     {CCI_REG8(0x3503), 0x03},
>> +     {CCI_REG8(0x3820), 0x41},
>> +     {CCI_REG8(0x3821), 0x07},
>> +     {CCI_REG8(0x350a), 0x00},
>> +     {CCI_REG8(0x350b), 0x10},
>> +     {CCI_REG8(0x3500), 0x00},
>> +     {CCI_REG8(0x3501), 0x1a},
>> +     {CCI_REG8(0x3502), 0xf0},
>> +     {CCI_REG8(0x3212), 0xa0},
>> +     {CCI_REG8(0x0100), 0x01},
>>   };
>>
>> -static struct regval_list ov5647_640x480_10bpp[] = {
>> -     {0x0100, 0x00},
>> -     {0x0103, 0x01},
>> -     {0x3035, 0x11},
>> -     {0x3036, 0x46},
>> -     {0x303c, 0x11},
>> -     {0x3821, 0x07},
>> -     {0x3820, 0x41},
>> -     {0x370c, 0x03},
>> -     {0x3612, 0x59},
>> -     {0x3618, 0x00},
>> -     {0x5000, 0x06},
>> -     {0x5003, 0x08},
>> -     {0x5a00, 0x08},
>> -     {0x3000, 0xff},
>> -     {0x3001, 0xff},
>> -     {0x3002, 0xff},
>> -     {0x301d, 0xf0},
>> -     {0x3a18, 0x00},
>> -     {0x3a19, 0xf8},
>> -     {0x3c01, 0x80},
>> -     {0x3b07, 0x0c},
>> -     {0x380c, 0x07},
>> -     {0x380d, 0x3c},
>> -     {0x3814, 0x35},
>> -     {0x3815, 0x35},
>> -     {0x3708, 0x64},
>> -     {0x3709, 0x52},
>> -     {0x3808, 0x02},
>> -     {0x3809, 0x80},
>> -     {0x380a, 0x01},
>> -     {0x380b, 0xe0},
>> -     {0x3800, 0x00},
>> -     {0x3801, 0x10},
>> -     {0x3802, 0x00},
>> -     {0x3803, 0x00},
>> -     {0x3804, 0x0a},
>> -     {0x3805, 0x2f},
>> -     {0x3806, 0x07},
>> -     {0x3807, 0x9f},
>> -     {0x3630, 0x2e},
>> -     {0x3632, 0xe2},
>> -     {0x3633, 0x23},
>> -     {0x3634, 0x44},
>> -     {0x3620, 0x64},
>> -     {0x3621, 0xe0},
>> -     {0x3600, 0x37},
>> -     {0x3704, 0xa0},
>> -     {0x3703, 0x5a},
>> -     {0x3715, 0x78},
>> -     {0x3717, 0x01},
>> -     {0x3731, 0x02},
>> -     {0x370b, 0x60},
>> -     {0x3705, 0x1a},
>> -     {0x3f05, 0x02},
>> -     {0x3f06, 0x10},
>> -     {0x3f01, 0x0a},
>> -     {0x3a08, 0x01},
>> -     {0x3a09, 0x2e},
>> -     {0x3a0a, 0x00},
>> -     {0x3a0b, 0xfb},
>> -     {0x3a0d, 0x02},
>> -     {0x3a0e, 0x01},
>> -     {0x3a0f, 0x58},
>> -     {0x3a10, 0x50},
>> -     {0x3a1b, 0x58},
>> -     {0x3a1e, 0x50},
>> -     {0x3a11, 0x60},
>> -     {0x3a1f, 0x28},
>> -     {0x4001, 0x02},
>> -     {0x4004, 0x02},
>> -     {0x4000, 0x09},
>> -     {0x3000, 0x00},
>> -     {0x3001, 0x00},
>> -     {0x3002, 0x00},
>> -     {0x3017, 0xe0},
>> -     {0x301c, 0xfc},
>> -     {0x3636, 0x06},
>> -     {0x3016, 0x08},
>> -     {0x3827, 0xec},
>> -     {0x3018, 0x44},
>> -     {0x3035, 0x21},
>> -     {0x3106, 0xf5},
>> -     {0x3034, 0x1a},
>> -     {0x301c, 0xf8},
>> -     {0x4800, 0x34},
>> -     {0x3503, 0x03},
>> -     {0x0100, 0x01},
>> +static const struct cci_reg_sequence ov5647_640x480_10bpp[] = {
>> +     {CCI_REG8(0x0100), 0x00},
>> +     {CCI_REG8(0x0103), 0x01},
>> +     {CCI_REG8(0x3035), 0x11},
>> +     {CCI_REG8(0x3036), 0x46},
>> +     {CCI_REG8(0x303c), 0x11},
>> +     {CCI_REG8(0x3821), 0x07},
>> +     {CCI_REG8(0x3820), 0x41},
>> +     {CCI_REG8(0x370c), 0x03},
>> +     {CCI_REG8(0x3612), 0x59},
>> +     {CCI_REG8(0x3618), 0x00},
>> +     {CCI_REG8(0x5000), 0x06},
>> +     {CCI_REG8(0x5003), 0x08},
>> +     {CCI_REG8(0x5a00), 0x08},
>> +     {CCI_REG8(0x3000), 0xff},
>> +     {CCI_REG8(0x3001), 0xff},
>> +     {CCI_REG8(0x3002), 0xff},
>> +     {CCI_REG8(0x301d), 0xf0},
>> +     {CCI_REG8(0x3a18), 0x00},
>> +     {CCI_REG8(0x3a19), 0xf8},
>> +     {CCI_REG8(0x3c01), 0x80},
>> +     {CCI_REG8(0x3b07), 0x0c},
>> +     {CCI_REG8(0x380c), 0x07},
>> +     {CCI_REG8(0x380d), 0x3c},
>> +     {CCI_REG8(0x3814), 0x35},
>> +     {CCI_REG8(0x3815), 0x35},
>> +     {CCI_REG8(0x3708), 0x64},
>> +     {CCI_REG8(0x3709), 0x52},
>> +     {CCI_REG8(0x3808), 0x02},
>> +     {CCI_REG8(0x3809), 0x80},
>> +     {CCI_REG8(0x380a), 0x01},
>> +     {CCI_REG8(0x380b), 0xe0},
>> +     {CCI_REG8(0x3800), 0x00},
>> +     {CCI_REG8(0x3801), 0x10},
>> +     {CCI_REG8(0x3802), 0x00},
>> +     {CCI_REG8(0x3803), 0x00},
>> +     {CCI_REG8(0x3804), 0x0a},
>> +     {CCI_REG8(0x3805), 0x2f},
>> +     {CCI_REG8(0x3806), 0x07},
>> +     {CCI_REG8(0x3807), 0x9f},
>> +     {CCI_REG8(0x3630), 0x2e},
>> +     {CCI_REG8(0x3632), 0xe2},
>> +     {CCI_REG8(0x3633), 0x23},
>> +     {CCI_REG8(0x3634), 0x44},
>> +     {CCI_REG8(0x3620), 0x64},
>> +     {CCI_REG8(0x3621), 0xe0},
>> +     {CCI_REG8(0x3600), 0x37},
>> +     {CCI_REG8(0x3704), 0xa0},
>> +     {CCI_REG8(0x3703), 0x5a},
>> +     {CCI_REG8(0x3715), 0x78},
>> +     {CCI_REG8(0x3717), 0x01},
>> +     {CCI_REG8(0x3731), 0x02},
>> +     {CCI_REG8(0x370b), 0x60},
>> +     {CCI_REG8(0x3705), 0x1a},
>> +     {CCI_REG8(0x3f05), 0x02},
>> +     {CCI_REG8(0x3f06), 0x10},
>> +     {CCI_REG8(0x3f01), 0x0a},
>> +     {CCI_REG8(0x3a08), 0x01},
>> +     {CCI_REG8(0x3a09), 0x2e},
>> +     {CCI_REG8(0x3a0a), 0x00},
>> +     {CCI_REG8(0x3a0b), 0xfb},
>> +     {CCI_REG8(0x3a0d), 0x02},
>> +     {CCI_REG8(0x3a0e), 0x01},
>> +     {CCI_REG8(0x3a0f), 0x58},
>> +     {CCI_REG8(0x3a10), 0x50},
>> +     {CCI_REG8(0x3a1b), 0x58},
>> +     {CCI_REG8(0x3a1e), 0x50},
>> +     {CCI_REG8(0x3a11), 0x60},
>> +     {CCI_REG8(0x3a1f), 0x28},
>> +     {CCI_REG8(0x4001), 0x02},
>> +     {CCI_REG8(0x4004), 0x02},
>> +     {CCI_REG8(0x4000), 0x09},
>> +     {CCI_REG8(0x3000), 0x00},
>> +     {CCI_REG8(0x3001), 0x00},
>> +     {CCI_REG8(0x3002), 0x00},
>> +     {CCI_REG8(0x3017), 0xe0},
>> +     {CCI_REG8(0x301c), 0xfc},
>> +     {CCI_REG8(0x3636), 0x06},
>> +     {CCI_REG8(0x3016), 0x08},
>> +     {CCI_REG8(0x3827), 0xec},
>> +     {CCI_REG8(0x3018), 0x44},
>> +     {CCI_REG8(0x3035), 0x21},
>> +     {CCI_REG8(0x3106), 0xf5},
>> +     {CCI_REG8(0x3034), 0x1a},
>> +     {CCI_REG8(0x301c), 0xf8},
>> +     {CCI_REG8(0x4800), 0x34},
>> +     {CCI_REG8(0x3503), 0x03},
>> +     {CCI_REG8(0x0100), 0x01},
>>   };
>>
>>   static const struct ov5647_mode ov5647_modes[] = {
>> @@ -594,109 +591,35 @@ static const struct ov5647_mode ov5647_modes[] = {
>>   #define OV5647_DEFAULT_MODE  (&ov5647_modes[3])
>>   #define OV5647_DEFAULT_FORMAT        (ov5647_modes[3].format)
>>
>> -static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
>> -{
>> -     unsigned char data[4] = { reg >> 8, reg & 0xff, val >> 8, val & 0xff};
>> -     struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -     int ret;
>> -
>> -     ret = i2c_master_send(client, data, 4);
>> -     if (ret < 0) {
>> -             dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
>> -                     __func__, reg);
>> -             return ret;
>> -     }
>> -
>> -     return 0;
>> -}
>> -
>> -static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
>> -{
>> -     unsigned char data[3] = { reg >> 8, reg & 0xff, val};
>> -     struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -     int ret;
>> -
>> -     ret = i2c_master_send(client, data, 3);
>> -     if (ret < 0) {
>> -             dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
>> -                             __func__, reg);
>> -             return ret;
>> -     }
>> -
>> -     return 0;
>> -}
>> -
>> -static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
>> -{
>> -     struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -     u8 buf[2] = { reg >> 8, reg & 0xff };
>> -     struct i2c_msg msg[2];
>> -     int ret;
>> -
>> -     msg[0].addr = client->addr;
>> -     msg[0].flags = client->flags;
>> -     msg[0].buf = buf;
>> -     msg[0].len = sizeof(buf);
>> -
>> -     msg[1].addr = client->addr;
>> -     msg[1].flags = client->flags | I2C_M_RD;
>> -     msg[1].buf = buf;
>> -     msg[1].len = 1;
>> -
>> -     ret = i2c_transfer(client->adapter, msg, 2);
>> -     if (ret != 2) {
>> -             dev_err(&client->dev, "%s: i2c read error, reg: %x = %d\n",
>> -                     __func__, reg, ret);
>> -             return ret >= 0 ? -EINVAL : ret;
>> -     }
>> -
>> -     *val = buf[0];
>> -
>> -     return 0;
>> -}
>> -
>> -static int ov5647_write_array(struct v4l2_subdev *sd,
>> -                           const struct regval_list *regs, int array_size)
>> -{
>> -     int i, ret;
>> -
>> -     for (i = 0; i < array_size; i++) {
>> -             ret = ov5647_write(sd, regs[i].addr, regs[i].data);
>> -             if (ret < 0)
>> -                     return ret;
>> -     }
>> -
>> -     return 0;
>> -}
>> -
>>   static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
>>   {
>> -     u8 channel_id;
>> +     struct ov5647 *sensor = to_sensor(sd);
>> +     u64 channel_id;
>>        int ret;
>>
>> -     ret = ov5647_read(sd, OV5647_REG_MIPI_CTRL14, &channel_id);
>> +     ret = cci_read(sensor->regmap, OV5647_REG_MIPI_CTRL14, &channel_id, NULL);
>>        if (ret < 0)
>>                return ret;
>>
>>        channel_id &= ~(3 << 6);
>>
>> -     return ov5647_write(sd, OV5647_REG_MIPI_CTRL14,
>> -                         channel_id | (channel << 6));
>> +     return cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL14,
>> +                             channel_id | (channel << 6), NULL);
> Please fix the indentation, here and everywhere below.
>
>          return cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL14,
>                           channel_id | (channel << 6), NULL);
>
>>   }
>>
>>   static int ov5647_set_mode(struct v4l2_subdev *sd)
>>   {
>>        struct i2c_client *client = v4l2_get_subdevdata(sd);
>>        struct ov5647 *sensor = to_sensor(sd);
>> -     u8 resetval, rdval;
>> +     u64 resetval, rdval;
>>        int ret;
>>
>> -     ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
>> +     ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
>>        if (ret < 0)
>>                return ret;
>>
>> -     ret = ov5647_write_array(sd, sensor->mode->reg_list,
>> -                              sensor->mode->num_regs);
>> +     ret = cci_multi_reg_write(sensor->regmap, sensor->mode->reg_list,
>> +                                     sensor->mode->num_regs, NULL);
>>        if (ret < 0) {
>>                dev_err(&client->dev, "write sensor default regs error\n");
>>                return ret;
>> @@ -706,13 +629,13 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>>        if (ret < 0)
>>                return ret;
>>
>> -     ret = ov5647_read(sd, OV5647_SW_STANDBY, &resetval);
>> +     ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &resetval, NULL);
>>        if (ret < 0)
>>                return ret;
>>
>>        if (!(resetval & 0x01)) {
>>                dev_err(&client->dev, "Device was in SW standby");
>> -             ret = ov5647_write(sd, OV5647_SW_STANDBY, 0x01);
>> +             ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, 0x01, NULL);
>>                if (ret < 0)
>>                        return ret;
>>        }
>> @@ -742,32 +665,33 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>>                val |= MIPI_CTRL00_CLOCK_LANE_GATE |
>>                       MIPI_CTRL00_LINE_SYNC_ENABLE;
>>
>> -     ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
>> +     ret = cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00, val, NULL);
>>        if (ret < 0)
>>                return ret;
>>
>> -     ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x00);
>> +     ret = cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, NULL);
>>        if (ret < 0)
>>                return ret;
>>
>> -     return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x00);
>> +     return cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, NULL);
> Please make use of the error chaining capability provided by
> cci_write():
>
>          cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00, val, &ret);
>          cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
>          cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
>
>          return ret;
>
> (make sure ret is initialized to 0 before any call to cci_write with
> &ret as the last parameter).
>
>>   }
>>
>>   static int ov5647_stream_off(struct v4l2_subdev *sd)
>>   {
>> +     struct ov5647 *sensor = to_sensor(sd);
>>        int ret;
>>
>> -     ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00,
>> +     ret = cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
>>                           MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
>> -                        MIPI_CTRL00_CLOCK_LANE_DISABLE);
>> +                        MIPI_CTRL00_CLOCK_LANE_DISABLE, NULL);
>>        if (ret < 0)
>>                return ret;
>>
>> -     ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x0f);
>> +     ret = cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, NULL);
>>        if (ret < 0)
>>                return ret;
>>
>> -     return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
>> +     return cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, NULL);
>>   }
>>
>>   static int ov5647_power_on(struct device *dev)
>> @@ -788,8 +712,8 @@ static int ov5647_power_on(struct device *dev)
>>                goto error_pwdn;
>>        }
>>
>> -     ret = ov5647_write_array(&sensor->sd, sensor_oe_enable_regs,
>> -                              ARRAY_SIZE(sensor_oe_enable_regs));
>> +     ret = cci_multi_reg_write(sensor->regmap, sensor_oe_enable_regs,
>> +                              ARRAY_SIZE(sensor_oe_enable_regs), NULL);
>>        if (ret < 0) {
>>                dev_err(dev, "write sensor_oe_enable_regs error\n");
>>                goto error_clk_disable;
>> @@ -815,23 +739,23 @@ static int ov5647_power_on(struct device *dev)
>>   static int ov5647_power_off(struct device *dev)
>>   {
>>        struct ov5647 *sensor = dev_get_drvdata(dev);
>> -     u8 rdval;
>> +     u64 rdval;
>>        int ret;
>>
>>        dev_dbg(dev, "OV5647 power off\n");
>>
>> -     ret = ov5647_write_array(&sensor->sd, sensor_oe_disable_regs,
>> -                              ARRAY_SIZE(sensor_oe_disable_regs));
>> +     ret = cci_multi_reg_write(sensor->regmap, sensor_oe_disable_regs,
>> +                              ARRAY_SIZE(sensor_oe_disable_regs), NULL);
>>        if (ret < 0)
>>                dev_dbg(dev, "disable oe failed\n");
>>
>>        /* Enter software standby */
>> -     ret = ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
>> +     ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
>>        if (ret < 0)
>>                dev_dbg(dev, "software standby failed\n");
>>
>>        rdval &= ~0x01;
>> -     ret = ov5647_write(&sensor->sd, OV5647_SW_STANDBY, rdval);
>> +     ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, rdval, NULL);
>>        if (ret < 0)
>>                dev_dbg(dev, "software standby failed\n");
>>
>> @@ -845,10 +769,11 @@ static int ov5647_power_off(struct device *dev)
>>   static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
>>                                      struct v4l2_dbg_register *reg)
>>   {
>> +     struct ov5647 *sensor = to_sensor(sd);
>>        int ret;
>> -     u8 val;
>> +     u64 val;
>>
>> -     ret = ov5647_read(sd, reg->reg & 0xff, &val);
>> +     ret = cci_read(sensor->regmap, reg->reg & 0xff, &val, NULL);
>>        if (ret < 0)
>>                return ret;
>>
>> @@ -861,7 +786,10 @@ static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
>>   static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
>>                                      const struct v4l2_dbg_register *reg)
>>   {
>> -     return ov5647_write(sd, reg->reg & 0xff, reg->val & 0xff);
>> +     struct ov5647 *sensor = to_sensor(sd);
>> +     int ret;
> Unused. Please compile the kernel with -Werror before submitting a
> patch.
>
>> +
>> +     return cci_write(sensor->regmap, reg->reg & 0xff, reg->val & 0xff, NULL);
>>   }
>>   #endif
>>
>> @@ -1089,33 +1017,34 @@ static const struct v4l2_subdev_ops ov5647_subdev_ops = {
>>
>>   static int ov5647_detect(struct v4l2_subdev *sd)
>>   {
>> +     struct ov5647 *sensor = to_sensor(sd);
>>        struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -     u8 read;
>> +     u64 read;
>>        int ret;
>>
>> -     ret = ov5647_write(sd, OV5647_SW_RESET, 0x01);
>> +     ret = cci_write(sensor->regmap, OV5647_SW_RESET, 0x01, NULL);
>>        if (ret < 0)
>>                return ret;
>>
>> -     ret = ov5647_read(sd, OV5647_REG_CHIPID_H, &read);
>> +     ret = cci_read(sensor->regmap, OV5647_REG_CHIPID_H, &read, NULL);
>>        if (ret < 0)
>>                return ret;
>>
>>        if (read != 0x56) {
>> -             dev_err(&client->dev, "ID High expected 0x56 got %x", read);
>> +             dev_err(&client->dev, "ID High expected 0x56 got %llx", read);
>>                return -ENODEV;
>>        }
>>
>> -     ret = ov5647_read(sd, OV5647_REG_CHIPID_L, &read);
>> +     ret = cci_read(sensor->regmap, OV5647_REG_CHIPID_L, &read, NULL);
>>        if (ret < 0)
>>                return ret;
>>
>>        if (read != 0x47) {
>> -             dev_err(&client->dev, "ID Low expected 0x47 got %x", read);
>> +             dev_err(&client->dev, "ID Low expected 0x47 got %llx", read);
>>                return -ENODEV;
>>        }
>>
>> -     return ov5647_write(sd, OV5647_SW_RESET, 0x00);
>> +     return cci_write(sensor->regmap, OV5647_SW_RESET, 0x00, NULL);
>>   }
>>
>>   static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>> @@ -1140,70 +1069,76 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
>>
>>   static int ov5647_s_auto_white_balance(struct v4l2_subdev *sd, u32 val)
>>   {
>> -     return ov5647_write(sd, OV5647_REG_AWB, val ? 1 : 0);
>> +     struct ov5647 *sensor = to_sensor(sd);
>> +
>> +     return cci_write(sensor->regmap, OV5647_REG_AWB, val ? 1 : 0, NULL);
>>   }
>>
>>   static int ov5647_s_autogain(struct v4l2_subdev *sd, u32 val)
>>   {
>> +     struct ov5647 *sensor = to_sensor(sd);
>>        int ret;
>> -     u8 reg;
>> +     u64 reg;
>>
>>        /* Non-zero turns on AGC by clearing bit 1.*/
>> -     ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
>> +     ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
>>        if (ret)
>>                return ret;
>>
>> -     return ov5647_write(sd, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
>> -                                                     : reg | BIT(1));
>> +     return cci_write(sensor->regmap, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
>> +                                                     : reg | BIT(1), NULL);
>>   }
>>
>>   static int ov5647_s_exposure_auto(struct v4l2_subdev *sd, u32 val)
>>   {
>> +     struct ov5647 *sensor = to_sensor(sd);
>>        int ret;
>> -     u8 reg;
>> +     u64 reg;
>>
>>        /*
>>         * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
>>         * clearing bit 0.
>>         */
>> -     ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
>> +     ret = cci_read(sensor->regmap, OV5647_REG_AEC_AGC, &reg, NULL);
>>        if (ret)
>>                return ret;
>>
>> -     return ov5647_write(sd, OV5647_REG_AEC_AGC,
>> +     return cci_write(sensor->regmap, OV5647_REG_AEC_AGC,
>>                            val == V4L2_EXPOSURE_MANUAL ? reg | BIT(0)
>> -                                                     : reg & ~BIT(0));
>> +                                                     : reg & ~BIT(0), NULL);
>>   }
>>
>>   static int ov5647_s_analogue_gain(struct v4l2_subdev *sd, u32 val)
>>   {
>> +     struct ov5647 *sensor = to_sensor(sd);
>>        int ret;
>>
>>        /* 10 bits of gain, 2 in the high register. */
>> -     ret = ov5647_write(sd, OV5647_REG_GAIN_HI, (val >> 8) & 3);
>> +     ret = cci_write(sensor->regmap, OV5647_REG_GAIN_HI, (val >> 8) & 3, NULL);
>>        if (ret)
>>                return ret;
>>
>> -     return ov5647_write(sd, OV5647_REG_GAIN_LO, val & 0xff);
>> +     return cci_write(sensor->regmap, OV5647_REG_GAIN_LO, val & 0xff, NULL);
>>   }
>>
>>   static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
>>   {
>> +     struct ov5647 *sensor = to_sensor(sd);
>>        int ret;
>>
>>        /*
>>         * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
>>         * which we leave as zero (and don't receive in "val").
>>         */
>> -     ret = ov5647_write(sd, OV5647_REG_EXP_HI, (val >> 12) & 0xf);
>> +     ret = cci_write(sensor->regmap, OV5647_REG_EXP_HI, (val >> 12) & 0xf, NULL);
>>        if (ret)
>>                return ret;
>>
>> -     ret = ov5647_write(sd, OV5647_REG_EXP_MID, (val >> 4) & 0xff);
>> +     ret = cci_write(sensor->regmap, OV5647_REG_EXP_MID, (val >> 4) & 0xff, NULL);
>>        if (ret)
>>                return ret;
>>
>> -     return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
>> +     return cci_write(sensor->regmap, OV5647_REG_EXP_LO, (val & 0xf) << 4, NULL);
>>   }
>>
>>   static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>> @@ -1254,12 +1189,12 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>>                ret = ov5647_s_exposure(sd, ctrl->val);
>>                break;
>>        case V4L2_CID_VBLANK:
>> -             ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
>> -                                  sensor->mode->format.height + ctrl->val);
>> +             ret = cci_write(sensor->regmap, OV5647_REG_VTS_HI,
>> +                                     sensor->mode->format.height + ctrl->val, NULL);
> That's a bug, the OV5647_REG_VTS_LO register isn't written anymore.
> Switching to a 16-bit register for OV5647_REG_VTS as mentioned above
> will fix it.
>
>>                break;
>>        case V4L2_CID_TEST_PATTERN:
>> -             ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
>> -                                ov5647_test_pattern_val[ctrl->val]);
>> +             ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
>> +                                     ov5647_test_pattern_val[ctrl->val], NULL);
>>                break;
>>
>>        /* Read-only, but we adjust it based on mode. */
>> @@ -1435,6 +1370,13 @@ static int ov5647_probe(struct i2c_client *client)
>>        if (ret < 0)
>>                goto ctrl_handler_free;
>>
>> +     sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
>> +     if (IS_ERR(sensor->regmap)) {
>> +             ret = PTR_ERR(sensor->regmap);
>> +             dev_err(dev, "failed to initialize CCI: %d\n", ret);
>> +             goto entity_cleanup;
>> +     }
>> +
>>        ret = ov5647_power_on(dev);
>>        if (ret)
>>                goto entity_cleanup;

Thank you very much for your detailed and thorough review of my patch.

I really appreciate the time you took to provide such comprehensive 
feedback.


You're absolutely right about all the issues you've pointed out. I 
apologize for

the oversights in my initial submission.


I'll prepare a v2 patch that addresses all these issues. The changes 
will include:
- Proper register width definitions
- Fixed formatting and indentation
- Error chaining implementation
- Simplified chip detection logic
- Clean compilation with -Werror

Thank you again for your patience and excellent guidance. Your review 
has definitely

helped me improve both the code quality and my understanding of the CCI 
framework.


Best regards,
Xiaolei
> --
> Regards,
>
> Laurent Pinchart

