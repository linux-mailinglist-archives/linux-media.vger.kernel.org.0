Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68FB61A2765
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 18:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgDHQmg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 12:42:36 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51011 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729029AbgDHQmf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 12:42:35 -0400
Received: by mail-wm1-f68.google.com with SMTP id x25so139519wmc.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 09:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8AJiiMBDjB0IxB2FyEVG9I0E0SIyliCvOOXROSWPU9o=;
        b=AJ69LVkCR18iHG4bBm44mLBosfvOcGEd4DsTHNVoO9dYa3xUh/ejwStxbOnkhzMhEA
         8hWAMAicl8SsYRt9CSxffLESia9SwKl0UdsJtq3sMuJjpq7PLKCx4KbRjO+Yx/ld9bGF
         JXfN1/hhDxP7YosEVMZjKX6zfaUKGtcXiRcx1ynmmrgYSjbDcPvYTJfsB19+QocqjDrf
         +DVVe8OPNUYzm+NIbH/G1qeaXFZtLCDkLAuE/0HaP+IKzh9K51zKJvhO/4GZM+ncU7n1
         eQ0W+cs1XI4+wjZ5ew7Z1EMlWJ6sZC9BbNCLdDd4jj8rOXl3+eO7fgeoWmm6Lm/0T85W
         KqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8AJiiMBDjB0IxB2FyEVG9I0E0SIyliCvOOXROSWPU9o=;
        b=W6SxylQ3ay+m0h/VDwGNGo55xTV7/c6Cc20IOtbPdJbHto7nsu1Wq96iikFEgHMe+x
         41X056IoJ956E4ph93KcSXIINKIeafC0fI3xGT/WC2PrVStwwmxTAQKHk+mi0Y+7+vKQ
         WJ9XKsydQ1PISEm2ZSH/HIc6+nCccvcvRNbOZ2kUsql4hFdneVR7RlXeCegsHO07750q
         VwJgJ7WVGMUL7GJPI/EUzwL38Oao2WBFvQJjj7VngmFvVffZim/r3k9NUFMkdhsUxxUp
         sgJeC6fZ45TRnfiHnoHOsTAwuGKwWUEAifSRTfESb4TD3BNfPyVU4u0LuBXveVUihrZo
         X/Xg==
X-Gm-Message-State: AGi0PuZIPZOKTx+XQqRUF+9sRogDSIFRu9LVwaTuSIfDL+/7qafMvwUL
        Ex3XDlhefnvIJLpYKihiq0YwOXlzj1U=
X-Google-Smtp-Source: APiQypIIa3XAbj332dzN+4FWyGYmdCbEWWhlKt4Wsd3FeSWSKfFiN537cuuvNG9aW/JVFWxiYmO7ng==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr5407723wmk.74.1586364153557;
        Wed, 08 Apr 2020 09:42:33 -0700 (PDT)
Received: from [172.30.89.104] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w18sm13808053wrn.55.2020.04.08.09.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 09:42:33 -0700 (PDT)
Subject: Re: [PATCH 4/4] media: imx.rst: Provide streaming examples for
 imx6q-sabresd
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     p.zabel@pengutronix.de, linux-media@vger.kernel.org
References: <20200408123215.2531-1-festevam@gmail.com>
 <20200408123215.2531-4-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <fa7db6c5-5f76-7621-412f-97f67f48e303@gmail.com>
Date:   Wed, 8 Apr 2020 09:42:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200408123215.2531-4-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/8/20 5:32 AM, Fabio Estevam wrote:
> Improve the documentation by providing examples on how to test camera
> capture on imx6q-sabresd via v4l2-ctl and Gstreamer.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>   Documentation/media/v4l-drivers/imx.rst | 42 +++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 37b944f12d93..c872cc84d9fc 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -670,6 +670,28 @@ Streaming can then begin on "ipu1_ic_prpenc capture" node. The v4l2-ctl
>   tool can be used to select any supported YUV or RGB pixelformat on the
>   capture device node.
>   
> +In order to determine what is the /dev/video node correspondent to
> +"ipu1_ic_prpenc":
> +
> +.. code-block:: none
> +
> +   # dmesg | grep ipu1_ic_prpenc | grep Registered

A better way is to use "media-ctl -e":

# media-ctl -e "ipu1_ic_prpenc capture"
/dev/video1

Grepping from dmesg can fail when the log fills up and pushes out the 
boot "Registered ..." messages.

Steve

> +   ipu1_ic_prpenc: Registered ipu1_ic_prpenc capture as /dev/video1
> +
> +/dev/video1 is the streaming element in this case.
> +
> +Starting the streaming via v4l2-ctl:
> +
> +.. code-block:: none
> +
> +   v4l2-ctl --stream-mmap -d /dev/video1
> +
> +Starting the streaming via Gstreamer and sending the content to the display:
> +
> +.. code-block:: none
> +
> +   gst-launch-1.0 v4l2src device=/dev/video1 ! kmssink
> +
>   The following example configures unprocessed video capture pipeline to
>   capture from the OV5640, transmitting on MIPI CSI-2 virtual channel 0:
>   
> @@ -690,6 +712,26 @@ Streaming can then begin on "ipu1_csi0 capture" node. The v4l2-ctl
>   tool can be used to select any supported YUV or RGB pixelformat on the
>   capture device node.
>   
> +In order to determine what is the /dev/video node correspondent to "ipu1_csi0":
> +
> +.. code-block:: none
> +
> +   # dmesg | grep ipu1_csi0 | grep Registered
> +   ipu1_csi0: Registered ipu1_csi0 capture as /dev/video0
> +
> +/dev/video0 is the streaming element in this case.
> +
> +Starting the streaming via v4l2-ctl:
> +
> +.. code-block:: none
> +
> +   v4l2-ctl --stream-mmap -d /dev/video0
> +
> +Starting the streaming via Gstreamer and sending the content to the display:
> +
> +.. code-block:: none
> +
> +   gst-launch-1.0 v4l2src device=/dev/video0 ! kmssink
>   
>   Known Issues
>   ------------

