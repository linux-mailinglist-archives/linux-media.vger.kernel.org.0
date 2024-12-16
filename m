Return-Path: <linux-media+bounces-23448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F159F29D1
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 07:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1DF18862D9
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 06:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6289D1CD21E;
	Mon, 16 Dec 2024 06:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="DMQ1P7Rt"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022103.outbound.protection.outlook.com [40.107.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC651CCEDB;
	Mon, 16 Dec 2024 06:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734329041; cv=fail; b=ouknnDw+kbClhc8+paoKtoDH2U6F6fmqntF+U83gelYkL6dictiQkjCEAPq0kTW+IW0RH+zKrq2q/jYap3l0n0qkQ2Dr7qlzi7S7cCc6oP8xo8RLvZ5MZKxOb/CzXKZkIUnDujKcy4DCi+FC+q2MH8Tldy5Hprh/XMlo5eyIC2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734329041; c=relaxed/simple;
	bh=upfp/EtBSZpJ1Ox5KIQ9zgsQEwHQXfH6puSSlLzJV68=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=phxG4suDrV8QSCM1rr/3g9XGdqpLih/nD53W41X4RPwwmEm0CLJU2oVovqND5x+gGP/e/D2LaU7+4d8o8G2h8u1jrAkA/4+XfVBsinRYlYq9/vSt63THbV+IXvrMsdo30pj60m12YDSCEHspcahgXqhdDjA6PwZYA6YqCIGMpxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=DMQ1P7Rt; arc=fail smtp.client-ip=40.107.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyHmikcyX1SUWSnqRk5qa5cfk0k/IEjuu8aR3WaOW6gG/PtPMdRx7UTuERPrBBqPr/IvtXdYPaNByZCu8LrbVoE6UDF3zkOTg3+Hpu2vlz0vsn2BdOptEzsl6Lc6JkQfMRkCNGDkGOZQGLaoPUvAW31rDGHeGFOaCRVp++9sNWLjwWgnrI16ottErKJwgYYVSFqcbmDMCjczVLqDyb2ufLGzwc2iXc//r/Py0/rDsatgl6WQtHy4fULrHNt8tqrVWr/uAVHVuCves6zahsEOkK+QSnx1200ZgMALqZGc/7IqUjZRyfWw5SB0wM3PrbKDpKMcbtLxL1SkJK2pufpLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upfp/EtBSZpJ1Ox5KIQ9zgsQEwHQXfH6puSSlLzJV68=;
 b=kGAosDRiCGsDLFwmDHSv7+DBfYTwIfc/sk+ZCytYtBIWD3Sh4YapTlJsl9M+6Sv16Ce2gXA1QpflYswrCEpS80FlZMpWm7aXhaHvtZxfQbHb9Pdev1RoWsf7OQMxa13fByz5PqKqBjo47x6BUUwbuI9ofYTnBcmOE2fGG6eL4uiDq/42sOBym6SWmFSo4JtOudyO+hT2DL+Fjq4vN5QyIcR8RC4/lo2Rplqk2VEEMy/LATeSeTJyCJjTBrWv+ll20SIZQYHe+9pGHhT4dns1aF1Z5YkcBqL0MckbtqVr0ICfnyOR2yWG4/ORq/5oZrmrizQhQz2wgOzL8EbDz9oBPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upfp/EtBSZpJ1Ox5KIQ9zgsQEwHQXfH6puSSlLzJV68=;
 b=DMQ1P7RtnKiun6xnidnZheZAfk/c8h/KsDofMYHUmtxPGhEa9EhwBdSq/uyFYvpkbFrmCyslK5G/w1ht0s/EC1JjHHXrfu35hIM1yBkt+eQVHFoyH0z6JYNmyki+Gwo0MvdyHR6Yq1hsgGAu+B1U7m2hUEDuBhgR+Q3311EkgTo=
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SE1P216MB1509.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 06:03:54 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%3]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 06:03:54 +0000
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
Subject: RE: [PATCH v1 5/5] media: chips-media: wave5: Fix timeout while
 testing 10bit hevc fluster
Thread-Topic: [PATCH v1 5/5] media: chips-media: wave5: Fix timeout while
 testing 10bit hevc fluster
Thread-Index: AQHbSfxhSieJaxt5k0+06hxVNmA9ZbLkngQAgAPNzuA=
Date: Mon, 16 Dec 2024 06:03:54 +0000
Message-ID:
 <PS2P216MB12976F50DE4003CAEB95D2A4ED3B2@PS2P216MB1297.KORP216.PROD.OUTLOOK.COM>
