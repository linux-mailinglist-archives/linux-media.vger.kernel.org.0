Return-Path: <linux-media+bounces-27258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A27AA4A742
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 01:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE5477AA1A2
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 00:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33011BF58;
	Sat,  1 Mar 2025 00:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="nzSkRS3s"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CC5DDBC;
	Sat,  1 Mar 2025 00:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740790621; cv=fail; b=BH8rWkKw/SQOJdnTrf78EW7uN/iAtMwJbupdmiThhHpsuasHiYinhUvecRyM2s++5/fXjwCghjSJTroRIBjsXYePWXYOxSkvql1wZZfcv2quVLMvbwcrbu+PWCwW+SD8gshBnDPZmPUB75YWYjTibFe0c7YlV8qR7bgI/xCdc6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740790621; c=relaxed/simple;
	bh=6vn7eow7FMaqDs/SE3fs30FiikxDABp39/tMZFZOMNo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z3vAhWBqzMXEEtz9qa30mybqX8vly+39zd94H7c8h148FHlMWAzqI+auDeGIWdZJvmC2qLjLiYEn1LZn6hsuffnZO7eCTz71r6L+36N6cdK8QaaUbH7t9g8mJw4lnJfQ0DKX+RK68CNIoTUY591qZvwGLjK8hNp5MXsQ9o+nOUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=nzSkRS3s; arc=fail smtp.client-ip=40.107.93.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djgt+hk1cFzoU0K7fPT8TaIgdIFRyEds80m+AAVM8Fwf8CnvQQsVm1+M0pfwkR7VPsMtkovTqv+5uX7cCaLk2KfnYbW0VE/pPOfzbccuFkAQdbpANglYRWXbgRrZJNYlaaNhwahmJcQXMs3o8bzBwoq9/l/BOPzRNAuJNTf9NPdKY0SdzW+CBevySnqgQxcYUf/0QeH24vm1CAgs2VzGiUHlMHQfYtJuoA3oliuka/YgTybgozBEf8y4Duz0DaFJ+glPk37Dmh85868628+irgQqeowdsnXesKy9jLopIpSBasAE98vy+BohOliPaQlYLJPjtm2jbwZZMeAAeWizmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQ0nV1PK6Df5k381pT5iy1TfLLPB0XFLJhlFwVtDMmU=;
 b=zDw5Ny8MAR7sa9UXBbUYaA/92bgQ6doExoL5nYnJsIN0reGX+llQ+FYV/2kAjipZG7fkCI9KMl+ZQbpADMafcQ2U/VgDyj6NXNMfK5kQj++ls3vKG1dqSl2Iy67XBqywYgpuY880jImcU3xQvhDk9WF5Mn1pSZWDbBGDQMdmLGgrh5rUm93YEpcebRsW/zijNp+fI7+RGTau66anLl697/gTAz3DtSdLzWXxFNYHTqmCq1CFsb15RzvKw1e1uD+ahLxBABY8f7nTlpH++/WPns1VnRDE80ewu7OMhv4fhFb9xzpmygz+wyNm++vjl8tePPjYVWRa3qAT4qnYVCbeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQ0nV1PK6Df5k381pT5iy1TfLLPB0XFLJhlFwVtDMmU=;
 b=nzSkRS3sEv1jTZwOI5QdQdRh1GiDyYUtujf+MFV2zZ7xaiWsbyokqVTdNLdXTHgqpLPDoN4F17BOAq5NB+qm1J9PJy4D0fKGp2SRrxRAwnC5Cd8hgei/dee//M8KRjgIk+wUKjtNT/m5HwpSC/d+LPkvfIpplM16UN0XL1iXDCCUdhHBceRT7suBl76fZxRPZwCeZyH5gUI8PRbIzMgkYVP8Dv657VpaLtizhRaxPF0+J6EuINSnVH/lcr+Q9HRKCJ7cYB+U9ncYrJ9jbYImyxN8cDVBBiFQZJfsyRgtElEU5Y2z4D21FBSu0QTOWz8/+KQ68rfAGcKhLJSbgS0bSw==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by MN2PR11MB4519.namprd11.prod.outlook.com (2603:10b6:208:26c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Sat, 1 Mar
 2025 00:56:55 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8489.021; Sat, 1 Mar 2025
 00:56:55 +0000
