Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF16710E74
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 16:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241350AbjEYOgT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 10:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241214AbjEYOgS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 10:36:18 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F220187
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 07:36:15 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-75b14216386so55320285a.0
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 07:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1685025374; x=1687617374;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YTrMCPdlTL1iweEOJjUWd8jv+TtA4HWTo2gWq1cW91A=;
        b=DXrj04wJidNYp+VKNednunBgjkH5PcRI0VTyBaWC8acG0PWG/PzkmBdwb6j8MHgnkD
         oQ0VfLct2hMmQPtunuo+zeevb67PUFgCHdMZEOgD92QYHWQVElwTyQrCQ5ASm0Gx+Pu9
         JhXNC568hlIMbpjuuI1q12Z4dBoT4uC+2eXhxj0HKD+6q8RUpso7pGTxPnYzNsodj7U5
         gQVULxDKmPATtmrUiOn3UUF6Z7EdWH5MOflN10uGQ7iwpJ9V/zVh2EdI6GB27+Lc/HD8
         MNBpI/qiyQOMl/mtM7EJCGhcPrsc0oel21YSLbHXDw+fYVhDs/IPE3YGOONa2hTSX0e9
         UJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685025374; x=1687617374;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTrMCPdlTL1iweEOJjUWd8jv+TtA4HWTo2gWq1cW91A=;
        b=RxH9sruil+WqAo7Q9WkKlf2CNV31aym58SVMz6Eb2yXaKI32/ex0wolkZEqNcOznMG
         yYWunMge4IUiMZcmvSptIpO5qw+qLMyrTuB9CBSvubAyOK/N+n6Sol8c0E4gLG/V6AAZ
         slIbR19ttLLsVZ61EfrJwoAb+HWBNZ/Wd+gzg4omVZ5hvM5NMh0ax5j6GHXNtF1QfUL8
         CBNoWscR1nYJ8bNTgPN+QSlM37Cq/afm676M9u9EubjsDisZfeF///cN29DITFyK8m4v
         q9zBB+iTafMOogUM33WUn1S92xGPZ3IOI38RVnd/xcbzPXm6aRang5c6OXdtMmnqXjiJ
         ElAg==
X-Gm-Message-State: AC+VfDwvQ9UikD8BXIe7PsYnffIhTI7Ps6oQLd3dGF6qzE9VtPZTIUUp
        jUaTY1E5NxMwJL3SDACaZ55nsQ==
X-Google-Smtp-Source: ACHHUZ7vxFVUwY5x2/gIc5+gQX9tIGKX7e71sU1VXhlWzZALM+my5k3qy3u6+KjvRzCXWDkZHap++w==
X-Received: by 2002:a05:620a:1a0b:b0:75b:2457:2edc with SMTP id bk11-20020a05620a1a0b00b0075b24572edcmr13385035qkb.48.1685025374455;
        Thu, 25 May 2023 07:36:14 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:6c0::7a9])
        by smtp.gmail.com with ESMTPSA id r28-20020a05620a03dc00b0075bcc5ab975sm256510qkm.92.2023.05.25.07.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 07:36:14 -0700 (PDT)
Message-ID: <a651486dbfdc2f755098b3f400c48ae3958eb6d8.camel@ndufresne.ca>
Subject: Re: [PATCH] media: verisilicon: Fix null pointer dereference in
 try_fmt
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Diederik de Haas <didi.debian@cknow.org>,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        benjamin.gaignard@collabora.com, linux-rockchip@lists.infradead.org
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de,
        m.tretter@pengutronix.de,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Date:   Thu, 25 May 2023 10:36:13 -0400
In-Reply-To: <6444204.lOV4Wx5bFT@bagend>
References: <20230516091209.3098262-1-m.tretter@pengutronix.de>
         <6444204.lOV4Wx5bFT@bagend>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Diederik,

Le mardi 23 mai 2023 =C3=A0 16:22 +0200, Diederik de Haas a =C3=A9crit=C2=
=A0:
> On Tuesday, 16 May 2023 11:12:09 CEST Michael Tretter wrote:
> > Since commit db6f68b51e5c ("media: verisilicon: Do not set context
> > src/dst formats in reset functions"), vpu_src_fmt is not set in the
> > reset function, but only set in hantro_set_fmt_out, which calls
> > hantro_try_fmt before setting the format. Therefore, hantro_try_fmt
> > might be called with vpu_src_fmt still being null.
> >=20
> > Add a test if the format is actually set before checking the format.
> >=20
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > Fixes: db6f68b51e5c ("media: verisilicon: Do not set context src/dst fo=
rmats
> > in reset functions") ---
> >  drivers/media/platform/verisilicon/hantro_v4l2.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > b/drivers/media/platform/verisilicon/hantro_v4l2.c index
> > 835518534e3b..ec37d2646fde 100644
> > --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > @@ -313,17 +313,20 @@ static int hantro_try_fmt(const struct hantro_ctx
> > *ctx, /* Fill remaining fields */
> >  		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
> >  				    pix_mp->height);
> > -		if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_H264_SLICE=20
> &&
> > +		if (ctx->vpu_src_fmt &&
> > +		    ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_H264_SLICE=20
> &&
> >  		    !hantro_needs_postproc(ctx, fmt))
> >  			pix_mp->plane_fmt[0].sizeimage +=3D
> >  				hantro_h264_mv_size(pix_mp-
> > width,
> >  						    pix_mp-
> > height);
> > -		else if (ctx->vpu_src_fmt->fourcc =3D=3D=20
> V4L2_PIX_FMT_VP9_FRAME &&
> > +		else if (ctx->vpu_src_fmt &&
> > +			 ctx->vpu_src_fmt->fourcc =3D=3D=20
> V4L2_PIX_FMT_VP9_FRAME &&
> >  			 !hantro_needs_postproc(ctx, fmt))
> >  			pix_mp->plane_fmt[0].sizeimage +=3D
> >  				hantro_vp9_mv_size(pix_mp->width,
> >  						   pix_mp-
> > height);
> > -		else if (ctx->vpu_src_fmt->fourcc =3D=3D=20
> V4L2_PIX_FMT_HEVC_SLICE &&
> > +		else if (ctx->vpu_src_fmt &&
> > +			 ctx->vpu_src_fmt->fourcc =3D=3D=20
> V4L2_PIX_FMT_HEVC_SLICE &&
> >  			 !hantro_needs_postproc(ctx, fmt))
> >  			pix_mp->plane_fmt[0].sizeimage +=3D
> >  				hantro_hevc_mv_size(pix_mp-
> > width,
>=20
> I have verified that this patch fixes the crash I was seeing since 6.4.
> https://lore.kernel.org/linux-media/12724349.O9o76ZdvQC@bagend/ is a/the =
other=20
> patch which also fixed the crash.

An official form of this comment would be Tested-by: <name> <email>, would =
you
agree to have this added ?

Nicolas