References: <20241209053654.52-1-jackson.lee@chipsnmedia.com>
	 <20241209053654.52-6-jackson.lee@chipsnmedia.com>
 <c7630341600fa157265459f5fac49ec74c013ca7.camel@collabora.com>
In-Reply-To: <c7630341600fa157265459f5fac49ec74c013ca7.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS2P216MB1297:EE_|SE1P216MB1509:EE_
x-ms-office365-filtering-correlation-id: 3e30c74f-5236-42bc-f86d-08dd1d976bf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TFVrWUg1ZlpiclplUWZXb24ydVZGMGJvWGJjbUpXWHVRTE5RaGtWN3JjRTk2?=
 =?utf-8?B?SmxFejJCU0NUT0lhNFNqRWE3a3hJNVhBRURxT3JMcVFjalBEY2luVmNmTzIy?=
 =?utf-8?B?MG1Ybk1WU25ma0UvN0Jab3pGRWJpYXQ3YTIxNHAxbjR4QWJMQlBBY0NQcjlU?=
 =?utf-8?B?VzE2eG52VmI0NGNlZ3lzQTdrR05raVRRdk9BUjY4ZysrYll4SW12ZXF4dExW?=
 =?utf-8?B?cDRaekVFQThteW1wWHdQcjlPdE51eUdacXF0L3NmM3JMVmh1d2c5V3hLbGMv?=
 =?utf-8?B?aklWTldHbmlPK3REelBpN1JtNWYyRkt6ak1zNlAvNlNXeWk1dWRWNnVYZzBu?=
 =?utf-8?B?NDkyZFFUajVOOTVnay9TUkRxRERvU3o3SEdPTVkwS050Z0kxRjdFVGw0ZGlN?=
 =?utf-8?B?WThxTUZvTUpmOHh0cWlGZVRHUUFSRkFYNUVWMjdBVjdRTzJsYTRETloxZk5S?=
 =?utf-8?B?MXF4TFpCVHc5MFZmZ3VWbW1XSTBOMlMzOTlsNlEzQ1ZncHBrcWx0ZlBPMngz?=
 =?utf-8?B?cWxqUlpuTW4xL2NvQkJSc08xUWRxelQyV3dmL3JENWpYL1dnRGwvanh5WVdL?=
 =?utf-8?B?TzA1VCt6RkZtUzVEVjMyRWlRMjNWN1I5bDE4Z1JNTVIrL2RDeVUvZTFHYXps?=
 =?utf-8?B?eDNINGxsVUNKS3JRam9QWUZFYWpPVGhyZGcvSWdLc1lJU1Y0ekJ2SVY3RXhZ?=
 =?utf-8?B?T2hxN20ycXlXbGpiSXRYNWl2YTFLL1FTVFZrbUNFd1c4WTF5QUxmejFJODJE?=
 =?utf-8?B?a2lCN05BTHlnZSs5NTdxUU13c2tnS3A2KzlFY1Z5R2RyWjBkWVF6c25Hbjd1?=
 =?utf-8?B?QTBJMEtCVHpYTzBDUStsOVlDVXdmTFNOaDhnRndEMVE5T05aOHV1WisxbnZL?=
 =?utf-8?B?WHhXNk1OcDNsL2lreFliSXM3ZktYbS83VWI3SVdRR3lEMFVrdTJPTG9uL3py?=
 =?utf-8?B?ZW9XWDZOUDl4V0I1ZjhRTVJJQmVvdFlrL0lrOGRKemxNVElqWU02ZkRPWkxJ?=
 =?utf-8?B?YmpjMlNxYkc3RzBJMStIQzFPWFJ4ZWZtNXBhamlCejh4WSt3bVlSOUpiOHRY?=
 =?utf-8?B?cTgwYmt6MUJ3UkExZ251Vlp5c0twZTFpeWhkdWxuM292Z1krYndrckVkOHlo?=
 =?utf-8?B?amljRGUzV0VWZVhUNFljRmdXTjRDd0RWZXRRNzVzOXRuNGFteFNndHhBNVhH?=
 =?utf-8?B?b2ozeTF4RFJBT25uR0Zad3ZRSEozQmlYY3pwdkU5NXhqZGJacUdLcHJtcnh4?=
 =?utf-8?B?aTc2UDlidlFYeE5UdVBPcnhaV3YwUjhHOEJpa0tyQ2w2ekhsajFvcTN6cUJE?=
 =?utf-8?B?UUlNdVdrTUtKcTZXUHNKMzNHSHMyQ3pVTitKVzh0b2pHWjhoNzhuUEhFelNn?=
 =?utf-8?B?UzZKRkFyQU5LWGRQQmIwTjczZUZCMExoSkRWTFlmYkNTU0tVUGNwNHVjd3Nk?=
 =?utf-8?B?Y0dnSDIvWkdrS3ZEWVZYUWNMVnIvekZPVHRYSjUvWmVNanU4UHpSL2NGS1Bo?=
 =?utf-8?B?Unl6aTh3ZzBnQjdEcURUMEFBcXZybmlnRnFHdWxKN2pRRitxdEhtYXJPMlFW?=
 =?utf-8?B?aFRxMkhBaXRjd2NUeEliU0I5Y3ZFL3ZVWGlUTE95T2ZHSSt0ZDlia3dQd0hB?=
 =?utf-8?B?UUN0NEhhK0RtU2k1eThObkRqOHpQbGx5Uis4QUFLT1ArazBtTi95cUdQWExY?=
 =?utf-8?B?dHBiVVJQNVB6bnljTjV0Vk85MWVZb3I1cGlMU3NTdnc4Q1BoTDRVTWMyU28v?=
 =?utf-8?B?b0tUNXlpK1ZORnI1N3lFRjhzZU5JTTVEU2d1SndXS3h4N0cxMCtGaVlNZFNH?=
 =?utf-8?B?bkpRbW9WdGxHY3dNNzRScUg4WTNUbHlIdXY5ZHl0YlZVekNqcXoranB4QlVX?=
 =?utf-8?B?RDFTaTBYbXFrUlh6dkNvdklLN1JwempCK2EwVkZrTEV4VTRlaGpETEJlZUZP?=
 =?utf-8?Q?VNB2WZ3rEnA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1hVQWs1eDhlYStHdGJsT3lLVW5sYm5SZ1JwRXRVMmllbnpQYm9WVWl5VHVs?=
 =?utf-8?B?SUhROXl2anEwT0ZEdC96RmRKckRjdWxxZkUyZWxWRjBCOW9tWlRQbnFGcmV2?=
 =?utf-8?B?VytBdysxZmYvZ2h3eFpTYkJIeVpiZ3gvK3BBZU4wbFJFb29VVlNkSG9GSVVJ?=
 =?utf-8?B?Qk1acGpqYnZTK1dOTmN5NFBxcFB6UVRTczlGd2MzRW5yWUtTUUFiaTluZHpx?=
 =?utf-8?B?b1lzNzgwb2dBNWZVdDZURGZQYVVTZlgyYldZeEhaS2hWUGcwTTU3OGUyOTF5?=
 =?utf-8?B?cis4MEZMdVlCSnN1ajJJVVRCbk5LWGJjczkybmJFcTBTQUFWNVJOTmxUbE85?=
 =?utf-8?B?akJnS1FVK2RIS0JKcjlyMm90WUJuTVI2c2dEQlVVZy82ekpZclZtTk05RU1O?=
 =?utf-8?B?ejVpbFcrVktPVnlWV3FTalNSWEdZN21BaUVyZjRxZGNoVnVLTEMvV2FkYTZR?=
 =?utf-8?B?QTVBMkNESVB3Y0gzdlJpeFVTajFTMVlnSWlKNmtKY2w1NUNzZzBBWmxpRDBJ?=
 =?utf-8?B?Wks5R3poYUJySU5hcnVXaGsvVEUzWXJrQi9uZ21GNEJibGdzNnF2YWR4Z0lQ?=
 =?utf-8?B?TFRGNzl5YU04cGFqU0h3ZWQreU9OcHdBTHlPMklwQytvMlFqSjRGV0Y0TUxm?=
 =?utf-8?B?R0NoNUxwZm05Q05wN3ZoVlB3ajNFQzhia2JlT2tsNkhEN2ZKa0FTVVlGc0hF?=
 =?utf-8?B?VkovaDM4RllESk1IcmdBWXJrczRFbDdxWm9qd1g0UkFidy9sakNXamxUcUwr?=
 =?utf-8?B?UkFaejNSWjZLUG9EazdEWW5wOW8zWmtBc3cweW9xdnZzanRnVDM1K2p0aU9H?=
 =?utf-8?B?cmpPcCtQRkhPb1FuOHowek1qRGtCdkFBNUpNa0tJa3h5V2M3NVRabXg4OTB5?=
 =?utf-8?B?SXIxdERyT21KZ3dqWnIrZm5QdTZMRHBzRjE3UmZuQlVNZW96UzJKeHo1OFoy?=
 =?utf-8?B?M2lEMWNBR1NuTzFBTThvSEdWRjJzYWFIUElZd28vK1ZkdDBIbmo5K3VpZWwv?=
 =?utf-8?B?Rkc1c3haSHNKRFhNQjB2VUVKc2ErR1ZnK0NmaWdlYk8vUHcyWUNLOGR0ZVcr?=
 =?utf-8?B?cWpvSTd3RlBreU1qZDhlS0h6azJKYmxQd0ZwZDlPRE9UZWhsV2h5eGNPVmZi?=
 =?utf-8?B?Z0lQM2Y4WjNucFRtQUFacEdWeDlFZWw0alpRRVhHK0dBYXVsM2lTTTV6ejRB?=
 =?utf-8?B?c3RoUDNuWnR6YkJwNDRxeGVLNk9RUlg0Sjd5amdpWjQ4R3d5ZFQ2VlZBakh1?=
 =?utf-8?B?ajVua1dwd0JoeU1tT2NPQ3VOekRZVnNZWDFBSjVhOG1OM1ZMRTh0VjNEUU4v?=
 =?utf-8?B?Z3RiYWtUSXZPNUVHRDNKa205cnBsM3RiZlZIRmh1QzN6d2NyTzBLeEV4U2Zp?=
 =?utf-8?B?ck00R2ZJZkp6OFVrNEsxcmdybE01aCtDUFdaeW4yejVjSCtLWXVFYXUyci9i?=
 =?utf-8?B?N1poWHFQc3J3TUI0bVF3R1ZsSGU2NnVoZE1tWUdjcEZWZXJRWndHVU00ejN6?=
 =?utf-8?B?bjFtV1doajRHN2ZERCt3eUlKOWs2YWRqU1ZBbnF0SG8vUHRSU3JBYlVweWth?=
 =?utf-8?B?RkFuYjFqWXFSaVNqZWYxTStiQ3dhTlE5M0pJWkllQ0NXRUpIOXgwRGVFNm5O?=
 =?utf-8?B?cWJ5aExXaG1TVHFWcDhzYUxoSmhrbk03Mm01bDIxTWpmMHhJSTBRQmM3bnVF?=
 =?utf-8?B?UWh6SmNFR0syY1c2dmIyTEZKWlFjMFA1VVVyZUlIbXJrMnF3T3piMW91b2ZU?=
 =?utf-8?B?Y2pvUExWUDJjcDFTdGtoNWpqNUlzMURKSWgzNDAreDRhKzdLdFc2TjByZzh4?=
 =?utf-8?B?eE5PSWpSR3dNLzFjTnZ4eWlLQWpiR2hxTWY4djZzTFBFSzZWTzd0UmpUczZk?=
 =?utf-8?B?NkhUVmVFZ1RXbS9TMjVTMDVBRGt2NXo0Z0V5NFNDbHdSQ0tFU1lvMEdPOU1N?=
 =?utf-8?B?Y0JsWEF3R0Uwb096bzRqbDBtUURycnFUb1ZRZzdqcVdqYThTVUpRQzRxUW9x?=
 =?utf-8?B?c2hTZU5wS3ZjTzZ2b1BZWjIrT2cyVFo2cVB4eWFGd3AwcnI0SE1mS25qM1Uy?=
 =?utf-8?B?WnBLOStISWpvbEYxNzVZODFQcm5uNDdwSytPNGgwM1hsVmM5M3kvUUw4SHVq?=
 =?utf-8?B?bzRldUlaNDYxZHlldC9TUS92VWYzTzVhU2V2b3hsZHhDKzhSRjh1c0FwSStD?=
 =?utf-8?B?bFE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e30c74f-5236-42bc-f86d-08dd1d976bf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 06:03:54.4383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DC/4+0c2LKTx+pLIoqV+qtEF1E91mkfZdqfnAythheywTnng4nFiGhahIYP0uejvHvnpKViqbGaKRXe4vzQZWnVfAA+YzW7b55LQuFv+450=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1509

