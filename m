Return-Path: <linux-media+bounces-37827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB7CB06BCF
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 04:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EA1B563C2E
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 02:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DE62676DF;
	Wed, 16 Jul 2025 02:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YuVHlGLv";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="aIUjtC8+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BA119D09C;
	Wed, 16 Jul 2025 02:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752634005; cv=fail; b=oNbprVjsFOI2GpL/Eq3GM/m6xapEASntyb9shOJ4XYbALl1SAdA4hrTQenb/mpVyOk9BW5q37kCS5FZCGGtXHic5WcMgZxN/Gf6CnkwdyrlJ3dh6O6dwyWZrEmT2780skZ0EZ+yAoWlO00Zwja10v5sY5x5JW8MZ2HWoJIKrs4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752634005; c=relaxed/simple;
	bh=LTvxEHcN7oHN3cA2qV4OFwF5PpxoKtBkoFRox0KaCxI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fC4T+6R10iYRyjvBsDMSpA2/jigGlmrynse090NvIszzeN8MmrFd0XoUw8STZJ/dW5ixDZNCd+4f5vZpiLB3JVBmhtq9KjBSGjTWKRJv9AlsNwqa/Iqe5IToVPuO4FVBThEbhQtu5vuOL0ox1xZF8mkr2xU7s+ZtpcG6ALREmfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YuVHlGLv; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=aIUjtC8+; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 12e4423861ef11f0b33aeb1e7f16c2b6-20250716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LTvxEHcN7oHN3cA2qV4OFwF5PpxoKtBkoFRox0KaCxI=;
	b=YuVHlGLvEWCz1sBbiUi4qOUoPcHpYfJo3ekYNzOa0rQtm7B0PiXHjHbog4y+ALxsR+HNjKW+1ZaVFfMDrlUYXKK/jvSK99yYWZuYvj29VIGdJrN6dWcMVm4bRD6peCXJ9pMg17igJnaP/BAJz1MBK2oAk6kiMt8w00VulKYMcsU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:f3fa06bf-eb2b-4363-8c93-7e39263181ed,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:18e033df-2070-40bb-9c24-dfabef7c07f4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 12e4423861ef11f0b33aeb1e7f16c2b6-20250716
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 431613096; Wed, 16 Jul 2025 10:46:29 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 16 Jul 2025 10:46:27 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 16 Jul 2025 10:46:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMXgxUOI97+ka8A4D8LxKWJm2WSCgyiEGv0RmYszxYVrQzG35yf/MV3mrtukyJDoecb0BX/CTcxEAHTXHzBbIhD5MAGnYFPWbFWQd7w4+RrTxpM7JT3quryLseWyFnlXJn6tFB8CzDxCpldUtudArEUq52ZsFQvlLp+bkBHzv9Sx8nknSjJfdH1bhilgvQ18woMa5nQUrdDhZvyNXdZuLZuabRsDvx0OsX8hYLmLZclbk5QHRCMAOFIfBwKifZvraHfq7y6dqqAitB9cwwKnE2kyv6MZL7O5BbgdhTdw8nltGSoAi6Nz5EjT6WEO20NgMAyNQ4/kXc5iNaZqLsZpvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTvxEHcN7oHN3cA2qV4OFwF5PpxoKtBkoFRox0KaCxI=;
 b=pxtkrqIVZKtVFLmoNh71FJaOHe5AzHMZ+3TDUZHBoxZ8xN63xHt1vIgxyxIbFzVcSlmQwhEUI9/e7OUvuGywlwQqUFNi+wFxfAfh+mHU56m1/nu8ZD5d5RKTg2pn6c52EvEsF2wemU73rLsL05XmLqlHtPvi3LgwJgkJKFtP+80SsFnqE9hMvX7RpsNb1MVLm0nMfhwezX6igy7dUHsm3UYedeEoYCPr9XYl5BvZmBZmnw1Q57XSuzp87oewPLauOS7pgNFJfocBYAZARizANDKTrjKXvL55T/rpDCxvR/cQjnHG2BqYzNA24p5KMmwrRe66qDzHapAgoj/lbHxgWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTvxEHcN7oHN3cA2qV4OFwF5PpxoKtBkoFRox0KaCxI=;
 b=aIUjtC8+coovVWlvsVMJ6J73VRlyXAXLN07KBdtBuYyNyKzLH4hVHFdUQWxMF4yTVxBptuLxaLDaZFo3ZuwoJC0PShCf/lV9iqtX/d7qPzrMtP7dpq8mw2x9bP3VeDXs0K+4OIaQpE0QOLAGHc8gIEOz7FZZAXRX6JWMZMVkRRE=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by TYZPR03MB7665.apcprd03.prod.outlook.com (2603:1096:400:425::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 02:46:25 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3%4]) with mapi id 15.20.8880.027; Wed, 16 Jul 2025
 02:46:25 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Subject: Re: [PATCH] media: mediatek: encoder: memset encoder structure data
