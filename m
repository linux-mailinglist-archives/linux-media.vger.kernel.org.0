Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D6F1A389D
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 19:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgDIRJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 13:09:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43652 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgDIRJM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 13:09:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id i10so6456858wrv.10
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2020 10:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Y1bnNV7JKP6d5bV0xdeXAsm0Me21jioDr54ks0nQPSM=;
        b=BCG01LYmqpt3HvVUAdgaYseXqohF6HBf+Ge3j+QBMYChunPiTNJYvmte8PmUbniGra
         QCfg2wMKY8QsLO8zhRtiEstKtsdmteCKwuUy+VXTcniKSPbhv33pWZyPVXYyWabC4ZRs
         b9VYYFic3W+IwtSCRK6FdH35QXcv/U/9lOijDU6EqQIjl8JVqFJlFcSNwYIlgvCq6d5a
         Ay2NyyG9KneUx7WO2+t8mKx1fmCL03NxO1G1TWJUeZb4qVDk8tNDSLRlLM77V6xdpSZk
         oVPzEIlsrTqbDivdHsm3qNS73ZhHMXGNzD8v+Q4nTEi+x9dUb2q7Xj0DqlNIN5qubyHw
         i/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Y1bnNV7JKP6d5bV0xdeXAsm0Me21jioDr54ks0nQPSM=;
        b=fI2W2X1KMp71J1xiAzuQEFvjrw6JKAodFeBkbbNUpE2zDFHXJAWR4sxvvCyFfo04AB
         gRqDtxJoq8TBWOhfiGEMq0Ip6oKp52PU82NWAI0HkOSqAlJPr9ucdTeeLCLjJ/nE5/pk
         6EGAb+a4jFZB8I+YqmL0MxPafC+KaT/ZQoujyiTMBpdZ/k5K24pwrukfx8uN/l8O9uFO
         /t5ofPfNt5NuOqGkoylvTnhYl/TF4+Hvnpnq8tBw1Teco+PyhWnbjNa2YOohPCBtkVfG
         2Ozt6gBusJJovliCAjqCIMC88JkuiFOgB/KrA7OSTaGIo8qOZoX5x4Trpn3i392UscAF
         ydUQ==
X-Gm-Message-State: AGi0PuaaVC0Y79Z1H76ZPS05EG45UpAxqxpGTjeiKqH8+22T0bhfXOAm
        K3BRSDn3/YFGi4kel1YbYsN6EDXPn0g=
X-Google-Smtp-Source: APiQypKh7dQooRgqOBM3n0vuhlApoCAqwcnY6Wz7tWMnFLtsydV/4Bjk9ll0KLHw99o6wmfFHlpvrA==
X-Received: by 2002:a5d:4e8a:: with SMTP id e10mr149681wru.258.1586452150811;
        Thu, 09 Apr 2020 10:09:10 -0700 (PDT)
Received: from [172.30.90.226] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id m8sm4264231wmc.28.2020.04.09.10.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 10:09:10 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] media: imx.rst: Provide streaming examples for
 imx6q-sabresd
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     p.zabel@pengutronix.de, linux-media@vger.kernel.org
References: <20200409162945.3559-1-festevam@gmail.com>
 <20200409162945.3559-4-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <1092ab03-8813-7d2f-8c2f-f54de792b95a@gmail.com>
Date:   Thu, 9 Apr 2020 10:09:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200409162945.3559-4-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/9/20 9:29 AM, Fabio Estevam wrote:
> Improve the documentation by providing examples on how to test camera
> capture on imx6q-sabresd via v4l2-ctl and Gstreamer.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Steve Longerbeam<slongerbeam@gmail.com>

> ---
> Changes since v1:
> - Use media-ctl -e to determine the video node. (Steve)
>
>   Documentation/media/v4l-drivers/imx.rst | 45 +++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 955d27582e10..025f21def7dc 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -664,6 +664,28 @@ Streaming can then begin on "ipu1_csi0 capture" node. The v4l2-ctl
>   tool can be used to select any supported pixelformat on the capture
>   device node.
>   
> +To determine what is the /dev/video node correspondent to
> +"ipu1_csi0 capture":
> +
> +.. code-block:: none
> +
> +   media-ctl -e "ipu1_csi0 capture"
> +   /dev/video0
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
> +
>   The following example configures a direct conversion pipeline to capture
>   from the OV5640, transmitting on MIPI CSI-2 virtual channel 0. It also
>   shows colorspace conversion and scaling at IC output.
> @@ -689,6 +711,29 @@ shows colorspace conversion and scaling at IC output.
>   
>   Streaming can then begin on "ipu1_ic_prpenc capture" node.
>   
> +To determine what is the /dev/video node correspondent to
> +"ipu1_ic_prpenc capture":
> +
> +.. code-block:: none
> +
> +   media-ctl -e "ipu1_ic_prpenc capture"
> +   /dev/video1
> +
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
>   Known Issues
>   ------------
>   

