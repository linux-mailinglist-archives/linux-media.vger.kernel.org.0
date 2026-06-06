Return-Path: <linux-media+bounces-63998-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DUflJbDXI2pizgEAu9opvQ
	(envelope-from <linux-media+bounces-63998-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 10:17:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB764CE67
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 10:17:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siliconsignals.io header.s=selector1 header.b=feCG1Q4a;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63998-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63998-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=siliconsignals.io;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB035301FD67
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 08:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821E62F9D85;
	Sat,  6 Jun 2026 08:17:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020139.outbound.protection.outlook.com [52.101.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA9262FFC;
	Sat,  6 Jun 2026 08:17:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780733863; cv=fail; b=ubS+g09OJx69pv4W8oHelu1VGpRhlpbyIjY1f5b9SkGQ8sAad74vUuj4Y5zOk+FJ4MV6D95fdCAdxvMmmyLGC13/UR3LO2M4zO5O/gRyefrOKe+qcLcXJipf2DHYqgnOVXFsh5420qqF18rW2XMWd5+RAfq5UIst4pICdMPbVqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780733863; c=relaxed/simple;
	bh=5LDNcUlJxSf8mC+2SptOdR0k/oZFiU6rFwyHoDDHMDk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=feaMEiWsysBmrO8AzalaubHbzHqJfGBDQyvn3E9DQeqP876mYBal2v6TmMwRqodnsI/d4ePgOFGvLPWonGh+LPJMUo+2RaDUO0s6AR+TDq3ZIeijVxX66hlizD6FNRU1UAyxKuVJXMMOg9dFktbSekFYLjx6SZJlHVDAIvps4QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=feCG1Q4a; arc=fail smtp.client-ip=52.101.225.139
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNA/diolofzymRK4Z4AlwNl4m16l76Vd6QBueausZ33ePM1m0nWHKGGKgxZWBGyNcH+TGHq2vPYgYd97kkwCFytdm4iL5+/8Qa3CTI0Ir+JMp+Z8F5MGUQpd4ROJavCtkNSWc794yHG3oeeZGGpYp97NW54AyL4HLu0lwP/M5eUb4sEjXTMrXf6SBNEmSrBXlUH1/dsqhBZ48xYcAOP3LmPI/CPdkgQKDzfURFU3/+9QEM9s1D/P1IugqtKNUTMz1cWAVztUsInRhXBi4DzGChsY1dbVm3O6VFaezdMznu6mQhRKnubzsmFCkS28/1dQGG2DCa1+Ysmp8Lfpxwj+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfjSD3KApla7221lfiyh7QiQswHyumP6zF2KrmYy4jM=;
 b=V2cp1KdTupn5S83wGPciAraWR+ZOCcTFIF+k1dxOqL+yso/1ftG3nR2O5+Iu1/xWrOCVoNp0DmQOzL8sE3BvL25b9OPdEwkkAoFTQA0zGib7cQGVwfpeL/5eIWfntscDvaWSBNfkMytvIgU1WPXiDJsgQHArwtrGcJ5bXg/tAP0FdxhxQD1yCjtQG2IwgWec+NkZIKAu13S1kKGJYdjli0JCuVk1Q7MGxzwXjY+yzD1zC9mJ24HPwVpL5FK7i7PXTYUnhiT5sPIYjdphiLGy71L6wazkZvkUcFtlKcPNlQ4Asw8Ox3PIb8MXSPzG2A1JPUqVimDOTYQWnTcV2G3hOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfjSD3KApla7221lfiyh7QiQswHyumP6zF2KrmYy4jM=;
 b=feCG1Q4a4l+AfXpGU/RC1H3EQ7s+4m+BJS7NG849bMs6AhYb+bkMpJTxpI8B3JAkbRjlwH4B3mqzV7E94vNlK25p03cZwSYNO/lZ0Uxabuq4IFeOtlPx11AS7IRdgE4bUJM8AkS+9wQ2X8PhloYDgRFD51atGsZQSzVr5jZYFZDgGAWNE61A38oLTpvPwHl3AjX65F8zrXvxiUtqLfJB3LvqzHX1yzBT0ct0XWTWqEPT3XCP2VQuBVSn2oTdVXVW6ACyMoqYHT5Oo7WWgpnudbao1D3yen5Rnjo+dBpgoYp2kkc2RyAn1MjqIjSqTZda1tIud0yquODGD9nmqF0V8A==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB4451.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:191::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 08:17:36 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 08:17:36 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>
CC: Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano
	<Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Topic: [PATCH v4 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Index: AQHc9QDxR/cbdD8AmEyAZncD5gOfZLYw/V86
Date: Sat, 6 Jun 2026 08:17:36 +0000
Message-ID:
 <PN3P287MB1829593C2DF9AFF8F24A39AF8B1E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260605-imx678-v4-0-58e57c67143d@ideasonboard.com>
 <20260605-imx678-v4-2-58e57c67143d@ideasonboard.com>
In-Reply-To: <20260605-imx678-v4-2-58e57c67143d@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA5P287MB4451:EE_
x-ms-office365-filtering-correlation-id: c6482501-dc45-4814-6ac5-08dec3a41117
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|6133799003|22082099003|18002099003|3023799007|4143699003|56012099006;
x-microsoft-antispam-message-info:
 6VPthbtbELnQNsQrv0ZvcaAmF+m4sjiWhuM7rpEzUtPTgdiBEyRBQxIt6UYd3Rsbdd96oKUvXnZw/IIiGbpolaRqBT4rBqoFeWMEPbmscg4ZRcZ2dZiemkDf3isP4NT3NxXoxVsba0tAWQLLvaYO6FhwSHzxniUkC8xAmFJIgENq49ayBCFOx09gxRbX7ulfMZsWM/iRqLAJxClzAlk/ErLUo6M4V7hvY88h/GzAUOE+NRCLguOAgnQRU1r6LvkJLs0lk6L7ZAtv5TRmc2OgaecB1FmYT7w/CVb04+3Pvlxilowses9KbWv899cW2XfD1u7AZqCS46yrWrKupVJ3fARVmQJGwdzxHmx/WwPcIXN9hHtKESYSKQiE3u8fOevPRwKzGd2hX4xedPDwBU5cdSQAYGjdpYkjMrFJAdJfU7gys8pT8+BUgr4mpQRf6s5imqRvc3/mDehqhrgZDWfKSaIA0qpwiZD8hr5odft76/wuE/jihvkAVkGXg5NH74rKAjfSOOeK5i76G8p87Cy8auHyfN8Iur2DDoFkPP5MoZfgcCjBBU0OXTcuXAsr3EIjdcu6x2dAtO7mSXePwRrUf5X7pw9kfVT3t5IXEosIhiIQ+pgbIRCzASqdvlzxCyrPQBOaa4gpIY1HmKoJgqeimJy3HDXkvWUXno1xYYsL/5EpdDTx65staL1qFJLG6nUuK5V0AoTwf8jYOEZlPSXz1qh21/wmg44nxkfoisqSrekTocfTz8LYa6Gm+rUiQYEw
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(6133799003)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vlUvAKvCIfyROs9ZUhYZrmdw58AbO+6v7DgHagW2HODMEHSztolDKZGqRS?=
 =?iso-8859-1?Q?Rix5osFGgPlEhBIER1fUMg23gEt5g242VBCnY8oeuM9ocOhjFpvjNT1cNk?=
 =?iso-8859-1?Q?SIgvstA+gxpXk8tXwbd7gNdIqPqvhrWLlmNGNySGf+hGFk1cdb6up7gfJQ?=
 =?iso-8859-1?Q?1+BVlLQzkyNWzg0Qr6acG2RV+hga1QGku269J8//Zu9n3ZqO5KQMqj23kF?=
 =?iso-8859-1?Q?JNziWd8W7I3HT4/tkX1uCbplbRb1J6RfDwfL9EB7Fq4wn8x9lM2DGlyyOL?=
 =?iso-8859-1?Q?F8oJQd1ukMQ5N6mE+/PqzPJ7AP6fwWERQAy/fzzoTOC64pSklPC+nszNG9?=
 =?iso-8859-1?Q?ROuYgDzzjNlYBeA9/BXheV+uDF68DCOW60RwLr51kd4tlQFmTtfvOgRh1M?=
 =?iso-8859-1?Q?d8mCLXrnLSt9mc0nsiqM9pTRWuNxMZec0IWPNnR1epsyGpXVIc2Ftr1abl?=
 =?iso-8859-1?Q?T+Df6MMhZasJ9OrrpSA29b/IBPHt3jeAKyLF/yctejyjlZT7DpPrHYWrDE?=
 =?iso-8859-1?Q?w0JkEtuSZVWSyTBgk4r9ZXL+XmEL92xdoyTwPnBGQLFGb84PETydXOLC4N?=
 =?iso-8859-1?Q?krcndAPgI61S2YDu8AnC6VWgfrQuBzVhvSronSgV+zqU/Uou8bBMmOrQjk?=
 =?iso-8859-1?Q?Y8ymC7hV5EgGoaiEFFfI3DisyJ1yY5PXoY1f0xppcGIS76semYmTinFFsx?=
 =?iso-8859-1?Q?m/qc1Lsy0nVOONGCDxDSkHR+0i1erjFUpoIkD6Z98CPz/a9h46eKuTk72O?=
 =?iso-8859-1?Q?+QZpEriFKegISMKovzm74eq2PV7F14KE2Y4wX49IDh207V2iy9OXWVVIQG?=
 =?iso-8859-1?Q?4ahh/btUlqoADcczr7diqCEQw3gZ6qSq9Q2hTj82FjY7ydR/YMgPuk51RZ?=
 =?iso-8859-1?Q?sCdF8+XJ3g5L1TIpNKfURshAuK3Tum1FLpy+fTx61HWJX3kdai0ObNpfxh?=
 =?iso-8859-1?Q?Zt+X3ck2dbTNzZIC3FvkhawPhJnY0thDhaAdPP/rc81iSwW+v+stl8WeUg?=
 =?iso-8859-1?Q?vdFtkKdortty/2keT+oD+tZiZtiOWZm/rbU+I1vrcimEhWvd9+SLXyJBmd?=
 =?iso-8859-1?Q?DEYxkBvFGyiklwMRZNH/Kg0CeMC4NLVXZ7IcBFqITdA11R+ylXMQy+KDsZ?=
 =?iso-8859-1?Q?qh8z1VQoNM379/8su9n4YRvrh/PyQRd5xg04z+vQxiS3S3zrJh8ofTlvwi?=
 =?iso-8859-1?Q?xLGlFs90ygKbptZnD/4NCxHFsdLtFgYdNxSfgYEUZyK7VUh2OZGv5I45EA?=
 =?iso-8859-1?Q?Zu5OTG+xQ2Xz9iXVnbNGWhZF2AvkcAzCWGPmKmB+LHLuUdLMELNkjVuUBs?=
 =?iso-8859-1?Q?r9pfiv+aM47uN2wPaVUfYGtXnzZiZfUvlgp0XnzqhEvvoXHdvNQ+mNFF3l?=
 =?iso-8859-1?Q?mboJz0xTBTeW9G4sLZOi/M0esXnJE1a2jvuptO3WSYgcsYEMgeRYNyrTJ+?=
 =?iso-8859-1?Q?qQKzFN45DCp8Bfv+IEsqD1yYk95jWaugI3AKEzeQNKy4gkT3ecWbj2vo9u?=
 =?iso-8859-1?Q?LNimjAcADI7kHnoM9WG6PTHFwML9CtzInAAQE3yEY7LpG/NGSYGqXmO1Eg?=
 =?iso-8859-1?Q?c9bBXLZknGNJC4Q+1/l56GgDmfMinG74Pg5Lfj6Bx8u7WWpOUOUeGZBlQA?=
 =?iso-8859-1?Q?lDkqGCEOvvFL780f2uIu52I992WCiiSXmwPqPAsdJAFr3lagXLywlNeBSi?=
 =?iso-8859-1?Q?v6qxO4/vDEcMX5L/aGn/c12wFmG2NAK7sG1Caz4meTOnimQhIUagTHa6pM?=
 =?iso-8859-1?Q?W2jWGXZCR5u1+PjrtQUIyvRm7hqG7yYpPQ4iSakreJExx2vmLNFsaJRzzC?=
 =?iso-8859-1?Q?H3dV92Breg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c6482501-dc45-4814-6ac5-08dec3a41117
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2026 08:17:36.1800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jABGgQ3OXRG8/6syUDVgTqbBDvcBvp5i79PtVIiWEaN1j+uDl+4Xz2196q8OIaH1r9bUa+Zxpjb2bWKCDCr2UTfFWCtp2pPn/C2FR+jTSgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4451
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63998-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,willwhang.com:email,soho-enterprise.com:email,siliconsignals.io:from_mime,siliconsignals.io:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06FB764CE67

Hi Jai,=0A=
=0A=
Sorry, in my first review I missed a few minor issues listed below.=0A=
=0A=
I also noticed one major issue in the driver. Please check the comments bel=
ow.=0A=
=0A=
Other than that, the driver looks perfect.=0A=
=0A=
> Add a V4L2 subdev driver for the Sony IMX678 image sensor.=0A=
>=0A=
> IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type=0A=
> solid-state image sensor with a square pixel array and 8.40 M effective=
=0A=
> pixels.=0A=
>=0A=
> The following features are supported by this driver:=0A=
> - MIPI RAW12 output=0A=
> - Monochrome and Color (Bayer filter) variants=0A=
> - Multiple input clock frequencies=0A=
> - Multiple link frequencies=0A=
> - VBLANK and HBLANK control for variable framerate=0A=
> - VFLIP and HFLIP control for flipping readout=0A=
> - Exposure and analogue gain control=0A=
> - Test pattern control=0A=
>=0A=
> Following features are not currently supported:=0A=
> - MIPI RAW10 output=0A=
> - Pixel-perfect crop reporting, accounting for the shift-by-1 when=0A=
>   doing HFLIP/VFLIP where the sensor maintains RGGB bayer ordering=0A=
>=0A=
> Along with the ones below which depend on the new raw sensor model:=0A=
> - Embedded data stream=0A=
> - Freely configurable cropping=0A=
> - Increased framerate when cropping=0A=
> - 2x2 binning support=0A=
>=0A=
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>=0A=
=0A=
...=0A=
=0A=
> +static const u32 codes_bayer[] =3D {=0A=
> +       MEDIA_BUS_FMT_SRGGB12_1X12,=0A=
> +};=0A=
> +=0A=
> +static const u32 codes_monochrome[] =3D {=0A=
> +       MEDIA_BUS_FMT_Y12_1X12,   /* 12-bit mono */=0A=
=0A=
Above comment adds no useful information and can be dropped.=0A=
=0A=
> +};=0A=
> +=0A=
> +static const struct imx678_model_info imx678_aaqr_info =3D {=0A=
> +       .type =3D IMX678_COLOR,=0A=
> +       .codes =3D codes_bayer,=0A=
> +       .num_codes =3D ARRAY_SIZE(codes_bayer),=0A=
> +};=0A=
> +=0A=
> +static const struct imx678_model_info imx678_aamr_info =3D {=0A=
> +       .type =3D IMX678_MONOCHROME,=0A=
> +       .codes =3D codes_monochrome,=0A=
> +       .num_codes =3D ARRAY_SIZE(codes_monochrome),=0A=
> +};=0A=
> +=0A=
> +static const char * const imx678_supply_name[] =3D {=0A=
> +       "avdd",  /* Analog (3.3V) supply */=0A=
> +       "dvdd",  /* Digital Core (1.1V) supply */=0A=
> +       "ovdd",  /* IF (1.8V) supply */=0A=
> +};=0A=
> +=0A=
> +struct imx678 {=0A=
> +       struct v4l2_subdev sd;=0A=
> +       struct media_pad pad;=0A=
> +       struct regmap *cci;=0A=
> +=0A=
> +       const struct imx678_model_info *info;=0A=
> +=0A=
> +       struct clk *xclk;=0A=
> +       u32 xclk_freq;=0A=
> +=0A=
> +       /* chosen INCK_SEL register value */=0A=
> +       u8  inck_sel_val;=0A=
> +=0A=
> +       /* Link configurations */=0A=
> +       enum imx678_lanemode lane_mode;=0A=
> +       unsigned long link_freq_bitmap;=0A=
> +=0A=
> +       struct gpio_desc *reset_gpio;=0A=
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx678_supply_name=
)];=0A=
> +=0A=
> +       struct v4l2_ctrl_handler ctrl_handler;=0A=
> +=0A=
> +       /* V4L2 Controls */=0A=
> +       struct v4l2_ctrl *exposure;=0A=
> +       struct v4l2_ctrl *vblank;=0A=
> +       struct v4l2_ctrl *hblank;=0A=
> +=0A=
> +       /* Tracking sensor VMAX/HMAX value */=0A=
> +       u32 vmax;=0A=
> +};=0A=
> +=0A=
> +static inline struct imx678 *to_imx678(struct v4l2_subdev *_sd)=0A=
> +{=0A=
> +       return container_of(_sd, struct imx678, sd);=0A=
=0A=
Use container_of_const.=0A=
=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> +{=0A=
> +       struct imx678 *imx678 =3D container_of(ctrl->handler, struct imx6=
78,=0A=
> +                                            ctrl_handler);=0A=
=0A=
Use container_of_const.=0A=
=0A=
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);=
=0A=
> +       const struct v4l2_mbus_framefmt *format;=0A=
> +       struct v4l2_subdev_state *state;=0A=
> +       int rpm_in_use;=0A=
> +       int ret =3D 0;=0A=
> +=0A=
> +       state =3D v4l2_subdev_get_locked_active_state(&imx678->sd);=0A=
> +       format =3D v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD)=
;=0A=
> +=0A=
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> +               u32 current_exposure =3D imx678->exposure->cur.val;=0A=
> +=0A=
> +               imx678->vmax =3D format->height + ctrl->val;=0A=
=0A=
........(1)=0A=
=0A=
> +=0A=
> +               current_exposure =3D clamp_t(u32, current_exposure,=0A=
> +                                          IMX678_EXPOSURE_MIN,=0A=
> +                                          imx678->vmax - IMX678_SHR_MIN)=
;=0A=
> +               ret =3D __v4l2_ctrl_modify_range(imx678->exposure,=0A=
> +                                              IMX678_EXPOSURE_MIN,=0A=
> +                                              imx678->vmax - IMX678_SHR_=
MIN,=0A=
> +                                              1, current_exposure);=0A=
> +               if (ret)=0A=
> +                       return ret;=0A=
> +       }=0A=
> +=0A=
> +       /*=0A=
> +        * Applying V4L2 control value only happens when power is up for=
=0A=
> +        * streaming=0A=
> +        */=0A=
> +       rpm_in_use =3D pm_runtime_get_if_in_use(&client->dev);=0A=
> +       if (!rpm_in_use)=0A=
> +               return 0;=0A=
=0A=
As in the last revision, as I suggested before, I will again suggest using=
=0A=
pm_runtime_get_if_active() here instead of pm_runtime_get_if_in_use().=0A=
=0A=
This does not seem to align with the comment above:=0A=
Applying V4L2 control value only happens when power is up for streaming=0A=
=0A=
"Power is up" implies that the device is in the runtime PM ACTIVE state,=0A=
rather than simply having a non-zero usage count.=0A=
=0A=
I also don't understand why we need to be strict here and require the=0A=
runtime PM usage count to be greater than zero. What matters before accessi=
ng=0A=
the hardware registers is that the device is powered and accessible, not=0A=
whether there is an active user holding a runtime PM reference.=0A=
=0A=
Anyway, rpm_in_use does not seem necessary here. The check could be simplif=
ied to:=0A=
if (pm_runtime_get_if_active(&client->dev) <=3D 0)=0A=
=0A=
> +=0A=
> +       switch (ctrl->id) {=0A=
> +       case V4L2_CID_VBLANK:=0A=
> +               cci_write(imx678->cci, IMX678_REG_VMAX, imx678->vmax, &re=
t);=0A=
> +               fallthrough; /* SHR =3D VMAX - exposure, so update it */=
=0A=
> +       case V4L2_CID_EXPOSURE: {=0A=
> +               u32 shr =3D imx678->vmax - imx678->exposure->val;=0A=
> +=0A=
> +               cci_write(imx678->cci, IMX678_REG_SHR, shr, &ret);=0A=
> +               break;=0A=
> +       }=0A=
> +       case V4L2_CID_ANALOGUE_GAIN:=0A=
> +               cci_write(imx678->cci, IMX678_REG_GAIN, ctrl->val, &ret);=
=0A=
> +               break;=0A=
> +       case V4L2_CID_HBLANK: {=0A=
> +               u32 hmax =3D (format->width + ctrl->val) / IMX678_PIX_PER=
_CLK;=0A=
> +=0A=
> +               cci_write(imx678->cci, IMX678_REG_HMAX, hmax, &ret);=0A=
> +               break;=0A=
> +       }=0A=
> +       case V4L2_CID_TEST_PATTERN: {=0A=
> +               cci_write(imx678->cci, IMX678_REG_TPG_COLORWIDTH,=0A=
> +                         IMX678_TPG_COLORWIDTH_160PIX, &ret);=0A=
> +               cci_write(imx678->cci, IMX678_REG_TPG_PATSEL_DUOUT,=0A=
> +                         imx678_tpg_val[ctrl->val], &ret);=0A=
> +               cci_write(imx678->cci, IMX678_REG_TPG_EN_DUOUT,=0A=
> +                         (ctrl->val) ? 1 : 0,=0A=
> +                         &ret);=0A=
> +               break;=0A=
> +       }=0A=
> +       case V4L2_CID_HFLIP:=0A=
> +               cci_write(imx678->cci, IMX678_REG_WINMODEH, ctrl->val, &r=
et);=0A=
> +               break;=0A=
> +       case V4L2_CID_VFLIP:=0A=
> +               cci_write(imx678->cci, IMX678_REG_WINMODEV, ctrl->val, &r=
et);=0A=
> +               break;=0A=
> +       default:=0A=
> +               dev_warn(&client->dev,=0A=
> +                        "ctrl(id:0x%x,val:0x%x) is not handled\n",=0A=
> +                        ctrl->id, ctrl->val);=0A=
> +               break;=0A=
> +       }=0A=
> +=0A=
> +       if (rpm_in_use > 0)=0A=
> +               pm_runtime_put(&client->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
=0A=
...=0A=
=0A=
> +static int imx678_set_pad_format(struct v4l2_subdev *sd,=0A=
> +                                struct v4l2_subdev_state *sd_state,=0A=
> +                                struct v4l2_subdev_format *fmt)=0A=
> +{=0A=
> +       struct imx678 *imx678 =3D to_imx678(sd);=0A=
> +       struct v4l2_mbus_framefmt *format;=0A=
> +       const struct v4l2_rect *crop;=0A=
> +       int ret =3D 0;=0A=
> +=0A=
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&=0A=
> +           v4l2_subdev_is_streaming(sd))=0A=
> +               return -EBUSY;=0A=
> +=0A=
> +       crop =3D v4l2_subdev_state_get_crop(sd_state, fmt->pad);=0A=
> +=0A=
> +       fmt->format.width =3D crop->width;=0A=
> +       fmt->format.height =3D crop->height;=0A=
> +       fmt->format.code =3D imx678_get_format_code(imx678, fmt->format.c=
ode);=0A=
> +       fmt->format.field =3D V4L2_FIELD_NONE;=0A=
> +       fmt->format.colorspace =3D V4L2_COLORSPACE_RAW;=0A=
> +       fmt->format.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;=0A=
> +       fmt->format.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;=0A=
> +       fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;=0A=
> +=0A=
> +       format =3D v4l2_subdev_state_get_format(sd_state, fmt->pad);=0A=
> +=0A=
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)=0A=
> +               ret =3D imx678_set_framing_limits(imx678, &fmt->format);=
=0A=
> +=0A=
> +       if (!ret)=0A=
> +               *format =3D fmt->format;=0A=
=0A=
Update the ACTIVE format before adjusting the framing controls so that cont=
rol=0A=
callbacks operate on the correct frame dimensions.=0A=
=0A=
Currently, the VBLANK control handler recalculates the exposure limits usin=
g=0A=
the previous height value.=0A=
=0A=
You can verify this by adding a debug print at (1) (In imx678_set_ctrl) for=
 format->height.=0A=