From: <Shravan.Chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>
CC: <mchehab@kernel.org>, <kieran.bingham@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
	<Praveen.Kumar@microchip.com>
Subject: RE: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and 2k mode
 register arrays
Thread-Topic: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and 2k mode
 register arrays
Thread-Index: AQHbicx/NYQCRnacwE+Q13BsI0u1H7NcmeaAgADbiwA=
Date: Sat, 1 Mar 2025 00:56:55 +0000
Message-ID:
 <PH0PR11MB5611466B2027B79F7598534B81CF2@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250228103332.3647098-1-shravan.chippa@microchip.com>
 <20250228103332.3647098-2-shravan.chippa@microchip.com>
 <Z8GiqSfuyQdUNylt@kekkonen.localdomain>
In-Reply-To: <Z8GiqSfuyQdUNylt@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|MN2PR11MB4519:EE_
x-ms-office365-filtering-correlation-id: cbc623e1-8d3d-4e98-a7c6-08dd585bf65c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gBt9u3116b8w0h5ZooBHCBSu2F12bTXgCjVdw6FfA0A9qawRYe3Egxmqnx/y?=
 =?us-ascii?Q?ErbODgYCt4ydvQaivs10/hvN3x8Iy96RVfiPYtEDTeSgPNAO1RwKCzjk7RkT?=
 =?us-ascii?Q?OLyqdISIR5r9N6dThv1d/XrGL42iItBTS54vyygLLrgVhPa8kgdSfNQNpIyp?=
 =?us-ascii?Q?qmuYE/UQLGKLa3L765kJgA5hQDdxCUm1b3DevUQI/KoiQ5Pf5rllcvgw1fDf?=
 =?us-ascii?Q?7CHglw8P6FlKt2F4a9vtoJVJ9ckR3OuL5iwej6X+1xZwAxvxf/BPeMcXrRQU?=
 =?us-ascii?Q?lXbr2WZ8rZbSDFD7peRunNrS11xoEeb5Qb38rHuu/A0ta/ysS2MEXUFL+qbh?=
 =?us-ascii?Q?brS22ZyX4bFYMd7GvH8VyIiq/NwD+/aOY4Maxdur/BzCDqnkNg++efgfuUt8?=
 =?us-ascii?Q?PAzxweimrkMXuaw6j5/VeHNt4cWKsa8oKPvLX5aWlDz+yR3vIu0OKC8qOgED?=
 =?us-ascii?Q?mubkbfTY2t0rNwzpvEoFnAcWE/7w/Q0D+wucizqPp1mHkMwvnenZxhtbyjZI?=
 =?us-ascii?Q?JZ1+/mo006eo3WwoRaqYHpqU1gPAj0pGT7jZOzwRnYcuJWCe7k3rjZUWl27w?=
 =?us-ascii?Q?I7kXzsQg+C2MkMpo0+lj29YrjO3e9ypF+PPZzNMqpMYVqU0QzECGx3wYK7lZ?=
 =?us-ascii?Q?RWlQIvt1K2JNU9EFFX3I/u819lJwVOTX7YtAasxQtVZ6KG3/VC01MmeW1Si1?=
 =?us-ascii?Q?UhVyYVr4pzTliLaJ0sIZeJ+OH4tNAjoDE4kJv7qZXauzBmLEHUknJMfxihLT?=
 =?us-ascii?Q?WhkL64Dtu9r8l8hJK/jUpwVJkXtQfJBt9ZMA4BWNRf3Xzle4TgM+I2+tcPDH?=
 =?us-ascii?Q?msBNxE0bknU9Iu74/sH13TOA07JWEWAexlkxVJbcqBwLO3hh3whX4KR94obj?=
 =?us-ascii?Q?+oxebc3I5hHCHx1QZKW88ASkBN3DttTAvMJs/8HBUnQPLyKA7GttoA//rm0O?=
 =?us-ascii?Q?BpAuew6dAK83VkE3soyZ3ZhgYLR3Gzecj6xxwKl+efdl5LBxNeIuVQ76rTFm?=
 =?us-ascii?Q?tlnlwlMKmcJUVORK0QddMRqBExrVZjJzDBGny4buFkPeyNBOc1RtKpNUloO9?=
 =?us-ascii?Q?9bV1v7Kcx9y1NMwTTPCJ4RI+cOBDyfnLsRV4PksX+OWd0q8QzQZl1UDrMZo1?=
 =?us-ascii?Q?uDK5ojwW135xb59whTgBfhqMF5duqkNjWD7e/c/iCtU50jWOB59QKpy8xO0L?=
 =?us-ascii?Q?RScHAdzjMD/U8PU3A5s5CRxrQnY5ZCbt1WjIu4g1w9bIKtBPwOITbJLI3Fui?=
 =?us-ascii?Q?fCf+J04t4MYJ7/KMFhKAp82G7ifDj7O1wlocO+gjPgJu17gmA3a7dNRElKWc?=
 =?us-ascii?Q?XcbVgTh1+Ba2CBJ8pbBJq/Vb3WnxZ0Y9DTQvXNdcPw6g7mGzwyvbXY+FthWP?=
 =?us-ascii?Q?ZMUFIuKyQdN9aUXUwGVUMPoakuY/uJlMgm1dMBNeMvh6kaHDmRwCjWqUwqIb?=
 =?us-ascii?Q?S746IdfCov0So1OotRc5nx4SZ8zE5kmq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FKfJbIRi4FOXV0Wqyx92oz1uiuo0yBM7YP29W9saFX/CJr+6lfvh79b9BRfr?=
 =?us-ascii?Q?qOPtDKBJrntpYlgdCidNRtlfvXmyrCvcOtaT2bjY72AcuaXwUE5szyOj5Q/B?=
 =?us-ascii?Q?0zuhCST828NWIxxBQ/6oc6L6nCLQ8vbrrG1G5o2XuObZWZrCXpz4FwrQvC+E?=
 =?us-ascii?Q?ztbDTuY6HVaaGwsIUjHDnZlDup6szFNnQYC5nmSfMVhzbFMQIPXy+f56qKkN?=
 =?us-ascii?Q?F20jeR2CqHSkQoiw8r/Q61Lmx36phr6elzdp8s2QeeTC6YeBx0SFkgnTaNXM?=
 =?us-ascii?Q?wcE3tt0QRjNSSWn3g6XlnAvhWsFsDXN33UipC66WEvs+ryrDAS/oWr2Ia7jb?=
 =?us-ascii?Q?TOtRizN933An/osbfRoVCmQFvwF5xyNLcq4mnUSfDo9pXasRiBPGtXS14I41?=
 =?us-ascii?Q?Px1BTBmeGDrVmHemVJld41srm0scJawfJG2IHD89YpfgHYXwkYLeVnn1YXLt?=
 =?us-ascii?Q?oZgGP+JvQkMeGIdca10RYpdzLz+FC3a8B/7y04YqTlpB/95scWWDW0/kdNcv?=
 =?us-ascii?Q?pSI6S/GioeLWnv0IUXmKhO65tK09axad4fGGjqU2yfHEWtm3xep9OgB8CVCz?=
 =?us-ascii?Q?VWrBsupvFxVSeHRuWgqa5wgud5FSa+US2xsNGpQ0bPIUDHZKiTvAe8qbG1bG?=
 =?us-ascii?Q?agFhuAi8bEWBl21+FnQaRH4FXOyQUA/KiGB75VECyEaHSR943ChRs8532kP6?=
 =?us-ascii?Q?StqOxDvbPAletQ8283lCDR1YPmr8UXsPfwzHmiIFy8yvsrHMV+Oe1CtplPkK?=
 =?us-ascii?Q?Lixn8MLyTDyuJPkv0xktBMdbzW+EG3xWYTUZ9Vdt7+V1QT4PwfcRwWRksxCh?=
 =?us-ascii?Q?haDwyg8S7ootIusSw4ust1WqHrTWrFbidJThde1tsyPolZSd3s+u+E6EiK6s?=
 =?us-ascii?Q?3wk62Tiv+44igqQHtwQN/A3HHWlYec3UJeH2AFaPqRuE9KlCSJ5mXyj4garH?=
 =?us-ascii?Q?90ikZyuLe2AuPrMSngQ9UgU6eVum72qJLjnBQT9tWYGzy6FS5b9sdIi5ampU?=
 =?us-ascii?Q?sS9SC82AX4GOlCM1wh1fqKXxlEk181q1DV+HhCkS7dkv3ZRbilRyxTsmnzl3?=
 =?us-ascii?Q?THYvJ16Ea1DkOXdj6qrLlqOMG0KFIJDWCP6AyDMFmpu7+3SQQPcKaEE03BA6?=
 =?us-ascii?Q?i1TXuqpbN2/QMy26EEJtH+zAZkTSm4HqznrOFkrZCc2r56wb/VBZxNgAUJr+?=
 =?us-ascii?Q?ry9WKFEXLWUAXJTHdjaZsfyCkMSDH5hLc9m/A+Q0oHbFICotnPVNXyroCl75?=
 =?us-ascii?Q?WdojMQbgWvKAlepdibVaeaEjK6VnZQzWK8zixblJMCZIrLwpO0txLWyNCm3o?=
 =?us-ascii?Q?eEH3OEQiLAJFlopDAMn7q/ZWLq/rqW6sv0EaRHrOlF+AXK682iGxtLW+aVAR?=
 =?us-ascii?Q?dmSTBWp9Qv9xfGugHEJmcVPX48LSPp7syqK1ZsI53YmX2NS3xTG+TVYe+rAY?=
 =?us-ascii?Q?wJrTvixfUKxZYPaNVvBklLPt0laKh5V5jrskv0L5eUZYnuVbNuR5yRIV+4oe?=
 =?us-ascii?Q?9gXj+ybLbZyvFBWXvAPXNLZI3ZB6miKTNS6gmGIPzwQaP0PGLdWnOCGjQ0JT?=
 =?us-ascii?Q?7GwrOqzehTm7gdV6+iC2asaMsQ9XO3PtFwm+Oh5TtOjxJbF/NHzzicutJNAI?=
 =?us-ascii?Q?gg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc623e1-8d3d-4e98-a7c6-08dd585bf65c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2025 00:56:55.4968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j2ZZVKIvs6j+WkeUbA+m6b54dUgzwpRfAvZrzFok4AIfpSbeIWxQmmXKhmCj/B641itxT7C3VH1VkeQrMu4jgedpooqnR0eMsviKovuLwKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4519

