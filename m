Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6EBD684D
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 19:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388480AbfJNRUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 13:20:08 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36451 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731347AbfJNRUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 13:20:08 -0400
Received: by mail-wm1-f66.google.com with SMTP id m18so17538317wmc.1
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2019 10:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=SNvp6+uJ5iM8LlAFujTZw8UcsZkEhJWlIlTVLIOPnjc=;
        b=uJyOWX5BkxolbwT6AYMP4TJgW8ilXSog5hlugApL88JFltwDKGUfLgATfr92hMfmqO
         W2ehs4i8wvgJVGI+CL//nhpmYwdnMxz5ceOKiiR/TkvxTbhLk/UoIoOD/QRaWBM7E4O7
         Ja2fIF7HE/k7Q+3BU36EgCQU1Ay55W/RHjG5CKTgq5O6o9U61/mC7Th0KLmbKayPeFPZ
         ew98GxNR/K21AGm+W+U1SfW8wYSVjgCiGrI7STKrV/e2mQufrfNbg6maKYq+12N6+dWl
         ODasoybiJVsncNtONCiyY8nJgtHsVho5k7++HzqgSiiUwne7/pymOkED6GMzp/ExzsqG
         cU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=SNvp6+uJ5iM8LlAFujTZw8UcsZkEhJWlIlTVLIOPnjc=;
        b=tJ632Oh1tKxoyRBzwywy2YtZkg57EsQuBpPKnTU6aACqrWtqXFNub2pRiEgqPPYdiK
         cwxvR2phAQfxbwwhHw5xNXnED/ba80WdtL8J3Y5ukaNlr5d+fOYdQgXiQ/Y/Iq2cbf1P
         pPenInO3lHCauDaJzwny8N0Tz8Vv8USyQFR+FU/p7MgoymzbJWQ4botZmj3RSS1ZUH7B
         3+P42P9yWiVQtQlHaXeP8SS1hFl5cqjD8t0zSkgHOn09U7uagE42PbzgOgj+D6eEZgnp
         0HU1fgxa3l0Hb+EkK9WmIzGh/LykmFlUWO31YIxDyjPM+9XUlydyE8GXoXY11RDdnqlN
         sHcA==
X-Gm-Message-State: APjAAAXO+kOzyx0KizL9R8LXg0Y7a4bu/LKtbwne+f2BYYsqTV2LW/9v
        FHl9k3zqmdt441HOFaeHfq5nY8lZ
X-Google-Smtp-Source: APXvYqxawlzhvPVx5s7Sbs6vJ6F33FvxtOPpA9WfHm22ArmEQfKNzmSTdeXYRoXx8jbc96w3UgaB0A==
X-Received: by 2002:a1c:1901:: with SMTP id 1mr15815262wmz.28.1571073605972;
        Mon, 14 Oct 2019 10:20:05 -0700 (PDT)
Received: from [172.30.89.1] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id z9sm20118292wrp.26.2019.10.14.10.20.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 10:20:05 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] media: imx.rst: Provide instructions for the
 i.MX6DL sabreauto
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, p.zabel@pengutronix.de, tharvey@gateworks.com,
        linux-media@vger.kernel.org
References: <20191014135424.7000-1-festevam@gmail.com>
 <20191014135424.7000-3-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <dd72d8a5-3067-b640-12b6-052d3ecf57ca@gmail.com>
Date:   Mon, 14 Oct 2019 10:20:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014135424.7000-3-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On 10/14/19 6:54 AM, Fabio Estevam wrote:
> The i.MX6DL sabreauto has different numbering on the I2C bus and
> I2C muxes compared to the i.MX6Q as shown in the kernel log below:
>
> [    5.159423] imx-media: ipu1_csi0_mux:5 -> ipu1_csi0:0
> [    5.164618] imx-media: ipu1_csi1_mux:5 -> ipu1_csi1:0
> [    5.169953] imx-media: adv7180 4-0021:0 -> ipu1_csi0_mux:4
>
> To avoid confusion, add an entry that shows how to setup the links and
> configure the pads that are specific to the i.MX6DL sabreauto.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Add a new entry for the mx6dl sabreauto
>
>   Documentation/media/v4l-drivers/imx.rst | 57 +++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 36e8d1226ac6..6a9dad8b050b 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -572,6 +572,63 @@ supported YUV or RGB pixelformat on the capture device node.
>   This platform accepts Composite Video analog inputs to the ADV7180 on
>   Ain1 (connector J42).
>   
> +i.MX6DL SabreAuto with ADV7180 decoder
> +--------------------------------------
> +
> +On the i.MX6DL SabreAuto, an on-board ADV7180 SD decoder is connected to the
> +parallel bus input on the internal video mux to IPU1 CSI0.
> +
> +The following example configures a pipeline to capture from the ADV7180
> +video decoder, assuming NTSC 720x480 input signals, using simple
> +interweave (unconverted and without motion compensation). The adv7180
> +must output sequential or alternating fields (field type 'seq-bt' for
> +NTSC, or 'alternate'):
> +
> +.. code-block:: none
> +
> +   # Setup links
> +   media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
> +   media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]"
> +   media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
> +   # Configure pads
> +   media-ctl -V "'adv7180 4-0021':0 [fmt:UYVY2X8/720x480 field:seq-bt]"
> +   media-ctl -V "'ipu1_csi0_mux':5 [fmt:UYVY2X8/720x480]"
> +   media-ctl -V "'ipu1_csi0':2 [fmt:AYUV32/720x480]"
> +   # Configure "ipu1_csi0 capture" interface (assumed at /dev/video4)
> +   v4l2-ctl -d4 --set-fmt-video=field=interlaced_bt
> +
> +Streaming can then begin on /dev/video4. The v4l2-ctl tool can also be
> +used to select any supported YUV pixelformat on /dev/video4.
> +
> +This example configures a pipeline to capture from the ADV7180
> +video decoder, assuming PAL 720x576 input signals, with Motion
> +Compensated de-interlacing. The adv7180 must output sequential or
> +alternating fields (field type 'seq-tb' for PAL, or 'alternate').
> +
> +.. code-block:: none
> +
> +   # Setup links
> +   media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
> +   media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]"
> +   media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
> +   media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
> +   media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
> +   media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
> +   # Configure pads
> +   media-ctl -V "'adv7180 3-0021':0 [fmt:UYVY2X8/720x576 field:seq-tb]"

should be "'adv7180 4-0021:0".

> +   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/720x576]"

should be "'ipu1_csi0_mux':5".

> +   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
> +   media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
> +   media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
> +   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"

Please add (after above line):

# Configure "ipu1_ic_prpvf capture" interface (assumed at /dev/video1)
    v4l2-ctl -d1 --set-fmt-video=field=none

> +
> +Streaming can then begin on the capture device node at
> +"ipu1_ic_prpvf capture". The v4l2-ctl tool can be used to select any
> +supported YUV or RGB pixelformat on the capture device node.
> +

Please replace above paragraph with:

Streaming can then begin on /dev/video1. The v4l2-ctl tool can also be
used to select any supported YUV pixelformat on /dev/video1.

If you don't mind while you are on this, can you please add this 
v4l2-ctl step to the i.MX6Q PAL example, it is missing there as well.

Steve


> +This platform accepts Composite Video analog inputs to the ADV7180 on
> +Ain1 (connector J42).
> +
>   SabreSD with MIPI CSI-2 OV5640
>   ------------------------------
>   

