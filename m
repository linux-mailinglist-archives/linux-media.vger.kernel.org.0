Return-Path: <linux-media+bounces-40711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D59B30C89
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 05:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C38AAA1658
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 03:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2C028A72F;
	Fri, 22 Aug 2025 03:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d0CUH8Cs"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012042.outbound.protection.outlook.com [52.101.66.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3042E1096F;
	Fri, 22 Aug 2025 03:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755833150; cv=fail; b=DSbglkqAx1jdbBcQm3IdRFeh7wYLKH7QQZbugUhBAAiNhGSK1N3OvePERTE3Sjr2FfhBTgGs27Q24RLlk2ulB/rkDPm0uUH4XXS3NhwAKDeUFkq43P3NFG07vrDRgg0b7YwEx5v7OEc6lrEXFHGG5cDbvEiYqv7kOCxwkTDwAgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755833150; c=relaxed/simple;
	bh=SgxHcLIS1qkDQGEQjhBmNDix8ZR/yprOxMgn0IdCDiA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jWiA6WDouqPeO2YsOI/MZMxDuN4p/byBL1JRA0IMa6qjM9KJ5R7/ZhmLpJyxqcUeAWb0G0Jz0JN0/gN5sJ6qef5+IXGIE4gaqI1mnznOPdOFzZdQ5uCMgIUoATWe7XBEjwO3uyUkbygNATPViyP01FQYxybT+RUP4CyFnOeIf+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d0CUH8Cs; arc=fail smtp.client-ip=52.101.66.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icxF2IhSXZv1IDZv3ssagAWBNS5LI5CJcA0pLZXwoiS+gWPkb+HXH4EhBPg6oF7xIF50oSsONq0M6GffaB6ND9FkDS3ZOVPdKvcs8e78GPWeRHvbaj/lIBviwI8h73zDqtX0rlkye8fcAZozlmuAREpMlNC+3rn1ZW6nOHSYxTstMqZKgmlW7ZFha8M8Z2QdgbmwLrgllMROBitigZHk6uzBPjEzPITQHUnuZbam0jn1VFV8T0bXim7PkG2TDQUxBcpoS8kJMXhZig9f1BPXXeE7l2rM6rd84JB4QmaKvvJC/NrO3IlcwBa2PNcJkbd8cF4YsCJEsRzNCfxlSG2pdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlQ2qnCLRLl8p7kL8uJFp70dY9UDvKgZdNGfFvaNoYQ=;
 b=JNpXYiTP5oVey+dlTsOhPQODfcrdLN5NN8YOM+n8xLD9CPSYEGjhUdN3+CCgan68tN4FCtIrqM9wSW3CJH68haRa+H6/pXzdMfmddcAWn/EXx661nqVNQa8RDgp3b2th/NyrSh4hrlY0+vBABDvfwmez+8URMekT+yaIxACmK9zD56sxCvtXIhm+xujSqX5jIwLoFEoWmT97eOKxX6qa2wXkSUNXDGtJtZShgtJVf2MwQVPJWwJ8zi0q0g4NuPb1RNzfYTaXYvXGl8HOaCfJG4SxQnmORVAmtYJ7UY9FCAnk4QXwuNvcfkYOLE+cgwUYhrvFxu2bRzZfRMImatERlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlQ2qnCLRLl8p7kL8uJFp70dY9UDvKgZdNGfFvaNoYQ=;
 b=d0CUH8Cs7E1OjhFzd8LXsii1RPGvDqowmSNPRlHAWUDN+CtssSP6y39agOB5R//H+JbF8LoYNSI23MC0gsAlyFunnBbiV7KS9Jll2eN1JrDwU5mNgCF4L0Qt+hGRazN5lB0Deg6pch8uZBmwgHcZ9QmKv/9NEk0KSpnc/6B0QnxUwqljDVUZsxLoffIDKScS7U5PL4Xgo6fBQGtpo74vCtyEGpt9qYlkshA+btYg41DnV9q72+h2i33Lo6Cd58XSO72G8FtFNZjFVRbGgcYc6g6+uc41G7vbZvPNkzJ/zizJaINriPOKGDpRZWCYCcy9s2tSoPflhIgZq3kcjz4e+g==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Fri, 22 Aug
 2025 03:25:45 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Fri, 22 Aug 2025
 03:25:45 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: "c.hemp@phytec.de" <C.Hemp@phytec.de>, Aisheng Dong
	<aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Frank Li
	<frank.li@nxp.com>, Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
	<shawnguo@kernel.org>, "s.riedmueller@phytec.de" <s.riedmueller@phytec.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [EXT] [PATCH v2 1/2] media: nxp: imx8-isi: m2m: Fix streaming
 cleanup on release