=0A=
For example:=0A=
Streaming is running with a format of 3856 =D7 2160.=0A=
Streaming is stopped.=0A=
The media link is reconfigured to 1920 =D7 1080.=0A=
=0A=
At this point, the ACTIVE format has not yet been updated. As a result, the=
=0A=
debug print at (1) will still show 2160 instead of 1080.=0A=
=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +static int imx678_get_selection(struct v4l2_subdev *sd,=0A=
> +                               struct v4l2_subdev_state *sd_state,=0A=
> +                               struct v4l2_subdev_selection *sel)=0A=
> +{=0A=
> +       switch (sel->target) {=0A=
> +       case V4L2_SEL_TGT_CROP:=0A=
> +               sel->r =3D *v4l2_subdev_state_get_crop(sd_state, sel->pad=
);=0A=
> +               return 0;=0A=
> +=0A=
> +       case V4L2_SEL_TGT_NATIVE_SIZE:=0A=
> +               sel->r =3D imx678_native_area;=0A=
> +               return 0;=0A=
> +=0A=
> +       case V4L2_SEL_TGT_CROP_DEFAULT:=0A=
> +       case V4L2_SEL_TGT_CROP_BOUNDS:=0A=
> +               sel->r =3D imx678_active_area;=0A=
> +               return 0;=0A=
> +       }=0A=
> +=0A=
> +       return -EINVAL;=0A=
> +}=0A=
> +=0A=
> +static int imx678_init_state(struct v4l2_subdev *sd,=0A=
> +                            struct v4l2_subdev_state *state)=0A=
> +{=0A=
> +       struct imx678 *imx678 =3D to_imx678(sd);=0A=
> +       struct v4l2_rect *crop;=0A=
> +       struct v4l2_subdev_format fmt =3D {=0A=
> +               .which =3D V4L2_SUBDEV_FORMAT_TRY,=0A=
> +               .pad =3D IMX678_SOURCE_PAD,=0A=
> +               .format =3D {=0A=
> +                       .code =3D imx678_default_mbus_code(imx678),=0A=
> +                       .width =3D imx678_active_area.width,=0A=
> +                       .height =3D imx678_active_area.height,=0A=
> +               },=0A=
> +       };=0A=
> +=0A=
> +       crop =3D v4l2_subdev_state_get_crop(state, IMX678_SOURCE_PAD);=0A=
> +       *crop =3D imx678_active_area;=0A=
> +       imx678_set_pad_format(sd, state, &fmt);=0A=
> +=0A=
> +       return 0;=0A=
=0A=
return imx678_set_pad_format(..).=0A=
=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int imx678_identify_model(struct imx678 *imx678)=0A=
> +{=0A=
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);=
=0A=
> +       const struct imx678_model_info *info;=0A=
> +       enum imx678_type detected;=0A=
> +       int ret =3D 0;=0A=
> +       u64 val =3D 0;=0A=
=0A=
val =3D 0 initialization is unnecessary, as val is populated by cci_read()=
=0A=
before it is used.=0A=
=0A=
> +=0A=
> +       info =3D device_get_match_data(&client->dev);=0A=
> +=0A=
> +       /*=0A=
> +        * This sensor's ID registers become accessible 80ms after coming=
 out=0A=
> +        * of STANDBY mode.=0A=
> +        */=0A=
> +       cci_write(imx678->cci, IMX678_REG_MODE_SELECT, 0, &ret);=0A=
> +       fsleep(IMX678_MODULE_ID_DELAY);=0A=
> +=0A=
> +       cci_read(imx678->cci, IMX678_REG_MODULE_ID, &val, &ret);=0A=
> +=0A=
> +       if (ret) {=0A=
> +               dev_err(&client->dev,=0A=
> +                       "I2C transaction failed ret =3D %d\n", ret);=0A=
> +               return ret;=0A=
> +       }=0A=
> +=0A=
> +       if (val !=3D IMX678_ID) {=0A=
> +               dev_err(&client->dev,=0A=
> +                       "Chip ID mismatch: %x!=3D%llx\n", IMX678_ID, val)=
;=0A=
> +               return -ENXIO;=0A=
> +       }=0A=
> +=0A=
> +       cci_read(imx678->cci, IMX678_REG_MONOCHROME, &val, &ret);=0A=
> +=0A=
> +       if (ret) {=0A=
> +               dev_err(&client->dev,=0A=
> +                       "I2C transaction failed ret =3D %d\n", ret);=0A=
> +               return ret;=0A=
> +       }=0A=
> +=0A=
> +       detected =3D val & IMX678_TYPE;=0A=
> +=0A=
> +       /* Prefer to use sensor type specified in device tree */=0A=
> +       if (info) {=0A=
> +               imx678->info =3D info;=0A=
> +               if (detected !=3D info->type)=0A=
> +                       dev_err(&client->dev,=0A=
> +                               "detected %s sensor, DT specifies %s; usi=
ng DT value\n",=0A=
> +                               detected =3D=3D IMX678_COLOR ? "color" : =
"mono",=0A=
> +                               info->type =3D=3D IMX678_COLOR ? "color" =
: "mono");=0A=
> +       } else {=0A=
> +               imx678->info =3D detected =3D=3D IMX678_MONOCHROME ?=0A=
> +                              &imx678_aamr_info : &imx678_aaqr_info;=0A=
> +               dev_info(&client->dev,=0A=
> +                        "sensor type missing in DT; detected %s sensor\n=
",=0A=
> +                        detected =3D=3D IMX678_MONOCHROME ? "mono" : "co=
lor");=0A=
> +       }=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
=0A=
...=0A=
=0A=
> +static int imx678_probe(struct i2c_client *client)=0A=
> +{=0A=
> +       struct device *dev =3D &client->dev;=0A=
> +       struct imx678 *imx678;=0A=
> +       int ret, i;=0A=
> +=0A=
> +       imx678 =3D devm_kzalloc(&client->dev, sizeof(*imx678), GFP_KERNEL=
);=0A=
> +       if (!imx678)=0A=
> +               return -ENOMEM;=0A=
> +=0A=
> +       v4l2_i2c_subdev_init(&imx678->sd, client, &imx678_subdev_ops);=0A=
> +=0A=
> +       imx678->cci =3D devm_cci_regmap_init_i2c(client, 16);=0A=
> +       if (IS_ERR(imx678->cci))=0A=
> +               return dev_err_probe(dev, PTR_ERR(imx678->cci),=0A=
> +                                    "failed to init CCI\n");=0A=
> +=0A=
> +       if (imx678_check_hwcfg(dev, imx678))=0A=
> +               return -EINVAL;=0A=
> +=0A=
> +       imx678->xclk =3D devm_v4l2_sensor_clk_get(dev, NULL);=0A=
> +       if (IS_ERR(imx678->xclk))=0A=
> +               return dev_err_probe(dev, PTR_ERR(imx678->xclk),=0A=
> +                                    "failed to get xclk\n");=0A=
> +=0A=
> +       imx678->xclk_freq =3D clk_get_rate(imx678->xclk);=0A=
> +=0A=
> +       for (i =3D 0; i < ARRAY_SIZE(imx678_inck_table); ++i) {=0A=
> +               if (imx678_inck_table[i].xclk_hz =3D=3D imx678->xclk_freq=
) {=0A=
> +                       imx678->inck_sel_val =3D imx678_inck_table[i].inc=
k_sel;=0A=
> +                       break;=0A=
> +               }=0A=
> +       }=0A=
> +=0A=
> +       if (i =3D=3D ARRAY_SIZE(imx678_inck_table))=0A=
> +               return dev_err_probe(dev, -EINVAL,=0A=
> +                                    "unsupported XCLK rate %u Hz\n",=0A=
> +                                    imx678->xclk_freq);=0A=
> +=0A=
> +       for (i =3D 0; i < ARRAY_SIZE(imx678_supply_name); i++)=0A=
> +               imx678->supplies[i].supply =3D imx678_supply_name[i];=0A=
> +=0A=
> +       ret =3D devm_regulator_bulk_get(&client->dev,=0A=
> +                                     ARRAY_SIZE(imx678_supply_name),=0A=
> +                                     imx678->supplies);=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(dev, ret, "failed to get regulators\=
n");=0A=
> +=0A=
> +       imx678->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",=0A=
> +                                                    GPIOD_OUT_HIGH);=0A=
> +       if (IS_ERR(imx678->reset_gpio))=0A=
> +               return dev_err_probe(dev, PTR_ERR(imx678->reset_gpio),=0A=
> +                                    "failed to get reset GPIO\n");=0A=
> +=0A=
> +       ret =3D imx678_power_on(dev);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       ret =3D imx678_identify_model(imx678);=0A=
> +       if (ret)=0A=
> +               goto error_power_off;=0A=
> +=0A=
> +       pm_runtime_set_active(dev);=0A=
> +       pm_runtime_enable(dev);=0A=
> +=0A=
> +       ret =3D imx678_init_controls(imx678);=0A=
> +       if (ret)=0A=
> +               goto error_pm_runtime;=0A=
> +=0A=
> +       imx678->sd.internal_ops =3D &imx678_internal_ops;=0A=
> +       imx678->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |=0A=
> +                               V4L2_SUBDEV_FL_HAS_EVENTS;=0A=
=0A=
Drop V4L2_SUBDEV_FL_HAS_EVENTS flag.=0A=
=0A=
> +       imx678->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=0A=
> +=0A=
> +       imx678->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
> +=0A=
> +       ret =3D media_entity_pads_init(&imx678->sd.entity, 1, &imx678->pa=
d);=0A=
> +       if (ret) {=0A=
> +               dev_err_probe(dev, ret, "failed to init entity pads\n");=
=0A=
> +               goto error_handler_free;=0A=
> +       }=0A=
> +=0A=
> +       imx678->sd.state_lock =3D imx678->ctrl_handler.lock;=0A=
> +       ret =3D v4l2_subdev_init_finalize(&imx678->sd);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err_probe(dev, ret, "subdev init error\n");=0A=
> +               goto error_media_entity;=0A=
> +       }=0A=
> +=0A=
> +       ret =3D v4l2_async_register_subdev_sensor(&imx678->sd);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err_probe(dev, ret,=0A=
> +                             "failed to register sensor sub-device\n");=
=0A=
> +               goto error_subdev_cleanup;=0A=
> +       }=0A=
> +=0A=
> +       pm_runtime_idle(dev);=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +error_subdev_cleanup:=0A=
> +       v4l2_subdev_cleanup(&imx678->sd);=0A=
> +=0A=
> +error_media_entity:=0A=
> +       media_entity_cleanup(&imx678->sd.entity);=0A=
> +=0A=
> +error_handler_free:=0A=
> +       v4l2_ctrl_handler_free(imx678->sd.ctrl_handler);=0A=
> +=0A=
> +error_pm_runtime:=0A=
> +       pm_runtime_disable(&client->dev);=0A=
> +       pm_runtime_set_suspended(&client->dev);=0A=
> +=0A=
> +error_power_off:=0A=
> +       imx678_power_off(&client->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +static void imx678_remove(struct i2c_client *client)=0A=
> +{=0A=
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);=0A=
> +       struct imx678 *imx678 =3D to_imx678(sd);=0A=
> +=0A=
> +       v4l2_async_unregister_subdev(sd);=0A=
> +       v4l2_subdev_cleanup(sd);=0A=
> +       media_entity_cleanup(&sd->entity);=0A=
> +       v4l2_ctrl_handler_free(imx678->sd.ctrl_handler);=0A=
> +=0A=
> +       pm_runtime_disable(&client->dev);=0A=
> +       if (!pm_runtime_status_suspended(&client->dev))=0A=
> +               imx678_power_off(&client->dev);=0A=
> +       pm_runtime_set_suspended(&client->dev);=0A=
> +}=0A=
> +=0A=
> +static const struct dev_pm_ops imx678_pm_ops =3D {=0A=
> +       SET_RUNTIME_PM_OPS(imx678_power_off, imx678_power_on, NULL)=0A=
> +};=0A=
> +=0A=
> +static const struct of_device_id imx678_of_match[] =3D {=0A=
> +       { .compatible =3D "sony,imx678-aamr", .data =3D &imx678_aamr_info=
 },=0A=
> +       { .compatible =3D "sony,imx678-aaqr", .data =3D &imx678_aaqr_info=
 },=0A=
> +       /* for non-conforming DTs that rely on runtime check */=0A=
> +       { .compatible =3D "sony,imx678" },=0A=
> +       { /* sentinel */ }=0A=
> +};=0A=
> +=0A=
> +MODULE_DEVICE_TABLE(of, imx678_of_match);=0A=
> +=0A=
> +static struct i2c_driver imx678_i2c_driver =3D {=0A=
> +       .driver =3D {=0A=
> +               .name =3D "imx678",=0A=
> +               .of_match_table =3D imx678_of_match,=0A=
> +               .pm =3D pm_ptr(&imx678_pm_ops),=0A=
> +       },=0A=
> +       .probe =3D imx678_probe,=0A=
> +       .remove =3D imx678_remove,=0A=
> +};=0A=
> +=0A=
> +module_i2c_driver(imx678_i2c_driver);=0A=
> +=0A=
> +MODULE_AUTHOR("Will Whang <will@willwhang.com>");=0A=
> +MODULE_AUTHOR("Tetsuya NOMURA <tetsuya.nomura@soho-enterprise.com>");=0A=
> +MODULE_AUTHOR("Jai Luthra <jai.luthra@ideasonboard.com>");=0A=
> +MODULE_DESCRIPTION("Sony imx678 sensor driver");=0A=
> +MODULE_LICENSE("GPL");=0A=
>=0A=
> --=0A=
> 2.54.0=0A=
=0A=
Best Regards,=0A=
Tarang=

