Return-Path: <linux-media+bounces-50180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CFAD007EF
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 01:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C599301DE0D
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 00:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EE81DF75B;
	Thu,  8 Jan 2026 00:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="BFNJb6DJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8141C6B4;
	Thu,  8 Jan 2026 00:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767833545; cv=fail; b=qVlE9xC6D7EljDIlUu5DnwuxUNhAjf3wdvyMaYovtLNJMA8LXbwSNPkd2ju3vBQyBYr6cRQg8qn/4BRpHgVdO9sGpTQ5Chrf/oVovjU1SJUs5HsGqLWsWecQ6RAQYeVQOJUV/sKssjZVIir+T0YkgJl9UMbXRXzlBojJkkaLXYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767833545; c=relaxed/simple;
	bh=CeWM84umP1gZKvcu0oMiWa5hbWka8dd36LUvzCXEC/U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bz4EC6zBBQO5SoPzOAudZ9LlSwprSV0bIvfxab15o4jBe89y59kTtHYyiU+TarQFjt0u0qPAQO/p/L9/4viZMPnn7y8kDaVVOI0RJp4kjcXDGcRJa9J+DPfS5TvEAZ864uYXdey1bN2ZEYfkO1JBhvcIA7io3IVVsJr1MmsMdWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=BFNJb6DJ; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6080aQek1835754;
	Thu, 8 Jan 2026 00:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=X7YjYfcJxDwelLgVs1Y4zOlmwtqhgPtw2l63mD41cMc=; b=
	BFNJb6DJCJ5bNCdtSe9i40mXXemgCyPjZr8Ij4rwxyNk+Cr1QCGzkFNR9usZUMd6
	QwfJwte1DcVUSJENspO1YVv6YNC37jSIQZ8bdjDxLrGIt4nmNh/8wXp9dMe2bJsf
	Em0JrBpoLB2NG7EaFLWJSnaNZy6kne/gfpxaRAbV70bRtCZJCmnZJZslnLK9+Opf
	THdUg5rvvhNGH3wm+OLR7jmMjdHVq+DwkW3qIDFtFqrhPHorTpWt2DRf/ttOQ3Fk
	b+qhx1nnFLZwiwsjTuavJFdiVjvLV5ayz0YlzwRoINa5GQyFT0ZSxmJZ9mLqeWnV
	H6Y59YFr0pjrxCvx8QxG3w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravcu1u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 00:51:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YU9izCCyURKlIa4tyieq9HkfLD2tJdUfb9JAvcoyB9VLdFjCMhCHe2xEfIHOTJqQ5rxhzBME8Nj064GaOItVOiGjFWFibC+F16ExH+wb0oUXh7YMlrgWvy0QyKHEJ6Ws/LVP3euEuXp6du902ff+LRaBkWUxVCtaMps5T15CGbr5mVbsfuSptgBWUrFvqj5cg7z96I9TBAPn75D0tlVNNGmKXzqTlmkm0bBNv+42wUWfvOv4l7CHrwFRIMi1e/MYkbBDjKc5XHKcGZ2eMZQ9dYr1cE2/KHmsPlSYCzytsHg9LruHOPSpalDfBEP+hahQqMJvu0+GF6YCiLDLma8/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7YjYfcJxDwelLgVs1Y4zOlmwtqhgPtw2l63mD41cMc=;
 b=tZDJQ3PvOemahGEG+pQ01TiuQb5t8X7YgaT8whPZciU3o07xOjUHusCXZ02uiiTSYnOCtknoBSIjBek3QJRqhZbTDY0vpFV8a7A2a6EqQvzbGeB2Gq76/3jm5A3D/ueNrxoweBCYe8DG3LEV8IXMjSBAur+ujO0fFgX/qdn0Mpctmd662nu73ZrVKL+MqKD26Xc4yrSzHbTQwBJiURYYDDBZ9XI8UfD+fGGr7dE/J2z6eqEe+NnwYvgnAiXtRQlpc63dIzDHzHIiTTg0Gqix+hnaNEJTkLhyI8QqKeWIMIvyONTq2PTXoQF7QwhX3SVmIe40A4JSPY/S9Me3qOTUZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by SJ5PPFE62D2CE76.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 00:51:27 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 00:51:27 +0000
