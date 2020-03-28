Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 078F6196392
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2020 05:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgC1Epl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 00:45:41 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:37154 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgC1Epl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 00:45:41 -0400
Received: by mail-lf1-f41.google.com with SMTP id j11so9604354lfg.4
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2020 21:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x3Bq/XMK/2OUVPvikOtaKLIwrrhJQiWfY19OwsUb6EM=;
        b=WBdhiElfLNa7UaM6LtgZEEyWpvqNYKAevXACZijdM/d+pLe/iI7cSki0Z1ZqKqGEYH
         qVEE4ngIAkBLCqQjEcaqWO2FQefoOWPGJSzNe1pxzII6yRUv3pWk2NdIznzs2nqWw0Or
         GTdqLUTwvgsG+zgBotgI7TjAYdIQi6MDRFnTkcnFn1ev4D6+KjvMBRX+ebu4idAAoAjs
         rbWR/VpmT2xyHOL/Vo8tZO/kvaRHo4acKbdBnCmgcVWpZUaNBbSBw9+w/457IrCexBnt
         LP1sBwxTzfMUA0go0i8rhjoa+NkxShQPc7gtn9YG11y3EB/sD1vao4cRe1Vwfbazv3UX
         kpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x3Bq/XMK/2OUVPvikOtaKLIwrrhJQiWfY19OwsUb6EM=;
        b=WsuIJwilGDmvf38TGMXPoXt6vWEkhwuN87fTTHEPtVFTv3bjm8/4k8P8b2+NNWawYz
         B0MNF9PiSuVigzR2MAXnc+xEVXjfPYUfcOwtErEmoHmpyqU20U4YLApygvMTxhEjUqyJ
         bCo2XeCWIDum24ZidNH6UPP50671b8RGAUX2sqZlC8HGgJosobSjEvdOYpcH9XNyKzXT
         VaqKhGDgqlaB/iYxf74csUT0WmDjqFJntSv2IXYWHLS3q8l7CEEg/m3EeeYnvXeVCtsJ
         y4lYN2xD4udxpXVczUiuaM3lZxPpgAaibzQX+SmK5iYthqVrxHIJX6S3yrHJ48UI0phb
         o3Hg==
X-Gm-Message-State: AGi0PuZF2iUUMN5BJ8kHmXTQGhToAWAf+0dM+2Hiuiv+Q9lLgw/Wwh7w
        1Fqk+1QYni0t4xJhPRH/LcszguKOk3c=
X-Google-Smtp-Source: APiQypL80EDpD3XTPR7uCYy04EqJUhWjrBT86mhW4eOd2utzrEuN4sGXqcwVLq+ybOKyz7w4oRvCBg==
X-Received: by 2002:a19:715:: with SMTP id 21mr1694197lfh.82.1585370738792;
        Fri, 27 Mar 2020 21:45:38 -0700 (PDT)
Received: from personal.lan ([89.20.14.21])
        by smtp.googlemail.com with ESMTPSA id j19sm3962447lfg.49.2020.03.27.21.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 21:45:38 -0700 (PDT)
Subject: Re: IMX219 MIPI Sensor (meda-tree) with vaniila I.MX6Q media drivers
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <pza@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <30c5947f-a026-66a9-75f2-d2531cc73a1e@gmail.com>
 <CAOMZO5B3NXBEmQdUqKDSTYpf=Y5LLZYz7mJLqRMh8T3+O6WvqA@mail.gmail.com>
 <20200327074523.GA3412@pengutronix.de>
 <a565cb1a-0c08-cd58-5e83-683b60055e90@gmail.com>
 <17308e3e-3dd8-7c75-f890-398ffca730b9@gmail.com>
From:   =?UTF-8?B?0JzQuNGF0LDQudC70L7QsiDQkNC70LXQutGB0LXQuSDQkNC90LDRgtC+0Ls=?=
         =?UTF-8?B?0YzQtdCy0LjRhw==?= <minimumlaw@gmail.com>
Message-ID: <2e68648f-97e4-f255-2fa9-8286c7970acc@gmail.com>
Date:   Sat, 28 Mar 2020 07:45:37 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <17308e3e-3dd8-7c75-f890-398ffca730b9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good day Steve,

I apologize. Due to the incestive reasons, we were quarantined. Alas, 
all work is postponed for at least a week.

>> [...]
>> - entity 47: ipu1_csi1 (3 pads, 4 links)
>>              type V4L2 subdev subtype Unknown flags 0
>>              device node name /dev/v4l-subdev5
>>         pad0: Sink
>>                 [fmt:SRGGB10_1X10/1920x1080@1/30 field:none 
>> colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range
>>                  crop.bounds:(0,0)/1920x1080
>>                  crop:(0,0)/640x480
>>                  compose.bounds:(0,0)/640x480
>>                  compose:(0,0)/640x480]
>>                 <- "imx6-mipi-csi2":2 [ENABLED]
> 
> This is virtual channel 1 output from the imx6-mipi-csi2 receiver. Make 
> sure the imx219 is indeed transmitting on virtual channel 1.

Khm... I belive my schematechnics. Electrical connection present. 
Osciloscope show clock and data if I write stream enable command via I2C 
to IMX219. Does it make sense to do additional checks? What kind?

>> - entity 51: ipu1_csi1 capture (1 pad, 1 link)
>>              type Node subtype V4L flags 0
>>              device node name /dev/video3
>>         pad0: Sink
>>                 <- "ipu1_csi1":2 [ENABLED]
> 
> What is the format on /dev/video3 ? Please provide output from 'v4l2-ctl 
> -d3 -V'

Alas, this requires physical access to the board.


>> I think fakesink must got Bayer format 
>> (as specific /dev/null for v4l2).
> Can you try simply:
> localhost ~ # v4l2-ctl -d3 --stream-mmap
> and let me know if you receive frames.

Thanks. So far, I have not had to deal with the Linux media subsystem. I 
only understand the design and hierarchy of drivers. Obviously, it is 
far from always successful.
