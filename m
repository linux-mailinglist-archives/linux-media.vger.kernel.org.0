Return-Path: <linux-media+bounces-66408-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CooPFiy0RmqQbwsAu9opvQ
	(envelope-from <linux-media+bounces-66408-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:55:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E32816FC57C
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:55:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NacNS6bg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66408-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66408-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EBD83026AFA
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 18:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B418370D6B;
	Thu,  2 Jul 2026 18:55:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0FD320A37;
	Thu,  2 Jul 2026 18:55:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783018530; cv=none; b=opdB3kLDFJ4P0PS8e81GzOYKPmKvC4qhxCyJTtm/GoajUGDrNqqBcJVMgC9wz6ektqQTxpdDI71DIWBBdIf1EKc3RWG9nh7D68ziFj/aeJcm5Ozvng4eHbdCalYUpNlFiwcOfrjcd2mMnQLtUR9qOUHRFUwZYGGOo6Daup8Dk7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783018530; c=relaxed/simple;
	bh=fZoXJ0otB5ZNc3pKIpIeJIi0McT27o2uRePOmhSRLr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxUfKUJTfYo9wh1e1mzLzf707cEG3rLVCDH1OnenmwLlsCiIhzfQbpMCSfNVOVuTCOSpuRC3zNrKTL08dHc8dsvkT4MW7bq910i8L7Pfm5deYrjkul4JynhQ8UlMKHiGQWcLTSh40qyBtihuA1KriADGH7XeHdvtweYwxPLFtT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NacNS6bg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB9B1F000E9;
	Thu,  2 Jul 2026 18:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783018529;
	bh=fNS4tqccb04+QtS0h43Z588lZs7oUTCl9VD/wpTFlbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NacNS6bg/nGPS5YUVw5jH76wz5YShTWSyyE8s+P9wfrl2yzgf4tTqcvZHd84S/7Dg
	 DDaRntRlSXAQmnWC9ElrOfi+TuWSbnb7FQi3I4Te4lO1VsC4K6hrneeJsRSTr2B5hG
	 v60VUaXomKc6i8I8XKVWIzjnJsOPFhn0XrSMskbWikxlCGMT2LKUKUChoG6CXUGT5h
	 koccK0yAKwj+292C599zTt87zjQ+SsCFkTAFkjKlxCEFClwz47A+xtLqXaKv6pEn3h
	 51yzH/sYvncroPFkvHbxw8GTs8sxwIWGve6jNtawVKeMepHRu8pziEf52iuZ80c7LE
	 4SHH3bL6VawbA==
Date: Thu, 2 Jul 2026 19:55:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Kyrie Wu =?utf-8?B?KOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	Yunfei Dong =?utf-8?B?KOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Irui Wang =?utf-8?B?KOeOi+eRnik=?= <Irui.Wang@mediatek.com>,
	"rongqianfeng@vivo.com" <rongqianfeng@vivo.com>,
	"tzungbi@kernel.org" <tzungbi@kernel.org>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"haoxiang_li2024@163.com" <haoxiang_li2024@163.com>,
	"ribalda@chromium.org" <ribalda@chromium.org>,
	Tiffany Lin =?utf-8?B?KOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"fshao@chromium.org" <fshao@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"fanwu01@zju.edu.cn" <fanwu01@zju.edu.cn>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Andrew-CT Chen =?utf-8?B?KOmZs+aZuui/qik=?= <Andrew-CT.Chen@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kees@kernel.org" <kees@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5 11/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Message-ID: <20260702-parlor-disband-fdc2f049336c@spud>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
 <20260603084045.17488-12-kyrie.wu@mediatek.com>
 <20260603-pentagram-unleveled-8729d0003aa7@spud>
 <6cb7ae4a09d476a04ceefca50564646712ad391b.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JdEKl3bSogEo/Lcd"
Content-Disposition: inline
In-Reply-To: <6cb7ae4a09d476a04ceefca50564646712ad391b.camel@mediatek.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66408-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Kyrie.Wu@mediatek.com,m:angelogioacchino.delregno@collabora.com,m:laurent.pinchart+renesas@ideasonboard.com,m:nicolas.dufresne@collabora.com,m:jacopo.mondi@ideasonboard.com,m:Yunfei.Dong@mediatek.com,m:conor+dt@kernel.org,m:Irui.Wang@mediatek.com,m:rongqianfeng@vivo.com,m:tzungbi@kernel.org,m:tfiga@chromium.org,m:robh@kernel.org,m:wenst@chromium.org,m:benjamin.gaignard@collabora.com,m:matthias.bgg@gmail.com,m:haoxiang_li2024@163.com,m:ribalda@chromium.org,m:tiffany.lin@mediatek.com,m:linux-mediatek@lists.infradead.org,m:p.zabel@pengutronix.de,m:sebastian.fricke@collabora.com,m:fshao@chromium.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:mchehab@kernel.org,m:fanwu01@zju.edu.cn,m:linux-arm-kernel@lists.infradead.org,m:Andrew-CT.Chen@mediatek.com,m:krzk+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-kernel@vger.kernel.org,m:kees@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:conor@kernel.org,m:matthiasbgg@
 gmail.com,m:krzk@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[33];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[collabora.com,ideasonboard.com,mediatek.com,kernel.org,vivo.com,chromium.org,gmail.com,163.com,lists.infradead.org,pengutronix.de,vger.kernel.org,zju.edu.cn,linux.intel.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,collabora.com:email,vger.kernel.org:from_smtp,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E32816FC57C

--JdEKl3bSogEo/Lcd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2026 at 05:39:24AM +0000, Kyrie Wu (=E5=90=B4=E6=99=97) wro=
te:
> On Wed, 2026-06-03 at 17:14 +0100, Conor Dooley wrote:
> > On Wed, Jun 03, 2026 at 04:40:41PM +0800, Kyrie Wu wrote:
> > > From: Yunfei Dong <yunfei.dong@mediatek.com>
> > >=20
> > > The MT8196 decoder differs from previous generations in several
> > > key aspects, most notably in its use of VCP instead of SCP.
> > > Additionally, the MT8196 enhances codec capabilities by supporting
> > > HEVC Main10 profile decoding. To accommodate these hardware
> > > changes,
> > > the binding constraints specify a total of 12 clock inputs,
> > > consisting of 9 decoder clocks and 3 VCP interface clocks,
> > > along with 2 power domains covering both the decoder and VCP
> > > subsystems.
> >=20
> > I'm pretty pretty confused by this statement about constraints, since
> > there's none added?
> > The vcodec-dec node doesn't even seem to permit clocks at all?
> >=20
> Dear Conor,
>=20
> I apologize for any confusion my commit message caused. What I wanted
> to convey was the hardware differences between the MT8196 and previous
> ICs. If you feel that the VCP and clock information are not suitable
> for this location, I would like to rewrite the commit message as
> follows:
> Compared to previous ICs, the MT8196 supports a 10-bit decoder and has
> a decoding capability of 4K@120fps, using a dual hardware decoding
> architecture of LAT+CORE.

Sure? But your comments about the constraints are odd and I do not know
if that means you omitted changing constraints when you should have?
For example, using lat+core only permits you 10 input clocks but your
commit message talks about 12.

>=20
> Thanks.
>=20
> Regards,
> Kyrie.
> > >=20
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > ---
> > >  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           |=
=20
> > > 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > > decoder.yaml
> > > b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > > decoder.yaml
> > > index bf8082d87ac0..74e1d88d3056 100644
> > > --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > subdev-decoder.yaml
> > > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > subdev-decoder.yaml
> > > @@ -76,6 +76,7 @@ properties:
> > >        - mediatek,mt8186-vcodec-dec
> > >        - mediatek,mt8188-vcodec-dec
> > >        - mediatek,mt8195-vcodec-dec
> > > +      - mediatek,mt8196-vcodec-dec
> > > =20
> > >    reg:
> > >      minItems: 1
> > > --=20
> > > 2.45.2
> > >=20

--JdEKl3bSogEo/Lcd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaka0GAAKCRB4tDGHoIJi
0gcwAQCtMtUoW/cbg4OpVaaf+u+0oq30lr9mkXMb60IDpSgRaQEAsdk2ey0KDekc
nYS63SVumLqJUdoy4hxVqlFifZehUQo=
=16wN
-----END PGP SIGNATURE-----

--JdEKl3bSogEo/Lcd--

