Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 918222791E4
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 22:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgIYUSw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 16:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgIYUQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 16:16:52 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45F6C05BD09
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 13:16:51 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j2so5090948wrx.7
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 13:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h3k4PJlbn3oqcZuyt17TXRTBC5y1fefCeaLF91QzcAE=;
        b=XRFHOqUW/AwpVxGjTI5QMXyPajpvVQ9qjM9fq+W3HfB+cpqB3BUrJYKivdM/b1nTNX
         KSN2JwaEPSx40cxvecjBN7DeZ1D2tEm4uXCevs2P3EFavFDroWPF9/kBrYXZ/xgM8T4F
         u11bcNoZkYT34lBlgrf62yU+7bDZgGA8ANKS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h3k4PJlbn3oqcZuyt17TXRTBC5y1fefCeaLF91QzcAE=;
        b=WVoV56H4Gpbp1g28z947Y5jzJ4v3o5/4oc51truSshSh9t5buzw1m/YpxRRDvjgYcS
         oGSiOS9zxtUx24QFZkwlhAlYnjkZLWD3ZL0B3+1VUK18ZvJPlLQIS3avUgP7JZjNhQBb
         1c69JPYE8e33x9CQf/3xg1+H9aKVti1cM2gNCk2w0f3rKBRA4iEw48F2gVBS/e48XKpy
         LC52Dk83Z3NSJwOFnlrQCmWKuZyG0WVV2uN5uqCQgo4kcT+0fsyCpou5NXsy9Ngx3Cym
         Fo6crGq2ha3obNUshEePq8c9U/ww7mVpwYE8vhUIhRQA7k6iUm09X0/xgp7AYbQvDmyN
         xt0Q==
X-Gm-Message-State: AOAM531JrJOMBZbBjFr6QomtpWjWo58D4ZJLvJhX/bwPodKqyxQO3Q8F
        N2fKYMLFkOV79L2tMtTbxloShBSLVcHRHw==
X-Google-Smtp-Source: ABdhPJxuWVrj/8ZtIym4iJUccN2IeduqFDU8+EupK+SWm4dJIVTyCOKMM500UiDK5krErbyP6VfqqA==
X-Received: by 2002:a05:6000:1c8:: with SMTP id t8mr6134776wrx.3.1601065010483;
        Fri, 25 Sep 2020 13:16:50 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id q186sm128690wma.45.2020.09.25.13.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 13:16:49 -0700 (PDT)
Date:   Fri, 25 Sep 2020 20:16:48 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH v3 04/12] media: staging: rkisp1: params: avoid using
 buffer if params is not streaming
Message-ID: <20200925201648.GF3607091@chromium.org>
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
 <20200922113402.12442-5-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922113402.12442-5-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Sep 22, 2020 at 01:33:54PM +0200, Dafna Hirschfeld wrote:
> Currently, the first buffer queued in the params node is returned
> immediately to userspace and a copy of it is saved in the field
> 'cur_params'. The copy is later used for the first configuration
> when the stream is initiated by one of selfpath/mainpath capture nodes.

Thank you for the patch. Please see my comments inline.

> 
> There are 3 problems with this implementation:
> - The first params buffer is applied and returned to userspace even if
> userspace never calls to streamon on the params node.

How is this possible? VB2 doesn't call the .buf_queue callback until streaming is started.

> - If the first params buffer is queued after the stream started on the
> params node then it will return to userspace but will never be used.

Why?

> - The frame_sequence of the first buffer is set to -1 if the main/selfpath
> did not start streaming.

Indeed, this is invalid. The sequence number should correspond to the
sequence number of the frame that the parameters were applied to, i.e. the
parameter buffer A and the video buffer B dequeued from the CAPTURE node
which contains the first frame processed with the parameters from buffer A
should have the same sequence number.

> 
> A correct implementation is to apply the first params buffer when stream
> is started from mainpath/selfpath and only if params is also streaming.
> 
> The patch adds a new function 'rkisp1_params_apply_params_cfg' which takes
> a buffer from the buffers queue, apply it and returns it to userspace.
> The function is called from the irq handler and when main/selfpath stream
> starts - in the function 'rkisp1_params_config_parameter'
> 
> Also remove the fields 'cur_params', 'is_first_params' which are no
> more needed.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
> changes since v2:
> declare function 'rkisp1_params_apply_params_cfg' as static
> to fix a warning reported by 'kernel test robot <lkp@intel.com>'
> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h |  4 --
>  drivers/staging/media/rkisp1/rkisp1-params.c | 50 ++++++++------------
>  2 files changed, 20 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 992d8ec4c448..232bee92d0eb 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -262,10 +262,8 @@ struct rkisp1_stats {
>   * @rkisp1:		pointer to the rkisp1 device
>   * @config_lock:	locks the buffer list 'params' and 'is_streaming'
>   * @params:		queue of rkisp1_buffer
> - * @cur_params:		the first params values from userspace
>   * @vdev_fmt:		v4l2_format of the metadata format
>   * @is_streaming:	device is streaming
> - * @is_first_params:	the first params should take effect immediately
>   * @quantization:	the quantization configured on the isp's src pad
>   * @raw_type:		the bayer pattern on the isp video sink pad
>   */
> @@ -275,10 +273,8 @@ struct rkisp1_params {
>  
>  	spinlock_t config_lock; /* locks the buffers list 'params' and 'is_streaming' */
>  	struct list_head params;
> -	struct rkisp1_params_cfg cur_params;
>  	struct v4l2_format vdev_fmt;
>  	bool is_streaming;
> -	bool is_first_params;
>  
>  	enum v4l2_quantization quantization;
>  	enum rkisp1_fmt_raw_pat_type raw_type;
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index ab2deb57b1eb..e8049a50575f 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1185,23 +1185,14 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  	}
>  }
>  
> -void rkisp1_params_isr(struct rkisp1_device *rkisp1)
> +static void rkisp1_params_apply_params_cfg(struct rkisp1_params *params,
> +					   unsigned int frame_sequence)

Should we call this _locked() since it is expected that the config_lock is
held when called?

To signify such condition, the __must_hold sparse annotation can be used.

>  {
> -	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence);
> -	struct rkisp1_params *params = &rkisp1->params;
>  	struct rkisp1_params_cfg *new_params;
>  	struct rkisp1_buffer *cur_buf = NULL;
>  
> -	spin_lock(&params->config_lock);
> -	if (!params->is_streaming) {
> -		spin_unlock(&params->config_lock);
> -		return;
> -	}
> -
> -	if (list_empty(&params->params)) {
> -		spin_unlock(&params->config_lock);
> +	if (list_empty(&params->params))
>  		return;
> -	}
>  
>  	cur_buf = list_first_entry(&params->params,
>  				   struct rkisp1_buffer, queue);
> @@ -1218,6 +1209,20 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>  
>  	cur_buf->vb.sequence = frame_sequence;
>  	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +}
> +
> +void rkisp1_params_isr(struct rkisp1_device *rkisp1)
> +{
> +	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence);
> +	struct rkisp1_params *params = &rkisp1->params;
> +
> +	spin_lock(&params->config_lock);
> +	if (!params->is_streaming) {

Do we need this check? Wouldn't the queue be empty if params is not
streaming?

Also, if we decide that we need the check, we could replace the private
is_streaming flag with vb2_is_streaming().

Best regards,
Tomasz
