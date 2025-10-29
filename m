Return-Path: <linux-media+bounces-45946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E812FC1B989
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 16:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E8AE34963F
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 15:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDB92ED154;
	Wed, 29 Oct 2025 15:19:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021074.outbound.protection.outlook.com [40.107.57.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8203A2EA481;
	Wed, 29 Oct 2025 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751173; cv=fail; b=Q45QnqCTP2xPIRE4wKiDDYXW5zJK6rj9VUlOogyOQSHexdiy3hqJni2Y1SLAgz1+TCW1VnSy8MRSRP9vydr+6G9/xUPDWpa5+9WBppgbgueDYpC6Y3J5HydQLwbyNpdi2cnPjGD1qSUT/pdP0VQbRGQpOfM6nf6Nf1T61lDLvaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751173; c=relaxed/simple;
	bh=QKovVBMSFoHrmU6OjLiDcm50NBWqmf8W5d2P2fls+Bg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mMXUHFXuSLZ9J2VvBEbtauO8nnsoMSrTAlr7XvxzmKXPoiDYYv+Zru777crgRNX2QUVfPmmrpnI/1RF2Kejq6s8H8dS6XNpt5LSCehLclLTAJWY0JWVyoC/M/YW5+kHSFRXC1+rJx5KYJNdD44B2Rt4llf3ooPGD2zCarqK/yEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7e1CA7KG2iGJXTF/fD7ps3ynSgXfOyhaoXWEJ8vzvfCdapxkAg4M3Bj5Gl8oJ3cjucEfgvz7nWIQ2TNI5wntveT7O2mJxysd2oP4kSZ8jXcZqXXiTOvBwY316uqQr5fQguhzWMrOL+ZdWaRSkMAtX3TYpCyCKwEjF2A2VTLkCX600URVcDCKdqgbicGpiF6azSSjoMjaVMhVE/Epw9O6OJiIGW8tqNbvEP8qQGYjILKrnABy9PFdt+l4EbQA6wke3+ahWVu06tA5v1RRS/ActtZflsanNx0W9gB5ccLgcQjjuBP9OiHF2PvmC1AIcMVofDs9S+tGF5PaQurnBZ1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKovVBMSFoHrmU6OjLiDcm50NBWqmf8W5d2P2fls+Bg=;
 b=UkkzhxsKSf2P2MHeWKxVRGI6O3js5Gxlv4ErkEQzr3duQKrlOhkGeQYzLz+XtG5okvitPgPkvqxjnzyN4mh0F0tADKCC0V+fTmr9oQ577/dbUYOVVSBL+ZIlrzVLeH8a4QTxArXduLdRLwEWjgJunc0B/UygN8UZ80UvCJh9/LEF0HIgFGxbdMHMRhfxcrnWVtd9hMKy2p+/CCpZty292RdFTgrMTeZI1mpXvaIZX7xtbeJyy45oOQxeU7MtZor83CzzYuodQfgmp+9yRm40dMN6bEpVyWyKngLSYuBtT+XuOOI5OHIQGcu/5jAFJhPnZnbyS05f0mF0aJ7AuvHSgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB4892.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:183::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 15:19:27 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 15:19:27 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Dongcheng Yan <dongcheng.yan@intel.com>,
	=?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2 RESEND] media: i2c: add Sony IMX111 CMOS camera
 sensor driver
Thread-Topic: [PATCH v2 2/2 RESEND] media: i2c: add Sony IMX111 CMOS camera
 sensor driver
Thread-Index: AQHcR+0Fayu+hKxvfky9xbTbKg+987TX2SMAgAAQdoCAAUP1Bg==
Date: Wed, 29 Oct 2025 15:19:27 +0000
Message-ID:
 <PN3P287MB18291BB4CCC68C8BA1260A628BFAA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20251028092200.7003-1-clamor95@gmail.com>
 <20251028092200.7003-3-clamor95@gmail.com>
 <aQEEUpgW8nmZ3ZCl@kekkonen.localdomain>
 <CAPVz0n2SuOcoDn4KZ_zb4NCuaes6nppHRgffWC4yTHmOsbe1vw@mail.gmail.com>
In-Reply-To:
 <CAPVz0n2SuOcoDn4KZ_zb4NCuaes6nppHRgffWC4yTHmOsbe1vw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA5P287MB4892:EE_
