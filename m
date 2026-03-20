Return-Path: <linux-media+bounces-56431-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCrwLMWQvGlU0gIAu9opvQ
	(envelope-from <linux-media+bounces-56431-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:11:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B83A82D4657
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B58D73017004
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437EA78F4F;
	Fri, 20 Mar 2026 00:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dn4Bb4VV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B024A95E
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 00:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965496; cv=pass; b=iAce0sEwF0dCGswFoaGo42h+GH/2cpRIzlv23Pc7Nxbt5IM3AG72+xm/phQM/FKe4b8QvvmfgqHWSzg1WjWvJkOlpJcYklPw9TRDZ08bFfSiatgvOQdoQZcgmGruvOnZonaP1xvJOXrDs5A1bEQSlW6TT1DnvfD4ep9nwg48OaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965496; c=relaxed/simple;
	bh=gI9RF56rEVccfANAw0mjJRT6sIl7aJcBmX4u0k/0kLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6dM5T2SGctcjUD3mteI6qKXeXJpu0AJSXPtjd3+0O6OSLfRhcjIp58lRRY/YoP5wGplRvcBkCzR4X/4LcfrNj8Kmz/DJTPNBlA1u5AeHPvA5dmv6w5wF1+J18IGCoGWdF+Qfh3XTC/p9YIFxAtwWPyBk11bj8CAAJoS4xlQdTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dn4Bb4VV; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b97ed4ad579so16024266b.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 17:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773965494; cv=none;
        d=google.com; s=arc-20240605;
        b=kY/32gVASo8ILZS6wjHJ8h6Edbf7UQCpzNASaYvICw8ec8lgezIrcSGr8w/uMpEmqq
         I0XJpJfbQ3t2RFg1M1TeN+HDPoLzYNQPvhWqiglacdOoZv7yY6bcs/LfJVrEOHPEl9zK
         aUK3PNIl3JdmDEtx/dCTolbeGjcPFTcbf7kdIDBoxn1FFxyTAhd9fE/HIju8GSuI1z1x
         gKlwjxLsCJz4i3ccDfcyhbLdYMh+6HQrqrBc3FJpYOfwDRJyuFGTRNPokSImF/5dlCMw
         pzNDwYNkhdcAGNhNm3E5i8A6kMcRXq+1Q34sMfM0BBJrTZH8CBTmOiIYvD/XU7WMdBj4
         sp1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NsqY7865Oc2d7isEI7t69HCmXThZdea9XKdAmAr2SZw=;
        fh=To++y5S197ft6u1Cf/eyjYSEDQCinpbA2Esq9fluFcc=;
        b=N1BtBfMGaGpL1OO4+jsLzBaOrAUDPcAMv65uvznqRbUNWvkMEtHmPx9RTbRQi6pZ9a
         6DUA5pzs6mZhS2W6rqmiwQUhtTzErYL0mP6z53kxxZszAHNYDncvOlpE1wRmjNrtS9dk
         P24LcQYEnEfl1TD2684IBXlvjUD3Gi/LuAXYBQ5qlMBjfaIYQzqdy3yrfKYIwoErA/ui
         au56gIpk/wo5e7iSDxmdA8NliQcDyFFcyoAlUGmC6r0CPHZoFzGYgNDVb/4Af27AuEm1
         HYlucp4AM6WQV9IqebwlUyUtPxbvp4nznx/dF5Wo6adU4r/9OH2yiquo0LnR3L/0zG8L
         IRjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965494; x=1774570294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsqY7865Oc2d7isEI7t69HCmXThZdea9XKdAmAr2SZw=;
        b=Dn4Bb4VVwFQ2a9HnDZ4qzK2kBdn7HVO0V9Grp28Pirp0bXn9lyUUP7KB8oCZ7CqZwq
         OZqqg5BuBJOub7CKm4pf+XcDJlvaFSUbb4NMK+k2sXkCMtwPiC6fXAxiUaZhpIyw3skx
         NQPflVF/SgvWxgqGLapN+fchnNio/Q9krv8BlqNkQAASYmhhjP0XzRcq1YqF/+ohemN7
         D2r9Qb124gJu85M38R7SWM9OXS9EUOtMdvP3pEZxvlPjtJ8nx0Ui2P24hUfuzJVuEUiA
         40TYzYutZsMx1+QrL+ilOyIMG0UZ6793XBGaYgyniesySqo83gKbZqlfVyfGqb5cW8I2
         Ulqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965494; x=1774570294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NsqY7865Oc2d7isEI7t69HCmXThZdea9XKdAmAr2SZw=;
        b=JVgXFLM3nrDEqc8EeJSDLq99/c9qkXv77guQMbqUVDRCMffFUyB5lxJMofK6PrEb89
         gACPozQkVWnb/Ut8MJ3ncv93mpp9Zc5BMFFAg1XunIv1zfHFy3Dx1neHrmuKyUTLWLCG
         Pt8IExCoqmcoN9R1rm9ZOwOPC1Qf2KiLFwRwivmwERRxd88gYM7lSpnROMyvfByaZaz4
         1cpFGfMJWGUfQqWQ3rqdoTLu4z/3LljfGb+Gl2LzdEjT7JWcgQcuDClxUPPsh9nOKXYg
         s7NHf1Q7ujGHq9tBmyThIqbTXXbVt5u4KGw8/qbEyZ4mw+S24Zc0AQZe2f769/scYgol
         e0tg==
X-Gm-Message-State: AOJu0Yy5lVDL8P1r++CTBdDoLnGCFaxl9bQlPyDvkXvpuJtxOG+yBGHL
	OO8Ui5giXZ25tN9AnaEP5prHI98Ktuzwazy6c2TnO7UcSCtHbKIDQb5pTUy5+6bdphWnPkArMRs
	w71HCAzzp8wFm57A491y6J0oJmnbadM/XUg==
X-Gm-Gg: ATEYQzy8+EYFZYMDbQ39DiynjuxgEAOc8P/uNAjf7HwTqzfNvYXYVG53D9nDWw0WBLe
	QCeTHDZKd2w6FktmZydOzHxvcP+0YODz6Z7Fw7XfvmqZwhEmhAaQ1tqH07yFNtR0xhXUKBAnXOb
	cIFqi/dLrXpbCoVkfpDwUZod+Ee8cc4eKM+kJ+t8A+Z7ATuf4Xj4HcNKttaHpCWnmLlOO72D+aD
	pi+QzziaV4EobZ7jzkYc5U5zMZKqgUI1QjhytQUN9m3UO2hV7MT75yQKbc+3d4dGEoNOAzYjJ7k
	lZRbHOcxMHSv/Z+U0rQXX+4VRhQ9s9rZpIc6SoYYjSxyJlMyOCq2GfYW/y/zgPTbSrJVMC2t95H
	xrmz6NmBJspuWAV8M
X-Received: by 2002:a17:907:82a5:b0:b98:21eb:e362 with SMTP id
 a640c23a62f3a-b982f25b778mr71309566b.24.1773965493513; Thu, 19 Mar 2026
 17:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260319220901.GD950375@killaraus.ideasonboard.com>
In-Reply-To: <20260319220901.GD950375@killaraus.ideasonboard.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 19 Mar 2026 17:11:22 -0700
X-Gm-Features: AaiRm52ILjwYSbA2_rf4fpvc5tasK399kECRpWwjEnLOwZZm6-7yacGmgm9khGg
Message-ID: <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-hardening@vger.kernel.org, 
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56431-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.919];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B83A82D4657
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 3:09=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
> > Use a flexible arraay member to combine allocations.
> >
> > It looks like pipes never gets freed anywhere. Meaning this effectively
> > fixes a memory leak.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-------
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
> >  2 files changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/driv=
ers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index 16392420903a..657ffecc4d7e 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops =3D=
 {
> >
> >  static int mxc_isi_probe(struct platform_device *pdev)
> >  {
> > +     const struct mxc_isi_plat_data *pdata;
> >       struct device *dev =3D &pdev->dev;
> >       struct mxc_isi_dev *isi;
> >       unsigned int dma_size;
> >       unsigned int i;
> >       int ret =3D 0;
> >
> > -     isi =3D devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
> > +     pdata =3D of_device_get_match_data(dev);
> > +     isi =3D devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_chan=
nels), GFP_KERNEL);
> >       if (!isi)
> >               return -ENOMEM;
> >
> >       isi->dev =3D dev;
> >       platform_set_drvdata(pdev, isi);
> >
> > -     isi->pdata =3D of_device_get_match_data(dev);
>
> I'd keep
>
>         isi->pdata =3D pdata;
>
> here and not below.
Sure
>
> > -
> > -     isi->pipes =3D kzalloc_objs(isi->pipes[0], isi->pdata->num_channe=
ls);
>
> Wouldn't it be simpler to just replace this with devm_kcalloc() ?
That would only make sense if pipes remained a pointer. A flex array
member allows combining allocations since it doesn't take up extra
space.

