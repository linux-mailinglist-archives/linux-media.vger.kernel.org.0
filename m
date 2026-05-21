Return-Path: <linux-media+bounces-62419-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFJrI4zHDmrsCAYAu9opvQ
	(envelope-from <linux-media+bounces-62419-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:51:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCFD5A17C9
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 52DCF303FB93
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 08:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFEC3A6EFD;
	Thu, 21 May 2026 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="J7AWrHyw"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021107.outbound.protection.outlook.com [40.107.51.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746953A48E8;
	Thu, 21 May 2026 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353309; cv=fail; b=LJYOSn4NQI9ZAOQJCOaCUIUnDFTKgNP4pfxpZpdYuGosuzQia5cGUZ6wKJbiJHVLOlofAkfMtqHuo1hwcrZLIEOgbERrYYfBTuuq9hzNG64kz0dhyxYSJhgDHnJ3V/Uw6a4faFa7XJJRTTCGMU+iDWT+K2ceIa4UQe42RckyGa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353309; c=relaxed/simple;
	bh=Zxdo6EyOT9YTonKxOQSu37F87QpCSkfCfzz9E5G/ueI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wg0xI1H7y1JG+Y/vdVL/9CWjy1LznH4IfOMNN/5Gq0MbplqqZgA4+BqDycgA1bNSLnarD6H/2FC/tzfaz4yVI+no5kqVsHQYcGfYDDDSyDQUnzFJ4ZYt36FWNu6iMHZdEMpEoYqDjnvaFr/J36t8yvXOMcivGrjt4AqJeSpV2ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=J7AWrHyw; arc=fail smtp.client-ip=40.107.51.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llm0u74TpsTBewsK7ZhVfw7RUyz4A3LU+aTCtjJqxNRKi8rJux2duELmsi/07q8ncMFb55q5paHf9dl/KEl6iXOyXy3vb99zgRIP4wi/EIjG5r/3Q36yduz348NT9p8bxgcNfeQf01cIhkxyPuuGSPZvxm8tKCYJHPtgSWSc0ypGoKN3a8KvFjVal2nYxRpULIN871dufqjQ9EH+Ntrr++R8jY37WowH5AC6H7VeXjqGICXIqNJapzaM/B+kffpXWWgyPwW8fwpymxQdt1eftKrOMZ+NS7jRJjxQn+6JPosOqHX3jZu2QRw6o2tjZCIGwh/crd2QMbgHTz8SB+Jq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kCZQN2iKfPVbDTi+W7u1LFmbyV7UiurN2Qr71WEgl4=;
 b=WtJC2xKo5We/kEUewjjp41MuK2490Wv2Pgww0/Wku30wAUZGottt9zsPAXn6vv3+yGNwJdh2Ik9C07iY+v8d4Yg7B3sht7x+l59EBDmrd95Hk2xkO8X0iJM5K+7L73PBTpmNoj2IQoybmojO0y/3ChExKU6/MvNjntXkXMu0LYyXcfwQLa528uX1dwNmSBpgAGPrjF1EdJ5BAyuzVNMreHKbGenJJP1VlRyZyjGbWv5QvDL0s0m7BKDXsZPsdKHg/JGqeGhX7mxH00Pt43qgTkbAXNaDv2OJSE+Eg9hJeGNuh7e/mXNp4jrYNoTFyz61oolGJKQidZnSXrqppsqTYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kCZQN2iKfPVbDTi+W7u1LFmbyV7UiurN2Qr71WEgl4=;
 b=J7AWrHywY+8YN7RM87lCVGC/9NLtDRPplDACbNVoqjjJGnLpiP/LEOWu5Fjnv4wP8BLU7gRVkbabFg8+k6nFx1ZmgY8DWeejlJKx63HDRMx4l/hAffEmLXQO7Elj2QLZCeJwOZuycRZeUcn9BRQL21Dq41bER89tXfYNCWlmGHN/BqylCZHx5kY/dLPQP6Kcyv7eZtp6zCgYUjAg3dM/wFRtxOvszvwfzHLChrhU9SOIlkGfDv0j1OX4ScK2+r9ZdeQKQCu+P4U08SZGT5WMUExVnmNXnPlb4+SrhX5xMdoDIjdSfnVJrdzqZm/VcZ8NC6YGQbNtprYFzuYkBmqERQ==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PNYP287MB4848.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 08:48:20 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 08:48:20 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Luca Weiss <luca.weiss@fairphone.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
CC: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de
 Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Xiaolei Wang
	<xiaolei.wang@windriver.com>, Walter Werner Schneider
	<contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add imx576 sensor
Thread-Topic: [PATCH 1/3] dt-bindings: media: i2c: Add imx576 sensor
Thread-Index: AQHc6E/KOlaCH/7z5kGlzhhM3jiXALYW0nYAgAFZ9es=
Date: Thu, 21 May 2026 08:48:20 +0000
Message-ID:
 <PN0P287MB20196BEA59D0156545E076739A0E2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-2-himanshu.bhavani@siliconsignals.io>
 <DINHRDC35RER.Q143U5P4ZV9O@fairphone.com>
In-Reply-To: <DINHRDC35RER.Q143U5P4ZV9O@fairphone.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PNYP287MB4848:EE_
x-ms-office365-filtering-correlation-id: cc881ea0-17d0-4d69-aaec-08deb715b58f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|56012099003|18002099003|38070700021|3023799007|4143699003;
x-microsoft-antispam-message-info:
 SB2+K+PZpf2gsM/5EHfLqDnn1a7WqjameVJdHeBw7gmv2wonspF2mJcG2Vm4m+8z32y3dSdPVFseYtm38kgsX0bOECqDrn9GRqnIaiMCHw1U3xqVZDcXo9QXWh1b3PfeaFlORstn9lHiWjAv6asIbYZBVV+/cmCY1D6CbvwnOEvdCp7MQkkTMhWRpc0tQ22S9Tzq37a50SA7SDU9kA7EVXDrJ0fWH29PAHtSxk9zQ/SXSGTCb+IAyLh5fwX6qWRLkPu9C53qIAvi3nnIvMff9IjeeNva0qujf/5xOnmvY0Am9KIQpuHuRm1d2PBmbcp6jj2Iz7+Ez1RXjNxWTne/5+91ZgACtzffyVaHFt5Gveo8bQoFp3qjxwuhg1nONSccur66UZDEei0J2+XQm3aIPGT4Qp3Lk3VWT3uEx06U9Xx1e/Y8TicNibQwbpsn+3JST1HvI8VrVm17Q4XBSVHzOZVGsUJ+vP+XupS7jMhvzwTzkz2hVwWt4U03ZFBd93Bi/tp4CVx5TZVpoaGnYxv8f+xt3XU84ts0IR9mct/KZoPwexkPRjJCTlJ/7Nomx+jOXaMPIREmbNjrZRzQyuto4a5Ah/Rxf4POtTirFPFVv1CfJbpPBBgdWhQm5/5RgNss5GBoIlidMeW/lGN+pWC/W02yazDiZpF2laEItCUJbryUsuMlb1oAYi8mnMRF8Bq85Bsv8ylqo76/UE5Ioghmkg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(56012099003)(18002099003)(38070700021)(3023799007)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?wvDB78/hqXg7QHbeY9VNwD2UhvBw48bgbZSKKw3uktq6M4jYHCZyiL1Q?=
 =?Windows-1252?Q?I4shVhHcJr8xi7nFVvwb3nc4Jzdu3E4WUQrNrRl75tLNkyiCwkUMMaCz?=
 =?Windows-1252?Q?DukwSTSCbVmWTLudYVODgUIdKvVRwUFreMnnZb7aNx2QGZlAotta6rgx?=
 =?Windows-1252?Q?CwIbJkOIAZADApPQ8ib8aTQU9UOZlyHoSjH6VlPUfDUrT7UBWtaifWC0?=
 =?Windows-1252?Q?4ScrRbgF7RAdy3XlHDN02mcmmq/3R53Asb0qt0ebUo6WHmw4B8rTsVNh?=
 =?Windows-1252?Q?3wmR7AkLBo/ZvZudJxgdCqEIzO9aGfASfheDZ8xtGBdbYfGZFvzhBJeV?=
 =?Windows-1252?Q?mnqsrigfSzECEp4xNRg44LbRDrMNVF+7wzCNgpdOHR3RC1d0HTP1eJlz?=
 =?Windows-1252?Q?pujDQpFA1XwrjS6bReZaMOYaPC/GRSdFm8uxgHWeHAbrjT6fC+wHBqjH?=
 =?Windows-1252?Q?Bq7tIQC3nZxxGNGaKMUtR5eOh98sczWIC+/X3o9qlsOhwmJYvwsBSxvA?=
 =?Windows-1252?Q?WWdK04psMDT37GvGjgSzvIRLxJQ+nQZgQGKY7zAJm5hBAhGS/3c3IXHq?=
 =?Windows-1252?Q?vPSdL0xnZytRVi6LJ8RnVtS+dMv3VCp4hLkciTqOT+kgpaGB7w+WpAqI?=
 =?Windows-1252?Q?7owgVBP+6FSJlkuUgkR3HcKF6WN2RZOZcip2b4BbsLE6mgyqmb67Ylpl?=
 =?Windows-1252?Q?3igWlxeEA+mua6Aej/v/Cl94qFbVrYZt9kUu5uGA+9Xw6iWO6apzsSQ1?=
 =?Windows-1252?Q?HVWNKU/TKmNYs6XV6AE67z+r0bwAYQ7rjIrdNDT50mpHuuL54xhjbbzk?=
 =?Windows-1252?Q?eSmh2a5al8lVKQPJjjk0BN3aR6JE/35KtwjG9zd/WmyshIKwQoa5CO1E?=
 =?Windows-1252?Q?7yOWKzRdAGfB9fPuLjkoMndj8ze9PL/Ckrrm58/Lllnqkq6UXriIcToX?=
 =?Windows-1252?Q?WYsaBUyacdzqbRRj5fzigfirZZFaUJGDTUkZ1kkXfTcdpXPk3rTBeOJY?=
 =?Windows-1252?Q?3q+2tEkIShXcEMj4faOTPbqwtZJvy3pvQ1QEdm+PAO+e7cG7LheuJG9Q?=
 =?Windows-1252?Q?EJy1nwS808JwPm2IAGrtx95Osiik1lDcc+q5AfZBGZ3xD21aP60biBcW?=
 =?Windows-1252?Q?DRIvpGRBWR+kBKgKheNhAtLZ+YoI7B9CYMIEbi0GNR8QrSzjocZyUxvx?=
 =?Windows-1252?Q?sY1SeDSjYdBzIrFZzVl0Z0qaX4j+5xWPnzucq2tckuG7lp4iVBain4nw?=
 =?Windows-1252?Q?Ox6iTuqf44WS3aPfP6jtunyT11nmORI1HholsSi6gsPTsHRL1mBmsJbC?=
 =?Windows-1252?Q?GR3OxV97MoFlIeyJxB3KotnpajXEbegm16awZwFpcboz7wgNo440rUFl?=
 =?Windows-1252?Q?7DBiU4AQ5yLAU6ZKmndWTiRF0ZcWOX8Fta1UYXR/tMjogKYPXBOr7ABD?=
 =?Windows-1252?Q?dd4RJ1f7J1yeO/Bu/CFXuwhdIhxDPJJgt7JLwAQk8A1QuZhgqrnycgyd?=
 =?Windows-1252?Q?gKmX/OV3KEZJt92cZwPfVwDiJmno3DPrPwyLQ0mEs/cjQ1n9FyMofL8K?=
 =?Windows-1252?Q?YucZWP/Z/Zz8YyKaTIfq58tZ/JOV8nqc655QeiYFoOwvfFPmdouBIQys?=
 =?Windows-1252?Q?Vq4y1mQdjhNMd91a5C39AeN8BTnkFkg0TRaMXDdJcykSIbWYHnE7giyy?=
 =?Windows-1252?Q?w3Oxe/hvDfG77vKuMcl4JKAo5DaJA2xtfjSyA/s4UU5X6Cs+zWtjO789?=
 =?Windows-1252?Q?nontdZ3Al3LCvtv6bthTmTh9YTfPzUyd82NbD3TF7p5//NKLmkAFx0bu?=
 =?Windows-1252?Q?tqIiE7m7QVq/Fd7DwXgdBYFTMisrGqFSr5SPC8sFpFPnaQbEeOBdwku8?=
 =?Windows-1252?Q?B/2zTcte8RduPsOvznR6Fhj6m74Qfqfouj4=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cc881ea0-17d0-4d69-aaec-08deb715b58f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 08:48:20.1400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CshqZNdkdY5xIaJbefNYEfSNRQ+o/xeYjcmtfHF1PHEi+tpMNjcI4rWJ9a1BIgRO/tPpprlm1kBbUVlai7I1eKp15QnuQllLqZvrEKSr2TesymQLR8CzYfm8OCNdum71
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4848
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62419-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,ideasonboard.com,windriver.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6DCFD5A17C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,=0A=
=0A=
>Hi Himanshu,=0A=
>=0A=
>On Wed May 20, 2026 at 1:56 PM CEST, Himanshu Bhavani wrote:=0A=
>> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>=0A=
>>=0A=
>> Add bindings for Sony IMX576 sensor=0A=
>>=0A=
>> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.i=
o>=0A=
>=0A=
>This patch is missing your Signed-off-by I believe since you sent the=0A=
>patch.=0A=
=0A=
Noted, I will add it in the next revision.=0A=
>=0A=
>> ---=0A=
>>  .../bindings/media/i2c/sony,imx576.yaml       | 111 ++++++++++++++++++=
=0A=
>>  MAINTAINERS                                   |   7 ++=0A=
>>  2 files changed, 118 insertions(+)=0A=
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx=
576.yaml=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx576.yam=
l b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml=0A=
>> new file mode 100644=0A=
>> index 000000000000..b74253004fae=0A=
>> --- /dev/null=0A=
>> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml=0A=
>> @@ -0,0 +1,111 @@=0A=
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)=0A=
>> +%YAML 1.2=0A=
>> +---=0A=
>> +$id: http://devicetree.org/schemas/media/i2c/sony,imx576.yaml#=0A=
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
>> +=0A=
>> +title: Sony IMX576 Image Sensor=0A=
>> +=0A=
>> +maintainers:=0A=
>> +  - Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>=0A=
>> +=0A=
>> +description:=0A=
>> +  IMX576 sensor is a Sony CMOS active pixel digital image sensor with a=
n active=0A=
>> +  array size of 5760(H) =D7 4312(V). It is programmable through an I2C =
interface.=0A=
>> +  Image data is transmitted through MIPI CSI-2. It supports RAW10/RAW8,=
 COMP8=0A=
>> +  output formats.=0A=
>> +=0A=
>> +allOf:=0A=
>> +  - $ref: /schemas/media/video-interface-devices.yaml#=0A=
>> +=0A=
>> +properties:=0A=
>> +  compatible:=0A=
>> +    const: sony,imx576=0A=
>> +=0A=
>> +  reg:=0A=
>> +    maxItems: 1=0A=
>> +=0A=
>> +  clocks:=0A=
>> +    items:=0A=
>> +      - description: INCLK clock=0A=
>> +=0A=
>> +  avdd-supply:=0A=
>> +    description: Analog Domain Power Supply (2.8v)=0A=
>> +=0A=
>> +  dovdd-supply:=0A=
>> +    description: I/O Domain Power Supply (1.05v)=0A=
>> +=0A=
>> +  dvdd-supply:=0A=
>> +    description: Digital Domain Power Supply (1.8v)=0A=
>=0A=
>Sony calls them vana, vdig and vif.=0A=
>=0A=
>Regards=0A=
>Luca=0A=
=0A=
Thanks Luca, that was a mistake. I=92ll rename them to vana, vdig and vif i=
n the next revision.=0A=
=0A=
Best regards,=0A=
Himanshu=

