Return-Path: <linux-media+bounces-38519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE42AB13444
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 07:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1625163B1C
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 05:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B20121D5B5;
	Mon, 28 Jul 2025 05:45:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020115.outbound.protection.outlook.com [52.101.225.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A92A63CF;
	Mon, 28 Jul 2025 05:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753681543; cv=fail; b=XeFBJ9gKqeHRfHrmYTKscoQ9MTivG+J5irrxUcCYgKuvOc/Q5RnG9Kh1Vp6/9qsnv4zEmhA0RRlHYhp4wyl4pfpvCYtmVT0LPB0pibOvFJWv0Nmq1ijBr1bXGpXRmWTiHTp0gbS9tovq6kfXB9rpliE5XNYsYyGJgdjQx+9f3zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753681543; c=relaxed/simple;
	bh=MI0GIimb+q20a39sg7WJWP7XNyxObIpDkZuGjDOXyGM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WlrgqZEXzPh2MxMsFwoiiW3Xbp/f4MlxFCwerXt6oM7bOvgMGj55jseZPJ+Aa5X3DXiLYn8Oi9pLwV9d2IYlmxwCSVOqhYh8SCBDqjWdYGEVqqK6CVKJczQ77JABKZVNfYuYngbIbDQ1wi1RDzCZa8aorg8TCXKv7GEUV16FlIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLXJ+08GOEzrrNrZwRVTkxRHWEiS2yz5OJiswLKjV93GZUgYPW+UvK5eG7Vj8o4GHNqQnOpvT/8s+ujdpzbXEJq0DzysMoXMlpFYmQICjdmZrtW6pksfbeel8LSg/u1vrnPK4DVdQLIwfqGWcQpwjlfO/j/Q3gSkgtL+ANFBKHgCMCr5G7xVkO2rPu09iwpBcHDzNQHL18YE5BxAl6YLAxBSQEvG2y0zc2sf0j7c1SS+Q0Wz2V0H0cqhk5VlU7xukO3/atnFHllnB1iQW8BO/YQrRwqHzvt0G/gDF+FiOZ575NXBZvCM3GI4zY1bYrxCF5iMTo2DQC1B0PzPZdolwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MI0GIimb+q20a39sg7WJWP7XNyxObIpDkZuGjDOXyGM=;
 b=wPPvhmZGVqEu220oBjBbELp8Hn1LwgKHIj0iCX8pJxhJeDGogQSwTTHdKJwaAUcNtU4mYDKqV9carx0f2bMgDmy8SXB/kXmTEi/UYIA2gUwz422eOFTRdWqqWwSwMKst/zBjAU1B93tGFZA4nczaXdaNRQ6WBs56/BV4O1qgxRd34nkufnFiGEF5zBsGqlizHrME9DID0VMtUp793pmVBGhUpz+rNnVJx4MzN2CJnMnZaVgQ4KnPrf205xeB8ylNuFbPofSp5ZuEeXzWe5gBMG4/3ZaE2jkWQoX8L5NUHmX7K+EQyNVPrBoThbRQI9mGW1IJ0CoSzKm/DLaw0QSbCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAXP287MB4373.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:160::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 05:45:35 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 05:45:34 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans de Goede <hansg@kernel.org>, James
 Cowgill <james.cowgill@blaize.com>, Yunke Cao <yunkec@google.com>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] media: Add devm-managed helper functions for media
 and V4L2 subsystems
Thread-Topic: [PATCH 0/4] media: Add devm-managed helper functions for media
 and V4L2 subsystems
Thread-Index: AQHb+7wspgWenQXG40WzeExCZRMFgLQ/qp4AgAASociABne5AIAA1j7h
Date: Mon, 28 Jul 2025 05:45:34 +0000
Message-ID:
 <PN3P287MB18294EA63E7247DAF00642FC8B5AA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250723102515.64585-1-tarang.raval@siliconsignals.io>
 <20250723125520.GB6719@pendragon.ideasonboard.com>
 <PN3P287MB1829D71FB3C2B41FF28D6A198B5FA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <aIZYRJQNaNTXE3Cm@kekkonen.localdomain>
