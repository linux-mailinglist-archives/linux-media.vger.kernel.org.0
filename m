Return-Path: <linux-media+bounces-42149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA208B50E99
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 08:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFB94189E2DD
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 07:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B617E3054D7;
	Wed, 10 Sep 2025 06:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="jetP008s"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021101.outbound.protection.outlook.com [40.107.42.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C885B1798F;
	Wed, 10 Sep 2025 06:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757487576; cv=fail; b=g1pMvW6NMpp1J87gwLnRYqFBXagA8XPcTMIjgUlh5qp/419dhYhmmmvp/1+D2lRg/kU5DNXzlfhWEfXYRS1rFDa4nlL6JPiA1XKz/Ys4DK6sSpKzIUvfUjoq4T30/7/vxnAXanD4pk90NaWiIUITohd1Sr2cmYyJmW0W8q04Vy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757487576; c=relaxed/simple;
	bh=LrkhzA27S5fzpgavr7Y23o7qfOB+sLcCdPFHqOe9iC0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y0EmCFQaEaPiyyL3CPUHQfpR5G1dGmaooDbFqHgyy9uicIMrjl5C5B2ROSCMN1/qArYDvee2mJJ0Pm6aAu6j0wQHrs5yRfG3tDQjpT28XjR9PrtwFJ7Dn7fr4Sg+wBUQahISPYYrWmJa3hkxNYhmK8thnu8x1ng2PAWQyeKWEsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=jetP008s; arc=fail smtp.client-ip=40.107.42.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqfrJPZzm+xUObqZsFBqmjeCaESUBlXX4EuLyj3VXvWeHZMLLfkciNsvZWQt0tmBl+RXWhQnrkXIXYtqQLeMQpU6cipmv41jwDvIGuTXHXMcy1NTx6It/vTtuwkxEZppzfm3t74pX3PBTdxRql/qZkP1/VN9WVTnYnXiylsCW+vJ5U+mP/a1NADh8Hf9tq9cmNCy2sa8n3ifotAnh7QWLeTnvc200nBXoI6wyfrNwojz2qioJcWImG10406v/g9E1oV7UfPfJaxEf4PI1h9rjPsR9vZHoabhktbL5pD0FlTc/Zj6ZSOgWj49bkFgaabGtmV0DwdZndTIGQIGEsK0Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrkhzA27S5fzpgavr7Y23o7qfOB+sLcCdPFHqOe9iC0=;
 b=Qh5Y6QilLXkkAfZk/bOrmtUjgpr15HJZ7kUZbud+VXb/2llQppWSsy4TICYmM3OPUWX9YZqovqqBJCIfEWqjf4NzzgFuHV7I5l/WNalE0URjAZsOEigS8JQARePTAfBpMYHMv4yULkG2dQck1VYRLCykqos2N2ibra+mNmCsPVeBsoZhlnsi9gUBcP0tXEOtrgk6uLT/+b1mt7cYEE+2ebwS7M8BbX1e9Q5u9Ixrfhr4OofptGKXgzsaGiL9035Hdfp7AxdUvsMvlXndAPxD89ZWBBBoFKi3hlDLH54bsBrLfpDiLMEdNtHBQaifxyZwoGwwKtkSyuEZjrmxYGLp0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrkhzA27S5fzpgavr7Y23o7qfOB+sLcCdPFHqOe9iC0=;
 b=jetP008s6F1RvjPWjd5642ZpKJoqHKvCVPwv2bP8tPFTNh004eU1qA378mSDbrF5/LjeUwFP4PpUGL14G0xF7ITwNQy0Zss2fCOf+dbApt72goTX7v20OiwtC7zWfUjX5dibaqv9YMUFfIZ+dZUpt7yX240T8fjA/BiDYKrY9yQ=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE1P216MB1431.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.14; Wed, 10 Sep 2025 06:59:28 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%3]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 06:59:28 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v3 0/4] Performance improvement of decoder
