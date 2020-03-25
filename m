Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA61A192AB6
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 15:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbgCYOC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 10:02:57 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36973 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727539AbgCYOCz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 10:02:55 -0400
Received: by mail-qt1-f194.google.com with SMTP id z24so943717qtu.4
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2020 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LQq3EFJ59LIxHUdp5oSLSjexBDEoJBV/NBKXaRpQgvc=;
        b=1OGHB3mXWgyadxhaLY3ieAeTgpSZKH4oRsUgiE3HazXkZEVAwqsCRLErTjKZtIQdyN
         fbkDrEC6S+VmzZgQboXDr9IDzkdf0gQ5BlpMljeciRq+LbVEaU/k/yarN+NAAI1/jg/7
         2vSDUIueLoLxp1spvUureG4jyqJ2ViAI7Iz3oUlmnKEZ60/P1Xi5uPW7BQ3FLPvwjlkx
         jTaYjo4FnyTKvfspmo/7mF6GezdoN0nwoodUN9z1Nd8WV5bJx9mZ+UwoTYYfHeqf/wgP
         sUG26792imTiGn9U3g/fcpbJb1ds+juIomMff0DjZZ9m1nJqhKVQMY1f61mKiT2dwF0W
         IRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LQq3EFJ59LIxHUdp5oSLSjexBDEoJBV/NBKXaRpQgvc=;
        b=Yij0rfyIffsbiUlRH8cWs4SR7FanC9XhqyS8rXpsMpJ4bGOeH23oMQUV9NZ6131vwN
         30TNbiKOOxUX0fJPoEE+1j88CWQwW6IRtBBoOQjtefQQOwIK5Zkm36e80HY84251H7Hx
         D00xtQoRAcBIHFv/YRWPmbvbfCCyfQBKCUpcts5pbPY70zL+lpq/wXOJbrt/cNIMgaxo
         bgsq1cbw5EyVswDmJLtzNp5VHD/0mHlNFl4RfYewW1Jt79pEuMySD6/nn3ZDAsVXB4wU
         zNwpRr5XMZqFUkqF0aYuPIQOAQRLqf2+5x02JRTBCzdO76UaAT0bgCQzN7YGK7XP18Ck
         GIpg==
X-Gm-Message-State: ANhLgQ11mQoleYLssoPBOO5oLNlnyaXnNeboRFkR/kekRI2G3k3tO+zD
        wPGrjx4XK0Gg1cApit6h+wkZPA==
X-Google-Smtp-Source: ADFU+vvlCeU0s4GsVkEXhSCM1T2ufqjJODHpGR+21Q3IE7jl3Boob14Pq3km6w6nKoKmA15mc4/Zvg==
X-Received: by 2002:ac8:6f46:: with SMTP id n6mr2978711qtv.119.1585144975048;
        Wed, 25 Mar 2020 07:02:55 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id 79sm15313675qkg.38.2020.03.25.07.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 07:02:54 -0700 (PDT)
Message-ID: <0a8f6d97e6869ff694aedd67a3176217a885c938.camel@ndufresne.ca>
Subject: Re: [PATCH v2 3/8] hantro: Use v4l2_m2m_buf_done_and_job_finish
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Rob Herring <robh@kernel.org>
Date:   Wed, 25 Mar 2020 10:02:52 -0400
In-Reply-To: <13b1efe1-8b52-070b-cf11-b230bd405d3e@xs4all.nl>
References: <20200318132108.21873-1-ezequiel@collabora.com>
         <20200318132108.21873-4-ezequiel@collabora.com>
         <13b1efe1-8b52-070b-cf11-b230bd405d3e@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 25 mars 2020 à 09:22 +0100, Hans Verkuil a écrit :
> On 3/18/20 2:21 PM, Ezequiel Garcia wrote:
> > Let the core sort out the nuances of returning buffers
> > to userspace, by using the v4l2_m2m_buf_done_and_job_finish
> > helper.
> > 
> > This change also removes usage of buffer sequence fields,
> > which shouldn't have any meaning for stateless decoders.
> 
> Uh, why remove this? For one, doesn't this cause fails in v4l2-compliance?
> Also, while I agree that it is not terribly useful, it doesn't hurt, does it?
> 
> And the V4L2 spec makes no exception for stateless codecs with respect to the
> sequence field.
> 
> Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

The spec also does not say what it means either. As an example, you
have spec for ALTERNATE interlacing mode that changes the meaning of
the sequence, but not for alternate H264 fields (which cannot be part
of the format, since this changes often). We also don't have spec for
the the sequence behaviour while using HOLD features.

I'm worried we are falling into the test driven trap, were people
implement features to satisfy a test, while the added complexity don't
really make sense. Shouldn't we change our approach and opt-out
features for new type of HW, so that we can keep the drivers code
saner?

> 
> Regards,
> 
> 	Hans
> 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/staging/media/hantro/hantro_drv.c | 27 ++++++++---------------
> >  1 file changed, 9 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > index 0b1200fc0e1a..ec889d755cd6 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -94,32 +94,23 @@ static void hantro_job_finish(struct hantro_dev *vpu,
> >  			      unsigned int bytesused,
> >  			      enum vb2_buffer_state result)
> >  {
> > -	struct vb2_v4l2_buffer *src, *dst;
> >  	int ret;
> >  
> >  	pm_runtime_mark_last_busy(vpu->dev);
> >  	pm_runtime_put_autosuspend(vpu->dev);
> >  	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> >  
> > -	src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > -	dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > -
> > -	if (WARN_ON(!src))
> > -		return;
> > -	if (WARN_ON(!dst))
> > -		return;
> > -
> > -	src->sequence = ctx->sequence_out++;
> > -	dst->sequence = ctx->sequence_cap++;
> > -
> > -	ret = ctx->buf_finish(ctx, &dst->vb2_buf, bytesused);
> > -	if (ret)
> > -		result = VB2_BUF_STATE_ERROR;
> > +	if (ctx->buf_finish) {
> > +		struct vb2_v4l2_buffer *dst;
> >  
> > -	v4l2_m2m_buf_done(src, result);
> > -	v4l2_m2m_buf_done(dst, result);
> > +		dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > +		ret = ctx->buf_finish(ctx, &dst->vb2_buf, bytesused);
> > +		if (ret)
> > +			result = VB2_BUF_STATE_ERROR;
> > +	}
> >  
> > -	v4l2_m2m_job_finish(vpu->m2m_dev, ctx->fh.m2m_ctx);
> > +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
> > +					 result);
> >  }
> >  
> >  void hantro_irq_done(struct hantro_dev *vpu, unsigned int bytesused,
> > 

