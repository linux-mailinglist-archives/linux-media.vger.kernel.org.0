Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E61CF1A274D
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 18:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbgDHQhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 12:37:19 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46011 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728562AbgDHQhT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 12:37:19 -0400
Received: by mail-pg1-f194.google.com with SMTP id 128so938646pge.12
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=v0cAUZ1+dLhgObyp2TZj7KvLAWiBssSrlNYxEnhFTL0=;
        b=H3535GLbskKeplKRXH2dMAQwqrqmEJdGxgOFPwljrWxfIY4qIQv5s/mWrKLp3K26nj
         kNPluDGXjq5LV9wmbjLCbI+78zaBgPCUJ/BuTAG1P9cOQ2NBPj/6x6im2GMzjhNFBtWZ
         wHmmTUyZfdtX3VonjP0zCIBU4Ymr8BaokbhGUFVc0GW8+DMf5KFS4kqmV+OALf7FI/4o
         kpp2zONCOPIr9vM/193aevZW7ZVAgLD4/00eBFjSOzV/cZmAt3LKtPqkrGrjNTxaipFy
         XmuJTuQTxTuppsxzKG7cNDeiPpALt1n9rpBPT1QgUIYIrIbdLIl/XGPXeKoJdcPVOrZn
         zd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=v0cAUZ1+dLhgObyp2TZj7KvLAWiBssSrlNYxEnhFTL0=;
        b=R9409j05P5pW7TkJk3GHn932JA1f1GR94zHPu8oQgHcv/5dfIn+187Gy2Z/NdEHMbm
         b2FEmS+bHvY7ROQgeotHqhOzHZojqslPN6JNh/EZ0LBaLi3zMX6jfSEDfYfO/XXrKKU+
         XEWBqfRCFn/7kpn/H1hBvNvlq3g6Z/t2HE8pzDQY+dqRsmqFCCdMsEUR8pIGSi88wsDV
         qCaa++ARRbz+Xg6U4eX6i/hJPFu5fuKwBCnVJx88XgFwY8pxXY3yphpGzhh3rBYST2Y0
         9e+VimzYvOno02c/V8AAi51jWZy6LNlAenZGurkLpG2Inm1rXpVx5RP9RudLvtZ481KD
         laFQ==
X-Gm-Message-State: AGi0PuYBLCx7AkhyrKU7lYWb54bo6+880Uj9nz6vGqHsQvhyM5v0Odgh
        DMTcsu91nNNeDKsR0AGIYFSOGnVC1rU=
X-Google-Smtp-Source: APiQypJrO8y6RgFQTeN5xQ8khEeMF2YEXHUwWj8/7Re4199ClALbI4uVPqeHpd3Fnpe7Wfu5/nZvxQ==
X-Received: by 2002:a63:50f:: with SMTP id 15mr7128748pgf.267.1586363836293;
        Wed, 08 Apr 2020 09:37:16 -0700 (PDT)
Received: from [172.30.89.104] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id i14sm15949752pgh.47.2020.04.08.09.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 09:37:15 -0700 (PDT)
Subject: Re: [PATCH 2/4] media: imx.rst: Provide an example for unprocessed
 video capture
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     p.zabel@pengutronix.de, linux-media@vger.kernel.org
References: <20200408123215.2531-1-festevam@gmail.com>
 <20200408123215.2531-2-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <f788d8ba-0bfc-af82-9252-f4187b982b0c@gmail.com>
Date:   Wed, 8 Apr 2020 09:37:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200408123215.2531-2-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/8/20 5:32 AM, Fabio Estevam wrote:
> The current example for imx6q-sabresd is for a direct conversion pipeline.
>
> Provide an extra example using unprocessed video capture for completeness.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>

> ---
>   Documentation/media/v4l-drivers/imx.rst | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 7c3afd32e456..3b4767f5f422 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -670,6 +670,26 @@ Streaming can then begin on "ipu1_ic_prpenc capture" node. The v4l2-ctl
>   tool can be used to select any supported YUV or RGB pixelformat on the
>   capture device node.
>   
> +The following example configures unprocessed video capture pipeline to
> +capture from the OV5640, transmitting on MIPI CSI-2 virtual channel 0:
> +
> +.. code-block:: none
> +
> +   # Setup links
> +   media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> +   media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
> +   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
> +   media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
> +   # Configure pads
> +   media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
> +   media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
> +   media-ctl -V "'ipu1_csi0_mux':0 [fmt:UYVY2X8/640x480]"
> +   media-ctl -V "'ipu1_csi0':0 [fmt:AYUV32/640x480]"
> +
> +Streaming can then begin on "ipu1_csi0 capture" node. The v4l2-ctl
> +tool can be used to select any supported YUV or RGB pixelformat on the
> +capture device node.
> +
>   
>   Known Issues
>   ------------

