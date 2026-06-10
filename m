Return-Path: <linux-media+bounces-64378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m3KDEhsaKWqjQgMAu9opvQ
	(envelope-from <linux-media+bounces-64378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:02:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A0C666E2A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:02:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siliconsignals.io header.s=selector1 header.b=QICyM+75;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64378-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64378-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=siliconsignals.io;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2082A302305D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 07:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250CD394793;
	Wed, 10 Jun 2026 07:58:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021142.outbound.protection.outlook.com [40.107.57.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3528381AE0
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 07:57:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078280; cv=fail; b=e+iqZAJRL+Jp4/uanmhY+VcKwEOHsU1HqVnRAmsjbwQbF22rG6w1RD/0wiGnfgkvVQlnrtw+U9r/wH8XEmREGU2845Y2EOLMBX74OxjYDnECSB//wxYA6QPT0zG9lK4a1P8WhMk2AA5L54x+8/n+AmIRcaoxOAU4AzC5sN1qoFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078280; c=relaxed/simple;
	bh=1Icafuz9gswyozqZuwVbaeLP88AXLtD7za8b2AttdSo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eisu8QWyKScLn/bVeVxOeV6ORfh3Jq+xlbQIkwuIE5o4Gg8z0W8mXDRFBtCsOu0ySGu5Lvzd3NyQ/RyhpNXYyY24rkEJJHXv0oZc6pGl+P8Ugr3Hhq9zR6yGVuj4nvGd8mRb0ZzTgLfbzWYmDq/Scncy21+jXK+GrBj9Swt0HFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=QICyM+75; arc=fail smtp.client-ip=40.107.57.142
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0jR0nJwDby3zDK3fwDzfUTNie+NAX3tAY2H/TQLlzMxx5yz02WNNjPQM1bDIJ3ndrO+RsdCdPB+ek+QClFgJRyXpozZ+F27W4fCyiaIt9UAJQBCv1ChhfYfYTbvsLR9xO+F1BAFrUTSUn+GpVun4T/tUl7GkRyaVHrN2Y0yv6t86vWGoDUEtEd+8rwbzXPgtGcXnArW+1T2uBh8CborNNEO4INZ6dssPE7pYmcyqKCizcfgHMoA9u0hW97YogRnApfLBF/pNxjs5rtNpdS/lww4EqMMoYLeZgcMWLW9MeWBK2u+tqDBobCJThlXrn27WvCvIRqd5bjv7ltDCfiZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xlw/Q1/XElsdjVefB7eowpSx9QP+6Js+E4VUqLkZYNs=;
 b=MEKeJruT5ziwA2ESV5QTxPFHNSNg7bYCDUTHKO2R5wz4Aarm1QPhh1GHvgfjkG278fPckj0s7r+T2tfjHnCCX0E3iR3ey94h/0qzdk2mLagR44YytsQxM4LCnQVwq9IuGsGOMiuCFsf+58yGJfL7qpYkfNjD3AsBEEVBPVqQxnx5G1YT2Dm1U798vkIb4/YnQsRowY/LE88erdcwmwIFnNAHM9bXUbOm8VtHpzwRfK74Lcjxi2SHUndabXHZcs8ai+TBHdpX40mW+zc4dAjAnk7MqrIFYKt3sIY7CW502Q0WOXW5w9qO+QNNk7zvvg6ljkL1V9Hkux7v0yFkHiZ4ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xlw/Q1/XElsdjVefB7eowpSx9QP+6Js+E4VUqLkZYNs=;
 b=QICyM+75Q4I7SD3c9MF3hVkl6e5ptd1MuywfIlKp9g/2HCRQW6CaZ4/sb0o2XcxbONlu5SOsF2DKTXdiBflhEGsCmaS98dQypPvkwlkAoUojqYJch5sMyHqcGvzqnnSqRjcyTjhpZEXOrHp+MQvXvTPP+sOevAuD9GMFlHnLdELpgHnGhnbTWIU3LUmnzdal7iR3PSRZE8O6wdJ0EoStSkqq0LKnhEEsmlJJl3Zb6UVF/6YoyK784/F9XSZl9uxMnN97j7kCzP+pW4gUXAEIFehdnxfVspILkOcOb0wWNccxCKPtfsHAlSluO86FIOUoEkSEKDDIQwmjukkaX528kg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN6P287MB5010.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:302::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 07:57:54 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 07:57:54 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2] media: i2c: imx219: Fix PIXEL_RATE for special binning
 mode
Thread-Topic: [PATCH v2] media: i2c: imx219: Fix PIXEL_RATE for special
 binning mode
Thread-Index: AQHc+KZxCn3nbvW9f06DqCN3iFmDvrY3aQQQ
Date: Wed, 10 Jun 2026 07:57:54 +0000
Message-ID:
 <PN3P287MB1829E36CF8A24535254A09D78B1A2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260610-imx219-pixelrate-v2-1-45d1d201cd6b@ideasonboard.com>
In-Reply-To: <20260610-imx219-pixelrate-v2-1-45d1d201cd6b@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN6P287MB5010:EE_
x-ms-office365-filtering-correlation-id: 8c5172f0-0fb8-40e8-5e9c-08dec6c5fa67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|5023799004|18002099003|3023799007|6133799003|22082099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 D8DQOBaV8M6vPB9m9RxWALhhLKHgi4L0M2d6U0+2A21016HTFacOYFj7BQiOaRfvNXMCmUhhqxOpauoo2cz8Q+2nTrRI8CEtCEnPjCs0t1Aj+8TM9DQpc9vNIbqw+XBo7+YwF9QnCszejh9zjAAaqx+AOu5fqeOz+ZmYKPzpL497LC6zK0XZyGjszvWZbjWKJGxY0E+cmX5zvDvmnkAtFAF3H2/5kBLZy0v1jz56jZrJ0zY25P/RtcxvHPF5nWNoIrJ5niut2rKu4SGW1R99UstQiPDEymw57v2hlILUq6dvMv0Hig5uApFmRBv7wJqJrBTxQE+8PwSq9jg37+FGq4dfc8h3zy5lFlNf30JSU3MtMofTwP3AhfdP/LPT3t/LG1woQQvPLtKuz+wWMR14ftEkZeWWTvK0T6Qg/GCmllWTfqD05wmjK7OT9N/VhmIC4r3yqzhTzy8XQJy4KvgVWidfQ6mz+f9Zx5eGl/t+cMKBkZKvPbdwAsDfIOixzk+tXZwlmdYD58XPxAHhTcBhkeHDpmr361T8qD1NpAoKjSkFz2/l5iTZtv/fT1i9vWl2LrZ58rWQ9noR7l8GT/I/eoq0xtyJGA0OaQjR8rNMvwDBgC8vnRgYfSZqufkHOouIy5cBOpfk+LCl0TQpfWm6gbtKciMACz77eLAebo7Y0IZZvtNNYg5HFvhzlFwpzbprZa2Qd+3il67FsxbGRb/ogzFodBgyGMQyedfe6sp/Mxj7eDBwBmVdZ8sh4hyUGBw5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(5023799004)(18002099003)(3023799007)(6133799003)(22082099003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3sVOHcjtT0YBXAHv449OYz3JbUkKk6J7A3PvwmXv4ohbSiT20P0KJbda9F?=
 =?iso-8859-1?Q?LKavsohGLasD+jEkyYGe05JsDKo07FsAwx8hT9TNTs9nzUCZMfPVmqqLKc?=
 =?iso-8859-1?Q?OBr+AwUH/YRcHY13aEESCBW0ZQNzsfbeE3ZxNnIHwpnZCQlEtv1pNWfEPP?=
 =?iso-8859-1?Q?CZfvYN9pRDNsEnFW8//hAI9Jemc1Iryh8RbANcQkF/1xQf/y6wg4WdDv+r?=
 =?iso-8859-1?Q?os3izkjRN9q54qC7azvZCMk35krCaK3LyXO6/7R6ytXgLeDRAab8huAxSz?=
 =?iso-8859-1?Q?IQXE84IAHqNYlAVjtaeF3Lt7Vg+wwd2Qu+k+9qUmN1f3+7UyRwMh/Hmwfs?=
 =?iso-8859-1?Q?y4LLiXPFDAdsCo6qC9q/m3kLTk1R8uhqxjPmaApB9zEDIoA2egzVLE6uyO?=
 =?iso-8859-1?Q?fZYVUOc5h0MjEwGQSzGmrlkz/c2H6h+ng40mKRoYjJajnAGPBwZISlYfzD?=
 =?iso-8859-1?Q?5CNio4xXN45wbrjSrf4d6vg1e7IWMdmxqyP0RTzwhJnUf0lgh8qr55lkLv?=
 =?iso-8859-1?Q?cgZrSPDCKvncIVofH6dCWERWecHo0KIf9JFQ63ybw5I+ATei7R8ROQc3CL?=
 =?iso-8859-1?Q?5ZJM5FLLzcbFtdXMTCAPJZWmM3L3N3RwFD0LDlsQv5sPP3vVxHv+OyDBUC?=
 =?iso-8859-1?Q?4ZkzpAZV5R4BhytOmMQCJpUDlk1ZNGcHL4Y9HB5GSNyAXDfF2/DkahcFGO?=
 =?iso-8859-1?Q?+DkF3Ev6nPVtkD/oDNatItb+UrCv/Zs51feO7THMgOS5FVeAKmYjyYLeqS?=
 =?iso-8859-1?Q?WxQL6GqO9U3CahnxwUBDj0CbbcFfWtgW9bI4Q9WW6yTqik8WeIYuYLYN1n?=
 =?iso-8859-1?Q?y0RHxVM1q/Z8UBH8aKx6g3MQ8MmvxXma2nzyWgTDVq+5DueZmYuSsMJhJv?=
 =?iso-8859-1?Q?+5Wo4P4ViFzbOCksBnnlMCjcAP3vUOVjmoc6aE346Ke8aFFuw/B3CWUf7W?=
 =?iso-8859-1?Q?YDH8ylWcNLcuhwqnWE6cjhiD5e9tgw/1+s0MrDNlg70AexM+Tq2DN2QZ51?=
 =?iso-8859-1?Q?IcAKoEno4/6kABxcE1mSFSJ2VVdmqg5af0g1cdNEtp+hUhFEGIdQ35d2/F?=
 =?iso-8859-1?Q?iE6QEJdrDEJwPBr8tPnih9Ad/IZHl4KLcWpnQsAxYZbywMUWe66+5Z7U9s?=
 =?iso-8859-1?Q?4qKRWkZl6L1ME55lip5po4liRbZmsVkx/B8u/r1i29Ze185GCrnmhJeER8?=
 =?iso-8859-1?Q?w+xlC3Wa9IHVp4yLJ/OegUP6e3QhuDBNquL1eHyUuAn8F4IpWHvDlk+nm2?=
 =?iso-8859-1?Q?BvYORJr+qTEQC3kDOnznNeqZKMZRXmcWHQTt7NBzODiwGqGfk+JnSD0hmJ?=
 =?iso-8859-1?Q?PzPhUCxyzcuicoAeyr5obcdmJqfvT5cr35aEcgil3p1Vz0+PQAPn6cmQpC?=
 =?iso-8859-1?Q?nWaxOmAwKyhp2jZk14JrbrWCpQqhJAfJrC6SyQys0szmgkf6rastv7mua4?=
 =?iso-8859-1?Q?tgrGpYn01uY63Jkupql1v29XHKrBrI3Wy+dnD4UTUozN5Vb95Iu9Z7z8yx?=
 =?iso-8859-1?Q?k16kxFmS0UJ0WV8Ebq0opfm862fxMFDG9VxqRJN3zxlt91IbbxDDABoFyR?=
 =?iso-8859-1?Q?xFiHBUO14SAbDpsAkSEmr14TZYPrPyPOozEPnvidmeVU6hrrZqmfMoQdyh?=
 =?iso-8859-1?Q?lSniJ7FKDuQqK4zHotJumH4YVuvGsjC+lQrvGak/yx1Rrnj0QDDNoCVtbW?=
 =?iso-8859-1?Q?3RSLJuVJqdvwDCEFXXhDiHJ3Mnwuk1FezjxC+pcKsnq8UazfL39TXG3ckC?=
 =?iso-8859-1?Q?JyMMbZWVe9J2tPhtzHeZOxoIrEin9pwOG4P2WF8qDMxYWgHZ6pA0wFROit?=
 =?iso-8859-1?Q?i3sB3PtF2Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5172f0-0fb8-40e8-5e9c-08dec6c5fa67
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 07:57:54.4759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E44zxRG0aVB0j14hXi3/xpywaMrnjol03d3bAa6DpHu+5REXszO0pOGoW4ouz0QgAZIcpCj0t6rr+G51qeXtn7h7f0LZCKyqPr3vlwXCQqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5010
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64378-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[dave.stevenson.raspberrypi.com:query timed out,linux-media@vger.kernel.org:query timed out,tarang.raval@siliconsignals.io:query timed out];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07A0C666E2A

Hi Jai,=0A=
=0A=
> When using the special analog binning mode the sensor requires the frame=
=0A=
> length to be programmed in units of 2xLines, but it still produces the=0A=
> same number of lines overall.=0A=
>=0A=
> Earlier we used to double the pixel rate reported to userspace, to avoid=
=0A=
> negative values for the vertical blanking control. But in the new raw=0A=
> sensor model, we have to expose the sensor's frame length and line=0A=
> length directly to the userspace through new controls, which requires we=
=0A=
> keep the pixel rate value the same.=0A=
>=0A=
> There is sufficient range available in the line length register, so we=0A=
> can halve the value computed and passed to userspace as V4L2_CID_HBLANK=
=0A=
> instead, and thereby keep the same pixel rate.=0A=
>=0A=
> Whether the new controls for frame length and line length should also=0A=
> scale similarly to give userspace a consistent view, as opposed to the=0A=
> sensor's awkward register programming model, is left as a decision for=0A=
> later.=0A=
>=0A=
> While at it, also drop the pixel_rate member from struct imx219 as we no=
=0A=
> longer access or modify it. And simplify the hblank computation during=0A=
> mode changes to default to the minimum value instead of trying to retain=
=0A=
> the old line length. That would be unnecessarily complicated, and most=0A=
> applications anyway modify the blankings freely to achieve their desired=
=0A=
> framerate.=0A=
>=0A=
> Link: https://lore.kernel.org/all/178091757893.16054.4583389270412251379@=
freya/=0A=
> Link: https://lore.kernel.org/all/20260409201501.975242-65-sakari.ailus@l=
inux.intel.com/=0A=
> Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>=0A=
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>=0A=
> ---=0A=
> This is a follow-up to the discussion done on Sakari's proposed fix for=
=0A=
> the same issue:=0A=
> https://lore.kernel.org/all/178091466607.16054.13972332068848565738@freya=
/=0A=
>=0A=
> Tested on Raspberry Pi 5 with libcamera, which can still hit the same=0A=
> FPS ranges as before for both binned and non-binned modes.=0A=
> ---=0A=
> Changes in v2:=0A=
> - Set vblank step size to fll_factor=0A=
> - Drop pixel_rate variable as we don't scale it anymore=0A=
> - Use variables for new hblank and hblank_max values in set_pad_format=0A=
> - Fix commit message and code comments with Dave's suggestions=0A=
> - Set hblank to default value on mode change as opposed to retaining the=
=0A=
>   LLP value set by user (Dave, I've kept your Tested-by, but please feel=
=0A=
>                          free to drop it if you disagree)=0A=
> - Link to v1: https://lore.kernel.org/r/20260609-imx219-pixelrate-v1-1-02=
359def6b41@ideasonboard.com=0A=
> ---=0A=
>  drivers/media/i2c/imx219.c | 104 ++++++++++++++++++++++++++-------------=
------=0A=
>  1 file changed, 61 insertions(+), 43 deletions(-)=0A=
>=0A=
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c=0A=
> index 7da02ce5da15..ec65349e63f9 100644=0A=
> --- a/drivers/media/i2c/imx219.c=0A=
> +++ b/drivers/media/i2c/imx219.c=0A=
> @@ -348,7 +348,6 @@ struct imx219 {=0A=
>=0A=
>         struct v4l2_ctrl_handler ctrl_handler;=0A=
>         /* V4L2 Controls */=0A=
> -       struct v4l2_ctrl *pixel_rate;=0A=
>         struct v4l2_ctrl *link_freq;=0A=
>         struct v4l2_ctrl *exposure;=0A=
>         struct v4l2_ctrl *vflip;=0A=
> @@ -420,7 +419,30 @@ static void imx219_get_binning(struct v4l2_subdev_st=
ate *state, u8 *bin_h,=0A=
>=0A=
>  }=0A=
>=0A=
> -static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state=
)=0A=
> +/*=0A=
> + * When using the special binning mode the sensor requires the FRAME_LEN=
GTH to=0A=
> + * be programmed in units of 2xLines, but it still outputs the same numb=
er of=0A=
> + * lines overall.=0A=
> + *=0A=
> + * FRAME_LENGTH =3D (output height + vblank) / 2=0A=
> + *=0A=
> + * If we go ahead with it and set `vblank =3D FRAME_LENGTH - height` it =
would=0A=
> + * make the control value negative.=0A=
> + *=0A=
> + * Instead we can compensate for it in the horizontal dimension, as LINE=
_LENGTH=0A=
> + * has enough room, so both blanking values stay positive.=0A=
> + *=0A=
> + * LINE_LENGTH =3D (output width + hblank) * 2=0A=
> + *=0A=
> + * So the blanking values when using the special binning mode are:=0A=
> + *=0A=
> + * vblank =3D FRAME_LENGTH * 2 - height=0A=
> + * hblank =3D LINE_LENGTH / 2 - width=0A=
> + *=0A=
> + * where FRAME_LENGTH and LINE_LENGTH are the values programmed in the s=
ensor=0A=
> + * registers.=0A=
> + */=0A=
> +static inline u32 imx219_get_fll_factor(struct v4l2_subdev_state *state)=
=0A=
>  {=0A=
>         u8 bin_h, bin_v;=0A=
>=0A=
> @@ -440,12 +462,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)=
=0A=
>         struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);=
=0A=
>         const struct v4l2_mbus_framefmt *format;=0A=
>         struct v4l2_subdev_state *state;=0A=
> -       u32 rate_factor;=0A=
> +       u32 fll_factor;=0A=
>         int ret =3D 0;=0A=
>=0A=
>         state =3D v4l2_subdev_get_locked_active_state(&imx219->sd);=0A=
>         format =3D v4l2_subdev_state_get_format(state, 0);=0A=
> -       rate_factor =3D imx219_get_rate_factor(state);=0A=
> +       fll_factor =3D imx219_get_fll_factor(state);=0A=
>=0A=
>         if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
>                 int exposure_max, exposure_def;=0A=
> @@ -478,7 +500,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
>                 break;=0A=
>         case V4L2_CID_EXPOSURE:=0A=
>                 cci_write(imx219->regmap, IMX219_REG_EXPOSURE,=0A=
> -                         ctrl->val / rate_factor, &ret);=0A=
> +                         ctrl->val / fll_factor, &ret);=0A=
>                 break;=0A=
>         case V4L2_CID_DIGITAL_GAIN:=0A=
>                 cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,=0A=
> @@ -495,11 +517,11 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)=
=0A=
>                 break;=0A=
>         case V4L2_CID_VBLANK:=0A=
>                 cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,=0A=
> -                         (format->height + ctrl->val) / rate_factor, &re=
t);=0A=
> +                         (format->height + ctrl->val) / fll_factor, &ret=
);=0A=
>                 break;=0A=
>         case V4L2_CID_HBLANK:=0A=
>                 cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,=0A=
> -                         format->width + ctrl->val, &ret);=0A=
> +                         (format->width + ctrl->val) * fll_factor, &ret)=
;=0A=
>                 break;=0A=
>         case V4L2_CID_TEST_PATTERN_RED:=0A=
>                 cci_write(imx219->regmap, IMX219_REG_TESTP_RED,=0A=
> @@ -555,11 +577,10 @@ static int imx219_init_controls(struct imx219 *imx2=
19)=0A=
>                 return ret;=0A=
>=0A=
>         /* By default, PIXEL_RATE is read only */=0A=
> -       imx219->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_=
ops,=0A=
> -                                              V4L2_CID_PIXEL_RATE,=0A=
> -                                              imx219_get_pixel_rate(imx2=
19),=0A=
> -                                              imx219_get_pixel_rate(imx2=
19), 1,=0A=
> -                                              imx219_get_pixel_rate(imx2=
19));=0A=
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops, V4L2_CID_PIXEL_RAT=
E,=0A=
> +                         imx219_get_pixel_rate(imx219),=0A=
> +                         imx219_get_pixel_rate(imx219), 1,=0A=
> +                         imx219_get_pixel_rate(imx219));=0A=
>=0A=
>         imx219->link_freq =3D=0A=
>                 v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,=0A=
> @@ -880,15 +901,19 @@ static int imx219_set_pad_format(struct v4l2_subdev=
 *sd,=0A=
>         crop->top =3D (IMX219_NATIVE_HEIGHT - crop->height) / 2;=0A=
>=0A=
>         if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {=0A=
> -               int exposure_max;=0A=
> -               int exposure_def;=0A=
> -               int hblank, llp_min;=0A=
> -               int pixel_rate;=0A=
> +               int exposure_max, exposure_def;=0A=
> +               int llp_min, hblank, hblank_max;=0A=
> +               u32 fll_factor =3D imx219_get_fll_factor(state);=0A=
>=0A=
> -               /* Update limits and set FPS to default */=0A=
> +               /*=0A=
> +                * Update VBLANK range and default value to match the mod=
e.=0A=
> +                * Also fix the step-size to fll_factor, as we halve the =
values=0A=
> +                * before writing to the register when special binning is=
 used.=0A=
> +                */=0A=
>                 ret =3D __v4l2_ctrl_modify_range(imx219->vblank, IMX219_V=
BLANK_MIN,=0A=
> -                                              IMX219_FLL_MAX - mode->hei=
ght, 1,=0A=
> -                                              mode->fll_def - mode->heig=
ht);=0A=
> +                                              IMX219_FLL_MAX - mode->hei=
ght,=0A=
> +                                              fll_factor, mode->fll_def =
-=0A=
> +                                              mode->height);=0A=
=0A=
Do we need to update the exposure control step size to fll_factor as well?=
=0A=
=0A=
Best Regards,=0A=
Tarang=

