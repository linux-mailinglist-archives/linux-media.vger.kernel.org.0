Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18545EDC30
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 11:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfKDKMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 05:12:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:57096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726441AbfKDKMJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 05:12:09 -0500
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 18DD620578;
        Mon,  4 Nov 2019 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572862327;
        bh=gf3ukGOSnoHqL9FWtcijtCIDc/28d1RWkuM4NHuJ9wc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=j0GCQXs3nBzWsj3FhD+Nue874mb/zP4bJJWv3KyXv5F9uxuI11IQCJ3PNqcRnUrzz
         B6RHDk+tGGbGqBro8lZrtgh3enTEhDXzW6Wu5fSb0I84HSvyRNDfY7GZJP6nG56tC9
         +Ca7MXixK72/OEAkKJ83vdagk4cDIgodqg4ueaB8=
Received: by mail-lj1-f175.google.com with SMTP id y3so16908990ljj.6;
        Mon, 04 Nov 2019 02:12:07 -0800 (PST)
X-Gm-Message-State: APjAAAXMzBahcOutjkdCNws/bc53PKTh7T8g++QroRjCC1awNCshdlPd
        H/H/XTAPATqhn9g57bA/YyoOT4JNW/TIrtQlwEI=
X-Google-Smtp-Source: APXvYqySzn24RmMRSGlFRfsR/lggcYXBmajizKINwk3AnOqmaDg8WrArkg7mFS0C+h2zUkkkdLD6vCG+tlYlZceMZ/8=
X-Received: by 2002:a2e:3008:: with SMTP id w8mr8086918ljw.148.1572862325188;
 Mon, 04 Nov 2019 02:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20191101112358.29538-1-ribalda@kernel.org> <20191101112358.29538-3-ribalda@kernel.org>
 <f024d7cd-0e96-b05b-5681-cd3254885e64@xs4all.nl>
In-Reply-To: <f024d7cd-0e96-b05b-5681-cd3254885e64@xs4all.nl>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Mon, 4 Nov 2019 11:11:48 +0100
X-Gmail-Original-Message-ID: <CAPybu_2tPLj0ctDj1D6mi1=r9q7CyYo9jApMhC1g4YEVueAfaA@mail.gmail.com>
Message-ID: <CAPybu_2tPLj0ctDj1D6mi1=r9q7CyYo9jApMhC1g4YEVueAfaA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: vivid: Add an area control
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi hans

On Mon, Nov 4, 2019 at 10:44 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 11/1/19 12:23 PM, Ricardo Ribalda Delgado wrote:
> > This control represents a generic read/write area.
> >
> > Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  drivers/media/platform/vivid/vivid-ctrls.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
> > index b250fc3764e2..fd35863798a7 100644
> > --- a/drivers/media/platform/vivid/vivid-ctrls.c
> > +++ b/drivers/media/platform/vivid/vivid-ctrls.c
> > @@ -32,6 +32,7 @@
> >  #define VIVID_CID_U32_ARRAY          (VIVID_CID_CUSTOM_BASE + 8)
> >  #define VIVID_CID_U16_MATRIX         (VIVID_CID_CUSTOM_BASE + 9)
> >  #define VIVID_CID_U8_4D_ARRAY                (VIVID_CID_CUSTOM_BASE + 10)
> > +#define VIVID_CID_AREA                       (VIVID_CID_CUSTOM_BASE + 11)
> >
> >  #define VIVID_CID_VIVID_BASE         (0x00f00000 | 0xf000)
> >  #define VIVID_CID_VIVID_CLASS                (0x00f00000 | 1)
> > @@ -266,6 +267,18 @@ static const struct v4l2_ctrl_config vivid_ctrl_disconnect = {
> >       .type = V4L2_CTRL_TYPE_BUTTON,
> >  };
> >
> > +static const struct v4l2_area area = {
> > +     .width = 0xcafe,
> > +     .height = 0xb1b1d,
>
> I don't think there is any need for these weird values. Just set this to
> e.g. 1000x2000. Just as long as width and height are different.
>
> Regards,

Sure. I will change that.

I though anyone liked vivid cafe ;P


>
>         Hans
>
> > +};
> > +
> > +static const struct v4l2_ctrl_config vivid_ctrl_area = {
> > +     .ops = &vivid_user_gen_ctrl_ops,
> > +     .id = VIVID_CID_AREA,
> > +     .name = "Area",
> > +     .type = V4L2_CTRL_TYPE_AREA,
> > +     .p_def.p_const = &area,
> > +};
> >
> >  /* Framebuffer Controls */
> >
> > @@ -1574,6 +1587,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
> >       dev->string = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_string, NULL);
> >       dev->bitmask = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_bitmask, NULL);
> >       dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
> > +     v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
> >       v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
> >       v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
> >       v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
> >
>
