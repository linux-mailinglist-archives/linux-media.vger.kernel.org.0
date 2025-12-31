Return-Path: <linux-media+bounces-49771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 210BFCEB269
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 04:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9C833044BA5
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 02:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD47C2E9ED8;
	Wed, 31 Dec 2025 02:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="HypNuumS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C9E2E62CE;
	Wed, 31 Dec 2025 02:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767149922; cv=fail; b=kBjMqy9rD2qOWEMShTVaZri/t/pxGtBPpi0Cks0aVJaeuL+rJLdT+5T0OhWEJnarBRylU0WMVNdX2egBHhVklfpdm4Vwtse6F4szIQfhN3I/EZTuCbNW/ZejDOiyHIfmv9Kv1zdaA/y66Nml5HYYicCXaJpJ58j+FSGDVDn+hrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767149922; c=relaxed/simple;
	bh=HBV8FweYXQbAPBO7r//bNeJuM/jy8L5A/mZsRw4rLFk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iBzpHseKg3z4rqeiZbgQNJ5oA7m7uh6EMXi6JQ+P4ijhL/MkuFD2ZXp3kACGQ4uIyRRFCA9dmqvgpVh+0+EGhn1QVT8WTN4nQ59jEN7YpHMUo1muXgZJjbGzi8BMMOnhRowtrFf3q2DOvQM+LY8imTnWvaNxBSwvKb42bnXyalc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=HypNuumS; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV2Gb0A2152645;
	Wed, 31 Dec 2025 02:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WyiGyHL0P181FraucILJlTJ/dGh8eX/JFmLNLONgpls=; b=
	HypNuumSSmW4t1x32rnRauDcyYXxAb63YFoIu60+HIFDPA+pGAVfOUy6z2WXfZ6N
	4WzalM2lrvXZB6DQ7iXrf80PLZSxffRktgoVUDz/+7BKLlr73n42ZOP9DElkaNbH
	8Pz3CaZOMkGTIqJpRBPPAghtNNfjhydSv6cT4aegWo5DWWml8DtxG5ZlIeU3BkkR
	G1ZlpEDVbvYGIg6VAy75KhytIW90fkhY+KXeHi4sunngIFJAdtUs/47LrDWyClLQ
	N6lROk+kbnzpr/2RQnzus1tTvgAGsbNVTKRt+leHmMZ0cO0ZbqsYiOlaZg4l+frp
	fifom/BkNRG/SBA/SHzTmQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4ue66-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 02:57:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L99xx1NNtW03tC6cl/+r8KQK1m5K06s9sJ7zM5CzCZgyprAo+b5UjxZE05LTGoXqeTOsIqp/IYQJTlf0B53bmmKnUY4h6+5aLvDH56gSXYp3L8PikKPcqkcsWFd6m5JVuLFfR4XXd81Yh9xW8dEBUCUJjrYHz1UKPLjLKd/FO8XiJ3Msp5zyHYJs7RE1tznRCfPx3Qwv/qLhaQBY7fi5GFjQ+MNNTzotnZ138WmXn1ly0VFmhp6mt+1nd26I2VpD3VIOeRw2FdlTdReJS8TBBMckS3RS1TmMtAr21NowIKZqo9hZEPdq4cy9rPFpoXR62iQGX6M7dI66cEo8Pf2keA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyiGyHL0P181FraucILJlTJ/dGh8eX/JFmLNLONgpls=;
 b=rUx7WeLst3w6fTOh9CASo9iTYWO30sZS0N3YxDEfBodhVjPKFhjgqbewJSoPSFN2DdiC+lQw+Ma6Wr4hlkmejnBD1bG9/r/pllAjpVjb2t9R7TOO3ljGSoapYGdw7GKYX2VNbSNyO+P7agPveHsmcPaNuVbHyw/kR0ByFCKyeQnFMlWr6fHjQcQzW3yfTr+N3Xf7j2URpkOwBkCbJlYnejKisuUTArmGhGlTYwDIdGOLfCxFkMlqZBaTYGttyiCpclTyACjO/0cOtAHz4iskNzjKGrcL10MD2VYOOffEz+ldzSK6HTRY4kIunSaYcuqvnEZUSxLzHr44cwZRBalzCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CH3PR11MB8468.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 02:57:57 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 02:57:56 +0000
