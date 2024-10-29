Return-Path: <linux-media+bounces-20531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 568059B4B02
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 14:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79DDD1C228D4
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 13:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069BD206049;
	Tue, 29 Oct 2024 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kziqh0gm"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2072.outbound.protection.outlook.com [40.107.249.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A396CBA50;
	Tue, 29 Oct 2024 13:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730208992; cv=fail; b=Tx5qstTHvbKoREHYS7l6FHxRn7YzwR/BlgrGUn53zumJUYMF9LilnHX0TL7mkLirYgXggI7dXjWvx/RHykkseUkDSIwc+VRUK/g/a1ObCyNJnIO0cNDWtidlbXUsvZcvdpN/mZCk+5YI+Y4zJEVFVS4zpXgMmmXHUagvCawABdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730208992; c=relaxed/simple;
	bh=Oz9lImdsAduy+ATmth+bHLGqaHLjRqtOzdWstevYkPk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uAURoU5pU4I6c/jhXMCQ67GHlhoqySYTpzjzsEQqKnx8htXBUkBPmsKREbSamtOnu/9eRYqQy9/AT2k2VrzeBfMin4rG+VYB238c9ysKevSyQvVQxTGjuZ9zjbp8PcMEFOhUootUXrzehvKZOCzyXIaVdvk90tjUoIiwmeZN2fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kziqh0gm; arc=fail smtp.client-ip=40.107.249.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADUCfPz0tEMvdHruS6ixAVFbdJq45rrYiateT8a+bM4oZdxHdpglOZJuAEbuqBNZlelGUmyAg1q7R9S0kRSbgnYmhe1JaMkUdm1hgadyveNKbjUbelrLVzvtcdc9t8XHEiBp10YvJtUtPgNbCvZ47MF3pdZUB1S6VeYdm+SkMTRY8ZAdAm+zHZ0zTvBflzaMBA0mKHrSHD9quGTHlKiQEXI4SKbfU57FgSmlidZrv+tsniYOS/ec839Kgn5r4mUz0qkbdnm2Ga8xQNmRzFSFyPzOpzEN6ks9qR2jhEKdXiQgn+z2uAk2gyBQCWu3sEHwwqMa275PLPJdhtswcdoueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28FDzevP0LYcmqyam3KNCT4iXp11r0MX6LSr6w6Hj80=;
 b=rrPtqFYGusDt6glecOE+MFTHka97EI1gvlHcoVNz+lqI/YnGkDJd4MeYcS5ANynCZMWY1GsYlNdbkPvEFXbc5O/MdCE0BEsSfyGSECXhlsvU8B1yLQ5tLWGYr9Z5Znm+0LdcNJVM9AeNIQNRUHzAKRZaPZo1xQf1pA7zT4gBK4Y9uxSe9YzPboYPYwB5SkglX5CC8npaWOxHssSRBJLfL2YdnJAsdrM1aaJmynnPoYp1QUT3AiEPsEStb8CE+xKWsh3tCTxAPEsEIt/PCH44HTiKnNNhKWExyS9wggu1KOCy0KmLquhY79qrOAqMXBGFTk6AukO2PG4BMvpvUZva6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28FDzevP0LYcmqyam3KNCT4iXp11r0MX6LSr6w6Hj80=;
 b=kziqh0gmKaioGSsQmOVxMLAisbqfZPEU9YFGZfPE1E6bxhw1tuZ26I0QG848vxFXi/96KfOy2r5amK0GaJAAe+PuhjJlb5HQpDXCjQOQuV4X60AzVCSGMDVkLvmyHrOdUdwhvbIgd7JNMMGB/m9FH5qdivwASsZ7I2C2BjyHk4WxFMNgezGZQLdQEOEF1V4YKU28v9+UVeAc7G0je2XPIf5aa8hHrqgjjNhUALXYDgUJQkhRgI6X+GF8aMa7uFdqZF3iSMd11wAFWbP9RE5DCsxIOD6ieo3L/jSE1NsiVORUxC95bWjjKTGWdKtS7NW8vrOHLaxm+cgF2Cxya6JVdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Tue, 29 Oct
 2024 13:36:25 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%4]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 13:36:24 +0000
Message-ID: <3e2083a3-69d8-4a27-9476-f0fc1eed6324@nxp.com>
Date: Tue, 29 Oct 2024 15:36:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for
 OX05B1S sensor driver