Thread-Topic: [PATCH v3 0/4] Performance improvement of decoder
Thread-Index: AQHb49TXwjYLUfVzYE+ALyQbFMjCk7R6LviAgBCrSJCAAQDgAIAAnXDA
Date: Wed, 10 Sep 2025 06:59:28 +0000
Message-ID:
 <SLXP216MB11483F38D23A5BDFC47068EAED0EA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
	 <f79ab2a0db0eb4aad20ed488de3635f9d8942cdf.camel@collabora.com>
	 <SLXP216MB114806E1937625CA3760CA3EED0FA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
 <48540d8ee22cf747d2dd591a7869baf1cba6719e.camel@collabora.com>
In-Reply-To: <48540d8ee22cf747d2dd591a7869baf1cba6719e.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SE1P216MB1431:EE_
x-ms-office365-filtering-correlation-id: 7c6d833a-ea43-4a5d-8976-08ddf03795d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bTlvM0tWNVcxSTJzTllmQ2VIMDZJaHhGVlNHTWh4WU9qS3hQQytWaXBlSGtQ?=
 =?utf-8?B?VFRkajB6Q3ZReGtBakU2TW50ZUVFb0dweGIrQlpQeEFMYnpvMGhZWVlKc2RF?=
 =?utf-8?B?ZjI4T1lxQWlpYklOc3NtNG1BMlF3Z0NIZ0VMTzVrUjNsMkNzbVoxV0x1bnFh?=
 =?utf-8?B?U0JFWVIwNCtOYnRZd1B6bGd4RUZUZjE0dHpTMDZCakxzcWVpS2lSMnVlRVE1?=
 =?utf-8?B?bGw1TkF2VVM0RU42UXYxbE16UVh0ZmQ4SEg3T1NFdnRtZVIrczdBYzUyeDFO?=
 =?utf-8?B?NmVZT3RPUUNMWFJHTU4xRnFzNmJyVjg1UkZXL2g2RGswU1kyaUtVdnB2SkNH?=
 =?utf-8?B?MlVHZzdrSFZ2cmEzNDFaTnpuMjlWanQzdm5WMjg3b1luVWQyUVVsUk5OMndt?=
 =?utf-8?B?V2N6eWlweVB4L055UkdrclMydytGZFh6Nzc3TUdIdzY2MG95SmJUelRLaGxn?=
 =?utf-8?B?NlRlMkJ2ODhhSFZaa1lZTzk2YU5TalVRMnBXYXRSYTMrTHFVbFVoZVBoYmpW?=
 =?utf-8?B?WkJCWG82K1ZmYmZZT2tJRTIvUDZ5cFBmYmZGOEpEWnVjU1h5eDFNbFdXeXkz?=
 =?utf-8?B?eERuTUxPTE9nWnZyQzJRTit6NkFaODV5R0ZiNWJYeXpwOGMvc09TTXhKUmpH?=
 =?utf-8?B?dnFzMTBIdVBGN3NtUTVSUmJjMVlGSmdHV2JUOVltSVExRTVQR3lvQnVlNmJh?=
 =?utf-8?B?RU1LYUtlblNqWk00RmlXYTNsTUZCeWszcE5zU2w1bjNaT2dJc2FvVnZzcGJl?=
 =?utf-8?B?aWpFZDFuTytJQ01NUW00QmE0eHlyZzQ0Wjl6MFFNOHBtVTRKcXJxVXBNWkxj?=
 =?utf-8?B?ZTUwR1huUjdRbm9MS1FOcmFWMHNBNXowOGdGQWRSOGRSSURtT3haOHNvb1I5?=
 =?utf-8?B?Rjhoc3FZaTRJQkRPMTRmVU5DMzJaTG1UaEdsSCtxZFRYQkhCZEFlZ3NWU3Iy?=
 =?utf-8?B?LytCTFg1L0hDczNPYVNyN3NGVDB0TGVFeXJFY0E5dU5QOUU4WnBlWXRqY1ZB?=
 =?utf-8?B?ZjhXa1lDbjJMc2tsWTVpMUYxaStVNWE1S3A5UFF6ZVM0TWFyUDYvNjNTQnlz?=
 =?utf-8?B?L0JWYU5NWFRzbTQyOVdvR25ManZIYmRhNlVzMU9mT1JnYTZ1bE1tNU9PQWRv?=
 =?utf-8?B?Vm80RlZ5VWhSWklZakd3bnA5VTZFcFZtZEd4VGhET2pTMnpjWXl3MjlUK0ZI?=
 =?utf-8?B?RHRLRmw3bXNqY2NteFdQMHFOWWFFUGh0cmEvbzg5UGNUcldTcFVxTUtjaDFO?=
 =?utf-8?B?SWhuMVpNWVhzY2lqQXFZdGpWdDVUSlZwK2JKK1h4NFFmSWhDK2d4YVlObVNq?=
 =?utf-8?B?OGpLM1Nua2NWWUtOMSt2RENDUjJKMmo4Wm00QmZkcitIM3NwU0Z2V1BlV0E1?=
 =?utf-8?B?OE5qUE5XUHFYazNWNTZGL24vUFJDb1hUL2hSZXRYS1dsRmZOWElYalFFQnl2?=
 =?utf-8?B?Nktld0RuTFo5UmN2d0VaalJURjdlOXpEeVBtdjNXWUNmdjd6LzhqUjlINGFp?=
 =?utf-8?B?ZTIwRlpXbnJPL0JoSlMwOTJENk9GbnRqUzExRlQ2bEQrZStOR0FvaUdLMExE?=
 =?utf-8?B?KzQybUhZRmhCcXljd3FMb3ZsaEIzaUdQWSsrZGFNakFvVGFDUmdPejd2b1Z1?=
 =?utf-8?B?cXlTcEdKU1IrMjhDMUJGSUdlVHFXVDAyeEdqYTlkWisySnRFeC9BaWM2bmdu?=
 =?utf-8?B?S0h5STRSeFlCcDMwaHdNZXRjYlpiM2E3RFNkZUFVdWRHS1MyNE95ZU1Fem5R?=
 =?utf-8?B?YzZlbE5DOWhXaFlKUmpQdjhQdHpheE9GeERIaG8zRmFpU1NPUTZHeEZpaFVh?=
 =?utf-8?B?SXdjbzFoYTViMkZvNmhOdC9VMzA5OHJDSkFoZmtLZEY5SzIwQ2NNQjZsTzM3?=
 =?utf-8?B?VitIa09zelgwWGtwLzYwRjFkZGVZenliMWp0Um51RndUZ29XUm91L3lRblk0?=
 =?utf-8?B?dGR6VWV5Qzk3ZzRqTlZTZGlNbE5rcHBwbCsrSE9JS3pZL08wQUVZd1RxYlk1?=
 =?utf-8?Q?+FEo8TkNU9lOw1/EjokTT8I1H/rjJQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T0gyMWowd2x5cWlUSWNJcmJhc2tsd1lQNWZZZzd3T09EYjNOTkxZZ1pQdG55?=
 =?utf-8?B?T1pRR1NiL21ZODE1ejFxQlJVdjhiVUJxekRrakcyYXh0R1AyVk0xNDlKU2c4?=
 =?utf-8?B?am96SkpEOEJTdGFodnNGcFpaSHlaZ2d1ejJ0TFgzUndwTUpVeG1PM2c5K2xw?=
 =?utf-8?B?OE5PRmRsc29hdUc4LzEwNnRqOWppQmc3RXQvV3Q3d3I0QUpSY1I3bkhmQ1BV?=
 =?utf-8?B?MkMwQXBhRHpOUllyNkVpazIyVkpLeGp4MmsyOHg2NVBGcWgwNVBuM2JPdm8v?=
 =?utf-8?B?a21ua3liQTRKcGhnL1FNZ1Nvb3ZsMGxIZGp2bHc1ejBoN0poRnhMc3B3aFgr?=
 =?utf-8?B?NTNodlA5UTA4Yjh4aXdZRlkwWVlsejB5elcxUCtqNDBUNDlJVkdNTnF2cWoz?=
 =?utf-8?B?U3RIbm9TRUQ2djYzOW90MXA4QS9BWS8zcmMrdTltaGgvUWM1MEI4ZFB3WU90?=
 =?utf-8?B?c25GTXNhSFFRSzVqeDMzMG4zZWdZTXdEcWJwMUlNSmdRdjg2SkFaSSsxOWg2?=
 =?utf-8?B?NXlJMldKWlNlL3RnTXVoNHlCSnMycGNteWxyc2RhUGtpaDdpVUdQSVRhY3p2?=
 =?utf-8?B?OC85VEdYdWVoTE41eFdDUVRJWU9WbFBqcXUvRlFvU2doTEJieFNnV1ZHM3ox?=
 =?utf-8?B?eDRwVjJHVGVzRVNneVFvemd1ck9xd1h2alArcmFmNUROVnovaHV3aGRpbzRD?=
 =?utf-8?B?ellxT21RRHgrUWdDOFNabzNoSDZqOTVoc2wyZkhoMUIxL1NhYmpzWkYvWlRO?=
 =?utf-8?B?SHZYS0lCa1hQQmdJL0t1Vkl4RFdBSW1GdWVidERZOHhBVXJZZk52akw2TWNM?=
 =?utf-8?B?OUNXTm1lUFo4TDVTWmk5a3g2ZHBBc040ai94MmtSaitiK1cwZjdvWmJiaUd1?=
 =?utf-8?B?TE05TzFpdFFROS85dUdtK1B2QlJPR2kvMjAwVTRvSnM4TWZpQm5ROERzeEhR?=
 =?utf-8?B?SFBxVGtvWG5sU2F2N2pZWlI4Y3RraHBYWXZ1SDB1citCa0NEK3JiSU9WQlJJ?=
 =?utf-8?B?UVdqZ0pPbzVTZUFoT0tPdXpHaGJGZ2Z4ZGhvU0wyeTJaeWR6bythYmtmYXh3?=
 =?utf-8?B?bW1hZklsT2xDNVBRbnBHbThKemJKR3RxVUd6YnJWUWVaS05lWjMwdnRmT0tx?=
 =?utf-8?B?MFJqSUtSWVJ3NE13V1EybkFSZTIwN2hDQmFxSTNtcXFVaUpJNE5pNkRUUldv?=
 =?utf-8?B?bDNzL1AyN0M5WVpkMXpuMTQ3YkJGUDJJYVd1dXdUTThpeUkrcDhmR0g4Zndh?=
 =?utf-8?B?am52Wld5Q003d3c1QjdNK3NGVW10ZDdLMHl0SXFXNi9rVGN3ZVN4U3crLzRG?=
 =?utf-8?B?YlRJdk8yK0x3aUNSTEJMWi9YUmEva0ovd1J5cDB1M0ljMGJ0cGEySW9HRGNN?=
 =?utf-8?B?dEFudkVDckw5YTRxV2pJdDVZdE95eXh1dXNzT05TZm1pWnpZanlJekhRZFRh?=
 =?utf-8?B?ckZrRjlXQWhCbVV0SEJjajYydWw4eFdyS0RmcXJVaHFNTFAxaXhZM0dUZ1hV?=
 =?utf-8?B?VHpFSTR3ZnR1T2lmQmJsWWhZRnFBMmIvc0JsRkZjTytlUERaUkVJV1l5UnEy?=
 =?utf-8?B?OWpOU2hlSGVjdnNJNm92ejVraVFXRUwxSFd0UStoYjhmSlhtaG51QUZ4WTU3?=
 =?utf-8?B?UldCVXp6bFV2cVhldktvN2MvMWw0TXZYRTFkOXh2Mk9XOHkwRWNORFBZWHBG?=
 =?utf-8?B?YmJNZEtxREZkeVFrMDM4Y1p6TllPczdMOElWY25mcVVIUkZ2TnlUQ1RXYWpW?=
 =?utf-8?B?bkIyVlhVbk9WZlZGRVAxODJ4d1VXUk82eVB4amRVVHpjMUt0cWJCQjlhRXdI?=
 =?utf-8?B?Qm5TbzM0TGc0UmdJTUF6TFFQeWhNczJ6SzVhanNFWFluaE5tSnlqU2ZrNFUr?=
 =?utf-8?B?emYrbmpySlJab1NIQklZek02d0I1VTFaQVdqSHJENFFlQmI3SUI3QlA2Uld6?=
 =?utf-8?B?UHRBa1lxVmlYYUhBQk4xWlJLbmlOblpmaXhmZFB5QVIyL3l1bTRlRlg2YnF1?=
 =?utf-8?B?cE1xWGNROXFtWTVEUXJ3aU12N1dnc212ckk0TjE1aDQ0eGk1amwxVG56WVNz?=
 =?utf-8?B?NUI3SWNFQlU4dk42LzlxSWJDZnNJOEFlcDlZLzJ4bHFkY2ZNUzE0WmJnV210?=
 =?utf-8?B?ME1hd29FSDV5V2ErVmhYckJPTldobzJGbWh5TEJ2RVFDUzlyVjJMbGd2Rm9m?=
 =?utf-8?B?NUE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6d833a-ea43-4a5d-8976-08ddf03795d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 06:59:28.3459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: buXVnDNCVLKZr2V4M1jGa/rQ3E7Q1i3RTIBmC5sXtARwtfZCqXnH5xjNGrbT0o6Wy5CLMqMrcCtCPAAEiC2TxA7W6dpEptLr5oAph3rfbqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1431

