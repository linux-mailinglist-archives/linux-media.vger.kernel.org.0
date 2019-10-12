Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87AB7D5254
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2019 22:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbfJLUO0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Oct 2019 16:14:26 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32990 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728338AbfJLUO0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Oct 2019 16:14:26 -0400
Received: by mail-pl1-f193.google.com with SMTP id d22so6110193pls.0
        for <linux-media@vger.kernel.org>; Sat, 12 Oct 2019 13:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=bLxUcLUmIywB/2iIpWppK9HzZle8K+J909c/bjbR4GM=;
        b=iTeX0/oDfMANM+XN51W09si9xYdtGklE/axeY0WoGHhWT1yYrUyeKa6LV19GsnUdEr
         vgieqXnBVPreUcq6XDBZt1InVYx+Nh2tp27nJFMwbjshjXClIYne7XrdzOcPoe5yLHA8
         aLAx2AxOOmwdRPp6JcMqKTlwkzRa/KdXCGrM2zzlQHHFkTdrxe1lcf2Nv48Dow9LPK09
         LgUYcsseZ7ayJQpnaeGV+FY5EMTW+lGaVy0NfjbYyz/VdkpNdyfjpWt0YlRc59ijWAm4
         1cnbhXbJ26NRoryikxYcyq4dqKSy5EgdZ3XhT7jwp/cJKrGCmpQMpvoqjdpGtZ/H1bh5
         0k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bLxUcLUmIywB/2iIpWppK9HzZle8K+J909c/bjbR4GM=;
        b=TB4xY2CkI9gwY52mkvWgdFTXJm3f8kD7ggxIXrIRXAf4Q3QQRbMV1wmeh5luOyx0R6
         +wpM4S37vYMSD0hQrPKDdDP7T/Afckf8u+YFbvnwvpG9aDGG0NUiSfUnIrYNAXtN42W3
         h3hf5b6Wkw0KPaXBCevaVQcugkS1ngeI6jzMtsdNKYpuy0EVId5Mbh9FNQ+KQlszCTYM
         ahXXJ2Oz3gncBDa3Y/UkaeM++YKm1fUTwsxl9WB97uXcaLPG4lkV6mS7K6UXP8ZPdZhw
         XRumtNiSk0snZoyWi4T4NOGIJqhn3iSIg+mPi6iYHDmd1frI0N6Oi/31KdJxkaFj7nw6
         73GA==
X-Gm-Message-State: APjAAAXWM57ign64iRABvYFAy6U3zvrH/P5gHADqm4hxvt7wHIVaSjjs
        v0xxyTJfsEA8lsVchI0U9mo=
X-Google-Smtp-Source: APXvYqxQNvg30m93gkld90gygurv1G18SSeuZbJGzCSez8ZJN3aDtUsvEeEAtJkrzBgRnxTQWE2sHw==
X-Received: by 2002:a17:902:8c92:: with SMTP id t18mr20874175plo.76.1570911264990;
        Sat, 12 Oct 2019 13:14:24 -0700 (PDT)
Received: from [192.168.1.59] (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.gmail.com with ESMTPSA id w10sm10947266pjq.3.2019.10.12.13.14.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Oct 2019 13:14:24 -0700 (PDT)
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180
 instructions
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, tharvey@gateworks.com
References: <20191010154417.9437-1-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
Date:   Sat, 12 Oct 2019 13:14:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010154417.9437-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On 10/10/19 8:44 AM, Fabio Estevam wrote:
> In kernel 5.3.x the I2C bus that the adv7180 is under has changed from
> bus 3 to 4 and the ipu_csi0_mux numbers has also changed as shown by
> the kernel log below:
>
> [    5.159423] imx-media: ipu1_csi0_mux:5 -> ipu1_csi0:0
> [    5.164618] imx-media: ipu1_csi1_mux:5 -> ipu1_csi1:0
> [    5.169953] imx-media: adv7180 4-0021:0 -> ipu1_csi0_mux:4
>
> Update the instructions accordingly.

I just booted the imx6q SabreAuto with 5.4.0-rc1 (and media-tree HEAD 
3ff3a712a9ea), I am getting:

arm:~ % uname -r
5.4.0-rc1-13672-g3ff3a712a9ea
arm:~ % dmesg | grep 'ipu[12]_csi[01]_mux'
[   13.042519] imx-media: ipu1_csi0_mux:2 -> ipu1_csi0:0
[   13.042590] imx-media: ipu2_csi1_mux:2 -> ipu2_csi1:0
[   13.042656] imx-media: adv7180 3-0021:0 -> ipu1_csi0_mux:1
arm:~ % dmesg | grep adv7180
[   12.905157] adv7180 3-0021: chip found @ 0x21 (i2c-2-mux (chan_id 1))
[   13.042656] imx-media: adv7180 3-0021:0 -> ipu1_csi0_mux:1


So the adv7180 i2c-bus and pad numbers have not changed. The adv7180 is 
still on bus 3, and the output pad from the IPU-CSI video muxes are 
still pad 2. The video muxes have no such pad 5 in fact. I'd be curious 
in learning how you came about that pad number.

> Also, in the last line pass the fmt field explicitly as done in the
> previous lines.

Thanks for catching that, it was left over from a pipeline configuration 
script of mine.

Steve

>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>   Documentation/media/v4l-drivers/imx.rst | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 1d7eb8c7bd5c..75430cd2f222 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -530,12 +530,12 @@ NTSC, or 'alternate'):
>   .. code-block:: none
>   
>      # Setup links
> -   media-ctl -l "'adv7180 3-0021':0 -> 'ipu1_csi0_mux':1[1]"
> -   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
> +   media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
> +   media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]"
>      media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
>      # Configure pads
> -   media-ctl -V "'adv7180 3-0021':0 [fmt:UYVY2X8/720x480 field:seq-bt]"
> -   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/720x480]"
> +   media-ctl -V "'adv7180 4-0021':0 [fmt:UYVY2X8/720x480 field:seq-bt]"
> +   media-ctl -V "'ipu1_csi0_mux':5 [fmt:UYVY2X8/720x480]"
>      media-ctl -V "'ipu1_csi0':2 [fmt:AYUV32/720x480]"
>      # Configure "ipu1_csi0 capture" interface (assumed at /dev/video4)
>      v4l2-ctl -d4 --set-fmt-video=field=interlaced_bt
> @@ -553,19 +553,19 @@ at its output pad:
>   .. code-block:: none
>   
>      # Setup links
> -   media-ctl -l "'adv7180 3-0021':0 -> 'ipu1_csi0_mux':1[1]"
> -   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
> +   media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
> +   media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]"
>      media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
>      media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
>      media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
>      media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
>      # Configure pads
> -   media-ctl -V "'adv7180 3-0021':0 [fmt:UYVY2X8/720x576 field:seq-tb]"
> -   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/720x576]"
> +   media-ctl -V "'adv7180 4-0021':0 [fmt:UYVY2X8/720x576 field:seq-tb]"
> +   media-ctl -V "'ipu1_csi0_mux':5 [fmt:UYVY2X8/720x576]"
>      media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
>      media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
>      media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
> -   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:$outputfmt field:none]"
> +   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
>   
>   Streaming can then begin on the capture device node at
>   "ipu1_ic_prpvf capture". The v4l2-ctl tool can be used to select any