Message-ID: <ea751961-74d0-4d7b-84c4-26ea214c0876@windriver.com>
Date: Thu, 8 Jan 2026 08:51:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: i2c: ov5647: Switch to using the sub-device
 state lock
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
        dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260101103001.207194-1-xiaolei.wang@windriver.com>
 <20260101103001.207194-3-xiaolei.wang@windriver.com>
 <aV7gT5j5JVheV6WW@kekkonen.localdomain>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <aV7gT5j5JVheV6WW@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P301CA0101.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::8) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|SJ5PPFE62D2CE76:EE_
X-MS-Office365-Filtering-Correlation-Id: 107d8bbb-13e2-4a5c-b1b2-08de4e500e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUxuQlZxS2hKcXRjZS8wNnZtMk5SczNCdm5TeFd5UVo3V0cwcWJGaVdiUUpG?=
 =?utf-8?B?ZXdRcjh5SUc3NUlqM2pGNks1VHkwdjhaTXZjREplTW4yK2tlU285YWFPb0ww?=
 =?utf-8?B?WXhlM3J3bTl2b2lxZ1NmTlRYVXNYQ2VlcjA1bmk4cWRrVHhWTXkvMmcvdm02?=
 =?utf-8?B?UmNaVy9idGhtUmw1a2l4OXlOY1VDT3YvZThTVnpxelRkWFk1cUVJdTdWNVd0?=
 =?utf-8?B?bzdJVDdLNUlTM1BFNjFBM1JqWlNnWUcvd0granp1bDhxTnUvTWxjRXN0ejNS?=
 =?utf-8?B?bWRFWVFsMTg0RG5Sd0hFZndzMWRGUjFIZXpSSHNCY3J2T0RZN1JpQmxxY2NE?=
 =?utf-8?B?UWxyWDJmZFNXNUVQKzUxajkxenNYemh3WmxKRmQ2WWxTSVFKb0J4THovOTJh?=
 =?utf-8?B?Ly9ZQk1tNys2VHNPZHVRQ2VPUEZzNUs2N3V4eVpIK2h4Yk04cVh6QSttSFpp?=
 =?utf-8?B?bFVoVTBXdm9BK2p4VUNMR3c1LzFwbFJXZS95a3ZRL1lsZU40dkJDS0dmOE5Q?=
 =?utf-8?B?WmZER1g3V3VZeGZMYVJhQmttN3Ayd1BHYldvMW5zZ3lwcmJ2d1cxNjIzMm5p?=
 =?utf-8?B?L3hneUg3MVJ6dGgwVkdoTzJSUzY0Qnd2RGdmRCtJMVVSV2lVdGNPTHJNYzRF?=
 =?utf-8?B?cnIwR29rY1hTSThXNkVvMmM0T21saHAwb1dUalUvT2xaSHFzM0x4K1VkbVYx?=
 =?utf-8?B?TFVEZ2t5SmY0NDREZmJZeWUwamJHYk0xbFdrZnRzRFpUaVlpckVmbWpnODBV?=
 =?utf-8?B?SzBpT25jMjhNNHRrcFVGK1JtakFPQXdwNnJoZkgwanRDV3lIMFd2UVo5bG1L?=
 =?utf-8?B?NGdlQmRPcitSb2d4YW0wVnAra1RkU3czank2a3JsamlDVjhkNERHbitZT0Vy?=
 =?utf-8?B?c2EyR3FqajAyNmVicnJXWWdhMUdOdTFXaCtDTC9vUC9TNXErUG1tTGR0Z25i?=
 =?utf-8?B?UFhSdHNJM3YzandST0ttSUxRN2JJbmZTbjdhTHVGNks4WWdIaFFNaXhiYm4z?=
 =?utf-8?B?cXZqc1JsQkdyMWpVakorb2FiVGJzNkYzK2MzWU4vQi92a2UzUnd0NVVLanpr?=
 =?utf-8?B?RWR3MFdUaC8yZjhwRE5sWFFzRUdsV1g1UnFSa2JvempSbEUyMkhCZm0rTjJn?=
 =?utf-8?B?ZmJTV2JBYmx0dFQ5dWVJWndPSG1zcm5ocmc0YW91SWlCMURQWFBzQ2ZPMmhC?=
 =?utf-8?B?UjhZamhQaHhhWFQ5c0FqMHhTQmNHNit2dFJNQ2ZKWG1HMXNVU3E4ZVdmbEEw?=
 =?utf-8?B?T3ZYOW0zUHZNU2t2MUd2bU1JM2VxK2FDS0dOYXZYc003YkJBTkZmQmdtb0lS?=
 =?utf-8?B?QVlGbmF4d2FsMzNYV3pCWENHVW5IQUk2OXpORWRrZkd1L3lGWU1jWGxEcGVz?=
 =?utf-8?B?QlpOZ2RoWFFDeTNtb2JXTm1yYnRLWllYLzhyRXBhbUtPeXlDK3Y4TE1YWFBB?=
 =?utf-8?B?TlpTTHRJYnEvN1laM1FJS0tmc2ZSN0xDZDdEQ3hIMjB0THJKdWRlUWdJcEdq?=
 =?utf-8?B?T3ZjakZobENsOTg1dlBuTHpSMnkvUXl4S0pUcmU5V1lwTHE1cGRONm1seVkz?=
 =?utf-8?B?bzlIMllveXBJM3ZJajJOcCtkYWZPN0NtTi83eTN4UFRJUUtWb1NnSzBUL1Vs?=
 =?utf-8?B?QmJJNWQzYUhPQVlFVFpINFV6dHZmRndKS2tpN0x6MDFrdWlmRkxyM05HamRE?=
 =?utf-8?B?RTZtcjJFZzBqL2ZxTFZUSHJ2S01QVTZYT0JBdTMzTEJTM051U3lhSTBDNDc0?=
 =?utf-8?B?SmF5enp3NndsQm9aUEVlT0lBZHFzaW1LbEx3NkF5SDVBK0o4QVNKQlhKMjZ4?=
 =?utf-8?B?YUNRNU9qSHdTT2s1SWprVFZ2YmdsRktobE5TMCtObTNRVGEyNGhNRkZkb2FL?=
 =?utf-8?B?LzRsQzFtNE1UNEt0VmxyZ0MxVjdZbVhPUWFiTGFtRFNQRkhjSzg3Zk9YNGRx?=
 =?utf-8?B?ZTgrRXhnTENsbHFOQ3NCSndIMVg4YWdPci9oSjdyNjZ3NVg2TGJFWU8vVkll?=
 =?utf-8?B?UkkzN1hXSjR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3kxNWVIS0t0WTZCSERpaXhoa002Y0FBVUhoT0ZjQUNCem9DWW1vaWx4bXhV?=
 =?utf-8?B?YXlvWUlKcWxPTjhGZDY2ZGorTHdweG9IU2Y4SmYyeGV3eXgyd1JlVXJRSllj?=
 =?utf-8?B?N25zT0VERCtmK1o0cU5mYitPWktHbzc3b2FFdzJKaUlmQm5OY3ovcGxLdWlv?=
 =?utf-8?B?ZFQxSUR4R1lya0Y1YTR4YWNHRlovd3haK2hOUW9WbXNRWm1Jbkd4R09CWnpa?=
 =?utf-8?B?bVBaWFV0VTUzWDdVMHJ0Tjd2WXlYekl4azhVd0puNXpPL0RHdzVDY0c1Mys1?=
 =?utf-8?B?N0J2M0g2N2tHdUxLMmxJbmt6NTBQNHVLTkhndnNNVmlNbUIyWlV5WVhmSVRi?=
 =?utf-8?B?Sk53c2IwQW4vcHdZdE5CZFAxT1E4SklJVW96b29NbVNsVWpqQU5SZ2ZzSVNK?=
 =?utf-8?B?T0lCVmo1R0VqT2xOSTAvV1VzWVRQaytZMm1CZVBxbFlnQ0ZONTlDWmlVdTJq?=
 =?utf-8?B?bWNiRVJxMlpzQ1NkSFpOQ2hmYXFNR2Z6WS93Y1A4cnNKcnppS0FEd2NrYnpZ?=
 =?utf-8?B?c3FpbjZ1U1lvZkpVUzdzM1doS2Zoem9RN1dnZ1FZd3JnNWhKbFAyK2Fzdzds?=
 =?utf-8?B?RE1TbWNRZ3ZUczJEYUkxVEVycmFPVGRBaE1yZEsybFNjYkQvRGJJNHdTOTl0?=
 =?utf-8?B?QVovS1lkcVhOOFJJM2RmVXhhVUVTcFpOSUgwNDhhUGEvNHd1Ui9YNWdsNGV4?=
 =?utf-8?B?dW9WSWtjcEZoM2dCdExxOU04bFhINnNwVUQyN3R6dWl5OEJHWmlvM216TUpD?=
 =?utf-8?B?d05xL0lYcytPMzVISVZkc3VnTDZ0dUQ5UlIrTHRydDU0QXYvTngvSjNuTDFU?=
 =?utf-8?B?QkdkeTZGNE53c3FFUzRHTnV3ekJEUEVWVlY1b2FSM3J6V0ZHVnRQMlZQaktV?=
 =?utf-8?B?VjdxeEkzUU9zeGpkRERsMUxQS3UxNzU5K2dYallxZ3pkUXU1L2tBT3UrMmlZ?=
 =?utf-8?B?Q2pJeVFmY2ZYWWk4aTNqOVZ5aFZHYlV0bUhvTnpSQksweXFlK09mOVE2U2o2?=
 =?utf-8?B?Rng2dm0rUVJqb0Z5YzlMYVhZVUZLMEtmcVpncFVDRm1wVlBkcVpaVUExcDJk?=
 =?utf-8?B?bDJKa0JBODlpbUtVSDJqTGxaYnBodDYrbkZlQS83YjVQYTBsUm5VU01FNW9t?=
 =?utf-8?B?dzAxck1wUnlXamNiZXdxZTdsZzg5RmJnelhjMC9mRHU5M1JuZERDRVRtaVFK?=
 =?utf-8?B?cUloU1dmbVVrNjlvaXZ0ai93RWluOHcwcVNGbFFIV2Riek51MU4vWXc0R1R3?=
 =?utf-8?B?WjR2VUxIY0ZDS0pLai9TQnlCajNsZXp1WkNqQTVDTDVXeThmbkZvdHFTRnFs?=
 =?utf-8?B?TEFJVmZsYjFoaDMxNEpVWXVEbE1WVC94Mm54dVJvdnhiaEtVNmxLK1JnRmlJ?=
 =?utf-8?B?K1hCSSs0cGtPa3NQN3dNU3pSbDZPeHBTY3ZjQzlxS2J3cUdadFIwZ29rWXpK?=
 =?utf-8?B?Q3RrRElBNVEvNkJiU3U4U0ljMW83RU5hbkNXK2RyaldydExDOUdwUmNBNVBq?=
 =?utf-8?B?Y3NyODNXY01iWHZFLzgvSERGbkptb3ZJQ3cwQ0J4S0duVUlxcUdvL3hiekQv?=
 =?utf-8?B?OEFvR2ZOZytrRlhDVHBPSExHTWp5d3o3NFVwWUtCSmhyNG9XVTRFRk1vbUlt?=
 =?utf-8?B?M0FIcXA3VmEramlUNW02eE1lUkxEOWo2c2RJZituTnM1Lys5UFFLenl4ZjdE?=
 =?utf-8?B?M2pheGUvSHJSd0ZOVmMwT2NOTXJmKzJyN3Z5Z1RzcjBWMXdxczhKOUJFbGFY?=
 =?utf-8?B?VGdWWFNuZElqQ1JMWW05RUJtVDluZUszYStiQ2sreE84UXU1ZVJmQkQrQnQ2?=
 =?utf-8?B?RmJ2Q3c3dGlMUlVJOGlMTnhGKzFCeDUvczcrK1pwcmQ3clV6YXoyaXpOWDdn?=
 =?utf-8?B?MGphZEl1U0h3clBrcUhBeXpQTWN6NjV5VjFudEYyaURCSEY5NXR6OURYeEtk?=
 =?utf-8?B?ampVVk81V0xmVklpWnJWRm53dmJ5MDl2ek1SbzdIbmM1QXJ4OXltL0E3WTg4?=
 =?utf-8?B?Y1lycDBmU1Bvenk2WGtkdHFiem0vSVZzVGZFS3RKRjY2ekVZWkhxSFJmMDBo?=
 =?utf-8?B?aUkxTUZ4OFhlaVpuSG9WSjNLOGxqb2dQTGFBaHdvelhsUStKY2pydnhWVlN2?=
 =?utf-8?B?andHQmlzQjd1KzdCZHoyRFI1Q3hmQU95ajVQY25hdklIQ3ZmUWZESkpka3dy?=
 =?utf-8?B?dDVRRWI3cEY4bW1IQnVsb25EaWRGVnN0VDB5UURSa3JyZTU4cDFvZXJWenB0?=
 =?utf-8?B?dFM0SnVPMkpLejErNVhqR2xiRUJkM25Mcm5lL0FpbnBWaTJSSWFLL2JYdFJN?=
 =?utf-8?B?bnFUS3JHdlNKUllFb3V6S2tZUTFXdEFwYmpQb2hTNksxUVhXa0llYmVKTjJL?=
 =?utf-8?Q?5o42CiecfKScr7k95f2J0/p3yY05txPjtujaxhESOsu5R?=
