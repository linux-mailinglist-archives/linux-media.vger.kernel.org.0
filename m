Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD1BD7ED2
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 20:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388944AbfJOSWx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 14:22:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37931 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388941AbfJOSWx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 14:22:53 -0400
Received: by mail-wm1-f67.google.com with SMTP id 3so100143wmi.3
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 11:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FFPV1qwu3ftxAdjW8RQSaSHHhbDsC+9OSe/rOAAXNyM=;
        b=txmclpqXMuJOOIXlXca0+mOAChTWps0GC2pJ2hA0UguYa1MIYWI6JaC5gnvZIq9Raq
         iWFegin+i+U+SB79KW6SUrZs8rENodVpgv4vmAcpEDJcG0iX4UruYwL4KWlpDN+8w/jW
         lOXhv8FNSfdQE2T+jgNd/khHVgo0rpLiG0pSd3mmcSB/FYR28FSjFaAgDA8Q/47Ohose
         EbPfK6ZLd3Ft6d2ZG35lvBoyGE/1KNlRDE8XmMqI13dhUldsPVSCltTg1y+qsweXPZRg
         9gVyP5/LGDQClW2piucKORr5mYyZ6LWJ4L8r+7R25FvKDcN+5xbU0yJ1Dzu4qgbal7nN
         X6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FFPV1qwu3ftxAdjW8RQSaSHHhbDsC+9OSe/rOAAXNyM=;
        b=n2Ob6tTi5uxSQ9pUZh3NVxl1Uv8H5Xl1ZrR4lmrDzS9lGvR0aVGrJJPMqUusqtTFZV
         MyfU2aV51rDUhDPVNkmHjxmz2FNGspZNAo20lyr/A3CKpmIgAbdFLIwg0uwolAwGRiVf
         2Feoh+0Ys7wJ7dIr/mxTltlkNBYLZFst7ZVkhkTozE0pLD6I6u/s3unOCi0wLAvGfTDt
         4gTeyX1xVtY3JZzF0K2awF0wXKZLmN4Fo1wXdEoTXW4PcQ/ifo3DV/D+RPy5Yj1c7klw
         ZY6UJq8TWLl8XOqTTPF7GjvQWFFK04gglbWXNABTcjg4c0BQD4KrvvOLCgnJ2161Ow/y
         bIbg==
X-Gm-Message-State: APjAAAXPPVfcf+7n88JttFv7awnuLvtXi2B8sXzPrF6i0EFHR9bojZYN
        6ovT8RGUvQOwQnQXyh6So+BhtiZA
X-Google-Smtp-Source: APXvYqzId/LUNx0ZDRCLC7pC2wsOMgQ+jd9wADqPVSJBlY9LHvn79moCWQWgyd5yp1hxlHUpuwsdJA==
X-Received: by 2002:a1c:ac02:: with SMTP id v2mr16533257wme.85.1571163771045;
        Tue, 15 Oct 2019 11:22:51 -0700 (PDT)
Received: from [172.30.89.60] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id n15sm20249186wrw.47.2019.10.15.11.22.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 11:22:50 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] media: imx.rst: Pass the v4l2-ctl configuration
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, tharvey@gateworks.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org
References: <20191015160042.28113-1-festevam@gmail.com>
 <20191015160042.28113-4-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <3d9285cd-5895-c709-e96e-1d6c88544c75@gmail.com>
Date:   Tue, 15 Oct 2019 11:22:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015160042.28113-4-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/15/19 9:00 AM, Fabio Estevam wrote:
> Pass the v4l2-ctl configuration for the imx6q-sabreauto PAL
> example for completeness and consistency.
>
> Suggested-by: Steve Longerbeam <slongerbeam@gmail.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Steve Longerbeam<slongerbeam@gmail.com>

> ---
> Changes since v2:
> - Newly introduced patch
>
>   Documentation/media/v4l-drivers/imx.rst | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index aab68d8ef2c9..1246573c1019 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -564,10 +564,11 @@ alternating fields (field type 'seq-tb' for PAL, or 'alternate').
>      media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
>      media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
>      media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
> +   # Configure "ipu1_ic_prpvf capture" interface (assumed at /dev/video2)
> +   v4l2-ctl -d2 --set-fmt-video=field=none
>   
> -Streaming can then begin on the capture device node at
> -"ipu1_ic_prpvf capture". The v4l2-ctl tool can be used to select any
> -supported YUV or RGB pixelformat on the capture device node.
> +Streaming can then begin on /dev/video2. The v4l2-ctl tool can also be
> +used to select any supported YUV pixelformat on /dev/video2.
>   
>   This platform accepts Composite Video analog inputs to the ADV7180 on
>   Ain1 (connector J42).