Thread-Topic: [PATCH] media: mediatek: encoder: memset encoder structure data
Thread-Index: AQHb9WDKzZpzqCq9xEeUfZKVd1Zy9bQzLVoAgADfhwA=
Date: Wed, 16 Jul 2025 02:46:25 +0000
Message-ID: <cd24187711932f4f533be79de305606bf93697f3.camel@mediatek.com>
References: <20250715081547.18076-1-irui.wang@mediatek.com>
	 <ddcd26ad-1bf1-4d14-b341-3c0e1e56cbf3@collabora.com>
In-Reply-To: <ddcd26ad-1bf1-4d14-b341-3c0e1e56cbf3@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|TYZPR03MB7665:EE_
x-ms-office365-filtering-correlation-id: ccc7d5de-4a8a-4cea-9f51-08ddc412f4b9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YkhrVUVpMlEyQ3RuMHF6cHByTHQ3VzJGWVg2eVZLTkdIWmdyVWdtSnVNUUtL?=
 =?utf-8?B?Si80U0xsZlJoWnZYNXVJeE1UTUZhSElQZGhLZkxLSDl4ME13YnR4SUJtbFRj?=
 =?utf-8?B?SkxYVk5kdXBZZDZjVmVjY3FFTGVueHJYQzNFTU5qWkp4bmdYS3NBQjA2K00w?=
 =?utf-8?B?YklnRXByYWhBWE5ob1c2c1hJU2dkMi9aUGQyWmtab0QzSjlVME1UNmtWb25K?=
 =?utf-8?B?ekx5LzVHL1ovaktuQk5KK1AzNncyTkhlV2U3clF0Nlk1aVJreGg2Zi82RHhF?=
 =?utf-8?B?czNURU13WFgxd1RaU2duU0g0YnJpbkp2eGZ6K21RcHlZOHAzWXhydnBMTWtI?=
 =?utf-8?B?TXY5S3RGeVB0NGFLdGNuOXZZZGtjUXhqdG5pbGcwbHdGbU1peU1LR0VsMTdB?=
 =?utf-8?B?Rm95UkRITk1ta3g2QjJPblRDMVVzNTJIdndSR1Eza3lSQUtMeFFjUlVlZTZF?=
 =?utf-8?B?VlFSOWpuS1ZwS0M4L3poc0dueXJSWVdWL0RiZWlvWE9ZclZtLzVVMTFldnVq?=
 =?utf-8?B?Z3I0QWI1S0swS2VPVUJBQ0p0QUVucU9adDJzT1BlMTc1ZlpyTzJkdFRoRENU?=
 =?utf-8?B?M3RXajkzYlRqRUpjQ3E3WUtuYlQ5akphMytjUzkzRW1FR0U1dXNUN2ZGS0F3?=
 =?utf-8?B?b1MzOWRQMTRtMVUyNjJQdFVkOE5PQzZMUWF1eXpqNFJCSjhwdzJraU9VK1pj?=
 =?utf-8?B?TUxSeHZsTFFBOUplVXByLzVjS21yQy9BZ0JQeW45UmNmZldhNU81TDYxeWU4?=
 =?utf-8?B?N3BNcXNvaFgwdnpnamhNeXZEb1pxSzZyNlRJMGtLOTZZVHhRL0ZqS0pWWnhv?=
 =?utf-8?B?cU5HR0tDOEFHMkhGZ1R6eTFtWTdLMkRnclNHM1JrNkZESXZGME40dVlzUWxJ?=
 =?utf-8?B?a0pRR3lYdWpYenNNV1JMOWhTUkUwWXNmNGt5bDN5akdWNzlrUHJHczdSSUdj?=
 =?utf-8?B?RXdKMHNmMkVrdnlBV0xIY1l6MUxFRExaVGU1cGZOMUVwNHQwNWM4UUgzRUlp?=
 =?utf-8?B?a1dOOCs0d09Ycjc0L0tZbzZCM1IyZGVzYlVySjFVV0RQeVFaS0traXhHaWNM?=
 =?utf-8?B?aGlsU3FNK2lTRHNNVkowem15UGgzTll6Qzl3cjhqczNUK1hYSXRDZDF2ZGgv?=
 =?utf-8?B?VGEvaUJOZW56aXBtaGJVYVM4QUtEZG9uVFJ3M3VBNXZ3cVJQMWIrT29hQm9w?=
 =?utf-8?B?Sys1ZFJ1TWFUTGxRVTJ2TmFySjhqNFBQWFIwOHdLSUROZk96QlJFWlNRZlJ5?=
 =?utf-8?B?aHdwU2twQVNwTXV3am9reGU4Z2ltb1Bka0pFZnZ2MGt5cjE3U1YzOTZodUdV?=
 =?utf-8?B?VTEyazZQMDJ6Y09hYWg1Zi9pOEs1NWxaTGU1azNVTVFYVDJzUE5oeGw5aVRC?=
 =?utf-8?B?MS9TM01WL05YRURqV2lneDErWUVHc1puNjVNWUladHJMOGMzK24wRExVemZm?=
 =?utf-8?B?Syt6czFBSUhYS0RFaWM4MFFXS0Z6VDJxcUM1WHFyaWJ3Y1AwRHE2dW5ac3Ji?=
 =?utf-8?B?Qkc0QXE0ZVBUa0EyLzI1UVdlSjJCKzBZZzBoZzJyU25Ub1J5S2V1M2JJNWlI?=
 =?utf-8?B?eTNRL3U1bVpxZkhLck1VK0VaUDRLdlZNVzBWQW5kRkhwZUFFNkpoS3FIWWd4?=
 =?utf-8?B?TFcrTVF2NS8wMXh4NHF0OFBscTJZRWxRbkljY0VlSkc1bDhmUzZxdmsvWUJ3?=
 =?utf-8?B?Rk1uMEluY3ZrNmdZUVNiamNxS096cGN4a3BNaUdvY0hzOTZ5U1haZ0VxZmxP?=
 =?utf-8?B?K2wzUFZaWFU5Vk5xcmRGSzNDdTZ4SjN5VmpjcDdXSnJvWWF5bldEM2Rleitv?=
 =?utf-8?B?UlRwNkltZGNSSG0yNDlCOFdJbjNud0hTOHpBbXdmMVMvanI1NkdxR2EzaUhX?=
 =?utf-8?B?Tm0vbFh3UFpIYzg5TkhTdFdJUnkyTytIYWl1UHQxNWhnQkc3alNRN0hjaW41?=
 =?utf-8?B?LzhxdDNBOXFyZWxxMWxWTnFtWDFLNXVmZld4WmF5MUM3NUVBcXRtTGRIMVFz?=
 =?utf-8?B?dm16cHVZM3JnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmJKTGxYOFUwMkI0dEc3ZnNKcVNISVI2VThpYnhTZ3BjaFphaWxhUjNBNUNS?=
 =?utf-8?B?VlAydkh4ejlqb2J2UXVud3pOMkVYUnNMd21JbHpzTG1OYklQUXNENDBIcU8r?=
 =?utf-8?B?OHRDMCtCVTVjR0J0WGZBQlVlRG5XM1dKLzNBVTJWc1lTWW42cGl3amkvL3Rz?=
 =?utf-8?B?QlpLWVNmeHZYZ0hiak9oV2JHYy9lZW1VeDA0MFZXK0lKbWZQeU1IZ2tDR0tL?=
 =?utf-8?B?VXQvTUZLQzIySVZ5enJuQTVSUDJXOGticVRWUTdoZzgrZGo2Mkp1RjQ0Tk56?=
 =?utf-8?B?blEyb0dQZHRaV2ZVVDQwaklUcmdXRklYUkJUODhKVWRwNlNRaDhvWGJFVkZ1?=
 =?utf-8?B?UEc0dDlVeHdyelQrVWh0Y1pVemhtTytPYVNVSXgrTlM2cVl3YUZoM3ZTeDI0?=
 =?utf-8?B?N3RNdVJrWjl6eFdOWUQ3NXpsWDNVR3R3OHlCZ1dyUjRKYllpOFBWcXJuSWN3?=
 =?utf-8?B?RWEzT0QrS0xyTnJibElmbm9vdnhvYVhabHQvaVRoMldXcWN5dEtCN054V2lm?=
 =?utf-8?B?S0toQ1NuRmdhRVplYVRGeEdXT1Y0ejV6NnF2Q09pRitheUVLU1pnQkxRaXVh?=
 =?utf-8?B?Tk0wM0ZjTWNZbzJCWWt4WXR1S0UreVUxV1VVYVZWYWpPVHEvNXhPNGZPNFo1?=
 =?utf-8?B?Z2lYbHJXdEVnTE51ZW9EUTE2eHpZNHB3M0RJSkhpUFkrdEZBdDBmclljOHlm?=
 =?utf-8?B?MzduaFdJaFlpWEpLekZFRnFTbzBUNmJyQktrYS9YZDArNW9SSE5ENmN0SEJL?=
 =?utf-8?B?bDQxNkkrZDhIWTQyYXpnVUJudWZFdE8yTDhCNDVYWnBLSVdoOEV1byszWG1i?=
 =?utf-8?B?NXBXNWpzUUhuNWNlQUcvcE84ZUpTRHdQVk1ydlVNN0JkLzd2ZUV3TkIrVm9s?=
 =?utf-8?B?Z043bmQ3akk2d2x3WEZtRy93TDJma2tTUlh0Qkxqa2QzNjVBK2M2Yktaa2tB?=
 =?utf-8?B?ZGJWMUgzUi9rMjFmSXloQU5kS1E5elNwdVR0V0JxS29EV3pkUjh6Mmg1Q3Rh?=
 =?utf-8?B?Y1ExRHNZenVBUGcvK1R2ZFR6cFRZcC93NlF4czA0bEs1dWVnczgzcnpWTnkx?=
 =?utf-8?B?QXFGODgzOTdQaTFYamFUNUF1TFZGWkJtbEtBczdOdVNWMFlVT3JuVnJUemVN?=
 =?utf-8?B?Tk05QXpQTWlUZmV2MGpVWlJoeDJwcXhUWVBFSVBXZE9KTUY3dUMzWGpvZHNh?=
 =?utf-8?B?ZHFNS0ZWWmc1bTVzVWVCcXNWQXd1VDdLWktqemlHOTB2S085VFA0M2w2M2pQ?=
 =?utf-8?B?b0EyeHllaS9VZFkzN1ZUSmh3QUk2YUFuVUQ2V0ZEbFU2UVR0OHlwNWJGUzlp?=
 =?utf-8?B?SlJ1ZU1rT0l5TE1LcG5Sd2FJOW1qaTlITjF6N2J1OERWK3IrK3M5UUVqSnla?=
 =?utf-8?B?b0V6Y3U0Tno5UUdvZjBCZjdIS3VFNkRIUWNZL1JPdk1DQUNzR0VRNUVpRTBv?=
 =?utf-8?B?UHNzaUhWa29HRkttdWsrQjd2cHpkamo5YXNlck5wbFRMVkZiVWFoVlRPcklZ?=
 =?utf-8?B?K1h2d20vQlU4YWlOVlFGeGY2aHRGS21URFltcSthMkhaRzNsaHNTSGlKd3RE?=
 =?utf-8?B?TjRJUk1zclhqMm1TVmt5ZlVSNzhBK29wOHlzZ3I3Y3VDb3ZKaEVQUG4wK3hx?=
 =?utf-8?B?aG1nZHhXNVYwTUhoall3eXB4K1puZ05lSE5pY05lUk50MnM4bm1jZ01QRXda?=
 =?utf-8?B?QmxVLzk1N21neDBYTVl0Tk0wQU93MDBrS25kK3hHOE1hV0xJYmVxNEExVnNJ?=
 =?utf-8?B?Vk03d3lmYTBmbFJTQ0toOEhmK1pZUFRaTkh0SERGWG9XckNRM0J1OEg4T3pQ?=
 =?utf-8?B?ejRTNVh4Y3dualNuMERKMnd6ODFOY1p3R1pDQkprY2hqSE5OZkdBR2dqVjQ5?=
 =?utf-8?B?NE04S1dFUkZjNklZaDNIaHVXVitEdkVOaXpOSXZWb3lJTUlDNGtzWWpnRW9y?=
 =?utf-8?B?cDRzK3pDVHRJSlFoMmVSeFA3eHE2ZllVUVdXR1hFVnl5VEtubFZTNXBrNmRw?=
 =?utf-8?B?dlZRcWhSVmtvVzJTMWRGTlhkVkh3SWxxQjU4VWIxcGRRN0J3cVlVRmtvOWNF?=
 =?utf-8?B?V1BrcC80WHpKbzRNUXFKcUxhWHBMaHhFeTRjd2ZJeGNXbklhejdLdDhMUS96?=
 =?utf-8?Q?ouvVjbdZvcGE7OCR1CwPt8DC3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6ED614454EF284CBCF81CC65C78A7DF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc7d5de-4a8a-4cea-9f51-08ddc412f4b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 02:46:25.0372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DsFd0UuDX04ipzomWfe62jijALm8ppNkJ7lqPicZRuXzVTlHRMnagCYcdG/5ze22ydcmVAg9YRpwcYRPd2dNQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7665

