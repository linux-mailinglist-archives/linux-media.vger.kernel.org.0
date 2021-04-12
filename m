Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAEF635C689
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 14:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240836AbhDLMqM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 08:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237283AbhDLMqK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 08:46:10 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B546DC061574;
        Mon, 12 Apr 2021 05:45:52 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso1743775pjg.2;
        Mon, 12 Apr 2021 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3NkHK9dlRLO9E11vKDI3by0BzQKmIoCdtqsiovYik5Y=;
        b=ipk8DwdYIM+Lp82DorQ0slg4Pzo/r2oPaPaTi5pIFNe1/ELqHN5WVqqpvKrp5agVi7
         Gx1ksSa8tqNrGMYoNsPhPZhSaOD31ER84MBkAiY/652qpkOz8FUKaRflCcPolsuJqaQ6
         rpOqq2YPaucNEYx0RI65wb2mHKvNL3vYqF3r+qsPlOeAkAyS0RI4sC5PlltLhW5BvjV5
         2YyEfVsbdSgTiO+zWf6Uqxse1uXsX26RbE/T3jMRoRW5y5Qecg7fKOkxb3dgCm5JrQay
         DJlJtoybuhS1gJpZIz/YYAwCbb9okPIrZzrTJMpW3c2pTAjLeSgZ9UizoxTHQ57bJlxT
         inrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3NkHK9dlRLO9E11vKDI3by0BzQKmIoCdtqsiovYik5Y=;
        b=hY7P2oShCj5lmdunElDk1OOB12kU/Llsp/MAG9LSGOuhAX9i1ClXHOBCPM70W7INr+
         2gIVv3y2eLT4fCp15dAxthy2Kp/hm3O/XQP9OjF05Ks+R2hzqbsgk7KxdROp0eEseRCT
         4oNDW51Kr9P1AoppVFNnX6V2IVGNVJGCBXfy9f1ocALrjBLfzO471osmLsY0T9X5RVoy
         +RTZuK8pDPcyx18JHTV8FgKKSaIQGFWl+43sXmbu8QKX5MSiDR+nzG7uIKJD9JIVAJfD
         2eeu85k16adCzJCEJEi7TWoc88loaolRxXc2nQQFoOjBDW7YzASVrHL8hgpA11tzYwgR
         Qzfw==
X-Gm-Message-State: AOAM530NvBwC31Gjzf1/Rax2gxHGbuALXMbAGU+8uYz/jvmil/5rDydh
        dk4dNjpJCA1VUOHPqi1VcSg=
X-Google-Smtp-Source: ABdhPJxM44dz/V1i30xDBVDqbT6VanKYzhUL0fhLrUPPDqvvU5QpP5gH3Y+gZ2QcPWSxTrR/n+W9AA==
X-Received: by 2002:a17:902:8344:b029:ea:fc89:fa72 with SMTP id z4-20020a1709028344b02900eafc89fa72mr4649548pln.45.1618231552084;
        Mon, 12 Apr 2021 05:45:52 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id i22sm11367148pgj.90.2021.04.12.05.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 05:45:51 -0700 (PDT)
Date:   Mon, 12 Apr 2021 18:15:42 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, narmstrong@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] staging: media: meson: vdec: declare u32 as const and
 static const
Message-ID: <YHRA9i+BjveJOUvn@kali>
References: <YHIDufKhTEeuxyl5@kali>
 <88d04746-717d-5a7a-7ea7-67cf6c95aba9@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88d04746-717d-5a7a-7ea7-67cf6c95aba9@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 12, 2021 at 11:17:22AM +0200, Hans Verkuil wrote:
> On 10/04/2021 21:59, Mitali Borkar wrote:
> > Declared 32 bit unsigned int as static constant inside a function and
> > replaced u32[] {x,y} as canvas1, canvas2 in codec_mpeg12.c
> > This indicates the value of canvas indexes will remain constant throughout execution.
> > Replaced u32 reg_base and u32 reg_name with const u32 reg_base and const
> > u32 reg_name as it will contain data/registry bases to write static
> > const indexes declared above and will keep track of of contiguos
> > registers after each reg_base.
> > This makes code look better, neater. It improves readability.
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/media/meson/vdec/codec_mpeg12.c | 5 +++--
> 
> Also change drivers/staging/media/meson/vdec/codec_h264.c.
> 
> It's a nice improvement, so let's do this for both callers of amvdec_set_canvases().
>
I have done chnages in codec_h264.c Now, should I send that as new
patch?

> Regards,
> 
> 	Hans
> 
> >  drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
> >  drivers/staging/media/meson/vdec/vdec_helpers.h | 2 +-
> >  3 files changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > index 21e93a13356c..861d8584f22f 100644
> > --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > @@ -65,6 +65,8 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
> >  	struct amvdec_core *core = sess->core;
> >  	struct codec_mpeg12 *mpeg12;
> >  	int ret;
> > +	static const u32 canvas1[] = { AV_SCRATCH_0, 0 };
> > +	static const u32 canvas2[] = { 8, 0 }
> >  
> >  	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
> >  	if (!mpeg12)
> > @@ -80,8 +82,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
> >  		goto free_mpeg12;
> >  	}
> >  
> > -	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
> > -				  (u32[]){ 8, 0 });
> > +	ret = amvdec_set_canvases(sess, canvas1, canvas2);
> >  	if (ret)
> >  		goto free_workspace;
> >  
> > diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> > index 7f07a9175815..df5c27266c44 100644
> > --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> > +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> > @@ -177,7 +177,7 @@ static int set_canvas_nv12m(struct amvdec_session *sess,
> >  }
> >  
> >  int amvdec_set_canvases(struct amvdec_session *sess,
> > -			u32 reg_base[], u32 reg_num[])
> > +			const u32 reg_base[], const u32 reg_num[])
> >  {
> >  	struct v4l2_m2m_buffer *buf;
> >  	u32 pixfmt = sess->pixfmt_cap;
> > diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
> > index cfaed52ab526..ace8897c34fe 100644
> > --- a/drivers/staging/media/meson/vdec/vdec_helpers.h
> > +++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
> > @@ -17,7 +17,7 @@
> >   * @reg_num: number of contiguous registers after each reg_base (including it)
> >   */
> >  int amvdec_set_canvases(struct amvdec_session *sess,
> > -			u32 reg_base[], u32 reg_num[]);
> > +			const u32 reg_base[], const u32 reg_num[]);
> >  
> >  /* Helpers to read/write to the various IPs (DOS, PARSER) */
> >  u32 amvdec_read_dos(struct amvdec_core *core, u32 reg);
> > 
> 
