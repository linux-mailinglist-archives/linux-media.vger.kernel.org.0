Return-Path: <linux-media+bounces-65518-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J+4wL8GYO2qkaAgAu9opvQ
	(envelope-from <linux-media+bounces-65518-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:43:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A96BCA3B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:43:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=D5F7K+mI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65518-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65518-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9506C3055C6A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 08:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B0C38C414;
	Wed, 24 Jun 2026 08:43:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021079.outbound.protection.outlook.com [40.107.57.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEDB22B8DF;
	Wed, 24 Jun 2026 08:43:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290602; cv=fail; b=QNOE5z2Mux7RIhg5NeYr6fk0/UdCdwbm+bWWMYaSgzXTtWXgcN6OeSeBc0+SoKIhf3n/SJAlbV9kFOtEt7s1H3HLCQBIYSHU4qKZ1lmomVFIIuKn5/jAGkFtoyx5ZTs9jzTMm+HvVVBPwomY0YbvInvT49wLI8u9rVnfZNgKGBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290602; c=relaxed/simple;
	bh=7x5zDdOMwUB9NNiyt/xxRmOGJoCOPgcgePbQhxufNzo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EfHQfIgJS636NB8ailKc8DU2qfMSr6+8W2vYSM576b2WFmxm5Gc1VR2UvjNYss22Bj2NfO1OfodckMSljczzYQYPfVQ9gT/m/ez6Tp3tQynVvUbkwptRTn74OsNWCzGwyLumGx/7khZEgfefMmjLE5dsUVnCw401eXh2bEh3rYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=D5F7K+mI reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqioeFx9uWoqeVLJGyJdjnSTiMqGazutF9axuJJyf7+ofMBsMHGywzMlIeQvmK2IYPIxv91UxBEb/ArImBiK/qfQi5j+4/suin1mAreyHVtC2mDzGWCzGA0XKvzq5Yk7ngmB4c2YoCdlluHUFXPgu9fCa+v1mUxm1LO3ooL/iWlwJpJLpmrKh3p1wq9gWkvcqyuq6K0rwvsG4vEz1gbNRiJsyD8xciAblm/UF2mDMIheimIbSVNXZKig1CLZpqno3NG8UZbHuEoNRYpmG6JMmh1Lchmf2SJ62tFRgyw82g+eDB3AoI9+yY+f4BHUGdKqgTt1EzdhtWshvlFBp5Z9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Yv1t21A5z3KaUA7jv0N4khRCyO3fvjc6e/0Avdh6PE=;
 b=t6HybSKmjqybG+HEdxMUhmrlnxKj0S9wOdMZPX6mANBnMSldhhRfuRZUdyEag0pBWBSuIw1cORvSXtgJlxcWqqrC3bv3oP08h1K/Y5It0M3N5p4Gb+vki6lQ5Aauu4mpnuAFsrs4GBqYtP0xw1UPVKT4XU3zfrHm2oIVfpQFNraPaUEq0KvZG54TZIJC5Rj01xsKn6rA+hm0Dq/RmHHkyNqAr+foOhG7ZCBtoAQJ9geHxDRFUgdZHcrrcHPNZTIisofHGuATB4/WpkoAVpfswmnYCEmB2MyaSXCsu5nKjnXyjlo8ALZC5I/cdLqWyt8kSL06zrebiW4/N4IJMwe2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Yv1t21A5z3KaUA7jv0N4khRCyO3fvjc6e/0Avdh6PE=;
 b=D5F7K+mIk7UpTACEAmx4g512L4nZS1AOOyI1ABAxixbGdEeWBPLUwgiQYjao+xJnvhRhyGn27974n9d0wk2Zv5XOknOxApZzRY3IcM3kmsEJ3EtxGj4UT1qUUKIF3Zert67of6QbTd+FgQwGq2nzCw1mTW0VX613rYXcQYHoWbBvbuPVD5m/RE7gJIwJfVr2bm1WStrJnBkO8X3nwvKb2JvuQfAq8AKdKk7QAWy27feNvpGpaV42VDKJrzAB7u2yTq3v4yTqQMGUD6sx4IafFRGMrDdGZXeAmyJLzEfVZnAI0zC2Ig44TPnbK1bhOfivKFdlR8JgK3JlGQFaIufXiw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB5256.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 08:43:17 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 08:43:17 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Kate Hsuan <hpa@redhat.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh
	<serin.yeh@intel.com>, Damjan Georgievski <gdamjan@gmail.com>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Topic: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Index: AQHdA4qWGFy8lHm+wkeMR2iQvDfKqrZNXfrm
Date: Wed, 24 Jun 2026 08:43:17 +0000
Message-ID:
 <PN3P287MB1829650C00C45055F7E923468BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260624033508.27391-1-hpa@redhat.com>
 <20260624033508.27391-4-hpa@redhat.com>
In-Reply-To: <20260624033508.27391-4-hpa@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA5P287MB5256:EE_
x-ms-office365-filtering-correlation-id: 2848b6f5-5e0b-48f8-08b0-08ded1cca303
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|10070799003|1800799024|376014|56012099006|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 wWAJqUIRs62Aop3cf5ikBBV7wuKiYP71+t084E+KT6rZCEwdTmK+1Xc8/TChWX5hBlnbUf36ryjzRM+4/DinXKeHMykMadJx4CwNjXH3xn0pVJX4f1uEpL5CYpurX1IwXcU+hWHg9IzCk9rzuG0438wnoPrbZShC7iG8mTT/blGvgtWOiOEedqVsOCf0+XUv7OHrniZkARHF8wY2CAXQS8kbF9cWpJtwTEfhmuZb7ffNBneY+dGGScbV0xfiFWlohJnnEI5wt2udJXpzLic/dOi0h5AG20hhVUXiZ5XOiztnSsYOI2aWiBH1NNHvjoggBCvluhC6KLLeMCG5aODPYs5yzPNxSzINR88C6HmPv/lJl/88ATeR98dYqgVIvLJ5gWfASZeuqKBXl25ym73DBdinFYacTtjwdHUjw/qsuXdzZbbcNlw6RLfVpJwN/C50dbRuydpbsTnaWu7ogcZBvFkcOhuDa13VMCgMg5VukX8k3JjY7hwWN1aVVHhr644NLG1Cj1eemrAFSv6NEc/GmbkQX3f3EVOokEmmTse44WSTeAndS85r653gp3a+QqUFA5hQQ7f/4tYsTkR9PwbtuMa/M40PF9TjeOl9CLdB9hSaMFdYSmfZpOJ8gVgz3e6AKD6RzhiAEDwDjPcZJxGbnnnahDI/LRIpVkZzkg2fCpZyiq0dR42fCGhm0qjk2CIqRO1j8ievcYrCCk+PKFco87GY1GjPfurnteHMhx9S7FU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(56012099006)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2waicrqDO2TAEr0ijhAJXz4FHarXTQTzNhN+frSlF2nO+CwhKsHEFwH1DO?=
 =?iso-8859-1?Q?Wadr/Q1QdSKKQUm5LtHywk+EXe1m5WmtirsyrqPfTUKokUFbHgAP/fmAf/?=
 =?iso-8859-1?Q?JsrbxT2WqLX4QZ10+5qON8ImGlXGYjFbpfhreUm0+uj0r4MlscwVm4qnW/?=
 =?iso-8859-1?Q?1A5WTXQIHtJy8e5NTXgSl+6+0kRCJ3/Mbf3FKfUdE3UavTgCJv9zw2s7bT?=
 =?iso-8859-1?Q?vUxpNRYVmJKlJlySHYB1XTcthoOxzvtA/UX7CNxu335yAY5/TSmYegV8Xu?=
 =?iso-8859-1?Q?EY0bRPRAnv+YfY9OYxMSvx6DT2f3nKM3ngUXCmVOReVCJgMARI1PBeRGll?=
 =?iso-8859-1?Q?K+2vvzmVl5P1DmCSqt/GENt4XoOORmoj1FBi5MwDNGDtbFT+Mek9VtH6w8?=
 =?iso-8859-1?Q?B56uGKNVXqF0u8y8Id+yEW7HXJq7zkjE0NyaDgPd9ifvgoXst9NAWWwVoS?=
 =?iso-8859-1?Q?uj3+j/ystHgcHmzyE0s0JGvlPQ7tkCsvtQyoda6VmhXjweOEW1v+Nn/6Xi?=
 =?iso-8859-1?Q?MqhqRKI3OiWU63ls4/UKxo4y/TSBxhhvc0ZZ/hWuQKoZ6Dad5Mny6VlUt5?=
 =?iso-8859-1?Q?oR086texD+yQG2HeJxqxgoKHXXzsFlbX60/0vXkW/rc0iQRXdLxEy8cV3O?=
 =?iso-8859-1?Q?3OxlJc+SXTvLi5rbpnyDRn7C7aT9M9+PVvLhzxU+a5BJFhkjPeMzjvMVPY?=
 =?iso-8859-1?Q?2bs5JvGdZajdHwlwidKv3c8rKHbyxuZS8c8qrRMWIeqNCAJyygjZLaglfG?=
 =?iso-8859-1?Q?3scDFi9r85MqY+kDdDdGkqR+0vMf8l0vATSXlNEUKkjrFktiaAKbH5dC2i?=
 =?iso-8859-1?Q?G9T1B7Xeq31yswUmEiKplnDdHE9DSacO6xXCeCC9BQK/AgcplwIZIPwaXT?=
 =?iso-8859-1?Q?mCeIQIYUBees5+GexzVHokjyEpsPQImwoKq4qW/lYVcU5a2xAmXTGa0FyM?=
 =?iso-8859-1?Q?jy1SZyYpjbFCFk6AWtZTWuyXKqgCfCmGjhNrvtRPJwe5MDR7L2/oPiHLgv?=
 =?iso-8859-1?Q?jvKy8GK4vUWixYaFqe0qudKgk+Y29PeakXnEfHQahSkpo6VySZsVdDGHXD?=
 =?iso-8859-1?Q?h9VQTct8cYuY0sKcwNhIxTkWeCuaIH0K1Hkly7FW2gqKHOCtcq/+C9AujF?=
 =?iso-8859-1?Q?L1kF9u0Vh1MzccTGWnaUg6o7nGsR8+gq0qJrPN8EREChq9is8ln9lYUDZz?=
 =?iso-8859-1?Q?ed7gXfQzNLWB4WE2JnhMSc/bPm3FsoN4AdX3Efrn675zXRj86tiTOzHquo?=
 =?iso-8859-1?Q?V97Q3Q+mmYwFy7tV4ez8G4Id+B01WsO2Nqb7UlB9Fb0O/UCZZu4SxnHb/f?=
 =?iso-8859-1?Q?hLL2BDbRLq8kgIpmsftHp067yN91/lfhS+J0cY9VMxN++XAggQOxbN7Jmx?=
 =?iso-8859-1?Q?+hGOVykTsHHFdz6nalB33dfns2MTjFEgE2f63TmFizmWRij9znhqy+kEhl?=
 =?iso-8859-1?Q?S6I1KXkcCHy4s1zrjk7u/R6/faBNsIRSkTGgIYWbKaUw9AiigmTBC1u37q?=
 =?iso-8859-1?Q?DQp5i89+WyfmP6qmZBx4214jur+H9+fg5VjP6YU0K8pxjSfmnRlQ3NfAxd?=
 =?iso-8859-1?Q?n0J/LxaT8JLCp4hEm9a+NFEWqa6j2mlIN0et6lTOpS3WY3y7WTXGMqGjll?=
 =?iso-8859-1?Q?lHloiMvqNms7LlYbpm1xgdWaUBm97KC5KV6ANitfQ4X+uwdpWfhpDDKUCF?=
 =?iso-8859-1?Q?CQGkZldOsl+HIYM/50eKg2gZWoH+gICfzxltZ7Q1uEt/kYrjtds3N7oLC/?=
 =?iso-8859-1?Q?KgqNEM0aQYlkXhGmfP8pcVkog41G8yI+JdoYso/R4tTE1tj9ejxjhqXGVa?=
 =?iso-8859-1?Q?u/QyhWRGUm4Ze+9QxJDBoWxKRPUmEyfQlBq8Jyz1qbiSPaA4ROSHcrwfVm?=
 =?iso-8859-1?Q?1h?=
x-ms-exchange-antispam-messagedata-1: Ua0SO7gjh5kfmeUYOeOClYtrzi80Zrn8y6A=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2848b6f5-5e0b-48f8-08b0-08ded1cca303
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 08:43:17.1412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXVqc8WjiM0ITFm3xL+lCCMwWmU+ECi/Dqfp9okSWMC5ulPEX9l+o3u5Srps1bm2Oy68LV5iSE8+kgOyIzzwFREVvZBULgQD1kPSrkaVybg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5256
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65518-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hpa@redhat.com,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 112A96BCA3B

Hi Kate,=0A=
=0A=
> Add a new driver for Sony imx471 camera sensor. It is based on=0A=
> Jimmy Su <jimmy.su@intel.com> implementation and the driver can be found=
=0A=
> in the following URL.=0A=
> https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/im=
x471.c=0A=
>=0A=
> This sensor can be found on Lenovo X1 Carbon G14, X9-14 and X9-15 laptops=
=0A=
> and it is a part of IPU7 solution. The driver was tested on Lenovo X1=0A=
> Carbon G14, X9-14 and X9-15 laptops.=0A=
>=0A=
> Signed-off-by: Kate Hsuan <hpa@redhat.com>=0A=
> ---=0A=
=0A=
...=0A=
=0A=
> +static const char * const imx471_supply_name[] =3D {=0A=
> +       "avdd",=0A=
> +};=0A=
=0A=
As we discussed in the last revision, this should be "vana" instead of "avd=
d".=0A=
Better to use the regulator name as defined in the datasheet.=0A=
=0A=
Other than that, the driver looks good to me.=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=

