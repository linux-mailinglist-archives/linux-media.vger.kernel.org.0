Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B84915D4D0
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 10:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgBNJfO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 04:35:14 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33586 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbgBNJfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 04:35:13 -0500
Received: by mail-pg1-f196.google.com with SMTP id 6so4687794pgk.0
        for <linux-media@vger.kernel.org>; Fri, 14 Feb 2020 01:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5AfLEWxBfNqD1QkilGzCQL+klQ2n6nhzMgLjS7kpjJM=;
        b=GoEjXRGHToaAgFkeLpViY1gsJSUIEVFtb8QW+MOKy9T8+kP7xEFTsFYvjUW6MSs7gy
         o28Rzuk0lUdIq/2gWktTi8aG6FVSe5Fp1qD6uMY3WpVJREQ0h3/avtmmbfeIwMUFGd43
         5rx0TuSgzQZHI3TlPFC52tzrHGnYIgDgvMgvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5AfLEWxBfNqD1QkilGzCQL+klQ2n6nhzMgLjS7kpjJM=;
        b=mSuOI0ihGpBHOTZenqim2etKwDLPGIlTNzJLMqSWHwkC/l7nt0iK79vjANSGsz8QkP
         tvzOMDJMm6VmlG40ukgqfCRVZdgxRDQyxF21Kioewm/5JtLZYwJGkQ6XU2MnCSrFalGb
         U0AcivQt8btYTuP9hOhXWiN1LKKVvDpFnHaHGhCmth4/FOKJiCNMxkb8yIxyfO0OtH20
         xDehv9e+9WGwqrRA+kU3swt2tK/jA3Gbr8wpx8leNvI/J0/qvQCmg1x7aDU6/KxauJRJ
         Ck5i3QrzoJhe0Fu3ATiRiifNWFFf0voT7/nUsJCIuYgN8DPFcTdl/J1mmjaZMBX2kplr
         1tyA==
X-Gm-Message-State: APjAAAX80JQy/Cu/SS/qA04443Xh8TnvRlsIZI1OrYVJg0BrWd3HdMeU
        KIBdOxVUVgHdJUgkGTKrifXDuw==
X-Google-Smtp-Source: APXvYqzWsScMU1xLX4fTpri3lhL7mpabTPnY7iU6UbbEijI0fSi9fuMBHpf+qZeK5MxPv57X50roQA==
X-Received: by 2002:a65:4486:: with SMTP id l6mr2326605pgq.1.1581672911556;
        Fri, 14 Feb 2020 01:35:11 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:203:f5fe:2a5e:f953:c0ed])
        by smtp.gmail.com with ESMTPSA id w11sm6067926pgh.5.2020.02.14.01.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 01:35:10 -0800 (PST)
Date:   Fri, 14 Feb 2020 18:35:06 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v6 1/5] media: platform: Fix jpeg dec driver bug and
 improve code quality
Message-ID: <20200214093506.GA193786@chromium.org>
References: <20200121095320.32258-1-xia.jiang@mediatek.com>
 <20200121095320.32258-2-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121095320.32258-2-xia.jiang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Tue, Jan 21, 2020 at 05:53:17PM +0800, Xia Jiang wrote:
> Fix v4l2-compliance test bug and improve code quality of jpeg decode
> driver, because the jpeg encode driver will base on it.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v6: alignment 'MTK_JPEG_DCTSIZE' match open parenthesis.
>                                            
> v5: Use clamp()to replace mtk_jpeg_bound_align_image() and round_up()
>     to replace mtk_jpeg_align().
>     Get correct compose value in mtk_jpeg_selection().
>     Cancel spin lock and unlock operation in device run function.
>     Change register offset hex numberals from upercase to lowercase.
> 
> v4: new add patch for v4l2-compliance test bug fix.

Thanks for the patch. The changes look good to me, but each of the
unrelated changes should be split into its own patch, with proper
explanation in its commit message. Especially the ones that introduce
behavior changes, such as the S_SELECTION or locking change.

Also please see one comment inline.

[snip]

> @@ -801,7 +778,6 @@ static void mtk_jpeg_device_run(void *priv)
>  	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>  	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> -	unsigned long flags;
>  	struct mtk_jpeg_src_buf *jpeg_src_buf;
>  	struct mtk_jpeg_bs bs;
>  	struct mtk_jpeg_fb fb;
> @@ -829,13 +805,11 @@ static void mtk_jpeg_device_run(void *priv)
>  	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
>  		goto dec_end;
>  
> -	spin_lock_irqsave(&jpeg->hw_lock, flags);

Why is it safe to remove the locking here?

>  	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
>  	mtk_jpeg_dec_set_config(jpeg->dec_reg_base,
>  				&jpeg_src_buf->dec_param, &bs, &fb);
>  
>  	mtk_jpeg_dec_start(jpeg->dec_reg_base);
> -	spin_unlock_irqrestore(&jpeg->hw_lock, flags);
>  	return;
>  
>  dec_end:

Best regards,
Tomasz

