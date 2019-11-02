Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 268A7ED098
	for <lists+linux-media@lfdr.de>; Sat,  2 Nov 2019 21:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfKBUuR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Nov 2019 16:50:17 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40789 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfKBUuQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Nov 2019 16:50:16 -0400
Received: by mail-lf1-f67.google.com with SMTP id f4so9533557lfk.7;
        Sat, 02 Nov 2019 13:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TMQ4NDitUYnUhGv5voHZAQ0dKZZeDpp/dAZsaOYDH4o=;
        b=Ddexn868YUQKuMfBofLZ48Q+vPwuhjF91ipfPQJOdkt6nDaDUMfiPXFILz59OtQRt/
         srCe+ae/0BrF9PXg9toPzHrvxD+hln7LRkVBlH753XAxJvHTk/SdUOSWmyAVwLsuIrGy
         xt6sY1N4a+3zmmCj5blf8tt5t/V18dh8fV3CT5fqpOzp50WA+sZe0wp5KrOjAFoQsUXd
         mmDCSrajkUyjmtXIDiIGnPTh0DH3Dw6ERqIoshRgy6IWEv465FkwhjewY98zwQnNDxZF
         lqe3yq7ql2bvoDv40M9vE0eurSnBrmPt77EyoDm9UZXqzfL258UDu4r/91Ve4V7cgk98
         Yk7Q==
X-Gm-Message-State: APjAAAVdgFdjT2UBT7l8DqDPNHkdQRgBcJbLnUQnIaiNQJ2mcR9R4ee5
        oUPsJqZMIHm97+QbF5aRzWYh2nTXhlk=
X-Google-Smtp-Source: APXvYqxYu7kcT0bh7It5SLujokQoZAa+qHC69hXCEaOZd2dOVculK+VMnlDAM/wZizIkpyRaFI3w0A==
X-Received: by 2002:a19:8c05:: with SMTP id o5mr11492786lfd.53.1572727812939;
        Sat, 02 Nov 2019 13:50:12 -0700 (PDT)
Received: from [192.168.1.183] ([213.234.229.88])
        by smtp.gmail.com with ESMTPSA id w29sm4422140lfc.66.2019.11.02.13.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2019 13:50:11 -0700 (PDT)
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH v3 1/1] media: vivid: Fix wrong locking that causes race
 conditions on streaming stop
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Security Officers <security@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191102190327.24903-1-alex.popov@linux.com>
From:   Alexander Popov <alex.popov@linux.com>
Autocrypt: addr=alex.popov@linux.com; prefer-encrypt=mutual; keydata=
 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
 j3lCqPk=
Message-ID: <8edf1056-072d-9718-74ac-e6b8c0339228@linux.com>
Date:   Sat, 2 Nov 2019 23:50:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191102190327.24903-1-alex.popov@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I've announced this patch at the oss-security ML:
https://www.openwall.com/lists/oss-security/2019/11/02/1

Best regards,
Alexander


