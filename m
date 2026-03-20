Return-Path: <linux-media+bounces-56536-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAkwKaFWvWlr8gIAu9opvQ
	(envelope-from <linux-media+bounces-56536-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 15:16:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD192DBAFC
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 15:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F1C3300CFD5
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E153C13E8;
	Fri, 20 Mar 2026 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=psu.edu header.i=@psu.edu header.b="Z9VW3yNp"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA27199D8;
	Fri, 20 Mar 2026 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774016155; cv=fail; b=jwqB7O0yhav9AeRNDdUZ6tvzOWz8gDT5Sx4nbWqFnJUfo925fct3I4xCs7ZOHqTnWSX0gb5l4TQwYc6WQlINc7P6ZLmdSZxxAbMoqTAxeCnRe5E9QOiVY6c+itEYtPTSZeoeTMBTguvmgWGPs42/G5T2GO3Qb0qYSOCQE9udyk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774016155; c=relaxed/simple;
	bh=NK2l75DbL6OkHLFiMa5ykXFMj+yfFj663NKu3hMoEQs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GkNtQDIVLX7bgxWDsR9BePYcBMX4ZJR2w4HakqGwmoJFRGFFokc/V7VGy3R+yluOqD8JXu0NxexvuPriK8yefeA/wWNE3nbelVrmLlEMqgJ0MYXnpeIlCv/+z0vvsYDXH5oJOA5BBfTK4I9mhiZvuy7AW/8whfbEBlpfw9r9iyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=psu.edu; spf=pass smtp.mailfrom=psu.edu; dkim=pass (2048-bit key) header.d=psu.edu header.i=@psu.edu header.b=Z9VW3yNp; arc=fail smtp.client-ip=40.93.198.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=psu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=psu.edu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCfYRlgmsy/vtkDArBRk9EQYijsYNLa5ZSi1dqz3l0WanvDba4XPVKapO2RiGtz8jB7l2t2ivmNyUto9mWaD0oPc6TXmC0j33zZwYsATFVHoZqywzm3C2mf6A1ycAgLiNbnkSNzZ0xArn7ZmXUB8J0oyAwX1M6ezJIzsGSg8A+6qYBlWd4DoBbJFxw57c6Zwt9/FR/8hNo8DHk/+L50SFi5NbvldJktXKkCld+CSwfFw484iGcHFcD5AzTyc8J3DmuFo3x7PIxXteF8RQQKhcv7rnZrefn+49rKHshmEbMVFc94H25J2D8kpwm7a1mRP5EbbSLdOvi8jBwpdCZkY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NK2l75DbL6OkHLFiMa5ykXFMj+yfFj663NKu3hMoEQs=;
 b=JfcBJk8TptOxte7hsr9XEJBtw8b/OPPAsj4CdR59biAAMBq/wTxDO28KSJwi6+y8ajxV+rOGEwCrSXurk3KHgOHjafMEWiywdpKRv3PxXAh7TeSM/RbslIBaTIii/D9xiL4Ot5OmyN8GcnLgrCCj2vUWNOB4jc77+hrHyiWHsVW3Vgv+68YGpy+P2UGtBExJ9fl89XaENR7XM+55qoYHe5urRT2/PAhQm1MoCwED8c33Re/KtDZBnjdf7J2DvxKSomS3opaqvTLViGa3EC9AmbRoPtgE6WuzMllFy0lrNUx7qRO9aZF494vKB20arJ7JsRiyA68DtyBXemzxQKwAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=psu.edu; dmarc=pass action=none header.from=psu.edu; dkim=pass
 header.d=psu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=psu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NK2l75DbL6OkHLFiMa5ykXFMj+yfFj663NKu3hMoEQs=;
 b=Z9VW3yNpIpVRhSW2j/OIylOQV+Qj1eU/OXSU+sl6Ivo/3tGQz4tHXz3iBgRZx1JyGp38b6F64fcGdFWyVdJVI1m/+2p0p9XG2298iYQOvqz/7M2PVttH75yKC//zvoI9IGl/IcprrrUqu8DawBiwosXEYM2OoOFrSscTKzz6qxfJ2feCVEPdKRmsprS1SmzxmUcTEQCkR5ICZl8h2S81y08wSXGh2WuZiyj472MF7cqeeVcywV/B5YEpD959ITxAC/O7YvDYha12mCGJDtXUdJoOEtxxKZcYJmnHDOSaVMjcExCeEAtzic/+MYRy+che2vG7ahLjXqD0ce4XJK5jkw==
Received: from DM5PR02MB3307.namprd02.prod.outlook.com (2603:10b6:4:69::33) by
 LV4PR02MB11050.namprd02.prod.outlook.com (2603:10b6:408:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 20 Mar
 2026 14:15:51 +0000
Received: from DM5PR02MB3307.namprd02.prod.outlook.com
 ([fe80::3808:b33b:9e0b:3a8c]) by DM5PR02MB3307.namprd02.prod.outlook.com
 ([fe80::3808:b33b:9e0b:3a8c%4]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 14:15:50 +0000
From: "Choi, Yuho" <yqc5929@psu.edu>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: "hansg@kernel.org" <hansg@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "andy@kernel.org" <andy@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: atomisp: fix UAF and memory leak in gc2335
Thread-Topic: [PATCH] media: atomisp: fix UAF and memory leak in gc2335
Thread-Index: AQHct9bNswSDHtrbnUajoyygE8OBQrW3FHeAgABj6gA=
Date: Fri, 20 Mar 2026 14:15:50 +0000
Message-ID: <0F984F24-FE94-44CA-84E5-50CC6559FA6A@psu.edu>
References: <54321DD5-808B-441A-8F68-B812A3D72E5E@psu.edu>
 <ab0Cu8NnIt-m7pQc@ashevche-desk.local>
In-Reply-To: <ab0Cu8NnIt-m7pQc@ashevche-desk.local>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=psu.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR02MB3307:EE_|LV4PR02MB11050:EE_
x-ms-office365-filtering-correlation-id: 1141b44e-4b88-4e2b-b953-08de868b306b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|786006|1800799024|38070700021|7053199007|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 XQnOzG+l/2E3PhbdpGjUd8w4WtrCbmnyjkoTVs/BPodyDjSGhlkskW7ZfV5LYfsjun/d18w+uigYD2SkGlCMlXtcXrAZkNmhaHs8rvPKqlko2LuH4xLSnpm81u+8M7mvq5oafEygI6tcIQvz1CpEUTdnV+DqLnd9eB7PdbYJkcpc+b7kiVixFlvyTjlW83yXm87t5lftK+ikgsXfmXQ3rksSqDZNRMNaQXr+ygdn/4XeemJNL2O4m92TFcuQ0OPRVOxgT9jL2dTvAxf2ObTbkHqRnvBwoJbUEeIiaN9jYRtJDqD9/WeWI4phtSdWkWZbuKXtkZI8uBcwjbKJF+sy3v5RgF81Jsx1TiFZcduKhmFDEIv0uxaypJHsL1nRiydhsSETkOMk8X2LktGdlpW1UzzxGF2LihQEPv6n+KbABBXywMt0Y74NwjHt89ZsxY2HfJxWMQsjpuqGK3Ky/mbIo+sN0z9tWn7fgMQEXvJkvUbFcZSqXLMPSkYvtm+m2R33OH51CNvpgXh1Zxcvdk97bz08o0sxv5/WapoeblubnFPehf9heoZ7EMYFxu334iyb2Xf8c0Nfmg70cB6R6wAmqg9QcWcNSQ+wSsW+9K6Ox5Xq/UeGTFOmod21mMbmI3mDQMuqHIgo0nJBj20t0SQaLbQozE+JGbq0KP+BAbl2QTS2S4036EnoYUibJszceem1nIhvtDzCvCV+A02lha2UBM4aM2AMvjQ8mYCI+cgjQjV7z5fbBoDP04myjcyaL91hpojo3Yx6Z4hBpVPYIyHiffaXIY66Wu0w+NxIas+ouS8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR02MB3307.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(786006)(1800799024)(38070700021)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0RMK0NOTkQ2dnlVSnJJd09xeER5UE1ma3dBUE5zRTZyY2QyK1VaSDJUU0RW?=
 =?utf-8?B?MVNTUWlTb3dQQjBpSVdCcVprUUQzYTVHQ0RMN2J4YnJUQnlGZys4ZjhDVjA1?=
 =?utf-8?B?NVZSUjBna25Nai9BL1NuV0gyUjBpb0JWZjhwdjFvZ3dtZ2NRYW5tSk56a0JU?=
 =?utf-8?B?dGk5UUJJbGd4YkRTSk4xKzM1VFkzNkFrdUNZb2x3cit2NkRCWU84Um1yd0Z5?=
 =?utf-8?B?bkJCYkZlUVhDSml1M0ZRNDRvQks5cXBUYzRLTFVmZWYrWHl4ODJxaGh3YUFM?=
 =?utf-8?B?R2F4SHp1akdsMWNVZ0RqL2JVOFlUR095b1NlQ1pOYStKa0FuQzRtUWxnUzNY?=
 =?utf-8?B?VERoWVN3Z2pvNncvYlgxWm05ZDdNWVNyd0lXVy9BS1RnYWNTb2lHcmxja2ZM?=
 =?utf-8?B?eXhYSTlkNk5kZ0YrUjJvU3RLZWd2U2dxeHFTTVAvb3padTlPbHpqcHFodnBW?=
 =?utf-8?B?ZGV0MVNsdExwc08yQXQzSE5zRXdxUFVOQ05PWG5iRHFueXhIc2ZHemhuVWN1?=
 =?utf-8?B?T0xaUnBoajZtOWZTcVhIenVPYk5EaDYrbjFScUVMWmlkYXZPMTRCYTJkZk5j?=
 =?utf-8?B?WHBWajQvQjA3dDVhdFZ0Y0xGSVpkTHZFQ1ZjNVhxYjMyMkFKa1NXTTZzQkQ4?=
 =?utf-8?B?eDZBYk5tSTNURzRlVU95Y0VBYTNkSkhoU2F1bFlyKzRDMGcwcE1vVkhPWlBy?=
 =?utf-8?B?aGs4RDNNTDUxeThhMFRzN0JROWptMmRQNHdpajgvbGh2dUNvSksyaFAveDdX?=
 =?utf-8?B?UENnUXd0VFJ2cDNiWEFpdzJ4RFNqQUwrWEVTNFFTZE5OMEpsdFAwUXplc0Iy?=
 =?utf-8?B?ZFp4ajNsM1VBZlZYUXlPZjdLb2Y1WTFlSnFnU08zZ2pzTXJaSk9mMVZuQTRB?=
 =?utf-8?B?YmFtMHFIWjE2R3d3am11YnFGaElxSjlCYk9NdzdMMmxRUXA0MmV1dHJBY3pF?=
 =?utf-8?B?bFl0SWpQdVBIMWpmOG5PVVVEcVBRRHF5dzdvYWs2OVhNZUJuQkRUMHE3VktW?=
 =?utf-8?B?cnlnTHJJWVo4dFBxMGNxUzV2eTlYQ0Z2QTNCb1FGZTNMVXR0cVdzdU42T2hy?=
 =?utf-8?B?SUtwcGVsejllUHdXMGVMUi9QemZiTjljUzZEVjROVWRlbmxUWjFyMlFtaXVy?=
 =?utf-8?B?SWU3RXd2TXRjYm0xSVdBcVFjdzJnMFpoSElqcFFRTldDTSthN0dENHZuVXhz?=
 =?utf-8?B?UWp6blNwcnhweVNCekVIazJ2RzM2amlVNlZDQ0Z2bS9SbFlhYzZoNkthUkJZ?=
 =?utf-8?B?ZGV5RUVkd1c3Wm9iSk1DOURWbVEvbys0dzVHYWZheUNpYVVKMzV3QmVvVGtC?=
 =?utf-8?B?Yk01dEtsZG8vVy9TbEY0WmQwZ25YSTFzMGtBb1lqcjdlQkYzTG9tN044VitB?=
 =?utf-8?B?YmRucm5vNTI1T0dpU3hsOWt4Nld6WWJCcytXWkVZOUxFZEpEOEVEZ2M4Y2Fn?=
 =?utf-8?B?SHg1Q2xQUXJHeGx3cTFsK1dkWnZLcG1PSWZ6MmZxRlJvYU9aNTdUV1JSa3gr?=
 =?utf-8?B?NGRtRWNqeXI0S24yUWRCS1BwQnhXMVJwZG95NUpWSTNZVWZMdzN5S3QvYUhu?=
 =?utf-8?B?dUtnZXE4ZzlSbjZlUU9GdG9BVTdKQ1lhQWpVMStWbUpJS2ZuZGFiL1hjZ0tH?=
 =?utf-8?B?VUtXNllwZ084SGNHV2ZUOURsYW50dzNiYmw0aXYweUNjREJuTWttQktlNHdL?=
 =?utf-8?B?LzkyV3FZVy9yRWRjd0lEbVBVbFZKZ29wR0tvc2hZZFFvZEZYeVl0MkptYm9t?=
 =?utf-8?B?eS91MC8yeXhHa21uZzZaam5ZWWFqWG1QOWowb0pWV2o0WXJXVXZJcWc3eWh2?=
 =?utf-8?B?UnNnUFVzUENZYjF2TzR2SzkrRGZMMDZ3S0pURTNwb2dXTlRNOVhzZmI4djAx?=
 =?utf-8?B?UytrMWlienYvTkV4eC9PcUtKYWZRVm9kNW8xY2UrSjZuK08xTHJmbk5ET2xZ?=
 =?utf-8?B?cm9lWmxVZThqUmhyUXpPNVJWcjBRcythNnNSV3ZCYTBSZWZ5TTlBOVlnQitm?=
 =?utf-8?B?OXEvL0pzL0dxQUNkSk82VWdobUJlNjdBSGZpWWdGUzZmbTlMYUVwL2NZS2M0?=
 =?utf-8?B?YjJucTVVK2ZSaXozanJtQU9rdXVBaFlVdWo5K1hPdlA4SGdSelhFbFpMRkxw?=
 =?utf-8?B?cmVWeFZBTXBxRk8ySmZvYzY5aU1vYjVhUEc2YXRYU0EvQnpzK2M2dDM3RmZh?=
 =?utf-8?B?VVJmRnhnaS9qbkJQUTc0OEVXTUlPK2lZc1QvOUd3eDE3ZjdDZHA0T2luaGNG?=
 =?utf-8?B?SCs2di9UNWx5ZkJJdTEzN2JxTVpzb1g3NFo0bDJFTWdGdTZzMjAvTDJSaUxl?=
 =?utf-8?B?RmtvTkJqNmdlaUppQzJSeDlLd1lQMFh2MXJEdk1FTXRlMm5TQ1FGZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <436726D2A7122C48908019F8EC9914AF@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: psu.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB3307.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1141b44e-4b88-4e2b-b953-08de868b306b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 14:15:50.3891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7cf48d45-3ddb-4389-a9c1-c115526eb52e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i7Vbjt5O5qmGdpByLshNHd5rs56EK5X1eIgWyQnNbIK5pVV6s3jGusYPFvYXvsYO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR02MB11050
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[psu.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[psu.edu:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56536-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[psu.edu:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yqc5929@psu.edu,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aka.ms:url,psu.edu:dkim,psu.edu:email,psu.edu:mid]
X-Rspamd-Queue-Id: 1FD192DBAFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhhbmsgeW91IGZvciAgdGhlIGRldGFpbGVkIGZlZWRiYWNrIGFuZCBJIGFwb2xvZ2l6ZSBvZiB0
aGUgbWFuZ2xlZCBwYXRjaC4gSXQgYXBwZWFycyBteSBtYWlsIGNsaWVudCBjb25maWd1cmF0aW9u
IGludGVyZmVyZWQgd2l0aCB0aGUgZm9ybWF0dGluZy4gDQpBbHNvLCBJIHdpbGwgcmV2aWV3IHN1
Ym1pdHRpbmcgcGF0Y2hlcyBkb2N1bWVudCBhbmQgcmVzZW5kIHRoZSBwYXRjaC4NCg0KQmVzdCBy
ZWdhcmQsDQpZdWhvIENob2kNCg0KPiBPbiBNYXIgMjAsIDIwMjYsIGF0IDQ6MTjigK9BTSwgQW5k
eSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+IHdyb3RlOg0KPiANCj4g
W2FuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbSA/PyA/Pz8gPz8gPz8gPz8/ID8/Pz8uIGh0dHBz
Oi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdPz8gPz8/ID8/ID8/Pz8N
Cj4gDQo+IE9uIFRodSwgTWFyIDE5LCAyMDI2IGF0IDA3OjMwOjEwUE0gKzAwMDAsIENob2ksIFl1
aG8gd3JvdGU6DQo+PiBGcm9tOiBZdWhvIENob2kgPHlxYzU5MjlAcHN1LmVkdT4NCj4+IERhdGU6
IFdlZCwgMTggTWFyIDIwMjYgMTc6MDg6NTcgLTA0MDANCj4+IFN1YmplY3Q6IFtQQVRDSF0gbWVk
aWE6IGF0b21pc3A6IGdjMjMzNTogZml4IFVBRiBhbmQgbWVtb3J5IGxlYWsNCj4gDQo+IE1ha2Ug
c3VyZSB5b3UgdW5kZXJzdGFuZCB0aGUgdG9vbHMgYW5kIGhvdyBwcm9wZXJseSB0byBzZW5kIHBh
dGNoZXMNCj4gDQo+IEFsc28gbm90ZSwgeW91ciBwYXRjaCBpcyBtYW5nbGVkIGFuZCBtYXkgbm90
IGJlIGFwcGxpZWQuDQo+IA0KPj4gVGhpcyBjb21taXQgYWRkcmVzc2VzIHR3byBwb3RlbnRpYWwg
cmVzb3VyY2UgbWFuYWdlbWVudCB2dWxuZXJhYmlsaXRpZXMNCj4gDQo+IFBsZWFzZSwgdGFrZSB5
b3VyIHRpbWUgdG8gc3R1ZHkgU3VibWl0dGluZyBQYXRjaGVzIGRvY3VtZW50YXRpb24sDQo+IGlu
IHBhcnRpY3VsYXIgb24gaG93IHRvIHVzZSBpbXBlcmF0aXZlIG1vZGUuDQo+IA0KPj4gd2l0aGlu
IHRoZSBnYzIyMzVfcHJvYmUgZnVuY3Rpb24ncyBlcnJvciBoYW5kbGluZyBwYXRocy4NCj4gDQo+
IEFzIGJlbG93IHJlZmVyIHRvIHRoZSBmdW5jdGlvbiBhcyBmdW5jKCk6DQo+IA0KPiBnYzIyMzVf
cHJvYmUoKQ0KPiANCj4+IDEuICBVQUY6IElmIG1lZGlhX2VudGl0eV9wYWRzX2luaXQgZmFpbHMs
IHRoZSBkcml2ZXINCj4+ICAgIGludm9rZXMgZ2MyMjM1X3JlbW92ZSgpLCB3aGljaCBmcmVlcyB0
aGUgJ2Rldicgb2JqZWN0Lg0KPj4gICAgVGhlIGV4ZWN1dGlvbiBmbG93IHRoZW4gaW5hZHZlcnRl
bnRseSBmYWlscyB0aHJvdWdoIHRvDQo+PiAgICBhdG9taXNfcmVnaXN0ZXJfaTJjX21vZHVsZSgp
LCBkZXJlZmVyZW5jaW5nIHRoZSBmcmVlZCAnZGV2JyBwb2ludGVyLg0KPj4gMi4gIE1lbW9yeSBM
ZWFrOiBJZiBhdG9taXNwX3JlZ2lzdGVyX2kyY19tb2R1bGUoKSBmYWlscywgdGhlIGZ1bmN0aW9u
DQo+PiAgICByZXR1cm5zIHRoZSBlcnJvciBjb2RlIGltbWVkaWF0ZWx5IHdpdGhvdXQgZXhlY3V0
aW5nIGFueSB0ZWFyZG93bg0KPj4gICAgcm91dGluZXMuIFRoaXMgbGVhdnMgdGhlICdkZXYnIHN0
cnVjdHVyZSwgdjRsMiBjb250cm9sIGhhbmRsZXIsDQo+PiAgICBhbmQgbWVkaWEgZW50aXR5IHBl
cm1hbmVudGx5IG9ycGhhbmVkLg0KPj4gDQo+PiBUaGlzIGZpeCBmb2xsb3dzIGEgc3RhbmRhcmQg
Z290by1iYXNlZCB0ZWFkb3duIHJvdXRpbmVzIHRvIGVuc3VyZSBhbGwNCj4+IGFsbG9jYXRlZCBy
ZXNvdXJjZXMgYXJlIGZyZWVkIGluIHJldmVyc2Ugb3JkZXIuDQo+IA0KPiAtLQ0KPiBXaXRoIEJl
c3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo+IA0KPiANCg0K

