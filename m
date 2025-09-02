Return-Path: <linux-media+bounces-41538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0429B3FA05
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41D831A86950
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4908E1FC7C5;
	Tue,  2 Sep 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qFce7uAX"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8922127A;
	Tue,  2 Sep 2025 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804623; cv=fail; b=BFtSuR9rwjxmKeIVwKWmUrGBrBpckX+eB/pMJrm3/QbOoNWmqckcbekC1aAigypDYUDg0DcQdR+czlW7dG3JPhzH463sS79qwDQUQBsWUi+C7hGmyi0lM80wFuTPjZE1IohR0dhvFsh5oNBCTN9OfehT4ggrLx/A9JBG++Fj2D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804623; c=relaxed/simple;
	bh=D2DnR4fHwQKByhkyW20bz4VH/hwvMYtr522u+iAndug=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A/SKiciOy5VEStMfpafOar6wTTae8Cco/6ch+Ev5qAt+zkBBBdnWB1pgQ9snEf2dfCqXJiwuOpz3vWxKpekI2h8TunNbwf8ODcXG5jHpnCqYywKbuG6xDH+/DstV2lJm4NUutNyyUKhi7iQoOG+ED0zwRw1BJletTRo19QoVPds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qFce7uAX; arc=fail smtp.client-ip=40.107.94.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoA7/7/U+IdGpIkNamx+mGVmA5EiJnriRbg2c6osoprvsJrLWOV1r38GEQrOmS30JpUAdNi5emjF2S1luk4AbdH9E24J/qmhY0IP2BEt+zj2tAj27fVTbYxwNBF2GT4f8uEaGCo/qY7OpcXHzg5UX74FC8amYlNZB07uErW0qvMYpBx0cTd5+Hv8otzJltSllHiHnMCIV4oB+2xXqhoJTMsRTmMc+hOUQ4pLlYYrswHZyxGGtnar6PRhFI4J6+F8k9ZimQIW/8PpYKaoFCnhsi41Y8H0C3iYA4BSVZMT/bYhxaHUEdPpAlo8ERCFZLiijOMTc1U86TeuOunAs/TJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L294rW/r2/6HvBys/USI3y2TPSynssHYmCihKMAvneI=;
 b=HFfnueeMVN1YQkl4XSl0R9DSqsaMhI3ss8SrMqeH2F3baOEpRBYRSCHOJmKnpiwDIUFE9WZhDb8YlKNNltlCxjdx4YA/o2bVGLmsiZLJ7Iu2FwbUmL9XYrVLKgDg6BUE+M/iYHaErYBUBiCeKZvePGFm6b2DE1dz8lhmcl856cAKQR0mNwMk6LiaE7SLfmgxy8PuB7rKsPpbB0xhz07SvYttUaBDlDJRUDsGYP/Gh2uh15uh79APYZ3ts+68LXf3P5U2ZzGQOv411v6AoAklsX21Q4eCMF3AzIbTcVhYIIYuq2AMrafak7OZlBUTLCgp/g22CkpTDsHspRCgpODhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L294rW/r2/6HvBys/USI3y2TPSynssHYmCihKMAvneI=;
 b=qFce7uAXGXeJeukluzcEoRHIOmlwGM34CuE7ec2ogxzulUlMDCHq8MVAQTt1ZHtlSinBRPqgp/2iL4zDC+Lev7juZROllCFI+PA2r+xMVaWiwc0V4cTAz0zB5Tz/orKCb1tJb2uEEU8Tmw5gkh1WglFTFrFrAz0nAxO/MBTcn3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 09:16:58 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 09:16:57 +0000
Message-ID: <12c9f91e-1fb2-448e-89f6-bd8caadfd2d4@amd.com>
Date: Tue, 2 Sep 2025 17:16:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] media: platform: amd: isp4 video node and buffers
 handling added
To: Markus Elfring <Markus.Elfring@web.de>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Anson Tsao <anson.tsao@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dominic Antony <Dominic.Antony@amd.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@amd.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, King Li <king.li@amd.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Phil Jawich
 <Phil.Jawich@amd.com>, Pratap Nirujogi <Pratap.Nirujogi@amd.com>,
 Richard Gong <richard.gong@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>
