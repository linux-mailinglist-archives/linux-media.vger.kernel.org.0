Return-Path: <linux-media+bounces-25975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B4A30283
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 05:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AB861883D64
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 04:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9A31D88CA;
	Tue, 11 Feb 2025 04:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="QA9ECc57"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022075.outbound.protection.outlook.com [40.107.43.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C66626BD92;
	Tue, 11 Feb 2025 04:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739247824; cv=fail; b=DQUf7gS9DsnUxMGNzBuBTL1wbTVh3xmHm3aW7Lxc76Ef5u/h7krNzGWo4tlV1XBEFvGOwPetUtu9sDZDKdDfw5IyqDSP66uS7SQp8QFqxUR6ulJ5p7xLS8CaL1NelJsuiZQYC1w22MZQwIefzWQiU//pWoKmLkCWtcOssRF2Vj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739247824; c=relaxed/simple;
	bh=1TEwq4wCdW6dI9cRDspjitDPSigxuS4IW16WDXP+H6M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GT+lU25DB7oem9QxW/pMT7+ge4QTEntyciM48b7X0nIzEkfutm7ZzmF1pAlqVmLNxdPmrZR2oQlYUsm1pOtUxSuibVqEnBbFKNPaIm7r7BJRs4ml+l7FWNv+19cCBcLZ7TkNEcDMSehknhg+VFaeJW4k+VWtaFEP+J8e3Y3YEkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=QA9ECc57; arc=fail smtp.client-ip=40.107.43.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGZZH3zBjgZPT18+fdzVNN1d0tI/i/oeMjZcTuD3dTPQN7uaSJ2Mki4L3iUw1dv3gKcPmS6AOXvpgfk5owW5f0CVvK4T3q6H34VS6f/h0SpFLJjrzL/Dwt1QBLrvCavFLD/eJ5bRw340M72Gwk1jmMh0drT9Scysvtt0uEHSFS7H03tnHMZoUI6BBh9J5489P65JJj21eIbMrSAKsX8F01Ce8a9wEUhCiK89Wr9WuQteZpRsrQvIbh2QAtyJa/fxLCqpS+anx/vI4p77xuQp412Aqrz+lTkWYD0A7tJjVEBJsuZUNz8KQm979bhEgv2PGvdrpUYKxK/9+u6ZFD/XRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCUvOFYoeytzNSgKr4hsZ2X6kU3OJr2x1nG8nOrrD7Q=;
 b=raFpXdcz9xt03sJ3xLWbw7Rfo7xS5rOvWoSIGHCxhs6ZnhKUu1DYU8w4UWauenH8gM3r0+7Ww/YzpCVVKnbBrB885cEsg9raJV7sbbneKGKG1TqpiR3Wy9a5m8GhDaOwdby/WxV4kwhJrCJ3hBClAZRmay5+MOQpysw6Zk+9xsvxlJdSvWVeLgUb7j0XonXkJ9OgYvi42zfIuP9qAiyv0F1Ur03g8FeyKIKX2DIDJPSntXLTHg4bznMmGWuCILZqyOHHnEqCNF4G2xuOv79mRl8SPIjNdzq+2xo3q4IQzP0CQvL2EWDznPK6TotuM7AeoRDCzbbQDxhvysW8jDKIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCUvOFYoeytzNSgKr4hsZ2X6kU3OJr2x1nG8nOrrD7Q=;
 b=QA9ECc57z1y2lCnJ3kcK9v/87gCYW2AjQrzYhbvGFrFsd81TensX5/HjLLokeKXYTKxAzR7rlTaBzLy1NNmKV1XyKftaLN69XiOncfUrPslOVq4swXp/dIgXYbJ+YOcEDP9q9pQ5TeTGuTYpULjbMZuL+ando0LCgjt80J1h9PM=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PUYP216MB3034.KORP216.PROD.OUTLOOK.COM (2603:1096:301:154::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.19; Tue, 11 Feb 2025 04:23:37 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 04:23:37 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH 1/8] media: platform: chips-media: wave5: Rename Kconfig
 parameter
Thread-Topic: [PATCH 1/8] media: platform: chips-media: wave5: Rename Kconfig
 parameter
Thread-Index: AQHbe5s5mvUd+yJT1UyIraYl4c8mYrNAygCAgACP7XA=
Date: Tue, 11 Feb 2025 04:23:37 +0000
Message-ID:
 <SL2P216MB124669DDF06578F9FA509BD9FBFD2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250210090725.4580-1-nas.chung@chipsnmedia.com>
 <20250210090725.4580-2-nas.chung@chipsnmedia.com>
 <d657fa70-af35-415d-b0e7-3aaf2fd05276@kernel.org>
In-Reply-To: <d657fa70-af35-415d-b0e7-3aaf2fd05276@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|PUYP216MB3034:EE_
x-ms-office365-filtering-correlation-id: 16d7daa6-7880-4923-1aad-08dd4a53dafd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9GphgIPfFP1KT5yFw6z5RDzdRTJF54LFKGvu9P8fjNyAY5obxw4eIMjiIoo6?=
 =?us-ascii?Q?+ONZq6ZJ1+jduFeZhvAUbyeTSxkNBwiSCib2OmQXCRfjsCFBWyvpzOP5A5vK?=
 =?us-ascii?Q?1A7EE3yvhVop5Gpwa87EBONXJ07nqYKtMNW4tiER7oBr02swhJ19qKNumunw?=
 =?us-ascii?Q?3t7B5/bg3v7htPg5+0BKMt78Ky1XmioVN90MlYhHc23gKfV5GTuo3AxTArpF?=
 =?us-ascii?Q?feuMd9IZuvG8rUXmkHXHFdbQgiwayGbZu7YmFrvwtrDQUGTeA1HyRX8w8VzS?=
 =?us-ascii?Q?OGcX2hNidaU1wJj+sDWCk3LesmcitijBHUGUkWSJG5Xwrm01AuF7FTCbHlKb?=
 =?us-ascii?Q?QuzIVMLhfka/yNwkyPWoZLFlOJdwyGY6sHo5WMQ5SW1IfhHbzKWOFOoAKNOf?=
 =?us-ascii?Q?wRopXhfXfhu/H1gFgYbi2uhs0elMpAMphtY27aO9FfE2x+1s6eynYwmdgvrL?=
 =?us-ascii?Q?StXBrJWjZXNsIwNYSQ0tHz6rAfVcOof75uV01zg3SFehQKwEX4nfzqgiW0vg?=
 =?us-ascii?Q?cCKU1l/IxyXEr6sKX7bnPYUPMLpiZxtuNQnkCXqRZ1S7v7MkZnbTVi76Lnqn?=
 =?us-ascii?Q?IwQXJ5AEu91Kq+xmZ0AQQjwGyU8xtAfvZJiLQmMAvbmAGSt70zf0ihHeAcIy?=
 =?us-ascii?Q?O5bSkX8o3/bq6SJhTGgTQCIdOohOwgq1uzuANqMZBA3bvwNia8VGImUw9PKA?=
 =?us-ascii?Q?uyBpzXwKDI8QkID1Rvxh87EUnG6VEG4clsODOeyaoxq41VOxZLNu14xxqWaO?=
 =?us-ascii?Q?r9SDFoSYNoFDiOY8OT4vfBdFFXV7p6UxZirj4HnRAioQSpqNIWfCmg6vc4Ay?=
 =?us-ascii?Q?gyuAnsybtR2gAeBimxy3VWw6r1JNrTI64h3pDCrOAB+Se7K6VPrlwkj0u+6v?=
 =?us-ascii?Q?9M4tk4dTrwoRFIs58ewB39tX8AyEaCnSpeVf5j20ue5VL6+BrhV7JS4I0OFh?=
 =?us-ascii?Q?sTM10Up4+XhcKSAU63fBjfjM7hy4J2+6XMwSEeVJt8PDag/KXEQuFBA2ahcW?=
 =?us-ascii?Q?7UfMMBeaHOhqm8vqpm6CWwKR6u2/Yv2PUyhadN5QPPablPt9qYVR4YxeqwY8?=
 =?us-ascii?Q?K/zvMuVywfsLsDqdIhJDnLprHT4RyhsuZkwP8CUucKpcdayduiiwBjadiDNy?=
 =?us-ascii?Q?8u/hFjDh5k7LLqKLvH0a3SJaOKVAor6DQHZBvfHQGY/MVeq5Lvo3dwuRO/Zc?=
 =?us-ascii?Q?3K0eKQSl/AT97mGv1PaTsX3yD8mypHUz0rV739nIlkPXuX3LeSKDoLbZDSmR?=
 =?us-ascii?Q?V7fRGjwGUqLtYD23QPku79KWzwPD90UIplM50Ed1QBnZfc19g8eLwuqeaxI7?=
 =?us-ascii?Q?mxlDyIhFA8tKpQA8gg4l3xUBd9SMUI6q6FI6Bo/5kkedWya6bm8KWLV4Wt6K?=
 =?us-ascii?Q?sMTM9hDPCbqf/FA7Utj/Vz0awa7uINt/bSZwYG7ypwpty5lba0TcgpnJknDt?=
 =?us-ascii?Q?FAtJE9Lzhpw2S49lekPYARwfwXrl9idB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DSueKDEvqAK1mWs6wGZ8F2fDbUAi69lybw8nPYkc84u1e1DfymVOs13PgFaO?=
 =?us-ascii?Q?MezrStV5gLiGqUJkHfvx1UhKnzcVm9zQapM7d3TWm5LEcMO+q7a104FA5IsY?=
 =?us-ascii?Q?QFwVkowjStROq5pTP7d1Z9Ac3K+WDkDnhX4FJUi0eAC3i3w6wrup4WNjMLjd?=
 =?us-ascii?Q?v2j4rVA7fSbyARBdZtiRujtzRhVuiJrd0+eXvsy2COUWM0cC1mwt9202kWnG?=
 =?us-ascii?Q?mRTmbOYk4YK9fRLhbU84oCs/ldWVH9KBSPsEyYCe66y7ApcGBg4Bml/oqh16?=
 =?us-ascii?Q?cczfwNOZO53zvG85PWQ5ImG/XCE0cpCzsA4+SD41m3OE+PEDnXrmSA6Ag0ca?=
 =?us-ascii?Q?iYGgog6Js2zl0rKycUkNbEckFl0IgjAlWUBgcpLgUr6Tb8ojXpjA9ISgb3v8?=
 =?us-ascii?Q?HE3BtKSsORj2sQWiE3yNHS1KmCWkHf4moFRmBF6x0WyW8i4Lt0ex1NJy4Dwe?=
 =?us-ascii?Q?oM3ZujCqHLYAVFPq9BvYh/8P0PaczuqrfoVy3RNQERL4+sKZ6oUzGlL05MWl?=
 =?us-ascii?Q?Hs7Dn2yl4A2rui5v6JgFPF7P7VFYE+4hCwkQT+n6mjr6WwyewrsMehrEmklB?=
 =?us-ascii?Q?yLo4HY2j8LzXzf8lpY3T4Rgny8B36kIBkjzBbmnjewsd1KI7Ex+82G3heAE4?=
 =?us-ascii?Q?ZWgQQXz0tG5mKpF5AFapJv2IMyp8RyJYHBy+h8x0twFPMqhvWDqC1rVJCLOe?=
 =?us-ascii?Q?hIlAxIgU264i2cnwbNF4oeyKLYw6IkiXFjYZFXjR11lpbOAxSu5KcdHW6bc4?=
 =?us-ascii?Q?81vVBM0HAbRXZtXbBowAQV9G8jDAN28ywJDlzMP3ZHs2UvxpnFAo0cQXC35W?=
 =?us-ascii?Q?xDVOzIAKs7i8qze1jUUUIAcs392knL4wTpCNKoM4vNFDMsyIGpABpkX5OZ6T?=
 =?us-ascii?Q?Pc13ivmnWw6F3EH0DVrgf+lD1EgyUoRzLws3r+05+N6nuHj6IjFDT3zGZJzQ?=
 =?us-ascii?Q?MNyD1j6iA+oXm0UxKmpMksmlO175+onJBrdgDM5efco31mZdfylR+pIv1UZr?=
 =?us-ascii?Q?7XwjD2GXMecQ/BCqlz6btAXgCzjfjSMRHxJb126G6mGFJwhBiPnQqiBLgKWP?=
 =?us-ascii?Q?BHW4JOxgW3oZbpPbTY94G42nfkGp8iTBcy24WAsYUxuJf6KwOYkulj0nDmpD?=
 =?us-ascii?Q?A3woaCUeE7XvoAF+9EAGUGVXoqciQByUMb6wvdcgVtfBw9T7+lU5CYep6EoN?=
 =?us-ascii?Q?QcnoxejmVsKCpkwfDDWZQGmd6fY+dGW9n+HIdqZ0X7Fbp23JbFenBHRoWOHz?=
 =?us-ascii?Q?axaYJ8LcvPL6kR9UFIAr3vSpolXGu0VxLpf0QkWdB8KwCI/uAf/FDZGgf3+Q?=
 =?us-ascii?Q?3x7O1MxSEG2LbzuC1FYQN8JGydRuPXzjqngwNLDgHbOCLtvNtBiZHYRNNKT7?=
 =?us-ascii?Q?xV09+Tzb6LwGI85N+w64VNHPhCQm8JdMMpjqk6ikXSrBzJcs7Kp9xh0GkJhj?=
 =?us-ascii?Q?hGnHcGDlwKNoix15UwURgjx2n4HzSnnIVep0C4UhH36gmyAYR9jiJMITKqLE?=
 =?us-ascii?Q?dEwsCEATu51MRPVH/cdbj3LKoeMvg3BC7RUKG8uu+EVz7pARMJHHAO45TYe6?=
 =?us-ascii?Q?jLUeegDYHXCUJe7e+ljOFmdDT/vTX9MD7iNdMcJP?=
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
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d7daa6-7880-4923-1aad-08dd4a53dafd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 04:23:37.2860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drinfx7A+k8VBrxt3LLzG+869E8kws2QdRXa1pF8Xhr6ilR4e+wcYVYbW1OjHuH84wflDD2W1Vkec3a2cAaZzxxBIoHBK4kfgPVTyPd5ig8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB3034

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Tuesday, February 11, 2025 2:24 AM
>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; sebastian.fricke@collabora.com; robh@kernel.org;
>krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH 1/8] media: platform: chips-media: wave5: Rename
>Kconfig parameter
>
>On 10/02/2025 10:07, Nas Chung wrote:
>> The existing Kconfig parameter VIDEO_WAVE_VPU is ambiguous,
>> as it does not clearly indicate that it is specific to the Wave5 IP.
>>
>> Rename VIDEO_WAVE_VPU to VIDEO_WAVE5_VPU to make it explicit
>> that the parameter is specific to the Wave5 IP.
>>
>> No functional changes, only the parameter name is updated.
>
>
>That's unnecessary churn. Old name was fine. Kconfig does not match
>hardware 1-to-1 but represents only the driver name (or not even that...).
>
>If you solve any particular problem, then explain it. Otherwise this is
>just unnecessarily affecting users and backports.

I understand your point.
To avoid unnecessary changes, I'll drop this patch.

Thank you for your feedback.

Thanks.
Nas.

>
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>  arch/arm64/configs/defconfig                      | 2 +-
>
>That's a SoC patch, don't mix up subsystems.
>
>
>Best regards,
>Krzysztof