SGkgTmljb2xhcw0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KSSB3aWxsIHByZXBhcmUgMS81
LCAyLzUsIDQvNSBhbmQgNS81IHNlcGFyYXRlbHkgIHBhdGNoZXMgZm9yIHVwc3RyZWFtLg0KDQoN
CkphY2tzb24NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmljb2xhcyBE
dWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0KPiBTZW50OiBTYXR1cmRh
eSwgRGVjZW1iZXIgMTQsIDIwMjQgNDo1NiBBTQ0KPiBUbzogamFja3Nvbi5sZWUgPGphY2tzb24u
bGVlQGNoaXBzbm1lZGlhLmNvbT47IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gaHZlcmt1aWwtY2lz
Y29AeHM0YWxsLm5sOyBzZWJhc3RpYW4uZnJpY2tlQGNvbGxhYm9yYS5jb207DQo+IGJvYi5iZWNr
ZXR0QGNvbGxhYm9yYS5jb207IGRhZm5hLmhpcnNjaGZlbGRAY29sbGFib3JhLmNvbQ0KPiBDYzog
bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBsYWZsZXkua2ltDQo+IDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJuaWNoQHRp
LmNvbTsgaHZlcmt1aWxAeHM0YWxsLm5sOyBOYXMNCj4gQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25t
ZWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgNS81XSBtZWRpYTogY2hpcHMtbWVk
aWE6IHdhdmU1OiBGaXggdGltZW91dCB3aGlsZQ0KPiB0ZXN0aW5nIDEwYml0IGhldmMgZmx1c3Rl
cg0KPiANCj4gTGUgbHVuZGkgMDkgZMOpY2VtYnJlIDIwMjQgw6AgMTQ6MzYgKzA5MDAsIEphY2tz
b24ubGVlIGEgw6ljcml0wqA6DQo+ID4gNTIxQyBXYXZlNSB2YXJpYW50IGRvZXMgbm90IHN1cHBv
cnQgMTAgYml0LiBXaGVuIDEwIGJpdCBzdXBwb3J0IGZvcg0KPiA+IDUxNSB2YXJpYW50IHdhcyBh
ZGRlZCwgdGhlIGNvZGUgd2hpY2ggcmV0dXJucyBhbiBlcnJvciB3YXMgcmVtb3ZlZC4NCj4gPiBX
aGlsZSB0ZXN0aW5nIDEwYml0IGhldmMgZmx1c3RlciBvbiB0aGUgNTIxQyBodywgdGltZW91dCBo
YXBwZW5lZC4NCj4gPg0KPiA+IEZpeGVzOiAxNDNlN2FiNGQ5YTAgKCJtZWRpYTogY2hpcHMtbWVk
aWE6IHdhdmU1OiBzdXBwb3J0IGRlY29kaW5nIEhFVkMNCj4gPiBNYWluMTAgcHJvZmlsZSIpDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNrc29uLmxlZSA8amFja3Nvbi5sZWVAY2hpcHNubWVk
aWEuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hcyBDaHVuZyA8bmFzLmNodW5nQGNoaXBzbm1l
ZGlhLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dh
dmU1LXZwdS1kZWMuYyAgICAgfCAxNCArKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LWRlYy5jDQo+ID4gYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdS1kZWMuYw0KPiA+IGlu
ZGV4IGNlM2ZjNDdkYzlkOC4uMjg0NjJlMDFjYTI3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LWRlYy5jDQo+ID4gKysr
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUtZGVj
LmMNCj4gPiBAQCAtMTQwNiwxMCArMTQwNiwyNCBAQCBzdGF0aWMgaW50IHdhdmU1X3ZwdV9kZWNf
c3RhcnRfc3RyZWFtaW5nKHN0cnVjdA0KPiB2YjJfcXVldWUgKnEsIHVuc2lnbmVkIGludCBjb3Vu
dA0KPiA+ICAJCWlmIChyZXQpDQo+ID4gIAkJCWdvdG8gZnJlZV9iaXRzdHJlYW1fdmJ1ZjsNCj4g
PiAgCX0gZWxzZSBpZiAocS0+dHlwZSA9PSBWNEwyX0JVRl9UWVBFX1ZJREVPX0NBUFRVUkVfTVBM
QU5FKSB7DQo+ID4gKwkJc3RydWN0IGRlY19pbml0aWFsX2luZm8gKmluaXRpYWxfaW5mbyA9DQo+
ID4gKwkJCSZpbnN0LT5jb2RlY19pbmZvLT5kZWNfaW5mby5pbml0aWFsX2luZm87DQo+ID4gKw0K
PiA+ICAJCWlmIChpbnN0LT5zdGF0ZSA9PSBWUFVfSU5TVF9TVEFURV9TVE9QKQ0KPiA+ICAJCQly
ZXQgPSBzd2l0Y2hfc3RhdGUoaW5zdCwgVlBVX0lOU1RfU1RBVEVfSU5JVF9TRVEpOw0KPiA+ICAJ
CWlmIChyZXQpDQo+ID4gIAkJCWdvdG8gcmV0dXJuX2J1ZmZlcnM7DQo+ID4gKw0KPiA+ICsJCWlm
IChpbnN0LT5zdGF0ZSA9PSBWUFVfSU5TVF9TVEFURV9JTklUX1NFUSAmJg0KPiA+ICsJCSAgICBp
bnN0LT5kZXYtPnByb2R1Y3RfY29kZSA9PSBXQVZFNTIxQ19DT0RFKSB7DQo+ID4gKwkJCWlmIChp
bml0aWFsX2luZm8tPmx1bWFfYml0ZGVwdGggIT0gOCkgew0KPiA+ICsJCQkJZGV2X2luZm8oaW5z
dC0+ZGV2LT5kZXYsICIlczogbm8gc3VwcG9ydCBmb3IgJWQNCj4gYml0IGRlcHRoIiwNCj4gPiAr
CQkJCQkgX19mdW5jX18sIGluaXRpYWxfaW5mby0+bHVtYV9iaXRkZXB0aCk7DQo+ID4gKwkJCQly
ZXQgPSAtRUlOVkFMOw0KPiA+ICsJCQkJZ290byByZXR1cm5fYnVmZmVyczsNCj4gPiArCQkJfQ0K
PiA+ICsJCX0NCj4gDQo+IExldCdzIHRha2UgdGhhdCBmaXggZm9yIG5vdywgYnV0IGNvbnNpZGVy
IGZpbGxpbmcgc29tZSBjYXBhYmlsaXRpZXMgZmxhZw0KPiBpbiB0aGUgbG9uZyB0ZXJtIHNvIGFz
IG1vcmUgdmFyaWFudCBnZXQgZW5hYmxlIHdlIGRvbid0IGVuZHVwIHdpdGggdG9uZXMNCj4gb2Yg
cHJvZHVjZV9jb2RlID09IGJyYW5jaCBhbGwgb3ZlciB0aGUgcGxhY2UuIEFsc28sIHBsZWFzZSBz
ZW5kIHRoYXQgb25lDQo+IHdpdGggMS81IGFuZCAyLzUgc2VwZXJhdGx5IChwZXJoYXBzIDQvNSB0
b28gaWYgYXBwbGljYWJsZSkuDQo+IA0KPiBSZXZpZXdlZC1ieTogTmljb2xhcyBEdWZyZXNuZSA8
bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0KPiANCj4gcC5zLiBpdHMgYmV0dGVyIHRv
IHNwbGl0IHRoZSBvYnZpb3VzIGZpeGVzIHRoYXQgYXJlIGd1YXJhbnRpZWQgdG8gZ28NCj4gcXVp
Y2tseSBmcm9tIHZlcnkgY29tcGxleCBjaGFuZ2VzLiBTcGVjaWFsbHkgdGhhdCB0aGVzZSBhcmUg
aW1wb3J0YW50IGJ1Zw0KPiBmaXgsIHdoZXJlIHRoZSBvdGhlciBjaGFuZ2UgaXMgZm9yIHBlcmZv
cm1hbmNlIGltcHJvdmVtZW50LiBUaGlzIG1ha2VzIHRoZQ0KPiBtYWludGVuYW5jZSBvZiB5b3Vy
IGRyaXZlciBhIGxvdCBtb3JlIHJlc3BvbnNpdmUgdG8gbWFqb3IgaXNzdWVzLg0KPiANCj4gPiAr
DQo+ID4gIAl9DQo+ID4gIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KGluc3QtPmRldi0+ZGV2
KTsNCj4gPiAgCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGluc3QtPmRldi0+ZGV2KTsNCg0K

