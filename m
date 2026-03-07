Return-Path: <linux-media+bounces-54843-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHuHDhK2q2myfwEAu9opvQ
	(envelope-from <linux-media+bounces-54843-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 06:22:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CC48C22A354
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 06:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B7ED301E5E5
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 05:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766DF347BA3;
	Sat,  7 Mar 2026 05:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="i69bziEx"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021085.outbound.protection.outlook.com [40.107.51.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B2B35E944;
	Sat,  7 Mar 2026 05:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772860940; cv=fail; b=BDH1VdsZakDlofwk7ULZZGi3aRYE8+763f5OeeBs9bkOEsx63iA/kQffF+hlminNXIzk9BhzbA+HE0IbWvHuUzyvw2rK94CV13O8lVW+iA+d31XQTkJquE3UeltzcQVLGxufNrIH2NS15elY/atWWHjqAYxbzXbOfdwRa9uvldM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772860940; c=relaxed/simple;
	bh=aMZdZVvlSXOa81REw+l3bh2ESgOvr+lB48LXGcagiyM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sGV0HendZv6fbqqtzGp2MXMFHpHMZl0RQz+/CLKQxVTcA2y/n5T6tmz9qzeDS3dFBlmB77LpVwvIsFXbVgfE7mvJCcAIHoCurD0XkgVYmxO9cBV2s7l0l0ZdwbIxd6yZaaiEICzPjScqM/0zIWpJ2vmTD2NiEP+Nqjr+ZM4mi14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=i69bziEx; arc=fail smtp.client-ip=40.107.51.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cidaO9i+61yQiBkUemP2bCKHfBZ8HclroG1J1p5yr6lVth4Vszvr7H5Aj6cAeysfZKSVGtstKj9MyNpAKhezvvZM81OORNx9zZZamy7weUzJOXhsXNpUESJ11nAzgL8431Qi8rFIP9bKPC1LEGZ+cxqqJ+8QRO91MN82fSiyx8LSzmOOzDjInIAy5n/07WkWEhbDacH/uIwJxsFtwUTSPQ+awYTMNN69kQ4aDw1yOX+oQWXZeXvB8pIulzhsuKJ4SCGrdOXnfgLL8zUs679wjNvSfnjXb+SgV4sLeMMN7OK2JNcuaJdTvVWm7PxSx4928WncEunncf7cXvkPgYWejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMZdZVvlSXOa81REw+l3bh2ESgOvr+lB48LXGcagiyM=;
 b=s9tWpbAcMK3sDs9vkbZ17/0wpKNmJymOWalZQqNxf8/eASkn3G/IykwbKslWMncj0Rct01wsNLKnaS7zT3WQzKJuqk1HNvIhlfSHiWZiTeItx52NZzOUy5PatpV2of+Scak4+qoJqmewriGs5pvRWQcLGb0NFgQ5NfWL09T0MH7vCHLarb7TFHhbIa9cN7sVyOpWRO3s8Jk0fFJdfk429pF0Bf5eksSTpenoiGpcH2QsnIHeINdfLaiA1olB+wrvMrOI7zncsJgd/ITbZgy1YsqwERUfT0HhBsdcWxJrQh4gkcaL8AV5UnmI+Wnt3ryBAAjCue0tVcf3c6l1OdspsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMZdZVvlSXOa81REw+l3bh2ESgOvr+lB48LXGcagiyM=;
 b=i69bziExQ53edngu+zmGcDae+LGQr7MHtGZ3TftY51wo/SdzDghwuxNj6pbq3nOqxoOGNt+5BXUl7Rms3UK2+0uAh6gRhdP9Q7QaDVaPLOE9U9rZNS8/fbFipCk96Dd/9TUT9QpEMr+rQ/6FDreALr/r4K4tDnKvJRwkcBR+NE0icCdhYeMfXR+QKYHj9scRB8BJNiJqWV+uLf/oEG10IPGLVkHRdxK4afF+BgUyYqsoQoppZc3I0VTqe4oMVH6c5WZf/zH/0L9g2k+zhcCi5yWU0VSbcfojLFdQABIGqwVWixY2iqq71Gygi+zHdSR4Fa0fDpHeU59e8Upybq5SQA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0979.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Sat, 7 Mar
 2026 05:22:12 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.020; Sat, 7 Mar 2026
 05:22:12 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/13] media: i2c: os05b10: Update active format before
 adjusting framing controls
Thread-Topic: [PATCH 11/13] media: i2c: os05b10: Update active format before
 adjusting framing controls
Thread-Index: AQHcrWWbBCA5F4vFtEy8NDemy3uU2rWhgb8AgAECI9k=
Date: Sat, 7 Mar 2026 05:22:12 +0000
Message-ID:
 <PN3P287MB1829F11B3BC3D07BE13C4C228B7BA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
 <20260306123304.76722-12-tarang.raval@siliconsignals.io>
 <aarYbAf8jnodZ4UV@kekkonen.localdomain>
In-Reply-To: <aarYbAf8jnodZ4UV@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0979:EE_
x-ms-office365-filtering-correlation-id: ac1fe795-c0be-4f21-d37b-08de7c097d01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|38070700021;
x-microsoft-antispam-message-info:
 iC/ejHCitQNFNbN4sqeI2BU4uuPS+CP2sB5pCvUK6qEIfLXqDMitVpi49PDO9f6bOErTzIe8VJz3BGa82dpCM191jfOJl0ooroHYbchyVRJXIbuH3d2sJmGHLxTc2K0tSI9yxVKIOF7Hc1As2Yub2PHp7mw+LBUhoaeZxbvJ1L0SQ6EjwBe+Cwm+R1UyL1FTQ923RuB/0uFJXnLnucDONhehxNSOzYNv6B6W2eFFj+Hy1e0n8y1fMoY/KxHewVAXia9Bb+DDWXZzOp2WuClRnBSHmkv/4K/Tu51DPd1G1NVGbWfGhxIlXp49q1ry0SiJkQdx07bazvOaR7OeK4WeZyx0e+mAoYKJEOneEMTKu9wGAepWFBQWwJ11pnF86GhTeV21xTDOiuLwyLYI7SkCu6dBwrxwcq7U4h9cLz1nI7v9tfndvhhu3tcLLhlV4+BvWUBW0ucLLnCViSQmvxiCuCDjvb3GC+03S8Hr4B2k80BIAQjDoaA/L4s9o+AlnbfIIfeHq+8emcd61+w+A+zbqXhU8w961gcLU2ChN81VLGMMnOKqezJDpthjacoTuu/7F8qb1iMX7IrtkDkWeNFTIZpCbz/kptB4Lqb4cuqIDd6euVTTqKFx87hP2hK8tRJkBjHwFMNmgC3qHaX41s9EXXquUylm5bVHY16pmeoNa9Z+ri8/9jpT1p2aUwD/WIVjGJfk96k7VY+qhwHZE0570+hWyMOBp9ncaTx81vLXf/WQe4zXMruLSLlIc2yQUFgr/zJBbhlAw1W6DncztS2GlFXjq4MW/4ZDRobdZnCz6iE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8UoCQhw3+PcCHQCSvsOEg21likCkWSuBDZv2By5W2z+9/sS4eBQfDq+W26?=
 =?iso-8859-1?Q?8o5kTNVfDkMSt5PoidVbL5guajrM0l4drEdAo9TKuVRYPoCWm/LC6FYSRM?=
 =?iso-8859-1?Q?LoqeHKGk6XVRYWQYELhE2bYhPD8zO7MSHGLlcT6TrNeQD50pLVJO6VRCft?=
 =?iso-8859-1?Q?YD3X0PgXv5O4F4tQqRJlpAMPZSc+367x+VDHxZ5JgWZUAadgfkEHDSYs8/?=
 =?iso-8859-1?Q?PlF0kjXVKKS30/mIZxtepTPhEHIaShj4pgxSdmgaulehC3PCUvqeohgJmq?=
 =?iso-8859-1?Q?R7iE41GeEhDD6ZIIUExBODPyJqaSNNfGekhBjFFxjQpWxcrDmIYgOhNqIT?=
 =?iso-8859-1?Q?sFO9Qj6mcu0yg+UcaoIp3/Ig0YuDiMhiE1Lq9gpz1ZBfz8LqB8BSaOY2xL?=
 =?iso-8859-1?Q?t5PsTQIocXLvEgeeGJpBJURJa5qn7id4BuxYtY78J1XYTmMmrbiFhYpIBC?=
 =?iso-8859-1?Q?OnimGlulZtsgiCIEkUAEXpgaHq59IgiHFLL7LQI0BCIIr+Za9K6iu3tOSU?=
 =?iso-8859-1?Q?w/RYfbGbdIu/Rmb8SSR0jVpDeYhV6ZnI6b4v1Mu6iVWxaNJ7uoW+8fqEeO?=
 =?iso-8859-1?Q?zmqy2gg2ryVjJjlWlIx75ScIYT89N5bm+2/7rG3qNwJ0VeTaYvnxU2NEK/?=
 =?iso-8859-1?Q?mpSPAwVTmaq+X+yKsoWygL7V7edzU8bmR6llbyM/N0Lfbhd3a03Xo3935y?=
 =?iso-8859-1?Q?ghrPWJ3V4KMwLgT2sredKQWuPok2TpsG5TUdWoHdBWXFlu3MV3mwHmOdCM?=
 =?iso-8859-1?Q?skNdCq75ZxdYhk0+9iRnKe2bPkSs3bnefYoj7nHl3RFxq+1AZxx2GbQ+ew?=
 =?iso-8859-1?Q?ERGxURXu1ygNreX0XBBZduH4NoUrFu5PxP2ZYsI08zor19Xl4xnX8o/ErJ?=
 =?iso-8859-1?Q?vJ1tnAh4Jdie+d7vZEWPqhULjR5SS8aqqKsdo/yUIB8iikOFxakgsJW337?=
 =?iso-8859-1?Q?dRAAqy+G6t8i8Ht645L+/GIzYzNeShdd40JjzzpfO1KWBdmD9+KhX1/wRB?=
 =?iso-8859-1?Q?pk6skRTk3hfwvK4qrzTLdbVI34NM/wOJP9i0JhnBQIV1/P+aYJ4mE6j16m?=
 =?iso-8859-1?Q?1gnM8g+Lx3WkjiMZhfzstXjPQNlKJEKiW6U7NAL7m7n1jYZPTovogiRDCn?=
 =?iso-8859-1?Q?GBLTD+QerDQ3gIC+25FSSlvWRIjuFZepvT0R0b1bQEr91d7pebkITgcqoH?=
 =?iso-8859-1?Q?+ozyGpjPxGm95/4tdPOS9mcx8+oKeEfnl2rg8KUgFM8eWnMsSws8ggj0RP?=
 =?iso-8859-1?Q?iRoTQBJCgyqgQEJ0PTntdTLt38HQ1bAA8R1B2uA+/hUpE2dwN1fXn0bQ9l?=
 =?iso-8859-1?Q?M/Qv70CvCLvln/8hG0MbRkeJJkSu4x23OYvtaRs4szfEp5zNBKzJHmfkmB?=
 =?iso-8859-1?Q?th78NlR85WkJa340wSkzxWV/d+rInHAZt+koK3QK33j0B7B0I6L4d+lQaI?=
 =?iso-8859-1?Q?k1NafHJlgkC49Pzr8LxVV2H0OpzmGy6VVQ6HNSpqc5ULWpLoni8g7Xz+Ka?=
 =?iso-8859-1?Q?v1E/S+ikr485CbYCATWHCC+73wMyGu2ZKrI+GL4gFhjb45M0HwED/9D5z0?=
 =?iso-8859-1?Q?aYn8B/8V5Jf8vxzWlCaa4es6PppJjsBpFGCyemSeZZfVjDB5OiYVmkdVTA?=
 =?iso-8859-1?Q?Hhl3Vo9f+YJ8/6TlzbCe/NLo/NfF3lyD95oGmcKoj6w2RRFKVKkmlAggJT?=
 =?iso-8859-1?Q?cnuG5JXE5TrrzC4nW4DTre33OAzENsNF2q1uc087Nw9siYqChk2OV+f/y6?=
 =?iso-8859-1?Q?dlboXNz+0ngVOPYZ4BbZYDzavf68kCIMAM4LCpgYIWlU10vAq+vgMcf7Rr?=
 =?iso-8859-1?Q?U5b26A7cy1PXWNd75CZcUiux7q2oMi5q3rW3vdOFvTw9/wieUlrdM4flUX?=
 =?iso-8859-1?Q?Lw?=
x-ms-exchange-antispam-messagedata-1: xIKINq3LMYf4sw==
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1fe795-c0be-4f21-d37b-08de7c097d01
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2026 05:22:12.6574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E0OZuFtM5Nk7kBEdvV81NrY9TzSfAxYKX/bMLCxUcgNKDFGVzEhcLrUze023nmpw1K9pt6TV6axu3z86wui19q5JgVGWuc2OvruNyBBq748=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0979
X-Rspamd-Queue-Id: CC48C22A354
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54843-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.951];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,siliconsignals.io:dkim,siliconsignals.io:email]
X-Rspamd-Action: no action

