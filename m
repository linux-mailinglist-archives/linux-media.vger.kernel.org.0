Return-Path: <linux-media+bounces-49604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BFCCE4972
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 07:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FD543011180
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 06:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59936258CE9;
	Sun, 28 Dec 2025 06:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="a7Q6oP+9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D4F199237;
	Sun, 28 Dec 2025 06:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766903297; cv=fail; b=UscYKc52YjTF7tjNdtJl3z5Kf+q+/w43lQdT+CBb/jgk/xdVgC5QFFfynhaACdLiK29HiX/S+zwmd0DNbNQQ5JSjhx1dL2vKaZtiIGiqPh/p4w2z7guhXI6gh6XJSwz0XcoBeg500tvJWWnO+XO6QD38BVHD4rXOnaOs2SOAEKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766903297; c=relaxed/simple;
	bh=kzV/5OvzbZyH+iH8bfcEv4KxSZNbiB6KS1f9AIAQaHc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KQF7HlvLA+bntltwYgTbt7kjQMXS1A90t7VHt4cio99HpYUwYRkkKz5lXy/yb/rPJRi9xGyC2z5UBQIegqSgQ4eJ6jonb+clANizFlbs8HVjJEeSqK0J+JrnlKEBYW2ZJAHdXV9/rJu+RXoJSdkeWMsPg7I2W9ODWYG9TdjhmD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=a7Q6oP+9; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS6R8J53971537;
	Sun, 28 Dec 2025 06:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=SO7H5qqVAEFsOgH7WfSDqGrtwHFNJVvCV2RMULUwzSI=; b=
	a7Q6oP+93X553AB0n809t1f4dPcwnnJNLIzzH+6LCALRHGgiApGKb+GE+kMRw7KD
	C5lLoofmGgkq+DvJ0LaEURJ15hBYtVffuecR38lf00wTx6oMMBSih1G41t9MoOh3
	O02+FmruKrK1zma2ceZB/IBveAUrqZHgIa2iZLnlRJEvzuYvZojy07mtZe411tR/
	gTqhDmNfPnLxrDzT+Fuf6BGcTIICXD/1DxYJljN2ryITxga20FRiQXnuvZspR+08
	LTMNB5VV3fp9jQ7ydOKBRapmsW8ngPm0c2UM66dw8kDLtaBMI+beBpnmxoiFZtXW
	AOLyJ6wg0jzhc0nsebQXuA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4rqu3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Dec 2025 06:27:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylINbNcWA5QChAU8X3DquWgFqhYeMttmGSAbWrLt4v8GYBmbMLGQGPWtvbazEK4bV8eCaH7UToEouSdx0IO/Vh5LVowJd973zfwekNwBIm6EBbIxZ0qJuQhLlWiBnC8+AmRDxSAap5sHUaebOyLatDUEKESxmEDzg/eZMGHBUq2wBQ8mGaDRzMFbRf+TXnK+zd6ZbSskEMEzgicJhDgj3VflqbOHpWDHzj9zCUOe8gHyyzshRWwNYwVnwexzZ+I9659gQ+cVPf4zanInJbawy4E9kC8MX0LefTQFV574+mw8Ey9S+2SEkwjdFWwMiZEkwJJ0XE3hdXsV0uH9tvNPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SO7H5qqVAEFsOgH7WfSDqGrtwHFNJVvCV2RMULUwzSI=;
 b=bZPGcVqiWwCtAg3Ldtx/sFFW2FLH79bsHX63Si2jzx5yYG9RkWFV28554c4FnIaxcKH861UHMAKhHrlgGppycQVDPyVMvm3BfE0Vg54nPt9Qt8Tv5YA+QOb6OEMrI4Ika4RSJaC4H/Qp/Vc5qVFOHZAeFnvP1dITkjFy+KAUjsKx+IYdOgXLpJwxiqYhptfxDOs6MpCB91mLJI6+Iopct5PL2u/eiNfHK8un4Bobjvz5zmnBup74a26I0XI0eRjwE2A8umARBOFO803fDd4DKG9k+heXqfRurvYWabY+Z6mnnPT/SnO9qWS9TcSsdyWeypjC24eylQhzaUgmEkvBMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Sun, 28 Dec
 2025 06:27:54 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9456.013; Sun, 28 Dec 2025
 06:27:54 +0000
