Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCB1D856A
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 03:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbfJPBSG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 21:18:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34052 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbfJPBSF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 21:18:05 -0400
Received: by mail-pg1-f195.google.com with SMTP id k20so5869539pgi.1
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 18:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jLcidCfju51JhO5FySvHlcdUkhMx/Z4CB70cevcRjDo=;
        b=Ckf2UtXQ8PzQzbJds0h38XDMLSFSdjz9chr7Y6iRUxjuN8Qiw3uZ3SFZEsFr5fMLIU
         bronDd/8dNeq2YL0Ajp7SxF3j5Xxrntb2ZTxLQEhGPOogtTd7eWiD95TkDL0nLKEZ1U9
         NYLimXug9mKPpDNlei0iXjBpkByiD0wCML4l/EhZYx/B5htBzTNiv4j9c0idhnBjAZ9H
         VNhebLM4nS0XgP30MCMzJpkVAFTGVVmR+7m/B9qg0JviS+bIX0a50Qt395sO8xtACuYA
         AdUoUx29AbbcBPwdUh3Fg/CrBaIyVumGuvWAnSGuhVet7+ZHuVr47jFfaHqjBpGVhnlr
         b/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jLcidCfju51JhO5FySvHlcdUkhMx/Z4CB70cevcRjDo=;
        b=tTWad+l6aUyuB0rH20B4QUoPGLeEi+oY1A2BSu3fkwAZHF8l7uQGqfrdHHpU6kLHNX
         qFH6DMG9CJq5Psj5JQW1rrpYs/782sIcUUUqUipSEh3dszSEo2CSMeH2RSEigxj5xTo9
         dJUR/pJvIE+N+EM+c/O9BXrrd6k0D77l1fNW5pHkjn3pVYM1p/U8xxmVhCGnGcaRy0/i
         oYuJHtefWExvzDztZ0sxSdSxM7LwKpYplTKfeqC+LanmM6IenaHaUXONA7/9zyNP6J7o
         V1quADOmXMqVWHfVE1rvU2pTuo6UsETKbGSAIDXhg/fIbPw8AfcP4ZJ1BEda/JW25+bJ
         dVgQ==
X-Gm-Message-State: APjAAAXuUQHPTfgRP1EhFx4VXj0+NspoAt9PnWTAwRRcM092hp8V5/pX
        /5L724onJQjS3zos8l597rC6LAsr
X-Google-Smtp-Source: APXvYqw6csEWcGW5Ocv+plUxa/NM1giWbZ+9l6KDhASo2x3/IPBb8fqsyXgDFDmM4HZ4jMV1oAoG1Q==
X-Received: by 2002:a17:90a:b946:: with SMTP id f6mr1613190pjw.81.1571188684569;
        Tue, 15 Oct 2019 18:18:04 -0700 (PDT)
Received: from [172.30.89.60] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id q33sm22326093pgm.50.2019.10.15.18.18.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 18:18:04 -0700 (PDT)
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180
 instructions
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
References: <20191010154417.9437-1-festevam@gmail.com>
 <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com>
 <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
 <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
 <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com>
 <CAJ+vNU22JmDQ+tyRFSQgM_wp-pgfE7gOt2i3QbdOJp0KuDXfRQ@mail.gmail.com>
 <CAOMZO5Dcv9fz=A8nTsvVsvu7+LNag2Sj03tJyFQKgpt_1B6Dwg@mail.gmail.com>
 <CAJ+vNU1+oS1wFav4W2g0f6XGCP3oqEwzxyvrN3fkggNSBau0Tg@mail.gmail.com>
 <CAOMZO5AMbAHmoYFLQbZbzBjMkmTsPkPctU-OqArPk3_PvtznjA@mail.gmail.com>
 <2acc57d6-da43-866b-fc01-e5e59af413ac@gmail.com>
 <CAOMZO5B5+_3FxUfgzMJzDH-myfXEQgxT8vfa-0L8cYFK8uhsuQ@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <e41aa4d6-b84f-33ab-0738-e4f14d582172@gmail.com>
Date:   Tue, 15 Oct 2019 18:17:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5B5+_3FxUfgzMJzDH-myfXEQgxT8vfa-0L8cYFK8uhsuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/15/19 12:11 PM, Fabio Estevam wrote:
> Hi Steve,
>
> On Tue, Oct 15, 2019 at 3:19 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
>> I submitted the ICAP driver patch quite a while ago, it was ~2 yrs ago I
>> think. Can't seem to find the link unfortunately.
>>
>> I'll work on updating the driver and retesting, and try resubmitting again.
>>
>> Most of the hooks are present in imx-media-fim.c to use the hardware
>> input capture to measure frame intervals. The only missing piece is the
>> ICAP driver itself.
>>
>> The FIM is explained in the imx.rst doc. It is configured and enabled
>> via v4l2 controls. It will report a v4l2_event to userspace during
> Thanks for the explanation.
>
> I read through imx.rst, but it was not clear for me how to actually
> configure/enable it via v4l2 controls.
>
> Could you please provide an example on how I can configure/enable FIM?
>
> Also, would you have an example on how to achieve the following
> behavior explained at imx.rst?
>
> "If the FIM detects a bad frame interval, the ipuX_csiY subdev will
> send the event
> V4L2_EVENT_IMX_FRAME_INTERVAL_ERROR. Userland can register with
> the FIM event notification on the ipuX_csiY subdev device node.
> Userland can issue a streaming restart when this event is received
> to correct the rolling/split image."

Here's a quick example that uses the end-of-frame method to measure fi's 
(all other FIM controls are left at the default values):

v4l2-ctl -d0 --set-ctrl=fim_enable=1
# disable input capture method
v4l2-ctl -d0 --set-ctrl=fim_input_capture_edge=0
v4l2-ctl -d0 --stream-mmap

This example will enable the FIM in Input Capture mode (when it is 
actually supported), with no skipped frames at stream on, an interval 
error tolerance of 20 usec, and no averaging:

v4l2-ctl -d0 --set-ctrl=fim_enable=1
# enable input capture method, on rising edges
v4l2-ctl -d0 --set-ctrl=fim_input_capture_edge=1
v4l2-ctl -d0 --set-ctrl=fim_input_capture_channel=0
v4l2-ctl -d0 --set-ctrl=fim_tolerance_min=20
v4l2-ctl -d0 --set-ctrl=fim_num_skip=0
v4l2-ctl -d0 --set-ctrl=fim_num_average=1
v4l2-ctl -d0 --stream-mmap

While streaming, bad frame interval events can be polled with:

v4l2-ctl -d0 --wait-for-event=0x08000001

I plan to post an update to the imx.rst doc with these FIM usage examples.

I updated the i.MX GPT input capture driver patch and re-tested on my 
modified SabreAuto (CSI0_VSYNC signal routed to SD1_DAT0 pad), and 
re-posted, you are cc'ed. Hopefully this will actually get looked at 
this time.

Steve

