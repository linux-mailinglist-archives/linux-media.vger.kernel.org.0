Return-Path: <linux-media+bounces-62745-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGPMKzQ4FWoDTwcAu9opvQ
	(envelope-from <linux-media+bounces-62745-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:05:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 037025D10EC
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A987F3034E13
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 06:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66253C0602;
	Tue, 26 May 2026 06:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="eNjj0rjO"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020112.outbound.protection.outlook.com [52.101.227.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213C0384244;
	Tue, 26 May 2026 06:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779775401; cv=fail; b=dFGCvogIn5PSmYGn3CnKzzlPSRn5A3hkn8DQYRCOhFmSUosj74ChJ+KUN2fb3UPQ6GqPV0n2NTWuRYVpnYLw3JNXrl+5i3+Ki6St7jolq+JNXafFB34zRXvJQHsjNzjuu5nwysaMk6BzrTExW0TzW3NVuTKSpVPO4uUnYg86d4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779775401; c=relaxed/simple;
	bh=sNHZD8dxsvxlgyFnccqUp757tCABsvDeT7rB1H0oVy4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hzBHyUasdDMjPkgycAFi44JmLcKEkl04C2D4Ra3PFFUTSS7cDG5+DllKUyXiMUMS3g3V79rLeaoIyccKt4CZVX9F4NNwiVD8wmLSsiIdK3wCWQcZXM2WgYj8iMge7vJGpHr1o47N1uSP9ygqeEdJHneNEtb+Q4PeQiwFoOuDHnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=eNjj0rjO; arc=fail smtp.client-ip=52.101.227.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxFKl/Q2FU0m2Ox8d2rmofnREQgAWNwNRHN5WHqu+8l4Ql2va+05cpRThdHbdipWFtuUctfzHmskHbS0ld0SjWY7Walk6obIk8KHfQZc4iiz2+lrTXdg/70lpuKco0GUD1TlwIrU82L/ttPsCUJDIsD2Y7nfrTk31iPVCDs/DI491Ufjwd4Vy8u+umypm3vj/zJcJG57d0H2h99S6bBePYP5BrcdCQK1rf1CIB0n2pO1VOfToo/Y9vLxI58uYgswIjPWaxKHorL+8sPb1SabcmYjs5zdCkAaBEdOxWmnp7/jnWiq78UHsMv7zZRipqkGimCE+4S62akDBri6mRF3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNHZD8dxsvxlgyFnccqUp757tCABsvDeT7rB1H0oVy4=;
 b=f29sDXJGuteBJ1549zbtmph1s3qVJBubk7gblK2JA0QMpDJqn7jzGGd3T5BRarE+3p99ZmUywwbj4OS5U0wlymMdlB1w9Wv0d5v/+PJPmSqLplUbiAIKO3LbOGvS+K1V1VXVseioPhADI3J0ErLMUh3URlxVio3doP66ZTa37G65LOiPqZQYgoOkjIxavSCEpbYSy/b/5RUqI8SNcOXmoXRgNXu3eYlV2GJzN8KGkqeQLQ1kDRDRA9QpCrXcrGs0oeexQpP2K2R5++NzROFj75v9gcb0HLvIxxW6JlTMBWQtdyQH7NFAck+bYIJsP9NzgnRYAt0H/479KbroNRUNfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNHZD8dxsvxlgyFnccqUp757tCABsvDeT7rB1H0oVy4=;
 b=eNjj0rjOMWLe4gCE0lKv3U9NGKjUFq47o6iMOjVYpHu/Z8mQEImdn1CBM9EjxBHbGTl0SgnH7JNo5Ojom/49eDL93IP0UEdfWRnZcZ2OzaY0wZfzRA2UeSJbGs+Cq6EvvMnvZCUDZ2urqhLP6bCo1k7s3FzO8MTpSmJTmH8IQCn0aoJy9CcsiPAaZp4BNT/f+fGQ/+YzOTcg2RiPVaWPdLgd3vZCtEDIMCsIlqG8lEgg8LW4Ibug315qodO0wfBfPnc+Lq4mt9lk0k92qU+paWcnpBh7e2JDnxrUB00TWRvIHBdjPzsxL/eFGk6NNuBXt+sCEVANZNzFlcZ87uplxw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0953.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:177::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 06:03:14 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 06:03:14 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Conor Dooley
	<conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano
	<Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Topic: [PATCH v3 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Index: AQHc6GzDGhYkqnT02U+T7Emm/l+GfrYaEvecgAS5RQCAAQuHkg==
Date: Tue, 26 May 2026 06:03:14 +0000
Message-ID:
 <PN3P287MB182995CABAED501F01C16B948B0B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com>
 <20260520-imx678-v3-2-8b5f9676486e@ideasonboard.com>
 <PN3P287MB1829DE5A82688FB30D1AA28A8B0F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <177971750040.2341049.6027802052267528675@selene>
In-Reply-To: <177971750040.2341049.6027802052267528675@selene>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB0953:EE_
x-ms-office365-filtering-correlation-id: 97faef2e-cc82-4706-3f0d-08debaec794f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|56012099003|18002099003|22082099003|3023799007|4143699003|38070700021;
x-microsoft-antispam-message-info:
 H/5khg5W6keqw+CuOg1reYY4dAonZ/Z6gX25HonAxTm0m49g1FocWqujXmlZu5N30lbB3PFgK0xwyAwCwDItS4qFzoy9l2t+LHLRSwxaHaImw9lo/bwFNFz+1+/jIocqvEUVdeZEZP+oB6/j1TkRfVzh8bWwWSXE3fGdRLSf8S3ua5jaxvUHUWn4nOwEi/brKLa+zOLsLssZvIkY2+rek8cYmFGTWXpc+piunkZzQDxt9XAxWsQyBzH3GsZBHY2r0jUuONL2eaes7jgSjfcSrHesEKLLA7kQaKUfh35EDUaoRhUF/dibX1CoST1njGWWfG4Pi35qv13cdeq3iWQIVKHihefvQzbZliG+93kfWf79uSbjP/DPXfSkqPnAhYcGLP1F+ImrpRvK/GNR4kcYuImbGrULjXxi2sZsUjfrI2vJoTBGwYiRlT8mQXMhrk3pCSJF9n4WEGjgmQFan38/e+a3kIoi1NbK+nVbhfQs+5JxIRzH3i/AjySBaMzRpGvICMtbz5S30pU7ILQIlEOUpa0/9aTAiMIV+yLlnSYVapigwuejgOX+91DxH2QG19dfn8HOU+pqIqx2CAx9VjKhc4qipHXkZ9JIr3H2gy1IpjDAY3Jy7h3lWO2sZGAQkWKevxRO58tVSHdNMdtz8uXvJ9gNFc/YRdhzTIs+Dy53a2/90vWyfUsxbJNahCNAYkD882sJ9UVhbjiDguq0fDjbDOqI6sPUie1K6OXhr8RwuRp7jbKwK4M7U18/6Sih4ncI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(56012099003)(18002099003)(22082099003)(3023799007)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?N3lA4jXf176/a4L9HLDXkYWZ/Oow0BW4Z6pJqmNrOgot41rRV6eTJFai+n?=
 =?iso-8859-1?Q?PRzkpiYUxBnTbj8mKvz57CQ+HdmXu7zrOG0JQTKdWJnYowIpFL2+ySOsPU?=
 =?iso-8859-1?Q?qIqDT5qa0y0gZpItrdrD7fbtt+iinDP+oCB48ZdlVCJ7Pw4K0DDMTpW3pD?=
 =?iso-8859-1?Q?hrTSKL3/3A0DQdVqQ3Dtl9Pt6NCMaDqXva2oi8V/QNXetvr+GqG6LSvDtE?=
 =?iso-8859-1?Q?syKQqcudzwsVj27gzckHWrJXjH4kQrzjZjMYcqpRIeelinFL6killno+C0?=
 =?iso-8859-1?Q?DjvrFIHb+ip+YDiyenL3iUbbUBetPdvj+j7EwleI4g2muhT14ZMVjAB0JF?=
 =?iso-8859-1?Q?LVxpgYwqTRpMPOaLguygbW7H8niLWYiMKdH3NAf+8JH0DZvnh1KthyP8ct?=
 =?iso-8859-1?Q?NE9Pn6HP2z1cmmH1j7VaA68HeIpkPaBIxzHfpDlJ3zGj2WH3VqimG8Vb73?=
 =?iso-8859-1?Q?QrGGuzo+//fIQbUuEfjWPOfrrqCs1cE7b+6WWf3JLdTuP9HHDDydIh1T85?=
 =?iso-8859-1?Q?DxBfB4cxc7Jw23sQxXpazjcx9mNpTNkF5PM5iBAng3Fcu6dv/k1zZntqDN?=
 =?iso-8859-1?Q?KA00tdikzrJG/VHWp+IwmjDf2gfVBKAk++ijus4sdJfOKcekQRk1LvRQgX?=
 =?iso-8859-1?Q?9aYGp4vHVElOwmfeqVmzRKMjWAWM1xo7hihM414UN8cxQvPd3C3CJtRpOF?=
 =?iso-8859-1?Q?bEuZ+dEWRVaXl+S93OSVBnhT/kNk8kH+T3h6PExfYHb/C1zRrRnkv2Tyv+?=
 =?iso-8859-1?Q?TsLm7a9XsP491ar0hzHqHYmrnZKxWj1gg+z3SJ7OvuXEnPdcXYBKKicWj7?=
 =?iso-8859-1?Q?EIAB33l+C+RXg8EBq+KDj0wRZUhTopW+KbmZpw26JKAaKVlvx3iCgoEIjl?=
 =?iso-8859-1?Q?AXe+lIuTnriPdnnB3yaS7rtVBg1UN2N1RUmHMapKHaBdNxoPbYFDqTSJPn?=
 =?iso-8859-1?Q?LWf5lIjjVcGRtFDF2f/3G1ZHSGUCK9mMuyAgvHx/Pl/NFTLGCgotc1LZf5?=
 =?iso-8859-1?Q?M0UjA4+PXdg/xU2WgbHN4DDuuZT3aet1OOUQD8LWbreQr+auQfT5osxQV1?=
 =?iso-8859-1?Q?AchURBk3J8+Z8DvCr4iA7S70l3Zu5OAt6Hr/OYy4/WbLDLB4t9tAQajDm0?=
 =?iso-8859-1?Q?sbF6w+RZe6YGlPdN6ceTcISMmcHlLF65vwvQaEgjDhAeVTR6nT7wZDuR1D?=
 =?iso-8859-1?Q?UORqRJ4/7v+046Rx6bPdomZxk1I/cWVxCGTanBVqvsEQByYkppyk1g5OdF?=
 =?iso-8859-1?Q?ctz3jI0mcOHMnbg+IDaPMEGOwf3M9v/ACrBEyy12LHnpBxbsIpi7Lmbbnf?=
 =?iso-8859-1?Q?iRvuJVvCG5U2f2OvKMX+IufK8grqtBrW8sQ3FbWQADTxlYlFS+wemN78iM?=
 =?iso-8859-1?Q?CKh85oGbmnsvAW0vGNMi6VlbtggdHrkVVzEX1RBMWehKgr7KVI8RHOu+gd?=
 =?iso-8859-1?Q?R04edu0XZLVjodBCp/9noidqbY38VIiAifacWUTvfkXbKDcZPQL+jUg+uw?=
 =?iso-8859-1?Q?IzNR/zitfe48VTzzLaWFAwv9SMCD2ZxI1FVjhRQMgCOhDj8MXWPbk9Cmhy?=
 =?iso-8859-1?Q?7CkmX0Li53e7BWq4mrvtc/R3m0DYZeqoXk7unPVYmCcZcRRpcZ7R/ZsSzP?=
 =?iso-8859-1?Q?w1pa48gqLbkRd8l6w3S22qZYcFs35uGXoKhxjnpvgz4/EjjoPf0NgEm723?=
 =?iso-8859-1?Q?QiuzmV+swxZdoBEBCFVCwPmqkEOGNo4Z6GU0FEr3qwVJG9pZUog1sHCb8C?=
 =?iso-8859-1?Q?igTCxNiCBZNEumc0rBTplxfHG9ejKxgud2+A0bUYYvU8WWovubUzr4z0yc?=
 =?iso-8859-1?Q?Q9Xwg1R8iA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 97faef2e-cc82-4706-3f0d-08debaec794f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 06:03:14.3195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9bGV3scHnMk3y6b3usgX8LoCR7uVzj9evrGQVuJGPn3OTcOxAsgn1X6jYgRVCsRHIFGiDXmvbn+IT0nr+1lOGCzvzaULUnbYE5SNCd6mOBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0953
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62745-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid,ideasonboard.com:email]
X-Rspamd-Queue-Id: 037025D10EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jai,=0A=
=0A=
> Quoting Tarang Raval (2026-05-22 19:01:01)=0A=
> > Hi Jai,=0A=
> >=0A=
> > I noticed a few issues and also have one question. Could you please hel=
p me=0A=
> > understand that part?=0A=
> >=0A=
> > Please check the comments below.=0A=
> >=0A=
> > > Add a V4L2 subdev driver for the Sony IMX678 image sensor.=0A=
> > >=0A=
> > > IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type=0A=
> > > solid-state image sensor with a square pixel array and 8.40 M effecti=
ve=0A=
> > > pixels.=0A=
> > >=0A=
> > > The following features are supported by the driver:=0A=
> > > - Monochrome and Color (Bayer filter) variants=0A=
> > > - Multiple input clock frequencies supported=0A=
> > > - Multiple link frequencies supported=0A=
> > > - VBLANK and HBLANK control for variable framerate=0A=
> > > - Freely configurable crop rectangle through S_SELECTION ioctl=0A=
> > > - Configurable resolution with 2x2 binning (for the current crop)=0A=
> > >=A0=A0 through S_FMT ioctl=0A=
> > > - VFLIP and HFLIP control for flipping readout=0A=
> > > - Test pattern control support=0A=
> > > - Exposure and gain control=0A=
> > > - MIPI RAW12 output=0A=
> > >=0A=
> > > Following features are not currently supported but may be added later=
:=0A=
> > > - Pixel-perfect crop reporting, account for the shift-by-1 when flipp=
ing=0A=
> > >=A0=A0 using HFLIP/VFLIP, which maintains the bayer readout order=0A=
> > > - Increased framerate (lower HMAX/VMAX) when cropping=0A=
> > > - MIPI RAW10 output mode=0A=
> > > - Embedded data stream=0A=
> > >=0A=
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>=0A=
> > > ---=0A=
=0A=
...=0A=
=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 /*=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0 * Applying V4L2 control value only happens=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0 * when power is up for streaming=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0 */=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (pm_runtime_get_if_in_use(&client->dev) =3D=3D=
 0)=0A=
> >=0A=
> > Use pm_runtime_get_if_active.=0A=
> >=0A=
>=0A=
> We anyway write all control values everytime in enable_streams(), so I=0A=
> think it's okay to keep this check a bit strict and skip the writes if th=
e=0A=
> sensor is RPM_ACTIVE with 0 users. (i.e. streaming has stopped, but devic=
e=0A=
> not suspended yet, which is unlikely given we don't have an autosuspend=
=0A=
> timer but suspend immediately here)=0A=
>=0A=
> Unless of course I misunderstood why you're suggesting it?=0A=
=0A=
Yes, replaying controls in enable_streams makes the next stream start corre=
ct.=0A=
=0A=
While the device is still RPM_ACTIVE, the hardware is still accessible, so=
=0A=
skipping the write only because the runtime PM usage count is 0 creates a=
=0A=
temporary mismatch between the cached V4L2 control state and the actual=0A=
hardware state.=0A=
=0A=
The immediate-suspend path makes this window small, but the window still ex=
ists=0A=
between pm_runtime_put and runtime suspend completing. Using pm_runtime_get=
_if_active=0A=
avoids relying on that timing.=0A=
=0A=
So I still prefer to use pm_runtime_get_if_active().=0A=
=0A=
...=0A=
=0A=
> > > +static int imx678_set_selection(struct v4l2_subdev *sd,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_selection *sel)=0A=
> > > +{=0A=
> > > +=A0=A0=A0=A0=A0=A0 struct imx678 *imx678 =3D to_imx678(sd);=0A=
> > > +=A0=A0=A0=A0=A0=A0 struct v4l2_rect *crop;=0A=
> > > +=A0=A0=A0=A0=A0=A0 struct v4l2_rect rect;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (sel->target !=3D V4L2_SEL_TGT_CROP || sel->pa=
d !=3D 0)=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &=
&=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v4l2_subdev_is_streaming(sd))=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EBUSY;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 /* Align left, top to 4 */=0A=
> > > +=A0=A0=A0=A0=A0=A0 rect.left =3D clamp_t(s32, ALIGN(sel->r.left, IMX=
678_CROP_HST_ALIGN),=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 imx678_active_area.left,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 imx678_active_area.width - IMX678_PIXEL_ARRAY_MIN_WIDTH);=0A=
> >=0A=
> > You are ignoring the active_area offset here; please correct it.=0A=
> >=0A=
> > In imx296, crop bounds start at (0, 0), so no offset handling is needed=
 there.=0A=
> >=0A=
> > You can refer to my patch:=0A=
> > https://lore.kernel.org/linux-media/20260424092554.26130-4-elgin.perumb=
illy@siliconsignals.io/#t=0A=
> >=0A=
>=0A=
> Ah good catch, will fix.=0A=
>=0A=
> > > +=A0=A0=A0=A0=A0=A0 rect.top =3D clamp_t(s32, ALIGN(sel->r.top, IMX67=
8_CROP_VST_ALIGN),=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 imx678_active_area.top,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 imx678_active_area.height - IMX678_PIXEL_ARRAY_MIN_HEIGHT);=0A=
> > > +=A0=A0=A0=A0=A0=A0 /* Align width to 16 and height to 4 */=0A=
> > > +=A0=A0=A0=A0=A0=A0 rect.width =3D clamp_t(u32, ALIGN(sel->r.width, I=
MX678_CROP_HWIDTH_ALIGN),=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 IMX678_PIXEL_ARRAY_MIN_WIDTH, imx678_active_area.width);=0A=
> > > +=A0=A0=A0=A0=A0=A0 rect.height =3D clamp_t(u32, ALIGN(sel->r.height,=
 IMX678_CROP_VWIDTH_ALIGN),=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 IMX678_PIXEL_ARRAY_MIN_HEIGHT, imx678_active_area.height=
);=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 rect.width =3D min_t(u32, rect.width, imx678_nati=
ve_area.width - rect.left);=0A=
> > > +=A0=A0=A0=A0=A0=A0 rect.height =3D min_t(u32, rect.height, imx678_na=
tive_area.height - rect.top);=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 crop =3D v4l2_subdev_state_get_crop(sd_state, sel=
->pad);=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (rect.width !=3D crop->width || rect.height !=
=3D crop->height) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_mbus_framefmt=
 *format =3D=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v=
4l2_subdev_state_get_format(sd_state, sel->pad);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 format->width =3D rect.wi=
dth;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 format->height =3D rect.h=
eight;=0A=
> >=0A=
> > Why are we not checking here whether binning mode is currently enabled?=
=0A=
> >=0A=
> > Suppose binning mode is enabled, and then userspace changes the crop.=
=0A=
> >=0A=
> > With the below lines:=0A=
> >=0A=
> > format->width =3D rect.width;=0A=
> > format->height =3D rect.height;=0A=
> >=0A=
> > the format size becomes equal to the crop size, which silently disables=
 binning.=0A=
>=0A=
> This was intentional.=0A=
>=0A=
> Let's say I'm streaming in 640x480 binned mode (1280x960 crop) and want t=
o=0A=
> switch to 3200x1600, I prefer if a single S_SELECTION call with 3200x1600=
=0A=
> crop size to do that directly.=0A=
>=0A=
> On the other hand, if I modify just the (top, left) of my crop without=0A=
> changing its size (1280x960), I want it to stay in the binned mode and no=
t=0A=
> snap back the active format to full size.=0A=
>=0A=
> This is a matter of opinion though, which I hope would become irrelevant=
=0A=
> once we move to the new raw sensor model with explicit controls for=0A=
> binning. I plan to look into it before I post a v4, as Sakari suggested i=
n=0A=
> his review.=0A=
=0A=
I see, that makes sense.=0A=
=0A=
I was mainly concerned about the implicit mode switch when changing the cro=
p=0A=
size, but your behaviour seems reasonable as well.=0A=
=0A=
Will revisit this once explicit binning controls are available in the new=
=0A=
raw sensor model.=0A=
=0A=
Best Regards,=0A=
Tarang=