Hi Sakari,

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Friday, February 28, 2025 5:19 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> I30718 <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH V6 1/3] media: i2c: imx334: Optimized 4k and 2k mode
> register arrays
>=20
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> Hi Shravan,
>=20
> On Fri, Feb 28, 2025 at 04:03:30PM +0530, shravan kumar wrote:
> > From: Shravan Chippa <shravan.chippa@microchip.com>
> >
> > Optimized the resolution arrays by integrating a common register array.
> >
> > Adjusted the register array values for 1920x1080@30 and 3840x2160@30
> > resolutions to align with the common register array values.
> >
> > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > ---
> >  drivers/media/i2c/imx334.c | 132
> > +++++++++----------------------------
> >  1 file changed, 31 insertions(+), 101 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > index a544fc3df39c..a800f2203592 100644
> > --- a/drivers/media/i2c/imx334.c
> > +++ b/drivers/media/i2c/imx334.c
> > @@ -167,8 +167,8 @@ static const s64 link_freq[] =3D {
> >       IMX334_LINK_FREQ_445M,
> >  };
> >
> > -/* Sensor mode registers for 1920x1080@30fps */ -static const struct
> > imx334_reg mode_1920x1080_regs[] =3D {
> > +/* Sensor common mode registers values */ static const struct
> > +imx334_reg common_mode_regs[] =3D {
> >       {0x3000, 0x01},
> >       {0x3018, 0x04},
> >       {0x3030, 0xca},
> > @@ -176,26 +176,10 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x3032, 0x00},
> >       {0x3034, 0x4c},
> >       {0x3035, 0x04},
> > -     {0x302c, 0xf0},
> > -     {0x302d, 0x03},
> > -     {0x302e, 0x80},
> > -     {0x302f, 0x07},
> > -     {0x3074, 0xcc},
> > -     {0x3075, 0x02},
> > -     {0x308e, 0xcd},
> > -     {0x308f, 0x02},
> > -     {0x3076, 0x38},
> > -     {0x3077, 0x04},
> > -     {0x3090, 0x38},
> > -     {0x3091, 0x04},
> > -     {0x3308, 0x38},
> > -     {0x3309, 0x04},
> > -     {0x30C6, 0x00},
> > +     {0x30c6, 0x00},
> >       {0x30c7, 0x00},
> >       {0x30ce, 0x00},
> >       {0x30cf, 0x00},
> > -     {0x30d8, 0x18},
> > -     {0x30d9, 0x0a},
> >       {0x304c, 0x00},
> >       {0x304e, 0x00},
> >       {0x304f, 0x00},
> > @@ -210,7 +194,7 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x300d, 0x29},
> >       {0x314c, 0x29},
> >       {0x314d, 0x01},
> > -     {0x315a, 0x06},
> > +     {0x315a, 0x0a},
>=20
> We still have this change in the patch that's just supposed to move regis=
ter
> address/value pairs around. :-( Please check the changes yourself before
> posting v7.

Do I need to split the patch or drop this change ? in v7

Thanks,
Shravan

>=20
> >       {0x3168, 0xa0},
> >       {0x316a, 0x7e},
> >       {0x319e, 0x02},
> > @@ -330,24 +314,32 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x3002, 0x00},
> >  };
> >
> > +/* Sensor mode registers for 1920x1080@30fps */ static const struct
> > +imx334_reg mode_1920x1080_regs[] =3D {
> > +     {0x302c, 0xf0},
> > +     {0x302d, 0x03},
> > +     {0x302e, 0x80},
> > +     {0x302f, 0x07},
> > +     {0x3074, 0xcc},
> > +     {0x3075, 0x02},
> > +     {0x308e, 0xcd},
> > +     {0x308f, 0x02},
> > +     {0x3076, 0x38},
> > +     {0x3077, 0x04},
> > +     {0x3090, 0x38},
> > +     {0x3091, 0x04},
> > +     {0x3308, 0x38},
> > +     {0x3309, 0x04},
> > +     {0x30d8, 0x18},
> > +     {0x30d9, 0x0a},
> > +};
> > +
> >  /* Sensor mode registers for 3840x2160@30fps */  static const struct
> > imx334_reg mode_3840x2160_regs[] =3D {
> > -     {0x3000, 0x01},
> > -     {0x3002, 0x00},
> > -     {0x3018, 0x04},
> > -     {0x37b0, 0x36},
> > -     {0x304c, 0x00},
> > -     {0x300c, 0x3b},
> >       {0x300d, 0x2a},
> >       {0x3034, 0x26},
> >       {0x3035, 0x02},
> > -     {0x314c, 0x29},
> > -     {0x314d, 0x01},
> >       {0x315a, 0x02},
> > -     {0x3168, 0xa0},
> > -     {0x316a, 0x7e},
> > -     {0x3288, 0x21},
> > -     {0x328a, 0x02},
> >       {0x302c, 0x3c},
> >       {0x302d, 0x00},
> >       {0x302e, 0x00},
> > @@ -356,82 +348,13 @@ static const struct imx334_reg
> mode_3840x2160_regs[] =3D {
> >       {0x3077, 0x08},
> >       {0x3090, 0x70},
> >       {0x3091, 0x08},
> > -     {0x30d8, 0x20},
> > -     {0x30d9, 0x12},
> >       {0x3308, 0x70},
> >       {0x3309, 0x08},
> > -     {0x3414, 0x05},
> > -     {0x3416, 0x18},
> > -     {0x35ac, 0x0e},
> > -     {0x3648, 0x01},
> > -     {0x364a, 0x04},
> > -     {0x364c, 0x04},
> > -     {0x3678, 0x01},
> > -     {0x367c, 0x31},
> > -     {0x367e, 0x31},
> > -     {0x3708, 0x02},
> > -     {0x3714, 0x01},
> > -     {0x3715, 0x02},
> > -     {0x3716, 0x02},
> > -     {0x3717, 0x02},
> > -     {0x371c, 0x3d},
> > -     {0x371d, 0x3f},
> > -     {0x372c, 0x00},
> > -     {0x372d, 0x00},
> > -     {0x372e, 0x46},
> > -     {0x372f, 0x00},
> > -     {0x3730, 0x89},
> > -     {0x3731, 0x00},
> > -     {0x3732, 0x08},
> > -     {0x3733, 0x01},
> > -     {0x3734, 0xfe},
> > -     {0x3735, 0x05},
> > -     {0x375d, 0x00},
> > -     {0x375e, 0x00},
> > -     {0x375f, 0x61},
> > -     {0x3760, 0x06},
> > -     {0x3768, 0x1b},
> > -     {0x3769, 0x1b},
> > -     {0x376a, 0x1a},
> > -     {0x376b, 0x19},
> > -     {0x376c, 0x18},
> > -     {0x376d, 0x14},
> > -     {0x376e, 0x0f},
> > -     {0x3776, 0x00},
> > -     {0x3777, 0x00},
> > -     {0x3778, 0x46},
> > -     {0x3779, 0x00},
> > -     {0x377a, 0x08},
> > -     {0x377b, 0x01},
> > -     {0x377c, 0x45},
> > -     {0x377d, 0x01},
> > -     {0x377e, 0x23},
> > -     {0x377f, 0x02},
> > -     {0x3780, 0xd9},
> > -     {0x3781, 0x03},
> > -     {0x3782, 0xf5},
> > -     {0x3783, 0x06},
> > -     {0x3784, 0xa5},
> > -     {0x3788, 0x0f},
> > -     {0x378a, 0xd9},
> > -     {0x378b, 0x03},
> > -     {0x378c, 0xeb},
> > -     {0x378d, 0x05},
> > -     {0x378e, 0x87},
> > -     {0x378f, 0x06},
> > -     {0x3790, 0xf5},
> > -     {0x3792, 0x43},
> > -     {0x3794, 0x7a},
> > -     {0x3796, 0xa1},
> > -     {0x3e04, 0x0e},
> >       {0x319e, 0x00},
> >       {0x3a00, 0x01},
> >       {0x3a18, 0xbf},
> > -     {0x3a19, 0x00},
> >       {0x3a1a, 0x67},
> > -     {0x3a1b, 0x00},
> >       {0x3a1c, 0x6f},
> > -     {0x3a1d, 0x00},
> >       {0x3a1e, 0xd7},
> >       {0x3a1f, 0x01},
> >       {0x3a20, 0x6f},
> > @@ -989,6 +912,13 @@ static int imx334_start_streaming(struct imx334
> *imx334)
> >       const struct imx334_reg_list *reg_list;
> >       int ret;
> >
> > +     ret =3D imx334_write_regs(imx334, common_mode_regs,
> > +                             ARRAY_SIZE(common_mode_regs));
> > +     if (ret) {
> > +             dev_err(imx334->dev, "fail to write common registers");
> > +             return ret;
> > +     }
> > +
> >       /* Write sensor mode registers */
> >       reg_list =3D &imx334->cur_mode->reg_list;
> >       ret =3D imx334_write_regs(imx334, reg_list->regs,
>=20
> --
> Regards,
>=20
> Sakari Ailus

