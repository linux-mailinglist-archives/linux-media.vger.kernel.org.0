Return-Path: <linux-media+bounces-38436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 951C5B11820
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 07:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 673EF3BE89B
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 05:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841D92459FA;
	Fri, 25 Jul 2025 05:55:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021125.outbound.protection.outlook.com [40.107.57.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC1C3A1DB;
	Fri, 25 Jul 2025 05:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753422936; cv=fail; b=gSgS16GTpiJnzxb8XeBN80l4f25ydhRWZT91oQfzsDHIBist4OqzqcyByqX4VMjWrqXrbqHGE6I0gfUTOGXAWx4/gpNKppOCehkjK5iP1PlxLe0J8B3+4U8POjqrW67OL/MgBb0ODY/WrzpyIa7Vh8vUK9VHaC0asY5pw3HUsP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753422936; c=relaxed/simple;
	bh=iEjMThMQKU49/yxcthXdO6VPra5L2gYR407bUT0zTW8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZLfKAuMRtDA9TOnRyL5OpdAQuuFXrMP4pL/aiOEyg+SOtAsfM//SRgjDoslhMP88zNDBkDsGCVvaX02Q5CvhJfdkrbaO9tk5bWrExi8qXCklFOcZH569q1shfrm4zTty3ldmr0D4BUhAsq9aeL3FbgsHs4iq+WHUV/UfvcHDWe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGg/6ToQVFB7Vl5raz2kTFcxhq2oZmYFdNr818HBg6zqAjMA1axf9F/VNZbr/o0RWKs4vmTwSoWa6Eehl+kkngELJgL/fCH7FIycNowFkwNIxPhM2JdbJhw/tKfUJvmnMgbUuLZG1gt4bdZxjFo2EhIMVTV0dEdMcVEH1Zy3CZ5DWCeHGoqSHmcpkSypVS3uetcXbtPAMEOu2Gehqn1NRvH9O3Q9dSzcC8SO5UUh6rcRH51l9leF+xUM36Juvr4ii8n8rMLj0e+xyCk/Md1bH3Nd7dMEZBkgwgcm2wWVJF28TiPoVZbXNVXeUwUx7LZ692jh2SaxUMfCnh66J3a07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8PnOG/6N4K/TUIElKY2xiSFMKP0VwMvvOjDWKgGe+8=;
 b=Gdq5+ZOFcaQuXBfIE3pXBCQjJS0PnYuyRQURgK3hS5PV7KQkqNraa+ule0w7l7usNGllS8c2I2UCcw3vbH4nEt47XQDZj9Cr8U2yfp0zOy/IupPVeG2wVTgmKYOLyNCr6cwoulhT5KrAhsLhi3pxnrcuxenMFOvk/oGja6CEjAFlopQiiQiiC20hwmizASCkEBvbzJicAWqIBBdjzouRoe7lBYPRP0jwnx7ynvv0StI8gWUsw1dmOu2Q2kws6oLVqCeZJATiA/a/R1URbYI6xh/8Ic7chZReRrbqxUrplZi0HLeIgAO98hEaFVuHnD0TdaOfhv4JcAttd78Uw+8Jew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PNYP287MB4056.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:287::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 05:55:24 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 05:55:24 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede <hansg@kernel.org>,
	=?iso-8859-1?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Matthias Fend <matthias.fend@emfend.at>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH v5 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHb/Ih6djfjLciEYkK3gvcBpDSgELRBx44AgACQNVA=
Date: Fri, 25 Jul 2025 05:55:23 +0000
Message-ID:
 <PN3P287MB35190A4AEE4C8D98142E7B6AFF59A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250724104711.18764-1-hardevsinh.palaniya@siliconsignals.io>
 <20250724104711.18764-3-hardevsinh.palaniya@siliconsignals.io>
 <aIKi1BkNzNvsf5Tr@smile.fi.intel.com>
In-Reply-To: <aIKi1BkNzNvsf5Tr@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PNYP287MB4056:EE_
x-ms-office365-filtering-correlation-id: f8e9d4e8-a42d-4a28-2445-08ddcb3fd8f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EgIAiN8mZYPZxZyxdBuHNeOhaBEMhQrrTxqNkYEejZZauzSleZCjrZxQzV?=
 =?iso-8859-1?Q?cXHhG9iEBECgXA6LA6SuhIb4Hn2FaKKqRjiN9iXgIOdTsvn/cAE9AcEu0n?=
 =?iso-8859-1?Q?ORTfTyiR/IuOPGn03W1FL9kOPsBaQ5Dw1kzWp7pRunZp3Tn/0OJCOUND8o?=
 =?iso-8859-1?Q?yMtJcpw4oC0+el6vqLjN/BZ8UG+IAb5LQb3bJfKRCWtf4jbniuZdeUFnhb?=
 =?iso-8859-1?Q?grJgXtnXCQxl2gyLbleXl4KYs34JA2tXNypsurn8h0q1DDCHNg4TTwlX7t?=
 =?iso-8859-1?Q?C6quZGxY0A+yScd893SM8OIFK2XZiW7ZwiAgs5S/bRz0FC/8/vkYmQTqY4?=
 =?iso-8859-1?Q?QM6lziTpZQ7ze6E065L8we82y4lV90Rnveu8WaL8LvRWKOVU4mjhU1p4rw?=
 =?iso-8859-1?Q?Olgg+m7btczYHCEruNg/H6vbfgSAmjb3ZH11rYoVTEeI66GoQmOoN0SK5N?=
 =?iso-8859-1?Q?F3A5/IkcUwVgY16NYuYeShD8dUbAlxG+SG6t6y+rSoxFw7+zsvhoxjfKxq?=
 =?iso-8859-1?Q?55griT4nS08nHyF+Hno8BBbq3JfcKoGV685Ojsor5pwOeLeyKnZ6swf/ID?=
 =?iso-8859-1?Q?3iCTBD1KtwyugBvF7YJQlGM3Akou30PQK/r2GhFStT9ogopByXVexwUdXu?=
 =?iso-8859-1?Q?asvhJjE0isRJHBcZjy/5+pAAyK5MUvmfdVPL0iU4XBbjDG1bXvlY0k8Jnd?=
 =?iso-8859-1?Q?hzq+sH4xDCVN6TYHkPYEz3IlQdkOEAtvXNieJS21ciDMzhGTCTlIOgcbnc?=
 =?iso-8859-1?Q?xyMiN20wVlMAP6Aohy++5dMFIHgIJnO7YXuSwu3+HsqnB3i811/s/xa+v9?=
 =?iso-8859-1?Q?qz43paY4NyUhMGm1QDM3195/E1C1GGFia2WymrGpUA3U7sjoq1vLdO/IpV?=
 =?iso-8859-1?Q?keLwA98b7W9eqq4ZvnkfzSzSEowGH2bKYEKezZRlarnRnvd5AtAjX5VtWF?=
 =?iso-8859-1?Q?ucwSZtUVQvuw1qHEgzyvp3aFKv0IpgQyujlnpqw6yf8GBFoTqp+ZX6Uc23?=
 =?iso-8859-1?Q?QE8glLF0W9Cilf/bBU6IF0N1LIf0hCYYseS9N0NEkbx2aU6jAPeqYFfm9S?=
 =?iso-8859-1?Q?nagsyJLp0ks5xda+WKzuvgBe5Nmqw/TFTgQVGn+63QJPPwOoD0upwybFvx?=
 =?iso-8859-1?Q?peW7c3sfrXlvfxeiZjqXs1RrKMF9GL91kj2SLqaBq0cHIo9knF4cZ+VEMf?=
 =?iso-8859-1?Q?slnZb1ie9CQhdqtCpGo0T6ebrKX3huka0O+BtmmhCsVeXZ+OAqEajAs/iA?=
 =?iso-8859-1?Q?lUGkWhsBqM+Lu9gDGpUkHh3EPhuiV3IU7kTwQrEDjqSM80+GOuvLeRAE+w?=
 =?iso-8859-1?Q?eUm1EDnjDWK2VlHXOkpD/uF7aZRkZDBjeEt6JvG7qg+MhKsvL0Mu+I7ffw?=
 =?iso-8859-1?Q?ESPkMrxksZHnak/DlhAYF+zgUW6mkZmgrQFoYfyeCt091ovCSjs1rm3w5r?=
 =?iso-8859-1?Q?bxi1CBObClErXlhsa0f1BZpVc9sOPkuYt4l90xD6uAQXQMU5dd1TTBgY1x?=
 =?iso-8859-1?Q?3T46/mamfcBGBQRjrs0TIbhHC3T71Zx75hx3Y9xJQV2A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7ujiuk33bMrhmUvMb2oerm9LSbYq1MHA4CY3S6rgjwBPxgeECulSS9XkM/?=
 =?iso-8859-1?Q?9PgfvF2nhaQ/tB6PyPcdVOhCuEnDtJuq6TjgxEOAwu2na76/1yq4foLq2r?=
 =?iso-8859-1?Q?8W94/r79H0Cts3zkiQQ0DcAMPGHuFDsklBb0Mz9/XURaVxISK+qx7RU0a5?=
 =?iso-8859-1?Q?GQO5YzsYH0dzoNKwWMhkuFhTC18naqjBIvPRvqYkif8hufYvGMgiP1XlTg?=
 =?iso-8859-1?Q?7E+l8j+mKwdhR0Eokb2jVkw1ma9Hn3rPwFO2sm+t7VsMPQCDS9K+zKfk4y?=
 =?iso-8859-1?Q?9eP6emdtiIY37lP+/5RsFstsw0OwScN164f8a30MoHxveIOGKsEA//gbKE?=
 =?iso-8859-1?Q?SkLCip8oFTaCbQiB4HRCcNGh0j1JufuKzuN/gmO/2FkfBXmj1doYxOR216?=
 =?iso-8859-1?Q?2oVJvGm/rn4fHF7LDT+znrlg1SCYVBNAbzS/DTBg8F75XqCaEBDby4UPrJ?=
 =?iso-8859-1?Q?EPRT7Y1hqnSqDBi7gFgnACsoS6a8tJrxK1utOY3VsHnlsCq+XQcCVDUead?=
 =?iso-8859-1?Q?BoFicvCyUgcQrF9Q4Pq+WXR4Tw7QCPVXtw8EFxQ6L9E9iw13tf0bwAW0eR?=
 =?iso-8859-1?Q?B97lDaTex88vIkmOTJFwGV9WR8YX6mm4IA5ObTcr5KCn0HyOeoBR0e2XZo?=
 =?iso-8859-1?Q?Ld8Oih56nFUx8Swwve4iUPNaiHCWACoa+cjKjWtqQhuud2bXhw9rWwk0Ns?=
 =?iso-8859-1?Q?L4TjeQNF4UUxblu8QsADMgStNd6tzkUwR6SFVTYTYefyxK9IR2mr2IAO5y?=
 =?iso-8859-1?Q?U91oXHaCcHrBcf+zNKuYBaQZ2h8GeqGDw/jJHI+owSeAhb9mZLKUKuVhpL?=
 =?iso-8859-1?Q?DFgcKOHHIYKySBvFBYhJxqJhfVbNPIAYKVw1NWCMNcYAdlfAY029pcBIZC?=
 =?iso-8859-1?Q?NlUj4Tr20bCN/th1jUaEK8gxt2uTg4Eu+4CXtGhRmtgZH68drj5BSiK91G?=
 =?iso-8859-1?Q?/RWo5H3WHZwVeJeNBfvC+UzjMVcPkkJG1odmsmg31Pf0xPaoGZvgyavdhn?=
 =?iso-8859-1?Q?TJZt65q6PlluXrN2RVnPBFTyf8l8X5tbEiTL2dyov2GOczLH1D6xKxy+io?=
 =?iso-8859-1?Q?FXu9MC+/r1iBZbfymlp/fextpzb5x5WOkIYNrfNU5dlJ29wXAb7D3IKVEy?=
 =?iso-8859-1?Q?E9i1vAGDln5apKcFXeXKC7aPKqO0586zpqBRdX4Xd4Iu/4FtNe3avNnMuy?=
 =?iso-8859-1?Q?6laMBN9snMkVst9ZOfmimnVDSGjR9KIzqLdkVnMvi2ZSaKfV3IMtrukULv?=
 =?iso-8859-1?Q?aEj86mT3iOp8fa6mdm4nar5ONuswPF41EW8p3SQyr/ytK0D1/6DrB0GKYF?=
 =?iso-8859-1?Q?NGR8dOpvIKPsetsZARkzsTHduwCqabiXB2SRWa6qOpk/1ItZqV3Cg/eE7i?=
 =?iso-8859-1?Q?8b2vRIhMJziuQILhbgKZwGG3I+xcjg3l40Kc/HIWY5dUW2YSJQHhSh6moY?=
 =?iso-8859-1?Q?SDH6lzR/aIBf/A0p7cqmTZAFE0+Tyu3ziEG/oCMrwZJve4WSoV6oLVaUKf?=
 =?iso-8859-1?Q?l/CmqEdQskTYaDX3+jqbBdNKV6oVN2gR0dXf1XvvWuxS1OzYGjIUX67QR5?=
 =?iso-8859-1?Q?kd3MKyUwRMCEEstDMw2zhD4cQfsPdltl3fYtYuRPuMQozo15Ck4/uld3zI?=
 =?iso-8859-1?Q?oO55TcryEM2Glyish05WHpW0ZL5J4cBehiC8yo1ipCKLec7RR2AQYCww?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e9d4e8-a42d-4a28-2445-08ddcb3fd8f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 05:55:23.9643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QvTqoksSgmFauOoIVX4DPmlpW72iHTtpJ0p2AN2+V+IbzkwtHOjl51WD44YMNRh1vfh435ClkSTy5dSRz1PPBuOrv3vvREGASc+IOQtBeK66RgS35pHdG6/zbkgj21kY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4056

> On Thu, Jul 24, 2025 at 04:17:05PM +0530, Hardevsinh Palaniya wrote:=0A=
> > Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.=0A=
> >=0A=
> > The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an=0A=
> > active array size of 1920 x 1080.=0A=
> >=0A=
> > The following features are supported:=0A=
> > - Manual exposure an gain control support=0A=
> > - vblank/hblank control support=0A=
> > - Test pattern support control=0A=
> > - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)=0A=
> =0A=
> ...=0A=
> =0A=
> >=A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 =
9 +=0A=
> =0A=
> This should be started as part of patch 1 as in between you will have a=
=0A=
> dangling file, which is not recorded in MAINTAINERS.=0A=
> =0A=
> ...=0A=
> =0A=
> > + * Inspired from ov8858, imx219, imx283 camera drivers=0A=
> =0A=
> Missing period at the end.=0A=
> =0A=
> ...=0A=
> =0A=
> > +#include <linux/array_size.h>=0A=
> =0A=
> + bitops.h=0A=
=0A=
Why??=0A=
 =0A=