Technically kzalloc_flex is simpler but I assume a devm version of
that will be handled in another treewide commit.
>
>         isi->pipes =3D devm_kcalloc(dev, isi->pdata->num_channels,
>                                   sizeof(isi->pipes[0]), GFP_KERNEL);
>
> No other change would be needed.
With a flex array member, that's a compile time error, which I use as
a hint to complete the conversion.
>
> > -     if (!isi->pipes)
> > -             return -ENOMEM;
> > -
> >       isi->num_clks =3D devm_clk_bulk_get_all(dev, &isi->clks);
> >       if (isi->num_clks < 0)
> >               return dev_err_probe(dev, isi->num_clks, "Failed to get c=
locks\n");
> > @@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device *pd=
ev)
> >               return dev_err_probe(dev, PTR_ERR(isi->regs),
> >                                    "Failed to get ISI register map\n");
> >
> > +     isi->pdata =3D pdata;
> >       if (isi->pdata->gasket_ops) {
> >               isi->gasket =3D syscon_regmap_lookup_by_phandle(dev->of_n=
ode,
> >                                                             "fsl,blk-ct=
rl");
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/driv=
ers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > index 3cbd35305af0..99532efa4e41 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > @@ -286,7 +286,6 @@ struct mxc_isi_dev {
> >       struct regmap                   *gasket;
> >
> >       struct mxc_isi_crossbar         crossbar;
> > -     struct mxc_isi_pipe             *pipes;
> >       struct mxc_isi_m2m              m2m;
> >
> >       struct media_device             media_dev;
> > @@ -294,6 +293,8 @@ struct mxc_isi_dev {
> >       struct v4l2_async_notifier      notifier;
> >
> >       struct dentry                   *debugfs_root;
> > +
> > +     struct mxc_isi_pipe             pipes[];
> >  };
> >
> >  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
>
> --
> Regards,
>
> Laurent Pinchart