On 02.11.2019 22:03, Alexander Popov wrote:
> There is the same incorrect approach to locking implemented in
> vivid_stop_generating_vid_cap(), vivid_stop_generating_vid_out() and
> sdr_cap_stop_streaming().
> 
> These functions are called during streaming stopping with vivid_dev.mutex
> locked. And they all do the same mistake while stopping their kthreads,
> which need to lock this mutex as well. See the example from
> vivid_stop_generating_vid_cap():
>   /* shutdown control thread */
>   vivid_grab_controls(dev, false);
>   mutex_unlock(&dev->mutex);
>   kthread_stop(dev->kthread_vid_cap);
>   dev->kthread_vid_cap = NULL;
>   mutex_lock(&dev->mutex);
> 
> But when this mutex is unlocked, another vb2_fop_read() can lock it
> instead of vivid_thread_vid_cap() and manipulate the buffer queue.
> That causes a use-after-free access later.
> 
> To fix those issues let's:
>   1. avoid unlocking the mutex in vivid_stop_generating_vid_cap(),
> vivid_stop_generating_vid_out() and sdr_cap_stop_streaming();
>   2. use mutex_trylock() with schedule_timeout() in the loops
> of the vivid kthread handlers.
> 
> Signed-off-by: Alexander Popov <alex.popov@linux.com>
> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
> ---
>  drivers/media/platform/vivid/vivid-kthread-cap.c | 8 +++++---
>  drivers/media/platform/vivid/vivid-kthread-out.c | 8 +++++---
>  drivers/media/platform/vivid/vivid-sdr-cap.c     | 8 +++++---
>  3 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
> index 003319d7816d..27b9c78d2d05 100644
> --- a/drivers/media/platform/vivid/vivid-kthread-cap.c
> +++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
> @@ -796,7 +796,11 @@ static int vivid_thread_vid_cap(void *data)
>  		if (kthread_should_stop())
>  			break;
>  
> -		mutex_lock(&dev->mutex);
> +		if (!mutex_trylock(&dev->mutex)) {
> +			schedule_timeout(1);
> +			continue;
> +		}
> +
>  		cur_jiffies = jiffies;
>  		if (dev->cap_seq_resync) {
>  			dev->jiffies_vid_cap = cur_jiffies;
> @@ -956,8 +960,6 @@ void vivid_stop_generating_vid_cap(struct vivid_dev *dev, bool *pstreaming)
>  
>  	/* shutdown control thread */
>  	vivid_grab_controls(dev, false);
> -	mutex_unlock(&dev->mutex);
>  	kthread_stop(dev->kthread_vid_cap);
>  	dev->kthread_vid_cap = NULL;
> -	mutex_lock(&dev->mutex);
>  }
> diff --git a/drivers/media/platform/vivid/vivid-kthread-out.c b/drivers/media/platform/vivid/vivid-kthread-out.c
> index ce5bcda2348c..a657b0d20e2f 100644
> --- a/drivers/media/platform/vivid/vivid-kthread-out.c
> +++ b/drivers/media/platform/vivid/vivid-kthread-out.c
> @@ -143,7 +143,11 @@ static int vivid_thread_vid_out(void *data)
>  		if (kthread_should_stop())
>  			break;
>  
> -		mutex_lock(&dev->mutex);
> +		if (!mutex_trylock(&dev->mutex)) {
> +			schedule_timeout(1);
> +			continue;
> +		}
> +
>  		cur_jiffies = jiffies;
>  		if (dev->out_seq_resync) {
>  			dev->jiffies_vid_out = cur_jiffies;
> @@ -301,8 +305,6 @@ void vivid_stop_generating_vid_out(struct vivid_dev *dev, bool *pstreaming)
>  
>  	/* shutdown control thread */
>  	vivid_grab_controls(dev, false);
> -	mutex_unlock(&dev->mutex);
>  	kthread_stop(dev->kthread_vid_out);
>  	dev->kthread_vid_out = NULL;
> -	mutex_lock(&dev->mutex);
>  }
> diff --git a/drivers/media/platform/vivid/vivid-sdr-cap.c b/drivers/media/platform/vivid/vivid-sdr-cap.c
> index 9acc709b0740..590080716962 100644
> --- a/drivers/media/platform/vivid/vivid-sdr-cap.c
> +++ b/drivers/media/platform/vivid/vivid-sdr-cap.c
> @@ -141,7 +141,11 @@ static int vivid_thread_sdr_cap(void *data)
>  		if (kthread_should_stop())
>  			break;
>  
> -		mutex_lock(&dev->mutex);
> +		if (!mutex_trylock(&dev->mutex)) {
> +			schedule_timeout(1);
> +			continue;
> +		}
> +
>  		cur_jiffies = jiffies;
>  		if (dev->sdr_cap_seq_resync) {
>  			dev->jiffies_sdr_cap = cur_jiffies;
> @@ -303,10 +307,8 @@ static void sdr_cap_stop_streaming(struct vb2_queue *vq)
>  	}
>  
>  	/* shutdown control thread */
> -	mutex_unlock(&dev->mutex);
>  	kthread_stop(dev->kthread_sdr_cap);
>  	dev->kthread_sdr_cap = NULL;
> -	mutex_lock(&dev->mutex);
>  }
>  
>  static void sdr_cap_buf_request_complete(struct vb2_buffer *vb)
> 