To: Krzysztof Kozlowski <krzk@kernel.org>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, laurentiu.palcu@nxp.com,
 robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, julien.vuillaumier@nxp.com, alice.yuan@nxp.com
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-2-mirela.rabulea@nxp.com>
 <216a2728-ab62-4b76-aca5-8d911687dfbe@kernel.org>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <216a2728-ab62-4b76-aca5-8d911687dfbe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::19) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PA4PR04MB9640:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef7200a-b6c7-438f-ffaf-08dcf81eaeaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YStBK1YxaGY0bkM0TytjdTZGS0VDR1lVTkFWQy92SU4rQ2tvM3ljV0p1MEZa?=
 =?utf-8?B?cXVZaFlUSlBmZzE1L01mT1hOYVIwaHBraHVwV25wVmRybnRYanVzM2JVdEdp?=
 =?utf-8?B?V0I3L01qa0hKMUZ2OER5VUhrSXZPVm1KZit3Q2JoSGxhdUVHVUt3U0pTVzBq?=
 =?utf-8?B?WG9CMUNnZmVWQyswNzZZWDBpOHBPcUQ5aHBSaU1wODBmNzRaazJENkhFbjNG?=
 =?utf-8?B?QStSNTlkVnVaUGtCcjA4OFpsc0dwbE14U2pSUk01aWppVzFCTFNDTWZVUG10?=
 =?utf-8?B?ZGJjWm44eXZCWVpTZFU4VXFkelRxQnpuc0tVbWpxSDBHM2tGR1BsOWRNMDVW?=
 =?utf-8?B?WTRZSUpnVVdpTG9xVjd6U0x1QkpwUHVWQmZyVWgzUld6am5wSk1rZ1dWTExa?=
 =?utf-8?B?bWw3Tm9obWdLblRxSTRRYWJ1MEtXYzhjZ0tQbGxERHZyYmlHeU5CSzBLTm5v?=
 =?utf-8?B?aElsYU15Qm93Sk43dFJsTHJrN3VDVGtWWDJyS0ptYmZ1TGpOU3BYOWtMOVdp?=
 =?utf-8?B?cWVIUUxwVEJPTjMxZWZiZnV3VmxoOUZBaVZnK0JoNDJjWGRzMGZXOTVTYUV0?=
 =?utf-8?B?WDFOYjBUT1lDaWZYQkhRUXV5YVgreU16b0lQbnJKQlpFRGt0NHZnb1lmbExV?=
 =?utf-8?B?TzE0T2FBZkVWMlNqcWE4V0U0Z0V4UmxBSHl4a1FDYXJrVUJ0S1cwR3prNGpv?=
 =?utf-8?B?ai9KU1R2eDhhWVN4b0cxck9ZN1VKaE9WZk5nYTR5ZEl0UXdBdG51eDVUeGtk?=
 =?utf-8?B?SU1YbE1TdUtVYTllRlVYeUpIYXV6Tk83TkxSRjR2ZDZQZGdoS0poWjMvSHFH?=
 =?utf-8?B?NmpvNHVKcFNwN3h6MmM3a3E4SGdwaEgwdWJ5OHB5azZVTDBrdFVHS1BHeEZ1?=
 =?utf-8?B?NW5HaG4yNTh1aVRsQkxvWlRsVUhuOWVJVDd2M0RaM3doZ1ZtU2pwR01SaVlD?=
 =?utf-8?B?bWplR29tcHlvMFZmOHYxWDVvcVo4dVNCYXRvSEh5VVNHOWk2dGRCZHVlZW9F?=
 =?utf-8?B?TjVXNlNJWVByWWE4dm9tUG9MbG1pZE5HK2QvbjNENUVFQTF2UlQzaHAvaEJs?=
 =?utf-8?B?d0RVUzB1cVBkeWduK0RWaDUxR0w2cHlWR0NBaEo1RXp6RU5vMm0wUkltYm9p?=
 =?utf-8?B?Mnk4djR0cFR1NnVjSVZ1VXUvd0RWWE5sTDBCNmVJdVBraitrOEVvZDBGTW9q?=
 =?utf-8?B?ejd4V3gzWmlXM0tUVzJPWDZDOXhnYmlFeG9ZNzFMa1ZxWU9OazUzZ1ZFNEFx?=
 =?utf-8?B?Uks4SjJUQjdBLzB1Q2pPcitMRFhnbXU0WHpOUVorRFRZV1pMRGJ2N1c2SkFW?=
 =?utf-8?B?NURNdWMycGxmWDFzUEhOL1lKM3VqaHUvM3E4dElIRzBldUJCZEJ1QTZxcFBM?=
 =?utf-8?B?bFVZdzJWMnZaR3FDWFB4dlN0RmpSQzB2WkxkbVAwenp4ODQrN0cvamdqa0d3?=
 =?utf-8?B?blMzRVJVRUNxYmd0VnVPYjBZOE96a2dvTTJvMzQ2OGpZQnhXNUhUQWUrNVJG?=
 =?utf-8?B?cHFVOUtjMmJaVExPbnhCaTh2M01TRXNySFpDekxwdUROSXFzZmtHbHF2ZXdC?=
 =?utf-8?B?dXd4QVFpZkFiMk81MFQyNlVabWpuL3F2b2prYVVqQXBZMkVISzhFL1J0UmYv?=
 =?utf-8?B?dFBZM3Z1N0VkVWJuTFJXbnptNTM4WjFKSHBhZ0NHQ3JIeEtJcHI5aXd4Vklw?=
 =?utf-8?Q?dDD5sf0sBFxxOlf/WMKM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVcxTklkNGdQZjBVT1BUVjZucHhrRnJmVHBseSsyYzhGd09kczc0WnF5QTI3?=
 =?utf-8?B?Q01GMU5ZUjNLMjVtaEZmNWFKQjdETk9PcTJUZ1pkUzBCRFRRR0lYNERMZzFN?=
 =?utf-8?B?NGwrTGxRM0hZdUgrcW54MUpZaCtaWFU1ZWVDdVJtbnJNMFBlTkpRT1pVZWtr?=
 =?utf-8?B?bjQ0WStPblEzSlN2UkwwWDhoVzFpZzkrM0ovdkNsYW14TUl0U0dCWDZLUXJD?=
 =?utf-8?B?Uk5YVlJLSzNMMTV0VnZ0NXlQZzRBWjFpY2lYZ0JUaWZ2VldtcmdHSFF3Y01D?=
 =?utf-8?B?aE1xZHpJRnpYSi9xK3hrbkI3SzRVMWVFU1hsVmltZmhVZ0FFT2R1dk56aGc5?=
 =?utf-8?B?OGJ2cjRsMUVmWms2bGttbno5Z1I1azB2K3YySGdEcGJ1UFBSVUZTR2hEV3FG?=
 =?utf-8?B?YmVYK0d1OWt5alllR05mclpFZ0dkQTZja1VYSTlKbktIc1lKSE56R3E5VHA1?=
 =?utf-8?B?bVBXRFBnSEEySitWYlJ6c2pRMHZlNnhaTXEwWWF0cmlCTnpjdWJsVE9RcW9O?=
 =?utf-8?B?bXNGQjVxQXNHQmtSRlhhS3hEeklubCtzNHBVV0tGRXMydVZkS1NGay9FZ2Vq?=
 =?utf-8?B?b1NHYkpLTFM3N2FIclNlelFkOXBTbDlGRFlkKzdWOTlxY1BaR3o0UXMyNm4x?=
 =?utf-8?B?MnVUSktJNVJiby9DZ2RsNW1GZXV2ZTBnL0VwL1lnQUJIbVY5K2ZCMEVpMWZp?=
 =?utf-8?B?RktkRkVUd2c2RHEzcFgwVFl1bGx3dzNlNVFRV2IrWHlzNTkwbHgrNDhDUXU1?=
 =?utf-8?B?R0xiRElSZmpteDhWbmRpZHJvR3IvZUszK2FkQVhmSmxzeFdzRldxc0Q2WlRY?=
 =?utf-8?B?SWJpMnA2NExLQkdnaTFzem92azRyWlhLOTFiWjdYRW81QmsvUCtYZXp1MjV2?=
 =?utf-8?B?Yk00TUR4R1J2VXFoczN4d1d3RzdrUWRYKzJXdXBSUkpNbkJBenVmRXM5VHBE?=
 =?utf-8?B?bHh6d0U3REFybTRxTWFBQks4YzdJNjRsS2JTdkxWUlErVHZacElyNVlEeDNo?=
 =?utf-8?B?bWlGcUlKL0x4eDJlWVlLUHU4T2NkQTNicVBSTHZKcEdKb3hCSURUWCt2RFRl?=
 =?utf-8?B?K0Z3WS95YVJJdjI1aHc3N2FDU2ZRZlpwWWxRK1RHSnRoOWo4L3lWbXA0WUtv?=
 =?utf-8?B?aGtURXd2SGVWVEJCb1o1OUZzb3VYdmMzQ21KSVRPQUpDQlI2TDJmVkNJYWRn?=
 =?utf-8?B?bjdzRGQ0UnJ5a1Rva3ZqK2dXRUFWL290L09JYmEvYnBhbDBLTnFIWGYwajMz?=
 =?utf-8?B?T0h3QkdjZEp1VnFxWng0VnNGVStnRGpoRUlaOUl1MW5reFNzWXQxaWN6eW9x?=
 =?utf-8?B?c1NpQzlQajJsSm1QSHFKYkZYMGxRWGhoL1pHcWFyV0JOOW0ycHZ6ZmF1cnVI?=
 =?utf-8?B?SWkxMmIwcnB4elRhQUJSUWF6TEQ3SEE2N0o1dWtMYWpZclZmcVljeEhOaHlT?=
 =?utf-8?B?dGtkclE3MTNtSzFvR0c1bHhpbDdTMlczQllCTHlaSFNaVW9XYU45Nms2WlhG?=
 =?utf-8?B?MzZCK3pGU2dVS3BEaXhTV2hrWUM1RVBlL1RNSVBabXo5VCtVZjArU2RwM0I3?=
 =?utf-8?B?TzIxcEJ1YnMrUDF6RTBrMmZ6VmhUSmVSMCt5cTNQMmxRc0dNa3RINXpEbXdN?=
 =?utf-8?B?RWFhQU9acGxNQlgzUUNjVVdDaTY5MUgvRGpBU2NpQ2t6cStDZ3BSMFgvRVc1?=
 =?utf-8?B?Vys1eWk4MzJ2T0RuRTcybEp0d282K3hIYmxNcG5HcGlUSVVYMGM5c0l1QWFi?=
 =?utf-8?B?eWEzTjA1RHQ2Qks3KzQ5bDRpT2JlRnI0VUZFNzhPUUh6aHFOb2NxbVFZeVhl?=
 =?utf-8?B?cFdySktMZXNhUWtpVUkreUtEY1htZVo1NVJod1dFM3NFYXBGeW5SaTdkSnRy?=
 =?utf-8?B?QzRSVVJBRUVBV3FIL0c3QlpicDJEcytQVTFzeUtQS3BwOFlwTjNxWDBoQjM1?=
 =?utf-8?B?MnNQVk9sUTJOdmxHeDhLSUxXMDlZUndhU0grbklsRURibnpCaWwzRDhQaC9N?=
 =?utf-8?B?cHhmUGpTK3BDbDBYT2JVNkg4WkhWMDNsMGpkWFRtN0FSdUNVdUdrb2FBWkFF?=
 =?utf-8?B?SlRoOVVYY09mQ3Y1a0RYZmVLUkd2WGZsMTZTWXpxQStZT2t3VklPM2tHMGNY?=
 =?utf-8?B?Z0lCUXNlMDJ4clVsQVlmRTJsZlYyb1pFUUtCNStQSnVFeEtqM0lOTjg1Qmx0?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef7200a-b6c7-438f-ffaf-08dcf81eaeaf
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 13:36:24.6155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddpJsHJca0aIS9ZwgG50NwOSTYNRPiWEgRaNMnbqwuTZkPHglVYEsb3nLx4+hclMkYroahqbMfez8BfznxKqoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9640

Hi Krzysztof,

thanks for feedback.

On 29.10.2024 08:14, Krzysztof Kozlowski wrote:
> On 28/10/2024 20:06, Mirela Rabulea wrote:
>> Add bindings for OX05B1S sensor driver
>>
>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
>
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
My bad, I ran get_maintainer.pl on the driver, but forgot to do so for 
the bindings. I will resend to extended audience, once I will also 
address the feedback from all reviewers.
>
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>
>
> Binding also looks very different than all other devices, so re-write it
> starting from EXISTING GOOD bindings. Not some downstream stuff.
Would this be a good example? 
Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>
> A nit, subject: drop second/last "driver". Bindings are for hardware,
> not drivers.

I will rephrase it to:

dt-bindings: media: i2c: Add OX05B1S sensor

Add bindings for OX05B1S sensor.

Thanks,

Mirela

>
> Best regards,
> Krzysztof
>

