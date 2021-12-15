Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E86475F80
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 18:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235126AbhLORi5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 12:38:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234826AbhLORi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 12:38:56 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EDFC06173F
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 09:38:56 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id z6so21313854pfe.7
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 09:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7d470J2+oFZT41mCZ376rK26LqeNBavtRleay07yiuU=;
        b=ShKjENR921vHVi9BK4jRMiwapa1k1KK+vUxc53wDkqYIuBKVCsl4RQNh41pHh9gfN5
         qBefYvjITmGgqIUmdTaO3akklhgd2jqjoY7Sa/qBBt3yNmmox7DCb2eM2/1tgN/DXO6d
         9KqCMg3X2smyr6MIrrwuUnfuQY52i4tM9nxkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7d470J2+oFZT41mCZ376rK26LqeNBavtRleay07yiuU=;
        b=ruoALuijVy0XOEXkmySrBKMg2jYC4eD1SMO1N5X2vPaTdpcyq1j58fVs5Fwkfmx3Vf
         wbcCHERp0lWQwPtOvg4M19MLt+on6tKIAddcrC3lLXGtotUQMIK4P0boIAIVcmgIiFKL
         BfNp9Ygqq2yoeoCdvqFknmMe2i0tZHcxxrs863ae0yMYNOq3uSP1qgsoW0v0DS5JFQzw
         us1VAJS7qa0obJ7uMiFzPatpq+myYsozpz8KKYOLr/JWEVY8nTXfM/gLIGmEmOHj9Ow7
         l5OtR4VfH6cKgCGMks8l5dGCdC1c/zXNBUuj6R/qq1qMp8gT4tlypeih0S6vKYEie++z
         b5EQ==
X-Gm-Message-State: AOAM533Ok927iRekIYseqvpWUDchxgcrnNY4YPIqh3Hlvi/jaoZXQF1q
        oWX24VVFYv2kw8a753HPvBpzRw==
X-Google-Smtp-Source: ABdhPJynliM9cHiw8dNrLv4gGNPzE8G4eePKE155CqEwxDkieosnFXcYTf2FunPD85TdO0YqxHJ12Q==
X-Received: by 2002:a63:1f16:: with SMTP id f22mr8437116pgf.259.1639589936105;
        Wed, 15 Dec 2021 09:38:56 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w37sm2853924pgk.87.2021.12.15.09.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 09:38:55 -0800 (PST)
Date:   Wed, 15 Dec 2021 09:38:55 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: omap3isp: Use struct_group() for memcpy() region
Message-ID: <202112150937.8E4974D35@keescook>
References: <20211118184352.1284792-1-keescook@chromium.org>
 <20211213232416.GA60133@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213232416.GA60133@embeddedor>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 13, 2021 at 05:24:16PM -0600, Gustavo A. R. Silva wrote:
> On Thu, Nov 18, 2021 at 10:43:52AM -0800, Kees Cook wrote:
> > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > field bounds checking for memcpy(), memmove(), and memset(), avoid
> > intentionally writing across neighboring fields. Wrap the target region
> > in struct_group(). This additionally fixes a theoretical misalignment
> > of the copy (since the size of "buf" changes between 64-bit and 32-bit,
> > but this is likely never built for 64-bit).
> > 
> > FWIW, I think this code is totally broken on 64-bit (which appears to
> > not be a "real" build configuration): it would either always fail (with
> > an uninitialized data->buf_size) or would cause corruption in userspace
> > due to the copy_to_user() in the call path against an uninitialized
> > data->buf value:
> > 
> > omap3isp_stat_request_statistics_time32(...)
> >     struct omap3isp_stat_data data64;
> >     ...
> >     omap3isp_stat_request_statistics(stat, &data64);
> > 
> > int omap3isp_stat_request_statistics(struct ispstat *stat,
> >                                      struct omap3isp_stat_data *data)
> >     ...
> >     buf = isp_stat_buf_get(stat, data);
> > 
> > static struct ispstat_buffer *isp_stat_buf_get(struct ispstat *stat,
> >                                                struct omap3isp_stat_data *data)
> > ...
> >     if (buf->buf_size > data->buf_size) {
> >             ...
> >             return ERR_PTR(-EINVAL);
> >     }
> >     ...
> >     rval = copy_to_user(data->buf,
> >                         buf->virt_addr,
> >                         buf->buf_size);
> > 
> > Regardless, additionally initialize data64 to be zero-filled to avoid
> > undefined behavior.
> > 
> > Fixes: 378e3f81cb56 ("media: omap3isp: support 64-bit version of omap3isp_stat_data")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/media/platform/omap3isp/ispstat.c |  5 +++--
> >  include/uapi/linux/omap3isp.h             | 21 +++++++++++++--------
> >  2 files changed, 16 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/media/platform/omap3isp/ispstat.c b/drivers/media/platform/omap3isp/ispstat.c
> > index 5b9b57f4d9bf..68cf68dbcace 100644
> > --- a/drivers/media/platform/omap3isp/ispstat.c
> > +++ b/drivers/media/platform/omap3isp/ispstat.c
> > @@ -512,7 +512,7 @@ int omap3isp_stat_request_statistics(struct ispstat *stat,
> >  int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
> >  					struct omap3isp_stat_data_time32 *data)
> >  {
> > -	struct omap3isp_stat_data data64;
> > +	struct omap3isp_stat_data data64 = { };
> >  	int ret;
> >  
> >  	ret = omap3isp_stat_request_statistics(stat, &data64);
> > @@ -521,7 +521,8 @@ int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
> >  
> >  	data->ts.tv_sec = data64.ts.tv_sec;
> >  	data->ts.tv_usec = data64.ts.tv_usec;
> > -	memcpy(&data->buf, &data64.buf, sizeof(*data) - sizeof(data->ts));
> > +	data->buf = (uintptr_t)data64.buf;
> 
> Shouldn't this be
> 
> 	data->buf = (uintptr_t)(void *)data64.buf;
> 
> instead?

This is already a void *:

struct omap3isp_stat_data {
	...
        void __user *buf;
};

But I agree, the mix of structures in here is confusing! :)

-Kees

-- 
Kees Cook