Thread-Topic: [EXT] [PATCH v2 1/2] media: nxp: imx8-isi: m2m: Fix streaming
 cleanup on release
Thread-Index: AQHcEqK+qiwk71zw2kKER3batogG87RuA3zg
Date: Fri, 22 Aug 2025 03:25:45 +0000
Message-ID:
 <AS8PR04MB9080FD0AAA409B96EBB083B8FA3DA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250821135123.29462-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250821135123.29462-1-laurent.pinchart@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AS4PR04MB9386:EE_
x-ms-office365-filtering-correlation-id: 5303c99c-a408-4fb8-1c8d-08dde12b94e3
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|4022899009|366016|7416014|376014|19092799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MJHXx4pEGu6nA8ODat5uWk2eg7OKGga3vx+aIpFTLv4Jiz7LQS/9V7igZSpZ?=
 =?us-ascii?Q?VH7Iixpr5bUAGg/ZpTArhAjsZsJXQzpza2J7mNISiEROJXKYLgPWHTiJFiM8?=
 =?us-ascii?Q?mo3D4aLEY86xX1q2+JoW9aXos2xO1MF+kXgxG29NOlfm65nHwFmBr+6cBJVD?=
 =?us-ascii?Q?iW95lLXoK5oS2phzKZsh2KGm4Dg2lLqu5hmzZS5B/4TbI55AKGQQZ5EF0Blu?=
 =?us-ascii?Q?isIgWWZCwqFciR/X0Wh1oDSJbezOi0vSd6OUmGVtEaDcSZDoB8f5ybs8wTK8?=
 =?us-ascii?Q?oYh96tqBbbRicBMZkRiz1QO4yR0Ws9u4hqOHdr2VA2HXQGH9jz/o3clNT9H9?=
 =?us-ascii?Q?P6jrBxz6LtxiE19A6v3gwR5VliHsq7syGQvcKGHt6SLOuFVfoMa2blb9yv7S?=
 =?us-ascii?Q?OOd4dbt36tDPIH+XjH2zQZThJmnUlFFRJmslktLLrKqt+9NJnTTu4R1S0qWb?=
 =?us-ascii?Q?J4HwKbBgYsGg70Nt5k+3X9tfwKWlkPMyGUFxdMPCJ4vMwSi0Ejm9jmQ67mJx?=
 =?us-ascii?Q?k3Eh/i46erhI3Xu9R9PzvWX7NFtw05Lcw8vHpkRWQ2k/MxtcSLVHawBlxMFK?=
 =?us-ascii?Q?JrNteJglKyKW5bYuolr+rafJl/QYsEN95r4oNXe0x94X2+EGxOcu6JFOPheq?=
 =?us-ascii?Q?jKW0kzXg+vTCiJVZRp7mOXHtYSGMgEa2xmXn4N2V7il1SkV/6RXbWm1wcByr?=
 =?us-ascii?Q?zS5Ky5XXlf25LAlhJfCMQftMzR2EXre0jPwJiKBOrUdbGvmI8pirvOjO01mX?=
 =?us-ascii?Q?JhvI4b5sdcWk8A5/adeZ3TUxlc0DpfSfV6jguHXWcuY9qKWdPbYN/OGzs9o5?=
 =?us-ascii?Q?EWrZX0lNelVfq25f4kyjzqVCp8Ro+Vmp3jjsPnlKEUbDPV1Oxhz+ujvO30st?=
 =?us-ascii?Q?hnDdKqcRdCeI3lLik6jB6jxv0zuOH8sR4kuf7SJi4rGER6KOuiLWGAnLFEcy?=
 =?us-ascii?Q?jJvZLshEMqh4gkfdCuv4oHj8GsHsyFWtIevQd2DiTRScUi/fTJz7NZy9v/E5?=
 =?us-ascii?Q?PuOHFSAfm8GbkuOn4FCuiLKJNJ+hcNYIE9eetzHbPjlGHd5Wv/bLL9k876Dq?=
 =?us-ascii?Q?u+JyjkYfk2SPkmwyg4fzXKKUZ7u8oxWJ4V99R5eJTfdpFqxzHVxU3sdQ0NWF?=
 =?us-ascii?Q?RMRqBxaGABUeMOc4JtpiCjiwRJwxnAxgvky6xXAp4Llqo1GWrScwa1Sv3AX3?=
 =?us-ascii?Q?j7VUQxjFZMi9jtfj3IquK9QLcaXpH7FvDEGidhn9GkixotIUAyz8texvhCPz?=
 =?us-ascii?Q?vg3gwynlPTK1CQ5DwfFuB0xXIYbrf5T21gkaRniP6XWqZ1A/Nfyq/d15WatU?=
 =?us-ascii?Q?WMaVC7PBkerzEQ99LWnGmaycyhgB9gUDWpzXMCuR5yS/4NrhRPrABrAA6Y5O?=
 =?us-ascii?Q?eud3HBMv/Cdzm41yYSErb3pJLTzhv4SVxP6PPdaUO2memxFNkbEJX8zo9WM8?=
 =?us-ascii?Q?n0Z4Yf9/zm+lWBBvEAHE/T8e0mZWTrroNWyjCy8l0fZ9hgJTPSxlnw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(7416014)(376014)(19092799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8AIrUyLKR6rLxJ4OGx/rkarlaGusxXXxz0/Z39B2rBSMgR0rDLgnvofaIlEt?=
 =?us-ascii?Q?M9QjZhVx24pwM0KSPPCGLMZmdV727KKTgNjYUVapBnMG0tanIj1QGNSQZOul?=
 =?us-ascii?Q?zS4LqvLFt7mAqcTSLqPiO+Rso2w/Fw3MyuexJ7mqluoJUsj+3rb6TOvHdHt3?=
 =?us-ascii?Q?WGPop3hvIeqK9VtdHNWPF1saL2zDVGMZc/2xza2NY84fZtge6qxNxbwwPJTs?=
 =?us-ascii?Q?9QYBZi9OGLpOGzf3MR7UV04xCyLoY45WzV+psIl9t05dWvrPei4nJEkCAzQE?=
 =?us-ascii?Q?e1I5a7brQNqJuNJdQc6dJFR6MIw6+5ZZ6Y4o3g5dDB0z1h0bD7q4uqMRKI/d?=
 =?us-ascii?Q?iVE9W6Az3/biPCeUbK72vseJsnJKbCzJGj3ZHaLN17JXbQERxJE4dIltQY9Y?=
 =?us-ascii?Q?BJtn9okmQRABSjHIXRADIEQDs6M5P9URqsMH7r1OdlzVxtoL2IiSy429Nato?=
 =?us-ascii?Q?DTzPa5GxOkorzvd2pgS/T0zL6vJSjrjOzj0lElTcCN1LWaKv/StFZ5d3kwfG?=
 =?us-ascii?Q?UL+5h3wbZVZuPWem3gamtYkSmmfSxgKy0YDnAKwTsyksZD+UWGZ0MLiDoJMl?=
 =?us-ascii?Q?HRR5fy2rtquqp3N0ntLbOv7KgSGo7+VzMJifos8jStIvfBxUKohVEUDgPW77?=
 =?us-ascii?Q?WUVMIRYakNjAHP5tmDXMwRoeGSzu2Xitb8wPxS3WFGHUzTxM4zgpXloZh3SS?=
 =?us-ascii?Q?X3ThBu3bnBQCTuqdclphW7H8RINUNji6bZ9rzNvRuNomg7IVw/RDpbbdV38q?=
 =?us-ascii?Q?7ZPX2YAOwpWW9Vf8e6Wn65HYeCh6Ksh4MWktpH37iQTnhhmZoXRQCc4zF/Sa?=
 =?us-ascii?Q?y5UC9J0iFEMezY6CH3ed8Ra4jxyU+vnzvT0Vdm3ig6QNH6MJUH5qvZpCJgUp?=
 =?us-ascii?Q?lkCOMnBrUJgVOYjJpyzBo9/C7bpYO3M2CPNKgazPTz/QkbXAC26JN6H/M5CL?=
 =?us-ascii?Q?ZoJ56mBbSKRHe24SadZAdcE5v55L5sZbvrAOh8f9wj3gcMxshFBAX3TyLzMn?=
 =?us-ascii?Q?zTBFaWNzq06vdihJ3EIcdOT1GNXeTXibuP1yGtM6N6e+fE5sFSk8gg9pzxDX?=
 =?us-ascii?Q?o5Tir2kHXn1CENnTPobeFwuXSnbX0pYEYAJCMxE/oIGMWHfrUV7KrD59cGd0?=
 =?us-ascii?Q?ZBpxNFwpwkSAXAq5hMzRkkkmhc8/100ZCvvoGhGLeESVi4zpXQ5G+WlXlCvG?=
 =?us-ascii?Q?93euFiKAaPZ2YjnuKs8/4MZqq4pG1d9gQeP/Ya+u1/Ie+sDQmsWuwRtkPX08?=
 =?us-ascii?Q?Tx4IIRN+6au9auYgMYR5AZ4Ab5TAP3sHyOs8+if6U8OSrdySHZn+QfPM8sQc?=
 =?us-ascii?Q?YlUsj4mEu9IfCN2WAdhtaQnXmeMOVTYs7NaGYQjMyEGtQ5/z1Qi4o/Ejjv8P?=
 =?us-ascii?Q?zA8aVUZkVs+ort811YQpw0pVzSW0765Ev6vWbtC9VtCjk4aqpRRAK4KyhIzd?=
 =?us-ascii?Q?vSuU3kzd0a0MnByfeJ4eyiapvu07qUGV69Oxh80G7SnrhwswlDFUwDEaVhL7?=
 =?us-ascii?Q?ioNZ5O6w/eO9GchTHxuvlFtSHP+z7+yImzotppw3059FNmsrBPXXN1qLsFy9?=
 =?us-ascii?Q?5XjP63POr87WdVADZ5F4zhXKZPSyGrCXMzQshP5I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5303c99c-a408-4fb8-1c8d-08dde12b94e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 03:25:45.3831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XumgO49TJg2haQcC8ugIPAVdkAbyXUbZzBkr/gbRDp1J6qyOvn8vNY7lp+6FfctY4VAlX+ketrDMYVq1n8V23w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9386

> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: Thursday, August 21, 2025 9:51 PM
> To: linux-media@vger.kernel.org
> Cc: G.N. Zhou <guoniu.zhou@nxp.com>; c.hemp@phytec.de; Aisheng Dong
> <aisheng.dong@nxp.com>; Fabio Estevam <festevam@gmail.com>; Frank Li
> <frank.li@nxp.com>; Jacopo Mondi <jacopo@jmondi.org>; Mauro Carvalho
> Chehab <mchehab@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Shawn Guo <shawnguo@kernel.org>; s.riedmueller@phytec.de; Pengutronix
> Kernel Team <kernel@pengutronix.de>; imx@lists.linux.dev;
> stable@vger.kernel.org
> Subject: [EXT] [PATCH v2 1/2] media: nxp: imx8-isi: m2m: Fix streaming cl=
eanup
> on release
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>=20
> If streamon/streamoff calls are imbalanced, such as when exiting an appli=
cation
> with Ctrl+C when streaming, the m2m usage_count will never reach zero and
> the ISI channel won't be freed. Besides from that, if the input line widt=
h is more
> than 2K, it will trigger a WARN_ON():
>=20
> [ 59.222120] ------------[ cut here ]------------ [ 59.226758] WARNING:
> drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:631 at
> mxc_isi_channel_chain+0xa4/0x120, CPU#4: v4l2-ctl/654 [ 59.238569]
> Modules linked in: ap1302 [ 59.242231] CPU: 4 UID: 0 PID: 654 Comm: v4l2-=
ctl
> Not tainted 6.16.0-rc4-next-20250704-06511-gff0e002d480a-dirty #258
> PREEMPT [ 59.253597] Hardware name: NXP i.MX95 15X15 board (DT)
> [ 59.258720] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
> [ 59.265669] pc : mxc_isi_channel_chain+0xa4/0x120 [ 59.270358] lr :
> mxc_isi_channel_chain+0x44/0x120 [ 59.275047] sp : ffff8000848c3b40
> [ 59.278348] x29: ffff8000848c3b40 x28: ffff0000859b4c98 x27:
> ffff800081939f00 [ 59.285472] x26: 000000000000000a x25:
> ffff0000859b4cb8 x24: 0000000000000001 [ 59.292597] x23:
> ffff0000816f4760 x22: ffff0000816f4258 x21: ffff000084ceb780 [ 59.299720]
> x20: ffff000084342ff8 x19: ffff000084340000 x18: 0000000000000000
> [ 59.306845] x17: 0000000000000000 x16: 0000000000000000 x15:
> 0000ffffdb369e1c [ 59.313969] x14: 0000000000000000 x13:
> 0000000000000000 x12: 0000000000000000 [ 59.321093] x11:
> 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
> [ 59.328217] x8 : ffff8000848c3d48 x7 : ffff800081930b30 x6 :
> ffff800081930b30 [ 59.335340] x5 : ffff0000859b6000 x4 : ffff80008193ae80
> x3 : ffff800081022420 [ 59.342464] x2 : ffff0000852f6900 x1 :
> 0000000000000001 x0 : ffff000084341000 [ 59.349590] Call trace:
> [ 59.352025]  mxc_isi_channel_chain+0xa4/0x120 (P) [ 59.356722]
> mxc_isi_m2m_streamon+0x160/0x20c [ 59.361072]  v4l_streamon+0x24/0x30
> [ 59.364556]  __video_do_ioctl+0x40c/0x4a0 [ 59.368560]
> video_usercopy+0x2bc/0x690 [ 59.372382]  video_ioctl2+0x18/0x24
> [ 59.375857]  v4l2_ioctl+0x40/0x60 [ 59.379168]
> __arm64_sys_ioctl+0xac/0x104 [ 59.383172]  invoke_syscall+0x48/0x104
> [ 59.386916]  el0_svc_common.constprop.0+0xc0/0xe0
> [ 59.391613]  do_el0_svc+0x1c/0x28
> [ 59.394915]  el0_svc+0x34/0xf4
> [ 59.397966]  el0t_64_sync_handler+0xa0/0xe4 [ 59.402143]
> el0t_64_sync+0x198/0x19c [ 59.405801] ---[ end trace 0000000000000000 ]--=
-
>=20
> Address this issue by moving the streaming preparation and cleanup to the
> vb2 .prepare_streaming() and .unprepare_streaming() operations. This also
> simplifies the driver by allowing direct usage of the
> v4l2_m2m_ioctl_streamon() and v4l2_m2m_ioctl_streamoff() helpers.
>=20
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tested-by: Guoniu Zhou <guoniu.zhou@nxp.com>

> ---
>  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 224 +++++++-----------
>  1 file changed, 92 insertions(+), 132 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 6bdd13b3048f..a8b10d944d69 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -43,7 +43,6 @@ struct mxc_isi_m2m_ctx_queue_data {
>         struct v4l2_pix_format_mplane format;
>         const struct mxc_isi_format_info *info;
>         u32 sequence;
> -       bool streaming;
>  };
>=20
>  struct mxc_isi_m2m_ctx {
> @@ -236,6 +235,65 @@ static void mxc_isi_m2m_vb2_buffer_queue(struct
> vb2_buffer *vb2)
>         v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);  }
>=20
> +static int mxc_isi_m2m_vb2_prepare_streaming(struct vb2_queue *q) {
> +       struct mxc_isi_m2m_ctx *ctx =3D vb2_get_drv_priv(q);
> +       const struct v4l2_pix_format_mplane *out_pix =3D &ctx-
> >queues.out.format;
> +       const struct v4l2_pix_format_mplane *cap_pix =3D &ctx-
> >queues.cap.format;
> +       const struct mxc_isi_format_info *cap_info =3D ctx->queues.cap.in=
fo;
> +       const struct mxc_isi_format_info *out_info =3D ctx->queues.out.in=
fo;
> +       struct mxc_isi_m2m *m2m =3D ctx->m2m;
> +       int ret;
> +
> +       guard(mutex)(&m2m->lock);
> +
> +       if (m2m->usage_count =3D=3D INT_MAX)
> +               return -EOVERFLOW;
> +
> +       /*
> +        * Acquire the pipe and initialize the channel with the first use=
r of
> +        * the M2M device.
> +        */
> +       if (m2m->usage_count =3D=3D 0) {
> +               bool bypass =3D cap_pix->width =3D=3D out_pix->width &&
> +                             cap_pix->height =3D=3D out_pix->height &&
> +                             cap_info->encoding =3D=3D out_info->encodin=
g;
> +
> +               ret =3D mxc_isi_channel_acquire(m2m->pipe,
> +                                             &mxc_isi_m2m_frame_write_do=
ne,
> +                                             bypass);
> +               if (ret)
> +                       return ret;
> +
> +               mxc_isi_channel_get(m2m->pipe);
> +       }
> +
> +       m2m->usage_count++;
> +
> +       /*
> +        * Allocate resources for the channel, counting how many users re=
quire
> +        * buffer chaining.
> +        */
> +       if (!ctx->chained && out_pix->width >
> MXC_ISI_MAX_WIDTH_UNCHAINED) {
> +               ret =3D mxc_isi_channel_chain(m2m->pipe);
> +               if (ret)
> +                       goto err_deinit;
> +
> +               m2m->chained_count++;
> +               ctx->chained =3D true;
> +       }
> +
> +       return 0;
> +
> +err_deinit:
> +       if (--m2m->usage_count =3D=3D 0) {
> +               mxc_isi_channel_put(m2m->pipe);
> +               mxc_isi_channel_release(m2m->pipe);
> +       }
> +
> +       return ret;
> +}
> +
>  static int mxc_isi_m2m_vb2_start_streaming(struct vb2_queue *q,
>                                            unsigned int count)  { @@ -265=
,13 +323,44 @@ static
> void mxc_isi_m2m_vb2_stop_streaming(struct vb2_queue *q)
>         }
>  }
>=20
> +static void mxc_isi_m2m_vb2_unprepare_streaming(struct vb2_queue *q) {
> +       struct mxc_isi_m2m_ctx *ctx =3D vb2_get_drv_priv(q);
> +       struct mxc_isi_m2m *m2m =3D ctx->m2m;
> +
> +       guard(mutex)(&m2m->lock);
> +
> +       /*
> +        * If the last context is this one, reset it to make sure the dev=
ice
> +        * will be reconfigured when streaming is restarted.
> +        */
> +       if (m2m->last_ctx =3D=3D ctx)
> +               m2m->last_ctx =3D NULL;
> +
> +       /* Free the channel resources if this is the last chained context=
. */
> +       if (ctx->chained && --m2m->chained_count =3D=3D 0)
> +               mxc_isi_channel_unchain(m2m->pipe);
> +       ctx->chained =3D false;
> +
> +       /* Turn off the light with the last user. */
> +       if (--m2m->usage_count =3D=3D 0) {
> +               mxc_isi_channel_disable(m2m->pipe);
> +               mxc_isi_channel_put(m2m->pipe);
> +               mxc_isi_channel_release(m2m->pipe);
> +       }
> +
> +       WARN_ON(m2m->usage_count < 0);
> +}
> +
>  static const struct vb2_ops mxc_isi_m2m_vb2_qops =3D {
>         .queue_setup            =3D mxc_isi_m2m_vb2_queue_setup,
>         .buf_init               =3D mxc_isi_m2m_vb2_buffer_init,
>         .buf_prepare            =3D mxc_isi_m2m_vb2_buffer_prepare,
>         .buf_queue              =3D mxc_isi_m2m_vb2_buffer_queue,
> +       .prepare_streaming      =3D mxc_isi_m2m_vb2_prepare_streaming,
>         .start_streaming        =3D mxc_isi_m2m_vb2_start_streaming,
>         .stop_streaming         =3D mxc_isi_m2m_vb2_stop_streaming,
> +       .unprepare_streaming    =3D mxc_isi_m2m_vb2_unprepare_streaming,
>  };
>=20
>  static int mxc_isi_m2m_queue_init(void *priv, struct vb2_queue *src_vq, =
@@
> -481,135 +570,6 @@ static int mxc_isi_m2m_s_fmt_vid(struct file *file, vo=
id
> *fh,
>         return 0;
>  }
>=20
> -static int mxc_isi_m2m_streamon(struct file *file, void *fh,
> -                               enum v4l2_buf_type type)
> -{
> -       struct mxc_isi_m2m_ctx *ctx =3D file_to_isi_m2m_ctx(file);
> -       struct mxc_isi_m2m_ctx_queue_data *q =3D mxc_isi_m2m_ctx_qdata(ct=
x,
> type);
> -       const struct v4l2_pix_format_mplane *out_pix =3D &ctx->queues.out=
.format;
> -       const struct v4l2_pix_format_mplane *cap_pix =3D &ctx-
> >queues.cap.format;
> -       const struct mxc_isi_format_info *cap_info =3D ctx->queues.cap.in=
fo;
> -       const struct mxc_isi_format_info *out_info =3D ctx->queues.out.in=
fo;
> -       struct mxc_isi_m2m *m2m =3D ctx->m2m;
> -       int ret;
> -
> -       if (q->streaming)
> -               return 0;
> -
> -       mutex_lock(&m2m->lock);
> -
> -       if (m2m->usage_count =3D=3D INT_MAX) {
> -               ret =3D -EOVERFLOW;
> -               goto unlock;
> -       }
> -
> -       /*
> -        * Acquire the pipe and initialize the channel with the first use=
r of
> -        * the M2M device.
> -        */
> -       if (m2m->usage_count =3D=3D 0) {
> -               bool bypass =3D cap_pix->width =3D=3D out_pix->width &&
> -                             cap_pix->height =3D=3D out_pix->height &&
> -                             cap_info->encoding =3D=3D out_info->encodin=
g;
> -
> -               ret =3D mxc_isi_channel_acquire(m2m->pipe,
> -                                             &mxc_isi_m2m_frame_write_do=
ne,
> -                                             bypass);
> -               if (ret)
> -                       goto unlock;
> -
> -               mxc_isi_channel_get(m2m->pipe);
> -       }
> -
> -       m2m->usage_count++;
> -
> -       /*
> -        * Allocate resources for the channel, counting how many users re=
quire
> -        * buffer chaining.
> -        */
> -       if (!ctx->chained && out_pix->width > MXC_ISI_MAX_WIDTH_UNCHAINED=
)
> {
> -               ret =3D mxc_isi_channel_chain(m2m->pipe);
> -               if (ret)
> -                       goto deinit;
> -
> -               m2m->chained_count++;
> -               ctx->chained =3D true;
> -       }
> -
> -       /*
> -        * Drop the lock to start the stream, as the .device_run() operat=
ion
> -        * needs to acquire it.
> -        */
> -       mutex_unlock(&m2m->lock);
> -       ret =3D v4l2_m2m_ioctl_streamon(file, fh, type);
> -       if (ret) {
> -               /* Reacquire the lock for the cleanup path. */
> -               mutex_lock(&m2m->lock);
> -               goto unchain;
> -       }
> -
> -       q->streaming =3D true;
> -
> -       return 0;
> -
> -unchain:
> -       if (ctx->chained && --m2m->chained_count =3D=3D 0)
> -               mxc_isi_channel_unchain(m2m->pipe);
> -       ctx->chained =3D false;
> -
> -deinit:
> -       if (--m2m->usage_count =3D=3D 0) {
> -               mxc_isi_channel_put(m2m->pipe);
> -               mxc_isi_channel_release(m2m->pipe);
> -       }
> -
> -unlock:
> -       mutex_unlock(&m2m->lock);
> -       return ret;
> -}
> -
> -static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
> -                                enum v4l2_buf_type type)
> -{
> -       struct mxc_isi_m2m_ctx *ctx =3D file_to_isi_m2m_ctx(file);
> -       struct mxc_isi_m2m_ctx_queue_data *q =3D mxc_isi_m2m_ctx_qdata(ct=
x,
> type);
> -       struct mxc_isi_m2m *m2m =3D ctx->m2m;
> -
> -       v4l2_m2m_ioctl_streamoff(file, fh, type);
> -
> -       if (!q->streaming)
> -               return 0;
> -
> -       mutex_lock(&m2m->lock);
> -
> -       /*
> -        * If the last context is this one, reset it to make sure the dev=
ice
> -        * will be reconfigured when streaming is restarted.
> -        */
> -       if (m2m->last_ctx =3D=3D ctx)
> -               m2m->last_ctx =3D NULL;
> -
> -       /* Free the channel resources if this is the last chained context=
. */
> -       if (ctx->chained && --m2m->chained_count =3D=3D 0)
> -               mxc_isi_channel_unchain(m2m->pipe);
> -       ctx->chained =3D false;
> -
> -       /* Turn off the light with the last user. */
> -       if (--m2m->usage_count =3D=3D 0) {
> -               mxc_isi_channel_disable(m2m->pipe);
> -               mxc_isi_channel_put(m2m->pipe);
> -               mxc_isi_channel_release(m2m->pipe);
> -       }
> -
> -       WARN_ON(m2m->usage_count < 0);
> -
> -       mutex_unlock(&m2m->lock);
> -
> -       q->streaming =3D false;
> -
> -       return 0;
> -}
> -
>  static const struct v4l2_ioctl_ops mxc_isi_m2m_ioctl_ops =3D {
>         .vidioc_querycap                =3D mxc_isi_m2m_querycap,
>=20
> @@ -630,8 +590,8 @@ static const struct v4l2_ioctl_ops
> mxc_isi_m2m_ioctl_ops =3D {
>         .vidioc_prepare_buf             =3D v4l2_m2m_ioctl_prepare_buf,
>         .vidioc_create_bufs             =3D v4l2_m2m_ioctl_create_bufs,
>=20
> -       .vidioc_streamon                =3D mxc_isi_m2m_streamon,
> -       .vidioc_streamoff               =3D mxc_isi_m2m_streamoff,
> +       .vidioc_streamon                =3D v4l2_m2m_ioctl_streamon,
> +       .vidioc_streamoff               =3D v4l2_m2m_ioctl_streamoff,
>=20
>         .vidioc_subscribe_event         =3D v4l2_ctrl_subscribe_event,
>         .vidioc_unsubscribe_event       =3D v4l2_event_unsubscribe,
>=20
> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> prerequisite-patch-id: 9581e075a75aef4b16218280c8dd5788840fad41
> prerequisite-patch-id: 74bfb3e362032eae530395b10471ad86175fe592
> prerequisite-patch-id: 6c7220d0c283111ab3027086f6ce2d17447e5d07
> prerequisite-patch-id: ebefea609f3bd3aacb344701c9971afef5be48ad
> --
> Regards,
>=20
> Laurent Pinchart


