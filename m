Return-Path: <linux-media+bounces-49638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AACECE6B7A
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 13:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3DC3030014CA
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 12:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69433101D4;
	Mon, 29 Dec 2025 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="kmIG1hpO"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021082.outbound.protection.outlook.com [40.107.51.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F452DAFBB;
	Mon, 29 Dec 2025 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767011869; cv=fail; b=qs+zcCl2c/sq5KAD/L/1tpV118aH8pYw+9h4aod+3TtziVSHBNtVfF9N9abz3DTR8C97KwHr9QrK4OPqr7C8Dc12YB9/KWdVlERf7XGh6ExbRkg9IdJI8PstIt5PQJb2AVwxMos+J7O4E674Vf+NkIjq0ewGeJWWJ3EEZkLTj+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767011869; c=relaxed/simple;
	bh=blnWaJeV+gp+jOkrgdAGDd9N2pfekLJ2usB3Q/iOtmc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RHwMMWX4vgXlihjsntA8RDGIqTVkj31WsInLD1cEVmPsQq3SF8uIt+5DjVIgBtlezSsbS+W3o1jay2j3AEvt5dgWqsJi0CMGviCJhE+noTmPpJ9geoAkuyU0U0ZTJXDX/Y1cb8KqAZERsK5OJuQHXVj4/fDOFcmr5RcFYpAdck0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=kmIG1hpO; arc=fail smtp.client-ip=40.107.51.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmYUd7xrtNtX7po8jaBizLb9XDxBzY8Jj3eR/nx4BHXVfifyolw5oNnvOXPsEx9ZwBgs8Ksjq7ZqiNVmMp2VJ8Gud6eVdcO/OJ35WkVHbdBevFteJDiDuadscsLhchM4gGHkICB81pLEwvqBpnlL36ORs+rKhJ0CZwu8ContWNR1sDOwcbjN6pu6hXntDKovm6VhdWT0BJt/kzxKpHkDuGQtfvqe+abnUvxIhLAfRL3OwOsov2Owc0+PXyK7GhG4+w7+bKoXlEdQ3lq7JqY+2hC0EhlbTxBysq84y+p0wMMYI7vg1B3afsvSL/5yupiUsQ52LzT+79iaoWguCoOscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blnWaJeV+gp+jOkrgdAGDd9N2pfekLJ2usB3Q/iOtmc=;
 b=PtPmWvmCsTGwoYZgk//nzA1rW61XSHzFW3MjWnXMhXR3y8LIOqHpymi5Zf2lb1e59d68rz4IH+kYYKI+9veGAbO5LWy1dQAAA+LIKXIckYhJWBE6+kj6ATzGMzMI9BBrWVYmBgzhRRFRBJv7jcWrV2bqAOmyJ7gdk5VUvrujLYQhVwGUixbocJR2ygv5cUtefInuIiIqSZGKZtv1lMAk3Dmdiv7LVxbzvqLWw1kns4ZCN5VunUh8x+Lc08g2LEcUfKxWwdLaQFlxI/15cmZli7/8aTpB7DdiFXcV4wcfLpMFFXAokrOLuoK64lq1STa6FF023YAj3xEbGQgNyT9Ebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blnWaJeV+gp+jOkrgdAGDd9N2pfekLJ2usB3Q/iOtmc=;
 b=kmIG1hpOlkRybCTjf/5tVLANk+eBsKvyx25ulTZb1YtA5qB30CxzrprZ2gPcyvUHAU+vi0ru//0iWOc7pRvzax8MNFDWuYHrxpooxbivLQCoidmscTEXxzvOWDgSZN5w9zlKtER6H2IX7XZ9ZIhYBQYV9il+XZT2U0OZ4DkSqGf9pATKpLBQzH/jqvSrtThPTZdMI6MyvCnIqGdguqkhJbPDsWOEAmPEVPHsl4wHgSbG+8jnMhzHnaH8yWq02qal3dWje2fM4MG1co9iA0ne41CvpmZF0YimAQcnpE4c1mRMY/N21lt0D01WFw9BlwKNAJN/ijDSlhTNqOZNUS2Hwg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB0788.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:146::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 12:37:42 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 12:37:42 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Xiaolei Wang <xiaolei.wang@windriver.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
	"jacopo@jmondi.org" <jacopo@jmondi.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "johannes.goede@oss.qualcomm.com"
	<johannes.goede@oss.qualcomm.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] media: i2c: ov5647: Convert to CCI register access
 helpers
