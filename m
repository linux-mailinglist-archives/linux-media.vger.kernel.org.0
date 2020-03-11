Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95BD3182141
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 19:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730780AbgCKSxl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 14:53:41 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36393 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730705AbgCKSxl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 14:53:41 -0400
Received: by mail-qk1-f196.google.com with SMTP id u25so3183870qkk.3
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 11:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/dNPHeH2JZmJ2dMMclVWXH5FnCXDvSk9raw7HY/zLIQ=;
        b=ygDsOdtY6QApFOfgyPzrx2YcP1OlBPCDu+mbKNx62lxfET7c++bIcIv7VAPT7xD+AM
         HBLi/TBK9SQzFp6tSZ1apwYr4NEZtIjQKrVdleubLxSXTK9HiMiJ6OTmZt3eDFFoy9Mo
         66tCLtaGGmTijrMelKjuDHFOas9Rl6fYaBH5AfQR8a4FgZAx8dUSt0aGPAfgkn/4FDL7
         eKhzvpKLREUjx5S1Hh3hSJakrnOsra+GKMUeE510a9zYDWmO3GmJYrD6U5m2cewGd7N/
         SkzHDu/3OQzW47rJkLahb0aKEACA0ITGxh1SMrT0N5r3CvGCNeggcird9UZZBL4QWxDg
         mEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/dNPHeH2JZmJ2dMMclVWXH5FnCXDvSk9raw7HY/zLIQ=;
        b=XFD42pDkZX1drzPu6l1qsvjSkUm6+t/gl5t5Th8M9QcKjBvgVZJdkIKJS0IS5o/8FR
         nFYf8ZlU+4rtTwItIY7ynTIr1weTOAfHPxKPXymvSX3M8lasQYqbT5dyy7t8CHKLsQRK
         5bHk7fTSziTUEl1YTXXEvIKrxmfisn5OeVzzSljXkCnmCiFDC1I7h3eIfYWD7hs9zMZp
         mF7BMbk4lindO+IZtnex98lqiITNA9bMgR4yQznK4TrLPRinGeKfDk4qHvPNFPmGn/S9
         R0nixYOdMmYiW+BzUxaYpUP4iX8saAwfTALBQlPolxMRGmftPd4cNg6It2tqLOEc8pNr
         TRbw==
X-Gm-Message-State: ANhLgQ0KqJRNIuJQ//HjniwKsNTVRuUXl+Zv37PWTLRhl7TKwJOtpaXo
        fITjqvzHnBDSPcWsdWfOEKFPfEDIaq9wJg==
X-Google-Smtp-Source: ADFU+vtD1QK3Nnp06tnpyor3kMVvaCQ5Li6lEy6jtxXZyL53FFKlmeks+gc5PIIA+MN2WNDram2iHA==
X-Received: by 2002:a37:b304:: with SMTP id c4mr4250035qkf.348.1583952820524;
        Wed, 11 Mar 2020 11:53:40 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2610:98:8005::527])
        by smtp.gmail.com with ESMTPSA id f13sm21354104qkm.42.2020.03.11.11.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 11:53:39 -0700 (PDT)
Message-ID: <7b0e33f9c66dd87904b787218389c3d639f7469a.camel@ndufresne.ca>
Subject: Re: [PATCH 1/6] v4l2-mem2mem: return CAPTURE buffer first
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>
Date:   Wed, 11 Mar 2020 14:53:37 -0400
In-Reply-To: <20200311174300.19407-2-ezequiel@collabora.com>
References: <20200311174300.19407-1-ezequiel@collabora.com>
         <20200311174300.19407-2-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 11 mars 2020 à 14:42 -0300, Ezequiel Garcia a écrit :
> When the request API is used, typically an OUTPUT (src) buffer
> will be part of a request. A userspace process will be typically
> blocked, waiting on the request file descriptor.
> 
> Returning the OUTPUT (src) buffer will wake-up such processes,
> who will immediately attempt to dequeue the CAPTURE buffer,
> only to find it's still unavailable.
> 
> Therefore, change v4l2_m2m_buf_done_and_job_finish returning
> the CAPTURE (dst) buffer first, to avoid signalling the request
> file descriptor prematurely, i.e. before the CAPTURE buffer is done.
> 
> When the request API is not used, this change should have
> no impact.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

This was tested with upcoming GStreamer element with O_NONBLOCK flag passed when
opening the video node. Before this change, EAGAIN would from time to time be
returned when DQBUF(CAPTURE) was called.

  gst-launch-1.0 filesrc location=somefile.mp4 ! parsebin ! v4l2slh264dec ! fakevideosink
  https://gitlab.freedesktop.org/ndufresne/gst-plugins-bad/-/blob/v4l2codecs-hantro-v3/sys/v4l2codecs/gstv4l2decoder.c#L139

Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-
> core/v4l2-mem2mem.c
> index 8986c31176e9..62ac9424c92a 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -504,12 +504,21 @@ void v4l2_m2m_buf_done_and_job_finish(struct
> v4l2_m2m_dev *m2m_dev,
>  
>  	if (WARN_ON(!src_buf || !dst_buf))
>  		goto unlock;
> -	v4l2_m2m_buf_done(src_buf, state);
>  	dst_buf->is_held = src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
>  	if (!dst_buf->is_held) {
>  		v4l2_m2m_dst_buf_remove(m2m_ctx);
>  		v4l2_m2m_buf_done(dst_buf, state);
>  	}
> +	/*
> +	 * If the request API is being used, returning the OUTPUT
> +	 * (src) buffer will wake-up any process waiting on the
> +	 * request file descriptor.
> +	 *
> +	 * Therefore, return the CAPTURE (dst) buffer first,
> +	 * to avoid signalling the request file descriptor
> +	 * before the CAPTURE buffer is done.
> +	 */
> +	v4l2_m2m_buf_done(src_buf, state);
>  	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
>  unlock:
>  	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);

