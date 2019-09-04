Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B79FA7E26
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 10:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbfIDInY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 04:43:24 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40394 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfIDInY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 04:43:24 -0400
Received: by mail-lf1-f66.google.com with SMTP id u29so15184434lfk.7
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2019 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=22aBvTjn7JhApRUIycE5rK4HDJAGLo24z88Hc1SRWA4=;
        b=enCoL6P3SBeQS9D5xyYEBAdoddJ9z61maY/T5ThChXtVQrjpuUkF5viAUSVLEqrTOO
         ImWc5C+mcF/HsSThCxP2TK3SROQw3OclyEPfVNNm6K9gCy2hr99P/uyRk4d5qgMX2mRG
         B8+d2fF3E38Wj7G9stSoSDf+B1kzactV+peRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=22aBvTjn7JhApRUIycE5rK4HDJAGLo24z88Hc1SRWA4=;
        b=jNKK/61m7E1hC4WvrScJy72LK7rSd/WX/ovHOEaJMpFFJ0VpqOL4AyaU4oOyB1b/ZG
         hHY4kLYGOFibq8mpY+xxzRXN7vt97aGoUbdvp3NWwteRrlY1sfjOetDIqxaDHRnyhRVT
         TSawAFgYMAHTQEYa71v6Q/RUYSe2HWWzP4Pm/axhy06sA3gE3erAuW74uEGyC2RLsQlu
         EqySsWm35vfKyeo0iJquUBgmW+cAoxBDz5iiFSBJvG1olH2lXQvfCkAlyTADkkgJ1KBP
         MzmgKQsgBLWyiGOuVfqsnG0yDoavt6DVxQQfjKHn75kIuvmG7CcrX/DF7yvEj0ST2RkI
         RiXA==
X-Gm-Message-State: APjAAAVkJc+YCfU/TyYpnCrUQXLvTNv4BOYxJLolMJyIzYdD1wAjqCpQ
        RWXsdyvgDSJdDTTTZQQOFDqhwA==
X-Google-Smtp-Source: APXvYqw8OMMGAjW/bDQMQDkYA6XzdbLEjLxRR0ppAW3/TaJg6XOpuLFWIOJqftYhJvqXldXvtkGrIA==
X-Received: by 2002:a19:6455:: with SMTP id b21mr23773070lfj.167.1567586602413;
        Wed, 04 Sep 2019 01:43:22 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id z72sm1146467ljb.98.2019.09.04.01.43.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 01:43:21 -0700 (PDT)
Subject: Re: [PATCH] media: meson: Add NULL check after the call to kmalloc()
To:     Austin Kim <austindh.kim@gmail.com>, mchehab@kernel.org,
        khilman@baylibre.com
Cc:     mjourdan@baylibre.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20190904082232.GA171180@LGEARND20B15>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <a9ca05ec-55a9-a58c-267a-334771a1480a@rasmusvillemoes.dk>
Date:   Wed, 4 Sep 2019 10:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904082232.GA171180@LGEARND20B15>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/09/2019 10.22, Austin Kim wrote:
> If the kmalloc() return NULL, the NULL pointer dereference will occur.
> 	new_ts->ts = ts;
> 
> Add exception check after the call to kmalloc() is made.
> 
> Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/vdec_helpers.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> index f16948b..e7e56d5 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> @@ -206,6 +206,10 @@ void amvdec_add_ts_reorder(struct amvdec_session *sess, u64 ts, u32 offset)
>  	unsigned long flags;
>  
>  	new_ts = kmalloc(sizeof(*new_ts), GFP_KERNEL);
> +	if (!new_ts) {
> +		dev_err(sess->core->dev, "Failed to kmalloc()\n");
> +		return;
> +	}
>  	new_ts->ts = ts;
>  	new_ts->offset = offset;

No need to printk() on error, AFAIK the mm subsystem should already make
some noise if an allocation fails.
This is not a proper fix - you need to make the function return an error
(-ENOMEM) to let the caller know allocation failed, and allow that to
propagate the error. There's only one caller, which already seems
capable of returning errors (there's an -EAGAIN), so it shouldn't be
that hard - though of course one needs to undo what has been done so far.

Also, unrelated to the kmalloc() handling: amvdec_add_ts_reorder() could
be moved to esparser.c and made static, or at the very least the
EXPORT_SYMBOL can be removed since vdec_helpers.o is linked in to the
same module as the sole user. That probably goes for all the
EXPORT_SYMBOL(amvdec_*).

Rasmus