X-MS-Exchange-AntiSpam-MessageData-1: AeakkhoLlN9aSYIE8UJ/0pan9pbf9Q5YQmo=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107d8bbb-13e2-4a5c-b1b2-08de4e500e17
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 00:51:27.5551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38S3uhNtA4eQNhQ5h+Vl/A0saEtZKV/eqmu6CyXFtVrKIEq8OICYEKlCSCEp5GvipXPxqsqYJUT3kTqZOxSKLzMwJPGFSDSWQbpX0cfrIvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE62D2CE76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAwNCBTYWx0ZWRfXzTUu7vNLCnqg
 q4HL+wdxCLGa9lwRsbAzbrcyp/KykB/Gq8JgVWf+OSXIaAj8uJYOjZHfUBalRzgshlJY03WI3iA
 ipwq4bK7rxut++Cy3cN7Gfo7RhpTjDR64UBLZTqeUUoZPuerdGaEuD/XPH0PnW4+CsDtgEpF4WE
 63OFouAwNL37ABRqJyW51XLMgLCIZYYPUHQon34cV1jlPLExfaEI5Nd+YdL4PS6r7FlRfYHeJQM
 x0Qpx2SVP9S9oekA79QTUmd9ukQQmlg6GCWWqZR5IBC32eSRVQTTlDjILDf15bzqqH1okCP0O2B
 0bH2JBpxPtZfrW5ou9umx5CNwwjh1gY+V4Vnqua+0kCzeE4+YGV+VNeDb3OEk9KmNoGBJb+62GS
 oT4Gj9maFBLwMZU3+mQAWh3W8M4003+vIHNIavMdOxy/5ok6wwNESPXaPuwx+zl+hpn1AxDwbK0
 y6XJBizqE6ssuKQJ06A==