Message-ID: <3c353448-cac7-4519-bc91-baff2ab72206@windriver.com>
Date: Wed, 31 Dec 2025 10:57:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: i2c: ov5647: Convert to CCI register access
 helpers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
        "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "jai.luthra@ideasonboard.com" <jai.luthra@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
 <20251229023018.2933405-2-xiaolei.wang@windriver.com>
 <PN3P287MB18291169FABF1E8A01AA88B88BBFA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20251229130116.GC6598@pendragon.ideasonboard.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <20251229130116.GC6598@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::15) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CH3PR11MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 758bb45e-19cd-40c9-8351-08de48186632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3dHLzg2bk13dnVTNEV1d2JXWnduc2Nnb01kNlBJWEZLQmU4RTdQRTkxa2Rs?=
 =?utf-8?B?akFUcnA1VFZybjdOaUlNNmtYeGYyT1ZhYTdSbjZmeElaVnpzRUN2TTBhd0ZJ?=
 =?utf-8?B?K0xsajFHZzNnK1l1Wno4SllKM1VQYkdUT3RaaWFzNjJmNHpTTnJvOXFWU01y?=
 =?utf-8?B?cjRVOU94emRDQjY5OGtrQndWT2t5amZXSlc1NkRxYnp1eHk1RnczczBLOExW?=
 =?utf-8?B?c1BoSjF6Z01Ga2tUbHlKRGNxN2p0K3RSdzBKNXVwaTlSdDh1U0k1c0ZNakZr?=
 =?utf-8?B?N05WK2NLR2dBaWI0TGUvWG8veFIyR2ozelZlU0VZMUhPejZ0cHlkWGJhaDY2?=
 =?utf-8?B?R2RCM1hFZHYzbkN4UHVtaXFVVDdtekxwWDJqVHU4VWRJdHRNR0taSG9JZllP?=
 =?utf-8?B?UVFBOENFSG9GRE1GeTJheWF4dDhZV0V0N21NZ3lLS096cVFZbldobzBpWnpL?=
 =?utf-8?B?YzMyZnVFUUVvcEZVS2szRlc2T2hvdjVwNHluQmUrKy90RmVBODBXUW10d3dI?=
 =?utf-8?B?Y0ZVK2JJQlhCN0JjWHFWMUdPS0RDYjQ1R2JzYVo2MnBGWGRMSSszR3hCNjZN?=
 =?utf-8?B?My9zckdSOFhCc1NBdlVTNHZUc1c2TEdhTTA0ajdaRW5HVm9hOURuWXhOMTUr?=
 =?utf-8?B?UzFoT05WTWRSRGFlSFR1bVgwcDVsMlZ3dzNOcHptWmt1c1EvYnV1WERRZ2lS?=
 =?utf-8?B?a0picE1GM3gyR2sySlZCb3Z4Q2VhRk4vRm9rZEZnY0tVTkNPSjd0OFNDeWtH?=
 =?utf-8?B?QUJzS3pZVG0xWjAyQVovc3h4OUFHMVVWQ0lWQUkwSEFxWWRTYVZHT0F6S3px?=
 =?utf-8?B?RVltcENSc3RVU0Z5UGJpNjg0NVFsa294bG1tdGt3WnFINHF6ejAxWklGR0VL?=
 =?utf-8?B?S3JCYjZQR2NYSnJoRmhnWmRlam9pMmhOaTM1bCtJV3BWN3psdW1ZcVF5WVl1?=
 =?utf-8?B?R3RXUkFSb3ZWQnZtTnJFRmdabGVwQ1dtRUJ1cGl3U0xhdVlhdS83aUJhVXl4?=
 =?utf-8?B?L3ZFZGc0c3d4eEYvd0cyNDVTM3JDTVhiRFgxSEhZWUxzWWFvN0x1bzNrUUlw?=
 =?utf-8?B?ODh1WHZMekpmNHFnalcvNHp4bXVyR0VTb1Fqd3BGNSs2Ly9xejV5TVBtRlYx?=
 =?utf-8?B?a3pnaG5XMnJBem9XREVFSlBRUjlkNllUVkdMT3FjMkNGdmZNNXR5Y3FxNnhQ?=
 =?utf-8?B?RGN4TmIva0JXcEhRKzU2bjArL01ncFVkRWRGcDF1eGlrcGYydTlZTlFta2Nt?=
 =?utf-8?B?YmNYWjErcWRZMFBld01LZEkvdk9jY3BIVTZwdndGRGNUSFk1NFpnYVJwWEtV?=
 =?utf-8?B?UHNhUzQ2SXJ0RWEwcVZnUE5FaGJGbGltZVkwUVorMXRBcml2L3NRQ2g2SWVK?=
 =?utf-8?B?b1pLNld2Y0E1REJnWEpWVjVWTmVsUFk3R1VrbXFuc2dCWFVGelA0V3E2Y1FS?=
 =?utf-8?B?Q1NaMHkwbTFBQW5NcjF0cDY2MU5HdzhMK09jeHhpRHppQjNhVTlLakVUeTF4?=
 =?utf-8?B?bVZZazNrRGdrVTJUcDFlSzB1RWRHdXFQc3RuZjhDZ1pSTCtoM2ZYSVJTN0NP?=
 =?utf-8?B?ZGd3cTNKYkVRUEVoQzdWTUkzcHVtMEhzWjB6amd4eTV1SUwzQjhYcHcvY3BR?=
 =?utf-8?B?bXlnWHd5U3NkRm04d216MVlkT0VmQlRjZWI2aVNxbFhneEVYNVBOd1VySjYr?=
 =?utf-8?B?OTFRdU9Eck5EYnlCNjJVTy94aDR5aWpsd2dEdzYzRjczZ3ljWEYvajdCaVJX?=
 =?utf-8?B?WlFOL2xwTFNHR3JXaUE5T3V5YmdoclNqUlNzL1UzNWRhZWc0Ump4em5sVEZv?=
 =?utf-8?B?elJSeHdDOUpsTFpSbDBydE4wbjRULzV6WGZZOUJrMnQxRVEreVJhY0prWWxE?=
 =?utf-8?B?R0NjdCtVQTZxNXBqSzNpMURFMUZmOVdoWmtTd00xb3RjL3NmNU5ZUFRra2NO?=
 =?utf-8?Q?OVmLYyYFunRj3xNiScZtc9O8Qy6eg5VU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU1DVjkxam8zblhSRExKaWIwYW8zdXBEMnhZRHZuckU2amhPMEhIWmZQbm9I?=
 =?utf-8?B?VnhPalRFNzljNkFvMGZocURJcTJiNEo3MWxFeWFSd2lJYnBkZ3AwUXpiWWZn?=
 =?utf-8?B?VlJXSGtSUmtIU2I0dkxKM2JoMzhZRmtFVG9xcWorbDB0cFgyVVkxMlFWdmFx?=
 =?utf-8?B?WXpxbmhPVjZTQ0xHdm50MnBSYllqM0ZJQlU4TVg5UGZwMS9ndFBwUjVSZHJ4?=
 =?utf-8?B?cXJzdHVwbXVRZTZLTWtGUkV1V3UvR0ZsTGhLSU5pVDNuUjhqa0RsZWM3ay9J?=
 =?utf-8?B?Rmxqai8wOWtYV3U5Uk5rVktLdTZOUkhGUkE5RlZpNldRcGdoRStOVjRlSlAv?=
 =?utf-8?B?MnpBK2lBdWl2L21Mb09PWWowRHJiWFA4ekNnUDkwRzBjTVRPRHZ4RGZUTDVu?=
 =?utf-8?B?a1JHSWFZKzJoY2xqazRGcER0WndKRHR0OXpuN3Njc1lHNnpFNzRtZ0pZRGRI?=
 =?utf-8?B?ZWdkSDdxbFRtVzNNM2gyVmJBZnRXSDNTT0QrMW5jcXMwbEY5Q3ZWdkpJYjBC?=
 =?utf-8?B?aVU0b0NLSFFGRm9KbENtL1doWFJUWG1ZaGd3UnVaZyt3cTZCVWZNbmJUTUxX?=
 =?utf-8?B?U1c2NDc1MENsVXk3bFZBUi9DdW5PTEpUdXN3YVZjS0llN2prQnRWM2FzaExC?=
 =?utf-8?B?SXRWWVV2T0hlcEZSRlpZcWd5dDh6MmRlQ2RRQWk4KzdzTnd6RkRIamR4cW1X?=
 =?utf-8?B?UjRoVy8zdlRCajMzTU5UT09VUnJaRFhUN3ppUDI4MDJYQStLYzJZUVg0MlF3?=
 =?utf-8?B?SjR4ZTFJZUJidlhkbUdvZ2Ixd0JYMHVsUnpuSy9XQ0dHYzdYZ0sydk90SWs1?=
 =?utf-8?B?L05tQmRzSklScmM3RjAwVlZ5Sm15QWNSc3ZnTmZOVlpXclE2VW0xelZPS2c5?=
 =?utf-8?B?SzdPbEdPMmk5d0hMa041eG42RFdTRlhTMkt6OVFxb1RwN2ROV2djU29VRU1H?=
 =?utf-8?B?ei94MW1aVE92LzVwNzdBS3pqak93WnVqNFpxZUhkRUdZd0s1S2REelVLdEdj?=
 =?utf-8?B?cjRyb0l6TmIzK2ZHVWd4V1lMa05VQnRJQnBwT29WQzN5QmFxdjdmdXk1MW9J?=
 =?utf-8?B?ekUwNUZMUWs3Z2lEZXNkWXhYTWlORzNidUdoU0FJc2V6RlIvZHY4U0tKZjRY?=
 =?utf-8?B?akwrUElhUTVlSi9hdlFEdzZ3enJwSWt1YitEYk5CeG4yTTlpSmZzZWN4SzlB?=
 =?utf-8?B?TFZqVjVXWXptYUljY0FtL093TmY4ajk3MFVXaW41d21hYzFGbUZQei9ERXJn?=
 =?utf-8?B?Q3Z4MUNYbjdzVk95L1FMWmtBN3BoUTdSN1RhcG5ZZFd6ZDJFcmtWNno3Y2V3?=
 =?utf-8?B?S29xSmdXWFRxWkJ3WHdsTXhRVnNnUHpaUlFEV2FKMHNzMElwL1pQYTJDdGtY?=
 =?utf-8?B?VU1pWS92ZERQTDU2MFNRbUc0aEV2TzRXQkh2S3BhUzYrNlluSWhURFhBSWVU?=
 =?utf-8?B?Rzk0RXgvUFJmdmZaVnRWSkRyVURLWnB0YzllRHVHa1I2bkV2K3psYk9yT2Nu?=
 =?utf-8?B?T2hQVjQvYnNLdGtPNndPMnk1MGNFU1BWTkVKTHMyVUNvTktuaGIyQmFuNVNS?=
 =?utf-8?B?b21oRklDUnN4SlhXMGd3aWo0SWJTZUpPNDBlS3J2MGlkcDNqVTFreFFzM1E4?=
 =?utf-8?B?U09rZXNSc2I5NHhwM1dodXdwUklrcjZNZ1JiMDlyMCtYaFlYV0dHbmhQVHMy?=
 =?utf-8?B?eTh6WnhpWk5COEZHOXZJSWpYYjZSZlNHTzczL25iZWkzd2kzQ0l2L0FFUUlp?=
 =?utf-8?B?ZXlqR1ZVZWhsUFZVclR3TmEyRVgwQjlHU3JCdnVERGluV3pTZHZaQ0RranlW?=
 =?utf-8?B?cUE5NDF4U1dEdkREQUV6dGh6Q210VzdZdkZxYjlBcldNMU0yYVZFdThSRS9l?=
 =?utf-8?B?bGNGQkg4ejZqRy91dU9qRUp2UzZCWmF2M2dIaWxFbTlNdmFPNjhjbEZqcWRH?=
 =?utf-8?B?bVM2QTZlbDVvVy9GdWJOVnEvYUhrMW8rcTgrMy9Ub2Q4ZldReG9lVmcyMFly?=
 =?utf-8?B?aWl2Z3hubDhSbHNaU2szRWx6MU1LYkx3eXNORFZBNDFMQ1ZuZjMvRDM4N3pt?=
 =?utf-8?B?bERJSmI3aklIdmZXT2YyRzA5cmRMMDJrWW5xSm9Ed2hSSFRVZG9VSC9vNVRq?=
 =?utf-8?B?cXllclUveEdNbmtFelRrcFZZeGFub0V2Z2FEdFVkakFPYUpKekRudEVtQ3FJ?=
 =?utf-8?B?Ulh2aEM5NnRTYWNwdGFBSDFyQnhxVmdHRlo3eXc5SDJtalVwcE92ZDdxV3BQ?=
 =?utf-8?B?MHBXYlBmL3pYYTNxdFoydDc0cFljamwraEtGcW1OSkNETngrV29Ic0pxUlpx?=
 =?utf-8?B?NzRqMWxjTkFjQWJvZ1YrMUZSU010TlV3QVRwaFJSTjJ4U1ZyOFEwN3NsUUhu?=
 =?utf-8?Q?eIKgefbBAdhc44+T5NYFErzbo+zdbtL2oRT3RgK8SoDqE?=
