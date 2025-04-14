Return-Path: <linux-media+bounces-30088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A59A87553
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 03:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7FC43B155A
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 01:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9CB18BC3B;
	Mon, 14 Apr 2025 01:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="j9ozNVf5"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021084.outbound.protection.outlook.com [40.107.42.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4CB54670;
	Mon, 14 Apr 2025 01:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744595064; cv=fail; b=qRDtVJdzElkNJb0IZbec/OWnAizmMaOrWxceSOz+FkdiqGR2zhEnw4f7pVPmDbuKGCY+b+g6vqOiW5dYCFepNMlBpT+45OQuOsu/pvCNnvY5+k8CyNQls+MO/ZGzvtdGIEu0CrHzRPCFHgI7KweovArv9y07ef1mUvIsUM1wIic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744595064; c=relaxed/simple;
	bh=ecTQeKC+Lkj03+mWIwpGEYw6UWY6omJjN8To5msXOeI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rayev6bMSwkSfg8cBoEO511xCQP8hb94svAm4h/qZRw46cV985mZZDG8N3l+hNUoMtTvh6ihIVP0b7LJlfJNwK5324jCh5JWIuhVaQe3wvKxav1375Qxx4kK5h9gROb5WoHVRPES0EDU+cWSFK5lGfgNuCNVGUKPeDPSIq7LfPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=j9ozNVf5; arc=fail smtp.client-ip=40.107.42.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZPamI+naDiRsqlQIzVMFRJr+dUCP5Pi3NdEJi+5IdxAtoyo4z4B3e7dn0afpyvl5YSD3LW26ds6NtpMCFsQ/GmASPtQbUlhJqEyHhQA+zH1LtZjkxoo5Owv6Jdsneg8cK9gBEMgafHM/7mzYgSq/5qX7eHdoeJmjdFdxmXsI8c1Fnyl2slw/3qOarQLCHKRlQPdVoEJAThzCfhvlB3T9wNeGmypd81u/lSUWeyfQH8tFKWTmz3AfdpXLTi5CYjmS9kHjkd5tuFDwV/8oxLudHdLLmJu2FcBAJeIYrmUCfJnMX9gSa2P/QVJ3TVkVy2iG1nFfwa2vR+px5n1YlYqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecTQeKC+Lkj03+mWIwpGEYw6UWY6omJjN8To5msXOeI=;
 b=y/fOM2KGiSGK7DBVFAGuv/MxspyH0xTD4x9E86iiUX5WFGSHD/yAzvgqgJfNjL+vZ8o3VP0i+ZP4nNgGZiVdQj8bEw2umNxsM5gXdpaJqrZkrTgwV0zAUGB4P1NytZqwnWQS7lXK8qqbDlFnfHRbAsGt74f22DVVHR3hG6lK2z496EKhyB9EiFAgtovf7BVg5jlk/5jZrwQ6ckYEyP56nYqgclh+wu4ucSnLYeuYNxDlB7Dkld5gk9G/2Xr6UexVW0FLne+BPSJxeCTrTGn4g7o2adFCBSAhiMttflpVjxFdpRP/DeR+BxlE555ZOyKK17AC5l6OYjCtoDgwDNq7MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecTQeKC+Lkj03+mWIwpGEYw6UWY6omJjN8To5msXOeI=;
 b=j9ozNVf5u+05xUPKEPthdyJxXfWBJ4ThXat/iRyw/wFmudSv4kKrNF8hxnh8UIHw64NQ1skm0xzmMd/yuiShU2gm5nCM+XRsEQbDYc34rXxosvEXTWyJXITXc99HnGI3TEJD/3WJfYlxtXuN7jK3cco16Nn5JTsIsPJMEbL8ywc=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB1440.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cf::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Mon, 14 Apr 2025 01:44:17 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 01:44:17 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>,
	"dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [RESEND PATCH v1 0/7] Performance improvement of decoder
Thread-Topic: [RESEND PATCH v1 0/7] Performance improvement of decoder
Thread-Index: AQHbqcpCFfWvMwZkREeF+06Z+PoGIbOc15QAgADKI0CAAPzGgIADyy+w
Date: Mon, 14 Apr 2025 01:44:17 +0000
Message-ID:
 <SE1P216MB1303C9525071FB8A609D7A65EDB32@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
	 <cb2266a3ff0cf9d57bdfdf3e88dc82c211d18e83.camel@collabora.com>
	 <SE1P216MB130319B98B3A33A22CA8CFF4EDB62@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <47312bcc8352bf190a59de448d9fd31f04ef954d.camel@collabora.com>
In-Reply-To: <47312bcc8352bf190a59de448d9fd31f04ef954d.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|PU4P216MB1440:EE_
x-ms-office365-filtering-correlation-id: de9c5c7a-32db-4de0-2f8a-08dd7af5de49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K2F4eEdzMG82RzF2MFhMZlF2WnFzaS9URmNCTlJuY0RDYnhEY3ZJaUJ3Ymt5?=
 =?utf-8?B?ODRXYVd2a3pFY1dFU1RrdzFqUFhSZzVTcDVXM2lhTXVVWDhtQVhFbGRINkJJ?=
 =?utf-8?B?clQ4b0VCQXdva0FFbU96d3lvTktHaEp6aUV5dURiYXVCZkZwbklhSC9YbW92?=
 =?utf-8?B?YkZzZ0tjS0U4cWRYd2luaUNTanpqRE9oRGFwSVlxQnVZNk0xUXViQzFNdWpn?=
 =?utf-8?B?ektrUEhMMHlhaTNwWTF1c3RHWEZ0eUV4U3NrcWpQVW5lUkNwZHpZSWI0dnc2?=
 =?utf-8?B?TjZMRHkvOHI3ZE5TUHczbittRzFSNHNNWm1BMXhUTGREYzFOUkp5d0liY2dj?=
 =?utf-8?B?cTZUdW1RU0JqdWdza2JFT2sxSnh0amlmMVBOZ2pqVEVXVWlFN2xvbGJUUG85?=
 =?utf-8?B?N1RMSXlNU3JvMEJ5NTRhenNOV2Nkd0ZFVG5ZQk5WcnViUWRTLzgzNkRlSkx0?=
 =?utf-8?B?UnpUanNUWVdyN0N3VGZCb0FaeHR0cnlQWFQ1cFRzVlZRMldWWHVJVkNWTUpq?=
 =?utf-8?B?UnpmOTQ2WG44Y05KU1M4YXFJVUt2cTVHTFNCdDB2N3pzSmZzRnZGcEQ4OHlv?=
 =?utf-8?B?TjZQNWJQdVZOMmpyVE1BQW5sWnJDcFlhS3QzUWYwUGtaTUxONWJkQ0xWRHlj?=
 =?utf-8?B?dDZiakhVdVNyRDZuNGhNU2Q3SStkaFdBdUNGTWFENkxFaHllUU5QSHoyUll2?=
 =?utf-8?B?UlM3UXYvSVgvOU4vK2pOdDVRK1BGV3d6aWhtNlRyWVFLdS9iaHYxNWswWjhq?=
 =?utf-8?B?K1VJUmNxeGh0VzNGa1czV3R0dnlYaWRNNGZ3RU82TDcxOGErVUJjUVVMTXMr?=
 =?utf-8?B?anVxY3NhYURJVVc4WU9OUzBaYmQ1bnFIb0Q4WXI1K1V6MTNLTDhhQnlFNVMz?=
 =?utf-8?B?anpCTDZGREhFaUJSYkZySzhKNTJjM0RialdvbUpTNmwyYWhCOEgrNTduVk01?=
 =?utf-8?B?Mmt1ZnZWQjlnR0hKbzJsN1FYNHl6QXNKSjVHOFNUS3FQTU9ZT3UvNGp1bjFU?=
 =?utf-8?B?Y1hXK0VDTkRCRGYvRlN6RXhrVUU4ZEFhdkg2RWdocytTVzF5cmx0R3BMRGJF?=
 =?utf-8?B?UXI2OGNnN1U4VllNVndpOEVTRjl3SDVVajlCdUpPd0p3NFdnMkl0UXNDY1Yx?=
 =?utf-8?B?bWFweUJzY09ZVDJRWkNIeGt5Wm5wcmlxdFJjYmdPNUJEbW9jamxXZGNwL1JH?=
 =?utf-8?B?WlpMVnlvaXBoeUcramZ4UklEQ0FHZHV2QU5SNzhLNkdTbEdxaVVzQ0llVzVN?=
 =?utf-8?B?MzRINTQzSXlTakNvWU5acDdsVnYzZHdFNGtBUlpVVnczaDJLd2NWZmNsNlAv?=
 =?utf-8?B?RmhvTWVXa0lNYXMxMU1DUDAxOEZudm9XVElRTEhYbURvTkp5WnlOQWNJSGh1?=
 =?utf-8?B?RHF1TkNmL2VnVDJVVStGeHBsNkRacGw5SHk3NzZvd0pEc2lySUlLZWdMdlZa?=
 =?utf-8?B?cWRMWnZEeVNMRWdhTzFRdUxjajFSR0U0ZUpOTWcyem05VGlENGFlbnNCbzRi?=
 =?utf-8?B?V05KNFZHOW82L1RPbHkxSWs1VldmUUVpVGZXTEErZzg3SHoxVlE1RXhZZnR6?=
 =?utf-8?B?UnFOTFA2d3pkblFCQkN0REFvOWNJblJsa2o2VjNTZ2NHVCszRCt4Ym90Wi9h?=
 =?utf-8?B?dWhlUzUvRk9rTlNta3k2Ull3dDZmd1lidGk5TUowcFdGMDlBdGY2cmlNUlN3?=
 =?utf-8?B?R1puYzhvd3JMa1FNVVVGS3dhUTkrdWdHaktSeG9UY2VrOXpaRENZdzVSdlhC?=
 =?utf-8?B?WEZIRTB1R1BMcTl4OHdzVjlWSHpYQWJXTUlnMXlXOUVwamdWUDJuc2UrWU5B?=
 =?utf-8?B?VWl3NkxpK2hwN1lJQXBYM3BYMHNzQ1FzNEhoR0xyNkEwVlVDb1JuZ1JmVmJG?=
 =?utf-8?B?ZExKWUoxM0RzT0l6ZHAvbmZ6aFozMFJFMWxINkkwVzFvS0dqbmtnTzdXT2VH?=
 =?utf-8?B?VzJYUHVjeWhlQnFZeDJVT3lub3FIUmJQcnNQbndzUWdFZVJPWnNtVUlyQnA5?=
 =?utf-8?B?VVhKTFpiaE5nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eEwyS1FrWGhpOHNEdm9xWGZ4cmpEK2JyN2hock95Tm13NG8wZXhZRndFWGZa?=
 =?utf-8?B?VU90UjZ1d1p3QmJwM2NFRWJVdWl5Z1pCK0p1bXhpb1loV3VQYWM2N253U2NM?=
 =?utf-8?B?TkZqeTg1NG5vdnlBTVB1clp3b0FOZGN5d0t0aUpXOVlXU1pyRy9hSW5CRUVn?=
 =?utf-8?B?V083LzBTTytyLzAxRVIwRmFUVzlDWVBOTzJwSWowbHIzcW15N3JhYlFMa3k5?=
 =?utf-8?B?NW5Idy9BM3hQZk5rRHVkUlBwdmNLU1JLcVVwZjNaT2dxSlBsYkt0VDFPeksr?=
 =?utf-8?B?TGZRdmNYaGdrRTB1QkR5Y2RDUVdENVIwL3dlcDArOEdYaElhUGJ3cHplci9Q?=
 =?utf-8?B?QmhiZ1Ftam5mRWF2dW80a080N0lFaHlNbWtPYnc0L2QvczNLSWhCQzgwREpW?=
 =?utf-8?B?UmhKOWgydmJKWnYrRVYrOXFVcTMxNDNsMDA4ODFPVnNIZm52YklDb01tbjJN?=
 =?utf-8?B?dkJkTkFaLzl1bnJnWko5MDdGQ2ZjZlE5c2o5OERDZllNcXJweUZBNkJ3aGZT?=
 =?utf-8?B?RjY5TS9JSFpFQkViQ1lFQlp3MytKTk5CYnRoMU01dUVjVkpmZkpldlAxVmZw?=
 =?utf-8?B?MkRWVkxkZ3FuNlM5T3VuSU1Oa0ppN2FjRnRRellnMUZCcFdlai9mYlN0Vmha?=
 =?utf-8?B?c0psMjdMYTU2VlVSRThwQngycGlIMGcrbzFxUHZLOGhabXF2RkRmUFdKRUFl?=
 =?utf-8?B?MFIxb2hxV3oydDl3R09Xa3o3dW5sS0VXYmt0NTJjWjFqdmpDZzd6RmFKOENa?=
 =?utf-8?B?enNndUppaG5ndTI4OHdmcEIrWE0xc1c0RFgwWHBlY1NmRXBpR3NXRnQ2S3hT?=
 =?utf-8?B?UEF5akUzWUFBbG1MRHhyVEZ5RGhCT24yVDhweUcxL29tREFoRVVRUlovWnVG?=
 =?utf-8?B?dVlHWGRObFFwako2T0ZpTDgveWU1R29BalIwLy9uRkVhMDErYmJYdFhpYjRq?=
 =?utf-8?B?dSt3TWZvWFVwZy9aaFZXQ2ZuLzFGdHJJdk55dFhpK2p4VUhJQkk1S1E4SThI?=
 =?utf-8?B?dW1BU3NuNXl1cy9EeEo4aUUrc3Y1eDdxWnhWdHJKWVhTcVN0d1VWRk9CZzIy?=
 =?utf-8?B?VURpckZuaEVNUHlkR2tUQlE2K0pHWDZ3TUQ0dUhGTzZWNTVreHVsZXd2MmhY?=
 =?utf-8?B?d25DOGtJYTlTVU9nQTFxVGVRTW4zd094YTRZMlVpWTZDZEpvUzkxcGl6dVRy?=
 =?utf-8?B?NG9KYmtZM2d6cWIvTzlUUG9yVXgwTThVRXNyMWZZbXlhcHB1aFVpZkM4bmxp?=
 =?utf-8?B?K25UUWpZZ3NJLzZOOVRqVEsxU3hUUmNmeUVvMVRwaldPakxUSUVLMVQvLzZr?=
 =?utf-8?B?RXlLU1o5QWlsb3o1UDRlUG1OYzdvcGEzbWRWaEd1VEp6ZDBWYWJLYThFc0M1?=
 =?utf-8?B?UXBNblpBaEN6Y3QrKzBZTmEzd3JzZ3kyWTJkV1kzUlE3ZDMzZXE1cU0xYVNu?=
 =?utf-8?B?Yzg1dER3OGg4aGNlWHJ4QkhMMEVROHpjRGpncmtOQnJGZmJGKzg4cDQ0RkVi?=
 =?utf-8?B?ZjBtNXd5RnlKR0wwVmJLYlQ2NXpjUFR5dG45eGRNQjhhekJHSHFoekRMQklh?=
 =?utf-8?B?MHcrVVFtR1BZSE9Od1JOcVdHZTA1aVJ5U1EzU0Z1dG10di9sSzZ6Y0c5ZGJz?=
 =?utf-8?B?bThyaU9tSEdIRTI0aU9rMXBXWlNuaUZ4dm5NUjRweXhlM3o1MkN6UVVoaHF5?=
 =?utf-8?B?Y0toTmZnZ1c3dWRFNFU3azJLdE9UR1ZheHBKWGpLbzROc01OWWpsMDhuc3Nx?=
 =?utf-8?B?TjdSa0ExbGFhbTM0TnNDUXdwaTRFVk9UaHZScWs2K1dpeU0xZGFvRnF4b0FV?=
 =?utf-8?B?QTJMdWJDa3ZIK2IzbTFUeUpRUDdvcGpQekpTTWw5c09SalRaT3F3ZUpndy95?=
 =?utf-8?B?S0pnNFk1UFJnRit3UnVNUVpGcytvNnh6OEFscG9EeDlHZCtsaENJUE9oTkhj?=
 =?utf-8?B?aUM0enQwUWxuY0s3QVZURzVpYzFVSE1US1JEUVNJYlZGajhyWS9EemJjeXQ3?=
 =?utf-8?B?UWlhemtVWlNzcmp6L2haenA4UVBvczgxbzRtQlhXTnVPZEpETFJLR1ZaQ1dL?=
 =?utf-8?B?anFpb04xNmdGQWdTOU9GMzR3aVY2cmt0Nk5SdndLZHlqM3d3TnNPUnExZTdY?=
 =?utf-8?B?WEtVZXkyWWgzcEFjTTVVcE5oYnJpWjJiNlp3ajFjTUNuTFd5TFREem1ycC9t?=
 =?utf-8?B?U0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: de9c5c7a-32db-4de0-2f8a-08dd7af5de49
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 01:44:17.1146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDOnsKYP4f1x+Nq9jUWJAhuBfHIiwB5kkclJjXV3gj1auTo+zDLleQ50uOFV8Ic7dJxTxmQXaSE6IAWc5Org4GiXwbeRAT8r10VwaQFkClk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1440

SGkgTmljb2xhcw0KDQpUaGFua3MgZm9yIHlvdXIgYWR2aWNlLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVA
Y29sbGFib3JhLmNvbT4NCj4gU2VudDogU2F0dXJkYXksIEFwcmlsIDEyLCAyMDI1IDEyOjQ4IEFN
DQo+IFRvOiBqYWNrc29uLmxlZSA8amFja3Nvbi5sZWVAY2hpcHNubWVkaWEuY29tPjsgbWNoZWhh
YkBrZXJuZWwub3JnOw0KPiBodmVya3VpbC1jaXNjb0B4czRhbGwubmw7IHNlYmFzdGlhbi5mcmlj
a2VAY29sbGFib3JhLmNvbTsNCj4gYm9iLmJlY2tldHRAY29sbGFib3JhLmNvbTsgZGFmbmEuaGly
c2NoZmVsZEBjb2xsYWJvcmEuY29tDQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxhZmxleS5raW0NCj4gPGxhZmxleS5raW1A
Y2hpcHNubWVkaWEuY29tPjsgYi1icm5pY2hAdGkuY29tOyBodmVya3VpbEB4czRhbGwubmw7IE5h
cw0KPiBDaHVuZyA8bmFzLmNodW5nQGNoaXBzbm1lZGlhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtS
RVNFTkQgUEFUQ0ggdjEgMC83XSBQZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBvZiBkZWNvZGVyDQo+
IA0KPiBIaSwNCj4gDQo+IExlIHZlbmRyZWRpIDExIGF2cmlsIDIwMjUgw6AgMDA6NDkgKzAwMDAs
IGphY2tzb24ubGVlIGEgw6ljcml0wqA6DQo+ID4gSGkgTmljb2xhcw0KPiA+DQo+ID4gVGhlcmUg
d2FzIHdhcm5pbmcgbWVzc2FnZSBvZiBwYXRjaCB3b3JrLg0KPiA+IEhhc2ggdmFsdWUgb2YgIklt
cHJvdmUgcGVyZm9ybWFuY2Ugb2YgZGVjb2RlciIgaW4gdGhlIHBhdGNoIHNlcmllcw0KPiA+IHdl
cmUgdXNlZCBmb3IgRklYUyB0YWcsIEkgcmVtb3ZlZCB0aGUgRklYUyB0YWdzIGluIHRoZSBjb21t
aXQgbWVzc2FnZS4NCj4gDQo+IEknZCBwcmVmZXIgaWYgeW91IHNpbXBseSBjb21tZW50IGJhY2sg
dGhhdCB0aGlzIG5lZWRzIHRvIGJlIHJlbW92ZWQgYmVmb3JlDQo+IG1lcmdpbmcuIElmIHlvdSBn
ZXQgZW5vdWdoIGNvbW1lbnQgZm9yIGEgbmV3IHZlcnNpb24sIHlvdSBjYW4gZG8gaXQsIGlmDQo+
IGl0cyB0aGUgb25seSB0aGluZyBwcmV2ZW50aW5nIHRoZSBtZXJnZSwgSSB3aWxsIGZpeCBpdC4N
Cj4gDQo+IFJlc2VuZHMgYXJlIG1vc3RseSB1c2VkIHdoZW4gYSBwYXRjaGVzIGhhdmUgaGFkIG5v
IGNvbW1lbnQsIG5vIGZlZWRiYWNrDQo+IGZvciBhIGxvbmcgcGVyaW9kIG9mIHRpbWUuIFdoZW4g
dGhlIHBhdGNoZXMgaGF2ZSBiZWVuIGZvcmdvdHRlbiwgYW5kIGFyZQ0KPiBub3QgZXhwZWN0ZWQg
dG8gaG9sZCBhbnkgZWRpdHMuDQo+IA0KPiByZWdhcmRzLA0KPiBOaWNvbGFzDQo+IA0KPiA+DQo+
ID4gdGhhbmtzDQo+ID4NCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+ID4gRnJvbTogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJv
cmEuY29tPg0KPiA+ID4gU2VudDogVGh1cnNkYXksIEFwcmlsIDEwLCAyMDI1IDk6MzkgUE0NCj4g
PiA+IFRvOiBqYWNrc29uLmxlZSA8amFja3Nvbi5sZWVAY2hpcHNubWVkaWEuY29tPjsgbWNoZWhh
YkBrZXJuZWwub3JnOw0KPiA+ID4gaHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sOyBzZWJhc3RpYW4u
ZnJpY2tlQGNvbGxhYm9yYS5jb207DQo+ID4gPiBib2IuYmVja2V0dEBjb2xsYWJvcmEuY29tOyBk
YWZuYS5oaXJzY2hmZWxkQGNvbGxhYm9yYS5jb20NCj4gPiA+IENjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBsYWZsZXku
a2ltIDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJuaWNoQHRpLmNvbTsNCj4gPiA+
IGh2ZXJrdWlsQHhzNGFsbC5ubDsgTmFzIENodW5nIDxuYXMuY2h1bmdAY2hpcHNubWVkaWEuY29t
Pg0KPiA+ID4gU3ViamVjdDogUmU6IFtSRVNFTkQgUEFUQ0ggdjEgMC83XSBQZXJmb3JtYW5jZSBp
bXByb3ZlbWVudCBvZg0KPiA+ID4gZGVjb2Rlcg0KPiA+ID4NCj4gPiA+IEhpLA0KPiA+ID4NCj4g
PiA+IExlIGpldWRpIDEwIGF2cmlsIDIwMjUgw6AgMTI6MzkgKzA5MDAsIEphY2tzb24ubGVlIGEg
w6ljcml0wqA6DQo+ID4gPiA+IEZyb206IEphY2tzb24gTGVlIDxqYWNrc29uLmxlZUBjaGlwc25t
ZWRpYS5jb20+DQo+ID4gPiA+DQo+ID4gPiA+IHY0bDItY29tcGxpYW5jZSByZXN1bHRzOg0KPiA+
ID4gPiA9PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+DQo+ID4gPiBXaGF0IHRoZXJlIHJl
YXNvbiBmb3IgYSByZXNlbmQgd2l0aGluIDNoID8NCj4gPiA+DQo+ID4gPiBOaWNvbGFzDQo+ID4g
Pg0KPiA+ID4gPg0KPiA+ID4gPiB2NGwyLWNvbXBsaWFuY2UgMS4yOC4xLTUyMzMsIDY0IGJpdHMs
IDY0LWJpdCB0aW1lX3QNCj4gPiA+ID4NCj4gPiA+ID4gQnVmZmVyIGlvY3RsczoNCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdhcm46IHY0bDItdGVzdC1idWZmZXJzLmNw
cCg2OTMpOg0KPiA+ID4gPiBWSURJT0NfQ1JFQVRFX0JVRlMNCj4gPiA+ID4gbm90IHN1cHBvcnRl
ZA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2FybjogdjRsMi10ZXN0
LWJ1ZmZlcnMuY3BwKDY5Myk6DQo+ID4gPiA+IFZJRElPQ19DUkVBVEVfQlVGUw0KPiA+ID4gPiBu
b3Qgc3VwcG9ydGVkDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIHRlc3QgVklESU9DX1JFUUJVRlMv
Q1JFQVRFX0JVRlMvUVVFUllCVUY6IE9LDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIHRlc3QgQ1JF
QVRFX0JVRlMgbWF4aW11bSBidWZmZXJzOiBPSw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCB0ZXN0
IFZJRElPQ19FWFBCVUY6IE9LDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIHRlc3QgUmVxdWVzdHM6
IE9LIChOb3QgU3VwcG9ydGVkKQ0KPiA+ID4gPg0KPiA+ID4gPiBUb3RhbCBmb3Igd2F2ZTUtZGVj
IGRldmljZSAvZGV2L3ZpZGVvMDogNDYsIFN1Y2NlZWRlZDogNDYsDQo+ID4gPiA+IEZhaWxlZDog
MCwNCj4gPiA+ID4gV2FybmluZ3M6IDINCj4gPiA+ID4gVG90YWwgZm9yIHdhdmU1LWVuYyBkZXZp
Y2UgL2Rldi92aWRlbzE6IDQ2LCBTdWNjZWVkZWQ6IDQ2LA0KPiA+ID4gPiBGYWlsZWQ6IDAsDQo+
ID4gPiA+IFdhcm5pbmdzOiAwDQo+ID4gPiA+DQo+ID4gPiA+IEZsdXN0ZXIgdGVzdCByZXN1bHRz
Og0KPiA+ID4gPiA9PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+ID4NCj4gPiA+ID4gUnVubmlu
ZyB0ZXN0IHN1aXRlIEpDVC1WQy1IRVZDX1YxIHdpdGggZGVjb2RlciBHU3RyZWFtZXItSC4yNjUt
DQo+ID4gPiA+IFY0TDItDQo+ID4gPiA+IEdzdDEuMA0KPiA+ID4gPiBVc2luZyAzIHBhcmFsbGVs
IGpvYihzKQ0KPiA+ID4gPiBSYW4gMTMzLzE0NyB0ZXN0cyBzdWNjZXNzZnVsbHnCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGluIDQxLjYyOSBzZWNzDQo+ID4gPiA+DQo+ID4gPiA+ICgxIHRl
c3QgZmFpbHMgYmVjYXVzZSBvZiBub3Qgc3VwcG9ydGluZyB0byBwYXJzZSBtdWx0aSBmcmFtZXMs
IDENCj4gPiA+ID4gdGVzdCBmYWlscyBiZWNhdXNlIG9mIGEgbWlzc2luZyBmcmFtZSBhbmQgc2xp
Z2h0IGNvcnJ1cHRpb24sDQo+ID4gPiA+IMKgMiB0ZXN0cyBmYWlsIGJlY2F1c2Ugb2Ygc2l6ZXMg
d2hpY2ggYXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZSBJUCwNCj4gPiA+ID4gMTEgdGVzdHMgZmFp
bCBiZWNhdXNlIG9mIHVuc3VwcG9ydGVkIDEwIGJpdCBmb3JtYXQpDQo+ID4gPiA+DQo+ID4gPiA+
DQo+ID4gPiA+IFJ1bm5pbmcgdGVzdCBzdWl0ZSBKVlQtQVZDX1YxIHdpdGggZGVjb2RlciBHU3Ry
ZWFtZXItSC4yNjQtVjRMMi0NCj4gPiA+ID4gR3N0MS4wDQo+ID4gPiA+IFVzaW5nIDMgcGFyYWxs
ZWwgam9iKHMpDQo+ID4gPiA+IFJhbiA3OC8xMzUgdGVzdHMgc3VjY2Vzc2Z1bGx5wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpbiA0NC41Nzggc2Vjcw0KPiA+ID4gPg0KPiA+ID4gPiAoNTcg
ZmFpbCBiZWNhdXNlIHRoZSBoYXJkd2FyZSBpcyB1bmFibGUgdG8gZGVjb2RlwqAgTUJBRkYgLyBG
TU8gLw0KPiA+ID4gPiBGaWVsZCAvIEV4dGVuZGVkIHByb2ZpbGUgc3RyZWFtcy4pDQo+ID4gPiA+
DQo+ID4gPiA+IFNlZWsgdGVzdA0KPiA+ID4gPiA9PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+
ID4gMS4gZ3N0LXBsYXktMS4wIHNlZWsuMjY0DQo+ID4gPiA+IDIuIHRoaXMgd2lsbCB1c2Ugd2F5
bGFuZHNpbmsgc2luY2UgZ3N0LXBsYXktMS4wIHVzZXMgcGxheWJpbi4NCj4gPiA+ID4gwqDCoCBp
ZiB5b3UgZG9uJ3Qgd2FudCB0byBob29rIHVwIGRpc3BsYXksDQo+ID4gPiA+IMKgwqAgeW91IGNh
biBydW4gZ3N0LXBsYXktMS4wIHNlZWsuMjY0IC0tdmlkZW9zaW5rPWZha2V2aWRlb3NpbmsNCj4g
PiA+ID4gaW5zdGVhZCAzLiBMZXQgcGlwZWxpbmUgcnVuIGZvciAyLTMgc2Vjb25kcyA0LiBwcmVz
cyBTUEFDRSBrZXkgdG8NCj4gPiA+ID4gcGF1c2UgNS4NCj4gPiA+ID4gcHJlc3MgMCB0byByZXNl
dCBwcmVzcyBTUEFDRSB0byBzdGFydCBhZ2Fpbg0KPiA+ID4gPg0KPiA+ID4gPiBnc3QtcGxheS0x
LjAgc2Vlay4yNjQgLS12aWRlb3Npbms9ZmFrZXZpZGVvc2luayBQcmVzcyAnaycgdG8gc2VlIGEN
Cj4gPiA+ID4gbGlzdCBvZiBrZXlib2FyZCBzaG9ydGN1dHMuDQo+ID4gPiA+IE5vdyBwbGF5aW5n
IC9yb290L3NlZWsuMjY0DQo+ID4gPiA+IFJlZGlzdHJpYnV0ZSBsYXRlbmN5Li4uDQo+ID4gPiA+
IFJlZGlzdHJpYnV0ZSBsYXRlbmN5Li4uDQo+ID4gPiA+IFJlZGlzdHJpYnV0ZSBsYXRlbmN5Li4u
DQo+ID4gPiA+IFJlZGlzdHJpYnV0ZSBsYXRlbmN5Li4uDQo+ID4gPiA+IFJlZGlzdHJpYnV0ZSBs
YXRlbmN5Li4uYXVzZWQNCj4gPiA+ID4gMDowMDowOS45IC8gMDowMDowOS43DQo+ID4gPiA+IFJl
YWNoZWQgZW5kIG9mIHBsYXkgbGlzdC4NCj4gPiA+ID4NCj4gPiA+ID4gU2VxdWVuY2UgQ2hhbmdl
IHRlc3QNCj4gPiA+ID4gPT09PT09PT09PT09PT09PT09PT09DQo+ID4gPiA+IGdzdC1sYXVuY2gt
MS4wIGZpbGVzcmMNCj4gPiA+ID4gbG9jYXRpb249Li9zd2l0Y2hfMTA4MHBfNzIwcF8yNDBmcmFt
ZXMuaDI2NCAhDQo+ID4gPiA+IGgyNjRwYXJzZSAhIHY0bDJoMjY0ZGVjICEgZmlsZXNpbmsgbG9j
YXRpb249Li9oMjY0X291dHB1dF80MjAueXV2DQo+ID4gPiA+IFNldHRpbmcgcGlwZWxpbmUgdG8g
UEFVU0VEIC4uLg0KPiA+ID4gPiBQaXBlbGluZSBpcyBQUkVST0xMSU5HIC4uLg0KPiA+ID4gPiBS
ZWRpc3RyaWJ1dGUgbGF0ZW5jeS4uLg0KPiA+ID4gPiBSZWRpc3RyaWJ1dGUgbGF0ZW5jeS4uLg0K
PiA+ID4gPiBQaXBlbGluZSBpcyBQUkVST0xMRUQgLi4uDQo+ID4gPiA+IFNldHRpbmcgcGlwZWxp
bmUgdG8gUExBWUlORyAuLi4NCj4gPiA+ID4gUmVkaXN0cmlidXRlIGxhdGVuY3kuLi4NCj4gPiA+
ID4gTmV3IGNsb2NrOiBHc3RTeXN0ZW1DbG9jaw0KPiA+ID4gPiBHb3QgRU9TIGZyb20gZWxlbWVu
dCAicGlwZWxpbmUwIi4NCj4gPiA+ID4gRXhlY3V0aW9uIGVuZGVkIGFmdGVyIDA6MDA6MDUuNzcy
NDE0NDAwIFNldHRpbmcgcGlwZWxpbmUgdG8gTlVMTA0KPiA+ID4gPiAuLi4NCj4gPiA+ID4gRnJl
ZWluZyBwaXBlbGluZSAuLi4NCj4gPiA+ID4NCj4gPiA+ID4gQ2hhbmdlIHNpbmNlIHYwOg0KPiA+
ID4gPiA9PT09PT09PT09PT09PT09PT09DQo+ID4gPiA+ICogRm9yIFtQQVRDSCB2MSAyLzddIG1l
ZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IEltcHJvdmUNCj4gPiA+ID4gcGVyZm9ybWFuY2Ugb2Yg
ZGVjb2Rlcg0KPiA+ID4gPiDCoC0gc2VwYXJhdGVzIHRoZSBwcmV2aW91cyBwYXRjaCB0byBhIGZl
dyBwYXRjaGVzDQo+ID4gPiA+DQo+ID4gPiA+ICogRm9yIFtQQVRDSCB2MSAzLzddIG1lZGlhOiBj
aGlwcy1tZWRpYTogd2F2ZTU6IEZpeCBub3QgdG8gYmUNCj4gPiA+ID4gY2xvc2VkDQo+ID4gPiA+
IMKgLSBzZXBhcmF0ZWQgZnJvbSB0aGUgcHJldmlvdXMgcGF0Y2ggb2YgcGVyZm9ybWFuY2UgaW1w
cm92ZW1lbnQgb2YNCj4gPiA+ID4gwqDCoCBkZWNvZGVyDQo+ID4gPiA+DQo+ID4gPiA+ICogRm9y
IFtQQVRDSCB2MSA0LzddIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFVzZSBzcGlubG9jaw0K
PiA+ID4gPiB3aGVuZXZlciBzdGF0ZSBpcyBjaGFuZ2VkDQo+ID4gPiA+IMKgLSBzZXBhcmF0ZWQg
ZnJvbSB0aGUgcHJldmlvdXMgcGF0Y2ggb2YgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgb2YNCj4g
PiA+ID4gwqDCoCBkZWNvZGVyDQo+ID4gPiA+DQo+ID4gPiA+ICogRm9yIFtQQVRDSCB2MSA1Lzdd
IG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IEZpeCBub3QgdG8gZnJlZQ0KPiA+ID4gPiByZXNv
dXJjZXMgbm9ybWFsbHkgd2hlbg0KPiA+ID4gPiDCoMKgwqAgaW5zdGFuY2Ugd2FzIGRlc3Ryb3ll
ZA0KPiA+ID4gPiDCoC0gc2VwYXJhdGVkIGZyb20gdGhlIHByZXZpb3VzIHBhdGNoIG9mIHBlcmZv
cm1hbmNlIGltcHJvdmVtZW50IG9mDQo+ID4gPiA+IMKgwqAgZGVjb2Rlcg0KPiA+ID4gPg0KPiA+
ID4gPiAqIEZvciBbUEFUQ0ggdjEgNy83XSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBGaXgg
U0Vycm9yIG9mDQo+ID4gPiA+IGtlcm5lbCBwYW5pYyB3aGVuIGNsb3NlZA0KPiA+ID4gPiDCoC0g
c2VwYXJhdGVkIGZyb20gdGhlIHByZXZpb3VzIHBhdGNoIG9mIHBlcmZvcm1hbmNlIGltcHJvdmVt
ZW50IG9mDQo+ID4gPiA+IMKgwqAgZGVjb2Rlcg0KPiA+ID4gPg0KPiA+ID4gPiBKYWNrc29uIExl
ZSAoNyk6DQo+ID4gPiA+IMKgIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IEZpeCBOdWxsIHJl
ZmVyZW5jZSB3aGlsZSB0ZXN0aW5nDQo+ID4gPiA+IGZsdXN0ZXINCj4gPiA+ID4gwqAgbWVkaWE6
IGNoaXBzLW1lZGlhOiB3YXZlNTogSW1wcm92ZSBwZXJmb3JtYW5jZSBvZiBkZWNvZGVyDQo+ID4g
PiA+IMKgIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IEZpeCBub3QgdG8gYmUgY2xvc2VkDQo+
ID4gPiA+IMKgIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFVzZSBzcGlubG9jayB3aGVuZXZl
ciBzdGF0ZSBpcw0KPiA+ID4gPiBjaGFuZ2VkDQo+ID4gPiA+IMKgIG1lZGlhOiBjaGlwcy1tZWRp
YTogd2F2ZTU6IEZpeCBub3QgdG8gZnJlZSByZXNvdXJjZXMgbm9ybWFsbHkNCj4gPiA+ID4gd2hl
bg0KPiA+ID4gPiDCoMKgwqAgaW5zdGFuY2Ugd2FzIGRlc3Ryb3llZA0KPiA+ID4gPiDCoCBtZWRp
YTogY2hpcHMtbWVkaWE6IHdhdmU1OiBSZWR1Y2UgaGlnaCBDUFUgbG9hZA0KPiA+ID4gPiDCoCBt
ZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBGaXggU0Vycm9yIG9mIGtlcm5lbCBwYW5pYyB3aGVu
DQo+ID4gPiA+IGNsb3NlZA0KPiA+ID4gPg0KPiA+ID4gPiDCoC4uLi9wbGF0Zm9ybS9jaGlwcy1t
ZWRpYS93YXZlNS93YXZlNS1oZWxwZXIuYyB8wqAgMTAgKy0NCj4gPiA+ID4gwqAuLi4vY2hpcHMt
bWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LWRlYy5jwqDCoMKgwqDCoMKgwqDCoCB8IDExNiArKysrKysr
KysrKy0NCj4gPiA+ID4gLS0tLQ0KPiA+ID4gPiAtLQ0KPiA+ID4gPiDCoC4uLi9jaGlwcy1tZWRp
YS93YXZlNS93YXZlNS12cHUtZW5jLmPCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDggKy0NCj4gPiA+
ID4gwqAuLi4vcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LmPCoMKgwqAgfMKg
IDcwICsrKysrKysrKy0tDQo+ID4gPiA+IMKgLi4uL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1
L3dhdmU1LXZwdWFwaS5jIHzCoCAzNiArKystLS0NCj4gPiA+ID4gwqAuLi4vcGxhdGZvcm0vY2hp
cHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmggfMKgIDEwICsrDQo+ID4gPiA+IMKgLi4uL2No
aXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdWNvbmZpZy5owqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0K
PiA+ID4gPiDCoDcgZmlsZXMgY2hhbmdlZCwgMTc5IGluc2VydGlvbnMoKyksIDcyIGRlbGV0aW9u
cygtKQ0KPiA+ID4NCj4gPiA+IC0tDQo+ID4gPiBOaWNvbGFzIER1ZnJlc25lDQo+ID4gPiBQcmlu
Y2lwYWwgRW5naW5lZXIgYXQgQ29sbGFib3JhDQo+IA0KPiAtLQ0KPiBOaWNvbGFzIER1ZnJlc25l
DQo+IFByaW5jaXBhbCBFbmdpbmVlciBhdCBDb2xsYWJvcmENCg==

