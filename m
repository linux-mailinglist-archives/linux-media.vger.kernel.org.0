Return-Path: <linux-media+bounces-48225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB3ECA35CA
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 12:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6DE431424AB
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 10:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A89339B30;
	Thu,  4 Dec 2025 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="sw35tyS0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48B825F99B;
	Thu,  4 Dec 2025 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764845876; cv=fail; b=VTAW7xT0X2X22dNaZ/8ORtqjRgFqJTKop1qmhTZG7BJW9WJ4VqJktytN4g5MAPUXF7ABCZn9EKvzLfRuqKZtUB0nUyxvK9XszyLakrf+pP7jAjE95h0HkFH/w4OgAOCBNINO3FRY7HsOSJOlDDCZoI9pjb+0r4WRU223n7QyYsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764845876; c=relaxed/simple;
	bh=frCC5SywKIVJUpJANOXj+NGiprH9Hg2aVP2Tcd2ENyQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ugNirkMB55ERXZ44WTJnParG4XBQrluxlh3t6mt+Cn62ifAB5Os9h9ZaRvN/JCDtoqhKf+bhnXW2hrLnFxGsVWGz2puDREFs3Gj2QqUTQShTFaL43Wz22NjcKf0ZReH3V+l2YGwdRo7vKqSjrrhbvTpIDnsOgkyL1V6Htb7FLNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=sw35tyS0; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B48UKYZ2404193;
	Thu, 4 Dec 2025 10:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=lyeDeY6sAtuRdnN0bEsWfMLxLCx2z7aWN/UCSwX8kXI=; b=
	sw35tyS0l7cwaDJ+IM9K5XfEE3ZUbArt9QZAvN8M2YOStsEqdrmN5AuNt/47wTEn
	6SoHSNaHyqR+3sz4t0XI4w3Kn5MPtTraHgfDd6FCgUleQ+cpRDTpWcb3DMG8RABc
	EubKuBt5sItfagdhBB2gAW7bOwcmL2jJVl6yiWx3YtqKMmtPAkjts6WOunj6eNMo
	5QE2gZCaPIXeW0Ebsl+anx0hjenHjKQttM5pAZT+hA2Bwa2R5X8fhbVuqaafBADe
	kaKPpvMY1ActNR55+jZq4LEY4y2oTBfHv6CwLVvqTzcK5Q4wZETOGqWa2+reBpbz
	fyMEP+nf2FXG9wU19+hrQQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21xb16-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 10:57:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c47GXmoV2eBWP7LW7IOIE/ayRMdLHs58CX0M31iIqPTJsE9OsecVJ+5rIfqXXXIVzvSrjUFdb4nnOD6ag4zSTM0FC+ENW8kov/AbQUkFs6HIpmA78z+6FE5hd9UJs/HWah8Zh3n3a2NsXW8Ddb2HokE1lRovQ/7aI9FW7Xi/XT/HoLJ3LIwixzAGuEFAj2uMuQYA0ba6An4+nAIgueMI2w1TPeS/ihaduOdnBP15V/NMPQ6a2R/Knu310PIbTl9E9QRHP5ZlVcffqlF+hRDpQoch/Afb/uErcXbUje07zWITqzl03Pj//uQ+g28idAuk9jlRaF5LWvrx1kIhLat3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyeDeY6sAtuRdnN0bEsWfMLxLCx2z7aWN/UCSwX8kXI=;
 b=X8HiV+ctHPLS6b8wfblMN532Lr9zyy/NAuqcY8h/ENsxUEiv+IJhn6XFLy/psN9Y5ZgFu/AxT+FrNM2RvcjZ/4UwOx03TTWQwPl5oVyPJY3+SCCVa6tNUzRJgxPae/QUW4aU+UZPJcX3IZruaiCZS3pmETXVNda69kI2Xw3b/LLDHXkk17RSisMiaWvY3vOQiVxlWPGOxzQ6akqESuuTrhDIxyVOvTyQD174GXyke+jSldxQ5nSD5g0G0Wc44/+rgoUEwuwin6eIaeu8YX2DOE6razlLLJXsPh+vDxGZ0zfSf3Xu+SvR7pf3iczKrgpk6mBWJNzoyg+L2hGOeyGntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH0PR11MB4981.namprd11.prod.outlook.com
 (2603:10b6:510:39::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 10:57:25 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 10:57:24 +0000
Message-ID: <254356bd-0ea3-48a2-8a11-8f91cc8a099f@windriver.com>
Date: Thu, 4 Dec 2025 18:57:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov5647: use our own mutex for the ctrl lock
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251201000026.690298-1-xiaolei.wang@windriver.com>
 <aTFeb6RG1ER7dzX5@kekkonen.localdomain>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <aTFeb6RG1ER7dzX5@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P286CA0090.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::17) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH0PR11MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b26ddea-2ff7-4b98-dc05-08de3323e836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0FCNTFjSjg3N3pKNEUwMnB5UlVNbmxlc2tqTFVIakd0WVBDMkxYeFpzQnFH?=
 =?utf-8?B?Y0lXQWhDVlNaemlqK0dTdWpyWmtaT3oreUF5MFhnVFNYQVEwL2M5ZEdpYjdW?=
 =?utf-8?B?aW9Ed2N6MUpTQWZUNkZ5LzI5Rm1oME8relVHVUltMUNqSW83YlVyV09EeDRv?=
 =?utf-8?B?MkNVaGcvUjEwVGJJemxNd3E4Z1ZENDRvdDU1RU9HeERLeGh4NWpyRnJKT1ZB?=
 =?utf-8?B?VHl6TEZ2eittbHU3WFZFVFJXTTRaaUFvaXpLOVZZWGJnamE4cmUvNTdLcnJQ?=
 =?utf-8?B?NU9Vc1BEVy8xLzhBK01GaDJjWnhXZkM2UGMzc3kxQVExVzM5cHFjZkN4WXBu?=
 =?utf-8?B?ZmNyTEhLQmVrZlY5aXRkbFk3N1lxU2owRFptT0V6dFBlNFZTR0ZXdEZFd1V6?=
 =?utf-8?B?UTVRRkYrY2hBWjZMWm5HY1ovc2J0TFVFakFwemdrckNDc3Z5djdQNWRaeWdS?=
 =?utf-8?B?VWo4c2ZYTTJWMHVINGFzVnZoV2c5cmtjZFRaazRtbDdVK3didTAyam1sVlp4?=
 =?utf-8?B?NCtDeVJNejdTVlZGYWwvUlN4OXlSSXVUWWlsRVZNRnUxcnExL3dlNzBxUVJG?=
 =?utf-8?B?aVlqdTlheDJENjNMM2daMEFET2ZESk4zV05hZStJQ0g5VjlmRWhNV2dEVStl?=
 =?utf-8?B?bzVuOTloZ1JRWVJaVFF3MjhMV0RWQThpMitKV2NJR0lGUCs3WkxjR0l1bmRw?=
 =?utf-8?B?cU5udkk3Z1lqdm5uWmdsbmM0ZG5RRU0zdVJLeEJCbzlVS0YzOGY1Rng0VWtC?=
 =?utf-8?B?ZnRaTWs0RW83cmtmNHdsTng4VE1wclljSGJpYUxFbDY0NlcwTGZDbnJ4Snhq?=
 =?utf-8?B?MW1TcTFYYW5pM1d4TnQyd3ZYK0wrWnQ0S1dzQnRQUE1GaDU4RzZuU3BVMTVj?=
 =?utf-8?B?MlkzQkgrRkdWYmJhUGtMUmVuczhiN0FYWGVybEw4UzhOZUFuNlRJSVFCSm5V?=
 =?utf-8?B?cmszTE5tWEgwOFljeVl4Yi9iOU1jQStEb2p3c2toTlRIVUdqK2theHZmN3Yv?=
 =?utf-8?B?UjdyaFR0TVZkdUxIUGU0TFFSa0JBNFdNWUc0SE9velF2Nm02NXg1Z1hGSVJl?=
 =?utf-8?B?ZC81TVduOW50cHgxSDRHQ3NaVzF6UkJuVzJxWHhCcmcyVUgwa1VVTDMwejRj?=
 =?utf-8?B?NnltVmNQYjArWm5ZbjJQRFBrUDZUZ1NaajdaU0duY2x1TDF3YUN6TzZRVVFN?=
 =?utf-8?B?b29qQitiaWlxcXFUMHBWM2g5b0orVnY4SGFHaTVDTWFkQytaRzh3VHBNQ3Az?=
 =?utf-8?B?Mk5yYXVRWXJxVGxVVFNlcENFSU15Q3o5emtleFdIcHY4SmtpMXUyQVNUS3Zs?=
 =?utf-8?B?NEN6RVNzUml1Ynl2YmVxK243NWFXVDZFeGJ3MDhsNUN1Uk1pWkJxSjRPOHRY?=
 =?utf-8?B?Si9rRnlONDM4MnBVNGRMbVcvZC90YWNwenZxL0pBcitGQmRLMmNOUnhWRnhu?=
 =?utf-8?B?Z2g4cXJTZVowMWZRNFZrRXVYangvUzhNb2xtYUhxWUVhaGdPRGFjOE12b1JZ?=
 =?utf-8?B?MFRvUlJBSUlSL0JkYTRoaHRTVXlPWk1Kb2IydDRJTmpNQUJvbHhYVFc5M3Zw?=
 =?utf-8?B?UkVhellBekVwSzBNZ0JGVmRuMTRzU1R4bmpxZ3R5ZURBRmhBR1YzOERPb0dl?=
 =?utf-8?B?T3hHUm8vdkZYRDkxWmwzaXVRT2RvWVpRUHFKeXZHSmo5a2NUS0xSVW8wQnhY?=
 =?utf-8?B?bVBUYkYzbnAyY3FYUit3a2dHTjdGSnZoOWhaNms5VllzVlRFeVFIemxETkJa?=
 =?utf-8?B?M2RIK1VDZkRYQVVRQS9xNGltY0ZOYUVVaXB3SzA1bEZaclVxdktDa2REaElH?=
 =?utf-8?B?dmttb1pUVkRWTHBrWm1KdjZHZmxMZXVZZHQxSEtDRkVOdzlONXRLaHdiZXRR?=
 =?utf-8?B?UnFickh6ZVp5V2xoTjhMczBWSnU2YnlYYVl6SXNrZ25LVlFxakNmNDRtdUxy?=
 =?utf-8?Q?wtqm2qh5Kf7D6TqXSViOBO71oGFhmElE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dll4ei9DaFhIbnRBMTNZclB4MnQ1Y2NEbUpXQ3FOQzNDR25CRWNteU5Cd0d6?=
 =?utf-8?B?QVd6L3FmbG5LMzgrYlFObW02S0MrbmNWZ1hlTXVQVmp1dWdFcEppV0VabWZj?=
 =?utf-8?B?NmVEUGJ4dVE0dWtTU2F6ZnpNR25BZGZIczJERTUvc0pUd0Z0TExxeEJ2LzdK?=
 =?utf-8?B?d3RFYjhlaWg3K1czaFhXL3ZJbUx3Q0I2TmJZUEY4NlpQRFJJT1luTDBGRjVK?=
 =?utf-8?B?dHlSdTNMMU8zVmtXUWozdjhCeGVodTlxSHRvWGg2VWN3VC95cWx2YzVjOVBp?=
 =?utf-8?B?NWZ2RWhzNnVBMkU4ZTkyZEJJREltR1ZUeG9mR0tZa2EzQm8vYkVEMGZvallk?=
 =?utf-8?B?WlpqVjRYb0ovMWlHdVA3SnBTWDltUmRBeGJYenc5VW4zUTBqbDdSbTNzRlFa?=
 =?utf-8?B?K2pLc0p6S1g4NkNzT1hGQmI5SS9NVnpwOEp2STF5RUtuZlZOV3BpbHc3b3FE?=
 =?utf-8?B?eXkrVHNtZzFnUVNIS3NheU9vcEpWekwxOUhHK2dqdmNCSjVxcUllKzlWS1NX?=
 =?utf-8?B?SGNxamxNb2xwUDY5VFI3S0wvNGdOLysyVUZIMVg2VXhGaHg5cVZiYWd5ajZZ?=
 =?utf-8?B?c0dJc0FDVXB0VlVjK0hZeTk2TmJ1VzZlUWQ5TGtuZkVDZHpuS2JPa1NWQ3g1?=
 =?utf-8?B?anRmVnplMTJtN1BSeWNkS3NYR1k5b1RUb2xDWWx3NGJ5dFlYYkRKNlVvdzlV?=
 =?utf-8?B?WFlsYjZ3VUJlUWFtTldNSzYzMElldjEvSHo2MlRQQWJTaDFhbVI2QmsyRjZl?=
 =?utf-8?B?Wk1mRVR2QVMxVlBmV09TdUIrcUJMTG5WWWkvcmFDNGE3Mkdua3F5Z3dSMnpZ?=
 =?utf-8?B?VG5yYytPZXpwR1lWSUxpNHJhbXlOU0lWWC8wZitNVjhMd2NMSS9yempxVExD?=
 =?utf-8?B?SEp2NXFTeERYVGlJenVTMmZaenhHdGQyUUFyRTZldXV5NmpYbk9lQVF3aUpD?=
 =?utf-8?B?ejdIeEFrSVJYUk5jbDJEQ0VmZk4zRERwOEgrS3FSeU5wNUtQRmppN3U3OHpD?=
 =?utf-8?B?c0RaVDB4VHdDczFaa1JoY2tCS1Z4Z09JeUxKMlFIaUxGc1BMYmxGMFNISG43?=
 =?utf-8?B?dkNyNnZuSFk0Y3V0dUNMZno1dDFSaEdFMXY1ZnU2am1BSzRWV096WE9NWDRj?=
 =?utf-8?B?R0RvUkF5R01FaDQvZk1sU0JURmpwYzdKVS8wQ01nS0didE9ERFhid295a3Jq?=
 =?utf-8?B?NDdUOXd1Sm84RVhMd1gxd2w3S1VyYXV3OEZiTC9NeUhZK0lTTTBVTVdyMHV3?=
 =?utf-8?B?SGN4RlQvNjRHWEdMQlgwcm5TcnhHMWFrUjNvdFJTTEhTeFJPYUZXZjZ5dUNn?=
 =?utf-8?B?ZGNBWGNTVGxmM0VXeTcyY05ZZkh1YTZ4cHlyWXpZWjNyMlZRbm4xZHFwMzlt?=
 =?utf-8?B?aGhPSGphN3RtNHRuWGFibC9YSHVaUFNSUGxBYnNDYVVQLys1Q0kyc2ovQ0JP?=
 =?utf-8?B?cmdOVmp0R2ZleHd3Z3lHeVhXRWdIT20xUFNkZHNXUHR1Wm1ZR0tubHJFTk9t?=
 =?utf-8?B?Z2hhblQ4M1FUM3ArelRlZFJFL1g3TzRHcmtqMjM5bnlaajBiWk5sdE9wOGF2?=
 =?utf-8?B?K0F1MXhLNm5WVDhGd05mWWxmdkI4TzkrSER0SjNMYWxiYUtrM2t5aW5XWDNh?=
 =?utf-8?B?cHdjOFVnWnRpaXpkYVI3TVFvQ3kwZEVpeU00VzFCMEpiOXBzVE11ZjY3Q3p1?=
 =?utf-8?B?Z0hnYktRZW1kV3JBZ0dkUXZUUy9NSU1YdndPUDBqZHlxMGZibWxBQ2o1TkNG?=
 =?utf-8?B?M1lNWTFtVFpMM0tBZ1FQUjk0Um1jT2QwOE83YVgzTFZRcnpGNFZ0alBMQkcy?=
 =?utf-8?B?L1BMem83cEw3WWk3akRWZDhnYXYyY3NvR2ttYUJ2MTJPSE1BZzUwTHVBWGpY?=
 =?utf-8?B?cFQwY0N6R2E5T2JNdHRCc2l1SGdYN3g5TUZMU25SNEVWeHc5c0VCTmNyVkVr?=
 =?utf-8?B?NXpDc3ZHWUFnTmg2bzVmU2Yxc2ZVbklrRmhXZDUyMmtLMjZFWHZtNnZNTVZM?=
 =?utf-8?B?T0pCRFZkV1ptZ2FXYWN2MjB2Vyt4d1I2dWp6VnJRaUVHdUhPUFQzK0gvRWQv?=
 =?utf-8?B?ZzViQUxZNWNMdDVNTnYrc1dFMXFXYXVvam5Ua08zSjAwSTlnN2hLV3ZvanlM?=
 =?utf-8?B?a0NJTU01dGxBMGZLUjQrMjNLUlNxWlArVm52RE1pQWdUenRYSy9IRlNhR3VO?=
 =?utf-8?B?Nlp2OWwyT1YzWS9KcXh4bkV4Q3E2TENLaXpPUlVrNWVITFBrdmt1MEM2K3Nx?=
 =?utf-8?B?YjJZdUFybGNyb0VRdWFTb25SU0FRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b26ddea-2ff7-4b98-dc05-08de3323e836
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 10:57:24.7754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0df3s2lka2+Ubbs9BNh+9TmttB5kPwmN1UnW/8X22fJbE+uDm3aOpqDGNOP2IJ9mZyxNB7eRDNfQIzOkVID6u+HNBoT0gS18Z6Efj9If1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4981
X-Proofpoint-GUID: a6EfQtuWAiiwWKL5S8TYo26jeAgYDZ6g
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=69316919 cx=c_pps
 a=E7iPWXAsOYqR18yzHj3E3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=AcOy0Yp2IV3pmSpMYQIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA4OCBTYWx0ZWRfX6RL9HxZmqoyL
 cTBcM4foEM4NVfAv26/Tu2dNPxJe4tZRuvLMiiEqJHawqt2slmnw6V7ZdssJm22HCYz8BPWTb/t
 UhfMoVkKhP0k0m7+8ikmuTSuHmGed3SwtNqsAs/1s/poLPNzzU1crzKv53LIXVpPawNdSIvvpVh
 KRL6GHp1QAmR0BC+WQ/eF9QMDupX3aWkQZpwvDZJE009PggMwdT/23CyTDB5c18gXwjd5N0LZIs
 umfn34vBR0ufwfxxkAufR1Imn54KA5LSoDEv6NOZXxaO2TvHxiiwghNK2JDpyjCBDb2oZMi29CM
 TN22em33+88tv5vofb0y3KZNeHoLglHRFJYONc2alyCXaXeuojH3RE3EAfVQd7AU5AeaV3kBwXZ
 ElLrHlCYxUQm1vs+4rc29KiQm7KjHg==