In-Reply-To: <aIZYRJQNaNTXE3Cm@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAXP287MB4373:EE_
x-ms-office365-filtering-correlation-id: 60de4403-aba2-457e-be76-08ddcd99f906
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?Il5+/MYfqnJ1hR87X4A2cKpq58ihVqy8LqUjQywK5jnmh4a8n8njfYyw?=
 =?Windows-1252?Q?AASsQaHeGXPPyNwDvMoJtHXZ0eSYZWXvFGnte+un42dZDfwutwGYhCA9?=
 =?Windows-1252?Q?xFj2ombjpVPyZ8qWMr1R3ZRaOjinMB5qLjN8V/oI4JdN4Shd6C3R2WXl?=
 =?Windows-1252?Q?TivaON1xSmi35pD9DyX8RJO06Q1XYJ2t/IDXGqHl+KiLxNSE8sy4bp3G?=
 =?Windows-1252?Q?INr+sf8DjvxwWr+j3EvnK/QGonKYf2Q/FPQTkko2C0XqmpHVBlzruSFj?=
 =?Windows-1252?Q?tbxDJGF9IRzhlUs6NJ3Zx0/215Gl60ONPiFL0XaEldVq9pWArRub1Ryb?=
 =?Windows-1252?Q?aamKl1LOeWBZltZ+NEshBLcG0O7RoBGeMMPEHzJ3I9CCpng3fddCNZZa?=
 =?Windows-1252?Q?Pwqr3p6j7jRYPjTXfa16WJMjEvzjIpNaBXpwPkqiZo90PIetKGcvL/pK?=
 =?Windows-1252?Q?VrqowB3+VbVQtnLF/ykFLw+citNPFacC9NUkf35Ku6zM5kK3FeyowfSY?=
 =?Windows-1252?Q?Lsr41rYK4rNd4/QutcOOyTGOW4ZHrHTZ1SRYWrJK0kuzKbqXB5x5MrEa?=
 =?Windows-1252?Q?FCV6KiDLBVpxKtOk94YZcTkLFUd80LuiPNKw2RfmKAxG33rtRqifRVxJ?=
 =?Windows-1252?Q?TK4v4XPbQOufeKPhsvizN5EA85Aly+wCFXDxoPy4rXxlcueJ5yY2hTva?=
 =?Windows-1252?Q?wIGZghSUTulyfwbwFZIsMI/evLJUcdSrPA3+gHaVwFkyfo2xKqzgEO2N?=
 =?Windows-1252?Q?5Nx2AyoTa1GuF67lvHcdkM07mh1Q8QQj3sQzkF3tjYVKmnpUWvHV+vix?=
 =?Windows-1252?Q?fm0NUFFq8t86dSpvWXq798u13L21mCZ7tqn1PaQmh1LVxK1VjNkUgCDg?=
 =?Windows-1252?Q?A/izesAJA8DmMzuUq5cbUABj3AIoRHqq6fBEY6QK+579RtKF9PHu+B5y?=
 =?Windows-1252?Q?qGeyqdeuRWFmwLyZKYGWiQH6lz4joX8vfsK+T+F8xC2eYQC5nCInd7sB?=
 =?Windows-1252?Q?RGD82uFjQa2H95Y7suhXGFFe8huYm8NfbzUVINpQGkUXWhnuk7P4dhJ+?=
 =?Windows-1252?Q?onHBjTypFukB2HzT61+oda2X015YSkpa/GWyOEscGM7pP6XogNiTVHof?=
 =?Windows-1252?Q?SHQt+y5CHI09FtlS5zA7q5NSKsvHG4mP9WDJkNdOzGGOiaBWdzWDaawA?=
 =?Windows-1252?Q?IOu42YzSkBidwPpTdnpmYabU0XVETxhmIfFIDryeCd8J8N/CFIunQuHw?=
 =?Windows-1252?Q?SZfbavvqsbo3mdlq1muBkgOSrv1x1OZTaCF5r1qYfMRHj/Z2w4ovjYpE?=
 =?Windows-1252?Q?Tit0NV+Dx/MJdgtBTQXO4nygV/pcV/J5qYRwr7q4QzI4MHDUUJ798yzy?=
 =?Windows-1252?Q?as8bWaBISh844TlWHBC5KfCXxsfqWYpLvjBwBeZwuiL59cxfo9pDdsdV?=
 =?Windows-1252?Q?qPa/xWet9KNbInsTtZOLmDhsRoCTt1e10xmuG4KZ+9oQYdpUk9L/3vJ/?=
 =?Windows-1252?Q?oZITvK25+VJ2kgjZohBzm/6JaXUbu6cDuW1sR5Zk9CWOSkICTyQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?VuIEBFBc29ENUalAgD0zOFkaclLrxUFor9w1YmBGGOkFOBvIony4J9dX?=
 =?Windows-1252?Q?sPXz54gSfBCsRSHRQ+u/MJviGIJhpBEPd6ISZhUsFQFtg00jIf3HkNpP?=
 =?Windows-1252?Q?o05Pv2+eg915rUoq7DLd5Rg6O8r7YqCMHV6SRkMWAChpD5cMjHOrCQrX?=
 =?Windows-1252?Q?AnRx+KeqpRnc5BGiRKbBV+R+oVlIvslLYFpF3+KsxWpFT6VFlFKI4Mt0?=
 =?Windows-1252?Q?9uwwm3APNwDIFOB56HiAGob6fOPJX+cfXbg6tkVlOMNkAdqX0ZpH2+r7?=
 =?Windows-1252?Q?qNBhNnk09n1aM0JUrgZWM3ULkez9tVJNWqSfw/BVlVUaWKcsPi9U0Cuu?=
 =?Windows-1252?Q?Xjrtk1KW3V0iTodMJQn+Qp+RH1y8A5W5ABavud3uW10wYzmFHyqWkgUM?=
 =?Windows-1252?Q?q9fpOZaZ2kFBtsW3cHTCYBTzJf+cALKLh6sf1DK5qnpRmE7JsjW5y+lB?=
 =?Windows-1252?Q?Kbbo2YWkflavTRLF6USoFCcj2CKPqhEVG1sftv6xkNTFDUdoIR5C0HPz?=
 =?Windows-1252?Q?jCV8Cxil7EYrATxarkbzrzJlhSMSTD4I81OD1wV7HbzG7c+ufombovD8?=
 =?Windows-1252?Q?H0wH64G3ith+mJUv9ZiTI2lVWaNgg2KuVBuqbScVx1ggUg6Y3LUBCZqi?=
 =?Windows-1252?Q?yCzPYLmua7qWkhBrjy8I01pn8CIand6DFvThKah4Ys1hvI7LgXklnA4/?=
 =?Windows-1252?Q?xtxEMxvbxlBd47pV/r9OFlYTmetWZCBoQci773t2JpdKmy7y1wWwE2m4?=
 =?Windows-1252?Q?YdrCtal5VzjfelJUwM1S6vJWmzYCubmaSfL6XCSkjDs2LiAMjzmUUHbW?=
 =?Windows-1252?Q?IzaTLeHvAwNLv77ZG3fdRr8qkKUqYOjdpSPsHW19N1ANheBcjbVGZfBM?=
 =?Windows-1252?Q?f40+ndbg82v5OyrxY1+vi0dFuOIT5d3uXXQLqYvqUqaH3kKhgg2VcghG?=
 =?Windows-1252?Q?m8yAEonm9rW7ECckgKXMS4uDt2ZHX3c4J3i7n8ehkokUwOVKrIqI1gh+?=
 =?Windows-1252?Q?tNk26Cos8KeKuKzYjShY5wVr+Ba3uH2ZF6P8hza9fUm1FWilihdrN+Lp?=
 =?Windows-1252?Q?9nDCNlkszriZvlhdY2gr515AIE9H3neb9vbtXTUy2durVP5ewuT/+8qD?=
 =?Windows-1252?Q?pLd/d3Zo0nFu0qCbPrIKp3PGAx9eCEVrAAtufnHwdqJZQt+nxIP5wi48?=
 =?Windows-1252?Q?FL8dqJySJjV8EzDp+y01sojU6IERV/bsD/KJbxr5xD4Z3pRR6PgA/cve?=
 =?Windows-1252?Q?3bgoefp08Qsjja/m3AKwZl22idnvVarbUdyG0CQExMRnhTPXMp40zpqf?=
 =?Windows-1252?Q?vNjAcFpxmI5cQVLBOi969Xlo0A/i4yqHg/zR/rgaXUXBjxtX9c2puSVW?=
 =?Windows-1252?Q?Oa5ndY0eOj0ncGO/gjYOSe7SD2i44XDY8efr1pJ1RQoVhCFbzV/fnc0/?=
 =?Windows-1252?Q?QMzDHcuw2Br+WSkNGlfoHd69q7vy4G07JX5PzxiRIoQhWV995ehXc+Nt?=
 =?Windows-1252?Q?BN+LV4h1D5GjVMobacpBixm9N1HUxBvDAcraH/upxlJcyLXV6JjnfHWg?=
 =?Windows-1252?Q?t20rxafgVm3OaW9wPYzMlY/LPPhLv1syDmzL4KEM0kV7LOBfLc/PdBH9?=
 =?Windows-1252?Q?7KO8oEAgyoNUoWhFJ8NNbvBbVm1xnuKevc1grYeFj1nSWvwgI/U786ct?=
 =?Windows-1252?Q?ExeAbnP4aqI94qizJtDIGVP0KY4rGB3X?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 60de4403-aba2-457e-be76-08ddcd99f906
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 05:45:34.7629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X0M1hzKQ1FLFqom0mf9UpQokyyrSebyxis6An4XQRHuNJqejZwyUtQ5Uq/JC6vWfsDX7IhWbGS4cgxGcXM9JuwSXjZqo7CdLc6rRKUJeCH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXP287MB4373