x-ms-office365-filtering-correlation-id: 46ebb6d7-6277-44c9-9fe5-08de16fe8cc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?7BhSjli6bLXpIVNZxku/oInTre1uHnVjYZO40cbcLlZA92iLKSovdo6gl0?=
 =?iso-8859-1?Q?uu7fSbcPHl/r6/krZj2c0dwd105nWKNrqKIbB2gTxOQSbG+2WA1auHEZrJ?=
 =?iso-8859-1?Q?Lo/CPkbejWgS62WVm9+OWXFp5JKkfR6V5eXR2cq+k9EkHw2SVpoodhlZAo?=
 =?iso-8859-1?Q?kpNpZKm/31aut8znJmLyIyEPhUTMWqtiAyT+wtsByLSJfiEFgJIQ+c8PzN?=
 =?iso-8859-1?Q?1ltOPbrqR68Jy8qQqY0U1y1HnT6ofbdKV6EoZW3+2MyIUZSKbpCxdmIEk6?=
 =?iso-8859-1?Q?zQQIiVGII9lbWpXM3RYntTnZzAMSYaIiTLAP2iZfMXc3flYAE2sdDRvya0?=
 =?iso-8859-1?Q?2ySByg/E1bA++Px14rlipUR0YcZTvTw48ZGyLpJ96rluNFsN6sIdkEPvio?=
 =?iso-8859-1?Q?kEcyzB2fywdx7BsL74QndAzKdumGXu+nXBua8Hu0Fy5Yyi/O6Mx5vsg6m1?=
 =?iso-8859-1?Q?SY3I3ss7HfBmxDchSyN/pbs2ED9PYzQGSxOq/BY4xw7FtjDwrwuQcJqNt5?=
 =?iso-8859-1?Q?01TqiwBO6JVK/6i3f2oQTt1SBune5X+1GVDgx8Xqu4FeCsxJplAmZ0uOxx?=
 =?iso-8859-1?Q?Gqjvj8jjPhoSCP4bbDoUicMJKXIquBZ1a2ckZOQEin1IB7mLdZJMAJiCXe?=
 =?iso-8859-1?Q?BUgHQqUTK0bJDqXp5E+mX4ufUKbCOMlxPSBtebmzA5FxlqNQZ5h15CO0Nr?=
 =?iso-8859-1?Q?O1Fm/p1yuND+Bhg9NIdPp/kbw/rHWB8BGo173ji3d6qL3BGuuK1C8bSJk8?=
 =?iso-8859-1?Q?NcdZCzY2AnDKBeKVyIgz1ILYXhbSxS2mvNLw+FLy0GbJwvG3g8LaIaL/h4?=
 =?iso-8859-1?Q?MPQ7g8usKvxOaxxbJk2p4A76YGyEsDKo7mkjHcZmLzIpEubF3m8wqGHkY3?=
 =?iso-8859-1?Q?dDmmIYXM4GADYHCW7VxWIAD/3sbfLQGTtN41/wdbwHfZnrPY8wBRClduPd?=
 =?iso-8859-1?Q?DULxpUuAofPXNTKKm/XUkTLTpBeTfc/GltGNQ20qUjIA3nSFZlLFO26CtB?=
 =?iso-8859-1?Q?PpbJ0FwFHZmO3/R8rOnoQjsU/BZOi0d1Un+yMKmK6ltUo0zUSCQDn27Nvx?=
 =?iso-8859-1?Q?AtpMzFffe3VmfXrH3hcataZUmWkYfoB/J4jwePqwJizF91uFSCsIKPshy/?=
 =?iso-8859-1?Q?PCAVEIVB9APJwj6nrIxRzZMaD/tFXBmkCFDeVNnL7jpHK0gOCC0eE8cUu3?=
 =?iso-8859-1?Q?FbnoT9m9RhkpSUsbfH2yJ4mTGI4VIdaTaM/UVf/Gt2YLNdXnAVQXg8Zv98?=
 =?iso-8859-1?Q?KVNmShonAnnu2J/veLevHjoOiz/zQI4/IZQgBnh6Qu7IMXH4A0ed1CHQfh?=
 =?iso-8859-1?Q?rtiYOj03eJQLLfDH7AFDENISsJPW5o4OFTPZ1cWmGg3xUU14SZdZmgf8vd?=
 =?iso-8859-1?Q?/riFbajKGVvvA7tF/AU7kbU+2vwpEWeFos9Mc/s6S1IOPyA+DRQWBtskv1?=
 =?iso-8859-1?Q?4mapcZh1bFLIgYgmAdeUC66Kc4grHcQzgNIQ/gJ+93O8hUvNl1bmXkcivk?=
 =?iso-8859-1?Q?mv0bnONaVfQRM0UZ/MYvkSqO29EmFS/qV1hfaEEQiGtowzxc37nPCSUcYy?=
 =?iso-8859-1?Q?cN0Ac80lwo8aVMDCgi9qU2w4u0M8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NuojLP2eUVFPP1/FxLLYkE3nWX6nzqUdbbPqXvWemMBuVbsl2mWshYweYY?=
 =?iso-8859-1?Q?WmhMsAGreej5+Vz+3pOe7ZrNoyHncnF1+jzzpi2y67n/C8U2TigYcj32mk?=
 =?iso-8859-1?Q?09mXzVTesL4ENRMrB/0KRk6RR/mG2O7TnixhPxywDlYnAFlEmrAXDrsWaC?=
 =?iso-8859-1?Q?T7T0l3D+LRgNZyVhAgqQesWqrvQiw2BFfN0Bl7IL1zjev61mweej7CZKMO?=
 =?iso-8859-1?Q?o29nJK217Tr5SVILoU8uADuyDQSRYcWm5oxVsCj6ZyHJIca8JEH3Z2+TEZ?=
 =?iso-8859-1?Q?BXrxXnbR5uIKJUwb+7qrEWDbKzniV0P5Ui9BIFpwLOLm6I83Ke9YxDUQWF?=
 =?iso-8859-1?Q?mPUlM9IW2CTW7CbX6CqR/TLU9O7H4UDxhgoUQ7q0Jrl6JwfMY/lUSFGrDt?=
 =?iso-8859-1?Q?r0eJ53CRPujJU6EMFNDUiVj41+nueaQvQ/umYcewXsuUAqnBsyyjebIUHr?=
 =?iso-8859-1?Q?JG7Rr1Hk0yVTAOYAebQ6ZjBS06U6EfeTxVLTRs3PHIaeURbVDQWgb/fLre?=
 =?iso-8859-1?Q?SYBP/44/2ZctqGLdbxlzRed2D8himsA0ybRWQ7abxTxOISubN3t9O6ZYht?=
 =?iso-8859-1?Q?p49tSN0VaMIympYOQnNacMbtivKepIL4SQIiLGo5lrh4vijVn7ZXfiE8bF?=
 =?iso-8859-1?Q?p0SqnDswO6N2riMbJnhYU+ckH2t9bMFOFNEfCWOJsfMGMUq//MubDP42G6?=
 =?iso-8859-1?Q?9xH7l7g8ziiK3hKvdiPLleAk6DzkEjMr+uBQlD7K+g0P8exzsqAhc0Ac6C?=
 =?iso-8859-1?Q?Fwe8JvQGtLP5trlLhNqXu1WsOAWbjHfXI0pMKZ3WOFbssdcyZuPwZG2fv7?=
 =?iso-8859-1?Q?ATxi9qDZKJmkNUlggHrWpaAsC7rupFSPbTPMe78t7J8GxD3FiayP0yUA7n?=
 =?iso-8859-1?Q?YbALo6dDjrGM9KhQ9WoMpFz44OqYHEZDOWhkj8yOXYktxMuSJGFodAMd63?=
 =?iso-8859-1?Q?R06WZ7MJT22MeUnuiGw0NnXZcpx3CLR9Rm5vqP2ryJFbpvE9ehq2uYhZT1?=
 =?iso-8859-1?Q?9J79ypQSZspgLgBXBazWv8N2uB9uA5vzjEqtb9I5jXoBNqMfVnyQryp8a1?=
 =?iso-8859-1?Q?9ux/6tHcyyJg71RaOHuwmblsVjrUOUz5bAwZM08FX5LvTQjdDR05GJZodj?=
 =?iso-8859-1?Q?IyyWd6gwvEIo7zFYJuL/noMYsTAperkK0VBoFmiVnrCqw0x3oFiT8vN0Of?=
 =?iso-8859-1?Q?05MH4kqjotDhA6AbE0xlE/tKUwZcQDlB9ghezN/EYMRxT80jwbun+wtsKI?=
 =?iso-8859-1?Q?H6s9PHHAptQYuQG8JXaTzy4djkjjxcHygPHUGFs0DTnF0iClys6cm/DkTt?=
 =?iso-8859-1?Q?DDm0kIsxVcjSF2G/g/M5omYbjHzQ/qcfXSu0xsOlDiIJA4zjN1ETXWiuN2?=
 =?iso-8859-1?Q?NS6NcgmPV92k0TNdKgh4QDUxz80UBRSKEHoa7ZuSjqmdywwbHJfB4dS7o2?=
 =?iso-8859-1?Q?0NYH5cXmhvl0oYQMCnXdMFBiurM1XIBPoeVnRrb+A5whY/J1cgy9l+xAYw?=
 =?iso-8859-1?Q?4vbkVFZ6pqqF/o2PUwgfxdQEWu3xNXi58JscQ11WbJQle9ezVxFOkMI5HO?=
 =?iso-8859-1?Q?uxPea4otvkfGeIXEP6ON3xkUqgvKXNy6ht1xpCQk5mZ0pmqI4V1fNaCbZ/?=
 =?iso-8859-1?Q?u5+hYRXXsaZOztJ+9ACW60oi8BznGukJTZANoNT3X5TA0LZDAtPN75ZQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ebb6d7-6277-44c9-9fe5-08de16fe8cc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 15:19:27.2008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xvahZiYh/dW9a6Mqt00at43N9pfE2YmYgauT5Y95eIAGRDcnRb6Rwq2owzgLFIvcowYtPFL2x/N/oqH+zSfI9WkSD8bTc1CKbZi3fWax3mQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4892

