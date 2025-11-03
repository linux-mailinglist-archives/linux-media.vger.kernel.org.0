Return-Path: <linux-media+bounces-46173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09990C2A160
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 06:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B89A4E1448
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 05:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8814128726E;
	Mon,  3 Nov 2025 05:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="gKEcx1bA"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021132.outbound.protection.outlook.com [40.107.42.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC7723D7DA;
	Mon,  3 Nov 2025 05:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762148510; cv=fail; b=Ykt9uqW1Sz68bXkhlRHPSut41TSvK9PWrVeZBdXNxHs+usZ2r8nYWYIlu5g69XSbzulXFEwq13aCArWfs5CEQhFikVeP4/8Moply3KrXA8GOzd2O7ycuukM4DsdW6OVZUUhmDBMTRu58HxfQv7A1idVDuk7M3W+trO+QvE+ylLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762148510; c=relaxed/simple;
	bh=2C2RqJbqYwfamd6WK3t1fe/AEpfY1cJNm8RSLBvrGsQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A0NLsxophk9zzBuoNamBl6XbJyBYv1P1PTfJeL2IpGgo7nt81nZRNLwgsOcKPBTIKflljnxzzCU6TDOBtSuTQhvaJzqXD2XOJLjiM0lWupnhaT7ttRttBUT1d4LB/LqBtf73NF0vxLgOE6gb1h+vS99jwKkYfNvmRXkVUkDswvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=gKEcx1bA; arc=fail smtp.client-ip=40.107.42.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yyme2RcssCsbq3F+PVMfpTNq35aQq3SLPPJgQqUZGSC5EYyW6MpIbwDWhD52w2gxHVObDLQT0ioNL12KGE3KulUfnvELfiFYk8LSwqSLRFV+pPvdQXgTHGkMDcHw9JGnc/bYvfsPh6ZpYXe7+/70vR6x/4xhCTxRGo/jO/JC4+sxbh+ZVTk1+7m69G+ofY/pIt1LuUyDynF2/ll9nw+jejRGzhe3N/jOU5Bp7pL7WB+fIW26DR3/MzLc3WK3Y3V8aX9wBM9aFeBHLD1GJjnDYPkOBo7HgfWdhNDQpmxZ+sZOeDg+e41Y4f4wH7eezrmnnDp2THhdOMnraY/KnLAJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65rTlZEyXxktHHqiDW0Raj/+UpFnA+/4OzfXB9nB4g0=;
 b=Z3R6uvq0DYt7RZLJtTtg6IYegu4WOtB6+SJ9356XXU8Gq23qJo6Ab13rnib/5x0yWQB7LVzovusFI4begH+eHAHkj9dc25xrVGNDZwVl8TNUlvlzUoCjU6Gu0/cgGrOIOCNxJ8BBtyIyqu0CJcd5NQvVeXT/WQTbTw5VR1Q2oLVrEHuk10nv2ag0C9X3EDlFMAl2IQkKeThtNF25pjtF+U+50wjMowEfQUVPI9ZEsyWoA/u1CFRn9Dbx7nxz0iKthfLZyGcF9psWitK54i4xRlr3QJ4dgAFGlaI01oWuS+6rIESyb5ria4T5fgQmaoayX7xX28++TeO2ceMo6PY/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65rTlZEyXxktHHqiDW0Raj/+UpFnA+/4OzfXB9nB4g0=;
 b=gKEcx1bA9COlibHtsMFTYYf6oXjHNMr22PpSrMr2heI91hvIGpcvlLconDF5yMBsVKnBQg3Kh7dbgDvZ3n9mGFbP8RmwHFr706jZxEWzvLN5kZhr4Bn8dkNDeDxBI5ue30g9PRgXTT8pjNCpaS2oSrpzrSZojb+SD26AGWi55KU=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE1P216MB1463.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Mon, 3 Nov 2025 05:41:41 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9275.011; Mon, 3 Nov 2025
 05:41:41 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>
Subject: RE: [PATCH v4 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Topic: [PATCH v4 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index: AQHcQygbK4C0CYvBZUif896/Yzrl7rTN1iCAgAEe/sCADPAwcA==
Date: Mon, 3 Nov 2025 05:41:41 +0000
Message-ID:
 <SL2P216MB12469CBB5134DD85248B46F0FBC7A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20251022074710.575-1-nas.chung@chipsnmedia.com>
 <20251022074710.575-3-nas.chung@chipsnmedia.com>
 <8b420cd2-9549-4033-b82f-a2bc145b7280@kernel.org>
 <PU4P216MB12399BBA5513DAE7D1D60BA0FBF0A@PU4P216MB1239.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <PU4P216MB12399BBA5513DAE7D1D60BA0FBF0A@PU4P216MB1239.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE1P216MB1463:EE_
x-ms-office365-filtering-correlation-id: 05dd9e16-0f68-4ee9-d565-08de1a9baa43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?T+PZX8kn8DCu22NOHJ1P4kQb2jt/YedwHFdG94Qm0nUKq9Csd0C489CwYIPb?=
 =?us-ascii?Q?gLPs0wlGQ980qV1vHOu1iz7NvMiM/+R3KNgTMNwKn1bE0+FrKyEbG1lRe8r3?=
 =?us-ascii?Q?u/kLfWkSaydMrT0WIcVBiBC11FeRy3/bIuJeXMvBWwnedm4y009NlBlp//L6?=
 =?us-ascii?Q?+Vo3j2ZK/o4SjS4O/niB6Csg5EE+8Lwiba1vsc12W8vwY5fBJhssxUAMixE4?=
 =?us-ascii?Q?/X8spba+pjzpkhMWCpe1QtVTUxBBz5lSybVPJ56tJHNUyHR71+tu9prk7kXP?=
 =?us-ascii?Q?5fZke/aKM4La7RCcnGM11A763JQma83b7SNyGyXe9tCkgPWjPcRFicrzXoQg?=
 =?us-ascii?Q?tStXCKtOSyvk1OFIMWJe5QFdnn8xnJu1Mw95rETU6r9uAH3ONvQY73HDroYi?=
 =?us-ascii?Q?szQy/kxv4fm/bIlJH+HV/rBfJBniMDt9DgIxGFVdeWQk/5r9k89yfqlPJNF+?=
 =?us-ascii?Q?Bn87aKz0IEOCCZNJiRafeouKankqlgVJGEqVDsZZdpWHtk/m+6jvfM3bgXhA?=
 =?us-ascii?Q?1Bm+egjcNASI4emdlLp8ynOljAA40rcsQ82oSfv9UpMU9ysks8X966zVro/n?=
 =?us-ascii?Q?AOLZXQKbtxR1b6SGX9uO9lIIhwjx3cFuF1codklUwXkNwt4+4xo5q6v1R6Zu?=
 =?us-ascii?Q?ZfusS58nlUhdlkFBXD9xVrpdzdGtRf4/xoyVsJ8GJ5nZeq0oU1aOsHjZDmtf?=
 =?us-ascii?Q?EkLUfA8gSBUOw7KcphsGc5tuunOns3r8TfS4RvSf+oBGVYsWGL0fYQwe1N7h?=
 =?us-ascii?Q?mZiW8jXQSfXsymULflJRC22Arvm6mTpNoSKs1uHsOkccJEiBR7zYMa7oTdZm?=
 =?us-ascii?Q?jMqznJVnRE85UOuGS78k6Lo9fS2wFn+xfACOtaqr15i6h9b1P4pdHcI1QJGg?=
 =?us-ascii?Q?2wXnoR+rSwSsCm4pwKRkM1G4TWqoNierokK09zeK+vmzziZEnFIhttjzl9fY?=
 =?us-ascii?Q?kpStPt9p3EUadvfs/Q4MVSKnB14dM8dxIxKt+Be+7uhYiS1sNpvZ0zMYd+C2?=
 =?us-ascii?Q?dr/52JzT3hqe83zEqvesmByreNyNF0YpKJ+DwAxA3kCvenAH2lsXDipgOQSR?=
 =?us-ascii?Q?WY6HUhqSRYWAjT0nVMvwV8HxPSNH/hV2yCGBHa4T6aQCgNjoQxtOSDR/7z2M?=
 =?us-ascii?Q?T1KbjQw9ifiSTxS5NHIwcGeyktM7w7ZZTv7PpLOFpIZSNbbgMWmJGNSqXlKV?=
 =?us-ascii?Q?b+pT6eKk/axgzfmtcrmrTAMBaIIrt1iJAWSVnp4C/8JsmawVBNhxlVUNVjHF?=
 =?us-ascii?Q?SVBMm33mhhIBKIXO4s8gUWUjpKnxYNh2x8Oy9n3e8bR4n4+WuQ/1RCPu1ISB?=
 =?us-ascii?Q?aamMdnpHJqNmYBdM2zWM4IYGZ+sGeIu0rQYA+ell2r14/3M8GSwQh+oj0Wqp?=
 =?us-ascii?Q?fOkkSwZLpaHkZ0XCO55CpH7VkX9EpwHf4KoRx/qsTBlZcStDbI/YwzESFf73?=
 =?us-ascii?Q?j02lXlGHRLb4mqLGvCwlj7NDZqL4zQt4Gmx5/YhnljobEYBWAlyzsC9keOeF?=
 =?us-ascii?Q?5yawjT/C8qHgnJBCMfUwraCzJUPsKowPXSnc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qhi/YzlDOHUg4gxrwCy25rsnj54Pt+t4L8vSYGPGxIQXp/fyQpqFIj6NRWm4?=
 =?us-ascii?Q?JWqFVPEEZ0vQC1D9thZkRMxZuxntyRlHyV9QugqjnalTpmAFDlWA4l9BgoGk?=
 =?us-ascii?Q?C5314TW7TkNW2NugkJqgFbTm3OHs4coMZpqcCySO/VmsmLZb1to9jExY+r09?=
 =?us-ascii?Q?9jtKzDO5Tz6ezFdTEHakeiSqQOxCfDxOyNMNrWmgJTtbk2MwULybh7DsyC6a?=
 =?us-ascii?Q?Pjt5hJypGa+6hXOjbYRHSjsvd6EkG4ZTBlDt+khASUnq6KKOPUUPtqUsYTtx?=
 =?us-ascii?Q?AP4wtJIbqHcl5w7QO63BfEpzQe3z+AUyjoHkqNeDLeiFXmv6g+w5ajKsHmNn?=
 =?us-ascii?Q?Vz5ZjXGsc+D1mO4rmrXYM0+sTZqlhYPG/bAj6bZK8SeIsauUUMVQmTxskeRZ?=
 =?us-ascii?Q?UG5/7kB2ClPUPAVResYNKOyjKFyapYq3fwh0bQ6gYVxU9gL/a/lOcdKjXez2?=
 =?us-ascii?Q?wRusNcOG5DEM3xcRjCI5tpWtpftjYUSew2pEur1bzXL22pcDZgvc/Nr9rGMK?=
 =?us-ascii?Q?Lp8jDqBMMwL3wJFvBNXAwg66l3liPetWTOyfVhcBu3qMsPpM45VQ70A4kbE8?=
 =?us-ascii?Q?kujWTjNnu7dpww+5qZcPC8XJoe27fc9oEPOvjweDzBS3evWFmKmIGm6HC/1Q?=
 =?us-ascii?Q?TO6shAP+nZR4cidA90QXAOqEpNOWxY3LC535pZgWTvRYyh45Nk3hFYxX5X4f?=
 =?us-ascii?Q?r/12FXc0zghGQ1bBA+zbwABK04WagxCvnYWnJbsOK3A/yar5tQ5sA59LscFp?=
 =?us-ascii?Q?fTu84dwemZcJhTl3zn0OSeatpnBzWkIcuTL2XU42/43AIgUSnwk/3fRY3Ibx?=
 =?us-ascii?Q?56eJFhKnbMzvVS2RPaQBLzvJYSvXDtF4Wy5Fq581IoJ+eCqnWkMKMQ5MIWuC?=
 =?us-ascii?Q?FtHku7m205Ucam5o9tYUNfMcXXL+EJTIxgPze6/Rh9iA8o8SwIfwqXHA1StG?=
 =?us-ascii?Q?tZ6HehIxyFMWkfujG7uh1EQe78trXcRpmousIRDXA+lZSwx8nnxUw59XRAyV?=
 =?us-ascii?Q?8i5iPDetPofBajy9JJOAGDHJ5eoP1PloEO62gfGQANoxoqLcUZ1zrcsmTUuN?=
 =?us-ascii?Q?ksCSMSAa1CiZz/Abwql1VTBbI2JXBfIWgzAzOIIi7y8esRh2D8r+CwXHxTX0?=
 =?us-ascii?Q?Rgov9BLxox3yQ1ZnT5qgazcp5xM2PnW8IEcGkFuCfSWlw756BA08mtdGeX/o?=
 =?us-ascii?Q?9k9ijbkpvF0Q1u/Y5jRFxka//y7Gtx1yRRQJ+VjTf8YwXBbLqVnp/lBTT5om?=
 =?us-ascii?Q?00i3+JQsRZgmLOexymLuhlrGVqn6lg8Vkl6afle8/BzOFh8C1WJxSUHE50CQ?=
 =?us-ascii?Q?6I7lOeSbvvjx1Le+UTrpLpZYlaAtL/IcCNEBN6TmUmsglhzF7+spg118f8O+?=
 =?us-ascii?Q?KzgRbNKz0J6vAIUpORFIbTCz2LZauRZJeOhIdTUxQcU9AM10iq4PVDVxk7ei?=
 =?us-ascii?Q?y+MYthv+pexx/GkS3QJtJ1B5FksKgOx0j+ixSklqqMUivnqikswlj1F3477l?=
 =?us-ascii?Q?VOC2m0JLhF3+L1tlXvVWRH3LZGy+fZSQXrII2X2Bgeei/0A/nBLkzrDMtNUp?=
 =?us-ascii?Q?NK71AMuS6fiajubtQvjeUh2YPgarO/VA1TdorL4x?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 05dd9e16-0f68-4ee9-d565-08de1a9baa43
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 05:41:41.1608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UX64o3qj+R9Y0klUQMhZE6YIc2KBoCEfzwT0MOsPuna+gpACE005GAg2dAIMXIom2N4lL9FweincRpVm6RAMTou7eHEy2iJ9VLxzV9HfYjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1463

Hi, Krzysztof.

>-----Original Message-----
>From: Nas Chung <nas.chung@chipsnmedia.com>
>Sent: Thursday, October 23, 2025 2:14 PM
>To: Krzysztof Kozlowski <krzk@kernel.org>; mchehab@kernel.org;
>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>; marek.vasut@mailbox.org
>Subject: RE: [PATCH v4 2/9] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>Hi, Krzysztof.
>
>>-----Original Message-----
>>From: Krzysztof Kozlowski <krzk@kernel.org>
>>Sent: Wednesday, October 22, 2025 5:31 PM
>>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>>lafley.kim <lafley.kim@chipsnmedia.com>; marek.vasut@mailbox.org
>>Subject: Re: [PATCH v4 2/9] dt-bindings: media: nxp: Add Wave6 video code=
c
>>device
>>
>>On 22/10/2025 09:47, Nas Chung wrote:
>>> Add documentation for the Chips&Media Wave6 video codec on
>>> NXP i.MX SoCs.
>>>
>>> The Wave6 video codec functionality is split between a VPU
>>> control region and VPU core regions.
>>> The VPU control region is represented as the parent node and
>>> manages shared resources such as firmware memory. Each VPU
>>> core region is represented as a child node and provides the
>>> actual encoding and decoding capabilities.
>>>
>>> Both the control and core regions may be assigned IOMMU
>>> stream IDs for DMA isolation.
>>
>>
>>Please wrap commit message according to Linux coding style / submission
>>process (neither too early nor over the limit):
>>https://elixir.bootlin.com/linux/v6.4-
>>rc1/source/Documentation/process/submitting-patches.rst#L597
>
>Thanks, I will address this in v5.
>
>>
>>>
>>
>>
>>> +
>>> +  ranges: true
>>> +
>>> +patternProperties:
>>> +  "^video-core@[0-9a-f]+$":
>>> +    type: object
>>> +    description:
>>> +      A VPU core region within the Chips&Media Wave6 codec IP.
>>> +      Each core provides encoding and decoding capabilities and operat=
es
>>> +      under the control of the VPU control region.
>>
>>
>>You explained more in previous email than in this description. Are these
>>independent? Can they be independently used?
>
>No, they must be used together with the control region.
>I will clarify this in v5.
>
>>
>>But you also said there is one processing engine, so I do not understand
>>why these are separate. If you have one engine, there is no such thing
>>as separate cores.
>
>Although the Wave6 VPU contains a single processing engine, it exposes up
>to four hardware interfaces, each with its own MMIO region, interrupt
>line, and IOMMU stream ID. These interfaces allow concurrent submission
>of decoding/encoding operations via firmware scheduling, while execution
>occurs on the single processing engine.
>
>The control region also has its own MMIO region (global registers) and its
>own IOMMU stream ID. Because the control and each interface have distinct
>resources and stream IDs, I believe representing all regions as a single
>node
>would be inappropriate.

Could you please advise whether the following DT layout is acceptable ?
- All MMIO/IRQ/clock/power-domain resources stay on the parent node.
- Per-interface subnodes are data-only (no compatible/reg) and carry only
  the IOMMU stream ID.

vpu: video-codec@4c4c0000 {
        compatible =3D "nxp,imx95-vpu";
        reg =3D <0x0 0x4c4c0000 0x0 0x10000>,
              <0x0 0x4c480000 0x0 0x10000>,
              <0x0 0x4c490000 0x0 0x10000>,
              <0x0 0x4c4a0000 0x0 0x10000>,
              <0x0 0x4c4b0000 0x0 0x10000>;
        reg-names =3D "control", "if0", "if1", "if2", "if3";
        iommus =3D <&smmu 0x32>;
        interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
                     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
        interrupt-names =3D "if0", "if1", "if2", "if3";
        clocks =3D <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>, <&scmi_clk 115>;
        power-domains =3D <&scmi_perf 10>, <&scmi_devpd 21>;
        memory-region =3D <&vpu_boot>;
        sram =3D <&sram1>;
        #cooling-cells =3D <2>;

        interfaces {
                if0 { iommus =3D <&smmu 0x33>; };
                if1 { iommus =3D <&smmu 0x34>; };
                if2 { iommus =3D <&smmu 0x35>; };
                if3 { iommus =3D <&smmu 0x36>; };
        };
};

>
>Thanks.
>Nas.
>
>>
>>Best regards,
>>Krzysztof