Message-ID: <e95881dd-72ba-4a1e-b312-b1efeec0a074@windriver.com>
Date: Sun, 28 Dec 2025 14:27:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: ov5647: Switch to using the sub-device
 state lock
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251226031311.2068414-1-xiaolei.wang@windriver.com>
 <20251226031311.2068414-3-xiaolei.wang@windriver.com>
 <20251227112129.GG4094@pendragon.ideasonboard.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <20251227112129.GG4094@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::8) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 407ecb7d-0a8c-4076-0401-08de45da3b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnhDaEdReWNLZGNhMzhhVmREOFpNeVlnNGJjTEJmMHRIVGFoQUJxeU1iTkJm?=
 =?utf-8?B?TVhybVFaZ3d0R0dQaFVydllUMlQ1K2pEN2dQTVRBT3hOWU4yM0NxMDNuZm9I?=
 =?utf-8?B?NVJEakFRMkFvWTQ2ZjUyUUdnYy8wdHRHb0kvRS85NWYwY2k3bU9UTTA3S2ds?=
 =?utf-8?B?WjhnWDFIbkhoRWovSmJhMWs5RjJid0dqeFk3U0Fvby9HY3I0SGFQb21SSUxh?=
 =?utf-8?B?dWNOT0pMV2RmK1pUT1dJVFFoYitHWEQxM1lvRmVDQ0dqLzQ3Sm43ajBCdnEr?=
 =?utf-8?B?cHRTQVpGYmliZXZkU2RkTnhORUwrS2RwZnNQeWFiR29sZzFpTkcxeVFDejRx?=
 =?utf-8?B?ZnJnbmxBTG5Vc0ZDbTd6by94OFkwSDJDTjRmVzVaUHgwSmFheCtoM1AyVk15?=
 =?utf-8?B?UmFPQXQxVThaVldydU1TZkFaT0N1S1AzWldzSWVQNmNTakZsMjBWQmF4ci9j?=
 =?utf-8?B?TS9xTkI1MHVXOTNzOGVwdWtTQ0M1cURMK2xQSjc5ZlBDeGNPcXJpRVVveHk0?=
 =?utf-8?B?d0tEeVlsYlpaNmpaRVd3QW9KT2hIZHRlQjFydUFuVENia1R2c3FJMGd2dlRq?=
 =?utf-8?B?MWlCR1k5ekhhdU8xOGJUSUc5SnlkR3VRZ1Y0d3lSTUhrV2ZCOUgvSGxuaUkx?=
 =?utf-8?B?UkpjcUh3ZDFZVGQ5OExLMVVjNHo5bTMyeTdsSENiT0JkeWhZWmVMNWtVeENr?=
 =?utf-8?B?R1c2WkNJQks2cVpwc3lNVFI0aW1BTUNPVzVqV0Y3b0JnZXhJUjFkTSs1TEF0?=
 =?utf-8?B?bU4xeUNBcmpmQTgzelluVXliREVRSlVUQjFWQlY3a29jSzlSWTNrNjU4eU5R?=
 =?utf-8?B?cXQyODA0SnZ3UWV2UndsR002TlBZZG0rM0Npd1BPeCt2Z1BPVXhWQldTQWhM?=
 =?utf-8?B?ckEzd2NhY1BLcU0wZWxlUm9xMWZDM3pqOG5seXh5K2N1RWtzMCsyUU1lb2pk?=
 =?utf-8?B?UHBGUVlTNVVNQTJCbjZPNFFteFhGNjZDMEtxeGx0M3I5bVFkNldjUWN2RFk0?=
 =?utf-8?B?NFBrSlNqNmw3bHRRN2xPVUxJcUluRTVhbmQyNUZMR3cwWmJhY0ZCd2d4MUxQ?=
 =?utf-8?B?TzFiT29LaE9MODVTYmJHVzNEOGpSdVdHeEpNdkpycjlmRTkzODlvUUlvUmtu?=
 =?utf-8?B?US9hTXZIY1d5NFhJMlJhVUpCNkRIdHo1ZkdDVktKL1RTVnJqalJTVDJlM1FL?=
 =?utf-8?B?bkE5SFVJZ09jRzhlUmxRQ3pQRHFBeVJCN2ZoZjhpRWgrZUlaZk9HVEczTnVm?=
 =?utf-8?B?RlZTM1J5NmNMSnZSZy9yeHZEUElvZTBoNjhFSVRBUW9FMVVxK080ait1L0hN?=
 =?utf-8?B?RmRTS0VNQUtMUlhCTEtiSjVUcmM2SWxjQ2Z5cUtSL1MwUFhtdUsxa1hGMHQ0?=
 =?utf-8?B?MEh2NURUeE1jdjkyLzBBY3EydlF1aW1XandPU1lkR2YzQXgvMXhVMm1sRFJJ?=
 =?utf-8?B?dzhPdGZ4Q1hITms0dFpHeUhYOWxTQnJiNTFzYzVWRjU5WEhMOEdHR0JaMGdF?=
 =?utf-8?B?aHRiN25BZC9iMzduTjRSSVErM2wxM2xVNllaZUNOU3U3ZFpJTnJ0WFYzOVMw?=
 =?utf-8?B?TGxFOW1CelRlSldaWElNc1VkeGJWT3p0cDNNVE13eWYzODQzQmNBdTBQS1VS?=
 =?utf-8?B?RVdZSVJFVzEvWnVLc2tiTXcyKzBLNk9BNWdsOElWbG16U0JtQ2ZmMnpsU2pw?=
 =?utf-8?B?aVIrT0JCNGFkQk9MR2FpUlRTTlJRMkZwTmpzdDlQckVZbVZydnlmSzdxSkcv?=
 =?utf-8?B?c3JheGEvZEpseERDbWVlZndaRlBJU3cvaWZvMDZiMXNaQWNUWlFBQ2NBNUp4?=
 =?utf-8?B?VXR6aHFhUTFmek1HbVFoeXB4d0RFbC8vbUlNbGJFeGxaL2d1dkhXZ2VDanpZ?=
 =?utf-8?B?dG5KWmZ4U24reXdlUEdPZDdLNjdaRStxcENiTWJEc21vRUpMdFdsNUc2eHpQ?=
 =?utf-8?Q?sR6nM9CT55EYDUiHzz2oEkXcynbQhhj+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXp1N1dieGpxS3JSTjhlczl4dFplSCtlaU5FeEc1c1pHTUs4SGc1cVNMVjh5?=
 =?utf-8?B?eHc3TG4ycFNRYUlLK0VtS2wvQlRJT0JUallFN2YxbXlsbGhjVEQ4Z3FMSHRE?=
 =?utf-8?B?Ym9XQzFsSEhqVGdKNzFvUTlZSkNnRVhDajVuWC9YUjc0Nk5ZSWF6Q3YzaVhE?=
 =?utf-8?B?MzVML1UvYVQ4eXYvQ2xhSzJ2MXRnekJwWDl5V1pYUnFJMVVEckEycW5jc2Vl?=
 =?utf-8?B?SWpRa2VsdXl2L2ZJQVlUMmxGNW5lK2JTZnNldDJqWGhMdWZPTTFOS21TcUxk?=
 =?utf-8?B?MUtwNlozbzlKdklqbitwVVJRZ1NVRzYvZEtMQmE1YjJvVXB4Zms2SEl5dXNL?=
 =?utf-8?B?RkV2WTJJclI2Z042ZVQxRjhhczhkeEF5bk81dDA0SENXNHhBM3FtMGRIV2ov?=
 =?utf-8?B?YjZZL241OUE5V0FxTExuYTZxeWFUZFMwTjNUUzRZNnpUY0hLa3FCTUlUYjdY?=
 =?utf-8?B?cS9FZVVwRTRJZXZsajVLMVlaN2o2N1puNmJGcWxPZ3pvNkNkSGRhSXlzREJK?=
 =?utf-8?B?eTJOZUIyeUw2UlljSTNsRXBjSFpKNm5ydFB6L281SnV4Qm9KOGc0UHQzczFu?=
 =?utf-8?B?Q2xPSXNoOVZ2NmV2aU1Va3lONVlxZ2ZtOUpNQmoxRzVOZ1U0T1JaMWJqWEpV?=
 =?utf-8?B?RmZqYXp1Y0hpOEVRU2wzam00TG1FcUVVKy9rMkFReWRVcVRoc2NCNHI4MExX?=
 =?utf-8?B?Z1lISTRkREtPeE1JMzBMTmV5WVVDbnNnbEpVa1RVaVhqYTNxQXpCbHpVcG9y?=
 =?utf-8?B?MEVvRFhNajdNNmY2ZlJNMFVuaFJqRjltbEs4TFpaQjh2SkJvQ2czaVJweFJq?=
 =?utf-8?B?WGVaNmpseUV2elJDeUZvZ3VVRkJyZjZzK20rbkpWall3bDUrcDdIQ1VtZjNi?=
 =?utf-8?B?UHNmSW13N09xWjRuVkFtbkVhaXdxUFRHakZ1eVQ4MnBsWkRZNzVIcGJOenZw?=
 =?utf-8?B?KzlEL3Z3SDU3SkNyaGdDR0JGcHdsN1ZHTjArNVo5TUo3VzBTZ0pBbVJFTDRQ?=
 =?utf-8?B?M0QvM3BaTWZwRVJ6NFdIMUc0eUQ2NXE3Z1N3L0JBNnRoWERsWkdnVnVoOG41?=
 =?utf-8?B?Z3N2VEhhWHREMDNhcTM1M1N0TlAwQWVuaGlFcFlxc2VmOGR0RFBsQXdmQmFu?=
 =?utf-8?B?NEtIWXJmVklBbnk5dm9Ec0tVSjBUWTJHN3JENkhuUlkvcm16YWFGb2VWYWxj?=
 =?utf-8?B?YkNvSFIrYlhtTFdQdzFPbWFkaFhQWWdEcXFXYzlnZlZkNkd1MXFtRit4akNq?=
 =?utf-8?B?NCsxZFoxUXZhNVVpWnFnVTMrT29xUVVjSUFzZDV4ZktZREhrMlJJSC9sbUhm?=
 =?utf-8?B?MlRYQmdxV1JhSE5XMmFKYzFiZGFsNkNLeE1HbWF1ZCtvVFVJZ29rc3U4c0J4?=
 =?utf-8?B?ZFJtRElOQ0VoZnJYRjZhY0NmN1Jmd0RtWlk4VW5VbGxxY2txWGsxd253TGdn?=
 =?utf-8?B?MGZPaE1HT3FQYkhweTIzcnQzdGtwZGsydkc0N3FQdjJXUGR3UDlES0s5U2Q1?=
 =?utf-8?B?WFN4TnU0aUpySkxtWFMzWHhGVEVnUDdpa1BBQlkxbEFXbGdUNW1Td21pK3Nj?=
 =?utf-8?B?YmxyODJKSVdEekVXbnFPWG1YSzlkYVI3eTNlbVZvU21NSnZyQmptQkErR25Q?=
 =?utf-8?B?c3NEeGFweUh5blUwOEt5TW4xRXNFREQ2UXJUeThpb3VGdmZ5TlZEYkVadVoz?=
 =?utf-8?B?MnNGeGV4ZHRXQnY5SzRQUCtQZ3JzSVFYT21Hb1hFR3hsVUMwZnF6alR4WmR3?=
 =?utf-8?B?WDRCcXRmNVVRcTZCQlZHaHpzMWtRM1lLODBQNjVlM2UzQWQrSDdwek5wa2JQ?=
 =?utf-8?B?TWo5QmtJeC9XNnI1dUlEY0NYR1FXdjFBMGpGbk1zWE55U01KOWVja0ozRUlT?=
 =?utf-8?B?RzdwcFZhQWdmcjMzVUZaN0ViajJuUjhGcGlpMElrN2hQR1VIQ25JbG9RK3Rn?=
 =?utf-8?B?YkM3S21vbWpJc3grdGZnMzdDWE1GTCt4dlhzcGpWaXBzM2hUOW5xUFJtcmdl?=
 =?utf-8?B?MkV3T2dJTEtTRDR6UG1PcmFUdmtpUy9xK3RucjBLSXVNMENqU0lYYkpDSENt?=
 =?utf-8?B?anVRZ1c5M3BBMmxTSW01d09mMjhxRGlKTzJMT2tOVWxiei93RDBjY2dyQm1h?=
 =?utf-8?B?djhOQmQrUVgxMmkvNzF3Mm9nQkZCV1VUWU9hU3BuNjBuMkN5ZkRnZjVwTmpo?=
 =?utf-8?B?YWZvMDl6WE9lVHU0OWRsOGUycjZPUlI5YVUwRERhSzZKUjBOMGkrUGUrTWI1?=
 =?utf-8?B?NkgyaFcyVkVYeEc3WGgvOWhNaDR6ZndZaUxNbGRJU0RHMjVMQWpGV0lOT2c0?=
 =?utf-8?B?ei9FUnpWa0J4NWhCcFJ2dVNQYjA3SWg1emlhSzA2N3hPZGVpa09LcmJ4STFC?=
 =?utf-8?Q?XHGkyYbmjHp9WbO258QG0ubEsdHjM07r3/sNSDFymYTSv?=
