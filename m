Return-Path: <linux-media+bounces-49814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB5CECC10
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 03:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1EEB30111BC
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 02:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E911E2877DC;
	Thu,  1 Jan 2026 02:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="hPsSIYWH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D971CEADB;
	Thu,  1 Jan 2026 02:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767233081; cv=fail; b=kqnBeUWLwXFQx1JSF/3vkrtWBFGZNnl7cj4jbRWS85XP2RIvVRadqNgS1q3ZuT0/pWb/kwCQquXIqiaa43hNaN0SmV5Ze3jnQJRryQHOp4uFRrmxzbNiunwToV+w3zNOkAbzomHtS2JZoSSv4VlopG5/2X2jCvSMmY79QPUus1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767233081; c=relaxed/simple;
	bh=YgmndwMQl9obf3w+awMSFCSHBDxRGOmN/niUl+3LXRQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nh2vmoNRK/hUy591Ow8K5gwYbaA+RNuLy2kv7tVlRiOgNibtLrQDYYncJ8Brbr1tMj53gHA6Fg/3ESfEDCA601+K0db7Snv+6VrSnD/SPDeN2+SQRG7uiEHVnUC32DVz8lTgxJiXkANhzZPMWAG5c+5lly9DZOguPiS/Qy4vouo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=hPsSIYWH; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60124Glr3327599;
	Wed, 31 Dec 2025 18:04:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ewtJ8OrLjYZ2yC+G60Pxk2iqhCfPY/jm+bwR/dK0HxM=; b=
	hPsSIYWHZkdMGMpNnki+bG9opt7nZUTIaeOql1Wh3woha6RT0v+qyQImQtMr53Xg
	Za0MD2U31KQ2nD1h58je2Q8qhOxum6SdSjCUZfsCYJgFHjeP/rg8yXZpHI9kUqmu
	XIS223iy4SY0d015CeYwGUjVsGN2wrOKY2TLcAviZjct+M10+4wuQSIlmDhMC6t4
	1YQlwWVvVahTJGXIhrLsRWeo/9i2AyCq00rjsvhAtJ1dYeWw9MuZF487RF6hqgUa
	wtFPSwZs/dLLzd47Prln1efyLtfwHAHc0mROKIpgzC7Kp1wi+c/MXZjUX7jeRrvi
	yjG/nisdvcu7f+YoSS5UMA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011042.outbound.protection.outlook.com [52.101.52.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafukc3a3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 18:04:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQK4o4VlMPNO/8p+C/P2Rt7v49otT0xVmUuu5pyKNJlsEDg2RtnSM1eopENHPUNbtcAPtLaEekTQzLv7VYFWj470ag9waUfLs3E5pf1Fm0Io0Y3wjNhn79pLPU8LOjyv6fjAKBxZzMxqIyQP7BM9O0CvXILyEgvTO6rC2mrujw0vHl0PDIqYneUl2vACqWAxoPP3iwgJOt1XZMvFM64ub0ZnuO6ZLxiFSMGFXFFgdMBFRMNBq8Tca0Z3zpDgB2FlXXFO9y0M72nimA1k+2bYeQrazUal9OTAYJBCxkYkFkFkMoCk62H2Jhwys9u+Ib1AnNvRKEj7jTV7Bv8ZjqOoeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewtJ8OrLjYZ2yC+G60Pxk2iqhCfPY/jm+bwR/dK0HxM=;
 b=a+WvYaq45JJLq+NGWRxIOg2XhQqIBrtPaoNqfo8emT++ZgTjDQJusRf1B4PfWDYw/YGjVKF8XfkjYm4z1j2n676jGSokVjCTkU3MCeRi7fdCXzGw/4Jwkx0IXU8O660CdYNuo9+MiAQTNKf3d/DGgt9ZY0d3CUACCUfYENLVRTbVDM5z/VaJfsFcIxKVQnxkuNJ9mRxqR6CT4wuAOuTtBFL6NU3HHaQiNDbt5AOpIhpiBruKW9yH9bYfFoPuzkPAUqnNSnHrozRQiRTYuZAULxd9y/y+U/SRpLDy6w+IQ+ZJBXO1hXJzBC8vq7MsfnTfhMWLSpuvK07NTvoT4kIZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DS0PR11MB8069.namprd11.prod.outlook.com
 (2603:10b6:8:12c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 02:04:13 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 02:04:13 +0000
Message-ID: <11c603c6-93e1-402a-a7f0-40b7cf56b4d2@windriver.com>
Date: Thu, 1 Jan 2026 10:04:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: i2c: ov5647: switch to
 {enable,disable}_streams
To: Tarang Raval <tarang.raval@siliconsignals.io>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
        "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "jai.luthra@ideasonboard.com" <jai.luthra@ideasonboard.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
 <20251231083924.2657165-4-xiaolei.wang@windriver.com>
 <PN3P287MB18293AE98858CE9B30DB6C0E8BBDA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <PN3P287MB18293AE98858CE9B30DB6C0E8BBDA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DS0PR11MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e64ea8f-40c0-48a8-5613-08de48da0f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEJpM05ieERBdTYvdUhDKy9IbG0zUi9XTE56a1VqMDlpRERJV0FlbnFuTzlX?=
 =?utf-8?B?M1VQSm9EbW1CSU9pSFhoTWF1Nmk2MEhaSFRDOFdIRENqeUVQeFppODRvNysw?=
 =?utf-8?B?eDlobzB6ellqeC8zYmpFMW5BOUVib0lVcUhkbHhLSU4vVkhBZnlIOVpDdVJz?=
 =?utf-8?B?M3cyYTlaSWZmY3hBYkNMdUtzeTNZZVdZWG0wM0txeCtUZm1aR3g4cFJOekY2?=
 =?utf-8?B?VklyR3Roank1OEVmalVXTGw3UUhQMDRFL3N4bkhjb245ZHVrRWlrZ3RpWk1u?=
 =?utf-8?B?QWM1cDcxNlJubHNRd21kT3RWSXFFY1lVZTRZMzIrS3NvdWl1bm0xRGhXdXd0?=
 =?utf-8?B?Nk1JczhQdk5LUnMxUFZOYmdNQWdGZzJDMlNNTHJhZHRFUGo0NzF6cVRkYTNn?=
 =?utf-8?B?bkJ0YWZHVm0rcnRLUHdLUW90c21NRXA1dXBLV3RRQUxGYmdrV2x6clFVTTgz?=
 =?utf-8?B?VHM3QURnVHRMVDkxOE5ldzAxbzZtcmM2M2gwellEMjh2Yi8wbWtScWRDTmY0?=
 =?utf-8?B?dTh2bS9WUUNvQVZ2NkJyL3VSUWtiU2J4TnJMcXdHeEFPZjRDM0FYVDIwdlZG?=
 =?utf-8?B?T1Jzc0dBQ01lR21zYW1qQktGSVBUVE1RM2s3UldQS2tyb1oyR0t2Mzk4bm5P?=
 =?utf-8?B?Qy9hTElpTFE4SEVHN3l0bHpDV1BZQTI1dG9TaW12T2FFVjRoNUhKcEtVc0FE?=
 =?utf-8?B?UlFLOFNnL1MwQjBYa3JVa1NMOW4vVUZnZ05PVCtuN21zMDY5ZHpkR0k2b1py?=
 =?utf-8?B?dnNGU1RyRVFSMklsSzdTNUR5ZllwVm5MOC9udXhLY01DcEJiNGFXdzFLTHQ0?=
 =?utf-8?B?eTJBYXF3bXhMZ21qZ21ON1JHWElmTnZzdXhHdDQxSzNkeTVhUHN6NHBWemlG?=
 =?utf-8?B?NmNMSlVJd1EwVGdMMjdzTjFNTkM2RXdOOGFzOStVTW9UaWowZCt6N0VsTFgx?=
 =?utf-8?B?dDhrcTZJYlR3RzRROTlUeE51eStoQ2VFK2JhYTZzSi9DZ3BJU0VhTzZudERu?=
 =?utf-8?B?VmxpVUJHUnlQY0FSendyNzRvcStJNm8waWt1aFJGSjlaZXQ4dGJUeFNVMGh3?=
 =?utf-8?B?TmRlQitRVFNsZ0RUMlBvd3VtbmdvL0dtTmk4N293R0poYjc3SDVwZmJtZDhu?=
 =?utf-8?B?Nys2SWIzOHpCdmNobjJoMncyNVM1VzFIbXFNYUNxU0drZFJaWnhzWkdLdmJE?=
 =?utf-8?B?amZxOEJ0cFNBZFdBeTZ1RDFTSElhMmF0dXNhSEFVNHYxU3krcGVNWVpiR3Rk?=
 =?utf-8?B?YnVIcVNvT0RSN1dGTXN0OUd5UC9Pak1uSHEwQTRud21TZlZzNU5WUWltbmgw?=
 =?utf-8?B?MjBmR2pxbzg2S2Y1M01MN0VqUENWOEUyVTZRd1V3Q3lOaTlTMEJ1OXJyem54?=
 =?utf-8?B?WThubm04dTByVDNXWmt3L1grZ1NVSEIzUSticzd5MklEcnk2UjN5UjhzMWlM?=
 =?utf-8?B?NmVhK1pxaWNHTGpnaWtkZUlFZ2J4SWRERk5iZHBRaUNIaEpqSTZzem9BR1U3?=
 =?utf-8?B?Q0thaW9BbWFsRHBuNkM4cWhzZWFUVlhUOFZqMWNHcVVTQzVPdFlrWFc4MmRr?=
 =?utf-8?B?ZGR3aFZybmVPUHJ4SWJKUlprZmRET1pZOHh1S1NmSzZGSVNEZlV0dXhCZUQv?=
 =?utf-8?B?TXM4VUtDUHg3ZjFFZ1ZvVWdlMDNwZnRhVG9IVS9BMjBxMXFXbXVjbkVqT0FJ?=
 =?utf-8?B?dFZndWZKbWxDNlhhSFdrV09WcFhDMkcxaFA1SXV1c05uYUdhbXQ5aUFSbHFi?=
 =?utf-8?B?N0lOMW9kNmdFcG1tNjlKaDQ3bEpzTDhYaElrc2lYTnQ4TFdwUjA0UGtHbSt2?=
 =?utf-8?B?elFlZHF2bEhRbG5vTUV3RXErcHJKeFNOSVFpbzU1S0pYMHFZM3VYWGpZdTBw?=
 =?utf-8?B?Unczb2MyUkNGWk9Sc3R2RzIyWUlFejlLaHJmREdWcktZMXdwMGswMHlCY1N6?=
 =?utf-8?B?a1cwaDdYUHQ1ajY2SGVVUTdWZFNRVTY3ZldHZTNscGFUYXhMRzE0MnFvUlhO?=
 =?utf-8?Q?ZPBVoMrkrq6gDZiKbn45gn8XLDKwIM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amVMYTRGRkJ4ZjlDK0JPbXdoRUtZdy8zTlZ0Z3ptZlM3eEorTU5TdXpNU1lE?=
 =?utf-8?B?US9qZ28zbUkyWUlpNEVDek5KWXcxNy8vOHU0d2EzOVBweENIQTlWK09HelJU?=
 =?utf-8?B?ekJabldXUTJrNWFIQk5JWDFBbU56dmpwcFhRdzd4SHFiNFhxblBUK3k5bE5s?=
 =?utf-8?B?OEdkTlJQTzMzVnI0bWhDSSt0MjFTK081YVBOZzF1R2xzamMzaWJ6cDF6QkVo?=
 =?utf-8?B?cGEycXhtYXduWmd6cVhVeDhVYjhFdXVZalpxYTRiWnBja2tZWXpVN2Vzc2F4?=
 =?utf-8?B?dXZDYUxlUklvMkNHV2pVc2ZWQXJqajFLRE01U3BITjh4MWFBSHNpM2Fjd1NI?=
 =?utf-8?B?M3Q1ODVhU2JqMU5wTmtWVlR2MFlyNElUU1RFcytNamQxWVJOSlZrZkgzdzdS?=
 =?utf-8?B?eGpkTnhFMjVWbGEySEhLYVk4VFdLNzdkbVBKODA5TTF1SHNKT2xlNW1DZmFu?=
 =?utf-8?B?b0EwWkZONU9BNDJHbzVQTjczZFFMd3BIa1c1Q0pWL1FxS1lVSTBPc0FtMito?=
 =?utf-8?B?UlljNmozN2NyYmx1WjIzMnU0cG1GeHRSUFZkbytUc3dxOG9iM1FkQWhhcDI0?=
 =?utf-8?B?ZTRJYVNxd1RZK0xTTGp6RU00dDJMVCsrOFNhQXFzSXFmd3graG12d1haV1B3?=
 =?utf-8?B?cEd4T0NqcnNUWTBDSjlSMTNlUE4vK1MyeldpVzQ4blZ6QTh1eUZiZmorY0wy?=
 =?utf-8?B?RnNkdVhWb1pwd0xlenlvTHo5MnByT3MrME9jT2NKaFlsYnJLNFN5cTAyUXU5?=
 =?utf-8?B?dHN6YzFRUkg0TVFIb2NsVEhGQmVvS0ErcEZzZkNmNXI1Ty9UTkxabC9kUXZM?=
 =?utf-8?B?VlJWaXhiaFdCMSsrbXdsSk9WZDZjR1BSTmFKK1lMTG5zSDNUY1RqOXp6YU1B?=
 =?utf-8?B?YWVNRDVPQ2NWMjlHRlJLQy8vUXVBUnJqc2NFWm1MTklRdkxpWkt0d01ENm1a?=
 =?utf-8?B?TVJBVWJNU1JSTlp4QjFjM2VkU0RMWXZSc2ErOXBxYUp1dDJTaGJzRU02bGFZ?=
 =?utf-8?B?Z0xSMVNzN04vVTVCZU1oQzdzdjhPbUllcUkzWG9VaEx3Q1gxeXo4Vnlhcmov?=
 =?utf-8?B?UzJDb3VrZmFpUmNHQ2tndHlVL24yS2tqdCtBNFErMlNvdm0xd1dIbmJ2QVNk?=
 =?utf-8?B?Q1RYYk5xR3dNVFROTi94Z2lOWForb1JmZVFpRFowMEt6ZGdFMFRrNjZURlEz?=
 =?utf-8?B?eWJVdFRoS0Y1cWJuMXVpeUk3SDN6STIzSXhXVWRIOFJJRkcwcFdHTGpXSlF2?=
 =?utf-8?B?YkUybXgzTjVCeTNodGllNVNCQVErdUFrMVRrK1pZZWE0N3I5V0FydkV5L0d0?=
 =?utf-8?B?TjU4MjhCc3BKcUsyamV1OGdIamhCcUI3V3l0c1dxcVNNT2pmT0FvcUJTWTVS?=
 =?utf-8?B?b0t5ZGlIeTVTYWRWRzRqalo1Y1Y0ekdISExnRGtFSWNEZnhXZk1Na2hZcUkw?=
 =?utf-8?B?VnJ2QUVXZHY3OWJLV3hhclp3ZVQ1WlBKTXJmdkpoSFpCcDEvT1RoNCtXYmZQ?=
 =?utf-8?B?UXFkUGtTci9naHE0alpveEU5MTlIM00rcS9iSkl3TVU5NEIxTjA1Y1E2alJr?=
 =?utf-8?B?VUQvWTBQcUFrRXVDMTFHYUNTY3NaUnZIUE9Vdlk1OWhVVmRkUy96cXErbUpi?=
 =?utf-8?B?ZVNLRll5NllSeE1La0lQYXQxOXBXNmV6QzhvUXI0N1d1azRhZmg0MWlaUDZO?=
 =?utf-8?B?YXc0bnFVdkRhUGJpWlVmcG9XRDIrRHZRcW1Ga0VTWU8xUnBvOWpzRzd1OGRv?=
 =?utf-8?B?RlF3NWpQK1VKTlpUcEUva3Q3OWxwMVYzeDI5bUtacTZsTzRIUCtBQlc3Qk0v?=
 =?utf-8?B?eUFDN2F4TkRTZlp1MWtlSVNoT1FUYXczdWNLTndoKzdGeEJzbjNXbndJdFd0?=
 =?utf-8?B?R0NQT3lqTXJ5elpIWkNic2RWd1QyMTZXYnpQdlA1OFc3UGxHZDJheUdia3Nu?=
 =?utf-8?B?V056K25VbDlCUUtLd1R6NFdFNHMrVVJpbEQwN0pRVUpkZkhzMVdnVlB3TWRw?=
 =?utf-8?B?ZE4zZ25WWTQrQUdCeVBRUnpIdmRiOW5hcmgxOWZBSzNGZWlWUW5FZjlPSnI3?=
 =?utf-8?B?U2RDM0VQYnRrenF2aUhXblFNNytJZXN3TVJsZk14eldaeVhDWjhvdm5XMnpq?=
 =?utf-8?B?RnpnNzBMMDY1TEtmUnQwdTg5TDNsTUtTb2ZhSm9lMm4xV1hMaUNTR09XOHZv?=
 =?utf-8?B?djVsOEc2NGhqNmw3U2NEQXM0N055dGxybWRuNDVGMit1M1Jia24yL2t2QnIy?=
 =?utf-8?B?RU5MUGgxSlZLMXFFYzRDL2pYK2FhVFIwVWEyMHdSR3l3QnRiOWRnelp1TFJF?=
 =?utf-8?B?S0ZKc2o2SGJqMk5na1M1eVU4cXVjTCsxM0VrRllibU9tYzgyMlI3MjR3cERZ?=
 =?utf-8?Q?srki4tVeHGaR+xcF3oCjT8/wQ45tqzl4U4PtLSM3dBKZV?=
X-MS-Exchange-AntiSpam-MessageData-1: Gl4RFefc+ja4kTXWh8lu+NKSLUUHUvNBoLU=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e64ea8f-40c0-48a8-5613-08de48da0f7e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 02:04:13.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9CY4GjBxLGeRHylc/mV+cEsQVekn3Xr8VQo/lMIFs39gSgSy7tqqzHed0nSqJb9hm/jUjZt4zs2z6CeHoAf/qst8NtCMZZKhL5Lkc/m+p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8069
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6955d620 cx=c_pps
 a=zXfEoyyUBsLHcbwyVEaNwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=P1BnusSwAAAA:8
 a=Az1iKwsi0BcMPrQXuo4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: Pbgs_hnOB8dowkq9fcOhJdPwRgCjgTs9
X-Proofpoint-ORIG-GUID: Pbgs_hnOB8dowkq9fcOhJdPwRgCjgTs9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDAxNiBTYWx0ZWRfX0qySiS6YrHCB
 dODNgNKZGzkZiZW9UaPLKBWF3VAAqanpin/w17CruyyuP3l+tGYDb6DYHRC0MIxnGFREPQA9dM6
 dhCrg0hfK2jXlAoGAnmqlKLwfLxVuBOlFqEN9Jp/M41yh5vmU21EhLqiw1txyGf5SFc7OGil9w5
 xrpXKG2uq7WDa5RNpNT9DT7Bi+bGDTOhBH6DWUKn1+yRJudedF5PnW23mS0IauIeAxbQS91XqB0
 +xX0Gi4mUpSMPi8cA6X2u8+9MB0MoG4O6dwkXlo0wf74DQCH9/k0gGncSAlyvYkjlRd4dsYt8vf
 VG//vc0XTczX0RVvm1AFXMxPewxVx6oCrF5RAPF/F4HBkmrEVNUktxSv5teTL/UTR3YkofE0IfM
 oByabVPe/dZ/69JijBNeFVfeiptLO/UHyhgXTQwNTeA3E5k8DsInahEcMLq/Vq9EXgahYHQKLrG
 jFfdo5KI14D/7wdUlAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601010016


On 12/31/25 19:03, Tarang Raval wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
>> Switch from s_stream to enable_streams and disable_streams callbacks.
>>   
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   drivers/media/i2c/ov5647.c | 89 ++++++++++++++++----------------------
>>   1 file changed, 38 insertions(+), 51 deletions(-)
>>   
>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
>> index bc81f378436a..7091081a0828 100644
>> --- a/drivers/media/i2c/ov5647.c
>> +++ b/drivers/media/i2c/ov5647.c
>> @@ -637,23 +637,42 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>>      return 0;
>>   }
>>
>> -static int ov5647_stream_on(struct v4l2_subdev *sd)
>> +static int ov5647_stream_stop(struct ov5647 *sensor)
>> +{
>> +   int ret = 0;
>> +
>> +   cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
>> +           MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
>> +           MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
>> +   cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
>> +   cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
>> +
>> +   return ret;
>> +}
>> +
>> +static int ov5647_enable_streams(struct v4l2_subdev *sd,
>> +                      struct v4l2_subdev_state *state, u32 pad,
>> +                      u64 streams_mask)
>>   {
>>      struct i2c_client *client = v4l2_get_subdevdata(sd);
>>      struct ov5647 *sensor = to_sensor(sd);
>>      u8 val = MIPI_CTRL00_BUS_IDLE;
>>      int ret = 0;
> No need for zero initialization.

I will correct this in the next version.

Best Regards,
Xiaolei

>
>> +   ret = pm_runtime_resume_and_get(&client->dev);
>> +   if (ret < 0)
>> +         return ret;
>> +
>>      ret = ov5647_set_mode(sd);
>>      if (ret) {
>>            dev_err(&client->dev, "Failed to program sensor mode: %d\n", ret);
>> -         return ret;
>> +         goto done;
>>      }
>>
>>      /* Apply customized values from user when stream starts. */
>>      ret =  __v4l2_ctrl_handler_setup(sd->ctrl_handler);
>>      if (ret)
>> -         return ret;
>> +         goto done;
>>
>>      if (sensor->clock_ncont)
>>            val |= MIPI_CTRL00_CLOCK_LANE_GATE |
>> @@ -663,19 +682,24 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>>      cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
>>      cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
>>
>> +done:
>> +   if (ret)
>> +         pm_runtime_put(&client->dev);
>> +
>>      return ret;
>>   }
>>
>> -static int ov5647_stream_off(struct v4l2_subdev *sd)
>> +static int ov5647_disable_streams(struct v4l2_subdev *sd,
>> +                       struct v4l2_subdev_state *state, u32 pad,
>> +                       u64 streams_mask)
>>   {
>> +   struct i2c_client *client = v4l2_get_subdevdata(sd);
>>      struct ov5647 *sensor = to_sensor(sd);
>> -   int ret = 0;
>> +   int ret;
>>
>> -   cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
>> -           MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
>> -           MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
>> -   cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
>> -   cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
>> +   ret = ov5647_stream_stop(sensor);
>> +
>> +   pm_runtime_put(&client->dev);
>>
>>      return ret;
>>   }
>> @@ -706,7 +730,7 @@ static int ov5647_power_on(struct device *dev)
>>      }
>>
>>      /* Stream off to coax lanes into LP-11 state. */
>> -   ret = ov5647_stream_off(&sensor->sd);
>> +   ret = ov5647_stream_stop(sensor);
>>      if (ret < 0) {
>>            dev_err(dev, "camera not available, check power\n");
>>            goto error_clk_disable;
>> @@ -803,47 +827,8 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
>>      return NULL;
>>   }
>>
>> -static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>> -{
>> -   struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -   struct v4l2_subdev_state *state;
>> -   int ret;
>> -
>> -   state = v4l2_subdev_lock_and_get_active_state(sd);
>> -
>> -   if (enable) {
>> -         ret = pm_runtime_resume_and_get(&client->dev);
>> -         if (ret < 0)
>> -               goto error_unlock;
>> -
>> -         ret = ov5647_stream_on(sd);
>> -         if (ret < 0) {
>> -               dev_err(&client->dev, "stream start failed: %d\n", ret);
>> -               goto error_pm;
>> -         }
>> -   } else {
>> -         ret = ov5647_stream_off(sd);
>> -         if (ret < 0) {
>> -               dev_err(&client->dev, "stream stop failed: %d\n", ret);
>> -               goto error_pm;
>> -         }
>> -         pm_runtime_put(&client->dev);
>> -   }
>> -
>> -   v4l2_subdev_unlock_state(state);
>> -
>> -   return 0;
>> -
>> -error_pm:
>> -   pm_runtime_put(&client->dev);
>> -error_unlock:
>> -   v4l2_subdev_unlock_state(state);
>> -
>> -   return ret;
>> -}
>> -
>>   static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
>> -   .s_stream =       ov5647_s_stream,
>> +   .s_stream = v4l2_subdev_s_stream_helper,
>>   };
>>
>>   static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
>> @@ -986,6 +971,8 @@ static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
>>      .set_fmt          = ov5647_set_pad_fmt,
>>      .get_fmt          = ov5647_get_pad_fmt,
>>      .get_selection          = ov5647_get_selection,
>> +   .enable_streams         = ov5647_enable_streams,
>> +   .disable_streams  = ov5647_disable_streams,
>>   };
>>
>>   static const struct v4l2_subdev_ops ov5647_subdev_ops = {
>> --
>> 2.43.0
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>
> Best Regards,
> Tarang

