Return-Path: <linux-media+bounces-55845-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMdOITait2lTTwEAu9opvQ
	(envelope-from <linux-media+bounces-55845-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:24:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C04295129
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73ADD3016D3B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 06:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E62E34BA50;
	Mon, 16 Mar 2026 06:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="DqGaa4EV"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020142.outbound.protection.outlook.com [52.101.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB52F34B1A1;
	Mon, 16 Mar 2026 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642272; cv=fail; b=OtyLu+qR+xpCidX9tydAhvp8eEieVmqoM7A+PDbt4ada53gziUsD9uBTu0iQhMsdNH9dPEvsh91OHjxZfRwfOY7quHLfQ//bXegm+rxiSehMHIBB5722WowChS6Mahm85DDQeq/I8yR5oOB/B2kgp3hwRAh/vGCumdsCVP+1h78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642272; c=relaxed/simple;
	bh=m8wZ4czV0KFHw9MnWUi92/+nH7rgRRzc3jnFJOfvc7c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ILNK+72Ut5Oxn5pQfCUpEnz1QTm215TKkWtuLjFMq1uAQs9mJcZDUaTqVsf6iNfe/821Fv4dzSoR5yFEarMJHY7OAR708WMGGVhdO+y0EAJo8BdGMlrBPS+kU1e5D2kM2FLN8+oASvDMOUEmeB3WIzuWJybHZycnOg8FfhbVAGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=DqGaa4EV; arc=fail smtp.client-ip=52.101.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMauA+3rwExkfQA5tHTKEwlKMWmpFh6MghCelEdpJwt3eaiG6w3n5SW+uDAIX53MluWdswVFQeRapN/lmUWcVkbjuqCApDrvy93CaRUoZYkfmAo9HSgRd6m/45clfUtw8nOFYxMw2NRTbeqrzdhlvGjUGThHGzGTv1enTMJrdtr1RAS9SO3450vEYsY0NQUdkHHfJg8LHmS2TUwb/5ZaP99sQDLBbTPxzclsrHKLUrYF+1YYEEGFynuJ1VEcdNqOOHnWO4FerfiL84UFXd9VBaUiBuAnLioGUpi0vvR5IWFR82KxskY9Ui31+VlhHRuP76fl+m5k7/JgO2oRIUJVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8wZ4czV0KFHw9MnWUi92/+nH7rgRRzc3jnFJOfvc7c=;
 b=sgNNTO6p9p4i8zG48HDBABrB6AA656XTSmPJ9sc3iEqxDXIR/w/vZoW1Ju6EhOFlf8R+sH0+uVSiNADlreUN7ovGPsgtWwI+FldVDwaCXH/fwa7KtSI1go1KalBT8NJYFK6daGZGvNg7ySgWNioSn6eYcdsMyYAq+PpCm7zjZwFKopS0lIAhEPs6hDyEGkXTVrkV52r5fsb0GbfiXrLr8uAFwzsTp/aZ73M/vAGQzClCusgJDnYQAVBIDcuHIJNnxtS3MdY/D8msQABSDdDR2sn8O/NSueBlp3a0ayR5ByXlLn48lYFIcpbGf3ERGocfl3wMmRBuv8MpDT951Ne8Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8wZ4czV0KFHw9MnWUi92/+nH7rgRRzc3jnFJOfvc7c=;
 b=DqGaa4EVFFCLDtb0/CV9j2hdeXwWT8wb2SxUNPudkGaKmtqF0P8Cx1qY2bM10ifwZ7MdO/bgk0c7MwF/nvPW2VT34g65YWsarKVTHy+iEVzNkR9AWxmvarZi5rvlhR0MebcC6fEYvvpMESCkBEWqe8pd7UcIDBZSisHWeMIy7WIxIEnenTgFXuB9m2kplWb9IjFiud/BzU5+7dbHzOXTlFVXG62oDPjl+R8A5n8QPg6es2y8lt1sRe5Ualx+qeiGLPnLvIorhqOzBi+5FBmZYuXXC9S3/Pxfwfr4CHJmlbVjksRcM1Jsewp3QrZFg7x1f6Thi/G9QU8vbmbn0scGKQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0256.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 06:24:26 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 06:24:25 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] media: i2c: imx412: Convert to CCI register access
 helpers
Thread-Topic: [PATCH 1/3] media: i2c: imx412: Convert to CCI register access
 helpers
Thread-Index: AQHcs62gadHV08TQWkKr4jIPgz3NtbWwqcfH
Date: Mon, 16 Mar 2026 06:24:25 +0000
Message-ID:
 <PN3P287MB182962CF5568FA24CE147A6E8B40A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260314122442.109356-1-elgin.perumbilly@siliconsignals.io>
 <20260314122442.109356-2-elgin.perumbilly@siliconsignals.io>
In-Reply-To: <20260314122442.109356-2-elgin.perumbilly@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB0256:EE_
x-ms-office365-filtering-correlation-id: e7fc5113-7de0-4057-794c-08de8324abce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 lZ/VDtk/DU3T6OXU5SSJREMEWSOfW4zpNrs/vGZ3/5Kx8ukVKbwTGvMGNksrf1yJ5oem1qEuv0/fi2Rqy3fMKUM01lw4RejBvnGLrbrrtz0Amhd3Bvorxqvez48DIJMV8KDeaBg5U747V0WFy9KEJAHZIwOYxhOe5SQ5YmXm/LNrZUBJPixAWdAphF9PXQDRfrWb19cjotu5rtYKoWhdJZJxJjFQskZDFFhPj4dXK4QoXItu9iN3Xao/LM0BDyZF9zzYYx0Q7y5u7K3czhFAGFAoIvC8zrUAn/juUT3zokYnpFWsdT6g5ENjLJLdYz9NBopL+bXWsxALvqi29hUs4wEiMzcRY1B1+jGIppIoDu0PSlEqzGD/iiAu1RxdT90oHP2tDkPkkq/IVeVeAW6RyoUdEJEmJshiORuTTOkPSwrAqOUH704d424ezqkaeAkN0Rps1wj+vXrLBnhAvPu/TcFC7y4Rl/i8CE7CD50DBaBqeRpa+ZuBOQHJKxZr9oVYsLaD6gBYndWCU4bCb950Htqp/gNu6plaM3Hibg2ItC9lIP7xCjmcI0CWN5AqMA31t3RAdT5k7SddErQf0j8K9mq3xbjPxly2l0PssdYL1WjzazjFY1xcDkhLG4Eo61JE9pdMN5jE1uUSlMaibh07DeqTieFmAiz08u4GSGp+3nCECMM6reqAiReJ6BoyD23/yhZCji0QQgLfhlIIN1rc5G55RW8g8yXj9sthnT92chSHUt+Ma/Kf8PKzvTve58/Y7y+2UE3nAlk653VxW9xnxWA5g5Baj/KaVJ7sYeYMFQA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IUX4qUThbmg7xkCfD3Y8abrwMfCyCopObZd7fiN4IMUtxkgyYiLGcPkm+f?=
 =?iso-8859-1?Q?Roiz5zkX9c273gfaXP4wHNM9MlAZ2qulZsHMbgyZ11+mgP5DfgCGiqBxFF?=
 =?iso-8859-1?Q?3tfRkFZE7Q3TQI3bhaUtw+EZJUOkaRoUkBsR5PNMs3eoblQQiL+BDrdpu6?=
 =?iso-8859-1?Q?LPuoTrMp/3WPWdhVSJx8KZtwNVfL9uqyQCXA47gcz/zDst0RZ3na6S1fgp?=
 =?iso-8859-1?Q?JRIzitHBIbCLYhtyc8ljH5wE4HB8A8IWZ1+ZdRIfoH8VXcUyNdUdVTNKFJ?=
 =?iso-8859-1?Q?HEpMqWcwBvZhCObwtIcadzb2/7i0X15O3v7nY8KceqRH2F7xz/n8CVTFcp?=
 =?iso-8859-1?Q?lG83VYTJ7X4k4pdLx5v6kRiRSMJwLwI1UwsXgRIOluZd0ItLr/ZBRVDFlP?=
 =?iso-8859-1?Q?df/fpkXiWkNVWURljVQIAP5KhKWeBVRMXCL7aRa1I/7Vkt4NhvFAbuT7W1?=
 =?iso-8859-1?Q?4ka+XIOmvAdELDkoAEzzGuPJZfNaMALz9XMFBiW5u1e48mT3uerClLWxWz?=
 =?iso-8859-1?Q?Tshrvq4QMmhV8axMouq5hDMucnWHFrpzVWSCmGVw6vQMPSjkiChAlmLO9S?=
 =?iso-8859-1?Q?1+cI498d5NMVY1oG7O16YLWSFHxydroItySv/ebNZByTVPFFELFNPX6cOH?=
 =?iso-8859-1?Q?YrxIfeNggVcB4EJoFFtM+QmH2ezWaI/sAH1vTLXnivE8GWbaSXRMwqWqLg?=
 =?iso-8859-1?Q?oFUznaZm8+IVLNC5ifLPd/zbyeWUUa5VozsU9sR3Q2JIvcbMgZ815Biu9L?=
 =?iso-8859-1?Q?7rYqFizBk5S49LduzMhsUu6nYFZsnbt//6T85gfYXCxd65PHqJ2xT5u1+g?=
 =?iso-8859-1?Q?Z1vnsUYP7iC3wtRZ1+NVU9inRJMVqVNl7Id6BJQwgMSZEUyPq8ZWdxxyaD?=
 =?iso-8859-1?Q?6dz61Ez/1yexMbciffKIRwGnwLrbKvf3hJbuOxr6Ezb6VEnstgcvqXQk8U?=
 =?iso-8859-1?Q?2L9R7w+ze+ox9CAOAoP+8AJcP9rqd+LRMfeHQXOfQGNsfA9MP2eNboPVxP?=
 =?iso-8859-1?Q?RxHVGNcdri5upN7T7qG/ahiTsvHUFEE4LdUYJ25aXsKZynMjQGvUFyGEql?=
 =?iso-8859-1?Q?2NFEKwsZmAcQ3C9OcpWGhQetoxvK8vB9KuOl1NGHAP72p8bx+1uY/443ci?=
 =?iso-8859-1?Q?TtBT3SNX8CCKKhzLtV0JXQrWJq/SrDdUr3LvYn/6cXJSwpgl2wqKSaxd10?=
 =?iso-8859-1?Q?pzP86V1OJrOWqO78xq7cpzpEUCQTkH+QBtXYo/r4220BC6jSHRC+YtC+Q+?=
 =?iso-8859-1?Q?eWbdl5X3adbnLqx8WMxoNziH5TasIoOXsrTnSMbjcOYeFCn420psbKtwoB?=
 =?iso-8859-1?Q?cY3qV1DscmIHIN2cTg8qmv9aXaIRfNgUgBvzewW8IplaL0KT+VwWm/h72u?=
 =?iso-8859-1?Q?J2D26kZc5EOkAPEXOom/GtB+RwupvwIWglJTmQ7KJSm7fwvQGCekUNWP+F?=
 =?iso-8859-1?Q?kvehuy3n2zr+zEJNt9qzFHDM6BmQ3nkC5qX+/heSyCjkuDM4PuaS3Z6/cO?=
 =?iso-8859-1?Q?z9JRtBWFcOKZGYjsFY8MQrvdfvNid3QNMWEuhWf/ePxvOWlfmx7by5aYKy?=
 =?iso-8859-1?Q?pC8SzrxsLhn1/GLCDe0DLzQEjgEIBmnXQgWuJlKhg1zCh3W3jnzK2gKxL7?=
 =?iso-8859-1?Q?UIEPk1bBWuBs3R2mzCfiNdEeF1tL4HvksMhMvZcxvrr8VsnaXgkb5YUSph?=
 =?iso-8859-1?Q?rJkgqFmmAPmWZJy7O/twkehkmJl2m6Ki4TOF4hcJ/YC6D8Ft9qqD8XztL1?=
 =?iso-8859-1?Q?bpSOSY83oy54Su0fmFTxWPa0vRfYPuiRmOs+YU52iy7oNJ5MA1MWla5jYY?=
 =?iso-8859-1?Q?miL8XegAtw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fc5113-7de0-4057-794c-08de8324abce
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 06:24:25.7156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qzVGRTVa/M6xWQAqtz0X8jWtfj1q/bcfdf2S7PGXlxiVJPBv+K4NvwXlWxvgOaOd81ScK5plbaCol8lVGFoMlOlZ1xmdztwOW1k3+vfQrrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0256
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55845-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,windriver.com,ideasonboard.com,foss.st.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email]
X-Rspamd-Queue-Id: 06C04295129
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Elgin,=0A=
=A0=0A=
> Use the new common CCI register access helpers to replace the private=0A=
> register access helpers in the imx412 driver. This simplifies the driver=
=0A=
> by reducing the amount of code.=0A=
>=0A=
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
> ---=0A=
> =A0drivers/media/i2c/Kconfig=A0 |=A0=A0 1 +=0A=
> =A0drivers/media/i2c/imx412.c | 635 ++++++++++++++++---------------------=
=0A=
> =A02 files changed, 271 insertions(+), 365 deletions(-)=0A=
>=0A=
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
> index 20482be35f26..1881da7a3967 100644=0A=
> --- a/drivers/media/i2c/Kconfig=0A=
> +++ b/drivers/media/i2c/Kconfig=0A=
> @@ -269,6 +269,7 @@ config VIDEO_IMX355=0A=
> =A0config VIDEO_IMX412=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 tristate "Sony IMX412 sensor support"=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 depends on OF_GPIO=0A=
> +=A0=A0=A0=A0=A0=A0 select V4L2_CCI_I2C=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 help=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 This is a Video4Linux2 sensor driver for t=
he Sony=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IMX412 camera.=0A=
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c=0A=
> index e25e0a9ff65c..13d6fe79dcf7 100644=0A=
> --- a/drivers/media/i2c/imx412.c=0A=
> +++ b/drivers/media/i2c/imx412.c=0A=
> @@ -13,38 +13,39 @@=0A=
> =A0#include <linux/pm_runtime.h>=0A=
> =A0#include <linux/regulator/consumer.h>=0A=
>=0A=
> +#include <media/v4l2-cci.h>=0A=
> =A0#include <media/v4l2-ctrls.h>=0A=
> =A0#include <media/v4l2-fwnode.h>=0A=
> =A0#include <media/v4l2-subdev.h>=0A=
>=0A=
> =A0/* Streaming Mode */=0A=
> -#define IMX412_REG_MODE_SELECT 0x0100=0A=
> +#define IMX412_REG_MODE_SELECT CCI_REG8(0x0100)=0A=
> =A0#define IMX412_MODE_STANDBY=A0=A0=A0=A0 0x00=0A=
> =A0#define IMX412_MODE_STREAMING=A0=A0 0x01=0A=
>=0A=
> =A0/* Lines per frame */=0A=
> -#define IMX412_REG_LPFR=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x0=
340=0A=
> +#define IMX412_REG_LPFR=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI=
_REG16(0x0340)=0A=
>=0A=
> =A0/* Chip ID */=0A=
> -#define IMX412_REG_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x0016=0A=
> +#define IMX412_REG_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0016)=0A=
> =A0#define IMX412_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x577=0A=
>=0A=
> =A0/* Exposure control */=0A=
> -#define IMX412_REG_EXPOSURE_CIT=A0=A0=A0=A0=A0=A0=A0 0x0202=0A=
> +#define IMX412_REG_EXPOSURE_CIT=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0202)=
=0A=
> =A0#define IMX412_EXPOSURE_MIN=A0=A0=A0=A0 8=0A=
> =A0#define IMX412_EXPOSURE_OFFSET=A0 22=0A=
> =A0#define IMX412_EXPOSURE_STEP=A0=A0=A0 1=0A=
> =A0#define IMX412_EXPOSURE_DEFAULT 0x0648=0A=
>=0A=
> =A0/* Analog gain control */=0A=
> -#define IMX412_REG_AGAIN=A0=A0=A0=A0=A0=A0 0x0204=0A=
> +#define IMX412_REG_AGAIN=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0204)=0A=
> =A0#define IMX412_AGAIN_MIN=A0=A0=A0=A0=A0=A0=A0 0=0A=
> =A0#define IMX412_AGAIN_MAX=A0=A0=A0=A0=A0=A0=A0 978=0A=
> =A0#define IMX412_AGAIN_STEP=A0=A0=A0=A0=A0=A0 1=0A=
> =A0#define IMX412_AGAIN_DEFAULT=A0=A0=A0 0=0A=
>=0A=
> =A0/* Group hold register */=0A=
> -#define IMX412_REG_HOLD=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x0=
104=0A=
> +#define IMX412_REG_HOLD=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI=
_REG8(0x0104)=0A=
>=0A=
> =A0/* Input clock rate */=0A=
> =A0#define IMX412_INCLK_RATE=A0=A0=A0=A0=A0=A0 24000000=0A=
> @@ -56,16 +57,6 @@=0A=
> =A0#define IMX412_REG_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x00=0A=
> =A0#define IMX412_REG_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0 0xffff=0A=
>=0A=
> -/**=0A=
> - * struct imx412_reg - imx412 sensor register=0A=
> - * @address: Register address=0A=
> - * @val: Register value=0A=
> - */=0A=
> -struct imx412_reg {=0A=
> -=A0=A0=A0=A0=A0=A0 u16 address;=0A=
> -=A0=A0=A0=A0=A0=A0 u8 val;=0A=
> -};=0A=
> -=0A=
> =A0/**=0A=
> =A0 * struct imx412_reg_list - imx412 sensor register list=0A=
> =A0 * @num_of_regs: Number of registers in the list=0A=
> @@ -73,7 +64,7 @@ struct imx412_reg {=0A=
> =A0 */=0A=
> =A0struct imx412_reg_list {=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 u32 num_of_regs;=0A=
> -=A0=A0=A0=A0=A0=A0 const struct imx412_reg *regs;=0A=
> +=A0=A0=A0=A0=A0=A0 const struct cci_reg_sequence *regs;=0A=
> =A0};=0A=
>=0A=
> =A0/**=0A=
> @@ -111,6 +102,7 @@ static const char * const imx412_supply_names[] =3D {=
=0A=
> =A0/**=0A=
> =A0 * struct imx412 - imx412 sensor device structure=0A=
> =A0 * @dev: Pointer to generic device=0A=
> + * @cci: CCI register map=0A=
> =A0 * @client: Pointer to i2c client=0A=
> =A0 * @sd: V4L2 sub-device=0A=
> =A0 * @pad: Media pad. Only one pad supported=0A=
> @@ -130,6 +122,7 @@ static const char * const imx412_supply_names[] =3D {=
=0A=
> =A0 */=0A=
> =A0struct imx412 {=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 struct device *dev;=0A=
> +=A0=A0=A0=A0=A0=A0 struct regmap *cci;=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 struct i2c_client *client;=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev sd;=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 struct media_pad pad;=0A=
> @@ -155,238 +148,238 @@ static const s64 link_freq[] =3D {=0A=
> =A0};=0A=
>=0A=
> =A0/* Sensor mode registers */=0A=
> -static const struct imx412_reg mode_4056x3040_regs[] =3D {=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0136, 0x18},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0137, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c7e, 0x08},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c7f, 0x02},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x38a8, 0x1f},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x38a9, 0xff},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x38aa, 0x1f},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x38ab, 0xff},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x55d4, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x55d5, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x55d6, 0x07},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x55d7, 0xff},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x55e8, 0x07},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x55e9, 0xff},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x55ea, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x55eb, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x575c, 0x07},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x575d, 0xff},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x575e, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x575f, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5764, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5765, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5766, 0x07},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5767, 0xff},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5974, 0x04},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5975, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f10, 0x09},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f11, 0x92},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f12, 0x32},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f13, 0x72},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f14, 0x16},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f15, 0xba},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f17, 0x13},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f18, 0x24},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f19, 0x60},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f1a, 0xe3},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f1b, 0xad},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f1c, 0x74},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f2d, 0x25},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5f5c, 0xd0},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x6a22, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x6a23, 0x1d},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x7ba8, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x7ba9, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x886b, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9002, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9004, 0x1a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9214, 0x93},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9215, 0x69},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9216, 0x93},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9217, 0x6b},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9218, 0x93},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9219, 0x6d},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x921a, 0x57},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x921b, 0x58},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x921c, 0x57},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x921d, 0x59},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x921e, 0x57},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x921f, 0x5a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9220, 0x57},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9221, 0x5b},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9222, 0x93},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9223, 0x02},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9224, 0x93},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9225, 0x03},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9226, 0x93},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9227, 0x04},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9228, 0x93},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9229, 0x05},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x922a, 0x98},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x922b, 0x21},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x922c, 0xb2},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x922d, 0xdb},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x922e, 0xb2},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x922f, 0xdc},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9230, 0xb2},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9231, 0xdd},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9232, 0xe2},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9233, 0xe1},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9234, 0xb2},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9235, 0xe2},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9236, 0xb2},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9237, 0xe3},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9238, 0xb7},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9239, 0xb9},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x923a, 0xb7},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x923b, 0xbb},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x923c, 0xb7},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x923d, 0xbc},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x923e, 0xb7},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x923f, 0xc5},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9240, 0xb7},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9241, 0xc7},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9242, 0xb7},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9243, 0xc9},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9244, 0x98},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9245, 0x56},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9246, 0x98},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9247, 0x55},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9380, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9381, 0x62},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9382, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9383, 0x56},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9384, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9385, 0x52},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9388, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x9389, 0x55},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x938a, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x938b, 0x55},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x938c, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x938d, 0x41},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x5078, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0112, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0113, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0114, 0x03},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0342, 0x11},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0343, 0xa0},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0340, 0x0d},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0341, 0xda},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3210, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0344, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0345, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0346, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0347, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0348, 0x0f},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0349, 0xd7},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x034a, 0x0b},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x034b, 0xdf},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x00e3, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x00e4, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x00e5, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x00fc, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x00fd, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x00fe, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x00ff, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0xe013, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0220, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0221, 0x11},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0381, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0383, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0385, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0387, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0900, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0901, 0x11},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0902, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3140, 0x02},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3241, 0x11},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3250, 0x03},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3e10, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3e11, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3f0d, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3f42, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3f43, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0401, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0404, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0405, 0x10},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0408, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0409, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x040a, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x040b, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x040c, 0x0f},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x040d, 0xd8},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x040e, 0x0b},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x040f, 0xe0},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x034c, 0x0f},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x034d, 0xd8},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x034e, 0x0b},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x034f, 0xe0},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0301, 0x05},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0303, 0x02},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0305, 0x04},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0306, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0307, 0xc8},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0309, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x030b, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x030d, 0x02},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x030e, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x030f, 0x5e},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0310, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0820, 0x12},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0821, 0xc0},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0822, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0823, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3e20, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3e37, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3f50, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3f56, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3f57, 0xe2},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c0a, 0x5a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c0b, 0x55},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c0c, 0x28},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c0d, 0x07},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c0e, 0xff},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c0f, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c10, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c11, 0x02},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c12, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c13, 0x03},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c14, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c15, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c16, 0x0c},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c17, 0x0c},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c18, 0x0c},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c19, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c1a, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c1b, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c1c, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c1d, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c1e, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c1f, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c20, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c21, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c22, 0x3f},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3c23, 0x0a},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3e35, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3f4a, 0x03},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3f4b, 0xbf},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x3f26, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0202, 0x0d},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0203, 0xc4},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0204, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0205, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x020e, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x020f, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0210, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0211, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0212, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0213, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0214, 0x01},=0A=
> -=A0=A0=A0=A0=A0=A0 {0x0215, 0x00},=0A=
> -=A0=A0=A0=A0=A0=A0 {0xbcf1, 0x00},=0A=
> +static const struct cci_reg_sequence mode_4056x3040_regs[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0136), 0x18 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0137), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c7e), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c7f), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38a8), 0x1f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38a9), 0xff },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38aa), 0x1f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x38ab), 0xff },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x55d4), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x55d5), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x55d6), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x55d7), 0xff },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x55e8), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x55e9), 0xff },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x55ea), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x55eb), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x575c), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x575d), 0xff },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x575e), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x575f), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5764), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5765), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5766), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5767), 0xff },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5974), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5975), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f10), 0x09 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f11), 0x92 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f12), 0x32 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f13), 0x72 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f14), 0x16 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f15), 0xba },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f17), 0x13 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f18), 0x24 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f19), 0x60 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f1a), 0xe3 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f1b), 0xad },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f1c), 0x74 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f2d), 0x25 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5f5c), 0xd0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x6a22), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x6a23), 0x1d },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x7ba8), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x7ba9), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x886b), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9002), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9004), 0x1a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9214), 0x93 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9215), 0x69 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9216), 0x93 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9217), 0x6b },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9218), 0x93 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9219), 0x6d },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x921a), 0x57 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x921b), 0x58 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x921c), 0x57 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x921d), 0x59 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x921e), 0x57 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x921f), 0x5a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9220), 0x57 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9221), 0x5b },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9222), 0x93 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9223), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9224), 0x93 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9225), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9226), 0x93 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9227), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9228), 0x93 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9229), 0x05 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x922a), 0x98 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x922b), 0x21 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x922c), 0xb2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x922d), 0xdb },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x922e), 0xb2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x922f), 0xdc },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9230), 0xb2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9231), 0xdd },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9232), 0xe2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9233), 0xe1 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9234), 0xb2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9235), 0xe2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9236), 0xb2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9237), 0xe3 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9238), 0xb7 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9239), 0xb9 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x923a), 0xb7 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x923b), 0xbb },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x923c), 0xb7 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x923d), 0xbc },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x923e), 0xb7 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x923f), 0xc5 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9240), 0xb7 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9241), 0xc7 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9242), 0xb7 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9243), 0xc9 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9244), 0x98 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9245), 0x56 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9246), 0x98 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9247), 0x55 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9380), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9381), 0x62 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9382), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9383), 0x56 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9384), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9385), 0x52 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9388), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x9389), 0x55 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x938a), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x938b), 0x55 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x938c), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x938d), 0x41 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5078), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0112), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0113), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0114), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0342), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0343), 0xa0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0340), 0x0d },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0341), 0xda },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3210), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0344), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0345), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0346), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0347), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0348), 0x0f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0349), 0xd7 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x034a), 0x0b },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x034b), 0xdf },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x00e3), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x00e4), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x00e5), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x00fc), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x00fd), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x00fe), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x00ff), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xe013), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0220), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0221), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0381), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0383), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0385), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0387), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0900), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0901), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0902), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3140), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3241), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3250), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3e10), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3e11), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f0d), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f42), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f43), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0401), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0404), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0405), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0408), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0409), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x040a), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x040b), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x040c), 0x0f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x040d), 0xd8 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x040e), 0x0b },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x040f), 0xe0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x034c), 0x0f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x034d), 0xd8 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x034e), 0x0b },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x034f), 0xe0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0301), 0x05 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0303), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0305), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0306), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0307), 0xc8 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0309), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x030b), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x030d), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x030e), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x030f), 0x5e },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0310), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0820), 0x12 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0821), 0xc0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0822), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0823), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3e20), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3e37), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f50), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f56), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f57), 0xe2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c0a), 0x5a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c0b), 0x55 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c0c), 0x28 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c0d), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c0e), 0xff },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c0f), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c10), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c11), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c12), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c13), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c14), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c15), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c16), 0x0c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c17), 0x0c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c18), 0x0c },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c19), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c1a), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c1b), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c1c), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c1d), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c1e), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c1f), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c20), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c21), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c22), 0x3f },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3c23), 0x0a },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3e35), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f4a), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f4b), 0xbf },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3f26), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0202), 0x0d },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0203), 0xc4 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0204), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0205), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x020e), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x020f), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0210), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0211), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0212), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0213), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0214), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0215), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xbcf1), 0x00 },=0A=
> =A0};=0A=
>=0A=
> =A0/* Supported sensor mode configurations */=0A=
> @@ -417,97 +410,6 @@ static inline struct imx412 *to_imx412(struct v4l2_s=
ubdev *subdev)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 return container_of(subdev, struct imx412, sd);=
=0A=
> =A0}=0A=
>=0A=
> -/**=0A=
> - * imx412_read_reg() - Read registers.=0A=
> - * @imx412: pointer to imx412 device=0A=
> - * @reg: register address=0A=
> - * @len: length of bytes to read. Max supported bytes is 4=0A=
> - * @val: pointer to register value to be filled.=0A=
> - *=0A=
> - * Return: 0 if successful, error code otherwise.=0A=
> - */=0A=
> -static int imx412_read_reg(struct imx412 *imx412, u16 reg, u32 len, u32 =
*val)=0A=
> -{=0A=
> -=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(&im=
x412->sd);=0A=
> -=A0=A0=A0=A0=A0=A0 struct i2c_msg msgs[2] =3D {0};=0A=
> -=A0=A0=A0=A0=A0=A0 u8 addr_buf[2] =3D {0};=0A=
> -=A0=A0=A0=A0=A0=A0 u8 data_buf[4] =3D {0};=0A=
> -=A0=A0=A0=A0=A0=A0 int ret;=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 if (WARN_ON(len > 4))=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 put_unaligned_be16(reg, addr_buf);=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 /* Write register address */=0A=
> -=A0=A0=A0=A0=A0=A0 msgs[0].addr =3D client->addr;=0A=
> -=A0=A0=A0=A0=A0=A0 msgs[0].flags =3D 0;=0A=
> -=A0=A0=A0=A0=A0=A0 msgs[0].len =3D ARRAY_SIZE(addr_buf);=0A=
> -=A0=A0=A0=A0=A0=A0 msgs[0].buf =3D addr_buf;=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 /* Read data from register */=0A=
> -=A0=A0=A0=A0=A0=A0 msgs[1].addr =3D client->addr;=0A=
> -=A0=A0=A0=A0=A0=A0 msgs[1].flags =3D I2C_M_RD;=0A=
> -=A0=A0=A0=A0=A0=A0 msgs[1].len =3D len;=0A=
> -=A0=A0=A0=A0=A0=A0 msgs[1].buf =3D &data_buf[4 - len];=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZ=
E(msgs));=0A=
> -=A0=A0=A0=A0=A0=A0 if (ret !=3D ARRAY_SIZE(msgs))=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EIO;=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 *val =3D get_unaligned_be32(data_buf);=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 return 0;=0A=
> -}=0A=
> -=0A=
> -/**=0A=
> - * imx412_write_reg() - Write register=0A=
> - * @imx412: pointer to imx412 device=0A=
> - * @reg: register address=0A=
> - * @len: length of bytes. Max supported bytes is 4=0A=
> - * @val: register value=0A=
> - *=0A=
> - * Return: 0 if successful, error code otherwise.=0A=
> - */=0A=
> -static int imx412_write_reg(struct imx412 *imx412, u16 reg, u32 len, u32=
 val)=0A=