X-MS-Exchange-AntiSpam-MessageData-1: 3oo4J2/EbRaZDsWGxgxGLA7awY8j+Pe+MQg=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 407ecb7d-0a8c-4076-0401-08de45da3b99
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2025 06:27:54.0857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yF5FRkofJOauK0BVm8SPkRneWsjaPlhAzbdfHDZlPrmFh6jenUN3h2IcRCcbPRxTHp7/cTBZDKe8fB0bt9eIVROG/xuzCGBr6kr6uE8ifv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
X-Proofpoint-ORIG-GUID: PZHgxuKFINpJPvvzw0-SCAobesaesQxD
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=6950cdec cx=c_pps
 a=audpxvcsMtk9YILK9bmPfQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=SEf9U0bcW3JOc3Q2T5AA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: PZHgxuKFINpJPvvzw0-SCAobesaesQxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDA1NyBTYWx0ZWRfX46nb2yuo4lD/
 +7+A8DsvMsuRz2d0RlTJQYpuwOCHi6dCKHjue5mBE0qs32annXSBxbiMUrjRpAZIWgLrqxrN8aM
 BD15//7wp08/2O0wNlXQc+jB/Vd62GZ4LJUgYzUx/VLHm1kN8xcU/JI1zDD+VNmCBauBLyEF/0A
 6VqxNbzFb8KaDWXIzCLLw4mfcYJYAF2KuGoV+lN6U0/x1ddYH9GUvVb6HLhKI2m4tmfWE3CBa7Z
 wbMEVl6oQD2+hh7BjYXtJ29hCuUX6LKUh2SDhf1Y6L6a+rEY0w6cr4FXvx3YSARLsAoGFOefror
 ZgwFRAg+PKnbe2cJPTVdYVN285YnAsnywXUb81pBchuUNfJ9twLmn6gD3yxQe/i41KpueSVoH33
 yf5GFE3UuV138QbW0EzdqxTdhNVdGaVOtRaNX1OACoJisrgw9hawCF7tuQkLFOupVQFk4wpKgFW
 flgLOJ8OGPagQAziv6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280057

