Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50BFE358B8C
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 19:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbhDHRle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 13:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbhDHRl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 13:41:28 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B5BC061760;
        Thu,  8 Apr 2021 10:41:15 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id q3so3024423qkq.12;
        Thu, 08 Apr 2021 10:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=mdN1Jw+gb2OecTVeF2v17EO+ynpqxrd3oGCmcBY+OBM=;
        b=rQ/FpK2Z0CI3YxPS+hWS4mebh5dGyrxeoRFSIvHIUZCutspu4O5XOqMS3IVisPgFA8
         rbSjgrxIysU4gO2j25SNe694SSJx9g3BRpn1/kzNqmHISxn6pVoMJmeahsg7y5Mc0rwB
         a9IgI/LPySkZi+BOS4DBnh4mnlEsRPSuQRMg6OLAHLyhhQWIsyt5pjvP7sD8XZJJYpWY
         mCroKgdLoRPSzVIqj6+/91K+OWiLKLTb5/6P6ch3y8YnkC0i7GuKXtHlIJTlcLfqhCzB
         L8msNiKFv3QOT75WWHp9CLjTpAeBgv+p8J4fq96KhCMsBDdoEzRMNs8Wi+FBIdgcATxi
         9+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mdN1Jw+gb2OecTVeF2v17EO+ynpqxrd3oGCmcBY+OBM=;
        b=gcb+d+bApTmkndyyXVMm+b6MEKDP24nEn7ml758F9deY97l28ETrV1oTOXiiJXvpQT
         6XQQTqQwA58u/hZtOmgv8GNYZ/4TK4/DbVIjLIMY75vR7M3hRbCRQcXGPMRF31oldcpJ
         aiCHwucxpCLP2v5/OTT0o0CeonXsB+BKF4YmFiN10rWicRS5Q+MlhKEH1mzs5OLcf81A
         hbB6F3nfa5UTotsoCGVjTsn52KPNMyoBCTKBAUy8E9N7zfTNhv2j7wjLML8a0si5boZM
         TWvbOQY3V1dcG3mRZrvn8DGjJsaNzdD9ELPFPxP2f9JQkC3OGDxXotGm099qulqmW9jV
         BurQ==
X-Gm-Message-State: AOAM530SYFtD9U35XbNIQDhpmA2XWKPIlW+eCBqVkRMIG8DazW/uvI5+
        jXrKjet0rJfazfGVLWOycAM=
X-Google-Smtp-Source: ABdhPJwChQvTmLNRRPsxLWBk6i0S/I28pVczZQKyNZ94Z4lsjeYx//nGZU/H3GCpeL278TBHubKGrQ==
X-Received: by 2002:a37:ae44:: with SMTP id x65mr9633255qke.9.1617903675135;
        Thu, 08 Apr 2021 10:41:15 -0700 (PDT)
Received: from [192.168.100.7] ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id o30sm129666qtl.8.2021.04.08.10.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 10:41:14 -0700 (PDT)
Message-ID: <6bba0e0a5768e902ffec4bda563d4ca810412f84.camel@gmail.com>
Subject: Re: [PATCH 1/2 v2] staging: media: hantro: Align line break to the
 open parenthesis in file hantro_hw.h
From:   ascordeiro <alinesantanacordeiro@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Date:   Thu, 08 Apr 2021 14:41:10 -0300
In-Reply-To: <d4000598fddcf45e578462aa04b556c0ca057091.camel@collabora.com>
References: <cover.1617890467.git.alinesantanacordeiro@gmail.com>
         <1e6d73432d60dfb8bb3f7f2bd6bf3084091a2a39.1617890467.git.alinesantanacordeiro@gmail.com>
         <d4000598fddcf45e578462aa04b556c0ca057091.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em qui, 2021-04-08 às 13:20 -0300, Ezequiel Garcia escreveu:
> Ola Aline,
Ola Ezequiel,

> Welcome to the kernel community. Hope you enjoy some of this
> Outreachy adventures.
Thank you!

> Normally, when you submit a v2, we want to know what changed
> between the first submission and v2.
> 
> If you are subscribed to linux-media, you can read some
> of the series with a vN+1 and look how it's done. Examples:
> 
> https://www.spinics.net/lists/linux-media/msg190043.html
> 
> https://www.spinics.net/lists/linux-media/msg189923.html
> 
> I'm sure your Outreachy mentors can tell you more.
Thank you for the examples, it won't happen again.

The reason for sending a v2 is that I sent my very first patchset
yesterday and I sent the cover-letter together, but (I think) I wasn't
supposed to, and as the patches weren't marked as [PATCH 1/2] and
[PATCH 2/2] in the email - since I commited all the files with the same
message - I tought it was wrong and sent again today.

However, I just realized that I've changed just the subject of the e-
mail, but I would've to change the commit message, right? And then, it
would be a second version, am I right? 

Thank you in advance,

> On Thu, 2021-04-08 at 11:07 -0300, Aline Santana Cordeiro wrote:
> > Aligns line break with the remaining function arguments
> > to the open parenthesis. Issue found by checkpatch.
> > 
> > Signed-off-by: Aline Santana Cordeiro <   
> > alinesantanacordeiro@gmail.com>
> > ---
> >  drivers/staging/media/hantro/hantro_hw.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro_hw.h
> > b/drivers/staging/media/hantro/hantro_hw.h
> > index 34c9e46..a650b9c 100644
> > --- a/drivers/staging/media/hantro/hantro_hw.h
> > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > @@ -207,7 +207,7 @@ hantro_h264_mv_size(unsigned int width,
> > unsigned int height)
> >  void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
> >  void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
> >  void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
> > -       const struct v4l2_ctrl_mpeg2_quantization *ctrl);
> > +                                 const struct
> > v4l2_ctrl_mpeg2_quantization *ctrl);
> >  int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
> >  void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
> >  
> 
> 


