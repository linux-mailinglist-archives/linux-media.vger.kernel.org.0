Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395F01F59A9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 19:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgFJRDs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 13:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgFJRDs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 13:03:48 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B201C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:03:47 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id q11so3131015wrp.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QqKtF6YggT1kVfGangu1NVfy3YhWEYyJMMlQRoCyXEo=;
        b=bARbcSN2FVoxtjkZrNqoOH0kNupyfsuM8P3iDtgS7WgKApBJRFimUENjau+/29mC62
         Fd6vlXNYXgmIXkxnuUl10xdJVucLZQLysCS5yIFlXQAoyCRJ3+kMLLzbfD5Yn6FKXPHP
         UrkIRo9swZkj/0kwj6VW34tnogP9Pj0AXSt6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QqKtF6YggT1kVfGangu1NVfy3YhWEYyJMMlQRoCyXEo=;
        b=HohDiYNFW89PQdOAwt4h/2ZrIPvDm7n2nAqoQZqkDKrP0+Zi57bcC8g9nK1M1gKWpZ
         Y8ng6iyPQJJ/OUc8pNVG9Cc+Awm41K87yz5YXxtxzrAuHwP+2r3I6PYXjIh6GMj9/thi
         1DjOjXV8VWHtdXlfzJ+K5sCaoyGX0BvtDlZoGtKaSar6TjvX3AjydV31aTgtFfFmEGLR
         otXz397L2E2dsszsp1KOaaIYzfzhT08BwTmEeawg82AbSuy5KgMWcwRaBf7Q/7MbA+zp
         Vl0v2eAgHrjOW9nr4LhhDXBkxpDH5vsyqr6IJVv8J6BXgL7+0VBK7TNCbFbIekWzxH9B
         JNfw==
X-Gm-Message-State: AOAM533kvwfWHajYZnQvxCMB/6M5++bMF64yyOAIDXsNDg48ZabW9kc8
        K9DG62FpEo7GNoppJofL76mc3g==
X-Google-Smtp-Source: ABdhPJwpRF03+YA3UPy97b7QHVyxNK/FY/bTYzrYucdvxEeE0qs7mburY0RomM5MuUosEt6lXsX9PQ==
X-Received: by 2002:adf:f988:: with SMTP id f8mr5184805wrr.81.1591808626330;
        Wed, 10 Jun 2020 10:03:46 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id t7sm518761wrq.41.2020.06.10.10.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:03:45 -0700 (PDT)
Date:   Wed, 10 Jun 2020 17:03:44 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, skhan@linuxfoundation.org,
        niklas.soderlund@ragnatech.se--annotate
Subject: Re: [PATCH v4 4/5] media: staging: rkisp1: cap: use
 v4l2_pipeline_stream_{enable,disable} helpers
Message-ID: <20200610170344.GC201868@chromium.org>
References: <20200522075522.6190-1-dafna.hirschfeld@collabora.com>
 <20200522075522.6190-5-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522075522.6190-5-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Fri, May 22, 2020 at 09:55:21AM +0200, Dafna Hirschfeld wrote:
> From: Helen Koike <helen.koike@collabora.com>
> 
> Use v4l2_pipeline_stream_{enable,disable} to call .s_stream()
> subdevice callbacks through the pipeline.
> Those helpers are called only if the other capture is not streaming.
> 
> If the other capture is streaming then he already did that for us
> so we call s_stream only on the resizer that is connected to the
> capture node.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 104 ++++++------------
>  1 file changed, 32 insertions(+), 72 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

[snip]
> +static int rkisp1_s_stream_subdev(struct rkisp1_capture *cap, int enable)
> +{
> +	struct rkisp1_device *rkisp1 = cap->rkisp1;
> +	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
> +	int ret;
> +
> +	/*
> +	 * if the other capture is already streaming then we only need to
> +	 * call s_stream of our reszier
> +	 */
> +	if (other->is_streaming) {
> +		struct v4l2_subdev *rsz_sd  = &rkisp1->resizer_devs[cap->id].sd;
> +
> +		ret = v4l2_subdev_call(rsz_sd, video, s_stream, enable);
> +		if (ret && ret != -ENOIOCTLCMD)
> +			dev_err(rkisp1->dev,
> +				"stream %s resizer '%s' failed (%d)\n",
> +				enable ? "on" : "off", rsz_sd->name, ret);

Do we need this special case? Wouldn't v4l2_pipeline_stream_*() simply
increment reference counters for the other entities?

> +	} else {
> +		if (enable)
> +			ret = v4l2_pipeline_stream_enable(&cap->vnode.vdev);
> +		else
> +			ret = v4l2_pipeline_stream_disable(&cap->vnode.vdev);

I wonder if this doesn't ask for just making the helper
v4l2_pipeline_s_stream(..., int enable).

Best regards,
Tomasz
