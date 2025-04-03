Return-Path: <linux-media+bounces-29277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 068F6A799B0
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 03:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98552188B8CF
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 01:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DBC13D503;
	Thu,  3 Apr 2025 01:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Iy23r7eo"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020134.outbound.protection.outlook.com [52.101.156.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B427D3F4;
	Thu,  3 Apr 2025 01:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743643793; cv=fail; b=jCGO5QYIOKCE1I061+6oN3dzCJG/vx4Uyj2p69lx964rz01J0uMFEB3aya+/Gbx/wlWYjjt2V7JiKdK3f/RNUhIPDJAQOy9UBSFNE/aAllIQdoU/WY7LN1RS0LBDCK4ujMEcoFrgpt6qgq0We0zskSF9lqHq+9z0XdgkO0RLxTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743643793; c=relaxed/simple;
	bh=iXG5Y8dGj6y4mLCEB7SBkUtuvL0OU81+E6YRYZc9g1c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IXUOIWD0J6VUPRDTF3hLNWryLpU61JO6XRfikcCnmIz3+9QEBh+HE2T+iwqZFprelcLdZ1IlDCeySZMk/39v5PCAnc0IDJKtwhzNZ9PHWt49Ulj24sZjhdVmqASey5eBS8yItrStN+Uy6axvKTF/b1tahl7KO/o7BEaZNYMl044=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Iy23r7eo; arc=fail smtp.client-ip=52.101.156.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2KJuE6BLjKtTTZEz4oe5OSGMEKEgAW8eYwAE8AJGwS5y6ueSRufDDcpUx0mXSVoWYDaVcZgoG5XgSZ4Dj9Za30QW3FkASk86m531Bx1gB9tXOPe2UTPFnEII/vC1xTB+HbWVCaBOpafNuLgRKiuLEXR4M5ph1RW67ozYEj8vLztQpLch7pLPz1yR+LYPsYZ279RXr/tp55rDPiUx0LEVG8SZ84TmjQhPE93kvSUp8YGmM1aLt00UIdTPsl85+P6WftyoN8GdxHga9JeLK4tFcwOxJ7kvRLeqVzuWeywvZRXa/YAEE3rPFohLdxWEY6pvnYHKoXoVbsa7se4tnUhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXG5Y8dGj6y4mLCEB7SBkUtuvL0OU81+E6YRYZc9g1c=;
 b=gqvr9YM5OGAPki6Dlmtr3gflR17h9i6GqhJmk6+uRPEuZaRIr00I77craoJuLZgqfoFH+4LiiLDONpkpDfwKuc8V1ZZ7KxXPtr832js858Jy17MNLVPropJCWDxPYjEEhrEJOkknwhAwvbD5NH5dfNH5xUwEr6lSUr7z2VzivEpAsdN5AvAo9x4P6Ek9CdRxB7SVKGqnFNZssnDviHLMR3lJKtG91rd0VqKRKMf+qjgZ8HvJWCzar/vaFzDgIjjsWuK6UGwun4VotKFgDkbl8/K7NVzO5nXE1qH1d6bongadSEs8z0l798GybXrUhf5i7TMpFgv5kZ6nruHnvFQevw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXG5Y8dGj6y4mLCEB7SBkUtuvL0OU81+E6YRYZc9g1c=;
 b=Iy23r7eoEwJzi9JTC1K7amhlEDXerj1tDd2hRPqhcJToILJ9Rwo1ym+QkUWT3DwXQtQ7CpLipe25kpzL3IFrLuN65c/Gzjov1/4Q7WJofuL1/fsYpiGWSJdyxPQMPmpeVQ5N3R3q+0EtkzGy3QRAZHmykItyl6sorzuhM5cbo78=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1482.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.39; Thu, 3 Apr 2025 01:29:46 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8583.043; Thu, 3 Apr 2025
 01:29:46 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>,
	"dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [RESEND PATCH v0 0/3] Performance improvement of decoder
Thread-Topic: [RESEND PATCH v0 0/3] Performance improvement of decoder
Thread-Index: AQHbmIIWXZ9LzO5nw0Otng8EA5x7srOQmzKAgACjWBA=
Date: Thu, 3 Apr 2025 01:29:46 +0000
Message-ID:
 <SE1P216MB13032CF0902D35CFF9BCF050EDAE2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
 <9f22aaa07b1fa11e7e1dee35598bafe5a3461ea7.camel@ndufresne.ca>