RGVhciBBbmdlbG8sDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXdpbmcuDQoNCk9uIFR1ZSwgMjAy
NS0wNy0xNSBhdCAxNToyNiArMDIwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6
DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNv
bnRlbnQuDQo+IA0KPiANCj4gSWwgMTUvMDcvMjUgMTA6MTUsIElydWkgV2FuZyBoYSBzY3JpdHRv
Og0KPiA+IFV0aWxpemVkIG1lbXNldCB0byBzZXQgYWxsIGJ5dGVzIG9mIGVuY29kZXIgc3RydWN0
dXJlIHRvIHplcm8sDQo+ID4gdGhpcyBwcmV2ZW50cyBhbnkgdW5kZWZpbmVkIGJlaGF2aW9yIGR1
ZSB0byB1bmluaXRpYWxpemVkIHVzZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBJcnVpIFdh
bmcgPGlydWkud2FuZ0BtZWRpYXRlay5jb20+DQo+IA0KPiBUaGlzIGNvbW1pdCBuZWVkcyBhIEZp
eGVzIHRhZywgYXMgeW91J3JlIGZpeGluZyBzb21ldGhpbmcgaW1wb3J0YW50DQo+IGhlcmUuDQo+
IA0KPiBBbHNvLCBwbGVhc2UgY2xhcmlmeSB3aGF0IGlzIHRoaXMgdW5kZWZpbmVkIGJlaGF2aW9y
IHRoYXQgeW91J3ZlIHNlZW4NCj4gYW5kDQo+IHdoYXQgcHJvYmxlbSBhcmUgeW91IHRyeWluZyB0
byByZXNvbHZlIGJ5IHplcm9pbmcgYWxsIHRob3NlIG1lbQ0KPiBsb2NhdGlvbnMuDQpPSywgZml4
IGl0IGluIG5leHQgcGF0Y2guDQo+IA0KPiBUaGVyZSdzIGFsc28gbW9yZSBmZWVkYmFjaywgY2hl
Y2sgYmVsb3cuLi4NCj4gDQo+ID4gLS0tDQo+ID4gICAuLi4vbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvdmNvZGVjL2VuY29kZXIvbXRrX3Zjb2RlY19lbmMuYyAgfCA1DQo+ID4gKysrKysNCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+
ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL210a192
Y29kZWNfZW5jLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVj
L2VuY29kZXIvbXRrX3Zjb2RlY19lbmMuYw0KPiA+IGluZGV4IGEwMWRjMjVhNzY5OS4uZWNhYzFh
ZWM3MjE1IDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay92Y29kZWMvZW5jb2Rlci9tdGtfdmNvZGVjX2VuYy5jDQo+ID4gKysrDQo+ID4gYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL210a192Y29kZWNfZW5j
LmMNCj4gPiBAQCAtODg2LDYgKzg4Niw3IEBAIHN0YXRpYyBpbnQgdmIyb3BzX3ZlbmNfc3RhcnRf
c3RyZWFtaW5nKHN0cnVjdA0KPiA+IHZiMl9xdWV1ZSAqcSwgdW5zaWduZWQgaW50IGNvdW50KQ0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPiAgICAgICB9DQo+ID4gDQo+
ID4gKyAgICAgbWVtc2V0KCZwYXJhbSwgMCwgc2l6ZW9mKHBhcmFtKSk7DQo+IA0KPiBIYXZlIHlv
dSBjb25zaWRlcmVkIGRvaW5nLCBpbnN0ZWFkLi4uDQo+IA0KPiAgICAgICAgIHN0cnVjdCB2ZW5j
X2VuY19wYXJhbSBwYXJhbSA9IHsgMCB9OyA/DQpPSywgZml4IGl0IGluIG5leHQgcGF0Y2guDQo+
IA0KPiA+ICAgICAgIG10a192ZW5jX3NldF9wYXJhbShjdHgsICZwYXJhbSk7DQo+ID4gICAgICAg
cmV0ID0gdmVuY19pZl9zZXRfcGFyYW0oY3R4LCBWRU5DX1NFVF9QQVJBTV9FTkMsICZwYXJhbSk7
DQo+ID4gICAgICAgaWYgKHJldCkgew0KPiA+IEBAIC0xMDIxLDEyICsxMDIyLDE0IEBAIHN0YXRp
YyBpbnQgbXRrX3ZlbmNfZW5jb2RlX2hlYWRlcih2b2lkDQo+ID4gKnByaXYpDQo+ID4gICAgICAg
c3RydWN0IG10a192Y29kZWNfbWVtIGJzX2J1ZjsNCj4gPiAgICAgICBzdHJ1Y3QgdmVuY19kb25l
X3Jlc3VsdCBlbmNfcmVzdWx0Ow0KPiANCj4gICAgICAgICBzdHJ1Y3QgdmVuY19kb25lX3Jlc3Vs
dCBlbmNfcmVzdWx0ID0geyAwIH07DQo+IA0KPiA+IA0KPiA+ICsgICAgIG1lbXNldCgmZW5jX3Jl
c3VsdCwgMCwgc2l6ZW9mKGVuY19yZXN1bHQpKTsNCj4gPiAgICAgICBkc3RfYnVmID0gdjRsMl9t
Mm1fZHN0X2J1Zl9yZW1vdmUoY3R4LT5tMm1fY3R4KTsNCj4gPiAgICAgICBpZiAoIWRzdF9idWYp
IHsNCj4gPiAgICAgICAgICAgICAgIG10a192NGwyX3ZlbmNfZGJnKDEsIGN0eCwgIk5vIGRzdCBi
dWZmZXIiKTsNCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICAgICAgIH0N
Cj4gPiANCj4gPiArICAgICBtZW1zZXQoJmJzX2J1ZiwgMCwgc2l6ZW9mKGJzX2J1ZikpOw0KPiA+
ICAgICAgIGJzX2J1Zi52YSA9IHZiMl9wbGFuZV92YWRkcigmZHN0X2J1Zi0+dmIyX2J1ZiwgMCk7
DQo+ID4gICAgICAgYnNfYnVmLmRtYV9hZGRyID0gdmIyX2RtYV9jb250aWdfcGxhbmVfZG1hX2Fk
ZHIoJmRzdF9idWYtDQo+ID4gPnZiMl9idWYsIDApOw0KPiA+ICAgICAgIGJzX2J1Zi5zaXplID0g
KHNpemVfdClkc3RfYnVmLT52YjJfYnVmLnBsYW5lc1swXS5sZW5ndGg7DQo+ID4gQEAgLTExNDMs
NiArMTE0Niw3IEBAIHN0YXRpYyB2b2lkIG10a192ZW5jX3dvcmtlcihzdHJ1Y3QNCj4gPiB3b3Jr
X3N0cnVjdCAqd29yaykNCj4gPiAgICAgICBzdHJ1Y3QgdmVuY19kb25lX3Jlc3VsdCBlbmNfcmVz
dWx0Ow0KPiA+ICAgICAgIGludCByZXQsIGk7DQo+ID4gDQo+ID4gKyAgICAgbWVtc2V0KCZlbmNf
cmVzdWx0LCAwLCBzaXplb2YoZW5jX3Jlc3VsdCkpOw0KPiANCj4gWW91IHNob3VsZCBwcm9iYWJs
eSBtb3ZlIHRoaXMgdG8gYmVmb3JlIHRoZSBmaXJzdCB1c2FnZSwgaW5zdGVhZC4NCk9LLCBmaXgg
aXQgaW4gbmV4dCBwYXRjaC4NCj4gDQo+ID4gICAgICAgLyogY2hlY2sgZHN0X2J1ZiwgZHN0X2J1
ZiBtYXkgYmUgcmVtb3ZlZCBpbiBkZXZpY2VfcnVuDQo+ID4gICAgICAgICogdG8gc3RvcmVkIGVu
Y2RvZSBoZWFkZXIgc28gd2UgbmVlZCBjaGVjayBkc3RfYnVmIGFuZA0KPiA+ICAgICAgICAqIGNh
bGwgam9iX2ZpbmlzaCBoZXJlIHRvIHByZXZlbnQgcmVjdXJzaW9uDQo+ID4gQEAgLTExNzUsNiAr
MTE3OSw3IEBAIHN0YXRpYyB2b2lkIG10a192ZW5jX3dvcmtlcihzdHJ1Y3QNCj4gPiB3b3JrX3N0
cnVjdCAqd29yaykNCj4gPiAgICAgICAgICAgICAgIGZybV9idWYuZmJfYWRkcltpXS5zaXplID0N
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoc2l6ZV90KXNyY19idWYtDQo+ID4g
PnZiMl9idWYucGxhbmVzW2ldLmxlbmd0aDsNCj4gPiAgICAgICB9DQo+ID4gKyAgICAgbWVtc2V0
KCZic19idWYsIDAsIHNpemVvZihic19idWYpKTsNCj4gDQo+IGhlcmUgaXQncyBmaW5lIHRvIHVz
ZSBtZW1zZXQsIGFzIHRoZXJlIGFyZSBtdWx0aXBsZSB3YXlzIG91dCBiZWZvcmUNCj4gYWN0dWFs
bHkgdXNpbmcNCj4gYnNfYnVmLg0KV2Ugd2lsbCByZW1vdmUgdGhlIGJzX2J1ZiBtZW1zZXQsIGJl
Y2F1c2UgdGhlIGJzX2J1ZidzIHZhcmlhYmxlcyBhcmUNCnNldCh2YS9kbWFfYWRkL3NpemUpIGFm
dGVyIGRlZmluaXRpb24uDQoNClRoYW5rcyENCj4gDQo+IENoZWVycywNCj4gQW5nZWxvDQo+IA0K
PiA+ICAgICAgIGJzX2J1Zi52YSA9IHZiMl9wbGFuZV92YWRkcigmZHN0X2J1Zi0+dmIyX2J1Ziwg
MCk7DQo+ID4gICAgICAgYnNfYnVmLmRtYV9hZGRyID0gdmIyX2RtYV9jb250aWdfcGxhbmVfZG1h
X2FkZHIoJmRzdF9idWYtDQo+ID4gPnZiMl9idWYsIDApOw0KPiA+ICAgICAgIGJzX2J1Zi5zaXpl
ID0gKHNpemVfdClkc3RfYnVmLT52YjJfYnVmLnBsYW5lc1swXS5sZW5ndGg7DQo+IA0KPiANCg==