References: <20250828100811.95722-5-Bin.Du@amd.com>
 <95624b51-d8c8-44c7-b1cb-6bfcea1768ef@web.de>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <95624b51-d8c8-44c7-b1cb-6bfcea1768ef@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0116.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::8) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|CY5PR12MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af5e0c1-cf3c-400f-7069-08ddea01775f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vm9VV3BWT2NwOUw2U2xtRlVOeGtXa0JtVjhBVzNJNDhVMXJaWGJJZ3ZyM25h?=
 =?utf-8?B?elBpelNUcFFVNnhUdWVuamFMT3RxSitabkJJSW9zekM3M1YyaVc5NU5mWm9z?=
 =?utf-8?B?aERXZzdzc2VVSExmTlRwY1hDT2ZTWDg5cGxrcytEUlJzUGZDN0FxYU9BcTJU?=
 =?utf-8?B?RmpRUUh6WmlaSE5ZZ2hidmJWRkNMVzdLZjUxNDhZKzB0NUhIcEJZSUwySzJm?=
 =?utf-8?B?TEwreFhadlA5SHBneUNCYjA1cGtQV1dsV1FhWDlrdFpndlN2TnMyZUYxM0pw?=
 =?utf-8?B?U3Q4NGIrcnNpRXk5emptRTFUUHBZbmhGZWhjZGp1cDd1elV0MitVL0Z2Y2k0?=
 =?utf-8?B?akNSUTRxWlRVSEVLRFFBVEd4WEFsTGRQV29aeUl0dEY0c0paei9QQk1vbzVU?=
 =?utf-8?B?TGRsNlJMY1B6YXJPRng2Z3dKSndmTVRsQkVEam1ZRkVnUDNUcS92WmVCcEl4?=
 =?utf-8?B?cm5Gd1pKbGx4OHJReWlvNktBV1RFS2xWcllXM2pSU3BKelp3ZXVrVEtmQldz?=
 =?utf-8?B?WE5PWVNMWjhQUEV6ZllNalpnRWlsdVhWMm1DR3g5M29YNVVRUXBZaDRTY21k?=
 =?utf-8?B?Q2pRVW5XRDZWc1BRY2pKdUNMVlN6N2JkODJRRVBBaXlVL3JhVzFCVlA1U0Nu?=
 =?utf-8?B?TGZtSEx1SnhSNnZSdkV6a1RsaW1WclpQS2IrVnU0a1BoQStFYWE1SkpnKzBo?=
 =?utf-8?B?SWxSTHN4bURuWitCdFNqT2lCemZaUENQQWlhT2ZkSy9VSURXS2RPVjI3YW1W?=
 =?utf-8?B?VWtCa0JzaGE4ejFLckJYSS9kYnZHcHNiWXFXc2JMOGR2L3FsekVLWHNrUkxX?=
 =?utf-8?B?anVId0JpT1NFcEpnK282OUN6K0tldG5YQkM4VEUyUG9SazdtOSt2TzFpdFhx?=
 =?utf-8?B?UzlGRE1nTkJKRktaN1JUcE01WWlIZ0pXZ1hpM3U4a3EvYWFod2dpUTdkNEdq?=
 =?utf-8?B?eGxOem91amN1S21qUWpTQmVjQ2JYM3FuUTRuaUFPMFRJS2c4Nk9ianpiQ3lB?=
 =?utf-8?B?WThUWlRNa0txU3paM3N3S0VuOVlOTkdWU1ZKRGZQSjcvaXJNOTZDMEJHYU1P?=
 =?utf-8?B?L0Q4akZIaHdCU1NYa05yKzBTUFAwRHpseGtQVmNxZ3BwSmlkMEdOeTZVSlZM?=
 =?utf-8?B?QjJHQTV3VU5TaHNvYVJNMWl5Q3F3dGoyZVlzZUpHaXRnWUhzaXl2SUw4NEl2?=
 =?utf-8?B?YWVldWs1UFA4WDYwdi9ydm95RXRGMzgwTTVybE1rVW9pQzJlc0FZcktpQUtr?=
 =?utf-8?B?QURPVEs4YzJiTnNXMTRXRG9UYUtYQnFQcG0zKzBRUnJ3UUlVR1A0MlFHY1k1?=
 =?utf-8?B?NU5Qb3g4STdlSUVocWU1MnpmdGJZN2dGR1VibUdpUUhLREVTd3ZVOFNRdWR1?=
 =?utf-8?B?MlBpSXkrSjdzVmlFY3NwZWpnRXFVbFBXYTJQbTQ3REFKT0pzNklrUUIvOGQx?=
 =?utf-8?B?VjdVS2lVcG1mYWN1UEo1OHl3cjVyMGFMMUcwZUZUeTJhNnVzQisyZzNnV1Qy?=
 =?utf-8?B?ajlNVnVzNGM2emNOR2ZXSEQ2M0ZhbWhDQVd6b3k0eDdqKzRDL21QSGE3cjU4?=
 =?utf-8?B?YmZyTVNoNDFLMExyeTNNR285NDF4c3UwRkRwZTl4emYzMFlKNlI3NllFdUti?=
 =?utf-8?B?VDhzUWNRWGVuUmNNVGV6YkgvTTVoc0IvTkhBOW5oU05LNDd0eEhSZnNmKytU?=
 =?utf-8?B?RXNKVzJPZWsvUmZ2QnRFeHpYTEhBQ05kaVpGMUNBZ1dNVUZUSWQvSlc3ZG42?=
 =?utf-8?B?cEFYNXA4WEh3K0h4OU5nOFZTSFVxVmRMMU5MVjhsRnNmME1sWS9qdGEwakR6?=
 =?utf-8?B?OEl4OGJGVVJ5RmJERzl2bjE2ZlJFK0pMalp0dkJWZGltRnpOdjZ0RHd2Q21E?=
 =?utf-8?B?SkdId3NLWkJ0UkU2dDUyK3BUTUpVY2ZVWkMyVDBmOUgvU29LQWM4L1pGdDFu?=
 =?utf-8?Q?js5Eb2T/nas=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bThpK3BBeU1hWGJnK3BLL250NnJ0blNPYW5wNm4yMmgrSE45UmNrd0VKUkQw?=
 =?utf-8?B?RGdIUnRXOXpKbWtuUjVPUEVpMExVT3VKeW9QYmRmSjkzdW1neERpZmgxd0U1?=
 =?utf-8?B?MnBqOUhLeTlFdzFVblR0STNtNzhvNTFaYW5xQ0FYSEtNYmIrQ1R3S21oQ21x?=
 =?utf-8?B?dm55VTBmdnVrTk5raEIvL0l6dDF2dXFBdk5lMVg3d0JGNUluK0lSUEFzRUZD?=
 =?utf-8?B?ZXFDUU82enlEcDNETUpzSVFwV0Y0aUdCZEZTekpwVU5OeWV3QXQrTDhjcU1o?=
 =?utf-8?B?K3JmQjdNQW9iVzVLTUlkdWIrSmZMbjlHT0lJdWhNWFA4UnZYMENrZjMxdVpq?=
 =?utf-8?B?RW9LSThwM0JUM1FsM1pvSmpMZDdHQU8yNXoxbEs5UnJvTnltdkRJM2JaZ3Nt?=
 =?utf-8?B?SUc2aTZCbUZTQ0lkOGdDOTdtRUV0Wmc2T0hBU1dwckxKVUlTdlJSdW1SdEtJ?=
 =?utf-8?B?bmlocVNXYmJtSUthS2JlNmZLMmpZcGppMlJlYlBFUEpZdWYvZDlNYWVUR0ty?=
 =?utf-8?B?ZDE3SytXRlJNTnpwZEJtM0FmSWhJTnp6MlMrckRyY01VUTg0T0Y2MDAzT3hR?=
 =?utf-8?B?UGg4VHNNUXFYK3VlelV1VlhKOWhic2dvLyt0UlgrTm9yUGw0ckpiSUpyM0RH?=
 =?utf-8?B?Z1dheG5qd0ZFVWNMZ0VzQ3lNRnJUcE84TVhpdTl2WXlicG1vVktrUnJvZ0hm?=
 =?utf-8?B?MDlheFpic3YralR1L3NvU0RuZ1I1NjVZNEJkSzIyeEhYOThmTE1IS3gwZlVy?=
 =?utf-8?B?MndpNDN5UVR0TGVKZDdtNHY2ZjVIb2dreFlPdEdScEIxT01YY01halNSNnB0?=
 =?utf-8?B?b09jY05RNHZVTUdMWHdkMVdRaUY1L0lOM1ZDMndnS2czWGVGYmpzY0JBNVJm?=
 =?utf-8?B?K0RoY3FSc3hJUWlqTHNKcmxpTDd0YWJsSjcxVVFtRllYdzdZMHdYTGRmQzA0?=
 =?utf-8?B?LzlSWFdENElYQlJrTWNnY3lQMlJqTW9naWpJdW10Uk1lM0hIc0tKOUdBaGhv?=
 =?utf-8?B?L0F5ZjJzVXdwUWo4UEpIeG9Gcm8xbk1XK0w0ck8vbFJKSzNWZnZ3b0JJY2NM?=
 =?utf-8?B?cWlYVDRjenhKaDVZQUhPY2hPTFRiYmxXSy9ES3NEQlhIYVFnU3BOWlR2Vm93?=
 =?utf-8?B?SHFyRkxwcTJscEhwSXptdUdPcEFBMDF6cVlpbWl0N1I2bnRFNlIxeTFnZUVW?=
 =?utf-8?B?cXgvc2xyenF3LzA2bVcyNTdvdnJmU0xYYkFJUnpEVFlWMlhzSDliYTdwYmhr?=
 =?utf-8?B?TFBid3U5Um8xZnh1RFByL2hFajVZN1d1MXRjNUhNbHJ2dFF1NzFqeCtiZFla?=
 =?utf-8?B?RndrYk1SV3JGeW5lTWxmMU5RSEhlTjRsdUV3S1NoamNQd1AwQ3NtK0FCalpM?=
 =?utf-8?B?Ykl3Z3VWZC9QQmNRa2FMdC94SFZQWFg2U0VWYkZuYmw1Qks4WElyV3lVNFVZ?=
 =?utf-8?B?cVFWbjA4d2RDQzdnRnRzeXk4NjhpYkJ3Rk5PRXFyZ3pRZitUMkhDcHRmclRy?=
 =?utf-8?B?NUFDRnFMZDNIUjVhTWhRUjc3NVdiK0pFdlJYdkdXb2NPc05CTTZjTWV0VWsy?=
 =?utf-8?B?YWNLMlFybWM1am1wd081L3pGTm9mOVBMNVBPZTlJV052NlVrczVCNEpSU0xa?=
 =?utf-8?B?K0NPY2xwS1FnY3dWa1VTOGZ0NHBINzZVdXQ3cmNkUUNZL2k4dkdORHJldTlR?=
 =?utf-8?B?NVR3RmFSQlh2b1NZRGJQOUhWK3BSRm83RHlOdWoya1lSdHZGSU8zajFmVFJ2?=
 =?utf-8?B?Qk4wc1RxL0N3MVVSTzBsUmQ5WTVxVkRzaVgxNk85czR2MmNEaGNHM3Q2bVo0?=
 =?utf-8?B?OGI2a2JLR0xqdnJ3M0M5NENQTHdrbkQvWU0waVFHUjFtakJLVmpGVUdieW1x?=
 =?utf-8?B?US94emtnaWRjMU5rUTJTR2I2RGdzOXRSc05UZmVyN1pkN0hjaTFxcVNiMm83?=
 =?utf-8?B?ZTM1a2hDT2h1a21zdG9WSHVxRFdNVEFhR2FUM1lSdk9vYThlN2Mwb3RhcUZ4?=
 =?utf-8?B?Rkw2MWNFYjZPQWNPUTh5eXk4VVJGOTlpUy9lTXlXT0U1SVVTbE8zWEJEL09y?=
 =?utf-8?B?UnZTOE1nNGJnRGoxbUphbmpDVm1OVmIzWGlhZUl5bGM2KzdpR2syOEZXelJx?=
 =?utf-8?Q?2ktQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af5e0c1-cf3c-400f-7069-08ddea01775f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 09:16:57.7552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/dI9KgyLAIzLlUOnHiDQJ6+fuy3GQdEPbLCPGjKCovVibuqXEU3I1JYrOyg28f7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6429

Thanks, Markus Elfring

On 9/2/2025 4:10 PM, Markus Elfring wrote:
> …
>> buffer realated fix from branch v6.16-drm-tip-isp4-for-amd on
> …
>           related?
> 
> Regards,
> Markus
> 

Yes, it's a typo, will fix.

-- 
Regards,
Bin