Thread-Topic: [PATCH v2 1/3] media: i2c: ov5647: Convert to CCI register
 access helpers
Thread-Index: AQHceGtVPBdG+t2I+kKz5/UzjeME2LU4iZqA
Date: Mon, 29 Dec 2025 12:37:41 +0000
Message-ID:
 <PN3P287MB18291169FABF1E8A01AA88B88BBFA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
 <20251229023018.2933405-2-xiaolei.wang@windriver.com>
In-Reply-To: <20251229023018.2933405-2-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN0P287MB0788:EE_
x-ms-office365-filtering-correlation-id: c7276f04-7df7-4d79-056f-08de46d70ee8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?58KjBKiBPchuErif7fc5yUYxAb0i0SAp3Zou6rvobcNGHU+LldT9oRjHtC?=
 =?iso-8859-1?Q?6pEBKg+4ukeGlrwfFdfbcc/lHN8QIB+YxE0sY7Vu0izwBTuYz5wDGYxfQS?=
 =?iso-8859-1?Q?K1Xazl4LlPPZrYDO/2JLECdIh511KBTi+k9pO+H99lsdqaoQaJ2Lot17GU?=
 =?iso-8859-1?Q?cva2nA3lJh1+4xshnNYkv91hdlr+fd5jDiJVKii3NqnHGiRvgN2ys1gFp3?=
 =?iso-8859-1?Q?88HSQUqeMbz4j5cm1vpeME0jDxTiS+rROM1+UiirV/uQaYLs/9MMyIi4eC?=
 =?iso-8859-1?Q?1pDPomSs4gSGsdBXQTlquZc0rN9aezYMv04vx5gflTKpLnzRzDRKxTrh3q?=
 =?iso-8859-1?Q?bLrZMV2h6S67khK0Q/PrLM4vIQ3dHN7++Qhgxw50m58mOqoXeAsZedc5ed?=
 =?iso-8859-1?Q?1WWNwZbZ61n0+/5+mMsEIZCJAxupdqLuopY8DkhB7Q9wSrYh5KXVsFvnM9?=
 =?iso-8859-1?Q?C2u7CoAzKldnEuN+CGxnQGefNlmzTZmLyo650xP2BX65KZTvBk/Ydfol4G?=
 =?iso-8859-1?Q?OwaOMlD9jtIsC6eMAtwaZq1x7Ym3uHnNlX/vhtYeEGRWMZ+tc+r6LZ5WNc?=
 =?iso-8859-1?Q?7S2B+idlb3aYtJSML3Lv3AEUHvQ0doYAKtt7Jy55x5CQkjPMeNEDHfN8cz?=
 =?iso-8859-1?Q?/3Vq0+W6h+fC2fRehVCuB3lyf+ym7RnqNGbr5HkJq4GEGV8ZghE/CG68+1?=
 =?iso-8859-1?Q?uPTDEcj7TYO9xn7BfCGaa2w4JCugI+Qt8189pweerlTWJhk4ktXGleNSJp?=
 =?iso-8859-1?Q?xmZf+W/Lg5xjYugGsvFEIxyjmNPW3ZrrJcIRbXBPphN0ad4w5HUqWqembh?=
 =?iso-8859-1?Q?la3eh5Z5DThJ+tOqhZPQmgOt5H51xjuJm3X7un18QVkYCe4bZOLAQqxv6L?=
 =?iso-8859-1?Q?VoJuRJzCXoiv3AHtfSJ4t5vNaK3pwf16mOoIPhKYcATufB93vY+lTLFE05?=
 =?iso-8859-1?Q?8BIddsvH17i4UEKW1mwx1Ka7EUnIiJpB+eMbsRnKlYbWzuhCdOsIzmrPBW?=
 =?iso-8859-1?Q?Pzro5EqKK/JBUpNst82V3OaPHfJyJpvVk8Plf9Fly5UoqFjqSKmVaPaysP?=
 =?iso-8859-1?Q?JFyCwORtEEzGrTwJB2dOcOTQmmtQIdEBEYl2XV8xNoGR07FYC5PguKJXMf?=
 =?iso-8859-1?Q?GCfC1P3FOCl/X/89hmFuJxIeTIcPreXCs07LShKSaEjeA3P8eGCAQ5I0Cs?=
 =?iso-8859-1?Q?FKWmn0n0wvue07TohsEFDv1NI4ur1vCMQmCxbG37DrGdmz25wkCK8ZvC1W?=
 =?iso-8859-1?Q?X1k+gEOvY8oIHN6btOKn4UCCezazIii+Wf6/qLndQI5tA2FyY20oC8Rr9y?=
 =?iso-8859-1?Q?RKTdsgMCPxzhpE/Z2fJet5iLWzKz4th96LrUocFL+uvm3C7+VxKdS6wsWO?=
 =?iso-8859-1?Q?YcECgbVX7+sMbQ/2/Ldugp0AO6VY3xaljD3IocBZIupwUL/aEtC5Xjr9H8?=
 =?iso-8859-1?Q?abjlu45AyIej7OEO3QNzoj/kKogMzpKxlvVffqmNkaKWkyfk1RTzFsTM9U?=
 =?iso-8859-1?Q?yBFOlZKv7N/z5G6CGXISb4GXMm+5MmFppHmprjH1ewYz+6kd1xDX48QIKK?=
 =?iso-8859-1?Q?x+uhvv136EZ0Frd3RUwo++9oqSkHyFYLrBUH5sBPHbkCkqZ0fw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mZOR5rWOaBTdrt6XA7QnQlV2JRDyWISgsTPZca3zkAYQ1LfCeO8At5hMJM?=
 =?iso-8859-1?Q?13ou3LC/NHK2eoPqbAeZjtXLfJ16+yi0flJ0db2Re3SU++GMzC3n0R2Qmf?=
 =?iso-8859-1?Q?10RSbNkMp3lrIQfi2OXeot/1ApsQkcKPjXkO4BeYmU8Fvo0xpVT6yLVXxG?=
 =?iso-8859-1?Q?CYS6vESrkSxp9mawsVcJWVlbqWQnQWn5nRYWL1/JTKjeq0dZllAsK1ueeK?=
 =?iso-8859-1?Q?U6b9Eiwgg/VbaLX2KfC0haSjuVkthaXWYrTQo9rBwvga/fcQkX/hHdd4Fm?=
 =?iso-8859-1?Q?LEJWpgAEG8tLqPyYPPd0qLEWqttjenJzItBlmXWN3iIbfeBm2uvvlbgTFt?=
 =?iso-8859-1?Q?Xb8MpSyRiDwa+rAKdXAptaXOnP2zRjjJa47gBmhDJri/+Mz+pcywAVcRfe?=
 =?iso-8859-1?Q?5pEv4Ku6fYjpX73YCT9VP2uR5BXdPcNmUmI3QtlIS9rgJG6U/0qXzCrUfQ?=
 =?iso-8859-1?Q?MK/eLHUl+yho79fIJfjvl5J6pJ4jGiseSUoHuijdYmmpDkz7rrARHuZwX3?=
 =?iso-8859-1?Q?8W0twtH+bCdXIED0cdzRj27I9HXwnd0gOqAuMpG7+SOvfYfmx5D9jr1AWz?=
 =?iso-8859-1?Q?wClKC7+AF0XWGmmMRGTGl/VAhsTLUNsSAWTYHfnD8nCs9GYDRGnDuwk7Cb?=
 =?iso-8859-1?Q?MMaoRC3jqFeB8JORCPbCA6+ohUOP0Y01SmnNYQ6wkLoit5kB4VDn2aLI/q?=
 =?iso-8859-1?Q?en6QUJoupCTur9tno96UaKLKJtUgBPn5J0OE/5EtQ3LwUOylf+EsZ3672k?=
 =?iso-8859-1?Q?3cMuIRNzf+DdtBbvfTsGG5D3+9SDQTRwrb2k5xbqkqq4S0mnue/QxwbDok?=
 =?iso-8859-1?Q?dMAdQZL6d6CCXgJYxKgEUO7UbmQo6tI8MG9mJVzAU/7UNfxYf7eqNzEats?=
 =?iso-8859-1?Q?nkAO3e9GH+YJ/jcSsu1T6AqeqH6NWxUghVkrraJ3d+GgPZGvBzhEMh5K+C?=
 =?iso-8859-1?Q?ET5UPBQI7LI465awerstsM2ohnaVzImn/5iP7EWuenk+C4LazzZJx0tflG?=
 =?iso-8859-1?Q?NCCJrTpEbJPOISl6CogysdzuuRUKvhXURrwctq/z9xaCNb1+bYwkU0ndzi?=
 =?iso-8859-1?Q?6VmyAmxhvQtdyrXDrYPhwBNVPRVkVL1OBCdsLc/Upb4LQE2mW02EBB5mdC?=
 =?iso-8859-1?Q?MnlZNqoqZ7dO6Z70Tkim7tyQQhpRHzyGubE2EGidX3iYNqQkEl4DmX+jMN?=
 =?iso-8859-1?Q?mHO69pTYicJG22imdwDz6Q9FCh27dGCOTTEHsU+dy20GMlXHMiDnIMXrw8?=
 =?iso-8859-1?Q?XSRF7DbFt8UvkhJC87j3rUCdyONIg0FOlIKQI0YPje+K4fIi3f7uOUIImI?=
 =?iso-8859-1?Q?iqogmuX1phCSlEOzYZ4QWpWarcPB+/7jguJD7bq2KKhD38ZbMD2SSH0OIo?=
 =?iso-8859-1?Q?m9L7Ebj335smHHq2ManAOWy0B7QqxWLlHJGqcKiNYSESdd15DThtiQclaZ?=
 =?iso-8859-1?Q?3N/8l2fgRhuljL2hDsLTWZGh+PEmxORt9T8fL2tIvugOg6S/ufdT/hkzhH?=
 =?iso-8859-1?Q?WxyX2N58EvCX6sskSbHh5ETUXi7sDTLatmzJUS+wKs3QavTNjLIvcXAioY?=
 =?iso-8859-1?Q?h7fRXIirtDfi0YtACD7Vm8WwYsdjuV7CU3eyz+2XootRf7c9tIH6Yq5/fY?=
 =?iso-8859-1?Q?V50RPtiqnNTHvzPyq2u7X2h5Uo28Oh0udrS/wlpQoq9ZKGYMBHPV6mxWAo?=
 =?iso-8859-1?Q?8ei1+XcaFInnAW57ByZW4LG9A+FaHAUGQUcyFfWK+r27UPx9OWQTcscyKZ?=
 =?iso-8859-1?Q?6s+HlSPhf5JvLL5Bk6n4x8zehK8Gkd0pWQBSlMLYrTGkYZ6S+/M+Eb/64V?=
 =?iso-8859-1?Q?vROG+L0FDg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c7276f04-7df7-4d79-056f-08de46d70ee8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2025 12:37:41.4950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: id4G4BHlfvHGxA3raBTNCAfgxGq5Zxm2OBY2ReaMUGnhS37pF5eopT5exWl7gYLr1RMYqW1potz3yMMO7KdzrdA92/+dF446eDmW6KyAmbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0788

