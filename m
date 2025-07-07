Return-Path: <linux-media+bounces-36915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 780A1AFA89B
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 02:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAE87175124
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 00:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9311A1514F6;
	Mon,  7 Jul 2025 00:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="h4FssVt/"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020091.outbound.protection.outlook.com [52.101.156.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938E84A3E;
	Mon,  7 Jul 2025 00:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751848643; cv=fail; b=j0U+td1jkcNbKBlKgU34C+SDjE/6ai9XhXhOeh3HpkaIvgM4Ziyz3MW72o3NlmEN1f4YpB7pfcYHrnT1l8E3iJydRz0PXGUBMbc8Y5O4pfo9UXX4TM5xJ96/52c1futz9+JGizy7gEdtAXrsAg+pVgiqJqJsr3k8H5/R1zll9A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751848643; c=relaxed/simple;
	bh=xa1mC1fBmjspI6tlyzwkcgpDLD1/ke021cvF89N8BR8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jq5GHv1qElvwJrpZuCgNeXI2Pt1011xIGWyqaQGPoqd6YXN7bkpYe8rx3EZOr3JQ7oPFHaW0b8JbQ2i6P5VPCQtgMSs4wnxRfcF9iv303JxIRO26txDN8WmO8W+mkcrVUcLvNlWUzXGXPcQCfj3jhL6cpHqV4ucXbaKH4hBMtPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=h4FssVt/; arc=fail smtp.client-ip=52.101.156.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+mfKISqTTUOgOMPoefpBC8Ls7pS95/TUB+S35e0/Bz4EZ651diz6/PyPUDhCWzX5wau2l/gVqStyOXgVCEkKUB47eta3IXcMsgDRaqq+VfbU7TV33He+AkzXC9egQOLTbp1NaSvKF7Lm0Yxc6mQTqSg6CZh/UYC0fQHhB+Pc5ZequKDDnaASWnEyWDGES8W3XrZ/wsy8WqSa21GprJEK5AHJweYex9UklqbJdRZBOi7jHAlcemBH0z+hIdPjXPvvMg8UGzA8ehxH1wUSUc5PGzHUojN5IotdNjeMzahHYc2V3g2rFs9BNRxk83tyEKz52wuP7QFevxbi06Y7b3/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQ/RRe5+MYAcKXVpPvDipQZPw9U9VFYrgmZ2INPx8QI=;
 b=CaIP3e9CKA8/z/ivQL05mfSmmMWjdgxJ5huLKqIUmf5FDDbzjaBM3DBkhHlfZeGOgqwKJLSOT5KH6RSSIfAMqrbff56juNiqibN8PDZOkpz1JNFLxRc6NCUxJA8OqXqjnSiBha49kNN7iz7sLnbErKSRNLdT0vCeFrR/S92yE9j61adUedpwUFtJrlDuBQI6HXZYuWp8hDjuVFx2L/M+UKp8Je1k020++zv9yNbKkCFZLgIf6bHfnWYWCe+1TAPzRTdN8fZI6krSpukehiMKDxEjbZRX5zJnx0S0NUzPnfHEa6sk1mEUhPvYeHcDb6C1T2PFG4bXbOFitGf5g8lSOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQ/RRe5+MYAcKXVpPvDipQZPw9U9VFYrgmZ2INPx8QI=;
 b=h4FssVt/J6xPtcKEf7s0d0cah9tCDhy/6AdIjDn46NG4CpKuvrUAPmMRD8K1+IPz60vaoETVggpOI0Dizjif+w/pMMp6+fMOENehuAVf/YCdmh2O4PWfp3CenPSPbQgTfPhqXoCwKpai0RRxgh3dTNBJl7gvFZgK/itlFYlJe54=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SEWP216MB2877.KORP216.PROD.OUTLOOK.COM (2603:1096:101:293::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Mon, 7 Jul 2025 00:37:17 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 00:37:17 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "bob.beckett@collabora.com"
	<bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v3 0/4] Performance improvement of decoder
Thread-Topic: [PATCH v3 0/4] Performance improvement of decoder
Thread-Index: AQHb49TXwjYLUfVzYE+ALyQbFMjCk7Ql5KIA
Date: Mon, 7 Jul 2025 00:37:16 +0000
Message-ID:
 <SLXP216MB11481D85FC52CE16ADA92849ED4FA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
In-Reply-To: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SEWP216MB2877:EE_
x-ms-office365-filtering-correlation-id: 7ccebb71-1a1f-4f7b-1be7-08ddbcee6cd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?P91Mre8UP89dhZLANIHBvY37BK6F1r46RO9WrSNZEGeYpgYZRy7AVLgnZi5w?=
 =?us-ascii?Q?l60u4dg/5dxP58M4uvkcEX9MVd8qeASI7raUQDWGw+Ipf7FuhlglNgvcx5qK?=
 =?us-ascii?Q?qQeAJATKH88CSPgejCFEAU8NG2DLFIZj8iu3XIi7l+XLsFUhXgoRM6MRaiaa?=
 =?us-ascii?Q?lnbI0H4BPKnVp59S2bc8V8S+g1ntDJO9VqL3x826SOdT3tgW7HjLRKWxUiy3?=
 =?us-ascii?Q?NnEvRwuzt8A/ILUUF8h5UpatgsSbQUjl86yjfFZcw5y63KgwmUWUmRy3u5Dp?=
 =?us-ascii?Q?lfQXsFdeP6YqmPg9t/Qt/O8J3YGIUmvBkimYEt/aUy3lwSr8jhplSpncv0GB?=
 =?us-ascii?Q?+DiaFwsMeHoQNHA7tsYx2y2KbW6rQz0FJvpffp+zxgYTVnXES4OdC4SOhj1z?=
 =?us-ascii?Q?dPSubtRd2e8FMGNccyA7zH7BpgrrynMAxxcs3rstZNh0oNVMdJ3w7YSe/PIa?=
 =?us-ascii?Q?oSez/7pb7L8MLBci4L2Av+bnwkwV/HvF+iDyPFlLLcSS5MXhk7WSGihzmqXm?=
 =?us-ascii?Q?MVxmj8JomVAPnZFrXAhHBiajGfNcf892XozPDZI/1B7kQHPKMgaC38v1PVrq?=
 =?us-ascii?Q?Sw0Oz3VkH/badG+dvOEJGU6iWzYyhVnmSqpBxyiO/uvvBxPgZU3e2k297EY2?=
 =?us-ascii?Q?I+U/m8VPYjAEbquYYR7iuJXrVK9w0K59hyF/n50HG/90gvN+YXfhGcJg5ZBy?=
 =?us-ascii?Q?Yf5JI6oOF/nOzrFU6inn9HdcvKYi4BreJbJKm9cDhEojznOtFg0AU6X9YSd0?=
 =?us-ascii?Q?NsTGEwQcTWbHGQN9QkPl70W6yE0GIahj+EolJDBQFEiLAKCMgy9Mo3v4gmzj?=
 =?us-ascii?Q?laDo7mzzG9VL2fqcg4B4nThq8gSKn5oUiwkPWWCr2M5nwlm7u9uPn/SZDL1l?=
 =?us-ascii?Q?sigj545n2MPzU2PeDhm8Svqx8O6wQfFOV5OsGJ7TCuHBAGVYk54XwsLsmT1p?=
 =?us-ascii?Q?3I0nZpUKRQRuzA4jBZmSt8XGghjERCqUSPFimjjZZ/dh0p3HHkeKO/zXDmLI?=
 =?us-ascii?Q?U/8PIwXii1B6cWNLYI4a6i4GT/JLQ+iuVtwcNC0TpJKrogO9uodcfaaB7RNe?=
 =?us-ascii?Q?jCKhWaGoRKQkoWHNm7LoSLoBjzJiEWiNenng8QyRV/kqE0PauIwmYrVeZ8XL?=
 =?us-ascii?Q?ZjQih9Jo+Wvwj0+kBLYwktdoUkYG2RVqdzh+Yvj0WbR5OVSaja2nDefBwlx0?=
 =?us-ascii?Q?3wN16PZsE/JluAIF5YQLhAPMeXf7rE6X689DMEzGMLbmYXzZKgPz4JzSIXeP?=
 =?us-ascii?Q?NdcnM5c9TYokUfqzLBNv9TVoxinKaFeJTiFwRLIQ5A2iqpWmacp8RLdYKq/T?=
 =?us-ascii?Q?R6EBXBumLp3VG4j0JKf8Fh8chxjg21+mh0koN3T7I26u7lWD8g5F+8/lnCL0?=
 =?us-ascii?Q?QxBQXB59YAHICfXCOEctfiJ+MoGUTMToKa8KQayoy/pin7a95wnutaBywps9?=
 =?us-ascii?Q?3Cq1Q2LcYWtHC+ex2s4NFNFj23X5wvD/90GxBdSdRF0RNCYJ+/fDlw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wvimQvC5hLr9sR4kB2i2uiKioOAmbY7/pstpPV2/rNn8nO+imGa9AX3+I5v8?=
 =?us-ascii?Q?cDsfYu0jsWlVBIhAuABs63T68slmwsffzSJd6mPEWYsocH7bqXBSNVfxh6ad?=
 =?us-ascii?Q?F4hsh4NEiSRtMi+nj0n38wkk7HJd9lGu6ql7V/8N5IL3KB/xJ7CB9Bo3up2+?=
 =?us-ascii?Q?Msyl6qeYcXky5AwAptkP+dfO5ZXfxdO6clfylec06H70q+oIlAK1hF/BqA9m?=
 =?us-ascii?Q?pP+P/AYHh3IXaMwYAzbbVXGQulQQ0xwrprf8/XKDwkRWjy85JHRh486/Rb3z?=
 =?us-ascii?Q?OZOHA5MBGo6mf4q6KMF32OzdJVvFApCGpTZFXu5mPufAKQwpyj+b081k3S83?=
 =?us-ascii?Q?InTYC0i2Eyl062qSbhpJXVJIse+hbq8aXMlwRYKufzWbYUgHCAh7IR/iL4/V?=
 =?us-ascii?Q?kKIt9faMIQX28UCruUGPA6DgX9sNsiHNKgLU+obgzq9ICVeiJgjmk5dDK1qH?=
 =?us-ascii?Q?8L00FpPilZ1XBA0R8uGzzDpX42cL8elN6Ohhzc7O0RH3eHE99ebRjgXgNKwi?=
 =?us-ascii?Q?UwCYdsVrS+EFvcLVClpD/TGiBPAheicqZ15J0AWvS9KpAEfHtgCaiw0/esor?=
 =?us-ascii?Q?N/9wYZqnd7Ops7pWSI1yaEMtsCGqpRA04/BXye1AtWL0L3H8Shczq7rAG5Nz?=
 =?us-ascii?Q?qnxFVhqHLChLGKIhcxmKuEQAMvn6mz8YMdcNx9NlPTjj1WVXQ9KxPVdtxGNm?=
 =?us-ascii?Q?JFuLzDyE8KVMzx4G6gRfjVtM9q8l6IEuIzZq0WUTFyXmnnFa3og7k3y0rac3?=
 =?us-ascii?Q?W6Rwk8DKq3IQaOamiOF+WFsU3yH5Rn3V1lTw8iTbmw/nj4MfJEvP3VDPpdYj?=
 =?us-ascii?Q?2hidZ4NpiAS7K//+gQ7037kpFJBjhe4IJxGlI6UCRxAtGHjLf+R5dw/iuW6W?=
 =?us-ascii?Q?fMyyCrDodMOz48R9wqOQ2GAcBRLWrPszX9dWp4K5JMTLYmEySbQlKA4kfH48?=
 =?us-ascii?Q?2iB4HJlpl4W7RPichJJ6N0qHY/BOkUjhNrmE+S+bQV6vMhf+iAzBvHkEneyx?=
 =?us-ascii?Q?wbp+cIHuGXR+OMMLJDrqHuxYLUqp4RCyVeLZCMQ8/XDWQuGJBPbA6UObVlK+?=
 =?us-ascii?Q?nMPQpGMZPoHtkHrvaa0wZ0iVBctWVsZ8u/0zTpHBJBhx/Ay9iqVSPuLDwpED?=
 =?us-ascii?Q?4lgLuYZQt1xpb1ppuihHWEwni/VNDRub+K8Iyyb+IvsHecM7qc5B2e/u6GQT?=
 =?us-ascii?Q?8BQBOeHoTJ3d1DH8h6FlP220qwusZTxK2PNfW66WIGzz5t9u5obZj/XKAVFJ?=
 =?us-ascii?Q?iH/BECCzaIDSYMBwIPs0fDKcWsMLOxdnWYUaKsqWg/pfnOlUWlC0Jv+EQCss?=
 =?us-ascii?Q?8xBobin1u3XenzvChSJmyt+Ax5T7ngZ4vYx+u0BtPiiPVAJ6Q3FKL8O/H1jM?=
 =?us-ascii?Q?nYypd11DFoumvC7czYxA/OEOqlasalssKzYdmp3kpB598czOgUTZiwM+RVrZ?=
 =?us-ascii?Q?/EG9gfjN6fqp6N4wshCFh0ejR3n+2ANYClpaYZoZddZV1TUWEYqevZgdUmuU?=
 =?us-ascii?Q?T+hAS20QPdxCAL3is8wkBgIQmAHPdMRmVChwyD67psCTm/u7QUz4i+WntX7A?=
 =?us-ascii?Q?iUKKnuu6BltlQj4XCHWIP+1Onmc/kfK5VReLbbVtF2CV6wSSOg37CJDbk/C1?=
 =?us-ascii?Q?9w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccebb71-1a1f-4f7b-1be7-08ddbcee6cd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 00:37:16.9967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NxcVsfeMmlAjMLoRJ1m/dHjynVsGSKYqlnz7kovT5nQ+flGI41alff770fTr5a9osa64mIUwGngWiLXRP3CKXDCaKU26KrDQ7PkJC4CyRg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2877

Hi Nicolas

Can you review these patch series?

These patch series includes the below changes as well.

1. The explanation for change of Fix Null reference while testing fluster
2. Reducing the active loop because of overhead and explanation for change =
of Improve performance decoder
3. Making new patch set in order to check EINVAL and add a warn_on around i=
t.

Thanks=20
Jackson

> -----Original Message-----
> From: jackson.lee <jackson.lee@chipsnmedia.com>
> Sent: Monday, June 23, 2025 9:22 AM
> To: mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
> nicolas.dufresne@collabora.com; bob.beckett@collabora.com
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; jackson.le=
e
> <jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>; b=
-
> brnich@ti.com; hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>
> Subject: [PATCH v3 0/4] Performance improvement of decoder
>=20
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> v4l2-compliance results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
>=20
> Buffer ioctls:
>                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not
> supported
>                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not
> supported
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>=20
> Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0,
> Warnings: 2 Total for wave5-enc device /dev/video1: 46, Succeeded: 46,
> Failed: 0, Warnings: 0
>=20
> Fluster test results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.=
0
> Using 3 parallel job(s)
> Ran 133/147 tests successfully               in 40.114 secs
>=20
> (1 test fails because of not supporting to parse multi frames, 1 test
> fails because of a missing frame and slight corruption,
>  2 tests fail because of sizes which are incompatible with the IP, 11
> tests fail because of unsupported 10 bit format)
>=20
>=20
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0
> Using 3 parallel job(s)
> Ran 78/135 tests successfully               in 43.364 secs
>=20
> (57 fail because the hardware is unable to decode  MBAFF / FMO / Field /
> Extended profile streams.)
>=20
> Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2-Gst1.0
> Using 3 parallel job(s)
> Ran 25/69 tests successfully               in 40.411 secs
>=20
> (44 fail because the hardware does not support field encoded and 422
> encoded stream)
>=20
> Seek test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. gst-play-1.0 seek.264
> 2. this will use waylandsink since gst-play-1.0 uses playbin.
>    if you don't want to hook up display,
>    you can run gst-play-1.0 seek.264 --videosink=3Dfakevideosink instead =
3.
> Let pipeline run for 2-3 seconds 4. press SPACE key to pause 5. press 0 t=
o
> reset press SPACE to start again
>=20
> gst-play-1.0 seek.264 --videosink=3Dfakevideosink Press 'k' to see a list=
 of
> keyboard shortcuts.
> Now playing /root/seek.264
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...aused
> 0:00:09.9 / 0:00:09.7
> Reached end of play list.
>=20
> Sequence Change test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> gst-launch-1.0 filesrc location=3D./drc.h264 ! h264parse ! v4l2h264dec !
> filesink location=3D./h264_output_420.yuv Setting pipeline to PAUSED ...
> Pipeline is PREROLLING ...
> Redistribute latency...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> Redistribute latency...
> Got EOS from element "pipeline0".
> Execution ended after 0:00:00.113620590
> Setting pipeline to NULL ...
> Freeing pipeline ...
>=20
> Change since v2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v3 4/4] media: chips-media: wave5: Improve performance of
> decoder
>  - squash v2's #3~#6 to #4 patch of v3
>=20
> Change since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v2 2/7] media: chips-media: wave5: Improve performance of
> decoder
>  - change log to dbg level
>=20
> Change since v0:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * For [PATCH v1 2/7] media: chips-media: wave5: Improve performance of
> decoder
>  - separates the previous patch to a few patches
>=20
> * For [PATCH v1 3/7] media: chips-media: wave5: Fix not to be closed
>  - separated from the previous patch of performance improvement of
>    decoder
>=20
> * For [PATCH v1 4/7] media: chips-media: wave5: Use spinlock whenever
> state is changed
>  - separated from the previous patch of performance improvement of
>    decoder
>=20
> * For [PATCH v1 5/7] media: chips-media: wave5: Fix not to free resources
> normally when
>     instance was destroyed
>  - separated from the previous patch of performance improvement of
>    decoder
>=20
> * For [PATCH v1 7/7] media: chips-media: wave5: Fix SError of kernel pani=
c
> when closed
>  - separated from the previous patch of performance improvement of
>    decoder
>=20
>=20
> Jackson Lee (4):
>   media: chips-media: wave5: Fix SError of kernel panic when closed
>   media: chips-media: wave5: Fix Null reference while testing fluster
>   media: chips-media: wave5: Add WARN_ON to check if dec_output_info is
>     NULL
>   media: chips-media: wave5: Improve performance of decoder
>=20
>  .../platform/chips-media/wave5/wave5-helper.c |  23 ++-
>  .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
>  .../chips-media/wave5/wave5-vpu-dec.c         | 139 ++++++++++++------
>  .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
>  .../platform/chips-media/wave5/wave5-vpu.c    |  71 +++++++--
>  .../platform/chips-media/wave5/wave5-vpuapi.c |  37 ++---
>   .../platform/chips-media/wave5/wave5-vpuapi.h |  11 ++
>  .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
>  8 files changed, 219 insertions(+), 73 deletions(-)
>=20
> --
> 2.43.0


