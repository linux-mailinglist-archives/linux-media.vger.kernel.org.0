Return-Path: <linux-media+bounces-25525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7626A250FF
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 01:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A32203A4131
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 00:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADB8BE67;
	Mon,  3 Feb 2025 00:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="iOWwzypw"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020084.outbound.protection.outlook.com [52.101.156.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922273C00;
	Mon,  3 Feb 2025 00:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738544088; cv=fail; b=QD4/42WPXROyNn8uLnYuXvBcvWpJD4YKo9SmgPqoBbjOQpMuUMopLFCkKTUqGho7E0kaVBPFstw/Izoggf0b4N8BA67+SHA8rbcEUwgAIYdOPJizro/c+41AK8cqQL1P+0fKdNqw6adn3IWjZp9oUXO4qrU4kOVgOl4mGLJ2MYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738544088; c=relaxed/simple;
	bh=Tfe4YyK0c8loiskQpwVhLyLbREpiUgaQJ9rAGrUg6Ig=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bFo5orTfuhVk3ShTNHazEEEOQHmUEuR5yndGgqQEBR8M+UrapRTILchJ2ovuenrD8b1tlPpOF9b7irG2B/5Q+IKavNoyRnd3Og8Ir9Ihb8lLKgsxkenCZGhAG4F4Bu/J7WqHuNGNc35KrqwlaJdaSMNmfU+tYSczMO8dYbIpYC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=iOWwzypw; arc=fail smtp.client-ip=52.101.156.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g92pP1Iys7xRIfbNHAzeDi7qwYII1cYuPKax7DELJGasvItFbDPLc1kYD1/XqDKMj1ZsC1SEXzzR3IAxzaBu5XRiXcXFRV/5aR3CB4vRgQzAhQdyxx7sftxNY1VKw71/RlvDSEzeJUMeZowY7SwKDB7DJdoGVrR4hC1NnO9nYLzSwPWkrKzswNQKXTgWaxvgFJQlHIBW27978bBgKb7oNaNxlVkGIHkqY+R5tSpUfQktg3AgQodZE/3ZbNwE/Hr0f1QVpfHTIk0PN6MvcpfeKPQG/itWqE3YtLzu7vkAQAeIJCWUfi/M8alXKyqIn6O+C2xq5bIBKFg672D1xSnhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VSnauVsGULiT6AMPYIbTml6/HCrCF1vz97ky29qYkY=;
 b=uJEwEVDZDu9ZfAEQXCi8MOTtNsJYXI9cjLp9jDBD/yk9vjJuZXNJ8884vSoNvbB2WDxuq1qVd7p7V13Ute1RK/VetV4vhDvRgqexyAn2vSE7pWOwyt8ontgjlP3b6Jc9sBUL7dNbHxsSvaKO5s23hx74T1ZSCjibjGfWssILL8yDN3I6iyXkJxpSHSVlYHLW7MWABVujpbLKTZR5wmz8HRPDGSxU8PygzP7Ds/48vCy8nu0VWKh15bf6jFQOgXFv4pGNTCiGUtZwEYVQgz8Ilwi7sBCKFkjrPcRHFaqzLBokebNjqhou4D9DsO/npMq01g4smrbF9Zea+OfYporzTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VSnauVsGULiT6AMPYIbTml6/HCrCF1vz97ky29qYkY=;
 b=iOWwzypw9Vj+Vu85EZ53PUdTWvdYKJEisjPexhIrENdehUB45zWCNDcZ6asxLseK+kjW5zC3Lz67Xi3QgROvPIzKTmgZwAT2KzdoaswoKpvXHsGl8/pRd185I7q4RrjEuB+Z35VA2Wijm8eC9OncSOm6kkPLvBpl+njERJ5O6Ik=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB1253.KORP216.PROD.OUTLOOK.COM (2603:1096:301:ab::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.24; Mon, 3 Feb 2025 00:54:42 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%3]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 00:54:42 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v2 0/4] Fix critical bugs
Thread-Topic: [PATCH v2 0/4] Fix critical bugs
Thread-Index: AQHbUD9ZcOZ5zsD26EGOp8V6aVRwHbMKqRfggCpiZTA=
Date: Mon, 3 Feb 2025 00:54:42 +0000
Message-ID:
 <SE1P216MB1303D842726DC672712B1F1DEDF52@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
 <SE1P216MB1303385EA4DBCDECC5CB4BA6ED112@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SE1P216MB1303385EA4DBCDECC5CB4BA6ED112@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|PU4P216MB1253:EE_