X-MS-Exchange-AntiSpam-MessageData-1: vkI9ULW6kKTgRjfYXiQhl6h2qmnznn+isL4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758bb45e-19cd-40c9-8351-08de48186632
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 02:57:56.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHd1G9PM4nLtQCBDoPIz0Q2k3/GrE37aHlXRusPz0UEXlhSqEwxYbWRX7Vuo1HAPfytqsmRL4POZFF2LZTbJY/mHoyhP+gAL2o4E2GPC5Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8468
X-Proofpoint-ORIG-GUID: 5WDvdIfjMT-pKmoDEr-xgb4fDFStz7Oi
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69549137 cx=c_pps
 a=HW5a8e7WWDX24nvVw4Uo9w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=m2E39V6XvEESYvI71qQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5WDvdIfjMT-pKmoDEr-xgb4fDFStz7Oi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDAyNCBTYWx0ZWRfX5uvJ1mDD7TYb
 Wt2rNZ6ev76wnP4xcEHzDJJIZoiQviUeMaETRJN3y1uAGIzMJQkGkji89/pzwAJPyMihwmoWYzX
 zxxeXgJJqkvCDbIH0kUSYtHCMDSsdojxZP23S44LZENCFcmGkvGTb4f1oLoGFykVgDWue5j7Y/A
 Ovv+pBZnCgf1qfEXpueJijnY6eZkR5K438A2zw9rgWrRP0b+36GJel4Mjmqk1CnsQ10NT0iYHcB
 EzLPw4In3cJzUoSdNDTqfJmN/1IfxKbSLs31qIyZtHsq2kig9MyrPNK5pUQfaR69VkehX/pqrM8
 N45pxdk8iCA/M8xZbegtvWClnRRSTN2ZMHwWqrnHk86dJDa63JoljA6TRhaV0IOvKDdkF+7LyzR
 +l+bUSxggNodhExnwVyitFjzfIf6PxjrPtaZMTb0MkqJinwbHNC081kEseT6525pd9KjKU84fbd
 LmDKElK6r53/R9YIEcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310024