Hi Svyatoslav,=0A=
=0A=
> > On Tue, Oct 28, 2025 at 11:22:00AM +0200, Svyatoslav Ryhel wrote:=0A=
> > > Add a v4l2 sub-device driver for the Sony IMX111 image sensor. This i=
s a=0A=
> > > camera sensor using the i2c bus for control and the csi-2 bus for dat=
a.=0A=
> > >=0A=
> > > The following features are supported:=0A=
> > > - manual exposure, digital and analog gain control support=0A=
> > > - pixel rate/link freq control support=0A=
> > > - supported resolution up to 3280x2464 for single shot capture=0A=
> > > - supported resolution up to 1920x1080 @ 30fps for video=0A=
> > > - supported bayer order output SGBRG10 and SGBRG8=0A=
> > >=0A=
> > > Camera module seems to be partially compatible with Nokia SMIA but it=
=0A=
> > > lacks a few registers required for clock calculations and has differe=
nt=0A=
> > > vendor-specific per-mode configurations which makes it incompatible w=
ith=0A=
> > > existing CCS driver.=0A=
> > >=0A=
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>=0A=
=0A=
...=0A=
=A0=0A=
> > > +#include <linux/clk.h>=0A=
> > > +#include <linux/delay.h>=0A=
> > > +#include <linux/gpio/consumer.h>=0A=
> > > +#include <linux/i2c.h>=0A=
> > > +#include <linux/kernel.h>=0A=
> > > +#include <linux/media.h>=0A=
> > > +#include <linux/module.h>=0A=
> > > +#include <linux/pm_runtime.h>=0A=
> > > +#include <linux/ratelimit.h>=0A=
> > > +#include <linux/regmap.h>=0A=
> > > +#include <linux/regulator/consumer.h>=0A=
> > > +#include <linux/slab.h>=0A=
> > > +#include <linux/string.h>=0A=
> > > +#include <linux/types.h>=0A=
> > > +#include <linux/videodev2.h>=0A=
> > > +#include <linux/units.h>=0A=
> > > +=0A=
> > > +#include <media/media-entity.h>=0A=
> > > +#include <media/v4l2-async.h>=0A=
> > > +#include <media/v4l2-cci.h>=0A=
> > > +#include <media/v4l2-ctrls.h>=0A=
> > > +#include <media/v4l2-device.h>=0A=
> > > +#include <media/v4l2-fwnode.h>=0A=
> > > +#include <media/v4l2-event.h>=0A=
> > > +#include <media/v4l2-image-sizes.h>=0A=
> > > +#include <media/v4l2-subdev.h>=0A=
> > > +#include <media/v4l2-mediabus.h>=0A=
=A0=0A=
A few of those headers seem to be unused and can be removed=0A=
=0A=
Like:=0A=
=A0=0A=
#include <linux/ratelimit.h>=0A=
#include <linux/slab.h>=0A=
#include <linux/string.h>=0A=
#include <media/v4l2-event.h>=0A=
#include <media/v4l2-image-sizes.h>=0A=
=0A=
...=0A=
=0A=
> > > +/* product information registers */=0A=
> > > +#define IMX111_PRODUCT_ID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CCI=
_REG16(0x0000)=0A=
> > > +#define =A0 IMX111_CHIP_ID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0=
x111=0A=
> > > +#define IMX111_REVISION =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0CCI_REG8(0x0002)=0A=
> > > +#define IMX111_MANUFACTURER_ID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 CCI_REG8(0x0003)=0A=
> > > +#define IMX111_SMIA_VER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0CCI_REG8(0x0004)=0A=
> > > +#define IMX111_FRAME_COUNTER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CCI_REG=
8(0x0005)=0A=
> > > +#define IMX111_PIXEL_ORDER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CCI_R=
EG8(0x0006)=0A=
> > > +=0A=
> > > +/* general configuration registers */=0A=
> > > +#define IMX111_STREAMING_MODE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0CCI_REG8(0x0100)=0A=
> > > +#define =A0 IMX111_MODE_STANDBY =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A00=0A=
> > > +#define =A0 IMX111_MODE_STREAMING =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A01=0A=
> > > +#define IMX111_IMAGE_ORIENTATION =A0 =A0 =A0 =A0 =A0 =A0 CCI_REG8(0x=
0101)=0A=
> > > +#define =A0 IMX111_IMAGE_HFLIP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 BIT(0=
)=0A=
> > > +#define =A0 IMX111_IMAGE_VFLIP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 BIT(1=
)=0A=
> > > +#define IMX111_SOFTWARE_RESET =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0CCI_REG8(0x0103)=0A=
> > > +#define =A0 IMX111_RESET_ON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01=
=0A=
> > > +#define IMX111_GROUP_WRITE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CCI_R=
EG8(0x0104)=0A=
> > > +#define =A0 IMX111_GROUP_WRITE_ON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A01=0A=
> > > +#define IMX111_FRAME_DROP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CCI=
_REG8(0x0105)=0A=
> > > +#define =A0 IMX111_FRAME_DROP_ON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 1=0A=
> > > +#define IMX111_CHANNEL_ID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CCI=
_REG8(0x0110)=0A=
> > > +#define IMX111_SIGNALLING_MODE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 CCI_REG8(0x0111)=0A=
> > > +#define IMX111_DATA_DEPTH =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CCI=
_REG16(0x0112)=0A=
> > > +#define =A0 IMX111_DATA_DEPTH_RAW8 =A0 =A0 =A0 =A0 =A0 =A0 0x08=0A=
> > > +#define =A0 IMX111_DATA_DEPTH_RAW10 =A0 =A0 =A0 =A0 =A0 =A00x0a=0A=
> > > +=0A=
> > > +/* integration time registers */=0A=
> > > +#define IMX111_INTEGRATION_TIME =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0CCI_REG16(0x0202)=0A=
> > > +#define IMX111_INTEGRATION_TIME_MIN =A0 =A0 =A0 =A0 =A00x1=0A=
> > > +#define IMX111_INTEGRATION_TIME_MAX =A0 =A0 =A0 =A0 =A00xffff=0A=
> > > +#define IMX111_INTEGRATION_TIME_STEP =A0 =A0 =A0 =A0 1=0A=
> > > +=0A=
> > > +/* analog gain control */=0A=
> > > +#define IMX111_REG_ANALOG_GAIN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 CCI_REG8(0x0205)=0A=
> > > +#define IMX111_ANA_GAIN_MIN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00=0A=
> > > +#define IMX111_ANA_GAIN_MAX =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0240=
=0A=
> > > +#define IMX111_ANA_GAIN_STEP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1=0A=
> > > +#define IMX111_ANA_GAIN_DEFAULT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A00=0A=
> > > +=0A=
> > > +/* digital gain control */=0A=
> > > +#define IMX111_REG_DIG_GAIN_GREENR =A0 =A0 =A0 =A0 =A0 CCI_REG16(0x0=
20e)=0A=
> > > +#define IMX111_REG_DIG_GAIN_RED =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0CCI_REG16(0x0210)=0A=
> > > +#define IMX111_REG_DIG_GAIN_BLUE =A0 =A0 =A0 =A0 =A0 =A0 CCI_REG16(0=
x0212)=0A=
> > > +#define IMX111_REG_DIG_GAIN_GREENB =A0 =A0 =A0 =A0 =A0 CCI_REG16(0x0=
214)=0A=
> > > +#define IMX111_DGTL_GAIN_MIN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x0100=
=0A=
> > > +#define IMX111_DGTL_GAIN_MAX =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x0fff=
=0A=
> > > +#define IMX111_DGTL_GAIN_DEFAULT =A0 =A0 =A0 =A0 =A0 =A0 0x0100=0A=
> > > +#define IMX111_DGTL_GAIN_STEP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A01=0A=
> > > +=0A=
> > > +/* clock configuration registers */=0A=
> > > +#define IMX111_PIXEL_CLK_DIVIDER_PLL1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0CCI_REG8(0x0301) /* fixed to 10 */=0A=
> > > +#define IMX111_SYSTEM_CLK_DIVIDER_PLL1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 C=
CI_REG8(0x0303) /* fixed to 1 */=0A=
> > > +#define IMX111_PRE_PLL_CLK_DIVIDER_PLL1 =A0 =A0 =A0 =A0 =A0 =A0 =A0C=
CI_REG8(0x0305)=0A=
> > > +#define IMX111_PLL_MULTIPLIER_PLL1 =A0 =A0 =A0 =A0 =A0 CCI_REG8(0x03=
07)=0A=
> > > +#define IMX111_PLL_SETTLING_TIME =A0 =A0 =A0 =A0 =A0 =A0 CCI_REG8(0x=
303c)=0A=
> > > +#define =A0 IMX111_PLL_SETTLING_TIME_DEFAULT =A0 200=0A=
> > > +#define IMX111_POST_DIVIDER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CCI_R=
EG8(0x30a4)=0A=
> > > +#define =A0 IMX111_POST_DIVIDER_DIV1 =A0 =A0 =A0 =A0 =A0 2=0A=
> > > +#define =A0 IMX111_POST_DIVIDER_DIV2 =A0 =A0 =A0 =A0 =A0 0=0A=
> > > +#define =A0 IMX111_POST_DIVIDER_DIV4 =A0 =A0 =A0 =A0 =A0 1=0A=
> > > +=0A=
> > > +/* frame timing registers */=0A=
> > > +#define IMX111_VERTICAL_TOTAL_LENGTH =A0 =A0 =A0 =A0 CCI_REG16(0x034=
0)=0A=
> > > +#define IMX111_HORIZONTAL_TOTAL_LENGTH =A0 =A0 =A0 =A0 =A0 =A0 =A0 C=
CI_REG16(0x0342)=0A=
> > > +=0A=
> > > +/* image size registers */=0A=
> > > +#define IMX111_HORIZONTAL_START =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0CCI_REG16(0x0344)=0A=
> > > +#define IMX111_VERTICAL_START =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0CCI_REG16(0x0346)=0A=
> > > +#define IMX111_HORIZONTAL_END =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0CCI_REG16(0x0348)=0A=
> > > +#define IMX111_VERTICAL_END =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CCI_R=
EG16(0x034a)=0A=
> > > +#define IMX111_IMAGE_WIDTH =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CCI_R=
EG16(0x034c)=0A=
> > > +#define IMX111_IMAGE_HEIGHT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CCI_R=
EG16(0x034e)=0A=
=0A=
In the mode register settings, you can use the above macros.=0A=
=0A=
> > > +static const struct cci_reg_sequence mode_820x614[] =3D {=0A=
> > > + =A0 =A0 { CCI_REG8(0x0340), 0x04 }, =A0 =A0 { CCI_REG8(0x0341), 0xe=
c },=0A=
> > > + =A0 =A0 { CCI_REG8(0x0342), 0x0d }, =A0 =A0 { CCI_REG8(0x0343), 0xd=
0 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x0344), 0x00 }, =A0 =A0 { CCI_REG8(0x0345), 0x0=
8 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x0346), 0x00 }, =A0 =A0 { CCI_REG8(0x0347), 0x3=
4 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x0348), 0x0c }, =A0 =A0 { CCI_REG8(0x0349), 0xd=
7 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x034a), 0x09 }, =A0 =A0 { CCI_REG8(0x034b), 0xc=
b },=0A=
> > > + =A0 =A0 { CCI_REG8(0x034c), 0x03 }, =A0 =A0 { CCI_REG8(0x034d), 0x3=
4 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x034e), 0x02 }, =A0 =A0 { CCI_REG8(0x034f), 0x6=
6 },=0A=
=A0=0A=
Here, you can use those macros.=0A=
=A0=0A=
Likewise, in every mode.=0A=
=A0=0A=
> > > + =A0 =A0 { CCI_REG8(0x0381), 0x05 }, =A0 =A0 { CCI_REG8(0x0383), 0x0=
3 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x0385), 0x05 }, =A0 =A0 { CCI_REG8(0x0387), 0x0=
3 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x3033), 0x00 }, =A0 =A0 { CCI_REG8(0x303d), 0x1=
0 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x303e), 0x40 }, =A0 =A0 { CCI_REG8(0x3040), 0x0=
8 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x3041), 0x97 }, =A0 =A0 { CCI_REG8(0x3048), 0x0=
1 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x304c), 0x6f }, =A0 =A0 { CCI_REG8(0x304d), 0x0=
3 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x3064), 0x12 }, =A0 =A0 { CCI_REG8(0x3073), 0x0=
0 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x3074), 0x11 }, =A0 =A0 { CCI_REG8(0x3075), 0x1=
1 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x3076), 0x11 }, =A0 =A0 { CCI_REG8(0x3077), 0x1=
1 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x3079), 0x00 }, =A0 =A0 { CCI_REG8(0x307a), 0x0=
0 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x309b), 0x28 }, =A0 =A0 { CCI_REG8(0x309c), 0x1=
3 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x309e), 0x00 }, =A0 =A0 { CCI_REG8(0x30a0), 0x1=
4 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x30a1), 0x09 }, =A0 =A0 { CCI_REG8(0x30aa), 0x0=
3 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x30b2), 0x03 }, =A0 =A0 { CCI_REG8(0x30d5), 0x0=
9 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x30d6), 0x00 }, =A0 =A0 { CCI_REG8(0x30d7), 0x0=
0 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x30d8), 0x00 }, =A0 =A0 { CCI_REG8(0x30d9), 0x0=
0 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x30de), 0x04 }, =A0 =A0 { CCI_REG8(0x30df), 0x2=
0 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x3102), 0x08 }, =A0 =A0 { CCI_REG8(0x3103), 0x2=
2 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x3104), 0x20 }, =A0 =A0 { CCI_REG8(0x3105), 0x0=
0 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x3106), 0x87 }, =A0 =A0 { CCI_REG8(0x3107), 0x0=
0 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x3108), 0x03 }, =A0 =A0 { CCI_REG8(0x3109), 0x0=
2 },=0A=
> > > + =A0 =A0 { CCI_REG8(0x310a), 0x03 }, =A0 =A0 { CCI_REG8(0x315c), 0x9=
c },=0A=
> > > + =A0 =A0 { CCI_REG8(0x315d), 0x9b }, =A0 =A0 { CCI_REG8(0x316e), 0x9=
d },=0A=
> > > + =A0 =A0 { CCI_REG8(0x316f), 0x9c }, =A0 =A0 { CCI_REG8(0x3318), 0x7=
a },=0A=
> > > + =A0 =A0 { CCI_REG8(0x3348), 0xe0 },=0A=
> > > +};=0A=
=0A=
...=0A=
=0A=
> > > +static int imx111_init_controls(struct imx111 *sensor)=0A=
> > > +{=0A=
> > > + =A0 =A0 const struct v4l2_ctrl_ops *ops =3D &imx111_ctrl_ops;=0A=
> > > + =A0 =A0 struct device *dev =3D regmap_get_device(sensor->regmap);=
=0A=
> > > + =A0 =A0 struct v4l2_fwnode_device_properties props;=0A=
> > > + =A0 =A0 struct v4l2_subdev *sd =3D &sensor->sd;=0A=
> > > + =A0 =A0 struct v4l2_ctrl_handler *hdl =3D &sensor->hdl;=0A=
> > > + =A0 =A0 s64 pixel_rate_min, pixel_rate_max;=0A=
> > > + =A0 =A0 int i, ret;=0A=
> > > +=0A=
> > > + =A0 =A0 ret =3D v4l2_fwnode_device_parse(dev, &props);=0A=
> > > + =A0 =A0 if (ret < 0)=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 return ret;=0A=
> > > +=0A=
> > > + =A0 =A0 ret =3D v4l2_ctrl_handler_init(hdl, 13);=0A=
> > > + =A0 =A0 if (ret)=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 return ret;=0A=
> > > +=0A=
> > > + =A0 =A0 pixel_rate_min =3D div_u64(sensor->pixel_clk_raw, 2 * IMX11=
1_DATA_DEPTH_RAW10);=0A=
> > > + =A0 =A0 pixel_rate_max =3D div_u64(sensor->pixel_clk_raw, 2 * IMX11=
1_DATA_DEPTH_RAW8);=0A=
> > > + =A0 =A0 sensor->pixel_rate =3D v4l2_ctrl_new_std(hdl, NULL, V4L2_CI=
D_PIXEL_RATE,=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0pixel_rate_min, pixel_rate_max,=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A01, div_u64(sensor->pixel_clk_raw,=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A02 * sensor->data_depth));=0A=
> > > +=0A=
> > > + =A0 =A0 sensor->link_freq =3D v4l2_ctrl_new_int_menu(hdl, NULL, V4L=
2_CID_LINK_FREQ,=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A00, 0, &sensor->default_link_freq);=0A=
> > > + =A0 =A0 if (sensor->link_freq)=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 sensor->link_freq->flags |=3D V4L2_CTRL_FLA=
G_READ_ONLY;=0A=
> > > +=0A=
> > > + =A0 =A0 v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IMX111_ANA_GAIN_MIN, IM=
X111_ANA_GAIN_MAX,=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IMX111_ANA_GAIN_STEP, I=
MX111_ANA_GAIN_DEFAULT);=0A=
> > > +=0A=
> > > + =A0 =A0 v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DIGITAL_GAIN,=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IMX111_DGTL_GAIN_MIN, I=
MX111_DGTL_GAIN_MAX,=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IMX111_DGTL_GAIN_STEP, =
IMX111_DGTL_GAIN_DEFAULT);=0A=
> > > +=0A=
> > > + =A0 =A0 sensor->hflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLI=
P, 0, 1, 1, 0);=0A=
> > > + =A0 =A0 if (sensor->hflip)=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 sensor->hflip->flags |=3D V4L2_CTRL_FLAG_MO=
DIFY_LAYOUT;=0A=
> > > +=0A=
> > > + =A0 =A0 sensor->vflip =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLI=
P, 0, 1, 1, 0);=0A=
> > > + =A0 =A0 if (sensor->vflip)=0A=
> > > + =A0 =A0 =A0 =A0 =A0 =A0 sensor->vflip->flags |=3D V4L2_CTRL_FLAG_MO=
DIFY_LAYOUT;=0A=
> >=0A=
> > Could you also add VBLANK and HBLANK controls, please?=0A=
> >=0A=
>=A0=0A=
> I may try to, but since no datasheet is available, my suggestion may=0A=
> be quite arbitrary. In this iteration v/hblank are considered to be 0.=0A=
=0A=
The registers IMX111_VERTICAL_TOTAL_LENGTH and IMX111_HORIZONTAL_TOTAL_LENG=
TH=0A=
are used to set the vertical and horizontal total lengths in every mode.=A0=
=0A=
I believe you can use these registers to implement VBLANK and HBLANK.=0A=
=0A=
You can find the appropriate values for these from the mode register settin=
gs.=0A=
=0A=
Best Regards,=0A=
Tarang=