Hi Laurent,


On 12/27/25 19:21, Laurent Pinchart wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
> Thank you for the patch.
>
> On Fri, Dec 26, 2025 at 11:13:11AM +0800, Xiaolei Wang wrote:
>> Switch to using the sub-device state lock and properly call
>> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
>> remove().
> We try to convert image sensor drivers to the .enable_streams() and
> .disable_streams() operations at the same time as the conversion to
> v4l2_subdev_init_finalize(), to standardize on recent APIs. This hasn't
> been entirely successful so far (there are 40 drivers using
> v4l2_subdev_init_finalize() and only 22 of those use the new
> operations), but let's avoid making it worse :-)
>
> Could you please include a patch in v2 to move to the new
> .enable_streams() and .disable_streams() operations ?

Thank you very much for reviewing my patch and for the valuable feedback.


You're absolutely right about the importance of standardizing on the recent

APIs. I completely understand your concern about the inconsistency between

drivers using v4l2_subdev_init_finalize() and those using the new stream

operations, and I appreciate you pointing this out.


I apologize for not considering the .enable_streams() and .disable_streams()

operations in my initial patch. I will add a patch in version V2 to 
enable the

new .enable_streams() and .disable_streams() operations.

Best regards,
Xiaolei
>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/i2c/ov5647.c | 40 +++++++++++++-------------------------
>>   1 file changed, 14 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
>> index 1f8e173417b8..2619971353fd 100644
>> --- a/drivers/media/i2c/ov5647.c
>> +++ b/drivers/media/i2c/ov5647.c
>> @@ -96,7 +96,6 @@ struct ov5647 {
>>        struct v4l2_subdev              sd;
>>        struct regmap                   *regmap;
>>        struct media_pad                pad;
>> -     struct mutex                    lock;
>>        struct clk                      *xclk;
>>        struct gpio_desc                *pwdn;
>>        bool                            clock_ncont;
>> @@ -657,7 +656,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>>        }
>>
>>        /* Apply customized values from user when stream starts. */
>> -     ret =  __v4l2_ctrl_handler_setup(sd->ctrl_handler);
>> +     ret =  v4l2_ctrl_handler_setup(sd->ctrl_handler);
>>        if (ret)
>>                return ret;
>>
>> @@ -821,15 +820,12 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
>>   static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>>   {
>>        struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -     struct ov5647 *sensor = to_sensor(sd);
>>        int ret;
>>
>> -     mutex_lock(&sensor->lock);
>> -
>>        if (enable) {
>>                ret = pm_runtime_resume_and_get(&client->dev);
>>                if (ret < 0)
>> -                     goto error_unlock;
>> +                     return ret;
>>
>>                ret = ov5647_stream_on(sd);
>>                if (ret < 0) {
>> @@ -845,14 +841,10 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>>                pm_runtime_put(&client->dev);
>>        }
>>
>> -     mutex_unlock(&sensor->lock);
>> -
>>        return 0;
>>
>>   error_pm:
>>        pm_runtime_put(&client->dev);
>> -error_unlock:
>> -     mutex_unlock(&sensor->lock);
>>
>>        return ret;
>>   }
>> @@ -900,7 +892,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
>>        const struct v4l2_mbus_framefmt *sensor_format;
>>        struct ov5647 *sensor = to_sensor(sd);
>>
>> -     mutex_lock(&sensor->lock);
>>        switch (format->which) {
>>        case V4L2_SUBDEV_FORMAT_TRY:
>>                sensor_format = v4l2_subdev_state_get_format(sd_state,
>> @@ -912,7 +903,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
>>        }
>>
>>        *fmt = *sensor_format;
>> -     mutex_unlock(&sensor->lock);
>>
>>        return 0;
>>   }
>> @@ -930,7 +920,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>>                                      fmt->width, fmt->height);
>>
>>        /* Update the sensor mode and apply at it at streamon time. */
>> -     mutex_lock(&sensor->lock);
>>        if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>>                *v4l2_subdev_state_get_format(sd_state, format->pad) = mode->format;
>>        } else {
>> @@ -959,7 +948,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>>                                         exposure_def);
>>        }
>>        *fmt = mode->format;
>> -     mutex_unlock(&sensor->lock);
>>
>>        return 0;
>>   }
>> @@ -972,10 +960,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
>>        case V4L2_SEL_TGT_CROP: {
>>                struct ov5647 *sensor = to_sensor(sd);
>>
>> -             mutex_lock(&sensor->lock);
>>                sel->r = *__ov5647_get_pad_crop(sensor, sd_state, sel->pad,
>>                                                sel->which);
>> -             mutex_unlock(&sensor->lock);
>>
>>                return 0;
>>        }
>> @@ -1149,9 +1135,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>>        struct i2c_client *client = v4l2_get_subdevdata(sd);
>>        int ret = 0;
>>
>> -
>> -     /* v4l2_ctrl_lock() locks our own mutex */
>> -
>>        if (ctrl->id == V4L2_CID_VBLANK) {
>>                int exposure_max, exposure_def;
>>
>> @@ -1351,13 +1334,11 @@ static int ov5647_probe(struct i2c_client *client)
>>                return -EINVAL;
>>        }
>>
>> -     mutex_init(&sensor->lock);
>> -
>>        sensor->mode = OV5647_DEFAULT_MODE;
>>
>>        ret = ov5647_init_controls(sensor);
>>        if (ret)
>> -             goto mutex_destroy;
>> +             return ret;
>>
>>        sd = &sensor->sd;
>>        v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
>> @@ -1385,9 +1366,16 @@ static int ov5647_probe(struct i2c_client *client)
>>        if (ret < 0)
>>                goto power_off;
>>
>> +     sd->state_lock = sensor->ctrls.lock;
>> +     ret = v4l2_subdev_init_finalize(sd);
>> +     if (ret < 0) {
>> +             dev_err(&client->dev, "failed to init subdev: %d", ret);
>> +             goto power_off;
>> +     }
>> +
>>        ret = v4l2_async_register_subdev(sd);
>>        if (ret < 0)
>> -             goto power_off;
>> +             goto v4l2_subdev_cleanup;
>>
>>        /* Enable runtime PM and turn off the device */
>>        pm_runtime_set_active(dev);
>> @@ -1398,14 +1386,14 @@ static int ov5647_probe(struct i2c_client *client)
>>
>>        return 0;
>>
>> +v4l2_subdev_cleanup:
>> +     v4l2_subdev_cleanup(sd);
>>   power_off:
>>        ov5647_power_off(dev);
>>   entity_cleanup:
>>        media_entity_cleanup(&sd->entity);
>>   ctrl_handler_free:
>>        v4l2_ctrl_handler_free(&sensor->ctrls);
>> -mutex_destroy:
>> -     mutex_destroy(&sensor->lock);
>>
>>        return ret;
>>   }
>> @@ -1416,11 +1404,11 @@ static void ov5647_remove(struct i2c_client *client)
>>        struct ov5647 *sensor = to_sensor(sd);
>>
>>        v4l2_async_unregister_subdev(&sensor->sd);
>> +     v4l2_subdev_cleanup(sd);
>>        media_entity_cleanup(&sensor->sd.entity);
>>        v4l2_ctrl_handler_free(&sensor->ctrls);
>>        v4l2_device_unregister_subdev(sd);
>>        pm_runtime_disable(&client->dev);
>> -     mutex_destroy(&sensor->lock);
>>   }
>>
>>   static const struct dev_pm_ops ov5647_pm_ops = {
> --
> Regards,
>
> Laurent Pinchart