x-ms-office365-filtering-correlation-id: 30f206df-9768-4eb1-135f-08dd43ed5833
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dDA4qPvv3b+S5Lau3RoIZKa8wAh52Y85dzNSDyly+aPPzbz3ZpqzrNX58lUb?=
 =?us-ascii?Q?XbotsQ9HoGXmdNjw75QjpvpKYzZr6SnNRCv8R3k9/isgxZmcBf2s7DAlPy0G?=
 =?us-ascii?Q?n/i9/8vcUanf/WkZwQAb93NVVeY0P8W+ZHYNuZs+rwMZAsdUO+Td/fUsrRNT?=
 =?us-ascii?Q?oazdZJn3ufVOGLqgujx4YkxrdF1+dAigfo+iGDPetG/B1VtaNLCXOcVG4o8a?=
 =?us-ascii?Q?dd+ALRdIhRtjbm3Q1kZPjIdbLyE6XwNLgIBc0VvQ5Zsy8THi6BZ8kzZTcJNt?=
 =?us-ascii?Q?e6s6UsENTjX+DqSpXOg+YVk4omIXloSP2EZ3nsf7kHP3hDYLLMZq2vyLPVgq?=
 =?us-ascii?Q?bB9VB1gmbXx4ybgSJ99KZoaHhs0XsYM+qY/qMVZRejb+2effCZx88hg+oUwi?=
 =?us-ascii?Q?/TzrD0E5C+g1kcc9TN4X/xr1IzoIMhGipBXOyxkkfY8THXYMmHuQE6cXebHS?=
 =?us-ascii?Q?7XY6iFA3tQ2RZSaUSermrdzkniW+AidRDCCDhmAt77rBnbk+uf6QYQyoRHVw?=
 =?us-ascii?Q?NHFZz3O2L2GmE0cDe1AQgME+yIet7evAJLMbfyPSTyiA6G1qT7Ma/Y4DvwTC?=
 =?us-ascii?Q?4NxGtXjn3D10teqvV0D6VpG7k+bLZCYkNmQ9rUJGquMfFUjat1YoY8IXNWcS?=
 =?us-ascii?Q?EmetT8CTXyzbz8kAkkgP+fbrwZ+ED7hGq07THkKJU7+iMZsQdpbPGcgXaBQm?=
 =?us-ascii?Q?FU7rmPXttHe1LhtjWxcvFEEUR+ie85N1x+pe7thNi7locvz+KBQtWz29gLWK?=
 =?us-ascii?Q?b/tLhKmHiK4xg6HuRYuXIyx8rWfnUyTSaHC+iIaSG9nWzgQMC2EUtwWgXao6?=
 =?us-ascii?Q?Bn00fNFBO9NdxEvuCxBybINDHW1M6AQLy8DlI7BoZ5m4/0NRFmJXR7lx/ylO?=
 =?us-ascii?Q?csS4GWxOU1JSaeeN3sGRQZ+7ZlGBnKhxCL3Fqgj8Ot4RbX5xQo7PIM1F54KE?=
 =?us-ascii?Q?cntV5mTFpKVZ7iQenw+LLPWeMUyZINswdqN1MWyI4ZaMzjd88vGchJr/4PXZ?=
 =?us-ascii?Q?Fkni9UAEQubEepBelrHVGkALE7jBS8DYtm/mFLSjR4hnzdC50El5JJg0hYIx?=
 =?us-ascii?Q?eV0BggHUv6rsjjy4C/3s72sqO0xoUawlx5OvZJ3Dbensb+aTH3HOyZgbpUqL?=
 =?us-ascii?Q?TDbKLbEbJCIh4i+JSMfSAFuDz7EibSZINoI0fguWxnD8CVLrRxpUcIiDLaWb?=
 =?us-ascii?Q?p63skzY8M0PBcQcCW4ojIFhhtH7t1yHju/PVJTej8wE7U78X382E95APeGI+?=
 =?us-ascii?Q?wGo+m0COu6muzS7sUBBNh1VnoxPwfqeWKub0FcirqneAwLY1/yZL0O3Uw3Tu?=
 =?us-ascii?Q?t71Kyg9Esd7AHZOqZgtAMLMV/4oKMtffvSNvgMx+uBTSg/v1bBfCV/1ppIXV?=
 =?us-ascii?Q?yrtvyH75bQhDkvGqgjupQ6C7TlP6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9EHGIe4a9r5d514GlbJZcJV66SDw7wTZEnaa0BylCGrRriBDO7MCG6IiiTiF?=
 =?us-ascii?Q?dRsDi3RETe6e0KP9gZQKkSjHUjaaYbgcvVFVmL/ha045tpW48hcoQume7P/N?=
 =?us-ascii?Q?qrbbxlFS6dyKm/+hplLvjfP1iURnPjN7yZbeKOj4ltk1GkugS7CXcZ1/r39u?=
 =?us-ascii?Q?hEVQa8uXJi3W0360hdFam7zw2CI0A7CNyOl3DywCdiEvBAJQxCLF2NYynGOf?=
 =?us-ascii?Q?N/jKbQ5gr1OIiTnTDqn7gTbVNmiRqWM+Ird6W0U3Raaj2zdLz2Mk2E6BrPCb?=
 =?us-ascii?Q?Be0DP16Sxtb2ws0sgaOOvd/oSiWuEfJKcsPE3EO0hUOtpe3r6su9FWoftl3e?=
 =?us-ascii?Q?an3RmXmxoi37rwFLEXLp/x9QDMxIdAtc+bRPAP0UxW7v/+eBYMEb2DygrnBe?=
 =?us-ascii?Q?PLylvCMblXUamSrfPUSmwrOsTVk5lLhB7bt3XgoxmUeWgLT36PisCRgu+uNq?=
 =?us-ascii?Q?1AProKXwkfsuYW0T080hR9B/1kbTZNfyaGoz80I2wYwbwnoXs+fx2wbVwwCo?=
 =?us-ascii?Q?riMDDMnIN7xscd60P8/AcKruqQGEcPEoNrJ5DNAJu2DUBHkHWxs/mitWnX1U?=
 =?us-ascii?Q?yrDgOTKtV+sylpi1jXQPhvW8LjcM9nszwc9DFBJV+SWyfw/XsCxofExNzwLN?=
 =?us-ascii?Q?AW99yM+CbEoGQgyVaiclxJmF5UetvHMpxzLP/IXWI2jgX1a+zEfUC07kLWPK?=
 =?us-ascii?Q?nurnVef4MT3oz3B+rEwej+r2f6LjFwmIj/7kDQodCv+DBxhYVWX1EUhCwtjX?=
 =?us-ascii?Q?o3dUzFI8Fr8djejxR88CDe5xotFJf9UJ3LQ7srDRC6CI7hh0EjrH2Y+dHBqh?=
 =?us-ascii?Q?9kFCCxMGo9jRoBIGhWruyLSGVrnI3RLVuO1qEFFJE+nNGYS2QPuxj4llWBf+?=
 =?us-ascii?Q?IkJHsuNrKitjL2+jufFx8pcfduDTxvqhAVTZK5okctsdKK0ji0/fnDeZRpCA?=
 =?us-ascii?Q?weUGM1zOXPc8XmqVBCOLQqiPqKhNwHWChmiRi572A3snA4d+EIgcUGBfQDyp?=
 =?us-ascii?Q?PJkgDO4kI3WRks4B6PwAjzTVESJD28jbFy1v83vaPwOwNTKEClqRYax6pwo/?=
 =?us-ascii?Q?BB40ME4EU+25eIEG+XpFtZh4XD3TWSevdeR6NkDYszxoXpzA6KG2PWMjUaIE?=
 =?us-ascii?Q?HmdQry2zalCvXvE3ZFlCpnxQ4pGsqeyeCz5HRIvUCVcKr9OsCBYsbTZt+Vqe?=
 =?us-ascii?Q?PkkxgyRqJqLKWys1Ng20Azp4MgB5a9xA6pMKm63L0nCrclxsTpHbWjoQFKLc?=
 =?us-ascii?Q?yvYiTPtKAGTwtV+cG6Low0VDZJCBmAZjm88BZ8osgYh2Pfiu+WTs+GGxad07?=
 =?us-ascii?Q?poavXj+of1RJrD6m0d1Q0skBniFQqnrgBkl1IsZY10EXrgK5yyTyCibOcPQh?=
 =?us-ascii?Q?Hotruu5e2wt34ynjvOA+QUbdzUWKZWUYCUBtE5EtK40fgLFKYpOTrztCxVAG?=
 =?us-ascii?Q?buyvbMV6Hv6HFxrX7P/krqVsyvqRYZ+SCsdFqrebZo2vtC4oEg7qrUGz8nvB?=
 =?us-ascii?Q?meH/kxaaLQnK3xzxJwrnBMUYZ1JRLzxW0aVVFcv3x4ZbygDEexJ3KY4ikPGF?=
 =?us-ascii?Q?IknrQ/AIgLZvE/J8X+KaZZ0sh9Lkxw5Qp0Fw+ZucYyNc73m9R3kSXX+rhh0j?=
 =?us-ascii?Q?gQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f206df-9768-4eb1-135f-08dd43ed5833
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 00:54:42.2467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TJ6xT1Qlli8Uh4dwtSGgU+NaTO+u4hW0sJj8c/pU2lMANw3yrmYjrszXlqikHZvBTkS1rTomSfDrIrfPbHsh0z7CwMqJWK+SprOdSAaUbnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1253