Hi Xiaolei, =0A=
 =0A=
> Use the new common CCI register access helpers to replace the private=0A=
> register access helpers in the ov5647 driver. This simplifies the driver=
=0A=
> by reducing the amount of code.=0A=
> =0A=
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>=0A=
> ---=0A=
> =A0drivers/media/i2c/Kconfig=A0 |=A0=A0 1 +=0A=
> =A0drivers/media/i2c/ov5647.c | 997 +++++++++++++++++--------------------=
=0A=
> =A02 files changed, 453 insertions(+), 545 deletions(-)=0A=
> =0A=
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
> index 4b4db8c4f496..cce63349e71e 100644=0A=
> --- a/drivers/media/i2c/Kconfig=0A=
> +++ b/drivers/media/i2c/Kconfig=0A=
> @@ -529,6 +529,7 @@ config VIDEO_OV5645=0A=
> =0A=
> =A0config VIDEO_OV5647=0A=
> =A0=A0=A0=A0=A0=A0=A0 tristate "OmniVision OV5647 sensor support"=0A=
> +=A0=A0=A0=A0=A0=A0 select V4L2_CCI_I2C=0A=
> =A0=A0=A0=A0=A0=A0=A0 help=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 This is a Video4Linux2 sensor driver for the =
OmniVision=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0 OV5647 camera.=0A=
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c=0A=
> index e193fef4fced..fd69f1616794 100644=0A=
> --- a/drivers/media/i2c/ov5647.c=0A=
> +++ b/drivers/media/i2c/ov5647.c=0A=
> @@ -22,6 +22,7 @@=0A=
> =A0#include <linux/pm_runtime.h>=0A=
> =A0#include <linux/slab.h>=0A=
> =A0#include <linux/videodev2.h>=0A=
> +#include <media/v4l2-cci.h>=0A=
> =A0#include <media/v4l2-ctrls.h>=0A=
> =A0#include <media/v4l2-device.h>=0A=
> =A0#include <media/v4l2-event.h>=0A=
> @@ -41,24 +42,19 @@=0A=
> =A0#define MIPI_CTRL00_BUS_IDLE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 BIT(2)=0A=
> =A0#define MIPI_CTRL00_CLOCK_LANE_DISABLE=A0=A0=A0=A0=A0=A0=A0=A0 BIT(0)=
=0A=
> =0A=
> -#define OV5647_SW_STANDBY=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x0100=
=0A=
> -#define OV5647_SW_RESET=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0x0103=0A=
> -#define OV5647_REG_CHIPID_H=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x300a=0A=
> -#define OV5647_REG_CHIPID_L=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x300b=0A=
> -#define OV5640_REG_PAD_OUT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x300d=0A=
> -#define OV5647_REG_EXP_HI=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x3500=
=0A=
> -#define OV5647_REG_EXP_MID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x3501=0A=
> -#define OV5647_REG_EXP_LO=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x3502=
=0A=
> -#define OV5647_REG_AEC_AGC=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x3503=0A=
> -#define OV5647_REG_GAIN_HI=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x350a=0A=
> -#define OV5647_REG_GAIN_LO=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x350b=0A=
> -#define OV5647_REG_VTS_HI=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x380e=
=0A=
> -#define OV5647_REG_VTS_LO=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x380f=
=0A=
> -#define OV5647_REG_FRAME_OFF_NUMBER=A0=A0=A0 0x4202=0A=
> -#define OV5647_REG_MIPI_CTRL00=A0=A0=A0=A0=A0=A0=A0=A0 0x4800=0A=
> -#define OV5647_REG_MIPI_CTRL14=A0=A0=A0=A0=A0=A0=A0=A0 0x4814=0A=
> -#define OV5647_REG_AWB=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=
x5001=0A=
> -#define OV5647_REG_ISPCTRL3D=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x503d=0A=
> +#define OV5647_SW_STANDBY=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG=
8(0x0100)=0A=
> +#define OV5647_SW_RESET=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0103)=0A=
> +#define OV5647_REG_CHIPID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG=
16(0x300a)=0A=
> +#define OV5640_REG_PAD_OUT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(=
0x300d)=0A=
> +#define OV5647_REG_EXPOSURE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG24(0=
x3500)=0A=
> +#define OV5647_REG_AEC_AGC=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(=
0x3503)=0A=
> +#define OV5647_REG_GAIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x350b)=0A=
=0A=
It should be 0x350a, not 0x350b.=0A=
=0A=
> +#define OV5647_REG_VTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 C=
CI_REG16(0x380e)=0A=
> +#define OV5647_REG_FRAME_OFF_NUMBER=A0=A0=A0 CCI_REG8(0x4202)=0A=
> +#define OV5647_REG_MIPI_CTRL00=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x4800)=
=0A=
> +#define OV5647_REG_MIPI_CTRL14=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x4814)=
=0A=
> +#define OV5647_REG_AWB=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 C=
CI_REG8(0x5001)=0A=
> +#define OV5647_REG_ISPCTRL3D=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x50=
3d)=0A=
> =0A=
> =A0#define REG_TERM 0xfffe=0A=
> =A0#define VAL_TERM 0xfe=0A=
> @@ -81,23 +77,19 @@=0A=
> =A0#define OV5647_EXPOSURE_DEFAULT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 1000=0A=
> =A0#define OV5647_EXPOSURE_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 65535=0A=
 =0A=
...=0A=
=0A=
> @@ -1435,6 +1335,13 @@ static int ov5647_probe(struct i2c_client *client)=
=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ret < 0)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto ctrl_handler_free;=0A=
> =0A=
> +=A0=A0=A0=A0=A0=A0 sensor->regmap =3D devm_cci_regmap_init_i2c(client, 1=
6);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(sensor->regmap)) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D PTR_ERR(sensor->regma=
p);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(dev, "failed to initi=
alize CCI: %d\n", ret);=0A=
=0A=
Use return dev_err_probe();=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto entity_cleanup;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> =A0=A0=A0=A0=A0=A0=A0 ret =3D ov5647_power_on(dev);=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto entity_cleanup;=0A=
> --=0A=
> 2.43.0=0A=
=0A=
Best Regards,=0A=
Tarang=

