Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECCF2CEFEF
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 02:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729665AbfJHAhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 20:37:24 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:52006 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbfJHAhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 20:37:23 -0400
Received: by mail-wm1-f49.google.com with SMTP id 7so1244942wme.1
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 17:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dx87ed1RomZdCcS350YuV6WSjH5fWAaGvIGW5OQtE0c=;
        b=YduvkKTkTgcaQJMIbbgoIZXs+OHLaL0/eeQH55TMEQ4C7/rkixNxWboAi8n0HrRoxJ
         p3Snq+Jij47D3gJoeDMcMCUiaUiNrZl8ZC+HxbLk1FKY0TaByfBnA1kkbgpTQoERYFxe
         ZQY/T1t8w++RUbBF/pgDACsJL0RBug0TL61Oykud6ShCy+KR0Ce6bm0apO0+/vSJOqWp
         X8gDd9PX/7njw7z5EsZ+Tg1wQCjYEG/O92ruWxoS113EWE9U6qdrHuV20BlBKhlAH/Hh
         /ixn4i6saNeof9DOT3sMlncwJc34xTAwy2vcVft/2CKTVSQaTbbkczWjnFpushEHzWce
         v4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dx87ed1RomZdCcS350YuV6WSjH5fWAaGvIGW5OQtE0c=;
        b=QwT8FDtHH+anmtArroAcQ4U5Df65QzLiL4w6FjsaoY/c7T6nZpZ8JyIpkuk+mXQahL
         CTHb7bkO5iVqjpzFF/bRaFCi2JwvoDhuWDmGkP7w+iM1gYtV9wJxb2oroM0xU3ah+AGE
         ki2ZM3+Do09MqPWRT0TbFHBUPYeA7aOLmzDzryUCI51BVbacQQ6PmI15o5t4OyIy9HYx
         YeY3K76HncHmGbWAPZ7YK0tJG7hi3ReKlFR+JnU6/wR/jEpWArp4DEOmIMH8IZNicIIU
         C9wrX1icDxNJZajtOOGAu0t60H0o62xvhU9RuJ3JGXurzptyWLyDfNj0zuSM7P/VvE4h
         A9fA==
X-Gm-Message-State: APjAAAWoQ5zsnUXYpgj6lgh4Ielfaxur8nHatCe7WkzTgQSdIFI28fki
        aDB5n0QSiuZcY6+JiwZGDT966ZPr
X-Google-Smtp-Source: APXvYqx2cMVqEaApOCyf3WJSyOc3IZRPf5CWt+ivXBToxS4qlndXxKOBElz1SyxZ6VGU34wUfzHhcQ==
X-Received: by 2002:a1c:7902:: with SMTP id l2mr1435082wme.55.1570495041044;
        Mon, 07 Oct 2019 17:37:21 -0700 (PDT)
Received: from [172.30.88.146] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id n22sm1025910wmk.19.2019.10.07.17.37.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 17:37:20 -0700 (PDT)
Subject: Re: ADV7180 Capture with i.MX53
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com>
Date:   Mon, 7 Oct 2019 17:37:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On 10/7/19 5:15 PM, Fabio Estevam wrote:
> Hi Steve,
>
> Are you still able to capture from the camera on the imx53-smd board
> with kernel 5.3.x?

I haven't tried the SMD board in a while, it's possible something broke, 
but see below...

>
> I have a custom board with a ADV7180 and it gets detected like this:
>
> [    2.970246] ipu1_csi0: Registered ipu1_csi0 capture as /dev/video0
> [    2.979741] ipu1_ic_prpenc: Registered ipu1_ic_prpenc capture as /dev/video1
> [    2.988930] ipu1_ic_prpvf: Registered ipu1_ic_prpvf capture as /dev/video2
> [    2.996264] imx-media: ipu1_csi0:1 -> ipu1_ic_prp:0
> [    3.001685] mmc0: host does not support reading read-only switch,
> assuming write-enable
> [    3.009925] imx-media: ipu1_csi0:1 -> ipu1_vdic:0
> [    3.014659] imx-media: ipu1_vdic:2 -> ipu1_ic_prp:0
> [    3.019929] imx-media: ipu1_ic_prp:1 -> ipu1_ic_prpenc:0
> [    3.025305] imx-media: ipu1_ic_prp:2 -> ipu1_ic_prpvf:0
> [    3.032039] mmc0: new high speed SDHC card at address aaaa
> [    3.038252] imx-media: subdev ipu1_csi0 bound
> ...
> [   24.974982] adv7180 1-0021: chip found @ 0x21 (63fc4000.i2c)
> [   25.324516] imx-media: adv7180 1-0021:0 -> ipu1_csi0:0
>
> Then I setup the pipelines:
>
> # media-ctl -l "'adv7180 1-0021':0 -> 'ipu1_csi0':[1]"
> # media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
> # media-ctl -V "'adv7180 1-0021':0 [fmt:UYVY2X8/720x480 field:seq-bt]"

The adv7180 driver in 5.3.x doesn't support seq-bt, only alternate. So 
pad format should be "[fmt:UYVY2X8/720x240 field:alternate]".

> # media-ctl -V "'ipu1_csi0':2 [fmt:AYUV32/720x480]"
>
> # gst-launch-1.0 v4l2src ! fakesink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> [  929.317827] ipu1_csi0: pipeline start failed with -32

This probably means there was a pad format mismatch. Try enabling 
dynamic debug.


Steve

> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> to allocate required memory.
> Additional debug info:
> ../../../gst-plugins-good-1.14.4/sys/v4l2/gstv4l2src.c(658):
> gst_v4l2src_decide_allocation ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Buffer pool activation failed
> Execution ended after 0:00:00.035375819
> Setting pipeline to PAUSED ...
> Setting pipeline to READY ...
> Setting pipeline to NULL ...
> Freeing pipeline ...
>
> My device tree changes to add the ADV7180 are listed here:
> http://code.bulix.org/ez8yax-901750
>
> Am I calling the correct media-ctl commands?
>
> Any ideas, please?
>
> Thanks,
>
> Fabio Estevam

