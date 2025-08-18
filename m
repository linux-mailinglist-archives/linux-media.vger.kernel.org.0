Return-Path: <linux-media+bounces-40088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D43B299C1
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DB29203A28
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8562275870;
	Mon, 18 Aug 2025 06:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="RJQGE+3n"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021086.outbound.protection.outlook.com [40.107.42.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D383275845
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 06:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755498822; cv=fail; b=rpiJN1dj9i0hOTFoVlTscqyUg2zTGnl5glmSOW4tsdl7yprQzi5Q6QL+3MCR339ETCDliykpOyBDIYMzd005ff81Fq7398qahNzejFFkdkL9T/+Cm7mT6mr4vX3ucS59f9Q+wiShXgGoCcv6jpifn5aJ2hYkRYl72zWTFf8ALy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755498822; c=relaxed/simple;
	bh=oYJwnhInjwFFy6B+13p8yigiUl6keew5iqQv0XOiNVc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EsU4PaSj4vldNOssKak5GjkOie58qXD9BWG2a2XwAytvA2wPJoSifKG6uiD9k1pyirzcTtgPufNaRtPcTVMjwNxvnAU0XJPRCg6M7useaumHpraEuDd7YEhq/q2yu7cSpAXHMGH96RtN5j0RbslYJRVI5xglICrwEvdItyAYF00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=RJQGE+3n; arc=fail smtp.client-ip=40.107.42.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bs8cCnv1cYWjzq7B7mPXfZ1jll638U8aU9PoUhZmpIZIoo2sAJ3r4V25YSF5l8h/iEQrua5bEvIBEoThZAxFLKf8nFrkjXRAYU37PnRcwuswz7us5ypgsai/pRMZQRTyO50hNWQOoJimRiC9R8CY1K62pfXTDr1pL8ZYCrMRW7CaIRkym5qUNNynfSjM890IZf9rVsqqheX5hvDMq9nVFgCx+mXfBhrn+3gi5JI95B0F/n9iEntKzLFFZouWTfbzZ+Ko9dchWxDPuHuTos7f13CqWSCybvVexvUK223idcXLuE/8L57PiXwgRK0opt7Cc4xM1q3SJjZ45o6Wa6A+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYJwnhInjwFFy6B+13p8yigiUl6keew5iqQv0XOiNVc=;
 b=t9IltgEMtQ/qD7ZtSKwkOFt/WXOiTIad6mmKAThSFGFV0SRzjZ0di+JXYs8TiN/5FOA6LfuxJC2nu83OAUpLMQANm2Bn8NWTuWqqSqejl729m8WOvMcqm3WHkvHrIFmtDdy+7IV4+LpzAHEdfoU99XGHX8hGtLIslbhX1VfRgmhqbhAuGnEBpGgG/ozuVbU0mILdPnqw4VXioFrJlo5d1EPvzboPoXurU610FPyF3K0mcqrq0x0WVDf1k0JqeM/eB+ikkAJxEbrJbGaxVfGDq1apj7PHP9YXeKwzU3jXgfMjT/fjW6gsQK0K3Wq45qv0V+8LATkDaGU8qdrBG1K3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYJwnhInjwFFy6B+13p8yigiUl6keew5iqQv0XOiNVc=;
 b=RJQGE+3nkZkNh7B7tDIFZ1doLxfdf9EI57QCAKpARQmBKviKvspE09su3CE5U+ihz0flQUNBNvB7z1AVjMlbq4NjXxd2XO0yz893+2bFLLYZBfH/j27MjJzsqggwavY4ZGFPrcAUT8b312Aek1TxGpxnrcIZBqCc1JoXF9QM7Qs=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SL2P216MB1920.KORP216.PROD.OUTLOOK.COM (2603:1096:101:101::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.12; Mon, 18 Aug 2025 06:33:35 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%6]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 06:33:35 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: How to construct a Gstreamer pipeline using crop feature for v4l2
Thread-Topic: How to construct a Gstreamer pipeline using crop feature for
 v4l2
Thread-Index: AdwQCgSqymWIBYFATUywBFGjDVfkrg==
Date: Mon, 18 Aug 2025 06:33:35 +0000
Message-ID:
 <SLXP216MB1148BE257D9FDA62BA7680EFED31A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SL2P216MB1920:EE_
x-ms-office365-filtering-correlation-id: 07fd1bd2-1149-4b81-1fd7-08ddde212879
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DqF+vZ/97GBiZq6ohuY7ZvGARBdmXMMkFFdPWK2P7VcLaUfgo3on1Hv5GhpJ?=
 =?us-ascii?Q?Q5pS+cN4IWzybI2b8qjVjB47e42RxG+29QgXIxBHCI3KdUFuGXrVT3Lebinf?=
 =?us-ascii?Q?khB934LEoE8SP4NZeqmPiyn7K5A4FVLd96I12I6BYhv/0WMR5PqTBB5dtuML?=
 =?us-ascii?Q?UfSOdQcjHFAJFQ7LHaidMXOVnJSMu9UHxSH4rpimOSVtLQlPQ4RHNLfMr3qO?=
 =?us-ascii?Q?ZsG4vTGAWejDCxOFhSRwCcerDL9HP9SxL57NyHYK+USoihDazmKLiZJj9qm/?=
 =?us-ascii?Q?Z7yIrroc35Njk/9aB+lg2hEY4RCKhHaJY4bQd9F9tl7BqhQJXO+IuI8ELQo6?=
 =?us-ascii?Q?cj5ixgOrESWOklgB70Og0yC0ETUNFDEwoiqf7CdnkRMN18p7vwkumsheeBlk?=
 =?us-ascii?Q?zvLSNG3BPHg0j/7vRp1sMSXeCnQ4SL3JcCsBv2qFZyGM6E8o4to/1izMWkCj?=
 =?us-ascii?Q?nWtscVsVs9DjCF6Mu57tqds379Kg2BieLsdrNdKSEMWYkvjvVHsGkMvohCNf?=
 =?us-ascii?Q?I8jQKc/40BHBEYS50Tnd9N0TdtYaFAIP6RJkR5XT/ttWNsWijJRFcXTeyihF?=
 =?us-ascii?Q?PYvz4QZ3p0tfabrWWD4otsvRYOp9zekeEqJW0MB27MHlEPW42Y2kbf4ISHtu?=
 =?us-ascii?Q?DA4kA7fT0dNuXhvmh9OeqokzcL/teqDa1XHgunq+pkm5dclHXpvmvuPCkn3W?=
 =?us-ascii?Q?8MyvaJADVX0zr8Iv6XSlYym9K2JEPh2CsRuM++o96Ve+IOty4KWSDrh9I2S5?=
 =?us-ascii?Q?+mT5EtdoWiVUGa4AzTJK6MVk5hpuljLzazeLINZ3KBELUbELUos2r7X9acxF?=
 =?us-ascii?Q?UHrZsPyvUUnwnYXJ7nxcC5VcdLrAQG5WCPIFkqPh3knjw8YjbrJjlj7vlbEt?=
 =?us-ascii?Q?GCqx2EzXmXF9oTHDxsXVbE4il++NVLsZomXAebnvJYsRS8XFGuHv4VysygTs?=
 =?us-ascii?Q?zYTWAcOfDw793NHxYBctwjrUWAXi3MZzyFZeqhBFlyugBTxd8e+GGWpVp5q7?=
 =?us-ascii?Q?fsMtcJ9TfcfV2yrxUd9Gjylm6O0dIcuMj0+ygEElGfgTWETEPMf3J+iJ8Dwm?=
 =?us-ascii?Q?UT6LAOp9acVDTAyoILP+k2mansxUHir2/O2MQBxRxqjH2j193fNBXRtZCasO?=
 =?us-ascii?Q?p4NuWk/KpcprznmvpWhCfAwQcOASr4d2K+qShiBt3oy7VFXEOwdx6zeDJsBE?=
 =?us-ascii?Q?tR+4eCJtG/F9NLdXyv/tqPO3ERMEL1h0g+CkTyi2ZzXa6vBpCejI1P4jxHcH?=
 =?us-ascii?Q?Yl6XMY5ugOAgGKlF3rVrNgUK8Pome9B+Hf9Uej3d9qGHw+Wl1Hgslde1gwn6?=
 =?us-ascii?Q?ROTWKMALYEZenSXOFKnGm1sklhpr53fRatlGoKv8tVzn2o9LK2ImdUS6EKrg?=
 =?us-ascii?Q?8dQ5i+tJBT55xelOYbPD0q0JfiJVrVya4Ak/G7tLiqtVBfAv7ggQPXaU1TGn?=
 =?us-ascii?Q?+iKsXOIyl+Ea3GYv0/Uh549E+XQi3ZtgWcMNN3arLOmQplqKYGJuuQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kjLLRljExJV6eS9GIKamf9yV5MiYa+UmmgCXMFJFHrGgyA6EcaKT6P8kfzn6?=
 =?us-ascii?Q?hvH+ZHp16DQ5gVUDne5xuzeEmHxJwnu+q2WCYgWW4lU76tp2U0HjELtP143s?=
 =?us-ascii?Q?68iPjslaixjI5orxDCXFOBgvVXTKir5tG8kdRdeIRtYoPOdqTObq72pmg9Ej?=
 =?us-ascii?Q?tvRm7xc4hxNKeYLiZrB4VTojPsgpyqmFUY6ddX0QkeEYggpoCbFQOcnJCWXz?=
 =?us-ascii?Q?az/MvgkP/Jt49bGdzvqt87JyWUbuXPRQrqfxcu5LAZkJTlkWN+izdRYtW+uA?=
 =?us-ascii?Q?jvGr74z+yvQjd47fUSs/irueFfb97PX4iB+LdnGtrgfcIMvMVCPHv/ly1MIG?=
 =?us-ascii?Q?sppSTjLDlT/ZJNdbcEmAt9WWswgpjUvzvJc5rivXv41L6RQHi12QpjQ/7c0G?=
 =?us-ascii?Q?yPB/ErUYC7C9l+XLGjx94NICSXRNx0mP3H72JhcZF2461h9Vst5Uoh0/5vTU?=
 =?us-ascii?Q?UxO3qkcISE2QCcBwRomhqntDTmA7qFh98Ow+e0gv8vNZQIqU43nPv3OPKjip?=
 =?us-ascii?Q?txtrUk5O1vE1ZHGovuP9JJuPL9RtTiQleZSdKpL+ys6K+fpuoJQDLvDlgYKK?=
 =?us-ascii?Q?C10EL2ipqX9CKfMsQIVSHJ0f9GfEUw901zu9rFXAsAn2BVHUpFuJRbVi94ZV?=
 =?us-ascii?Q?rUbKbftboAIPr5sHBR07U6HkPnHhVh0scNHYU8odp93TcAy1ntpYxIe2axIF?=
 =?us-ascii?Q?xlHQpcV0S1IThYSueVYqjrUDUuhxwwLj1+yJ2dw0f4XpPDEC5AKHPl92/e9q?=
 =?us-ascii?Q?JXqUAjynJxTJjRrmn810Kjl3FCGP9zNGx1ls2ONqWaNfPDSCSq8xP0o94pUl?=
 =?us-ascii?Q?84p/NYcMybE/rJ/Im0MTL7/txYM2icdxDaNRk2KIAMAuXhJA8jm9fMdLG237?=
 =?us-ascii?Q?J1dU/sTPyGqaPFDXWvmRWTIbg48Bt2EaGTXpUYUCDvzQeLG2ovQJEyMsxbWx?=
 =?us-ascii?Q?lST6qzqIWg7R3KMJ/auXEa6z1T3w1hh0W1pKIqxRBk2+llpLb14a3oERJPP0?=
 =?us-ascii?Q?p53IvSsOZ+egTXSpr7LTCKGseJRF4Neq8s+wjDyOVkpV7VmF7npNfiEWIaTG?=
 =?us-ascii?Q?43ZgSxuTmv0wtxVxoZXlMyCjK1TcF05f06uP1cEcYwYu0sXMyP9CORys+ZLp?=
 =?us-ascii?Q?jM3bPsBEHvR06jYAkzUMzoEG3ivpQ/Ov/0H62rka0Ek9RntcXpNpyxOU1Khl?=
 =?us-ascii?Q?1pg1f57bhL9xf2NqeGIff0onJYtKSGwVW3/esQkSKVmbq4QdkEYtyT5h8wzv?=
 =?us-ascii?Q?9PVpjpU3nTldC9wpWADWnSFaMlyoU2tVwoU10p9/VzcL0BLRfhbIFrMjl7sb?=
 =?us-ascii?Q?gkGL0bPSUaF6RrgryAHM78Yrm1uIUtAwXBBWoZVf8X5airHbSTciOHqWdX0c?=
 =?us-ascii?Q?T9HpdABxg9KL1R7jyxNndNIQBmPBjwRJvsBVfyCdXPiw2R2qwIOqm7hi7Ay4?=
 =?us-ascii?Q?bzzx1q3UDVwxJinA9BuLjbmTp+tUmBZEweVbiRabhwdT7Wgc75zul5ufGNfk?=
 =?us-ascii?Q?7/2nTuFuAkCe+t0iu/k4MM/BPDcgsf8SXK9gcmahpgWnW2gM2TXMJ4OuZDbm?=
 =?us-ascii?Q?5suLL1FoEs3q0qXJoczYEehLyW+mKj7I1C5SKX1KG9lhC9mluaogFcC1viWf?=
 =?us-ascii?Q?eQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fd1bd2-1149-4b81-1fd7-08ddde212879
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 06:33:35.0462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ok1szaGnEWbqsjlVarkNRCe0Zf0v79fn8e88SNQPPTraC7Jvws+JW0//CARP4tLuk9xMU5961iDPAfSCY8eRxwMe0PLfooh2Ky4L1AEugd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1920

Hello All

I am developing a V4L2 driver that uses hardware acceleration for CSC, scal=
ing, and crop. I am using the v4l2convert plugin in GStreamer for testing.

I was able to test CSC and scaling with v4l2convert using a GStreamer pipel=
ine like the one below:

gst-launch-1.0 filesrc location=3DBasketballPass_416x240_50_nv12.yuv ! rawv=
ideoparse width=3D416 height=3D240 format=3Dnv12 framerate=3D30/1 colorimet=
ry=3Dbt601 ! v4l2convert ! video/x-raw,format=3DNV24,width=3D416,height=3D2=
40 ! filesink location=3DNV24.yuv

However, when I try to test the crop functionality, it seems that the v4l2c=
onvert plugin does not support it directly. How can I construct a GStreamer=
 pipeline to test this?


Thanks
Jackson

