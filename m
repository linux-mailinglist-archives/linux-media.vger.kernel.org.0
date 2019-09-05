Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71823A9FBF
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387613AbfIEKeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:34:23 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39970 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732586AbfIEKeX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 06:34:23 -0400
Received: by mail-wr1-f65.google.com with SMTP id w13so2122265wru.7
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ugzz+LEQKbmQUzjgKgK8irjst1y3Ae38mUdD+qH96w=;
        b=QT0WdjIm8TfhJSJMmLVUngjeNM5FgZhmhllsDmutQs5yi+G8YB+jiKJtXhHl9i2ES0
         Pz55f6TKYfLFWuIyF9HRgxt/MGprk0zsPWlD9n3Rfuo1ox1sZ00WZzdx8tAbw5RpD5uu
         MCDGr632bVQvXh/0cc57Nt2oe9VzwQi3UwcaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ugzz+LEQKbmQUzjgKgK8irjst1y3Ae38mUdD+qH96w=;
        b=cKgMsT1w58pOmXNpHTOUZ+vSi6rOB/EPKLp5QRXvL6MLcPdMQ4MOizTuZ+5aTOq7+J
         K7Alh1Tu0DbYk3L5kkL3NEe7Dv1PCCUeMEe6Hy6ReOSDYWpnQMr0BGzdwFJC2oIcr0W2
         nWXmt/tcHXzZWhDh/Pf0Co2vniHLjoCHAditx71jv06KSiQfaZ9CTizfsAkgCxPNvATi
         pjlygLT/gZ62bebAp/f5ejqpUKvQFtWailm4Ex4w4SZ5zMscl6sbqnTr3Gz2PBQZHMjj
         WoLA6IUQd6dlecdzpBYo2M2hnYRrCGtx8R2gVWzOqaAkYLc1QJxz20EOg1g6pImfXno/
         oBaw==
X-Gm-Message-State: APjAAAXSABJUE4GJY5fY+VrfPpFO5/HyrCAQI4S46Osf7gbbJY/uk8u8
        jPDLXkXDR+yQuwjQrp5cR0PxM91saj7OsUXVofBr8w==
X-Google-Smtp-Source: APXvYqwybk7d2zgIRPxAUWepPgMAyo5OSV/naXRJD9o68dQXmcncoN/VtTeZmYrOEhLDMd9nH9XEcHeLD8YlxdY7xUU=
X-Received: by 2002:a5d:6049:: with SMTP id j9mr1813691wrt.213.1567679661368;
 Thu, 05 Sep 2019 03:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190905101533.525-1-p.zabel@pengutronix.de> <20190905101533.525-2-p.zabel@pengutronix.de>
In-Reply-To: <20190905101533.525-2-p.zabel@pengutronix.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 5 Sep 2019 19:34:09 +0900
Message-ID: <CAHD77H=UEor0jv3-8E6QPumwdo7wWEUGtzqwfGrGE6ZndtCb7A@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: hantro: h264: per-slice num_ref_idx_l[01]_active
 override
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 5, 2019 at 7:15 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> If the slice header had the num_ref_idx_active_override flag set, we
> should use the num_ref_idx_l[01]_active_minus1 fields instead of the
> defaults from the PPS.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 7ab534936843..544cf92ab62c 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -28,6 +28,8 @@ static void set_params(struct hantro_ctx *ctx)
>         const struct v4l2_ctrl_h264_pps *pps = ctrls->pps;
>         struct vb2_v4l2_buffer *src_buf = hantro_get_src_buf(ctx);
>         struct hantro_dev *vpu = ctx->dev;
> +       unsigned char refidx0_active;
> +       unsigned char refidx1_active;
>         u32 reg;
>
>         /* Decoder control register 0. */
> @@ -101,9 +103,16 @@ static void set_params(struct hantro_ctx *ctx)
>         vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL5);
>
>         /* Decoder control register 6. */
> +       if (sps->flags & V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE) {
> +               refidx0_active = slices[0].num_ref_idx_l0_active_minus1 + 1;
> +               refidx1_active = slices[0].num_ref_idx_l1_active_minus1 + 1;
> +       } else {
> +               refidx0_active = pps->num_ref_idx_l0_default_active_minus1 + 1;
> +               refidx1_active = pps->num_ref_idx_l1_default_active_minus1 + 1;
> +       }
>         reg = G1_REG_DEC_CTRL6_PPS_ID(slices[0].pic_parameter_set_id) |
> -             G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(pps->num_ref_idx_l0_default_active_minus1 + 1) |
> -             G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(pps->num_ref_idx_l1_default_active_minus1 + 1) |
> +             G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(refidx0_active) |
> +             G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(refidx1_active) |
>               G1_REG_DEC_CTRL6_POC_LENGTH(slices[0].pic_order_cnt_bit_size);
>         vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL6);

My understanding was that Hantro G1 parses the slices itself and
handles the override flag internally.

Best regards,
Tomasz