X-Proofpoint-ORIG-GUID: a6EfQtuWAiiwWKL5S8TYo26jeAgYDZ6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040088


On 12/4/25 18:11, Sakari Ailus wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
> On Mon, Dec 01, 2025 at 08:00:26AM +0800, Xiaolei Wang wrote:
>> __v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range()
>> contains an assertion to verify that the v4l2_ctrl_handler::lock
>> is held, as it should only be called when the lock has already
>> been acquired. Therefore use our own mutex for the ctrl lock,
>> otherwise a warning will be  reported.
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/i2c/ov5647.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
>> index e193fef4fced..4e14eefba577 100644
>> --- a/drivers/media/i2c/ov5647.c
>> +++ b/drivers/media/i2c/ov5647.c
>> @@ -1288,9 +1288,12 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>>   {
>>        struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>>        int hblank, exposure_max, exposure_def;
>> +     struct v4l2_ctrl_handler *hdl = &sensor->ctrls;
>>
>>        v4l2_ctrl_handler_init(&sensor->ctrls, 9);
>>
>> +     hdl->lock = &sensor->lock;
> You can use sensor->ctrls here; otherwise change the existing users first
> (but that should go to a separate patch anyway).

OK，I will send version 2.

thanks

xiaolei

>
>> +
>>        v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>>                          V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
>>
> --
> Kind regards,
>
> Sakari Ailus