On 12/29/25 21:01, Laurent Pinchart wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, Dec 29, 2025 at 12:37:41PM +0000, Tarang Raval wrote:
>>> Use the new common CCI register access helpers to replace the private
>>> register access helpers in the ov5647 driver. This simplifies the driver
>>> by reducing the amount of code.
>>>
>>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>>> ---
>>>   drivers/media/i2c/Kconfig  |   1 +
>>>   drivers/media/i2c/ov5647.c | 997 +++++++++++++++++--------------------
>>>   2 files changed, 453 insertions(+), 545 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index 4b4db8c4f496..cce63349e71e 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -529,6 +529,7 @@ config VIDEO_OV5645
>>>
>>>   config VIDEO_OV5647
>>>          tristate "OmniVision OV5647 sensor support"
>>> +       select V4L2_CCI_I2C
>>>          help
>>>            This is a Video4Linux2 sensor driver for the OmniVision
>>>            OV5647 camera.
>>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
>>> index e193fef4fced..fd69f1616794 100644
>>> --- a/drivers/media/i2c/ov5647.c
>>> +++ b/drivers/media/i2c/ov5647.c
>>> @@ -22,6 +22,7 @@
>>>   #include <linux/pm_runtime.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/videodev2.h>
>>> +#include <media/v4l2-cci.h>
>>>   #include <media/v4l2-ctrls.h>
>>>   #include <media/v4l2-device.h>
>>>   #include <media/v4l2-event.h>
>>> @@ -41,24 +42,19 @@
>>>   #define MIPI_CTRL00_BUS_IDLE                   BIT(2)
>>>   #define MIPI_CTRL00_CLOCK_LANE_DISABLE         BIT(0)
>>>
>>> -#define OV5647_SW_STANDBY              0x0100
>>> -#define OV5647_SW_RESET                        0x0103
>>> -#define OV5647_REG_CHIPID_H            0x300a
>>> -#define OV5647_REG_CHIPID_L            0x300b
>>> -#define OV5640_REG_PAD_OUT             0x300d
>>> -#define OV5647_REG_EXP_HI              0x3500
>>> -#define OV5647_REG_EXP_MID             0x3501
>>> -#define OV5647_REG_EXP_LO              0x3502
>>> -#define OV5647_REG_AEC_AGC             0x3503
>>> -#define OV5647_REG_GAIN_HI             0x350a
>>> -#define OV5647_REG_GAIN_LO             0x350b
>>> -#define OV5647_REG_VTS_HI              0x380e
>>> -#define OV5647_REG_VTS_LO              0x380f
>>> -#define OV5647_REG_FRAME_OFF_NUMBER    0x4202
>>> -#define OV5647_REG_MIPI_CTRL00         0x4800
>>> -#define OV5647_REG_MIPI_CTRL14         0x4814
>>> -#define OV5647_REG_AWB                 0x5001
>>> -#define OV5647_REG_ISPCTRL3D           0x503d
>>> +#define OV5647_SW_STANDBY              CCI_REG8(0x0100)
>>> +#define OV5647_SW_RESET                        CCI_REG8(0x0103)
>>> +#define OV5647_REG_CHIPID              CCI_REG16(0x300a)
>>> +#define OV5640_REG_PAD_OUT             CCI_REG8(0x300d)
>>> +#define OV5647_REG_EXPOSURE            CCI_REG24(0x3500)
>>> +#define OV5647_REG_AEC_AGC             CCI_REG8(0x3503)
>>> +#define OV5647_REG_GAIN                        CCI_REG16(0x350b)
>> It should be 0x350a, not 0x350b.
>>
>>> +#define OV5647_REG_VTS                 CCI_REG16(0x380e)
>>> +#define OV5647_REG_FRAME_OFF_NUMBER    CCI_REG8(0x4202)
>>> +#define OV5647_REG_MIPI_CTRL00         CCI_REG8(0x4800)
>>> +#define OV5647_REG_MIPI_CTRL14         CCI_REG8(0x4814)
>>> +#define OV5647_REG_AWB                 CCI_REG8(0x5001)
>>> +#define OV5647_REG_ISPCTRL3D           CCI_REG8(0x503d)
>>>
>>>   #define REG_TERM 0xfffe
>>>   #define VAL_TERM 0xfe
>>> @@ -81,23 +77,19 @@
>>>   #define OV5647_EXPOSURE_DEFAULT                1000
>>>   #define OV5647_EXPOSURE_MAX            65535
>> ...
>>
>>> @@ -1435,6 +1335,13 @@ static int ov5647_probe(struct i2c_client *client)
>>>          if (ret < 0)
>>>                  goto ctrl_handler_free;
>>>
>>> +       sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
>>> +       if (IS_ERR(sensor->regmap)) {
>>> +               ret = PTR_ERR(sensor->regmap);
>>> +               dev_err(dev, "failed to initialize CCI: %d\n", ret);
>> Use return dev_err_probe();
> dev_err_probe() is fine, but goto entity_cleanup is needed.
Hi Tarang and Laurent,

Thank you both for the review feedback.

I'll address both issues in v3:

1. Fix OV5647_REG_GAIN to use CCI_REG16(0x350a) instead of 0x350b
2. Update the error handling to use dev_err_probe() while maintaining
    the goto entity_cleanup path for proper resource cleanup

Will send the updated patch shortly.

Best regards,
Xiaolei
>
>>> +               goto entity_cleanup;
>>> +       }
>>> +
>>>          ret = ov5647_power_on(dev);
>>>          if (ret)
>>>                  goto entity_cleanup;
> --
> Regards,
>
> Laurent Pinchart

