Return-Path: <linux-media+bounces-56206-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ABqFyOXumnSXgIAu9opvQ
	(envelope-from <linux-media+bounces-56206-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:14:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC9C2BB4C7
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4663D30093BD
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183A53D6467;
	Wed, 18 Mar 2026 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="jHUBVT2m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4CB3D523B;
	Wed, 18 Mar 2026 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836055; cv=fail; b=ZYfE6Cz/fxcf44yj7bs8PdjNqizABNYL2wEY6QdJqMcKav3uZj8X94RGKCRm2u+pjsK/dr908QYXH62eVypNRX37CiSKj9KUaJgID7hOFYzr55kftyWojmtvRpfgZFDYtjeetmqT4Q1w0b6GrSkO0pZQ0ABSVBw4YoxMcGlE+8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836055; c=relaxed/simple;
	bh=SlGUae+Vp0PUKeaqCvCub3+lyx4beYGinIgTHAzLYYg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=suRSleBJuNBLNi73mXxKMsjh3I0IF+vrj87COLWVoKWFiayP/P0GLApIZhlp0ypSomxSvf1VI+XIoYzgZ+pdAEXPJD5vXTzrWJUC1uRPVttUvUGiVSSY+uLMc7ZbJaqDXu6IyJQ7lQTjGbg26sir4C2690M8BtVxaJh37ZQIB4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=jHUBVT2m; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAU4Jm1842368;
	Wed, 18 Mar 2026 12:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2PTIOibADYm6tYV1PZQBxJEowTpyW1A4TEuW4ZYK7o4=; b=
	jHUBVT2mJDTK0+NSibUEWcGtVBF9xrsmi/EfsoZGAtJA/nqKzw1hfTOsr9hnk1Y5
	uih0A83tdUwBhF1q2Q53o1WpfCUPmfyWvUANeKFJkQufbcBkZcxowP7fcBLcIJW8
	myBzGO+fUpNxIKgQ8j+XNmYXtzSdhyQ71hPkGAFMbkVCKGezg7QPT1CBID21+Otd
	YzzD8vqbSonpmOcb9L3p3LQEYxKPrIRJ9xi5MAGidhQgs05mE5qS4VefcGq2vCEe
	ybRkUVW7YnuGnrU2HP3Yt+DV5FyE+rET/w1pGSHmrO+ThpcxVk21frONNQzJGH9w
	dvBPk5wXNkbrsMbhDYp98Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010053.outbound.protection.outlook.com [52.101.85.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cxm66ann0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 12:13:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mc4ah2/KVEEwCXY2HEXoK4UBO5wx66Ia2uQCrdYePGUFhTaLd9pld+uEesF5uHvaZvXpeRuw1YUZuU6ddfkWm17j4p+WR/UKHW6gNNoAh+RL/Zv+/v7XbjMARItW1n4X0Lss7CX99j1ZL5BiMaSO5MbSvr5y2pruUMVfjs3bQjRFO7hVgYb1KMuXapzO40fdgTGh8bwpUM7thM2CoQ0DtQ6QNC8ezR5irFGjUa51qo6wKVntZ3fD5IwIzPUBD1wZt8cZZgALa3rsRNSgtK69fFYJWIXDWHyQNiax/1VypTGfoK8PsMpcx+ZM+Ik0sDabjyFxwZdX71qau6p6EElCBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PTIOibADYm6tYV1PZQBxJEowTpyW1A4TEuW4ZYK7o4=;
 b=n17luWXjwDL9tO0v2RBPR4rGg1484/H4wN3V065Eg/aemuS7N93v32ZmEMni5eBiXGVTZ/q4XTOOmWKiSN4af7IvUUc7YAfOVhXv1w08SLQadfFsHGmqoN3EI6yNBAfFUx71Zlne5jmlGg2q9iDOz8uTjFA+3+pzAXBV/uY5r2XEDbB5w/EcH1fBh44RSdG8hWW9+mGfn8BnBsX4HqfvC2ZunoBkmbL5rBgHwNpgNm2xeiUsQZGWsx6tTjxTIebN9ECWjWXo349+m1PEdYMSVimpo5Q8Na+jWlYRjRi5GZYkkHKg1EzFO8dd4hkvvUjQZG0NUXlUCLAP+D728dwZlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Wed, 18 Mar
 2026 12:13:20 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%8]) with mapi id 15.20.9723.008; Wed, 18 Mar 2026
 12:13:20 +0000
