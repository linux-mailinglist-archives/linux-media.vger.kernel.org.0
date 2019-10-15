Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9E4CD7ED0
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 20:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731361AbfJOSWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 14:22:17 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54480 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388942AbfJOSWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 14:22:16 -0400
Received: by mail-wm1-f68.google.com with SMTP id p7so105611wmp.4
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 11:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mFzwuQ0XGTD5S6NfzuoU8TOwb7Batyd87sTnHseO02I=;
        b=sTYEo3+JmAXVpo+QmIkos8bLGDjdawQtnD/1i4wNfMMhxzaUVX7G4/loq0fgZYOGps
         6ybaQ/2zchcsvv5NA6Hfb3qL91hEUgYEimtwsmTCPoh+XQyKS7eTQDx/WJ2XAWm6vWMr
         j4SeTtTw7j/fDlUb1MJ7WgH14XMCHn0XACxyix11TD4j4aDveTvmYaBdbbkV6N4pdCpN
         FsTZtVHQc/BdQREGSKyofvzvH4kkF1SbAWP5ZI30FDQfqcwI312aCXTlvRFMIdkNMfeY
         9ECINUuBThTKhxnIVK5ERfMxKfre8ScjAixaK2Y0SdNj3pkcOLIS5ShHw6SY8GId+PGs
         lkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=mFzwuQ0XGTD5S6NfzuoU8TOwb7Batyd87sTnHseO02I=;
        b=Q9xi9+ZjhgsDgpeOSoRSkioHHarQGBf89ATvKRsG5WHEY5KWcEaJ9oBsB36lpT6KRX
         Hm24MoVa/SJWtNEuXOC+pKeezBdbiUhC0xAcs8BHk2189Yc7aDAkliM6z1sg9AuCp46M
         WNqNtApa4UbMfst3epOjDgU4gYK+cETzN9LMU+PvcwVcnobWugMjOXRyVYsb8ZmXT9j1
         aADRU6ez4i2WbXX4ZdQSIzhxHlGeajMsEC14sAR7/1KIJSDbwxfpWOMfkPJoWaIPD7SH
         sPUc+LMB94kH+U9wsSTfy+tjIXQ+Wlg9xessxxUglyKQwshfYbWxZdE8Zng7gugRz0SK
         GPsA==
X-Gm-Message-State: APjAAAU7XQXSlPJFtnAgRlkbfgKKbaCXBHuKYT1QsfbImteCi6PU7zPq
        4jYR/QDrC3TK/CQw4KpT2XkCVCtO
X-Google-Smtp-Source: APXvYqyJMp3I339JVS0y1FfTymagUV2Fi7LE8TsE1VQWdoK0zYyVOeePVA94U/qLaSlaIpcw0sjmCA==
X-Received: by 2002:a1c:5587:: with SMTP id j129mr3149801wmb.15.1571163734101;
        Tue, 15 Oct 2019 11:22:14 -0700 (PDT)
Received: from [172.30.89.60] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id q19sm45789973wra.89.2019.10.15.11.22.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 11:22:13 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] media: imx.rst: Provide instructions for the
 i.MX6DL sabreauto
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, tharvey@gateworks.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org
References: <20191015160042.28113-1-festevam@gmail.com>
 <20191015160042.28113-3-festevam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <6c449b41-4739-3e00-44f6-8e1f1cdb5e2e@gmail.com>
Date:   Tue, 15 Oct 2019 11:22:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191015160042.28113-3-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/15/19 9:00 AM, Fabio Estevam wrote:
> The i.MX6DL sabreauto has different numbering on the I2C bus and
> I2C muxes compared to the i.MX6Q as shown in the kernel log below:
>
> [    5.159423] imx-media: ipu1_csi0_mux:5 -> ipu1_csi0:0
> [    5.164618] imx-media: ipu1_csi1_mux:5 -> ipu1_csi1:0
> [    5.169953] imx-media: adv7180 4-0021:0 -> ipu1_csi0_mux:4
>
> To avoid confusion, add an entry that shows how to setup the links and
> configure the pads that are specific to the i.MX6DL sabrea
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Steve Longerbeam<slongerbeam@gmail.com>

> ---
> Changes since v2:
> - Fix I2C and CSI mux numbering (Steve)
> - Passed the v4l2-ctl configuration (Steve)
>
>   Documentation/media/v4l-drivers/imx.rst | 58 +++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
>
> diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
> index 36e8d1226ac6..aab68d8ef2c9 100644
> --- a/Documentation/media/v4l-drivers/imx.rst
> +++ b/Documentation/media/v4l-drivers/imx.rst
> @@ -572,6 +572,64 @@ supported YUV or RGB pixelformat on the capture device node.
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
> +   # Configure "ipu1_csi0 capture" interface (assumed at /dev/video0)
> +   v4l2-ctl -d0 --set-fmt-video=field=interlaced_bt
> +
> +Streaming can then begin on /dev/video0. The v4l2-ctl tool can also be
> +used to select any supported YUV pixelformat on /dev/video0.
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
> +   media-ctl -V "'adv7180 4-0021':0 [fmt:UYVY2X8/720x576 field:seq-tb]"
> +   media-ctl -V "'ipu1_csi0_mux':5 [fmt:UYVY2X8/720x576]"
> +   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
> +   media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
> +   media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
> +   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
> +   # Configure "ipu1_ic_prpvf capture" interface (assumed at /dev/video2)
> +   v4l2-ctl -d2 --set-fmt-video=field=none
> +
> +Streaming can then begin on /dev/video2. The v4l2-ctl tool can also be
> +used to select any supported YUV pixelformat on /dev/video2.
> +
> +This platform accepts Composite Video analog inputs to the ADV7180 on
> +Ain1 (connector J42).
> +
>   SabreSD with MIPI CSI-2 OV5640
>   ------------------------------
>   

