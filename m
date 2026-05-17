Return-Path: <linux-media+bounces-61867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHYzNVsJCmrqwAQAu9opvQ
	(envelope-from <linux-media+bounces-61867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 20:30:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DA563225
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 20:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 759DE302452A
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 18:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3453CE4A7;
	Sun, 17 May 2026 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="I40+Fw35"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B4305693;
	Sun, 17 May 2026 18:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042622; cv=fail; b=Z08TA5yQ08JkID+d+NAH72X411RvkIL+XipwPQhHgma12dqVxnBPmcsrkCyOygnAFYWydpg6Yw3GB1YWpILJOsCJtfaPC1ZOAlP4+d+nacuJillD86r5YH/+5hrsttNcGaG+qvaXivJ6Rry5rIOKffS7npR0sXAOAOYKnIbaQ1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042622; c=relaxed/simple;
	bh=+E14mdCO4w23QiJsjdvmKOe0v74nz9J0REzl4tSS5SA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=isTSMYin14x4q94XUCEO/WK/dHxBf0/I8NNc0gGk/b92A6GsFC9MCHOrY8biEEMHX/5vGyQu7jFdBYbQdf0oaZYxg/1xSUQpjQMAhmMQ7LiODYiWq6R55FoLL7ZjUyF79/z7t8egELXXaujNAR6x1hYo7fGLUApEBeA4kQcvaaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=I40+Fw35; arc=fail smtp.client-ip=40.107.74.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCndcWEBNRIYm5znwkK2L9gGoX/1HLIc2szpv20yrmXa/1NkjtAt9KPCADD3XZdUsc2oPdwFTiS3rhax67gNbMzBJKmmVE4AqlZWpq1h9HUvP3ZHXyGRTrnN8C5wnz46KAUb7ypN++ku5sqxYdZDPvBXNKsqmznM6npMN9lDHmfN/SSuVAFLDeWBe8/70jBz5ry5WobLutJ0haovUd5OlaJq04dbXoancCD9+Zp+UmJhQ8bxhmmoZVKygMeEl8O88qTa0mIcuZJmI6IiG76ZtZpoSiOnrswONo4x4N2LRux7qdr2Ir2ZSgMKhJvxlFfQmxhm1Y+2n/dT6wZbEk4/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJxBqlVT8Qq9bhPgEJok5tRSKL7umh5El09ODjG9Deg=;
 b=nvGX00ZyY2EHgcrCK7zrZo70vXAg5dNA75KNBVTP/Z5LObOtarl5Em1clOqK6Uo5n0qduVOa6us0++I2Z8CfXuR8W/S4p8ycZBlp9/MXDp6IlRTgiMyglUUTWAIwKouuYXl6ac/se/+HBU4bHqKTDm+7VQ8BivMA37euLTJA25wQ9DWVNtGfC5Ib/5P+FSfbInFmqa1dkoBuoby9XWp6meiVM/5hjVrprNt/VLr5G6+ZLASZ1ZjcFhA1Wqt29aeYyA8exUhkdD6Z60BTIC3DLauPHMh8ZSXrzEtrsQBVz3J6jkGvxcFMz+WOHUeqzR5PjafsbCve6M9z8udGYQ5H3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJxBqlVT8Qq9bhPgEJok5tRSKL7umh5El09ODjG9Deg=;
 b=I40+Fw35NjL6qCWSUCVS5lui52lpb9Tu92qUWaPmqWaG5Ipi3YpjMxJoyEDVcfSlGELMX5zfyx+UnKfudDz6rK5BMqoj1SP/chD821cRhKt+01qgePp1eLHET2gVKXWoZe9vyBUSSHWipYQUVNAndDcdCtAyvPIUWUqPqXciYA4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12725.jpnprd01.prod.outlook.com (2603:1096:405:1b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Sun, 17 May
 2026 18:30:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0025.022; Sun, 17 May 2026
 18:30:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	tomi.valkeinen <tomi.valkeinen@ideasonboard.com>, kieran.bingham
	<kieran.bingham@ideasonboard.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
Subject: RE: [PATCH 04/11] drm: renesas: rz-du: Switch to new VSP API
Thread-Topic: [PATCH 04/11] drm: renesas: rz-du: Switch to new VSP API
Thread-Index: AQHc4aHYFosoVQaP6kCr3S+Hcm/SQLYSknig
Date: Sun, 17 May 2026 18:30:15 +0000
Message-ID:
 <TY3PR01MB11346319648FB960CA238884C86022@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References:
 <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260511235637.3468558-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To:
 <20260511235637.3468558-5-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12725:EE_
x-ms-office365-filtering-correlation-id: 18880097-c198-4186-9b14-08deb4425730
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|38070700021|4143699003|11063799003;
x-microsoft-antispam-message-info:
 9bjxGyUwLEjraGAfUON3NYxKZDgCxNdi5fERrPNuHZjvJ3POtUnEba3QuGVlPWP/ROl6/CdX/BGMHesvChoSi1d+49/+KdC6OIvvIZs8F3+joF0KifSuB0sqhQWkIlc517DyyYtmCmIGM5CGPvFWl3VosW9N2U+jnFN5IEm9GVOEgIp3qAT75QArJ2dmb3Z+4aSanRaAhr3i1QuCNBjMnBPtoEOsPtyZtXmJg7shu0XaNtJGOfMbJfNFoteZYEwKk816ChUp1pciPtNsQ3o2aD8x5GlbkOhbMHYa+XPdpV9GM60dVY/sxo9GE92kKV1a3VIqykOBbCSnfXDqd/5mq2nKVBUPnDE0hWuOoFaKFKPfgvx0LmGByV4XQ/8WMVBkDXIHlMqYaMyOBC0vrdcXL9zjp8V0g1qw9M0HCRGvy97K4Phraj8yLV1nQkajPS8sJDQmnmGiTqKRyUVVGcRvyqM7zAx9f2A0CKXIDCxN5iyzX+f4fHBixr/vd21ePIMb8LUwczsVjd5MfNL/ACTItY+iNhqgonJO4WnLXMc5gU780v840biYeT4OFQsXN8tfgq6BUd7YTbo8i31zVQTjbaYdB0SERRT+AxmO2M/ly8qoDQtS3stMJcd2iOUWT7bctsLOFpjCq0on1tlrZnHPMpvXikz/eGspYLPzSg2VlufgwIW2Y28RDCAltpzIt4fWY2+hTWRH4jsHuZoHQdH8vLkHNDqYGdEDobtXcMnE1CbC6cjMduwH41li7BhoweXl
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021)(4143699003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+N9e9+vIE7eaHU3idTR21nipRZrr8GMrsLQUOV/1PGIizFPaJDSKRpGJxcgP?=
 =?us-ascii?Q?m7Bp/87BUWUpiOlEEDkbLiUP46lfLlILb1HY+grIqFlTgpAbehjOM0FPj1qR?=
 =?us-ascii?Q?EeXUhgDoKjta3WUi4Owklhrh5B1Ls1De8pBtRjF+vRe8UY0ergX9FE3w+w9z?=
 =?us-ascii?Q?zC7kpm42bgWJT9Fv7/wxRG9H/XY6kBSgz1CyV1gOd6b3htyOmfA0ZXgTkUEt?=
 =?us-ascii?Q?yIIZYpt+qnfwqoogDQU2Nqw8p0c+sMiX9IbBy4j8QwD12FiwW6c3eTGyDxnA?=
 =?us-ascii?Q?jithaA5mZAcGNmaa+xk1sL9sGd215DtLwSRYf93RZ6thw1adBQ3JuCJ+Q6Il?=
 =?us-ascii?Q?YOmdoi7rqVd46JQYRiqcs1knBow4VXXG8AAmz2hHC6hD0lmeB1QPWjOh+SXD?=
 =?us-ascii?Q?LivKcI22e2x5u3SisKsT9rVyGx6zUfPRKmiA+6G0v+vrySTEW0KjMjXKB6sR?=
 =?us-ascii?Q?MZqDuMP0FbCQhq56tsEQWNyyQ3YyV2EtboOtRdocsUShsIcrEG4scIzWDder?=
 =?us-ascii?Q?sjXp5PpmoknAtqHNy+H87UvOpRno57HPeH3bz1lOkaxbKJqZu/2yjSmqBFnM?=
 =?us-ascii?Q?5T/XFhiah4Beg4/yeQYb3IK08KlBMfMtHvTmkw2pUfu1FlzQqZSBDs8SLrMj?=
 =?us-ascii?Q?uZigD+T0OGFiYvOdwNMzYhjvMM/yUivSCyYepMj11iw3fWjO1AwYfmnWLEIG?=
 =?us-ascii?Q?/wG8o2rAN4Gp7M4pJ/gs2Jc+1b77sQEvi8NFNIvjLYhbAXsk5U5ixKLGyCnx?=
 =?us-ascii?Q?mbrYPfMIQKb+HYcyO1FGWAxg7AX44fyNF7R3V48wK4WcN4KVaqJM2Cofk4MM?=
 =?us-ascii?Q?+OpBacJl9uopxsZLnlPBKieifUGmTP8bzqSClwZFsMNfei6J8alPtfqdm2Z7?=
 =?us-ascii?Q?PdrkXCvEsZWOfBT0dQ4gjsbavW+50M6lpI1c/VHEHRrf4X/ocpEUuiNicGdf?=
 =?us-ascii?Q?3WC4uE9dqq84v9qPbUM8EZJJqnX58TsMxIDvId0rLjJFqmpQKfdoUErHuROp?=
 =?us-ascii?Q?Z3IkMnE6X2h/x5ZC+YUGtJdUZs7tOQfWkxoWxRvod9pa9y1GcP0mxiZoQC5W?=
 =?us-ascii?Q?IIOXeHfH1uAbHPnBlftXChuc+/MzzB3ASI+XKNlCHW7NYd6Kr+uVXARYpDUJ?=
 =?us-ascii?Q?WsB0wZsHZTjKg6B76YkcC9TiNXLq3jfQcgudQlDuUNsB3pWSpLUXA/b3m7oU?=
 =?us-ascii?Q?B58GTCX7FyBxyhV4eno2S8OJdk1GsMykND2e9sovMdWw61dUY/QJXg/H/Hjh?=
 =?us-ascii?Q?Ys3GR6emf9Pt29KKqkYT5D3eOybndeSyccS/WGPymZ0CwFfpKKQzaUzqqFbE?=
 =?us-ascii?Q?yNOHLZQcoesvnFTr22+W5AdvPewTlsVvV6bkvOPL+tX6ow9eDLy86SN2O5ra?=
 =?us-ascii?Q?y/IsUdofsMwrQpaOzeCrEcJTbtSUAwCPxQsAYuOi4yuIZktjsMzN6HrGa1M2?=
 =?us-ascii?Q?6Rh+GmmTmi8uNN8klz7uu+KqYhkxIznVWXa726dTPa9vO+i+vzAG3p1Bw87i?=
 =?us-ascii?Q?zw1csVWt1oFUhAdNuMCi6+RfDjOl1rXEm1PbfDr7AOebHFSqgri5dOF9CseO?=
 =?us-ascii?Q?1EzADe9t0ke6RWycEZH0tqJEoGLUCSB8rzsUd/+aGzWd6Y0i5CeWqiJfLEhK?=
 =?us-ascii?Q?Je5A5ybba0WNiEwxn/Sba6gSl+JwwQQcjzSWKDk4UNt2LaTuNbi49n3Emk1M?=
 =?us-ascii?Q?MXaCcuNq98CikCVuzZXq3XDVdwmkKIsgIKGeAXvNQbj5Rftf91M1WbzhB7tA?=
 =?us-ascii?Q?oG0zUpdkjQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18880097-c198-4186-9b14-08deb4425730
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2026 18:30:15.6302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TPxtS6MaAn6q5paX3EWaP7YlF9Vrr5zPmiVUVsc8u9xnH2930ri0nOIhrOvMQfH7K4gOz1KMaKWFC01r7N/IGwxXGHg4WxJATzVnVIqezmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12725
X-Rspamd-Queue-Id: 513DA563225
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-61867-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,ffwll.ch:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,lists.freedesktop.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Laurent,

Thanks for the patch.

> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Sent: 12 May 2026 00:56
> To: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org; tomi.valkeinen <tomi.valkeinen@ide=
asonboard.com>; kieran.bingham
> <kieran.bingham@ideasonboard.com>; Biju Das <biju.das.jz@bp.renesas.com>;=
 David Airlie
> <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>
> Subject: [PATCH 04/11] drm: renesas: rz-du: Switch to new VSP API
>=20
> The vsp1_du_setup_lif() function is deprecated. Use the new
> vsp1_du_enable() and vsp1_du_disable() functions instead.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
> Biju, I would like to merge this for v7.2 through the media tree instead =
of the DRM tree. Would that be
> OK with you, or do you expect conflicting changes to the rz-du driver for=
 v7.2 ?

Yes, it is ok for me. I don't expect any conflicting changes to the rz-du d=
river for v7.2 in this file.

Acked-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_vsp.c
> index bd486377f037..d5a1d36db2c1 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> @@ -55,12 +55,12 @@ void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
>  		.callback_data =3D crtc,
>  	};
>=20
> -	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
> +	vsp1_du_enable(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
>  }
>=20
>  void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)  {
> -	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
> +	vsp1_du_disable(crtc->vsp->vsp, crtc->vsp_pipe);
>  }
>=20
>  void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
> --
> Regards,
>=20
> Laurent Pinchart