Message-ID: <6505ab18-5cee-4372-bed7-666a8ef487f4@windriver.com>
Date: Wed, 18 Mar 2026 20:12:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: ov9282: Add test pattern control
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, tarang.raval@siliconsignals.io,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, dave.stevenson@raspberrypi.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260318051618.471375-1-xiaolei.wang@windriver.com>
 <abpV6lostuZsndYw@kekkonen.localdomain>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <abpV6lostuZsndYw@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH3PPF3ECB6A513:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bec1e99-ecf9-415e-b671-08de84e7be8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|366016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pi+IH54w055rYzAMfC+ypwm/3JI+fks2eZJbOL4Ud8Wz5BK8LQuYGzFAWcluccxk3hBh2Jd0DPsHJYtA23hHXy8/pbJ/iWXllCm522t4XI7N2RUHpxroU9/FCHBBaEdQEypyerC6KQB95E3DK9P9PzoJXskUR9Nk1Rk75Izei0sYSNOlNa773v77cA0O7EykAnHn1X7UkvVMSq7ICYGJ+HdhKCmoyum0qMmab5Jy+yxJDhkXBtzzfbLL8h59WqXJZ4rWbvqmKj0ZLQJ//RCEyUOLnbzD98cDJg+uROaj8RQFv2mz0ct02PcFJ81HG50i/IVzDAN0Tg+r+uS4VuYarvV5+IlYFG4giRR27yp8eJ6idOkyyTxW7rsKoO+DHNymk3ptjzrjxdzb6oUz/ybcQeKu0KluCfuX4dZfS3070zEdKDUp4W4NkUZuNUm+sTHut5d0Kl0Ok5+SEsrVEpY1zX2gN591fA+nig1klJ720zYXInIZJEmPKUdtwXu+/xJQeSJkOS8UwSoSrFXD4IQOU/bX+eV0nP1hYok3VPauPrrhL5UhKyyLwlqpDiobNopiFW0zoHlKGWXSpoRCsDSfRSNWZrdizV9azkrmb0ywwkrxaVG2yRcFOoMXiriYdqzdR4bPwugRuGc6q92PcfDBV4ixkDiI+CrrdNgmzNxgA+wkFS8H1WvlRsNNTp+LJpJC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFlMaUp5cWlhK0xkeGx1aW4wb3U4YjNLZUhJdXBFNjFBZ0tWWk5sRjM1L1RM?=
 =?utf-8?B?VlN5Ty9rTDY1bGd0eDVnRnlESlM5SWhGcUNhQmxlOXV4eDlTZXAvdXFYMWQy?=
 =?utf-8?B?d2czWWd0blgzL1pxb1c2a1EyazlCYURLdXVsalRTWERGclo0RHhjTlpkdW01?=
 =?utf-8?B?MVdVK1UrbDV4VUJOZjBqQ21jME8zRDR4blM5OXJsN09KMEczNjZ4c0Z6RXor?=
 =?utf-8?B?ckpuQ0N1YlRCRnFZemZhNUE2RnpSWkhwWWtCVmJFbmUxdkFBaDc0RTU2ZlBV?=
 =?utf-8?B?SU51cDFnUEM3eFFCOHNyRkd6NSt5eFh1MktDcVN1WVhHbW5ROEh6T2lHQkFD?=
 =?utf-8?B?OTQrK1dVS01wYmhBaDlhQUpDOXFXOXJ1ZXQ0cjhndEJhWDcrUVFKaVVWeERi?=
 =?utf-8?B?aEFBZHBlQXZXb0U3aTFhMEpxOFFFY3pwWTZ2UjVST1JQdGR6cEhKcHNaK3Fs?=
 =?utf-8?B?L0ppbitlVVZSZzV2TWRKVVBlaUZoVkNseW9GTjlGM2JsY2ZOcGpaN3J0Y3JE?=
 =?utf-8?B?cVh5RkJsb09GZVJwdjVGbFVQZ2tJYm96R25MUTN3Qi9SdklkYnBtTndZNHZL?=
 =?utf-8?B?TmFua05sYVE3aVREY2xZUElkVWZ4M3pMZmhDSmZmWDJEclVNUTR0aGtVOFd2?=
 =?utf-8?B?NmlIQ0hZSjZ6QWlJU0NUOUZUVEtrbjlCOWZIbm5lYU1jV0hoMTl0NWtOK1lN?=
 =?utf-8?B?Zmp2VVR0Yk4rZVNuNmpuMHpidmxaa2M2a3VJamlxRTFlK0VMK3RmcXdZVkhJ?=
 =?utf-8?B?UTZJQ2pXSktmS2dRblMvdFI5Uk1HWnU5ai9nUFNOY1BuYlMvTm81MHRFa0lO?=
 =?utf-8?B?Yjg2cm41ZTZodFpEQjZDQ1Zybk1jRVZvcG1xUlFOSmNkSWU3TUJqWWJ2TS9r?=
 =?utf-8?B?N0lsdlNpWnNVeVVDUnV0NEUyOFY1Zm9zRjR2M1lJbnJwUktVbW11aHVVZUI1?=
 =?utf-8?B?ejB0Qkpnem5DZnNLeVFTY3MvWG9OYUg5dGFvWDQvZWY4bTUzRy9qZms3UEZP?=
 =?utf-8?B?TlUzL3ZyS0VxNWV1U3FIUXRSaDhWYVU0U05tM3dyZ01uUDgzQXBldDV3KzBq?=
 =?utf-8?B?TFp6TGhKajBPbWFXT296SmQwejZRSUNRV3QrR0dtVUF4MVBmdXJhTlA0UnBi?=
 =?utf-8?B?V29FNUFKV0ViTHdMbWJJRXpvVG1kQ1FIL3p6SnhnVFpOUU1lT0JxQ0g4cngx?=
 =?utf-8?B?ejE0MUlZMW81UDQ1N0xEaDhWdU56UFVlMGtJRjBodUg3czZkcDB4VDFVemty?=
 =?utf-8?B?TVVPQU9jTFZ5Q2NLZFpXWjhTTzdVSXFQczZmdTFMR0NCZCtwR2VhTzlxTFc2?=
 =?utf-8?B?R0FSZUJIU1Blb2JIRjczTEI2ZitQUTljbTJKdllpYVBFdUIzMTIvcWo4bXdJ?=
 =?utf-8?B?OEdjMlhhTnFVclBVcFRJVVVyVWVoelozbFBLV0JKYnhpcUlWVFNWaE5YcDdq?=
 =?utf-8?B?VGhtakduQk11ck16UzU1RFY3WG5UQmFjMVArYVZ1bHZVVlk3bXZVTnhGQWpI?=
 =?utf-8?B?eGJ4TjJNL3Z0aW5hTFViblJhdDliQkV4SHBCN1JhaUo1L3poY3diNVF0eExk?=
 =?utf-8?B?NFlpR1gzSGpXMGNYUkEwSVlCL3k2WWl0WlltNDFuVm90NXVrVzFkdEtlNTJl?=
 =?utf-8?B?bHFoY2ZzWFk4M3RaOURWSzFpT2R4aDk4OTlkSGh5cWVScUQ4Qy9IdThNZys1?=
 =?utf-8?B?MlFHdVA2RXQxYk9iTWVWb0pZNmt3SFE1QVBKUkZDVFlRZGVFY1hpNS92b2p4?=
 =?utf-8?B?WGNtSkNGVHRFODZMMGY0OFBHejJjb21TZ2xLZ3RyMDYrdWtsZTZtbUFLZjBi?=
 =?utf-8?B?V01WYWpxR0c3eVRSRDArZlpMV2RSakZ1YUdSWTcwTE5PQ1RySUZsbXFFSDBT?=
 =?utf-8?B?S1orMEVUd21wNk5xRm42LzRWUjZnQklzM21WK3RIMWV4aDZEaW5UZTBMMTNX?=
 =?utf-8?B?NnprWlRIYjcweDJqQkRad2ZFVmI1QUpPUjNpTzhxZ05FTWJlakNGbXJjWHRC?=
 =?utf-8?B?eWFDeERpYnJHYTRLdlBwNUs1VnlwZm9ZcXRRVm5sVXNxMERjMGlENE1RWHBT?=
 =?utf-8?B?V014LzV6QnVUdjBOVGliZHZ3VUxNVDc5UmZGVDZ0UVVPRERmMGZ5SXlCVVBx?=
 =?utf-8?B?eUlHdTBuc2tNN2FQRlVhcDNxSkdoUUVsQ3JJQzBGeklUdHpWdUV0WmF0VXh1?=
 =?utf-8?B?SEtncEFVMHZOdVhrL096VFVEWEZldjlWMUVmVGoxU0sxTGF0MHo5aFc2MEd4?=
 =?utf-8?B?aVRCcTQ3RVArUVRxQS9xUHphdGdTbS9LR2V1MGxLK2s4ZWdIRHRuRWxId2lL?=
 =?utf-8?B?M0VyZFVORnpyeEVSNTY4SnVZYWhHbU9JTVVWQXpuTTFiMWhSbVRaWmUyMHlM?=
 =?utf-8?Q?pPylCsReQwXEP779yujZrGvPeJhU73/yfHiCWOMkYBwap?=