> -{=0A=
> -=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(&im=
x412->sd);=0A=
> -=A0=A0=A0=A0=A0=A0 u8 buf[6] =3D {0};=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 if (WARN_ON(len > 4))=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 put_unaligned_be16(reg, buf);=0A=
> -=A0=A0=A0=A0=A0=A0 put_unaligned_be32(val << (8 * (4 - len)), buf + 2);=
=0A=
> -=A0=A0=A0=A0=A0=A0 if (i2c_master_send(client, buf, len + 2) !=3D len + =
2)=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EIO;=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 return 0;=0A=
> -}=0A=
> -=0A=
> -/**=0A=
> - * imx412_write_regs() - Write a list of registers=0A=
> - * @imx412: pointer to imx412 device=0A=
> - * @regs: list of registers to be written=0A=
> - * @len: length of registers array=0A=
> - *=0A=
> - * Return: 0 if successful, error code otherwise.=0A=
> - */=0A=
> -static int imx412_write_regs(struct imx412 *imx412,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 const struct imx412_reg *regs, u32 len)=0A=
> -{=0A=
> -=A0=A0=A0=A0=A0=A0 unsigned int i;=0A=
> -=A0=A0=A0=A0=A0=A0 int ret;=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < len; i++) {=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D imx412_write_reg(imx4=
12, regs[i].address, 1, regs[i].val);=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n ret;=0A=
> -=A0=A0=A0=A0=A0=A0 }=0A=
> -=0A=
> -=A0=A0=A0=A0=A0=A0 return 0;=0A=
> -}=0A=
> -=0A=
> =A0/**=0A=
> =A0 * imx412_update_controls() - Update control ranges based on streaming=
 mode=0A=
> =A0 * @imx412: pointer to imx412 device=0A=
> @@ -543,29 +445,25 @@ static int imx412_update_controls(struct imx412 *im=
x412,=0A=
> =A0static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure,=
 u32 gain)=0A=
> =A0{=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 u32 lpfr;=0A=
> -=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret_hold;=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 lpfr =3D imx412->vblank + imx412->cur_mode->heig=
ht;=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 dev_dbg(imx412->dev, "Set exp %u, analog gain %u=
, lpfr %u\n",=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure, gain, lpfr);=
=0A=
>=0A=
> -=A0=A0=A0=A0=A0=A0 ret =3D imx412_write_reg(imx412, IMX412_REG_HOLD, 1, =
1);=0A=
> -=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 cci_write(imx412->cci, IMX412_REG_HOLD, 1, &ret);=0A=
>=0A=
> -=A0=A0=A0=A0=A0=A0 ret =3D imx412_write_reg(imx412, IMX412_REG_LPFR, 2, =
lpfr);=0A=
> -=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_release_group_hold=
;=0A=
> +=A0=A0=A0=A0=A0=A0 cci_write(imx412->cci, IMX412_REG_LPFR, lpfr, &ret);=
=0A=
>=0A=
> -=A0=A0=A0=A0=A0=A0 ret =3D imx412_write_reg(imx412, IMX412_REG_EXPOSURE_=
CIT, 2, exposure);=0A=
> -=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto error_release_group_hold=
;=0A=
> +=A0=A0=A0=A0=A0=A0 cci_write(imx412->cci, IMX412_REG_EXPOSURE_CIT, expos=
ure, &ret);=0A=
>=0A=
> -=A0=A0=A0=A0=A0=A0 ret =3D imx412_write_reg(imx412, IMX412_REG_AGAIN, 2,=
 gain);=0A=
> +=A0=A0=A0=A0=A0=A0 cci_write(imx412->cci, IMX412_REG_AGAIN, gain, &ret);=
=0A=
>=0A=
> -error_release_group_hold:=0A=
> -=A0=A0=A0=A0=A0=A0 imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 0);=0A=
> +=A0=A0=A0=A0=A0=A0 ret_hold =3D cci_write(imx412->cci, IMX412_REG_HOLD, =
0, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret_hold)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret_hold;=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> =A0}=0A=
> @@ -800,8 +698,8 @@ static int imx412_start_streaming(struct imx412 *imx4=
12)=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 /* Write sensor mode registers */=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 reg_list =3D &imx412->cur_mode->reg_list;=0A=
> -=A0=A0=A0=A0=A0=A0 ret =3D imx412_write_regs(imx412, reg_list->regs,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 reg_list->num_of_regs);=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_multi_reg_write(imx412->cci, reg_list->re=
gs,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 reg_list->num_of_regs, NULL);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(imx412->dev, "fa=
il to write initial registers\n");=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> @@ -818,8 +716,8 @@ static int imx412_start_streaming(struct imx412 *imx4=
12)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 usleep_range(7400, 8000);=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 /* Start streaming */=0A=
> -=A0=A0=A0=A0=A0=A0 ret =3D imx412_write_reg(imx412, IMX412_REG_MODE_SELE=
CT,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 1, IMX412_MODE_STREAMING);=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(imx412->cci, IMX412_REG_MODE_SELECT=
,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IMX41=
2_MODE_STREAMING, NULL);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(imx412->dev, "fa=
il to start streaming\n");=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> @@ -836,8 +734,8 @@ static int imx412_start_streaming(struct imx412 *imx4=
12)=0A=
> =A0 */=0A=
> =A0static int imx412_stop_streaming(struct imx412 *imx412)=0A=
> =A0{=0A=
> -=A0=A0=A0=A0=A0=A0 return imx412_write_reg(imx412, IMX412_REG_MODE_SELEC=
T,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 1, IMX412_MODE_STANDBY);=0A=
> +=A0=A0=A0=A0=A0=A0 return cci_write(imx412->cci, IMX412_REG_MODE_SELECT,=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IM=
X412_MODE_STANDBY, NULL);=0A=
> =A0}=0A=
>=0A=
> =A0/**=0A=
> @@ -888,16 +786,18 @@ static int imx412_set_stream(struct v4l2_subdev *sd=
, int enable)=0A=
> =A0static int imx412_detect(struct imx412 *imx412)=0A=
> =A0{=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
> -=A0=A0=A0=A0=A0=A0 u32 val;=0A=
> +=A0=A0=A0=A0=A0=A0 u64 val;=0A=
>=0A=
> -=A0=A0=A0=A0=A0=A0 ret =3D imx412_read_reg(imx412, IMX412_REG_ID, 2, &va=
l);=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_read(imx412->cci, IMX412_REG_ID, &val, NU=
LL);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(imx412->=
dev, ret,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to read chip id %x\n",=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IMX412_ID);=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 if (val !=3D IMX412_ID) {=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(imx412->dev, "chip id=
 mismatch: %x!=3D%x\n",=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IMX41=
2_ID, val);=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENXIO;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(imx412->=
dev, -ENODEV,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "chip id mismatch: %x!=3D%llx",=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IMX412_ID, val);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> @@ -1180,6 +1080,11 @@ static int imx412_probe(struct i2c_client *client)=
=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 if (!name)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENODEV;=0A=
>=0A=
> +=A0=A0=A0=A0=A0=A0 imx412->cci =3D devm_cci_regmap_init_i2c(client, 16);=
=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(imx412->cci))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(imx412->=
dev, PTR_ERR(imx412->cci),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Failed to init CCI\n");=0A=
> +=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 /* Initialize subdev */=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 v4l2_i2c_subdev_init(&imx412->sd, client, &imx41=
2_subdev_ops);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 imx412->sd.internal_ops =3D &imx412_internal_ops=
;=0A=
> --=0A=
> 2.34.1=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=0A=

