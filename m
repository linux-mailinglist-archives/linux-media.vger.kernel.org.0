Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB3C34B165
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 22:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhCZVf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 17:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhCZVfw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 17:35:52 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D822C0613AA;
        Fri, 26 Mar 2021 14:35:51 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u20so8933403lja.13;
        Fri, 26 Mar 2021 14:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2ieblrruj5YvTjlquzx3j6fm4YaYK6LNYq/xss2H9Js=;
        b=aUwEl6EAV87dwYXbqwLb8Yd4Htq9czvGjktMNzsBZVhRS2evEwTxETMqtc6um5dsp5
         uIGgoIwi8UsaAuf5KREZIpSDmGLHfRDz+p2MsoHqf9uLwQBzPfm4AwFMKGFntnF8nKEk
         m4vZyZpYZanEeEDH4Og7bmKusaUDgV+yiWhuuBIxfvPLL9dG51SOW9SMQT5YgXojuwle
         DT2Os2kaZgCuj3+4Ih9uMpmuEZiMHGKmDOLZMQkivyF7XO0129f0ZJctJwHSJLP5cRLE
         kltmu30vDXYL7zWWOb/IJVQhv/TEKY+WIgmSenk+glm9/l4ghC3ldYDvV68b+ARgJBsN
         9pXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2ieblrruj5YvTjlquzx3j6fm4YaYK6LNYq/xss2H9Js=;
        b=E6jgN1F8s3XIfqoZmga6qNTCDf2SKtA+DHH1u6JnVxrmR9rRVpbPwfKs1FcxAM+VJN
         NXDfIxiQhEPCF+ximczJ6Ze0v6mAi66MZTSQ466/OB717HDcshNnV5zD5h/VzDqLk7JW
         AAhRe9Pqs5X79c3l/uudI1/EDqad1DyDan0Tk5ZeIABwCyQistPwU3pQuukHGUxCbfH5
         JP2dojmpnbl+9blNWivP/AjSJC3Q/EOv7Gr8fhbse/6OfyxlMWaxtOAhoNztnPgQDlNK
         piZVI3QBUEZI0gtbq5bpninPgrw3KGToz77jpJ3uJNQ0tJeDgo0DkEXlPfi2fDfQWT/v
         TaWA==
X-Gm-Message-State: AOAM532t54iDaehpHP52K8NDSyvgFRlMSaUa6xUkxK9jhRKuwBtmKmgS
        EYKaGalkf2XMc3uTKwSeB4g=
X-Google-Smtp-Source: ABdhPJzQs6zt1xIb4kqD4QqbvVt55cHTl9PiickiClvdb7Si0ASZn+rAJZicogFpuhwjfgtY5ihsxg==
X-Received: by 2002:a2e:a48b:: with SMTP id h11mr10025070lji.492.1616794549965;
        Fri, 26 Mar 2021 14:35:49 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.227.42])
        by smtp.gmail.com with ESMTPSA id x17sm982675lfg.164.2021.03.26.14.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 14:35:49 -0700 (PDT)
Message-ID: <ff97f9dc25d726e06d792e5d011f19747637e2a0.camel@gmail.com>
Subject: Re: [PATCH v2] media: sq905.c: fix uninitialized variable
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Alaa Emad <alaaemadhossney.ae@gmail.com>, hverkuil@xs4all.nl
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller@googlegroups.com,
        syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com,
        Dmitry Vyukov <dvyukov@google.com>
Date:   Sat, 27 Mar 2021 00:35:48 +0300
In-Reply-To: <20210326210252.129595-1-alaaemadhossney.ae@gmail.com>
References: <20210326210252.129595-1-alaaemadhossney.ae@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

On Fri, 2021-03-26 at 23:02 +0200, Alaa Emad wrote:
> Reported-by: syzbot+a4e309017a5f3a24c7b3@syzkaller.appspotmail.com
> Signed-off-by: Alaa Emad <alaaemadhossney.ae@gmail.com>
> 
> ---
> Changes in v2:
>   - Fix the error occured because of pervious fix.
> ---
>  drivers/media/usb/gspca/sq905.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/gspca/sq905.c
> b/drivers/media/usb/gspca/sq905.c
> index 97799cfb832e..57206dd2e1a0 100644
> --- a/drivers/media/usb/gspca/sq905.c
> +++ b/drivers/media/usb/gspca/sq905.c
> @@ -157,8 +157,8 @@ static int sq905_ack_frame(struct gspca_dev
> *gspca_dev)
>  static int
>  sq905_read_data(struct gspca_dev *gspca_dev, u8 *data, int size, int
> need_lock)
>  {
> -       int ret;
> -       int act_len;
> +       int ret;
> +       int act_len;
>  
>         gspca_dev->usb_buf[0] = '\0';
>         if (need_lock)
> @@ -180,8 +180,8 @@ sq905_read_data(struct gspca_dev *gspca_dev, u8
> *data, int size, int need_lock)
>                            data, size, &act_len, SQ905_DATA_TIMEOUT);
>  
>         /* successful, it returns 0, otherwise  negative */
> -       if (ret < 0 || act_len != size) {
> -               pr_err("bulk read fail (%d) len %d/%d\n", ret, act_len,
> size);
> +       if (ret < 0 || act_len != size) {
> +              pr_err("bulk read fail (%d) len %d/%d\n", ret, ret < 0 ?
> -1 : act_len, size);
>                 return -EIO;
>         }
>         return 0;
> -- 
> 2.25.1
> 

I skimmed through code, and I'm not sure about Dmitry's approach,
because I think usb_submit_urb() can return some valid urb-
>actual_length and error code:

	if (!wait_for_completion_timeout(&ctx.done, expire)) {
		usb_kill_urb(urb);
		retval = (ctx.status == -ENOENT ? -ETIMEDOUT :
ctx.status);

		dev_dbg(&urb->dev->dev,
			"%s timed out on ep%d%s len=%u/%u\n",
			current->comm,
			usb_endpoint_num(&urb->ep->desc),
			usb_urb_dir_in(urb) ? "in" : "out",
			urb->actual_length,
			urb->transfer_buffer_length);
	} else
		retval = ctx.status;
...
	if (actual_length)
		*actual_length = urb->actual_length;

I believe, that this info might be useful.  

Im not sure about it, i didn't found any examples of this log and have
no idea how to reproduce it, it's just my thoughts. Maybe, one of the
maintainers will correct me 

-- 
With regards,
Pavel Skripkin