X-MS-Exchange-AntiSpam-MessageData-1: gqrb0efYuVPVSxJmLCGQkp59WjGiN6pBzgA=
X-Exchange-RoutingPolicyChecked:
	NvcXsYEyRnOBhE5/6uhJAH+8RRRMqtD5ao16sewRBIGLxEpIYfIkIFO9Y241Wnbs09Becee+zEMqId0IPCESYKab2qUMNEN5rD7ZBbTgji7lIl7nZpuNzC0X6t1wc+/JZm7xAjy/zWs5l80E1mbfkZb+6v6c3fJdx6dDGnGbUOiB1v2nVoncb5ZpsaTOy76I2cFCiboVMDe3REbyxSjgrD6naImiPj9/Pbf4siWhyCsJxd5WRWeWijLMLttk1bQpHq0qTt9t7SKXtpCMgRZuBofXBwqCouPozx8aizfpOJN/dvWXDf6oB04yfb4QxTfQhrEYOtNdtzCLcZV9ZGUl6A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bec1e99-ecf9-415e-b671-08de84e7be8c
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 12:13:20.4872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFdrFjOsTVYLmnXpjWAQLkxd1hisu/9KALtjQ6fmaGfPYlHqRVtgutafg+xmOSk1qBFr5z/XPa+C9yF0m/5sqXIBq5OocnqVnKXd5fAtwfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF3ECB6A513
X-Proofpoint-ORIG-GUID: UMgETFlYeQ4JjI7lBAnag4YErfK-ymNl
X-Proofpoint-GUID: UMgETFlYeQ4JjI7lBAnag4YErfK-ymNl
X-Authority-Analysis: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69ba96e3 cx=c_pps
 a=m6tRWrYHdetyOVyhMCHtWA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=xq3W2uTSAAAA:8 a=t7CeM3EgAAAA:8 a=1kaJANb_SDOaxdmP6CwA:9 a=QEXdDO2ut3YA:10
 a=P5L7wpMTXyg1GfFA3Gwx:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEwMyBTYWx0ZWRfX7Vii2huySZer
 WCOj6HkX8EzlKoVSz44oj1Rv4zo4zAEE53ni0p1AEjJ8PnArRh2N0MQYFsBSkNE43t2c6K13xwd
 Ely5wIJLOYLSRaOQFYTsSPGBDnjRq3OWZdXPxXN8j+eprKGYELgJk5DJuCFWOFiG/Zm1W/x8xfu
 7Czyhhdf6bDGR5JwEgTtBUI4104P1yhVeZ1dZtWrmVjswdZBQLOBI6ik1GOsP7kH1KZmGZUCWM4
 w0fLMyB8VJzf0CUAW5ofRvaXIDNpVwnjbtS+T9rdolm2gIreNSjaGMFHFvC4mBd85YOHWwNIWRA
 /Xfewu0A46mO/XKqKojpPMSyPVmaPRGlWKBA0w6/J+xVwjAAhGLDeSPgJkpD9dwoEBjC2j50YBv
 HbMcJIWXxjg3XWr6l3UlPkqR2x55hn43TVvyJp7XlMUAOVzqrVpqAHjYrFKNhT3HtoYvOJ0P7Ma
 X6DWXbOIDROs2TtOyPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180103
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56206-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,raspberrypi.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxtv.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EC9C2BB4C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thanks for the review.