In-Reply-To: <9f22aaa07b1fa11e7e1dee35598bafe5a3461ea7.camel@ndufresne.ca>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB1482:EE_
x-ms-office365-filtering-correlation-id: eb81a464-7acf-4f2d-db3a-08dd724f04e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bk1vbWd4dXRqajJvaVBZMFlTV0UvK2Z4Wlc1cFFuMVR6dHJaN3Q0UzFVNkhU?=
 =?utf-8?B?eWJwMTJBdnZReXpUMG5TZnRuSlRLL0NhUDM4Ti9QcHdWY21McWZXMWZORFRN?=
 =?utf-8?B?S2pRTjBMOFluWTBPQ0kxZm42b0FwdzhHazkzd1RWYzNoSEtjeXhiS1JaaDVR?=
 =?utf-8?B?cUNaeUJmaW5aZHdQR1I3eGY5OHJkTDBudFZBT2c2UllhbmtYZmIybng4NTVG?=
 =?utf-8?B?M1RyZUJ3UDZGT1hWZHphQVVJN1Zsd1hERHZhY2dadTd2MStyYllvSGN1T0lC?=
 =?utf-8?B?cE1mRjlSc0ZjV3plakhPMDlWNWhuSnpVWnMvNUd6UHlQNHc3VWZ6NEVmRnkr?=
 =?utf-8?B?SU90R0grWXFHdC80Z3JQL2gzZnFUVGhyMWRpZWZIeGdYSUpBOE9uZmlTeE1P?=
 =?utf-8?B?NzdUd0YzMUE5SFUwYmpka0M4UjV2MWRPR2dJV1lGR0Zuc0JFODlnOGM4VUpy?=
 =?utf-8?B?d1l5MS81bHZ1RjYrZmUydkRpQjNuQ2xpSFFwVXJFbmpkL0hYZzlXdkcra1Jr?=
 =?utf-8?B?c3UvU0wrZFhmWWc1bjNob0NuemI2OVFvclpuMGpMVGZZa1gxWnA4MUo4TmtF?=
 =?utf-8?B?L3h6WkJaN2EyWkNoWVRFdXdGbGllS3FORy9xVnBpYmVjT0czZTZzc092RTRw?=
 =?utf-8?B?UTdhQUREcjZqS0d4cjNYV1JGczcveFpHOEFIVWJUbzRValFpZU9HbUM2Y25q?=
 =?utf-8?B?NUFseHJTUzhKK0I2aVdpelZ6b1ZHSE45UGRVTDlDZFJwU2lISkdDbjVWRldV?=
 =?utf-8?B?U0RxMXJaOFpvOSs3cDR1Q1Y5Y2ZySnhpWjljSHBMRUwwUG9CcFdwK0dTTGNq?=
 =?utf-8?B?amdCRW1QMVh0RGp3ZkMvNGkyV0xGQVJXb1ZTeU9ieHduMEFSNG1aVEZlU1FX?=
 =?utf-8?B?aVBFZy9HTEJjd0x2Skp3aTFmZlkrMDFadUFPZlNKME42OFpMRzh6SHBiN3pk?=
 =?utf-8?B?Q2dkRGJjK3AzY0RqczNwYTVmL0NUU2orY2kwZms5a1h3MFhFRG5paG9HN3Zj?=
 =?utf-8?B?SlhsajBBRzRKZmhtR3RxUTdkMVlUaDgwREtnd0pydnFVREJQTTlQZk5PRXAx?=
 =?utf-8?B?amtYcmx6YlhKWXlGYmFndC9mN0hQMjVJZVdFUnhmZEZLQ2t0UTNEbG43K1c4?=
 =?utf-8?B?alM3ckJHSkduSzEzU1g4VzlYUG5ISTV3aU13WVJWTnhrdlhGMHo2ZTlack1u?=
 =?utf-8?B?R3NiSkdFd0QzaytYMVhKK2U0akRLdG1qSmphT0p2eU50eFQ0U3RoWC8vT1FV?=
 =?utf-8?B?SVVXRWl1SGh6UXdzOHUxM3lVRDJQaWQzMFNtWXU5R052QWg5QmNERGtGZ2pE?=
 =?utf-8?B?Y2trTlZNRkR4Q0sxR3REMUZGOXVIem1vL2JlOVRwdUNzczNxY0dMN1M0ZGFq?=
 =?utf-8?B?UlpzU29UNGcxc1hUL3NzS09pRjJaamhyRHpJdzlqMXBQM3NDbU1XK3B1citx?=
 =?utf-8?B?ZytFLzFDb1JNSkdmTENJRVZUV04xdnlYMngwd1QvY0pYTHdjZWtwczE5aGlK?=
 =?utf-8?B?ZFRMSDlpV1lZRWF4WXhNcVRpZDlUbnV4RU9XdTd4SnE5TFFESnpUaTUrdkFO?=
 =?utf-8?B?dWNBOWF1WUpSMGcxekJxR3Ura1lGUXNFVmFMZ0tFeE5Cd3lGUU5HM1k5RXpx?=
 =?utf-8?B?TDNCb0Nra2xXSVdCL0J6RFAzOW8vWittRmNwOG93d0drUEdYZkQ1U21CeXBx?=
 =?utf-8?B?ZTNucXpYaldkc29xL3lFVmo5dEdFTy82QjFieDlVM0pxWmlEUU95SVE5dnZi?=
 =?utf-8?B?cmNJbmlCNEUvSkJlVXpiS28zNGRrblNmc3B3S3BxQTFDb0xnekNETFlMdW5s?=
 =?utf-8?B?VktGMXBWVUdWTllmRnB5UVlYaThKQ0NxVy9LVmh4TmxyL1JsWGtEUEJzRk5v?=
 =?utf-8?B?YnQweFhkK0dYeW9SaFV2eGpLTmFuNjYvdmlFamw1dWxzUWpROWRiWTRONnpV?=
 =?utf-8?Q?frcLCG61aywSIh0EQi08+UTJkb4U6k0H?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VkRmRHRMYUNFMW4xNDdxcS9EMU9JdEIzeE13MGwwSEl4OVo3SVBwZ0QvcExC?=
 =?utf-8?B?dnloOHJOZmlYZS8wakFiVms5UUJKNEZZMTd5ZWZHU1RkRjFuK2dGR1JUMDJq?=
 =?utf-8?B?T3FpNks2MitlQUFGdEhTa3FDbjJzWU5YWHpsb0xWT3VPN01GYjVFY0VndmZN?=
 =?utf-8?B?RVhPalZiN2NHVHN6S0RRazF1K3h3Wkt5Y1pOditwbzRLT1ZVdEtlRUYwYjJM?=
 =?utf-8?B?TFFPcHZYVWk4aDlYZXUzd0pwejA1S1VBc29wNXVBRmxYVkF1NjRNelpsM1dw?=
 =?utf-8?B?Nml3ZmEwNDNoMU9rSENaYVMraHg1WW1RQUxJOWlSRmV6c3ZQekxkNElvTTU1?=
 =?utf-8?B?S2xxT1I2SkxUOHRWbzl4ZENqSlMyN3NYdWhwVGdvRW5rWk9zM3lNS0didTlr?=
 =?utf-8?B?bG91V1UrTlc2ME5EdHFzVC82eitiY3JmeHlILzZ3bUE5S1BoWGN5czdwejVv?=
 =?utf-8?B?NmlPUDdXalZQcXlYSUp1MXNMTTZQMTBRTEVZM1FJR3Fub3BUcmdaL3cwR0FX?=
 =?utf-8?B?YXo3Wi9TNlRKR1orelZKMHgwTTdlRTFXdUowZkNvTGcrYUxDcnVMME5tNDZS?=
 =?utf-8?B?UE1hUVJETzg2b1VoT1JoMFYvNnliNTVXM2tWcGEwQXl0aHZhK3JhcWQzdWJr?=
 =?utf-8?B?bmRGMXVqUU9CZk1rUFdMc0t1eSs5cG9aVGRsNUNaeWNVZk1FUEVObnN2SUFC?=
 =?utf-8?B?aTJHMS84aFhIOHBadXRrTzlramswZk0rOTdjNmVNYXJLdnNPNCtYbm11Rzh2?=
 =?utf-8?B?eWp2YktLbG5Rdkt6ZzBOTFNxdGowdlVhTG9aaTZzUHNZVnlzWlF0M1p1NE9H?=
 =?utf-8?B?YXdSc3hBc3lUVTVZQkFXd2hleDBydnlwaGt0bzZyOThhZGVDeU5NZHpSTFdK?=
 =?utf-8?B?K1diUy9yWFZTYTZIY3pIQit4ZXBYNTlLemhVNEkxTldsbGZaV1p3UGVCazUy?=
 =?utf-8?B?RDhpb0s1SkVPYXFTMlRzbzlVcDNIQ040Rm1Ia2FhT3paNERJMjdmNkJqSXR6?=
 =?utf-8?B?WXlWTDFLY2hxQTJKLy8xZ3hrQS8zcHFhcjE0WGxuZDNtWHRtUjloUm1SM1J5?=
 =?utf-8?B?YmNJZkhJdXFiZ0JjaW5ob244VHlScHk3Z1Q3T3NKemdYK010TmhwTHVGVXJq?=
 =?utf-8?B?VDRUMFR2RmJmOWVLY1ZSUGlJZlFzc3J4eDd2Z1ZzSGNoNUUrVTRSWlEzbUhE?=
 =?utf-8?B?VHVsMStNUFhNNlZRNnhJR3l4eE5VZmxJcjAyYXg0RkNobXRSZHhiY3kxQ01W?=
 =?utf-8?B?SkJDeHlVSTB3eTVJSFBYS0JMbGNFdnoyWjd4NGt2ZGRHeWkrSWt0WlppMFZW?=
 =?utf-8?B?ZFhBdE5NZTFHY2hBM3YyanhSemI3UnB0ZHc4b1NnakdjNTRRZ3dCY24ybmp3?=
 =?utf-8?B?Q1YzMzhKb3VVa2JsUWdTU3h2dDBBNnJLTFZ3cDJ0dVZ4aWd2RmxmalFib2kz?=
 =?utf-8?B?bjRTQUNyYW4wVDR0L1BBZXNuM0ZEZzh6SERvdXpRMnM4b0RrQ0V0RFhDdHAz?=
 =?utf-8?B?K2lNSEphRlk3bDl3dUR1STlSVnVVVG9JUXlqTUdMckxiSElLd0NMamUrZHlR?=
 =?utf-8?B?Q05ERVprL3lJZ1JySUZlMml4RkNFcC9IQmJsV3p5eURKeDd3eFR1aUx0NGpJ?=
 =?utf-8?B?WDJIYnc4K3JKeXBUNU1sdWhXaTFXdUphT3pQTFl5WXg2L0EyRXhVNGV0QTd4?=
 =?utf-8?B?eVR6S1ZJUExETWxIWElkYWo2bmxUZ1dYNE5Uc1dOT0htYXZ0SExNZXNtRERz?=
 =?utf-8?B?VEh1ME1DbEovOTdmVTdIRXQ1QW0zZWFTa2F2K09jNlBQWklKSUEzcm9XTGp3?=
 =?utf-8?B?Z2crSjd4Q0NFak8rRVBpUkJwVGZ0akRwVi9FbWZZWnN4eU9LbEZWbWswUHUz?=
 =?utf-8?B?ZXdHcDlaZE5xYTVVSU5FQXlranMrWU4rVjZnSkFMdUNvWWZuZ2VVaEJnVXdt?=
 =?utf-8?B?b1J5Vmd0NTRhRnhMc05OcHhpZlNTWVNQK0RjZk00N2VpQTF0MmIxRnUvdjhZ?=
 =?utf-8?B?N2YxcmdFVHVRaE5VR0lFYi9qUkNQZ0QwNzFoeFNCRi8vcWN3ZjBMQXdkN04w?=
 =?utf-8?B?dTZUY1REeFhCYW1tWDZ6U2tKZDlXR0x4NEJPT21uYlpYRitUV3lqSmV4MEZ4?=
 =?utf-8?B?R2VBSi93NjZ2Y2k3dmhveEIwR0pTeWl5RzhZUnN0dU8xbkZhMEZyUitVTXdY?=
 =?utf-8?B?Nnc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eb81a464-7acf-4f2d-db3a-08dd724f04e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 01:29:46.6320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GM0elk6fVvaJbK4dzkYEHCcZsv/XWNyhtoM4Qy+hTDB6tbqApUW86x0Eh8uRc0TWuWEEwxs0LfbQ0e+nhBS+i1XVHBJoYH2DYVzPbUZBTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1482