SGkgTmljb2xhcw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCBTZXB0ZW1iZXIgMTAsIDIwMjUgNjozNCBBTQ0KPiBUbzogamFja3Nvbi5sZWUgPGph
Y2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT47IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gaHZlcmt1
aWwtY2lzY29AeHM0YWxsLm5sOyBib2IuYmVja2V0dEBjb2xsYWJvcmEuY29tDQo+IENjOiBsaW51
eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxh
ZmxleS5raW0NCj4gPGxhZmxleS5raW1AY2hpcHNubWVkaWEuY29tPjsgYi1icm5pY2hAdGkuY29t
OyBodmVya3VpbEB4czRhbGwubmw7IE5hcw0KPiBDaHVuZyA8bmFzLmNodW5nQGNoaXBzbm1lZGlh
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzRdIFBlcmZvcm1hbmNlIGltcHJvdmVt
ZW50IG9mIGRlY29kZXINCj4gDQo+IExlIG1hcmRpIDA5IHNlcHRlbWJyZSAyMDI1IMOgIDA2OjE2
ICswMDAwLCBqYWNrc29uLmxlZSBhIMOpY3JpdMKgOg0KPiA+ID4gSSB0cmllZCBhbmQgcmVwcm9k
dWNlIHlvdXIgcmVzdWx0cy4gSSd2ZSB1c2VkIGFuIElTT01QNCBmaWxlLA0KPiA+ID4gbm90aGlu
ZyBiaWcsIDcyMHAgMTBtaW4gdmlkZW8uIEFmdGVyIDMwcyBvZiBzZWVraW5nIGJhY2sgYW5kIGZv
cnRoDQo+ID4gPiBJJ3ZlIGdvdCBhIGRlYWRsb2NrLCB3aXRoIHRoZSBmb2xsb3dpbmcga2VybmVs
IGxvZzoNCj4gPiA+DQo+ID4gPiB2ZGVjIDQyMTAwMDAudmlkZW8tY29kZWM6IHdhdmU1X3ZwdV9m
aXJtd2FyZV9jb21tYW5kX3F1ZXVlX2Vycm9yX2NoZWNrOg0KPiA+ID4gc3RpbGwgcnVubmluZzog
MHgxMDAwDQo+ID4gPg0KPiA+ID4gSSBkb24ndCBrbm93IGlmIGl0cyB3b3JzZSB0aGVuIGJlZm9y
ZSwgYnV0IHRoZSBidWcgaXMgc2V2ZXJlIGVub3VnaA0KPiA+ID4gdG8gYmUgY29uY2Vybi4gVG8g
cmVwcm9kdWNlIGVhc2lseSwgSSBwaWNrIGEgbG9uZ2VyIHZpZGVvLCBzZWVrDQo+ID4gPiBmb3J3
YXJkIGNsb3NlIHRvIHRoZSBlbmQsIGFuZCB0aGVuIHNlZWsgYmFjayAoZ3N0LXBsYXkgc28gc21h
bGxlcg0KPiA+ID4gc3RlcHMgYmFjaykgdmVyeSBxdWlja2x5IHRpbGwgaXQgcmVhY2hlcyBwb3Np
dGlvbiAwLCBhbmQgcmVwZWF0Lg0KPiA+ID4NCj4gPiA+IFRoaXMgaGFwcGVuZWQgd2l0aG91dCBy
ZXNvbHV0aW9uIGNoYW5nZSBoYXBwZW5pbmcgY29uY3VycmVudCB0bw0KPiA+ID4gc2Vla3MsIGp1
c3QgYSBmbGF0LCBzaW5nbGUgcmVzb2x1dGlvbiB2aWRlby4gT25jZSBJIGRvIHRoZSBzYW1lIHRl
c3QNCj4gPiA+IHdpdGggYW4gYWdyZXNzaXZlIERSQyBpbiBwbGFjZSwgSSBoaXQga2VybmVsIGNy
YXNoLiBJIHdpbGwgc2hhcmUgaW4NCj4gPiA+IHByaXZhdGUgZW1haWwgdGhlIERSQyBILjI2NCBz
YW1wbGUgSSdtIHVzaW5nLCBhbmQgaG93IHRvIG1ha2UgaXQNCj4gPiA+IGJpZ2dlciBzbyBpdHMg
bWFudWFsbHkgc2Vla2FibGUuDQo+ID4gPg0KPiA+DQo+ID4gSSB0cmllZCB0byByZXByb2R1Y2Ug
dGhpcyBwcm9ibGVtLCBidXQgSSBhbSBzZWVpbmcgYSBkaWZmZXJlbnQNCj4gcGhlbm9tZW5vbi4N
Cj4gPiBDYW4geW91IGxldCBtZSBrbm93IHlvdXIgR3N0cmVhbWVyIHZlcnNpb24geW91IGFyZSB1
c2luZyA/DQo+IA0KPiBHU3RyZWFtZXIgMS4yNi41LiBJIHJldGVzdGVkIHRvZGF5IGFuZCBkaWQg
bm90IHJlcHJvZHVjZSB0aGUgY3Jhc2ggdGhpcw0KPiB0aW1lLCBidXQgZGlkIGdldCB0aGUgInN0
aWxsIHJ1bm5pbmciIG1lc3NhZ2UgYW5kIHN0YWxsIChyZWNvdmVyYWJsZQ0KPiB0aG91Z2gpLiBZ
b3UgaGF2ZSB0byB0cnkgcmVhbGx5IGhhcmQsIGl0IG1pZ2h0IGJlIHdvcnRoIGF1dG9tYXRpbmcg
YSB0ZXN0cywNCj4gc28gaXQgY2FuIGJlIG1vcmUgYWdyZXNzaXZlLg0KPiANCg0KSSBoYXZlIHJl
cHJvZHVjZWQgdGhlIHN0YWxsIHByb2JsZW0sIEkgY2FuIHNlZSBpdCB3aXRoIHRoZSBsYXRlc3Qg
R3N0cmVhbWVyIHZlcnNpb24uDQpUaGUgcm9vdCBjYXVzZSBpcyB3ZSBjaGVja2VkIGFuIGluY29y
cmVjdCByZXR1cm4gdmFsdWUgd2hpbGUgZmx1c2hpbmcsIHNvIGluIHNwaXRlIG9mIG5vdCBmaW5p
c2hlZCBmbHVzaGluZywgdGhlIGNoZWNraW5nIGxvb3AgaWYgdGhlIGZsdXNoaW5nIHdhcyBmaW5p
c2hlZCB3YXMgZXhpdGVkLg0KV2hlbiBzdG9wIHN0cmVhbWluZyB3YXMgY2FsbGVkIGFuZCB0aGUg
aW5zdGFuY2UgcXVldWUgY291bnQgd2FzIDEsICB0aGUgY2hlY2tpbmcgZnVuY3Rpb24gcHV0IGlu
ZmluaXRlIGxvb3AsIHNvIHRoZSBzdGFsbCBwcm9ibGVtIGhhcHBlbmVkLg0KDQpUaGUgYmVsb3cg
cGF0Y2ggc2hvdWxkIGJlIG5lZWRlZC4NCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmMgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdWFwaS5jDQppbmRleCBlZGJlNjk1NDBl
ZjEuLjJlMDEyOGNkMGU0ZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hp
cHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmMNCkBAIC01Miw2ICs1Miw3IEBAIGlu
dCB3YXZlNV92cHVfaW5pdF93aXRoX2JpdGNvZGUoc3RydWN0IGRldmljZSAqZGV2LCB1OCAqYml0
Y29kZSwgc2l6ZV90IHNpemUpDQogaW50IHdhdmU1X3ZwdV9mbHVzaF9pbnN0YW5jZShzdHJ1Y3Qg
dnB1X2luc3RhbmNlICppbnN0KQ0KIHsNCiAgICAgICAgaW50IHJldCA9IDA7DQorICAgICAgIGlu
dCBtdXRleF9yZXQgPSAwOw0KICAgICAgICBpbnQgcmV0cnkgPSAwOw0KDQogICAgICAgIHJldCA9
IG11dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmaW5zdC0+ZGV2LT5od19sb2NrKTsNCkBAIC04MCw5
ICs4MSw5IEBAIGludCB3YXZlNV92cHVfZmx1c2hfaW5zdGFuY2Uoc3RydWN0IHZwdV9pbnN0YW5j
ZSAqaW5zdCkNCg0KICAgICAgICAgICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZpbnN0LT5k
ZXYtPmh3X2xvY2spOw0KICAgICAgICAgICAgICAgICAgICAgICAgd2F2ZTVfdnB1X2RlY19nZXRf
b3V0cHV0X2luZm8oaW5zdCwgJmRlY19pbmZvKTsNCi0gICAgICAgICAgICAgICAgICAgICAgIHJl
dCA9IG11dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmaW5zdC0+ZGV2LT5od19sb2NrKTsNCi0gICAg
ICAgICAgICAgICAgICAgICAgIGlmIChyZXQpDQotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7DQorICAgICAgICAgICAgICAgICAgICAgICBtdXRleF9yZXQgPSBtdXRl
eF9sb2NrX2ludGVycnVwdGlibGUoJmluc3QtPmRldi0+aHdfbG9jayk7DQorICAgICAgICAgICAg
ICAgICAgICAgICBpZiAobXV0ZXhfcmV0KQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gbXV0ZXhfcmV0Ow0KICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGRlY19pbmZv
LmluZGV4X2ZyYW1lX2Rpc3BsYXkgPiAwKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB3YXZlNV92cHVfZGVjX3NldF9kaXNwX2ZsYWcoaW5zdCwgZGVjX2luZm8uaW5kZXhfZnJhbWVf
ZGlzcGxheSk7DQogICAgICAgICAgICAgICAgfQ0KDQpUaGFua3MNCkphY2tzb24NCg0KDQoNCg0K
PiBOaWNvbGFzDQo=

