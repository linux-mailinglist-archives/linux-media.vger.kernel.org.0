Return-Path: <linux-media+bounces-4140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC8183A84A
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 12:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CD601C22ADF
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 11:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44A51B599;
	Wed, 24 Jan 2024 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pw0UAUl+"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2095.outbound.protection.outlook.com [40.107.113.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2275A7B2;
	Wed, 24 Jan 2024 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706096399; cv=fail; b=B3bGjoZSzhpv3qTL63MOmydHe55/H5RwYjIkWyEK7UT8gtGhZoJ2UNQGvnKOHbshEEO5XPUHoG0ZpoWjJTsCAiPI1tFGCU9wEdb4AkoZAog2bZDHhfy9oIDN8SXpE1jCfAeiaX52gTIjGYRnNuKB816u9K+xMilJTXliLn3AWDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706096399; c=relaxed/simple;
	bh=pvEOv7HYnP/btdZ7V0E/sJBVx71GfdIviKBMNYVjJ2o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sP0/N5TkqEDDzwFVFq30gz5kmmluD232S5vMN26YnFKPb7K9eM4hk5vOTHcCKf68LV9IhN0v2l/DAzxqLTfmlPsuFY95b6plJ3FQP7+ONVgTD+8R0m80DPUqfyOBjIH3mY9ACQHzwyhX5sXz+fQ/nomo4iYtm/gIkS0n4SBH8QU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pw0UAUl+; arc=fail smtp.client-ip=40.107.113.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e46+G3L+BfJuK2YKCJWa8t5DYLP8Ol49ckQKC1z6MHK7dufjEpo3ukH8p/y4mN/1zTAD0jL4tbutIZLup6WABgj5fLL1QKQ0Lq/A2AKxxCgamPHol+qFjvFGMh24fNXYyKMs8Q+1ZgyrL6MVTXbIxS8h3jFbEQKAguIBm7EmnR7SwoMDRZcSS5ezdk+ZMsckdFrgLBYYmFo8YQKPBsaSxZ9C5mW/T/gLeK8GJ5TElXOhMZzm9m/RdjF/6QYkS2N0/gnjubHrdMYtCVZMiVNxDmjw8AV1vfipTNmwILXOkZHmADEzBXvRiLyL5EAbFLRB+f+fklbwbPAK2xfHt+iHnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvEOv7HYnP/btdZ7V0E/sJBVx71GfdIviKBMNYVjJ2o=;
 b=T3DFuxE5+hJGk6FJxieUKb2fLG5yqoVIpJyaN8xBjg1gZJzGmjawdP2le51JC4NbqeqmMYb1ETPCBwATgmE/6WlsgLm2VMEyU5SSk6bgE1uj+At+sRrafFqLq91NtWekR9Trg31FR8ptG3b3ZKEWevbaXJmEhqn2ul2EiRb2hlrSHZmMQ5F7dtrt3ixuGFYNMcsMImqetcVVtGzIFuET8GtEh7iwYvW6HfJ/INS7mdIXO62eZ5y3C/SHxZVLHsXUtCnX/WfN767sKhmHgdF/AaLsnKtZIuXiN215y1yGkl5yD97dffN6z/1WbpsNSRT/NZwIDnKzsF1/CuxB4KVnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvEOv7HYnP/btdZ7V0E/sJBVx71GfdIviKBMNYVjJ2o=;
 b=pw0UAUl+BBUkrfX3xgHkTTFCsQ2Hee5yXT5haaXRhW3U5fM+cPbLQITjCedhCF7AT7g4zkhvP9UBGmtj2hz5Yyz5y8Gjcb/otPOAQTf5GXUpd2sSOFnEmQCTd4LyAXluVqGZAY3cASXtrCU0PNXFEe+/oYBjsgbOhtkDOMXX2SI=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TY3PR01MB11872.jpnprd01.prod.outlook.com
 (2603:1096:400:407::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 11:39:52 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7228.023; Wed, 24 Jan 2024
 11:39:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/4] media: platform: rzg2l-cru: rzg2l-csi2: Switch to
 RUNTIME_PM_OPS()
Thread-Topic: [PATCH 1/4] media: platform: rzg2l-cru: rzg2l-csi2: Switch to
 RUNTIME_PM_OPS()
Thread-Index: AQHaTfN9Uij8sadCTkmiU8hxdWoHD7DnheYAgAAqlgCAAEdsgIAA39iw
Date: Wed, 24 Jan 2024 11:39:52 +0000
Message-ID:
 <TYCPR01MB112691EAE9B0D41E800D91441867B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-2-biju.das.jz@bp.renesas.com>
 <20240123152906.GP10679@pendragon.ideasonboard.com>
 <TYCPR01MB11269085947ED450E817D54BB86742@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <20240123221709.GB16581@pendragon.ideasonboard.com>
