Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65465279260
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 22:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbgIYUm0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 16:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgIYUm0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 16:42:26 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EC6C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 13:42:26 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y15so479896wmi.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=onDNXckTby4mBcAKEnhxgaIn2ds/xEPrayaE4G2f3Fs=;
        b=ar0xF7mOvi1fGoXzX5HFsrUAoZiiV25uMTjWCg35t2nHPXHEXhmXbYo8bGP4kYaQHW
         rv+AfMGHiMKtbH72ipBuJkYNSf5CAnLGd//5bHlLrEhbAEuyGNOd4XJ0yMdcoOVXGaTv
         6hyvwewe+zbUppk6e+AqmO+GnS+jlPqdVaS6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=onDNXckTby4mBcAKEnhxgaIn2ds/xEPrayaE4G2f3Fs=;
        b=hB336bQzDTlc6l8hFIhtwPV/TwwAWpIBkPXXISxzBRtfdUPNLHRq3tTa+0pKqWPxcn
         QxVAHnWsuFTjM92vf79Dl9qfjWC+H7B5E9WYcrLykrCBDzoqgZXHJupUlBYT4BdEg70/
         ELF3YAyuj84olECJo3LmBBHfBUNoH/iAMJrqRQLXWARjV3JFj5oEnGLEWGP2GP6LPK7K
         z6dtt5GViZBajWsI71hGVx5/2wRdMzgesKTZuD04RRVOM+hZHXki1noBULUiRrwyLexo
         75aQ1I/zH952d+v6+cB746Md8CqI4fUB+aD+C9hp2pr9+zIfCcs6PfkfPMCKbil2mf4w
         cl7w==
X-Gm-Message-State: AOAM531+TFOlLlBzPlDqNv+TIO+/HJq3TuSwsE3kSKLXwz0P1mcLBa1U
        W7R28Q3qwbVntV/v+ewDGIkNyA==
X-Google-Smtp-Source: ABdhPJy0/WO09xoyMyEjsgH+pcEi8ywepvTySLM+ZrJWOH6vz5sZh8gCh29fETV0oW4g16NoyzEHbg==
X-Received: by 2002:a1c:2e4b:: with SMTP id u72mr353593wmu.69.1601066544634;
        Fri, 25 Sep 2020 13:42:24 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id n2sm233344wma.29.2020.09.25.13.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 13:42:23 -0700 (PDT)
Date:   Fri, 25 Sep 2020 20:42:22 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v3 06/12] media: staging: rkisp1: remove atomic
 operations for frame sequence
Message-ID: <20200925204222.GG3607091@chromium.org>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
 <20200922113402.12442-7-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922113402.12442-7-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Sep 22, 2020 at 01:33:56PM +0200, Dafna Hirschfeld wrote:
> The isp.frame_sequence is now read only from the irq handlers
> that are all fired from the same interrupt, so there is not need
> for atomic operation.
> In addition, the frame seq incrementation is moved from
> rkisp1_isp_queue_event_sof to rkisp1_isp_isr to make the code
> clearer and the incorrect inline comment is removed.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> changes since v2:
> add a closing "}" to if condition
> remove usless inline comment
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c |  2 +-
>  drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +-
>  drivers/staging/media/rkisp1/rkisp1-isp.c     | 16 +++++-----------
>  drivers/staging/media/rkisp1/rkisp1-params.c  |  2 +-
>  drivers/staging/media/rkisp1/rkisp1-stats.c   |  3 +--
>  5 files changed, 9 insertions(+), 16 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 0632582a95b4..1c762a369b63 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -632,7 +632,7 @@ static void rkisp1_handle_buffer(struct rkisp1_capture *cap)
>  	curr_buf = cap->buf.curr;
>  
>  	if (curr_buf) {
> -		curr_buf->vb.sequence = atomic_read(&isp->frame_sequence);
> +		curr_buf->vb.sequence = isp->frame_sequence;

I wonder if with higher resolutions, let's say full 5 Mpix, and/or some
memory-intensive system load, like video encoding and graphics rendering,
the DMA wouldn't take enough time to have the MI_FRAME interrupt fire after
the V_START for the next frame.

I recall you did some testing back in time [1], showing that the two are
interleaved. Do you remember what CAPTURE resolution was it?

>  		curr_buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
>  		curr_buf->vb.field = V4L2_FIELD_NONE;
>  		vb2_buffer_done(&curr_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 232bee92d0eb..51c92a251ea5 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -131,7 +131,7 @@ struct rkisp1_isp {
>  	const struct rkisp1_isp_mbus_info *src_fmt;
>  	struct mutex ops_lock; /* serialize the subdevice ops */
>  	bool is_dphy_errctrl_disabled;
> -	atomic_t frame_sequence;
> +	__u32 frame_sequence;

nit: The __ prefixed types are defined for the UAPI to avoid covering userspace
types. For kernel types please just use the plain u32.

Best regards,
Tomasz