On 3/18/26 15:36, Sakari Ailus wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
> Thanks for the update.
>
> On Wed, Mar 18, 2026 at 01:16:18PM +0800, Xiaolei Wang wrote:
>> Add V4L2_CID_TEST_PATTERN control with bar and solid white patterns.
>> Since the OV9282 is a monochrome sensor, white is more useful than
>> black for solid pattern testing.
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>
>> Changes in v2:
>>   - Rename to "Bar" / "Solid White" since OV9282 is a monochrome
>>     sensor (Dave)
>>   - Use cci_write instead of cci_update_bits (Dave)
>>   - Default solid pattern to white (Dave)
>>   Link to v1: https://patchwork.linuxtv.org/project/linux-media/patch/20260316090558.1537823-1-xiaolei.wang@windriver.com/
>>
>>   drivers/media/i2c/ov9282.c | 61 +++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 60 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
>> index 2167fb73ea41..85f612e7ab28 100644
>> --- a/drivers/media/i2c/ov9282.c
>> +++ b/drivers/media/i2c/ov9282.c
>> @@ -104,6 +104,17 @@
>>   #define OV9282_REG_STROBE_FRAME_SPAN         CCI_REG32(0x3925)
>>   #define OV9282_STROBE_FRAME_SPAN_DEFAULT     0x0000001a
>>
>> +/* Test Pattern registers */
>> +#define OV9282_REG_TEST_PATTERN_BAR  CCI_REG8(0x5e00)
>> +#define OV9282_TEST_PATTERN_BAR_EN   BIT(7)
>> +#define OV9282_REG_TEST_PATTERN_SOLID        CCI_REG8(0x4320)
>> +#define OV9282_TEST_PATTERN_SOLID_EN BIT(1)
>> +#define OV9282_TEST_PATTERN_SOLID_DEFAULT    0x80
>> +#define OV9282_REG_SOLID_P1          CCI_REG16(0x4322)
>> +#define OV9282_REG_SOLID_P2          CCI_REG16(0x4324)
>> +#define OV9282_REG_SOLID_P3          CCI_REG16(0x4328)
>> +#define OV9282_REG_SOLID_P4          CCI_REG16(0x4326)
>> +
>>   /* Input clock rate */
>>   #define OV9282_INCLK_RATE    24000000
>>
>> @@ -462,6 +473,18 @@ static const struct ov9282_mode supported_modes[] = {
>>        },
>>   };
>>
>> +enum {
>> +     OV9282_TEST_PATTERN_DISABLED,
>> +     OV9282_TEST_PATTERN_BAR,
>> +     OV9282_TEST_PATTERN_SOLID_WHITE,
>> +};
>> +
>> +static const char * const ov9282_test_pattern_menu[] = {
>> +     "Disabled",
>> +     "Bar",
>> +     "Solid White",
>> +};
>> +
>>   /**
>>    * to_ov9282() - ov9282 V4L2 sub-device to ov9282 device.
>>    * @subdev: pointer to ov9282 V4L2 sub-device
>> @@ -586,6 +609,32 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
>>        return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
>>   }
>>
>> +static int ov9282_set_ctrl_test_pattern(struct ov9282 *ov9282, int pattern)
>> +{
>> +     int ret;
>> +
>> +     ret = cci_write(ov9282->regmap, OV9282_REG_TEST_PATTERN_BAR,
>> +                     pattern == OV9282_TEST_PATTERN_BAR ?
>> +                     OV9282_TEST_PATTERN_BAR_EN : 0, NULL);
>> +     if (ret)
>> +             return ret;
>> +
>> +     if (pattern == OV9282_TEST_PATTERN_SOLID_WHITE) {
>> +             /* Set all four pixel values to 0x3ff (white) */
>> +             cci_write(ov9282->regmap, OV9282_REG_SOLID_P1, 0x3ff, &ret);
>> +             cci_write(ov9282->regmap, OV9282_REG_SOLID_P2, 0x3ff, &ret);
>> +             cci_write(ov9282->regmap, OV9282_REG_SOLID_P3, 0x3ff, &ret);
>> +             cci_write(ov9282->regmap, OV9282_REG_SOLID_P4, 0x3ff, &ret);
>> +             if (ret)
>> +                     return ret;
>> +     }
>> +
>> +     return cci_write(ov9282->regmap, OV9282_REG_TEST_PATTERN_SOLID,
>> +                      pattern == OV9282_TEST_PATTERN_SOLID_WHITE ?
>> +                      OV9282_TEST_PATTERN_SOLID_DEFAULT | OV9282_TEST_PATTERN_SOLID_EN :
>> +                      OV9282_TEST_PATTERN_SOLID_DEFAULT, NULL);
> As OV9282_TEST_PATTERN_SOLID_DEFAULT isn't conditional, you can keep it out
> of the ternary operator.