In-Reply-To: <20240123221709.GB16581@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TY3PR01MB11872:EE_
x-ms-office365-filtering-correlation-id: 82093756-5100-48c2-6d69-08dc1cd12dfa
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oIw7RU8FHIWHSQZz1HO3erZ7rQitHuWDR8UQCJ23lXcWkmevmlpjwU1kyXAwPeovXbFYHgwfPgH+Jm5JkNQDIBtw54pGkgpqOIwucEQfgzaN11rKMce5X1X1gDnMgnEpb4XRb2b71IiRZ2airwSXYQKzdJL3P5TmI2Z1xY/QfgZsuTV0QH1aIGJG2SbOvfUfR4uC3FOn6gR2yFYSBXrq2mmk9NbarwHGiQOKRgHXpBrc3SmCzNeDVD+4jIEgh4YwBESUUY5jCFIAbjzi3u0VvMEB1VzH1RlNPiFxUXZo0n/74dwRkFvNNFsFOykQ0soGpJqUbEczcPuRHnOr1BRr/Kv3HHhK9ZT13+V/qMk3mEOTBIz3pYuw7g9f+AfOLmfvp4NS/dFMksdPvA19om8UksPJC9gVy5sDMRZKXHI6kNGHxnB+SwI6elNLBjs8zySSDe6hFL8wHaPQXc0ikil4/a6Ty9zKSJo+DbL8Zf9degGCLAPIluh3ztTvmAHxMA4IJrqweyRcrq1A4uy2VZnYByma988fG6OQ11UvtiBb3JTD4cK8MDxOsyOr+4mYKZQDt2QkHY2jGCYXBMO7meEXclU/+QRuBl6LRlKO5DsvigAygRruGDrG+KvOPPjRr1l3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(33656002)(2906002)(86362001)(38070700009)(41300700001)(7696005)(6506007)(53546011)(71200400001)(76116006)(122000001)(66556008)(55016003)(66946007)(6916009)(316002)(9686003)(54906003)(66476007)(64756008)(66446008)(38100700002)(478600001)(26005)(83380400001)(7416002)(4326008)(8936002)(8676002)(52536014)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DfpMiGPYzDCGLlkeOU4LKIaXL8LwmY3w3c10GGfXV3506hBzO2E1oE3FB6?=
 =?iso-8859-1?Q?DgngJsFGhhUVNHPITf8VKysIoiWP8ffjY+T43Lk7qduit53d81OyayFy0N?=
 =?iso-8859-1?Q?PoHQ1GANs1HBsujV4j8RKGXgUZXDVn1lwRC5p55l2ATcNeeCFROqfE23lZ?=
 =?iso-8859-1?Q?llTCrPSIkPBsiY32MdMYRajmQRfb0QYawydLJugHX1x6zFHdFtiZtmHphX?=
 =?iso-8859-1?Q?Ls1lXsH9M0UWz9G3CetsB0jYWg8QL293eQ2H85KqIYiw6hbynWiV7j/liQ?=
 =?iso-8859-1?Q?vAAmDJzj4ps2Lxy8M0QoXqvVj7TL5c3Qg3xdYLwBDK+QD+jCDCu7PX0bfb?=
 =?iso-8859-1?Q?UheuV7dWJuF5lr0mvf6o0LuyVsDPPYazw5Yb5YKLdTq+1wDv9jAKgUv2po?=
 =?iso-8859-1?Q?xyDw/QjaHyaL3sVejj1mOVuLJxo1H3gd8M9RuWGCbIRPnJMLc4yR4TX5fT?=
 =?iso-8859-1?Q?/mE4x0EVuU7BWGiQoChitQ0ri23ykPUQWVgK3nq9oEeRoD6z9vvTx6cbZK?=
 =?iso-8859-1?Q?aYv9HfbwvaN6WDzbcxEf+kmzckRnfFkiTYR1rb0LI+W3ZgyzBE0EQB0QjH?=
 =?iso-8859-1?Q?7C1a8tZy7TspYPnrG1ih7o7daoNymDGI0RBQeRyOjENe+WSu5nTgLEa+UC?=
 =?iso-8859-1?Q?io0P/pH9KIzW0yGGqAXzevMg/Tu1WsHXogss90Op7Jj78/Q/uh22g7ks/O?=
 =?iso-8859-1?Q?oD5ImgKAXDj9vuafTsw9FMRkyVojByUNzSCE6f0EQXJ+1ZY7jksH/dhfte?=
 =?iso-8859-1?Q?FYdYX3sEaCM70XrRhxfdoHXChoqK3ak5bucYSWjt6RQi9kc1UqxqginyeT?=
 =?iso-8859-1?Q?id9+fiFXt4ZUCrovqDD9t1Gz5QEtKj76ffP2G25ectX6ZVgv33kNnIA2A5?=
 =?iso-8859-1?Q?0PXksXn2q4uzXk8S/4W0MRCkJRIRYegPrWAvCocGxDi/70m504A2+vJdx4?=
 =?iso-8859-1?Q?tEOfjHt8I7eZjOgw4Fjcj15uMEcyMJl4MHqjF4rEGAvIQIYgSMQeKmsoYQ?=
 =?iso-8859-1?Q?X7PbnLAnmtmzIq+q+V1W99zYJI3m6CBbibnol1ngD8dJ6Ze6nI5oaP7Pis?=
 =?iso-8859-1?Q?L9qdCfuFK5sf2reBUC+GxQiiuNsHFxaWEmV/Xm6Bng8jK3n/vC/3u7xa9j?=
 =?iso-8859-1?Q?/ohSxmPnwR/sJ4lSRww429jE8VYcY58K9NLmiDgTOMrlD4Nf+OoKYBj+sL?=
 =?iso-8859-1?Q?rSQtzC8hBhMN8GoBXY1/JTvotUY42A2Ft9nGAnx3DSHZPfCbbSoFKA+u6+?=
 =?iso-8859-1?Q?ag6kJj9Xo9wp1o4rJTNR0GGzdtUNXg6Zjl8GNpLKkdORBMcQoiGt7Awgtk?=
 =?iso-8859-1?Q?WsBwC8RGFouI61iVqRTvsIpwTDq/lhmfeeURfQdofTmBDhhL5plVEZiSvs?=
 =?iso-8859-1?Q?6JukmR5nz8Z9iLOK15z2JHCogoxSuEeGDZ0OcodVXXeiletXlgmYooZ4ra?=
 =?iso-8859-1?Q?wAb8JLF3cjqYEpsOn0qAbZBwKPn+TFqTxbed3hyis7YFzH2w++L/U6akZ/?=
 =?iso-8859-1?Q?GbEy0inLT9U0tSc6wE9YTUddF75AX9GvgGwE5iId/cM/zklLJ/9Arh1j+6?=
 =?iso-8859-1?Q?f32PPaSDzuUVCCzlssHQi9jD271PUv54mVNeeVLvx9gUIpbw6CJQp77hN5?=
 =?iso-8859-1?Q?n1x6ODgs5Et9E3B403diZ+JMDmxHBN5LH17f9wYrGfqKOD9z1SP7zC9w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82093756-5100-48c2-6d69-08dc1cd12dfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 11:39:52.4382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B34FRqNvQRxSNRtQPoIkesQc+A0X3pFQqfwfLuTMcidkCA/Ew2xnWBKJS+MYlswyktpCO/Vdk3ix9YlRgt4n6zcus6MKKTIohWjMwGb2RMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11872

