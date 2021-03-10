Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E35334377
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 17:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbhCJQpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 11:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233519AbhCJQpN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 11:45:13 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6538C061760
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 08:45:12 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id f1so34613727lfu.3
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nOBjCUFcxCVA5GQgk+a+NIfPffE3GCzEuT7nurE+LHA=;
        b=sTuebj4TbYIeMMfxFEYGN5sjXVsQJl/DPmn91gAChauzlN4hOqvy5LBM+2MwjzRBMM
         x3LYWgOhQBbzbnvl7WyWz0KCnDNca18QkLLx/yPYXYLF1V7oDBS18kawJd1UXQETcn5k
         5sgTWPo62stABrjdThQXKQLMrfvAxU5h2BrHcT5czyJu6lCVD6/pU9hxTMgswZc5x4sv
         pmQtcC1PdgETm9nDueArLKEMrY9AUCcuXenK5SV4bhy3l5XzL4S/c0oBKhOMsNHLCW4B
         WZF1+zsLF57ebiYIClewBcPSFq4fU+JaJroHX42w2P626WSMfzFcF+8zi0h00SUDoeGp
         SF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nOBjCUFcxCVA5GQgk+a+NIfPffE3GCzEuT7nurE+LHA=;
        b=iTPHkiEe4QQpJYgfKt1DBbEK/8d93RePWxC3BmekVEbFn+3Gssr3kIYjz+IuC/cEHs
         wGUuHfOu9GLyUItyVt/zTm30fbCwGgfGcdBWfK8Hg/jkFeTT4KyIYddcpZ3+BQGgW9NP
         F/CDhQWDITxw4kPBzukTzdI/ClrTZNm18Rr17FcLXNfOc+lTtprJfzVr65KSNTD/T4am
         dBZ2pNbvPA8jSlwUmQCOUwaiyo8VKqRuv0tJTdLkn/ScKtJmdS6exOY1ULfqFqyUAFxy
         ErOWDAamRH0E33epd2BHSY7Tbz2TSMO5TF9fEwKnxkLuwAMiCwkjD8PXgxzvrqaLz8AL
         QFdw==
X-Gm-Message-State: AOAM533La4QWhd5B0JPs5OnNCoJouzNg+XRfVRQvNeTAgf0y+6vGTRQA
        dCb6Ub9dnGyPJhZySE9iNvnEmA==
X-Google-Smtp-Source: ABdhPJwWmWoFQ4+vGSoxRE+HSTm7PoAMGMYHYbhtGaaKbX8tg1guCAiDxOH9L2weypAx/T2wVH1Ovw==
X-Received: by 2002:a05:6512:39c2:: with SMTP id k2mr2382701lfu.69.1615394711305;
        Wed, 10 Mar 2021 08:45:11 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j20sm2312558lfb.306.2021.03.10.08.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 08:45:10 -0800 (PST)
Date:   Wed, 10 Mar 2021 17:45:09 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] rcar-csi2: Do not try to recover after transfer
 error
Message-ID: <YEj3lTAZ7kYQ6X+s@oden.dyn.berto.se>
References: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
 <20210115002148.4079591-5-niklas.soderlund+renesas@ragnatech.se>
 <3f40c6eb-ba13-ac99-bd08-3cea11563e9a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f40c6eb-ba13-ac99-bd08-3cea11563e9a@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your feedback.

On 2021-01-25 10:44:48 +0100, Hans Verkuil wrote:
> On 15/01/2021 01:21, Niklas Söderlund wrote:
> > Instead of restarting the R-Car CSI-2 receiver if a transmission error
> > is detected inform the R-Car VIN driver of the error so it can stop the
> > whole pipeline and inform user-space. This is done to reflect a updated
> > usage recommendation in later versions of the datasheet.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index 945d2eb8723367f0..a7212ecc46572a3b 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -773,21 +773,19 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
> >  
> >  	rcsi2_write(priv, INTERRSTATE_REG, err_status);
> >  
> > -	dev_info(priv->dev, "Transfer error, restarting CSI-2 receiver\n");
> > -
> >  	return IRQ_WAKE_THREAD;
> >  }
> >  
> >  static irqreturn_t rcsi2_irq_thread(int irq, void *data)
> >  {
> >  	struct rcar_csi2 *priv = data;
> > +	struct v4l2_event event = {
> > +		.type = V4L2_EVENT_EOS,
> > +	};
> >  
> > -	mutex_lock(&priv->lock);
> > -	rcsi2_stop(priv);
> > -	usleep_range(1000, 2000);
> > -	if (rcsi2_start(priv))
> > -		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
> > -	mutex_unlock(&priv->lock);
> > +	dev_err(priv->dev, "Transfer error detected.\n");
> 
> You probably want to call vb2_queue_error() here. Typically once
> something like this happens you have to restart everything and marking
> the queue as 'error' will ensure that VIDIOC_QBUF will return an error
> until the queue is reset (STREAMOFF).

The CSI-2 driver is a bridge driver and does not deal with buffers.  
Instead the idea here is to signal EOS so that the VIN driver (and 
user-space) can detect it and indeed as you point out deal with 
signaling vb2 error.

I will respin this series as it needs to be rebased anyhow.

> 
> It doesn't hurt to also raise the EOS event, I'm fine with that.
> 
> Regards,
> 
> 	Hans
> 
> > +
> > +	v4l2_subdev_notify_event(&priv->subdev, &event);
> >  
> >  	return IRQ_HANDLED;
> >  }
> > 
> 

-- 
Regards,
Niklas Söderlund