> > +#include <linux/clk.h>=0A=
> > +#include <linux/container_of.h>=0A=
> > +#include <linux/delay.h>=0A=
> > +#include <linux/device/devres.h>=0A=
> > +#include <linux/err.h>=0A=
> > +#include <linux/gpio/consumer.h>=0A=
> > +#include <linux/i2c.h>=0A=
> > +#include <linux/module.h>=0A=
> > +#include <linux/mutex.h>=0A=
> > +#include <linux/pm_runtime.h>=0A=
> > +#include <linux/property.h>=0A=
> > +#include <linux/regulator/consumer.h>=0A=
> > +#include <linux/units.h>=0A=
> > +#include <linux/types.h>=0A=
> =0A=
> > +#include <vdso/time64.h>=0A=
> =0A=
> We do not include vdso in the (regular) drivers. Use linux/time.h.=0A=
> =0A=
> ...=0A=
> =0A=
> > +struct ov2735 {=0A=
> > +=A0=A0=A0=A0 struct device *dev;=0A=
> =0A=
> Do you need this? Can't it be derived from regmap cci below?=0A=
=0A=
I prefer keeping the dev pointer directly in the struct for simplicity=0A=
and better readability. Using regmap_get_device(ov2735->cci) adds an =0A=
unnecessary level of indirection, especially since dev is frequently =0A=
used for logging, error handling, and regulator/device tree access. =0A=
I would prefer to retain it. =0A=
=0A=
> > +=A0=A0=A0=A0 struct regmap *cci;=0A=
> > +=A0=A0=A0=A0 struct v4l2_subdev sd;=0A=
> > +=A0=A0=A0=A0 struct media_pad pad;=0A=
> =0A=
> > +=A0=A0=A0=A0 struct i2c_client *client;=0A=
> =0A=
> Do you need this?=0A=
> =0A=
> > +=A0=A0=A0=A0 struct clk *xclk;=0A=
> > +=A0=A0=A0=A0 struct gpio_desc *reset_gpio;=0A=
> > +=A0=A0=A0=A0 struct gpio_desc *enable_gpio;=0A=
> > +=A0=A0=A0=A0 struct regulator_bulk_data supplies[ARRAY_SIZE(ov2735_sup=
ply_name)];=0A=
> > +=0A=
> > +=A0=A0=A0=A0 /* V4L2 Controls */=0A=
> > +=A0=A0=A0=A0 struct v4l2_ctrl_handler handler;=0A=
> > +=A0=A0=A0=A0 struct v4l2_ctrl *link_freq;=0A=
> > +=A0=A0=A0=A0 struct v4l2_ctrl *pixel_rate;=0A=
> > +=A0=A0=A0=A0 struct v4l2_ctrl *hblank;=0A=
> > +=A0=A0=A0=A0 struct v4l2_ctrl *vblank;=0A=
> > +=A0=A0=A0=A0 struct v4l2_ctrl *gain;=0A=
> > +=A0=A0=A0=A0 struct v4l2_ctrl *exposure;=0A=
> > +=A0=A0=A0=A0 struct v4l2_ctrl *test_pattern;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 u32 link_freq_index;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 u8 current_page;=0A=
> > +=A0=A0=A0=A0 struct mutex page_lock;=0A=
> > +};=0A=
> =0A=
> ...=0A=
> =0A=
> > +static int ov2735_page_access(struct ov2735 *ov2735,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 u32 reg, void *val, int *err, bool is_read)=0A=
> > +{=0A=
> > +=A0=A0=A0=A0 u8 page =3D (reg >> CCI_REG_PRIVATE_SHIFT) & 0xff;=0A=
> =0A=
> ' & 0xff' part is redundant.=0A=
> =0A=
> > +=A0=A0=A0=A0 u32 addr =3D reg & ~CCI_REG_PRIVATE_MASK;=0A=
> > +=A0=A0=A0=A0 int ret =3D 0;=0A=
> =0A=
> How is this assignment being used?=0A=
> =0A=
> > +=A0=A0=A0=A0 if (err && *err)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return *err;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 mutex_lock(&ov2735->page_lock);=0A=
> > +=0A=
> > +=A0=A0=A0=A0 /* Perform page access before read/write */=0A=
> > +=A0=A0=A0=A0 if (ov2735->current_page !=3D page) {=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov2735->cci, OV=
2735_REG_PAGE_SELECT, page, err);=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_=
mutex_unlock;=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov2735->current_page =3D page;=0A=
> > +=A0=A0=A0=A0 }=0A=
> > +=0A=
> > +=A0=A0=A0=A0 if (is_read)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_read(ov2735->cci, add=
r, (u64 *)val, err);=0A=
> > +=A0=A0=A0=A0 else=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov2735->cci, ad=
dr, *(u64 *)val, err);=0A=
> =0A=
> Do you really need this castings?=0A=
=0A=
Do you really think this casting is unnecessary?=0A=
=0A=
Please check the definitions of cci_read/write=0A=
=0A=
without this, we can't even build the driver.=0A=
=0A=
> > +=0A=
> > +err_mutex_unlock:=0A=
> > +=A0=A0=A0=A0 mutex_unlock(&ov2735->page_lock);=0A=
> > +=A0=A0=A0=A0 return ret;=0A=
> =0A=
> Hmm... Wouldn't be cleanup.h helpful here?=0A=
>=0A=
> > +}=0A=
> =0A=
> ...=0A=
> =0A=
> > +static int ov2735_write(struct ov2735 *ov2735, u32 reg, u64 val, int *=
err)=0A=
> > +{=0A=
> > +=A0=A0=A0=A0 return ov2735_page_access(ov2735, reg, (void *)&val, err,=
 false);=0A=
> =0A=
> Why casting?=0A=
> =0A=
> > +}=0A=
> =0A=
> ...=0A=
> =0A=
> > +static int ov2735_set_pll_ctrl(struct ov2735 *ov2735)=0A=
> > +{=0A=
> > +=A0=A0=A0=A0 struct ov2735_pll_parameters *pll_parameters;=0A=
> > +=A0=A0=A0=A0 u8 pll_ctrl;=0A=
> > +=A0=A0=A0=A0 u8 pll_outdiv;=0A=
> > +=A0=A0=A0=A0 int ret =3D 0;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 pll_parameters =3D &pll_configs[ov2735->link_freq_index];=
=0A=
> > +=0A=
> > +=A0=A0=A0=A0 /* BIT[7]: pll_clk_sel, BIT[6:2]: pll_nc, BIT[1:0]: pll_m=
c */=0A=
> > +=A0=A0=A0=A0 pll_ctrl =3D ((pll_parameters->pll_nc << 2) |=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (pll_parameters->pll_=
mc << 0)) & OV2735_REG_PLL_ENABLE;=0A=
> =0A=
> Logically better to wrap like this (yes, I know that it's slightly longer=
 than 80):=0A=
> =0A=
> =A0=A0=A0=A0=A0=A0=A0 pll_ctrl =3D ((pll_parameters->pll_nc << 2) | (pll_=
parameters->pll_mc << 0)) &=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OV2735_REG_PLL_ENA=
BLE;=0A=
 =0A=
Will do.=0A=
=0A=
Could you please clarify what you mean by "logically better" in this contex=
t?=0A=
=0A=
> > +=A0=A0=A0=A0 pll_outdiv =3D pll_parameters->pll_outdiv;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 ov2735_write(ov2735, OV2735_REG_PLL_CTRL, pll_ctrl, &ret)=
;=0A=
> =0A=
> > +=A0=A0=A0=A0 ov2735_write(ov2735, OV2735_REG_PLL_OUTDIV, pll_outdiv, &=
ret);=0A=
> > +=0A=
> > +=A0=A0=A0=A0 return ret;=0A=
> > +}=0A=
> =0A=
> ...=0A=
> =0A=
> > +=A0=A0=A0=A0 /* Apply format settings. */=0A=
> =0A=
> > +=A0=A0=A0=A0 /* Apply customized values from user */=0A=
> =0A=
> Define a single style for one-line comments and use it everywhere consist=
ently.=0A=
=0A=
Are you referring to the period at the end of the comment?=0A=
 =0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_power_off;=0A=
> =0A=
> ...=0A=
> =0A=
> > +=A0=A0=A0=A0 devm_pm_runtime_set_active_enabled(ov2735->dev);=0A=
> > +=A0=A0=A0=A0 devm_pm_runtime_get_noresume(ov2735->dev);=0A=
> =0A=
> No error checks? What's the point to use devm and what will happen if the=
 first=0A=
> fails, for example?=0A=
> =0A=
> --=0A=
> With Best Regards,=0A=
> Andy Shevchenko=0A=
=0A=
With all due respect,=0A=
=0A=
I completely understand and appreciate the need for multiple rounds of revi=
ew.=0A=
However, where feasible, it would be helpful to receive style-related and =
=0A=
non-blocking comments earlier in the review process. Iterating on minor iss=
ues=0A=
in later versions, especially ones that could have been addressed together =
=0A=
earlier, can become a bit frustrating at times. I hope you can understand t=
his =0A=
perspective.=0A=
=0A=
Once again, thank you for your time and effort in helping improve the quali=
ty=0A=
of the driver.=0A=
=0A=
Best Regards,=0A=
Hardev    =0A=

