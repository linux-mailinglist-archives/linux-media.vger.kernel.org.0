Return-Path: <linux-media+bounces-16506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45750957C58
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 06:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8B9B1F23F1D
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 04:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7421F130499;
	Tue, 20 Aug 2024 04:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="YeS9lPAq"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021120.outbound.protection.outlook.com [40.107.42.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A76A49622;
	Tue, 20 Aug 2024 04:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724127431; cv=fail; b=QdeogtSLG0TS2ltkd3aW0JGQ5LaiLp7X5bKeIhmgoyem8uKx0n54WRgDJT9IQxBur1nLMxcHutV+0Zzfl+y3kNR/pBdGZut0mjh2T+HTIIYmj9MlM62/P+HlUg1WvRKq0NzVH93mC+2IYxXEFcUcnSaUzLLKnuQdJppRUL11LtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724127431; c=relaxed/simple;
	bh=R/IW3kGVeJIHzFgRBVF7o17UTOg+iKrfdR0DgGiotgM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OzNYwxAKE0Rs2OK3Cx3kFKtROjpqan3gPsvGLGNIyt+z4H7T4jjbGXsiK9YrMsvVCvJMwwsjLSnF7Lsu20A3DyXMyC/sU6OLLcsOf4tE0fEJT+DrAJIdJhWdsnr4+BrEOCRsdqFFRjij25ZywEUTQuuzm1nYcpThQGGOmYo6f7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=YeS9lPAq; arc=fail smtp.client-ip=40.107.42.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5NOa8VzmuNq41Yp8k296TKSXFv11WzatMt5rxeLEr4qLT0eNkjFC1DQ4c3JfYsHhKK2LMAm9cb5fTdCJAvP1knokn/LrzI7FG0Kv8mn2bgCwlm9B7YYGRcy//CuJ3EKUq7Und8GzUDdlXx3YHUJh+YM/XU6sIDmVNylkGzYWVfR41AjORvcE+3AblI9Czf3clm8VHaXDBtiqCcR4AlNwYvcA+Zbv3Y8Fbraepx32Ez8m/bH4+4aY5RyWzvUOtwnZh4ClCmpFmf832NLoW384aV3No9SwDCE2oSkQt/sVhsdeJ0Tsy4rGE38sa6FsxiLiHps4YF6FZYdbpJefyEsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfnGfJKb3Q6qEZHCRHwZXrakdSnrSuLGgh+eAeqMNsY=;
 b=Jl4H1TUHco3HlVsYiWP8HWEqA8H36QW8RwpWs81vjx0iamsLyEMYb8Zn0/66Nb2hgTHbyMFtdb2WsKEBjE/kFS5/ULMIV/5szk8jst/LBoAHjgyGqs6mD4c9Wi2YS2XoXy/nRONPUMvDKVsCHK8x2HFCn9juy/Qt1b33P+24r0AR3k+9scjhpNPYR6Mg3W7PyVTVvW5oPRPGfq4jfDpJIbW3C8GlwjXymNvToLBeNs2RH6qdXmBpX7+rGuWHobGXV3aFmhAkuh7erLxVdEJeopQZWven4HE7Q4Bqpvs2nSoF7iUp5+O6hcd7jnZ+0Ib91bMzBfGfS1Jcwiay13DqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfnGfJKb3Q6qEZHCRHwZXrakdSnrSuLGgh+eAeqMNsY=;
 b=YeS9lPAqI1JQJbLbL7PPpDMCaC3NTgSAvcSmnTfCeQXnWMlFRyM3GoiqelQGnjRm8MNaCo9BJDavEZ1KhskXQjBecOqbu9Huy3+hztuhpAU1vI9EGrCj5Lnq/QGfbp8wqzyB+N2k+wu2UGaviu8ZaIjNjHk8FirJ2l1zSWGm72M=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE1P216MB2148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15b::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.25; Tue, 20 Aug 2024 04:17:04 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 04:17:04 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>
Subject: RE: [RESEND PATCH v7 0/4] Add features to an existing driver
Thread-Topic: [RESEND PATCH v7 0/4] Add features to an existing driver
Thread-Index: AQHa7IZ0qXgTRigmw0ef9EjBO4XUGrIvlgrQ
Date: Tue, 20 Aug 2024 04:17:03 +0000
Message-ID:
 <SE1P216MB1303DB297A43A97CFACFD504ED8D2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
In-Reply-To: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SE1P216MB2148:EE_
x-ms-office365-filtering-correlation-id: e5678701-27ef-4f83-840d-08dcc0cef239
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ckrfeGu6/v41q5L5Svqj+uc3MxsKyMU0hZi1moYtmqQGT/46UfTXx58hyB6R?=
 =?us-ascii?Q?6DL8hybzakj28V5Fi3wlWCEpbCmI0x/hdrjmLhsvMPMnaCy6iALz1myr7e+X?=
 =?us-ascii?Q?SoPBDnIvfbPdRAm7nYKoKQPl87atdxlqy30qWbaWfmFcetV2ZruOc/23eBeX?=
 =?us-ascii?Q?A/B5dNIPWW22MPNAhf4Lh+V1LcunOtKBDu/CnEPAvJzJ4yb/dkioHWC3OImv?=
 =?us-ascii?Q?MmRj03IZ/z9RCEGwJFsGYF1DwOEc5T5Dk16pQib2m+GocJoBOCySgM3cVD1x?=
 =?us-ascii?Q?IblLeqPCFCr2cjkMCbj/AmGiNsxpivTHSCpvGFMBJ+bvADAM7NP4zDWX0uGe?=
 =?us-ascii?Q?ZtTqNGoxp7ecBdHghZGqZBsv3MqD5QzdQZpp/YI7+XJgVxvQ9v8ItXyOEZRy?=
 =?us-ascii?Q?WgSZREVGsDdpmsBOquATw/aJ95XZOQ5U6rERTlJ8u81+RzT42gBtM78u4HTZ?=
 =?us-ascii?Q?3jcwyuc+Tx+2l7ciCuILQU0Rfs99a1tFR1e4+mRgUdjp5VXMFXUcwgQ8rWiu?=
 =?us-ascii?Q?P1cGs4bYqv8tPcTcwRMd6LWulPlTaMINnwf9utGc7vnyMUsjD1gTPUma9ujD?=
 =?us-ascii?Q?7JxWbKqp5S9V41j8GDB6PvRlYJdYS9iwZLcylUvYpPzLQDkDVXXGUoiXUel1?=
 =?us-ascii?Q?bmvOEY8K1Hh+6JlAIyHfLVGsklrezXgTU6LF0zbCLJI6ZO9QWh8YOmq+h+jg?=
 =?us-ascii?Q?ifbHJqAOmQ+Xqg14lznKp1J7oxMEGSS00c2CSIjtzJ8sp2tYmcJ4w5Wj9lt/?=
 =?us-ascii?Q?SmFH6cORbi+f8HL2RCbGdPy/v5TYFwPBCgD6Yh/Y7wfleWk3gFe9OPyLepfL?=
 =?us-ascii?Q?hsHNtX8Hom5txmlcME8uJhPZxKXf4n1BYxD32qGZETt7Uk+4MImAyRk2+KYH?=
 =?us-ascii?Q?yE4ghYEssxgYWbOT/Cd8x6l0gBVgD9mzNKlxtLS3Gw9iMMyPpElIPUglPXA4?=
 =?us-ascii?Q?j+8J9uOdjaaGWPDUl3ZKO9cXA8D8l+4ObZHBpOtay+Qli66T2kHw7vBc3Jr/?=
 =?us-ascii?Q?W2y9edH5HA90JLDtkxpZS8jBjIwIFgj+FK12tcphJGGoKOCpKFoRjGb0L8Ov?=
 =?us-ascii?Q?OOOk44wUcqkp3Ds9EM0IvZR1nbj3oTHdlv3c6S8Xti5lfqGQ25671gfDO7kk?=
 =?us-ascii?Q?FZiNVCH0RTRQHV1qtxSSn1XPGajcZdwgWnK7R2b+Dmnwre/VQruLxfQ3ZDHA?=
 =?us-ascii?Q?bqXhNpXZzqPGVPgebdagS/9+05wpfFjT9G/c0Wj0irgN5qsr83Z0XJe1a708?=
 =?us-ascii?Q?/86JsTxEXCcIHEmGpayxQbAzzyuIOZ+fog+n/MMFq2cxlYsmC/3zRveEuO10?=
 =?us-ascii?Q?mnXhjdOyUgVIBmsR/yeN8AaJQ8t/MZio1NrYa8p1mQBAVW6QIbxWv2G5zTyn?=
 =?us-ascii?Q?Im+AKQQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8qTL1bsYj27xLeMzsdXM3IOA+g4SCeXzGmIWr8kWhcBv0kdEVqL2m68cVtCQ?=
 =?us-ascii?Q?/i0YlW40s4LymWhDQZPsn1M5cSu5QWyilRRDcWMFWIVURCUI0ep3tdTalEVa?=
 =?us-ascii?Q?5zz574WVDUnRf3RZxqgNwc+bsDF2xYOjeCrikFcpU0Nr36LlHpNHfAQrrYOF?=
 =?us-ascii?Q?u4AsOCsYu6HUFryScE6aIk97nSy36/r13xjZMmQzIbAXuvqRKNLU/1q9aLDk?=
 =?us-ascii?Q?8lNuYV3Nyga0vNGHTqXnKog89Son+tLVkckZF6p+LIw2YXTJK6wJ4OW0TlvW?=
 =?us-ascii?Q?dAUOb4RmL/vSX3tWXw3aZxFQ9AZ2jG6UxfoucWk166S8UgVJc5TTLpLA+99F?=
 =?us-ascii?Q?lFuaHAO7Px8wnE+4gFCOntxKhYw/nmoAlNUb1fqmOOCaVKUar/eotlKqKXWX?=
 =?us-ascii?Q?OHH7YHjQ2QJSD+GjrMYnV8+3TCy4AsN0Bt/tl/7VurGf9P9ej0GsKyEZ3UpM?=
 =?us-ascii?Q?/rx+WOTQaA3H5rCMFoluZglIPyfJOsTle/qx1lXSyZTDom5UAC37LHZ/caoM?=
 =?us-ascii?Q?i8e0uELMaQoZYSIiD/YtRgKIf5yQvbQ3lQvPik40g27rtEBZPQPJy1jt2psf?=
 =?us-ascii?Q?qJ3iLKTFacCR97vU2kCTxPpGHC6ZqvSnMFG6UwDnNygSI14qbxTlQq55tzxe?=
 =?us-ascii?Q?7oJ5ZfFX70RWT7vvSNyUuk0/2xk74xAreEwdSvdPMGsbXRzkXIAtvFikZX89?=
 =?us-ascii?Q?2bFeRNJT3OeiU42o6Su/vhLkJmKqr/YAKcNE3bf2RPkjFA1qqRwQ3N6O/dRa?=
 =?us-ascii?Q?AdHpobRnFBRYcJ72VgZERIcaSjs4RZa42XNUcORs8MXGJazGDesJxq951ATL?=
 =?us-ascii?Q?GV2vgdN+HMrEkn/8L7pP6wUKD9lFd+FZG2qAgAntuGJXX5cH83JVXitH+8kj?=
 =?us-ascii?Q?YYuBhr0TN9j855QugP7Q7qDcN6ZLusSmHTS/nWFpE9+vadkHzTQZC1vROINa?=
 =?us-ascii?Q?Qp2CqYKPQRJmEAtRFycA54iiu7ptht28AN3fdNY/jI1Vqi6rSpCecbK1dMZl?=
 =?us-ascii?Q?HSfRHIVo7HQgOLrKKgAyvR5/OzWE22A5LqV020BgrVhFzHhrBcvfiO6wGwdq?=
 =?us-ascii?Q?P1/V+VQjvUrLXKoNvC6EyndZeJdUIYCWLoGAnVqvegMM2HUCIaPOyoyl2Gft?=
 =?us-ascii?Q?bOrJsSnGt5nPlc57/67AFbt1AvEfZWavDKtbNe1vnyFjrInFQn9519e7M35Q?=
 =?us-ascii?Q?zdbEOG+UIUtaGeJS4kWDW4N/WCIS1rJZh8X/1BVPtY8C1XGOCkMQ4tRSO3Rf?=
 =?us-ascii?Q?AfJk/H9lrz4/m5d29rEkoyy2vIBP53OETXiinU2p+mkufQhsOg3mKxh2QGyG?=
 =?us-ascii?Q?Gha9l5Rmjygg3bhMddbIAp45w16FyCk4NBZcKW/nrG7rXiRZ/LXneOwf9+Mz?=
 =?us-ascii?Q?lIaM6sjetR0avQ5ctRO5fTLBVSclFrsMKRB7PJrsN9FfRQlaIjMMKsgowNu1?=
 =?us-ascii?Q?pdn9HXaQ8wqX4Np5bUK/Fm98gvAOcSLftISWZs824P+ERjKmhSPXF0XNPcb6?=
 =?us-ascii?Q?naHQUZOPoebiFwhB1XqoE7vqHrVq5SWAIzr6uq9WkXnDuRF/HZe5OtVLPkTT?=
 =?us-ascii?Q?MlgXdYCsnputDmrLf2MF1vFwlR0KY7nOhzy632g3nLKt23IpBPc27bzXfent?=
 =?us-ascii?Q?MA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e5678701-27ef-4f83-840d-08dcc0cef239
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 04:17:03.8931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0yEYEo4pEiG4OyYZLxxhl8rUDZr5XNjKngmfpWLuBE5xnHKfj/nT9vreQlCXk5oBtxf10OAhOYKFJh5HSO9D8aiXDbpUzS8IX1/EymsuWAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2148

Hi nicolas and Sebastian

I sent v7 patch for upstreaming , can you review the following ?

https://patchwork.linuxtv.org/project/linux-media/cover/20240812070823.125-=
1-jackson.lee@chipsnmedia.com/

thanks


> -----Original Message-----
> From: jackson.lee
> Sent: Monday, August 12, 2024 4:09 PM
> To: mchehab@kernel.org; nicolas@ndufresne.ca; sebastian.fricke@collabora.=
com
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>; lafley.kim
> <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; jackson.lee
> <jackson.lee@chipsnmedia.com>
> Subject: [RESEND PATCH v7 0/4] Add features to an existing driver
>=20
> The wave5 codec driver is a stateful encoder/decoder.
> The following patches is for supporting yuv422 inpuy format, supporting
> runtime suspend/resume feature and extra things.
>=20
> v4l2-compliance results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
>=20
> Buffer ioctls:
>        warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
>        warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>     test VIDIOC_EXPBUF: OK
>     test Requests: OK (Not Supported)
>=20
> Total for wave5-dec device /dev/video0: 45, Succeeded: 45, Failed: 0,
> Warnings: 2 Total for wave5-enc device /dev/video1: 45, Succeeded: 45, Fa=
iled:
> 0, Warnings: 0
>=20
> Fluster test results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.=
0
> Using 1 parallel job(s)
> Ran 132/147 tests successfully               in 89.870 secs
>=20
> (1 test fails because of not supporting to parse multi frames, 1 test fai=
ls
> because of a missing frame and slight corruption,
>  2 tests fail because of sizes which are incompatible with the IP, 11 tes=
ts
> fail because of unsupported 10 bit format)
>=20
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Us=
ing
> 1 parallel job(s)
> Ran 77/135 tests successfully               in 30.364 secs
>=20
> (58 fail because the hardware is unable to decode  MBAFF / FMO / Field /
> Extended profile streams.)
>=20
> Change since v6:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v4 2/4] media: chips-media: wave5: Support runtime
> suspend/resume
>  - Change autosuspend delay to 100ms
>  - Add to enable/disable hrtimer in the runtime suspend/resume function f=
or
> hw not using irq
>=20
> Change since v5:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate
> bytesperline and sizeimage.
>  - Fix v4l2-compliance error for the vidioc_enum_framesizes
>=20
> * For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS generatio=
n
> for each IDR
>  - Remove warning messages for the checkpatch.pl script
>=20
> Change since v4:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v4 2/4] media: chips-media: wave5: Support runtime
> suspend/resume
>  - Fix warning message
>=20
> * For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate
> bytesperline and sizeimage.
>  - Fix warning message
>  - add Reviewed-By tag
>=20
> * For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw pixel-
> formats on the encoder
>  - add Reviewed-By tag
>=20
> Change since v3:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS generatio=
n
> for each IDR
>  - add Reviewed-By tag
>=20
> * For [PATCH v4 2/4] media: chips-media: wave5: Support runtime
> suspend/resume
>  - add Reviewed-By tag
>=20
> * For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate
> bytesperline and sizeimage.
>  - modify the commit message
>  - define three framesize structures for decoder
>=20
> * For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw pixel-
> formats on the encoder
>  - modify the commit message
>  - use the v4l2_format_info to calculate luma, chroma size
>=20
> Change since v2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * For [PATCH v3 0/4] media: chips-media: wave5: Support SPS/PPS generatio=
n
> for each IDR
>  - add the suggested _SHIFT suffix
>=20
> * For [PATCH v3 1/4] media: chips-media: wave5: Support runtime
> suspend/resume
>  - change a commit message
>=20
> * For [PATCH v3 2/4] media: chips-media: wave5: Use helpers to calculate
> bytesperline and sizeimage
>  - add pix_fmt_type parameter into wave5_update_pix_fmt function
>  - add min/max width/height values into dec_fmt_list
>=20
> Change since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * For [PATCH v2 0/4] media: chips-media: wave5: Support SPS/PPS generatio=
n
> for each IDR
>  - define a macro for register addresses
>=20
> * For [PATCH v2 1/4] media: chips-media: wave5: Support runtime
> suspend/resume
>  - add auto suspend/resume
>=20
> * For [PATCH v2 2/4] media: chips-media: wave5: Use helpers to calculate
> bytesperline and sizeimage
>  - use helper functions to calculate bytesperline and sizeimage
>=20
> * For [PATCH v2 3/4] media: chips-media: wave5: Support YUV422 raw pixel-
> formats on the encoder
>  - remove unnecessary codes
>=20
> Change since v0:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The DEFAULT_SRC_SIZE macro was defined using multiple lines, To make a si=
mple
> define, tab and multiple lines has been removed, The macro is defined usi=
ng
> one line.
>=20
> Jackson.lee (4):
>   media: chips-media: wave5: Support SPS/PPS generation for each IDR
>   media: chips-media: wave5: Support runtime suspend/resume
>   media: chips-media: wave5: Use helpers to calculate bytesperline and
>     sizeimage.
>   media: chips-media: wave5: Support YUV422 raw pixel-formats on the
>     encoder.
>=20
>  .../platform/chips-media/wave5/wave5-helper.c |  37 +-
>  .../platform/chips-media/wave5/wave5-helper.h |   5 +
>  .../platform/chips-media/wave5/wave5-hw.c     |  30 +-
>  .../chips-media/wave5/wave5-vpu-dec.c         | 321 +++++++-----------
>  .../chips-media/wave5/wave5-vpu-enc.c         | 313 +++++++++--------
>  .../platform/chips-media/wave5/wave5-vpu.c    |  50 +++
>  .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
>  .../platform/chips-media/wave5/wave5-vpuapi.c |  33 +-
>  .../platform/chips-media/wave5/wave5-vpuapi.h |   1 +
>  .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
>  .../media/platform/chips-media/wave5/wave5.h  |   3 +
>  11 files changed, 460 insertions(+), 365 deletions(-)
>=20
> --
> 2.43.0