> On Wed, Jul 23, 2025 at 02:08:03PM +0000, Tarang Raval wrote:=0A=
> > Hi Laurent,=0A=
> >=0A=
> > > On Wed, Jul 23, 2025 at 03:55:04PM +0530, Tarang Raval wrote:=0A=
> > > > This patch series introduces devm-managed versions of several commo=
nly used=0A=
> > > > media and V4L2 initialization functions. These helpers simplify res=
ource=0A=
> > > > management by leveraging the devres infrastructure, ensuring automa=
tic=0A=
> > > > cleanup when the associated device is detached or the driver is unl=
oaded.=0A=
> > >=A0=0A=
> > > I'll let Sakari review this, but overall, I don't think we want to ta=
ke=0A=
> > > this direction. Objects need to be refcounted instead of freed at rem=
ove=0A=
> > > time.=0A=
> >=0A=
> > I agree that refcounting could provide more robust lifetime management,=
=0A=
> > especially for shared resources. I will think in this direction, explor=
e=0A=
> > implementing refcounting for these objects, and share an RFC for your=
=0A=
> > feedback.=0A=
> =0A=
> I agree with Laurent here when it comes to the current state of the=0A=
> patches.=0A=
> =0A=
> Tearing down things automatically, however, is what we should look into.=
=0A=
> But I believe it will require refcounting sub-devices first, then we coul=
d=0A=
> bind such resources to them. But before this, we'll need to merge the med=
ia=0A=
> device refcounting series=0A=
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=3Dmedia-ref>.=
=0A=
=0A=
Okay, I will wait for this series to be merged.=0A=
=0A=
Thanks for the reference, I will go through these patches and follow the =
=0A=
progress.=0A=
=0A=
> > > This patch series doesn't necessarily cause a regression as such,=0A=
> > > but it will make it more difficult to fix life time management issues=
 in=0A=
> > > V4L2.=0A=
> >=0A=
> > Could you clarify how devm-managed helpers might complicate lifetime=0A=
> > management in V4L2? Understanding specific issues will help me design=
=0A=
> > a solution that aligns with the subsystem=92s needs while keeping clean=
up=0A=
> > simple.=0A=
> =0A=
> The problem with devm_*() and UAPI is that once the device disappears, so=
=0A=
> disappear all its resources, including those being used by whatever=0A=
> programs accessing the UAPI, leading to memory safety issues. IOW devm_()=
=0A=
> when used on memory resources in V4L2 is often simply wrong but right now=
=0A=
> we don't have yet any better options in a lot of cases.=0A=
=0A=
Understood. Thanks for the clarification.=0A=
=0A=
Best Regards,=0A=
Tarang=

