Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 659E3113CC0
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 09:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbfLEIGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 03:06:14 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41045 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfLEIGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 03:06:14 -0500
Received: by mail-pf1-f193.google.com with SMTP id s18so1222802pfd.8;
        Thu, 05 Dec 2019 00:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sbOWUl/LYyug4BpNjD/sLnbb5ya8VzzTl8Cu9V2yvRY=;
        b=nmGXMlWXu2JCqHKwG7oK8kS1mCgH+HBN4/eM/NOEeCk2in3RGF5oWu656B48kWYzV4
         mY3bSWyZ30MR/SPNmvS/GgUUll2YMsfMQo4qX+RVLHY0NPjYtazSfiBM5ugleCHjtKdG
         /Pbz/f5x5rYSo2Hy4VnzwlqqGlLPdKzWeC6AtTnUUMau3dNCpKjv7aAy3QyOCwm8dRb9
         s41ylI9rrYu3yOGBb4X3BRQLyBLwUu77hjkAhn3AKb1ti3c9OPbwoPdLzlc1yuCbLZrO
         P8A/jaKiNBktktPIGGLu3Ewlo84+vLm4GxiQksazqDrPb7d4VxWAHjyWP95q5eFbVCuR
         KDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sbOWUl/LYyug4BpNjD/sLnbb5ya8VzzTl8Cu9V2yvRY=;
        b=UEmitdjxm1vAbrx39eGB5WN7xneSAdVbVQot9uj4nmwAWC4YnFF18L1WHCMqRgJYxS
         76lmoraRcC0jADevtaGLwvbTQyCs3u6OzoS/gpDfHm9V79coIlJLXbfcsy9C/Js+BDoR
         qmimz9ylo7U3L+CaxfxY47kxekYcJxCoJj99MRxIjBTfdLRN9hV9cXCPPnNUv7aJU8hS
         LALIh4O2FjhSXD7Q61Q1R5T8pHGGzYsEsIoad0kMWAVKI1eEGUrpMnnMy5NUkCoz1H0+
         SNlZG0pPYIZ81doBSKUExdI96QX54qbtk7qEPMQHRx2ynTzerPZ3LBPL2TLEQeW8Co6b
         5YDQ==
X-Gm-Message-State: APjAAAWNIB5AUamyA8hEa3HK4dhyTVwmPjS+8ue79G0GGCqSZkc3h2ew
        7rAe0AJSxDPQ6fAMjnftfl0=
X-Google-Smtp-Source: APXvYqyk7FdG4hnofsNwSjWrXOupDwiMK/1MsIp6Jp00Uhte+xvNi4jEmcD2YJExVKTWuST0cGuFFg==
X-Received: by 2002:a63:3cb:: with SMTP id 194mr8219400pgd.123.1575533173934;
        Thu, 05 Dec 2019 00:06:13 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id w4sm8996292pjt.21.2019.12.05.00.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 00:06:12 -0800 (PST)
Date:   Thu, 5 Dec 2019 17:06:11 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: add missing allocation failure check on
 new_buf
Message-ID: <20191205080611.GY93017@google.com>
References: <20191204141159.1432387-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204141159.1432387-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (19/12/04 14:11), Colin King wrote:
[..]
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 0a1a04fd5d13..8dd1396909d7 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -133,6 +133,8 @@ vdec_queue_recycle(struct amvdec_session *sess, struct vb2_buffer *vb)
>  	struct amvdec_buffer *new_buf;
>
>  	new_buf = kmalloc(sizeof(*new_buf), GFP_KERNEL);
> +	if (!new_buf)
> +		return;
>  	new_buf->vb = vb;

So the buffer is not getting recycled? IOW is leaked?

	-ss
