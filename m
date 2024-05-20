Return-Path: <linux-media+bounces-11632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A194C8C97B1
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 03:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CCC4281D48
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 01:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9409D79EF;
	Mon, 20 May 2024 01:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="K0ODoFPI"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022019.outbound.protection.outlook.com [52.101.154.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DDC3FEC;
	Mon, 20 May 2024 01:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716169549; cv=fail; b=J8K8BcKqv4NIXFMF6hWv5swQY/tzDMI6QKiNX2AvGtrJLjZuyv27kFnqeFEvPDlMsS+99dYHSVBFyS//yyYxlvedjywTLeK1arX4gE8juE7lktrNe6pdK60VYEVt81vX6+Pb1wtWTB3SAXwZF+Fjqw/Lul2LyjrvUcWmcxmE5uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716169549; c=relaxed/simple;
	bh=vqRo0CFrRGmCgqF4Qca4S03+SnVJWLBuT8zGIEPkEWQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rCUa1oCizsN5dxgZeo36VlBYQfedhWERi8yJejict58DitbkWE0rftqCk3hqHinPX7gtnl5OVR4n0GRWAh0/EifSItsZOZXJC2KxsRRazwa+e403MLGdB8yutIDMqS218UEu3iFFbiHtN0wN8gU+ZMGrRDEI5UxIV+PhC5pt5UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=K0ODoFPI; arc=fail smtp.client-ip=52.101.154.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGSabuJtSur20T6L7dGqLSmjsOVu+8LvS7Z8S1dKiHeP3aq2ROLOCy17OEtA777dQorqUbi/WoEDYpVDa0kopZs2mKd3DF3irvbgCVm778mmmDHBv1hHtNClCieS+l4835ldLyjsuZvjHMHKfXLS0M570JH4+9P6BYByPIsX1F+7Bwm75m4uizyGIkRc6SeEioe91su4PcVPt/H+9ExqE7GUZtdfpjTkCn7uH/ef5UTPpE6IRlfnAubznXLhkH7A+q94pRFvIK6RqKu/+xjGG/FyMhsFoGaMKsgdoJmaXlVbSjSBWvaqKyIc30myR1qdqLKimFsgThw+PEYlcxURfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSWG0nlofo9QGeuwOb0Xr1Lt2rP1brU1+0E1ZjbsuRk=;
 b=fYwQMvFGYociNtp97rLKdodPMsuJb7opuNjJV6iB05crcEKEXrbqASR1lcZHZMvNmdSD68u6hVo9YB4xodT39fos2u2Yrpffd0/SWJ3dYfUSSaGV6zmfsTHP/g5QvDrTzWAy8qGP58xp9zwbQ5vOgSFut3+FPCCrQ8yHM5cKLNvHV7ZLXd729xqrNP1Oj4s+ekpcYfBRsZNNXnF0f3yn5lDYGfSnQOzJioUjlzCLibhfyGLsJ3YDD0U43IOcnGRd3gLjUY4M5ric/98o8OyO0gYoOssWmkMd7C/osmBLSUlPd2hhjUGm0lF5+YWRo244srKP6nF3cVUNfHTH6xr9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSWG0nlofo9QGeuwOb0Xr1Lt2rP1brU1+0E1ZjbsuRk=;
 b=K0ODoFPI5Du6CjKVMhDk1v66CuHaHDFEu4t1SozWG/0iThoR1uLI+eVmAZXdhq7x6/pyGm90uAiDTRa00iuuTorzyh185Egcj1cE4qZzdyZoDJ04EBH+KU+FOFZn18An4A1Bee4ULLI4bsCLO/YgW0zSL91FPLaAb4bCmCSD2L4=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1425.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.35; Mon, 20 May 2024 01:45:43 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 01:45:43 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>
Subject: RE: [RESEND PATCH v4 0/4] Add features to an existing driver
Thread-Topic: [RESEND PATCH v4 0/4] Add features to an existing driver
Thread-Index: AQHaosxrJnIsmYodQEuWO9RJve6Fu7GfaNLQ
Date: Mon, 20 May 2024 01:45:43 +0000
Message-ID:
 <SE1P216MB13031A560625CE8C7614D5F6EDE92@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
In-Reply-To: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SE2P216MB1425:EE_
x-ms-office365-filtering-correlation-id: 41461cf8-aac3-4681-9fea-08dc786e8f9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?2W3aBNUAYN59TCJkkdwnC+AeUWC7Y8y2FKptEcwhrgXNR6k0He9tv/em6xYV?=
 =?us-ascii?Q?9OJ5DukTq1m5Isf/7EWi5Gp0nU0uVpe0lxO2VqxYF4HMBZVs6lZnbWp2m66b?=
 =?us-ascii?Q?9lpRQ9ypni4DZT72ZwQTkgSeN9UWZLmn8ZkpCU2Ms+8a0TmoCpl1gT9IFrya?=
 =?us-ascii?Q?vJIvytHiIRF2HmQz0u9Gnyyshs+EyIJLeiOacZ142yoY0rgqgCtddQwNz07d?=
 =?us-ascii?Q?jBfQ0ZP7g3zxKTMmEd29I6Az+ZLHmqheWU14V3MqIleVjwFYYpzXScIkC4yK?=
 =?us-ascii?Q?qO5M/5VvMUkW6IMZZRYgpfAMYn1FK+euC8x+BX6dlfNxJMMmH24veS6IzpzF?=
 =?us-ascii?Q?NXnFbqY6gQbs9oGvvXW+xv8wVYjVj90MAhLmzebUjAxHzkl6ESXdpnjzo22/?=
 =?us-ascii?Q?OnRGSDbbcZie3fkQt2jEJ7viBOL7L2ufPmUcmEITGlSnE0p7vqQJNh1WwpSC?=
 =?us-ascii?Q?om00vmWMtKCYJqaSlVEefduUzGFs4QBm7wEvBrKVVo63d3WLJPvIH8gBRW5k?=
 =?us-ascii?Q?S0lOxjdeDnsfeI3slAh5yP/9hIWM81wkazIHJfQkyj5E8BIIuWHS6wRYvnhU?=
 =?us-ascii?Q?GmnxKsNi+ZTtc9IsBIlTKrT16mugV6l+XrUxMT4wbJ7ilTAFvEj0/6ejRX8Y?=
 =?us-ascii?Q?JEp4gvArsDmKx1WxKYktqxzDbe6+Z6udRCgqeZeBF6fe6/st84m1WR+np/ep?=
 =?us-ascii?Q?MwBuraO+OPc6iJfo/Fcdfhfsb1+yNaj5Yb5w+Yw0rNfHwwR0DB7lTI2YS/oF?=
 =?us-ascii?Q?Z2yU9PdfTkUTIYK1mkd7gVadfuhi1HN8fxQVIh+VOqAeHmKMAlMpw6IaI2jC?=
 =?us-ascii?Q?X+5Sj/joUpBrjsTPHXs9yBRFKq06DWMLnqdjOoiL1oOP0FOccjXI32HKlFmb?=
 =?us-ascii?Q?xPXwNDbaWtIpz6gJr8T24DW7uYt/W1lQl8isS6OqLy1rRbjrAg9lWt/iA5Vy?=
 =?us-ascii?Q?9Y3O6nZoXgkGyqufuN9qvuJw70K2x8RA6nRImyIMoBp5t6j71cwri7tM5aYg?=
 =?us-ascii?Q?PCZWol3mTkCBxNOPcwj4Dgf9XE5wWlVrrxboiHUoE1tCKfIj7w4KQP5uJxIa?=
 =?us-ascii?Q?CRdo5FtzeYNPo6P76j3IH6Hb784oBPHsHXlN66dL37YG0hKWcuiQpNbZy/99?=
 =?us-ascii?Q?0aDLAbsCfFa+wfcRnaZvxxH89H7/H3sFF1baJqtQcR1NOdOasR4IjA4pndbJ?=
 =?us-ascii?Q?JMo3nnyoc9tKFNY1CpvfyT8u81CT4XQFpUEaGfZ9I0QR9CMqlli0byU0fQqa?=
 =?us-ascii?Q?PF5IX3xocwURwhZaGI2459CbzlaRobBoJiaoJR4Q1g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?deRu/0FrRsANzoS1ivobQkz9UO+veqrm70uRhlbwNY7d4XXK9TXSjWWHJlm6?=
 =?us-ascii?Q?FKQpiTimkOBpQskBqJkYxveczM/82Dif0wbudoBkdLJGigp5qrU5s/TA/DqK?=
 =?us-ascii?Q?4AxlaxnHxof/dm/NQA9vVTE4xegrG3AzzDGTDMdn4SJuAdx0tOqZUtols5pH?=
 =?us-ascii?Q?RN92B0H3KptZK6of1/Ebo/xnB9EsczQY4KPViGBCx2Oi2XCmXiMIbQ24dTcU?=
 =?us-ascii?Q?5IGEfkt/fIib188HCW1jIb1KjMfSxz0kfHTPYzvexAFh94QTtx8muqST0Psq?=
 =?us-ascii?Q?dIPmbT5CMrm3nXg1bHsNCtJVeK6yL7MQMjjl7hMWIciVUOaVfWaH7WN1IPsg?=
 =?us-ascii?Q?xkvLqyvJthPxDpzsHd9woOEwIqyH6fTQlxklk9bx4bYrjlJqx28j87FTWhCX?=
 =?us-ascii?Q?oLve8GZlVkazhVA6TRbI3B9UTr6nEEM2ttVY1NZ5zNS4BuP+UA+fmW7XFiBd?=
 =?us-ascii?Q?NQ6J3i9Y8lXaPkOXyyD/5RQ2Zwx5cTH2/pf2n2qJCAhRTPSQgO2jv+AUeyyT?=
 =?us-ascii?Q?j7c81wVgOuv9jN/gGyaksncb+y/6P5CZJxNEbRLofuXqQH2jNuMkSE4rBfBS?=
 =?us-ascii?Q?HDz7CC+pqvB3fJ/FmVEduCjVQtJgEHNu+36gCuEqsyVspmK28ZuhDD8vrv+I?=
 =?us-ascii?Q?SaUKmRkfe/Ox5RRDIj9jc4fxQaPYtRlo8az+RQ8peFUM1P2Q7k4TGZ8Sovzk?=
 =?us-ascii?Q?U+rgtDbByTdq7XlKOLWFW0aFnCtdhtzBLHPgVqo8NMtFJ7rVVVTfwlDrYnlR?=
 =?us-ascii?Q?QylBAC1NjcC6KadnPk8xXv8VdtEYlrhtUhKEZl9s3o2AFt4MZkOuLy/WTx/N?=
 =?us-ascii?Q?upVBVmMDk+vNS+wGb7ld5H39zJvCRSMUuL6MpIVdwh1eq6nEANjs77gOjbxN?=
 =?us-ascii?Q?Tbv7CEFEJKtAm5PWa8bleWjyJF+B9xe2JGNDNyZ76wd4ZLE8yDewbxC85SEN?=
 =?us-ascii?Q?TUDb8k/KkhXgRdwFxh7BQphcpxOBOtRjE+Wbb+NgKKztwoivbV3hYfcFn0yO?=
 =?us-ascii?Q?ONuOOIbrax6kzsdVOrzjwEAUW33CIFTl1CCeP4K28kEjjK1Cg5ezHu4BPCmx?=
 =?us-ascii?Q?frNiDBSpu42Or75tuDGLuJr9QicJT/LaecJVsDJnYwjBZKbjBpE9zqzfF1k2?=
 =?us-ascii?Q?sZazqnxYOPvE5bBCa8LnUMH8AenmLJykxuZjj1JIVfmxaflqW8PRg/oAgHyg?=
 =?us-ascii?Q?5Eki6mJ2yT+xe01w+SMY1Lc0amHHmdADIgm0qYHBMM+oGA/Yeg9U/KKkYVl7?=
 =?us-ascii?Q?IfN2/GiEMq12YVJQpzxQRvuMUw5hwWJDEl48bAMC7tCgurtncZEuRJ2XFFkw?=
 =?us-ascii?Q?M1T2qS9A4ZQjPFfTU3bKpUVQrvNMs6/QozGkulArww2B94v12qln5KIoDWsX?=
 =?us-ascii?Q?ImOh9cnbI785M5DNAosllGs8S3vLChkCqkufwXHdaMgAMmKkQXC1BiOeRNO9?=
 =?us-ascii?Q?uQYd8NFpHx9f1YWfQB1YhChNwkuDIdIEgf8XwmDzXsArcLiLpNmKJ0KzC+7F?=
 =?us-ascii?Q?tWjDAIiEySzIsYDVIGTlFVF3Dt/J9nAVXABd5hJmKgDXDeusiNEXEDaRapw/?=
 =?us-ascii?Q?X2IXijb2AtR3w4faVButVN8vhL4br/9hkwMWwTepW4Dl8+gGF+rVRJiK0794?=
 =?us-ascii?Q?2A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 41461cf8-aac3-4681-9fea-08dc786e8f9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 01:45:43.0720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NgsiJtTZqw5hUG/jioaqckxy+cfSrQJ1eMSdV7BIZ4xiot8Cv/EJp5AwHCbOlYVZWhg601azzxaYnKnWf9ZFivZjAXrWZwsTZhj9fc0WxC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1425

Hi sebastian and Nicolas

I sent the v4 patch. Can you please review them ?

https://lore.kernel.org/linux-media/20240510112252.800-1-jackson.lee@chipsn=
media.com/


thanks
Jackson

> -----Original Message-----
> From: jackson.lee <jackson.lee@chipsnmedia.com>
> Sent: Friday, May 10, 2024 8:23 PM
> To: mchehab@kernel.org; nicolas@ndufresne.ca; sebastian.fricke@collabora.=
com
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>; lafley.kim
> <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; jackson.lee
> <jackson.lee@chipsnmedia.com>
> Subject: [RESEND PATCH v4 0/4] Add features to an existing driver
>=20
> From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
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
>             warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supp=
orted
>             warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supp=
orted
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
> Ran 132/147 tests successfully               in 97.421 secs
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
> Ran 77/135 tests successfully               in 37.233 secs
>=20
> (58 fail because the hardware is unable to decode  MBAFF / FMO / Field /
> Extended profile streams.)
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
>  .../platform/chips-media/wave5/wave5-helper.c |  24 ++
>  .../platform/chips-media/wave5/wave5-helper.h |   5 +
>  .../platform/chips-media/wave5/wave5-hw.c     |  23 +-
>  .../chips-media/wave5/wave5-vpu-dec.c         | 312 +++++++-----------
>  .../chips-media/wave5/wave5-vpu-enc.c         | 300 +++++++++--------
>  .../platform/chips-media/wave5/wave5-vpu.c    |  43 +++
>  .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
>  .../platform/chips-media/wave5/wave5-vpuapi.c |  14 +-
>  .../platform/chips-media/wave5/wave5-vpuapi.h |   1 +
>  .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
>  .../media/platform/chips-media/wave5/wave5.h  |   3 +
>  11 files changed, 414 insertions(+), 343 deletions(-)
>=20
> --
> 2.43.0