SGkgTmljb2xhcw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPg0KPiBTZW50OiBUaHVyc2RheSwgQXBy
aWwgMywgMjAyNSAxMjo0NCBBTQ0KPiBUbzogamFja3Nvbi5sZWUgPGphY2tzb24ubGVlQGNoaXBz
bm1lZGlhLmNvbT47IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gaHZlcmt1aWwtY2lzY29AeHM0YWxs
Lm5sOyBzZWJhc3RpYW4uZnJpY2tlQGNvbGxhYm9yYS5jb207DQo+IGJvYi5iZWNrZXR0QGNvbGxh
Ym9yYS5jb207IGRhZm5hLmhpcnNjaGZlbGRAY29sbGFib3JhLmNvbQ0KPiBDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsYWZsZXku
a2ltDQo+IDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJuaWNoQHRpLmNvbTsgaHZl
cmt1aWxAeHM0YWxsLm5sOyBOYXMNCj4gQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUkVTRU5EIFBBVENIIHYwIDAvM10gUGVyZm9ybWFuY2UgaW1wcm92
ZW1lbnQgb2YgZGVjb2Rlcg0KPiANCj4gSGksDQo+IA0KPiBMZSBtZXJjcmVkaSAxOSBtYXJzIDIw
MjUgw6AgMTI6NTAgKzA5MDAsIEphY2tzb24ubGVlIGEgw6ljcml0wqA6DQo+ID4gRnJvbTogSmFj
a3NvbiBMZWUgPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT4NCj4gPg0KPiA+IFRoZSB3YXZl
NSBjb2RlYyBkcml2ZXIgaXMgYSBzdGF0ZWZ1bCBlbmNvZGVyL2RlY29kZXIuDQo+ID4gVGhlIGZv
bGxvd2luZyBwYXRjaGVzIGlzIGZvciBpbXByb3ZpbmcgZGVjb2RlciBwZXJmb3JtYW5jZS4NCj4g
Pg0KPiA+IHY0bDItY29tcGxpYW5jZSByZXN1bHRzOg0KPiA+ID09PT09PT09PT09PT09PT09PT09
PT09PQ0KPiA+DQo+ID4gdjRsMi1jb21wbGlhbmNlIDEuMjguMS01MjMzLCA2NCBiaXRzLCA2NC1i
aXQgdGltZV90DQo+ID4NCj4gPiBCdWZmZXIgaW9jdGxzOg0KPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB3YXJuOiB2NGwyLXRlc3QtYnVmZmVycy5jcHAoNjkzKTogVklESU9DX0NS
RUFURV9CVUZTDQo+ID4gbm90IHN1cHBvcnRlZA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB3YXJuOiB2NGwyLXRlc3QtYnVmZmVycy5jcHAoNjkzKTogVklESU9DX0NSRUFURV9C
VUZTDQo+ID4gbm90IHN1cHBvcnRlZA0KPiA+IMKgwqDCoMKgwqDCoMKgIHRlc3QgVklESU9DX1JF
UUJVRlMvQ1JFQVRFX0JVRlMvUVVFUllCVUY6IE9LDQo+ID4gwqDCoMKgwqDCoMKgwqAgdGVzdCBD
UkVBVEVfQlVGUyBtYXhpbXVtIGJ1ZmZlcnM6IE9LDQo+ID4gwqDCoMKgwqDCoMKgwqAgdGVzdCBW
SURJT0NfRVhQQlVGOiBPSw0KPiA+IMKgwqDCoMKgwqDCoMKgIHRlc3QgUmVxdWVzdHM6IE9LIChO
b3QgU3VwcG9ydGVkKQ0KPiA+DQo+ID4gVG90YWwgZm9yIHdhdmU1LWRlYyBkZXZpY2UgL2Rldi92
aWRlbzA6IDQ2LCBTdWNjZWVkZWQ6IDQ2LCBGYWlsZWQ6IDAsDQo+ID4gV2FybmluZ3M6IDIgVG90
YWwgZm9yIHdhdmU1LWVuYyBkZXZpY2UgL2Rldi92aWRlbzE6IDQ2LCBTdWNjZWVkZWQ6IDQ2LA0K
PiA+IEZhaWxlZDogMCwgV2FybmluZ3M6IDANCj4gPg0KPiA+IEZsdXN0ZXIgdGVzdCByZXN1bHRz
Og0KPiA+ID09PT09PT09PT09PT09PT09PT09PQ0KPiA+DQo+ID4gUnVubmluZyB0ZXN0IHN1aXRl
IEpDVC1WQy1IRVZDX1YxIHdpdGggZGVjb2Rlcg0KPiA+IEdTdHJlYW1lci1ILjI2NS1WNEwyLUdz
dDEuMCBVc2luZyAxIHBhcmFsbGVsIGpvYihzKSBSYW4gMTMzLzE0NyB0ZXN0cw0KPiA+IHN1Y2Nl
c3NmdWxsecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW4gNjguNTE3IHNlY3MNCj4gPg0K
PiA+ICgxIHRlc3QgZmFpbHMgYmVjYXVzZSBvZiBub3Qgc3VwcG9ydGluZyB0byBwYXJzZSBtdWx0
aSBmcmFtZXMsIDEgdGVzdA0KPiA+IGZhaWxzIGJlY2F1c2Ugb2YgYSBtaXNzaW5nIGZyYW1lIGFu
ZCBzbGlnaHQgY29ycnVwdGlvbiwNCj4gPiDCoDIgdGVzdHMgZmFpbCBiZWNhdXNlIG9mIHNpemVz
IHdoaWNoIGFyZSBpbmNvbXBhdGlibGUgd2l0aCB0aGUgSVAsIDExDQo+ID4gdGVzdHMgZmFpbCBi
ZWNhdXNlIG9mIHVuc3VwcG9ydGVkIDEwIGJpdCBmb3JtYXQpDQo+ID4NCj4gPiBSdW5uaW5nIHRl
c3Qgc3VpdGUgSlZULUFWQ19WMSB3aXRoIGRlY29kZXIgR1N0cmVhbWVyLUguMjY0LVY0TDItR3N0
MS4wDQo+ID4gVXNpbmcgMSBwYXJhbGxlbCBqb2IocykgUmFuIDc4LzEzNSB0ZXN0cyBzdWNjZXNz
ZnVsbHnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluDQo+ID4gMzUuMDE1IHNlY3MNCj4g
DQo+IEknZCBiZSBtb3JlIGNvbmZvcnRhYmxlIGlmIEkgY291bGQgZ2V0IHRlc3QgcmVwb3J0IHVz
aW5nIDIgb3IgMyBwYXJhbGxlbA0KPiBpbnN0YW5jZXMuDQo+IA0KPiBBbHNvLCBoYXZlIHlvdSBj
b25kdWN0ZWQgbWFudWFsICJzZWVrIiB0ZXN0cywgYW5kIHN0cmVzcyB0ZXN0ZWQgdGhlDQo+IGR5
bmFtaWMgcmVzb2x1dGlvbiBjaGFuZ2VzID8gV2UgZG9uJ3QgaGF2ZSBhdXRvbWF0ZWQgdGVzdHMg
Zm9yIHRoZXNlDQo+IGFueXdoZXJlIHlldC4NCj4gDQo+IE5pY29sYXMNCj4gDQoNCkkgd2lsbCB0
ZXN0IHRoZW0gYW5kIHVwZGF0ZSBpdC4NCg0KVGhhbmtzDQpKYWNrc29uDQoNCj4gPg0KPiA+ICg1
NyBmYWlsIGJlY2F1c2UgdGhlIGhhcmR3YXJlIGlzIHVuYWJsZSB0byBkZWNvZGXCoCBNQkFGRiAv
IEZNTyAvIEZpZWxkDQo+ID4gLyBFeHRlbmRlZCBwcm9maWxlIHN0cmVhbXMuKQ0KPiA+DQo+ID4N
Cj4gPiBKYWNrc29uIExlZSAoMyk6DQo+ID4gwqAgbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTog
SW1wcm92ZSBwZXJmb3JtYW5jZSBvZiBkZWNvZGVyDQo+ID4gwqAgbWVkaWE6IGNoaXBzLW1lZGlh
OiB3YXZlNTogUmVkdWNlIGhpZ2ggQ1BVIGxvYWQNCj4gPiDCoCBtZWRpYTogY2hpcHMtbWVkaWE6
IHdhdmU1OiBGaXggTnVsbCByZWZlcmVuY2Ugd2hpbGUgdGVzdGluZyBmbHVzdGVyDQo+ID4NCj4g
PiDCoC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS1oZWxwZXIuYyB8wqAgMTAg
Ky0NCj4gPiDCoC4uLi9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUtZGVjLmPCoMKgwqDCoMKg
wqDCoMKgIHwgMzYxDQo+ID4gKysrKysrKysrKy0tLS0tLS0tDQo+ID4gwqAuLi4vY2hpcHMtbWVk
aWEvd2F2ZTUvd2F2ZTUtdnB1LWVuYy5jwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA4ICstDQo+ID4g
wqAuLi4vcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LmPCoMKgwqAgfMKgIDY5
ICsrKy0NCj4gPiDCoC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHVhcGku
YyB8wqAgMjUgKy0NCj4gPiDCoC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12
cHVhcGkuaCB8wqAgMTIgKy0NCj4gPiDCoDYgZmlsZXMgY2hhbmdlZCwgMzA3IGluc2VydGlvbnMo
KyksIDE3OCBkZWxldGlvbnMoLSkNCg==

