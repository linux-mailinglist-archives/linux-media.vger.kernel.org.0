Return-Path: <linux-media+bounces-66336-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mm3DMIpIRmruNgsAu9opvQ
	(envelope-from <linux-media+bounces-66336-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:16:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCB16F689F
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 13:16:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=LzHe26DO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66336-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66336-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA8E031AF949
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 10:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37633AD522;
	Thu,  2 Jul 2026 10:45:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020143.outbound.protection.outlook.com [52.101.227.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21212E8B82;
	Thu,  2 Jul 2026 10:45:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782989140; cv=fail; b=sVf3QHzbrQzIZnzQ49J5mb1TRFUMzWY3x+StDYJ8wxzg+P0f4YaOZMiQypuks50tPBvJODlr8wmpvtNsFDOMPXgZBDI3YJZt5zwT+T1JmYltRZW37sMypu7LGxezN9tAIzGLRguWJdu+/+s4jHEqo9TuCYVtSZaHof1lqxN5woU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782989140; c=relaxed/simple;
	bh=mqpbLgRoBB2dqs5PpO6TFwEe+YoKPUJNmrmim+oQ+oM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nnQozrtd8zveyzeZThBD7PDXgka8d0aCvYQS+VGkGI+5Cp88D+Iz0LX15wr36iajZRV5pzdLHYzSj64bZirsF8nOlDOGx4ELaG1XtSy31mSnTaod/MKspFdW6Xx1LokgMLac6i+z7+58lp0Uf4GPJp/KKTjFH07ZoZQuksC3AR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=LzHe26DO reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.143
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsSwY8L7yl2MqiUho6PvpgJbHvc7QmvsnTPQtnQIz1Cwnww48UQQ+a7L+gui+Fi47/2yIEOgtMR3QheAo2YI9BhNqH+YoGiT+Y8Q+AAJDp7FSgGoMtTbZoWIT1cU8x/DIqjIb3KNOyw3U3Lnk7jci2Va75jZ8n7Hwx5hbOdT9VcirJZqm/fz4Bg3Nv29Yz2cl3doQMrqfxE50LhwJZwOEhrE5+o86x8qkGz1xyyzYaE9r8kIO7HAm7/lNWYmtUGIO46wp06sUIRG7OvGzv0fvG+3kavulEJCEIUf+KAxzNmqvSVH4GcIxMly932wTerBbzag0m13NBVZdwSTqcCMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMMjCtDQl1T14Ccnrj91b0troTVu5pqCRQcv1WG53uA=;
 b=G3je3Bbh2XdFoDXtnmU95QNr3sn+mF8b9KmtL0la5PNUasmz4NORmb01r52Zb5W8e+SSL4xKJfFV2kKSQRvwfqAhz7hIo1pa9DkJlaR5UbtxrfqcC2yABuLcTPJGBZB0GWNFEvC7bXPBckz7K5SjGshXWVZ4jhhDCCDaZya0xkG8eFFbioN02OB4Yla/HrM5pvvyqBt9c2UOum4J+7NqwU0WAvs5D+80Itiq+x1NBpt6xaMkVXkGI9Uvue/+SrfNK3O7lEA+MqhAppcoGY8q5/9Vda9Ww/RL6b0agxL5LU7Ji0r8KjXqevHIj3R0TbPbEWDRvpXKsboa7CuD69zOkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMMjCtDQl1T14Ccnrj91b0troTVu5pqCRQcv1WG53uA=;
 b=LzHe26DOzazHHjJ5OtJ/rjTLMLHwMlecUUF7Q66c7Hk/TaF3sowFiH11VLIpHlhFzG+JSSsR3ebaxaCxbrWIOpZgZEOrQ2TIiYpjfmklOkNsv0s6cfkYQ4WjSRFsWPvUHtxFgmaurp6tybzyHs/98Q6hECxfrZLr1r00SwY8Wd7bO9wfwQSiHO3YbarRNbAYpL31bwMJBD1gBDF9fN5x7rB+RfOhFYCQ5y8Igi57ypcXo2IUeb+RJdkfAvDHSow/nl2fuWu9CK11CTvkyTUOviBZfaliwWC7BFJnjshLzsEoVy9iyfRwHYl2txsdKomOW9TOe06qt//+Md5aa/no2w==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB2119.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 10:45:33 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 10:45:33 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Vladimir
 Zapolskiy <vladimir.zapolskiy@linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/15] media: i2c: os05b10: Add test pattern options
Thread-Topic: [PATCH v2 07/15] media: i2c: os05b10: Add test pattern options
Thread-Index: AQHcvE0z/alHZT3f5EuW7NwwyUD/vLZagTKAgAAk1XI=
Date: Thu, 2 Jul 2026 10:45:33 +0000
Message-ID:
 <PN3P287MB18296883079E5ABE60A0751C8BF52@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-8-tarang.raval@siliconsignals.io>
 <akYgPq1G9DzhCK_E@mdjait-mobl>
In-Reply-To: <akYgPq1G9DzhCK_E@mdjait-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN0P287MB2119:EE_
x-ms-office365-filtering-correlation-id: 6cde847e-fbf2-4abb-48a0-08ded8270af5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 AGhRPW3EUCcPhN27CbM/6RAD+8ndRsGcS41OB/cgDFcjkdopnl+0uiVeYWkFrn9Yk4rk+mIMl6QTo2AzTpJ4v92OLrZR1KUhika2pPhm7jo5P7xpYDP4xpgM+Uy9fhur0EhOHD73qV3RN66/6Z7Sf3f3LeHwbCfD3VJgRpbI5H/QcTxIsVe2+GI6X2mIrl3J8fwQ2HMuN9aA5jzFK5/unShshLK7/DkU6A4wRbMwu83SdE2K7QKzLoYz0nFU76DZSJ+g7ocqzN7qd9ZXah+NKk/nrREw1v57HAQ4mWodCP3fZM52nMxNI8PWkChcFTge+q8zP8rVjD+PF4FdMAgp1K9R3laXqol5ahWp5sBMCPX/kKb/9pnFC2LlfT2aTWHl7JsOEM+wSkf7T2hOaCcKYdoRnRBAQqH+e2t+ABYTQunIT2UtUNzFuh9vjR4sVzu/ro8kNSXl1wPpkSPehOkDrFCMaeADDjVnBKos8L7kOpeLC/gSkBAYW2vfuuh1U7tWy4cvx6OFsp/HDf3472j6MRY8psFR7PywlOCKV2AAU76X/QxbwZdH/1BjVJPrCU840dq1JTzDsG7Jt5CAMEssqUtfGcnQxXJZYlw7IBPr1denSmD/pLaL+rpPcp3l/hvnHsakClSyC2x5FftGX33deEw+ppQoEhHlYj0h+pe4DboPlSbqVbFsGCNJzHPZRYlj1RNeznc6puGcJQr/SNjnYJ2zXkLapSJ3g17CJXeWuic=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nGGN9yV8Zj9v8snw+l0dGwNbBwPqb6CEUf1KZBpQ4nVBDClESzUr6lhc0Q?=
 =?iso-8859-1?Q?4uhOqqmJnCWbMgUFp+lSRTwWcgjviqdQ1vYunU5GJE6HSPaA6xpkKcO6Yo?=
 =?iso-8859-1?Q?SejOfum56/S7DxjcFQ8qPrA5JkwN65Jdv4eP9x1OTDc9sXaLW5bffPiRvd?=
 =?iso-8859-1?Q?HSPsjip5u6AMtKyWV8uq23w6oY/pvLAf8fPxHEhlKWhqFasnYhfImY8Ofa?=
 =?iso-8859-1?Q?z7fdNz0xRv/hVOuxp94tS3YOTgVKd3niOF/MXjuCIcVEADXV3EPfPLqZ12?=
 =?iso-8859-1?Q?vdSuD4OOKAkZB7igLkGe8/81jzuNOBDCgnMV3TgQ4MgrG5+mG9Z/hL0q1l?=
 =?iso-8859-1?Q?mHtOLEQt7wt40zN7/qKwv+bQ0sSK06PQlgbgGQBLJvmXgr6yHlKxffm5tU?=
 =?iso-8859-1?Q?I7GETUZn524QsAK7sifMnnmu8s207/pm3WvNUcnRkbpI4x4DZTtGU9etZf?=
 =?iso-8859-1?Q?IvNc4jsXL69IalqEQgkAUbU081PxuacrzoSOfJ49LDj5hAFmCljc4BjDDe?=
 =?iso-8859-1?Q?PK8rz83MWYIeIUH3AHSxw8g27njm3r+IZx/8XHfvRidWz4+xhkoEI8uMj6?=
 =?iso-8859-1?Q?AqsT/Dr1MYYNSuovuCakak3Vgt1/rppqQIeavvXnBiN6pIV3nhI+zBcF/3?=
 =?iso-8859-1?Q?6xSNp4amjeoIKvc3AcpyiGWiRNjBJNeeyk0Y35JKf088OIFZ65XjfqqXbg?=
 =?iso-8859-1?Q?kF1W5vsQut9ei/gFEDOvf82CnPRMxgCjd0vQ/QAdj7/gT1B/Qb0BECCRoB?=
 =?iso-8859-1?Q?EadDQIqG0iXi1o6wC7KhL27EOALrCtT8LMIJo/CAiGxjUzR+ozpkF4j3WF?=
 =?iso-8859-1?Q?9DxUrB6kfFbV9aJBj2VH9o0lsuioK8l9WiugdtfO5osCF8bRs21MndA7q1?=
 =?iso-8859-1?Q?kz5w0p939VxN0kL2YsrxJUETaQSbMZLhUaCQqD0g8UYP7vofih1E4lvwCi?=
 =?iso-8859-1?Q?6Gwb8PX2Hk65eZk2+Kc5zVGW4nxpulILP2F9siHjfCVFT5hiD8Q0zQREqO?=
 =?iso-8859-1?Q?CtOa6iiWG8nuN2iLo/B2EeKYIKF87bMn172Sf1esWZhKM3Q1uiCYGn1va5?=
 =?iso-8859-1?Q?Xg/Iwpk9RcjqViBkMcVbI/u/SW6TrIrW3v3z1RtLpizC4UaivjLkD9/Vo8?=
 =?iso-8859-1?Q?nO9f50gBz3mVEbrXrBSyoeQNnRydv78e5n6om3idxjjHv+fDKZyxC2CULN?=
 =?iso-8859-1?Q?NVEIqHijszz2Q0/U/VJJJJRKO7FpvvOZcaKLJ3wYn4qGnWXiKT49ZKhuMG?=
 =?iso-8859-1?Q?9KkINy1D9aawItAtQ6Lt6NzKjhT6ajYOyqc9fDY0jYAcMKTNHmo4HUU1Sj?=
 =?iso-8859-1?Q?/tKOAJXtH6YGqMcNKt/fSxvSjbuW7viuZB9lLBHUxLOSK7bAr+6D8+SdUW?=
 =?iso-8859-1?Q?A09RhX1Lh+rscHnZscXLKsb2KA56uzMr20wP0F+Jl5yQRByN0t8mCTXHht?=
 =?iso-8859-1?Q?dhu77Z0GAtu1YV4h0iqgnVcsdGSp1F+6DLaAJci1Ex/6e+qGyXbSDRznUG?=
 =?iso-8859-1?Q?chkGZDIXX+yuOiaOZ7qVuDeQhEeACHbGt/LJMunSKemi5EIT1mf31+fca9?=
 =?iso-8859-1?Q?AjCRiXupL+xXhA/cFw0Ho+LRtfBzi5lV+5Xr8cSAeg5WW/5W5c+Dx75B3T?=
 =?iso-8859-1?Q?BCZBWPXWTANQRS6d5XowFXHoL2FyS30oCTMrCKql0RXYpte5mASsOx8Y0W?=
 =?iso-8859-1?Q?+Fj3Vo7Ig0+An+nMhh5P/A2laqL3VTsFUl6A78edTFBTiFLmxLwsmWizE3?=
 =?iso-8859-1?Q?TslZ3t7mUuSewh7dYqrvx7XpnX2Waatdo29lxexjKrTKM9QgoApLes5png?=
 =?iso-8859-1?Q?whQD1PsfTA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cde847e-fbf2-4abb-48a0-08ded8270af5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 10:45:33.1635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mk6Ge0a4DgxjhcPCJcikkvRak7w9XC0gY+codcghbf+SsXu2NAHQRO5rph0LHhYzlzNbkn1KykestdRuMJg1iKaEMesi1CY9I+VrmqtIGao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB2119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66336-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mehdi.djait@linux.intel.com,m:sakari.ailus@linux.intel.com,m:himanshu.bhavani@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:from_mime,siliconsignals.io:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CCB16F689F

Hi Mehdi,=0A=
=0A=
> On Wed, Mar 25, 2026 at 05:13:53PM +0530, Tarang Raval wrote:=0A=
> > Add V4L2_CID_TEST_PATTERN support with multiple sensor test-pattern mod=
es=0A=
> > and program them via register 0x5080. Drop the fixed 0x5080 setting fro=
m=0A=
> > the common register sequence so the pattern is selected only through th=
e=0A=
> > control.=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> >  drivers/media/i2c/os05b10.c | 55 +++++++++++++++++++++++++++++++++++--=
=0A=
> >  1 file changed, 53 insertions(+), 2 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
> > index bf848eb9ba52..c8de7f5601bf 100644=0A=
> > --- a/drivers/media/i2c/os05b10.c=0A=
> > +++ b/drivers/media/i2c/os05b10.c=0A=
> > @@ -103,6 +103,17 @@=0A=
> >  #define OS05B10_REG_FORMAT2          CCI_REG8(0x3821)=0A=
> >  #define OS05B10_HDR_ENABLE           0x04=0A=
> >=0A=
> > +#define OS05B10_REG_PRE_ISP_20_0     CCI_REG8(0x5080)=0A=
> > +#define OS05B10_DISABLED             0x00=0A=
> > +#define OS05B10_COLOR_BAR_1          0x80=0A=
> > +#define OS05B10_COLOR_BAR_2          0x84=0A=
> > +#define OS05B10_COLOR_BAR_3          0x88=0A=
> > +#define OS05B10_COLOR_BAR_4          0x8c=0A=
> > +#define OS05B10_COLOR_SQUARE         0x82=0A=
> > +#define OS05B10_BW_SQUARE            0x92=0A=
> > +#define OS05B10_TRANSPARENT_EFFECT   0xa0=0A=
> > +#define OS05B10_ROLLING_BAR_EFFECT   0xc0=0A=
> > +=0A=
> >  #define OS05B10_LINK_FREQ_600MHZ     (600 * HZ_PER_MHZ)=0A=
> >=0A=
> >  static const struct v4l2_rect os05b10_native_area =3D {=0A=
> > @@ -396,7 +407,6 @@ static const struct cci_reg_sequence os05b10_common=
_regs[] =3D {=0A=
> >       { CCI_REG8(0x5004), 0x00 },=0A=
> >       { CCI_REG8(0x5005), 0x0e },=0A=
> >       { CCI_REG8(0x5036), 0x00 },=0A=
> > -     { CCI_REG8(0x5080), 0x04 },=0A=
>=0A=
> I suppose not writing 0x04 like before does not change anything ? Maybe=
=0A=
> mention this value in the commit message ?=0A=
=0A=
The previous value (0x04) keeps test_enable (bit 7) cleared, so the sensor=
=0A=
remains in normal operation. It only presets the color_bar_style field,=0A=
which is ignored unless the test pattern is enabled.=0A=
=0A=
> >       { CCI_REG8(0x5082), 0x00 },=0A=
> >       { CCI_REG8(0x5180), 0x00 },=0A=
> >       { CCI_REG8(0x5181), 0x10 },=0A=
> > @@ -514,6 +524,30 @@ static const u32 os05b10_mbus_codes[] =3D {=0A=
> >       MEDIA_BUS_FMT_SBGGR10_1X10,=0A=
> >  };=0A=
> >=0A=
>=0A=
> two nits here:=0A=
>=0A=
> > +static const char * const os05b10_test_pattern_menu[] =3D {=0A=
> > +     "Disabled",=0A=
>=0A=
> Uppercase=0A=
>=0A=
> > +     "colour bar type 1",=0A=
>=0A=
> or lowercase ?=0A=
>=0A=
> > +     "colour bar type 2",=0A=
> > +     "colour bar type 3",=0A=
> > +     "colour bar type 4",=0A=
>=0A=
> so colour=0A=
>=0A=
> > +     "color square",=0A=
>=0A=
> or color ?=0A=
=0A=
Thanks for spotting that.=0A=
=0A=
I'll fix the capitalization and use consistent spelling throughout=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> > +     "black-white square",=0A=
> > +     "transparent effect",=0A=
> > +     "rolling bar effect",=0A=
> > +};=0A=
>=0A=
> --=0A=
> Kind Regards=0A=
> Mehdi Djait=