My mistake, I will update it in the next version.

thanks

xiaolei

>
>> +}
>> +
>>   /**
>>    * ov9282_set_ctrl() - Set subdevice control
>>    * @ctrl: pointer to v4l2_ctrl structure
>> @@ -662,6 +711,11 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>>        case V4L2_CID_FLASH_DURATION:
>>                ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
>>                break;
>> +
>> +     case V4L2_CID_TEST_PATTERN:
>> +             ret = ov9282_set_ctrl_test_pattern(ov9282, ctrl->val);
>> +             break;
>> +
>>        default:
>>                dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>>                ret = -EINVAL;
>> @@ -1242,7 +1296,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>>        u32 lpfr;
>>        int ret;
>>
>> -     ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
>> +     ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
>>        if (ret)
>>                return ret;
>>
>> @@ -1314,6 +1368,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>>                                  V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
>>                                  OV9282_STROBE_FRAME_SPAN_DEFAULT);
>>
>> +     v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov9282_ctrl_ops,
>> +                                  V4L2_CID_TEST_PATTERN,
>> +                                  ARRAY_SIZE(ov9282_test_pattern_menu) - 1,
>> +                                  0, 0, ov9282_test_pattern_menu);
>> +
>>        ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>>        if (!ret) {
>>                /* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> --
> Regards,
>
> Sakari Ailus

