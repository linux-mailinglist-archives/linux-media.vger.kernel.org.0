Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B3335DD73
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhDMLKU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345414AbhDMLJw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:09:52 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A9C2C061574;
        Tue, 13 Apr 2021 04:09:31 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id a85so10761846pfa.0;
        Tue, 13 Apr 2021 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wkMmVdaqiVi3xtXd845LmjsnmFo5YjLpPek7JkQnFh0=;
        b=Sq/7PrdMcKFFjvPyCPXpPvIwEqJsyzG21kJVszuBec1vwYduaw3CTQDQNFW2dn/von
         hXiaXtbOcrfryJR5KRclOSaBkpmesm+siY/qMKbndGvQiOiez5w+x0iLl+MPZRJqIo5m
         Wg+7BaycfkT2sywTDkrN3KLNj3ZsHxGQB0PomK76DahTDiiUF/C7FATDLlE5mz+qL4lm
         WytzfJXmLD8yPDOjW7giSiYGkF3r31/Yd93ztWMNbAHlRqzaE6y9uS+vo1Ng9Etri3qH
         rUKEWqPzoKTRX+8q3R7cmQF0vIkZabRLM2NsF3/jqbgujRod278rEfz8IbApupVk9U2X
         K2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wkMmVdaqiVi3xtXd845LmjsnmFo5YjLpPek7JkQnFh0=;
        b=DdnmPBG5In0X8PeS89NKWg+5ESIHSGu9EgdZX5RXWROSF61wh+nhfB/D1EiqZqRZxZ
         06X3T1yKgXuy0AwovzIspRKth8WgiO/GeqIvY3+nOTAbvfXR25zrF/ClAddopkgnmJDK
         IXLeMaWUtnBbqJzuAv5EhdeNpQGT9LD7riGkxrR3Utw9g6eP2XRpyv3puPtPLxQxhaJf
         6ppq1sz6AK9C0L3Kz8ybiAZtHSaS5kE1wy5LGw4/JLSuHIahrL5+oGqtKV2zdPZXbiCI
         dHmJSrmXYYdYOKsMMEGb+oYmELPLeDjTJUYCc9KgqH+pFq4ke+GYTw241Ry5N8VdZ1OY
         R0qg==
X-Gm-Message-State: AOAM533M2Z8UV45lcVqfnaMa/P2m6vtO/pmJwgpovslVjSaA86gt06U5
        tyCTqK63T7k0f1KZ+cvsRw4=
X-Google-Smtp-Source: ABdhPJwqAi/RC3MV9+EDD8mzB8jn12KdybM+is+fifKL0Y/Q22IUaJL6Y2nDOKb9zpuqzyfM+FAKKw==
X-Received: by 2002:a65:5c88:: with SMTP id a8mr30376055pgt.130.1618312170656;
        Tue, 13 Apr 2021 04:09:30 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id s20sm10295296pfh.144.2021.04.13.04.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 04:09:30 -0700 (PDT)
Date:   Tue, 13 Apr 2021 16:39:19 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        khilman@baylibre.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: Re: Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as
 static const appropriately
Message-ID: <YHV734NB4flpFjbF@kali>
References: <YHU56OM+C2zY34VP@kali>
 <00c8a239-49d3-fedb-ec67-076e8b823efa@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00c8a239-49d3-fedb-ec67-076e8b823efa@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 09:26:01AM +0200, Hans Verkuil wrote:
> On 13/04/2021 08:27, Mitali Borkar wrote:
> > Declared 32 bit unsigned int as static constant inside a function
> > appropriately.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> > 
> > Changes from v1:- Rectified the mistake by declaring u32 as static const
> > properly.
> > 
> >  drivers/staging/media/meson/vdec/codec_h264.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
> > index ea86e9e1c447..80141b89a9f6 100644
> > --- a/drivers/staging/media/meson/vdec/codec_h264.c
> > +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> > @@ -287,8 +287,8 @@ static void codec_h264_resume(struct amvdec_session *sess)
> >  	struct amvdec_core *core = sess->core;
> >  	struct codec_h264 *h264 = sess->priv;
> >  	u32 mb_width, mb_height, mb_total;
> > -	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
> > -	static const u32[] canvas4 = { 24, 0 };
> > +	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
> > +	static const u32 canvas4[] = { 24, 0 };
> 
> This is a patch on top of your previous (v1) patch. That won't work
> since the v1 is not merged, you need to make a patch against the current
> mainline code.
>
But Sir, since I have made changes in the code, and committed them, now,
if I open that file, it will contain those changes. Then should I
rewrite the patch body more accurately? 

> Regards,
> 
> 	Hans
> 
> >  
> >  	amvdec_set_canvases(sess, canvas3, canvas4);
> >  
> > 
> 
