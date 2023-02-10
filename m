Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0076C6920F9
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 15:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbjBJOmm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 09:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbjBJOml (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 09:42:41 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8AB7101F
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 06:42:38 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id f10so5934900qtv.1
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 06:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C1OSll8a7ObxBAOGjQ0TXc/7NA3iDlcndTlQF5xnNfY=;
        b=smFBZoIQWXg7pZZpmSGuAEl37wUkS/knZAPBfAPV087xWmGtnk3wm9zNWxN1u3lUmv
         vZ+qQoewN/5NhHpTsxvYJ4rXZyRJ8TXQjqjznfQ578OX9pJNTViLTmU/Vw79PdKEi1Nu
         O1LVxUNacbkcAVZkJ/acmEnW1xpSpDm9mFaAiyjcLvJY/cN2mwgBx0q2Le5edrmn0cSr
         XAk4Wh5Bm71a92Jv1romMSTdSvKk/rpCiHvhTkkZKV8C3Tz8ezgXomWlVz25t2Wy9yZH
         mcHLaKkVIQR8N8URoPHEx0nbsPSP4TCOf0/F7txVcu2PdXf0w2SSaeRGeV7hGXUPSJCE
         7zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C1OSll8a7ObxBAOGjQ0TXc/7NA3iDlcndTlQF5xnNfY=;
        b=loy0m0T0x2f9nQ5EPe5ietgPB/fFadWFAkG1/bnCqL8UfJAwCtWULzCNKlLigVdTa0
         qmFcxF7XPATZgqqytn6XnRGIiTqkJfmUww1dN3LVuq797CVQ47gD+Hbo0IDT2oYF+YpW
         //lgAXj2nKVB6dIAk67HlgxKS6pvcHQPa9VVhSS/oMYcrtwBqHq+1uuD+kdm8kQPqzJD
         JEC5YYFe2PiwymGFJ6ZfEovSLBrmOaAcGiaObcKM6st3jny1tZZDoES7quVgcm+5aWSH
         qtZQ0WoLzFz8/eUc5kudOJgVuYNuIJgRoc3rkZc5LzQUA1qWvlmjtlYdR9VMyOjdBsz4
         W4vw==
X-Gm-Message-State: AO0yUKUKZsk6Nkuifs4r+bYC6hlZvscFBLdIQ6j6upLe4uOkaH4M5woW
        x1TWsjT7Oe7y0JwU+mlC0WF777JXMsq9bBLx
X-Google-Smtp-Source: AK7set8B5fAKTn1XHhJlZJXgIy5YLFxzymaNJs+FWW3J2Oc5o9UYIaY/M57NHrFcot5CzGXo2/rNiQ==
X-Received: by 2002:ac8:5955:0:b0:3b3:7d5:a752 with SMTP id 21-20020ac85955000000b003b307d5a752mr26770390qtz.50.1676040158001;
        Fri, 10 Feb 2023 06:42:38 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id r142-20020a37a894000000b00729a26e836esm3640679qke.84.2023.02.10.06.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 06:42:37 -0800 (PST)
Message-ID: <1abbb76c060c5e4d1d96c32ec8faacbf9a012fd2.camel@ndufresne.ca>
Subject: Re: [PATCH 0/2] media: v4l: Add Broadcom sand format to the list of
 V4L formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Date:   Fri, 10 Feb 2023 09:42:35 -0500
In-Reply-To: <qldauht5k6rfa2o2uqvcfh66ul0vf7a036@4ax.com>
References: <20230127153415.83126-1-jc@kynesim.co.uk>
         <44531f980f771272a8a663c2b2d68dce3bf47456.camel@ndufresne.ca>
         <qldauht5k6rfa2o2uqvcfh66ul0vf7a036@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 09 f=C3=A9vrier 2023 =C3=A0 18:21 +0000, John Cox a =C3=A9crit=C2=
=A0:
> Hi
>=20
> > Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =C3=A9crit=
=C2=A0:
> > > This is in preparation for attempting to upstream the Rpi H265 decode=
r
> > > as these formats are the only ones the hardware can decode to. They a=
re
> > > a column format rather than a tile format but I've added them to the
> > > list of tiled formats as that seems the closest match.
> > >=20
> > > V4L2_PIX_FMT_NV12_C128 matches DRM format NV12 with modifier
> > > DRM_FORMAT_MOD_BROADCOM_SAND128_COL_HEIGHT(ch) and
> > > V4L2_PIX_FMT_P030_C128 matches DRM format P030 with the same modifier=
.
> >=20
> > Cause pixel format matching is hard, P030 matches GStreamer NV12_10LE32=
, format
> > also found on Xilinx ZynMP CODECs (but without any modifiers so far).
> >=20
> > This is just for curiosity, was there any software implementation of th=
ese
> > formats made available publicly ? or have they only been tested in conj=
unction
> > with an importing HW ?
>=20
> I'm unsure exactly what you are asking here.
>=20
> I don't think that anyone other than RPi/Broadcom has used these formats
> for anything. I've certainly written code that uses and converts them
> that has been on my public github and has been used by RPi but I doubt
> that is what you meant by "Publicly". V4L2_PIX_FMT_NV12_C128 is annoying
> to use in s/w (though I have written s/w parts of a decoder that use
> it), V4L2_PIX_FMT_P030_C128 is stupidly annoying to use in s/w and all
> I've ever written is code to convert it to something more useable.
>=20
> Does that answer the question?

Well, whatever you have and you can share a link to would be nice, it does =
help
reviewing your doc. But I think I understand what it is from your doc so fa=
r, so
nothing to worry about.

As a side note, for boards that are readily available in KernelCI, I often
implement slow path converter in GStreamer so we can run it through fluster=
 and
catch any regressions. It is very minimal regression tests simply using wha=
t ITU
made publicly available.

> =20
> > > John Cox (2):
> > >   media: v4l: Add Broadcom sand formats to videodev2.h
> > >   media: v4l: Add documentation for Broadcom sand formats
> > >=20
> > >  .../media/v4l/pixfmt-yuv-planar.rst           | 192 ++++++++++++++++=
++
> > >  include/uapi/linux/videodev2.h                |   2 +
> > >  2 files changed, 194 insertions(+)
> > >=20