Hi Sakari,=0A=
=0A=
> On Fri, Mar 06, 2026 at 06:03:01PM +0530, Tarang Raval wrote:=0A=
> > os05b10_set_pad_format() calls os05b10_set_framing_limits() before upda=
ting=0A=
> > the ACTIVE format. As a result, the VBLANK control handler uses the old=
=0A=
> > height when recalculating exposure limits, causing -ERANGE when switchi=
ng=0A=
> > to a larger resolution.=0A=
> >=0A=
> > Update the ACTIVE format before adjusting framing controls so control=
=0A=
> > callbacks use the correct dimensions.=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> >=A0 drivers/media/i2c/os05b10.c | 4 ++--=0A=
> >=A0 1 file changed, 2 insertions(+), 2 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
> > index 4601e33b7e8f..476dbcb49351 100644=0A=
> > --- a/drivers/media/i2c/os05b10.c=0A=
> > +++ b/drivers/media/i2c/os05b10.c=0A=
> > @@ -902,14 +902,14 @@ static int os05b10_set_pad_format(struct v4l2_sub=
dev *sd,=0A=
> >=0A=
> >=A0=A0=A0=A0=A0=A0 format =3D v4l2_subdev_state_get_format(sd_state, 0);=
=0A=
> >=0A=
> > +=A0=A0=A0=A0 *format =3D fmt->format;=0A=
> > +=0A=
> >=A0=A0=A0=A0=A0=A0 if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D os05b10_set_framing_l=
imits(os05b10, mode);=0A=
>=0A=
> Does it take a driver bug for this to happen? Presumably? I guess the=0A=
> result would be somewhat inconsistent state in any case.=0A=
=0A=
In the current driver only a single mode is present, so the issue is not=0A=
observed because no resolution change occurs.=0A=
=0A=
This issue became visible while adding a new mode. During a mode switch=0A=
(from a smaller resolution to a larger one) the limits are calculated=0A=
using the previous format, which results in -ERANGE and the new mode is=0A=
not applied.=0A=
=0A=
Updating *format =3D fmt->format before adjusting the framing controls=0A=
ensures the control handlers see the correct dimensions.=0A=
 =0A=
Best Regards,=0A=
Tarang=