Hi Sebastian and Nicolas

Is there any thing for me to do for these patch series ?

Thanks
Jackson


> -----Original Message-----
> From: jackson.lee
> Sent: Tuesday, January 7, 2025 10:39 AM
> To: mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
> sebastian.fricke@collabora.com; nicolas.dufresne@collabora.com
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; lafley.kim
> <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; hverkuil@xs4all.nl; Nas
> Chung <nas.chung@chipsnmedia.com>
> Subject: RE: [PATCH v2 0/4] Fix critical bugs
>=20
> Hi Sebastian and Nicolas
>=20
> Can you review the following patch series?
>=20
> https://patchwork.linuxtv.org/project/linux-media/cover/20241217045125.58=
-
> 1-jackson.lee@chipsnmedia.com/
>=20
>=20
> thanks
> Jackson
>=20
> > -----Original Message-----
> > From: jackson.lee
> > Sent: Tuesday, December 17, 2024 1:52 PM
> > To: mchehab@kernel.org; hverkuil-cisco@xs4all.nl;
> > sebastian.fricke@collabora.com; nicolas.dufresne@collabora.com;
> > bob.beckett@collabora.com; dafna.hirschfeld@collabora.com
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> > jackson.lee <jackson.lee@chipsnmedia.com>; lafley.kim
> > <lafley.kim@chipsnmedia.com>; b- brnich@ti.com; hverkuil@xs4all.nl;
> > Nas Chung <nas.chung@chipsnmedia.com>
> > Subject: [PATCH v2 0/4] Fix critical bugs
> >
> > iThe wave5 codec driver is a stateful encoder/decoder.
> > The following patches is for improving decoder performance and fix
> > critical bugs
> >
> > v4l2-compliance results:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >
> > v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
> >
> > Buffer ioctls:
> >                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS
> > not supported
> >                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS
> > not supported
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >         test CREATE_BUFS maximum buffers: OK
> >         test VIDIOC_EXPBUF: OK
> >         test Requests: OK (Not Supported)
> >
> > Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0,
> > Warnings: 2 Total for wave5-enc device /dev/video1: 46, Succeeded: 46,
> > Failed: 0, Warnings: 0
> >
> > Fluster test results:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Running test suite JCT-VC-HEVC_V1 with decoder
> > GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
> > Ran 132/147 tests successfully               in 68.608 secs
> >
> > (1 test fails because of not supporting to parse multi frames, 1 test
> > fails because of a missing frame and slight corruption,
> >  2 tests fail because of sizes which are incompatible with the IP, 11
> > tests fail because of unsupported 10 bit format)
> >
> > Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0
> > Using 1 parallel job(s)
> > Ran 78/135 tests successfully               in 33.238 secs
> >
> > (57 fail because the hardware is unable to decode  MBAFF / FMO / Field
> > / Extended profile streams.)
> >
> > Change since v1:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > * For [PATCH v2 1/4] media: chips-media: wave5: Fix to display gray
> color
> >   - Add Reviewed-by tag
> >
> > * For [PATCH v2 2/4] media: chips-media: wave5: Avoid race condition
> > for interrupt handling
> >   - Add Reviewed-by tag
> >
> > * For [PATCH v2 3/4] media: chips-media: wave5: Fix hang after seeking
> >   - Add Reviewed-by tag
> >
> > * For [PATCH v2 4/4] media: chips-media: wave5: Fix timeout while
> testing
> >   - Add Reviewed-by tag
> >
> > * Drop "media: chips-media: wave5: Improve performance of decoder"
> >   - We will try to send this patch separately next time
> >
> >
> >
> > Change since v0:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > * For [PATCH v1 3/5] media: chips-media: wave5: Improve performance of
> >   decoder
> >   - Fix Null reference while testing fluster for more than 2
> >     decoders
> >   - Fix timeout while testing fluster for multi instances
> >
> >
> > Jackson.lee (4):
> >   media: chips-media: wave5: Fix to display gray color on screen
> >   media: chips-media: wave5: Avoid race condition for interrupt handlin=
g
> >   media: chips-media: wave5: Fix hang after seeking
> >   media: chips-media: wave5: Fix timeout while testing 10bit hevc
> >     fluster
> >
> >  .../platform/chips-media/wave5/wave5-hw.c     |  2 +-
> >  .../chips-media/wave5/wave5-vpu-dec.c         | 31 ++++++++++++++++++-
> >  .../platform/chips-media/wave5/wave5-vpu.c    |  4 +--
> >  .../platform/chips-media/wave5/wave5-vpuapi.c | 10 ++++++
> >  4 files changed, 43 insertions(+), 4 deletions(-)
> >
> > --
> > 2.43.0


