Return-Path: <linux-media+bounces-17503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB1596AD56
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 02:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E5021C23D9F
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 00:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DCE3FE4;
	Wed,  4 Sep 2024 00:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="JL5TUGEW"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021079.outbound.protection.outlook.com [40.107.42.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2047489;
	Wed,  4 Sep 2024 00:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725409838; cv=fail; b=I8Izrmv60dNOhN0lXX5I1JdSk/aWwiLC2naAIiWMnIQb9oyqsQitkuGe2ClosZZTa6f34BfDZ5QOBLbZMFhdkurvnzC4nMd4gR4gBwVAZbmLaSbcW4fmfmx+6nRoxRn15lJo5XqNuFcGJjhXITHieVwwlvXGHxHlXkCLWjtCZj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725409838; c=relaxed/simple;
	bh=L8LLsHfxA6rr5vGVPaZcRdOXH4YXrGNvoehlAhYhr2s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FSdqIYVf4YsMB9eOfVQFMytq52OAdGLwysxvEnCf9mnFXDIgrGmmSp7Rv1W5j6E3M9FkiSdTE9LDxQ/Mqdh7GD4Hy8u3To3zT9FpWmv4LiS/UMsyMNjcDCBJuPOEfetn+gDKKCQUQvgmyG6tsEy+TVU5dymHBcGBXaoMAbF0dKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=JL5TUGEW; arc=fail smtp.client-ip=40.107.42.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzWzi3MJ6uC/UAmESiG5izyxqjWkwSCDhH3kWrQSRemFJM94f3cz77Ii/yg7y7mwNm8N43Kt/WCH2PrcpUZ8zMbtA9h1sFk+IdAg67GvdHzu3fuLnW7KtiAbNtUryorA3CbtLFJiwEq7yn/cI+AkjIZDzOKhOr227TGDyzOIqPAAKZypnlqZeDeRU4GAy2FKeYN3NtkZjap5QejH6op4Hrlo1wht7SA0HJYKNP6xEOhc0Hhiqftm/dm1emcCzOBwriXjBDIAKbDYreuK8S5BB6bwITtFd68/CFkxWk/cCLfN9tIgEuEexi6Ghz3M3R/UeyuTVKiVITD5lPpwVyrAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pu50ajiu37aDPN80tTxOHP5bB57G3igWydM2dVLFeUk=;
 b=YmsLhFGFVxL8hg6D+2Nfex6pGTeuq5UtWZv3HkuDqK8hcQzCFS6CaD6JMx9ZU+9u5YdrTxyO9QgiSSyxiJKgsF5bhvMa12de2czJOnWulMJPIBa9t7nrC7lbyPnOB4wmgW3wIjhsNaArszTYFJZBqG++vMZWAZCbETzDWVx/A/6FGneOSQAkc0oznt4QjDCNbaPbxN4gDSxCwIS7mhtF399ywUnoDN9N8PfguVT2tN+LTMIMMKNBVTn0efkBKNahOdqTsjlVW2eoc93BF9jzipSGo8TZzKKNY5zBs4twomwu9RDyViToHkOOzwf5yHudX7ZGXHRgY9tSGJN9druZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu50ajiu37aDPN80tTxOHP5bB57G3igWydM2dVLFeUk=;
 b=JL5TUGEWDEmOLthfJJyF9sTXEImQFQzCcz1I13t7amtDmeMSFdWxci1tgjNwjdfBx5YtQol/aGi35piEy0qcclvJXAq9R8lCjQNAfznWcm0VZEs38lPotSP1AzAdY6A/2mYqa9SXSI1iuXJ88d5C5J+XRiEjHcJQC7N4hMTgzxE=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB2283.KORP216.PROD.OUTLOOK.COM (2603:1096:301:129::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.27; Wed, 4 Sep 2024 00:30:31 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 00:30:31 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Sebastian Fricke <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, Nas Chung <nas.chung@chipsnmedia.com>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "Brnich, Brandon" <b-brnich@ti.com>
Subject: [RESEND PATCH v7 0/4] Add features to an existing driver
Thread-Topic: [RESEND PATCH v7 0/4] Add features to an existing driver
Thread-Index: AQHa7IZ0qXgTRigmw0ef9EjBO4XUGrIvlgrQgBdTlmA=
Date: Wed, 4 Sep 2024 00:30:31 +0000
Message-ID:
 <SE1P216MB13030F374CC079CAC0C98F4BED9C2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
 <SE1P216MB1303DB297A43A97CFACFD504ED8D2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SE1P216MB1303DB297A43A97CFACFD504ED8D2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|PU4P216MB2283:EE_
x-ms-office365-filtering-correlation-id: 21d43533-7a9d-4686-9803-08dccc78c8d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?eV1J+R0jxOgQNssurOY9WntECagrf8q6NgSCOw0nIS5TpYui2/bUiuV+H7MB?=
 =?us-ascii?Q?N/Ys+dwXZh+OcH/rxg13QfRWAodC9Rh1wjsk5BGn33EisRTYSr95oLCT4vUi?=
 =?us-ascii?Q?HHi/pBKv+oMXp08N44JHSU69Agy+a4rPNoPBHKtLP9A7RlkJ/jKPhIZvhttk?=
 =?us-ascii?Q?m/06sMr1f0absuTzhKIEkO/MLPe1xkTiuBAGBsX9unB281SgpQ8FZFsf1kuB?=
 =?us-ascii?Q?vzE4ZQphOfuJeuNAyEsq10dQIYKeMX8W50KFTfsNw85rNVqvFvzjbgFmcXDE?=
 =?us-ascii?Q?/OSZmC8ioZ9sqszGuhsvjv2Ty3lq5pC9WBsVViXLKtkywFVnOvqEmcu1mU4r?=
 =?us-ascii?Q?fmzzhkgtIkJ4EcYR+Gi7Tb7ezSjptem/xlgdCZDJ3OrIeJZ5t9P4ktcl6Ble?=
 =?us-ascii?Q?A/qUpFXLNpzSHGkD5BihvaL/XRkH8FJDOCp9G/lv7MehAbKxNYUV3Wzw2Att?=
 =?us-ascii?Q?QZIw6e/qhnUhCutEkonN9HAWC5cUn5VDtUNhqoNFDJnyWMPR6RTh0WklsVLh?=
 =?us-ascii?Q?/wIaqir6n6N5Nc2fKb9dGAhp4GXbYpiexme8D71FylHpA4ZDzzKmStxAJZm2?=
 =?us-ascii?Q?yVIAHSoAWJKRvX9QKcjFEB5o15XjvEohT2NRlRDETUqsUCQJfprLSBo55bv8?=
 =?us-ascii?Q?cDDVEbDNxwEO88t0mldp8CMubQQ2H6mX95lqV1vFGoLFvXXSjYhFrDHO/9PK?=
 =?us-ascii?Q?KCXu/zdyKCDHggcZ3dB10qios5pscvGkKkBelLOdOGdqz5cU02sAoo+0kKiM?=
 =?us-ascii?Q?iFi6XtKTFEGdnMKKCCKfMYVbjVxptb+cKU59XxdVCI8rKEgW1HoqNnWJA0aL?=
 =?us-ascii?Q?wQXEbzN81AOeHlumKSx1LZ94n8j0vvj/MQad1F4SoeDzSKXnBhIGsgJvX3Aq?=
 =?us-ascii?Q?XFNZzmfmCydq4514W8dF4lFkxTMzERBNRDzY1yDbdCxBB+Npp+QhvZAqXjR5?=
 =?us-ascii?Q?CBhMCulQNZtTQFskEJdXdrkvKPo5FUrUpKBbiWERjJBYrgxovOAu3GZOxIiK?=
 =?us-ascii?Q?THlJKHKMYEfisLrGl1k90gQcV6n/4ulK1YyTDA7iX1Y5fJ6lD3uqWgcX0vTB?=
 =?us-ascii?Q?1v2TUQdCajZamfBHwIiVAbSoEjt4sGD9FCkEOifUGrCZVDnMXojFZncECkNf?=
 =?us-ascii?Q?5cbJC1G1Wpbabw7jDIDXcxK0j0zNhkpW4poCtT6nbcJRW73LKJPp5dTMFzaH?=
 =?us-ascii?Q?E6SBArZA1HUq2c8zkuQSkOBtxWSA9EHbiZ5khyBz5x6j8haDl6iNGZV2agMa?=
 =?us-ascii?Q?sL6CR7CQ8V13I0m46CkmipSd3WX5756S/LSLrvi/nfTyN52Fo1s7f/g1FZiU?=
 =?us-ascii?Q?0ZKxKPDQp26drToIvx+5h5Sa7tFbiVxov78W6duak3b4fbcJJ10UxeqTddGz?=
 =?us-ascii?Q?hzIzN4A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?w8L+2sFHXQps9PLSK8iFRz1iFDUUhiPLe+Ju0YDIkSfd7F6Ap+G6DiITrUcQ?=
 =?us-ascii?Q?N4xZfOQsV/gKKqy1XbqFk7+r7nKKtkZoR8zaH91HAl7PfPmKnWBVO2XX+8HH?=
 =?us-ascii?Q?WfZvRqBHmnXEshMcP182o5zoqmYpAB+tCJM0fciafwExKobKyfAo20+Ms8G4?=
 =?us-ascii?Q?yzp9yRUHRayOTW1IcCGaxpw2lm+R93ENh6KujTvTyfZc/iOHxhAjK6c5c4/K?=
 =?us-ascii?Q?ldXdUumexXhwRWOPdc20FbqMUK+0/LALpJzFTIKrzyXkeMHi8UNh3gN/3pTX?=
 =?us-ascii?Q?WnoAkos2G1W9owcnR1YIgj1iAGt0b0IMS9MtrMnZDaZm+821w6xwW/OV8P6i?=
 =?us-ascii?Q?Ond70uNhS634ns9UZMgtSFduXVGAA86YT4FHCIDS0HAauH0SG41MkX2/tbpT?=
 =?us-ascii?Q?XUvutD6Ew5dFowtguklLSLuLZ+rCKUk3B5Z57jBTseKx4j8Fyh8u2HjUXE8r?=
 =?us-ascii?Q?pXT9G4VgkE8ABZEZ6FS5RFZJlbmd4Py28M81pneUUqDFZ8m52mzWaGbw6eOd?=
 =?us-ascii?Q?6MLUEkipVlwPx3Kgv/RH4e9gZkfDkHYkwTQy3tYSuuYtLXkMf2OpgZVvnY8j?=
 =?us-ascii?Q?DhDVG1JdsavNljrNxTLYknXmzqez68Luc7D4AjRz17gj0vFl6+pr/hzfXyFq?=
 =?us-ascii?Q?i5REzWnqtzWxeznQr6dDk2srUrU/heGJTcZrZMJVe13gYkSBL8hzBegwZzPi?=
 =?us-ascii?Q?DI7nZxsF0A6EPT5C5w85E1BluG366sNvfxEyDPoQRfcZBfFG6lo906+ie6pv?=
 =?us-ascii?Q?Q/XJEbqj3LP8Dy4kNe0E1iijtQZJ2TkoElqSMlnNgp0QJQU54RjSW+OPPqMs?=
 =?us-ascii?Q?JR4p+/SwoNlHE1s40H0fhERpbYodeSdVyRUvMxdwVI/AMiYg7xtlJA6qb5J3?=
 =?us-ascii?Q?aJ11+TyIZE/Jp/sYJ65tawi2+3YARZxXs5hR0xE8R/TdwHLpxgWuk3A8ALUD?=
 =?us-ascii?Q?om07OKrhlxoDHA5WrWO8lVWPBTJwECugBKrk8427ZOf7Ti0tGB8baYfOA5W4?=
 =?us-ascii?Q?7akgBxfcpYK0LOWJcYfmi6a532XxGzghB8DrXPn6Gtc/7V7LKtAF9M4Bq8Xz?=
 =?us-ascii?Q?mIHRqIj2/+8N0uIHN0x4w06MX6D5wOKNDMxwo9GyuwISf+pcVnObA2RFqqDt?=
 =?us-ascii?Q?G/SA1q6FfZVow76zq6E9a70uRjtwQtb61K08nD38F8ddqGVY7uTvJNDOJvfJ?=
 =?us-ascii?Q?WytJVSLGw3UfE0Wh0VVTlP0WV/OR/QHIUj8UshiExmu+qlQ+ce+aFcmkyB42?=
 =?us-ascii?Q?LowE83JOBE0rv4e8KJdvQD526NC5rdQEge+rJc03LyY8UxOy3WHyAyIGWVjq?=
 =?us-ascii?Q?tsJT0UZ13XLJd+9mHvFxXwliG1V1CSS8wTHiUesZmBNv4K1NtIDcr18GLCAv?=
 =?us-ascii?Q?O/YvMT9YaELlWJIhuGxn+JoauXufn9GwC+pz+f/4RrsCzIwtq6l1Yb2nHtuK?=
 =?us-ascii?Q?ZKuxvw9fgSPYLBnjebo+Gua6FgtXHSA39d0okjOT2quWElGZRlUlF+ePjKEi?=
 =?us-ascii?Q?+pvE+uHBk9n96TixrqHpG/mJxkWfvN++VXuFo6TL7DMOx5h2lRRETfKse/2l?=
 =?us-ascii?Q?oT/qlTVSbkFO0wJC3fW+jHnsD6O94ffCWERmCOee?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d43533-7a9d-4686-9803-08dccc78c8d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 00:30:31.7393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n/0NtsDI7iBWU+uOndtySd2txLw2qO2OVUHAnps12Dm277lH2MLX+ugt3k4yyYvJ3e7zDb5XUz9gnKue1AwvcC/n21Q6Ke8480ikkZppfrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2283


Hi nicolas and Sebastian

I sent v7 patch for upstreaming , can you review the following ?

https://patchwork.linuxtv.org/project/linux-media/cover/20240812070823.125-=
1-jackson.lee@chipsnmedia.com/

thanks


> -----Original Message-----
> From: jackson.lee
> Sent: Monday, August 12, 2024 4:09 PM
> To: mchehab@kernel.org; nicolas@ndufresne.ca;=20
> sebastian.fricke@collabora.com
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;=20
> hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>; lafley.kim=20
> <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; jackson.lee=20
> <jackson.lee@chipsnmedia.com>
> Subject: [RESEND PATCH v7 0/4] Add features to an existing driver
>=20
> The wave5 codec driver is a stateful encoder/decoder.
> The following patches is for supporting yuv422 inpuy format,=20
> supporting runtime suspend/resume feature and extra things.
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
> Running test suite JCT-VC-HEVC_V1 with decoder=20
> GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
> Ran 132/147 tests successfully               in 89.870 secs
>=20
> (1 test fails because of not supporting to parse multi frames, 1 test=20
> fails because of a missing frame and slight corruption,
>  2 tests fail because of sizes which are incompatible with the IP, 11=20
> tests fail because of unsupported 10 bit format)
>=20
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0=20
> Using
> 1 parallel job(s)
> Ran 77/135 tests successfully               in 30.364 secs
>=20
> (58 fail because the hardware is unable to decode  MBAFF / FMO / Field=20
> / Extended profile streams.)
>=20
> Change since v6:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v4 2/4] media: chips-media: wave5: Support runtime=20
> suspend/resume
>  - Change autosuspend delay to 100ms
>  - Add to enable/disable hrtimer in the runtime suspend/resume=20
> function for hw not using irq
>=20
> Change since v5:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to=20
> calculate bytesperline and sizeimage.
>  - Fix v4l2-compliance error for the vidioc_enum_framesizes
>=20
> * For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS=20
> generation for each IDR
>  - Remove warning messages for the checkpatch.pl script
>=20
> Change since v4:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v4 2/4] media: chips-media: wave5: Support runtime=20
> suspend/resume
>  - Fix warning message
>=20
> * For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to=20
> calculate bytesperline and sizeimage.
>  - Fix warning message
>  - add Reviewed-By tag
>=20
> * For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw=20
> pixel- formats on the encoder
>  - add Reviewed-By tag
>=20
> Change since v3:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS=20
> generation for each IDR
>  - add Reviewed-By tag
>=20
> * For [PATCH v4 2/4] media: chips-media: wave5: Support runtime=20
> suspend/resume
>  - add Reviewed-By tag
>=20
> * For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to=20
> calculate bytesperline and sizeimage.
>  - modify the commit message
>  - define three framesize structures for decoder
>=20
> * For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw=20
> pixel- formats on the encoder
>  - modify the commit message
>  - use the v4l2_format_info to calculate luma, chroma size
>=20
> Change since v2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * For [PATCH v3 0/4] media: chips-media: wave5: Support SPS/PPS=20
> generation for each IDR
>  - add the suggested _SHIFT suffix
>=20
> * For [PATCH v3 1/4] media: chips-media: wave5: Support runtime=20
> suspend/resume
>  - change a commit message
>=20
> * For [PATCH v3 2/4] media: chips-media: wave5: Use helpers to=20
> calculate bytesperline and sizeimage
>  - add pix_fmt_type parameter into wave5_update_pix_fmt function
>  - add min/max width/height values into dec_fmt_list
>=20
> Change since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * For [PATCH v2 0/4] media: chips-media: wave5: Support SPS/PPS=20
> generation for each IDR
>  - define a macro for register addresses
>=20
> * For [PATCH v2 1/4] media: chips-media: wave5: Support runtime=20
> suspend/resume
>  - add auto suspend/resume
>=20
> * For [PATCH v2 2/4] media: chips-media: wave5: Use helpers to=20
> calculate bytesperline and sizeimage
>  - use helper functions to calculate bytesperline and sizeimage
>=20
> * For [PATCH v2 3/4] media: chips-media: wave5: Support YUV422 raw=20
> pixel- formats on the encoder
>  - remove unnecessary codes
>=20
> Change since v0:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The DEFAULT_SRC_SIZE macro was defined using multiple lines, To make a=20
> simple define, tab and multiple lines has been removed, The macro is=20
> defined using one line.
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