Hi Laurent Pinchart,

Thanks for the feedback.

> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: Tuesday, January 23, 2024 10:17 PM
> Subject: Re: [PATCH 1/4] media: platform: rzg2l-cru: rzg2l-csi2: Switch t=
o
> RUNTIME_PM_OPS()
>=20
> On Tue, Jan 23, 2024 at 06:33:57PM +0000, Biju Das wrote:
> > > On Tue, Jan 23, 2024 at 11:58:18AM +0000, Biju Das wrote:
> > > > SET_RUNTIME_PM_OPS() are deprecated
> > >
> > > Not that I particularly care about SET_RUNTIME_PM_OPS, but I'm not
> > > aware of it being deprecated. Has that been announced somewhere ?
> >
> > I was under the impression from [1], this is new style and old style
> going to be deprecated.
> >
> > If it is not the case, I would like to drop this patch.
> >
> > [1]
>=20
> I'm not against this change, I was just wondering about the status of
> SET_RUNTIME_PM_OPS. If you think using RUNTIME_PM_OPS is better, I have n=
o
> problem with that. The commit message should probably state that the
> latter is better, instead of saying that SET_RUNTIME_PM_OPS is deprecated=
.


Agreed. Will update the commit message along with the changes you suggested=
 in
Next version.

Cheers,
Biju