X-Proofpoint-GUID: mwFgUivo1oyLSz1ockep1dAKMZH0fEQh
X-Proofpoint-ORIG-GUID: mwFgUivo1oyLSz1ockep1dAKMZH0fEQh
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695eff92 cx=c_pps
 a=uKk6FyUS+xKIvFCPM6xM7A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xq3W2uTSAAAA:8 a=Tb_N0-5KqeFViQOxjacA:9
 a=QEXdDO2ut3YA:10 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080004

Hi Sakari,

On 1/8/26 06:38, Sakari Ailus wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
> On Thu, Jan 01, 2026 at 06:30:00PM +0800, Xiaolei Wang wrote:
>> @@ -1297,9 +1285,16 @@ static int ov5647_probe(struct i2c_client *client)
>>        if (ret < 0)
>>                goto power_off;
>>
>> +     sd->state_lock = sensor->ctrls.lock;
>> +     ret = v4l2_subdev_init_finalize(sd);
>> +     if (ret < 0) {
>> +             ret = dev_err_probe(dev, ret, "failed to init subdev\n");
>> +             goto power_off;
>> +     }
>> +
>>        ret = v4l2_async_register_subdev(sd);
> v4l2_async_register_subdev() needs to be called before enabling Runtime PM
> below. Not a fault of this patch but it'd be nice to fix that.
Thank you for the review and feedback.

You're absolutely right about the Runtime PM timing issue with

v4l2_async_register_subdev(). I appreciate you pointing that out - I'll

address this in the next version.

>
>>        if (ret < 0)
>> -             goto power_off;
>> +             goto v4l2_subdev_cleanup;
>>
>>        /* Enable runtime PM and turn off the device */
>>        pm_runtime_set_active(dev);
> The first patch doesn't seem to apply; I've taken earlier a set of ov5647
> patches from Dave, could you rebase this on them? They're in my "cleanup"
> branch here
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=cleanup>.

I apologize for the conflict with the first patch. I wasn't aware of Dave's

patches that you had already taken. I'll rebase my series on your cleanup

branch and resend a v5.

Best regards,
Xiaolei

>
> --
> Kind regards,
>
> Sakari Ailus

