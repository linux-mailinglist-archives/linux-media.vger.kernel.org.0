Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82935D7EC1
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 20:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbfJOSTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 14:19:49 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33653 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfJOSTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 14:19:49 -0400
Received: by mail-wr1-f68.google.com with SMTP id b9so25064207wrs.0
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 11:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dgHs48+e2bNI5daUXhyZ4dG/lP9cMhRWRsatKAr0WOE=;
        b=p+94Vqha13MMQYZ7ewkwE5Lpftv8zJSDhajCEUxCXcfrEoifvUGztaLHKskj2wXkAu
         0jVMJlEbb0ayOjIIq+TlXcNPL4Smj0ZdfFbDASheH3MIc1eD2UJRqpAWCMJPtoFa25S4
         B7xBoqEtrRKuWiMhQ3PQOR0/tRsx9GP39SYpPuwyj3LMyOhsDt3+XJv1rPUXvWnYDJBR
         w5GD9e/Ezk8Tfka416XDTIr/RIGZ1v66HnF6KwJWcrOYEzGPXUBPZcPS5AErR2xqlJsI
         AceYipC4/Xlc2qT73kXeexRC3RQKk2hSIwYdc8sYaoJfwGuIky8qZu6pkcI8MVs6hA1d
         Lv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dgHs48+e2bNI5daUXhyZ4dG/lP9cMhRWRsatKAr0WOE=;
        b=Gb0zbL1urUAq+7dKaLDyY5784WaUQPXrkVFN4GNOFU+ejMgH5JB43B5UocVrkvDsmw
         smxJmXRo8MR8g4dcSXU7iO8iJwwUD8n2XfAhBUn8x1Wqrn3uy3YhWdj6kzFeWt6+ubOv
         GyHZwr0Y3ZkewOdHbxoOF6VpYPXd5XqqIWsHxWsVZ85bHJ6nvc9kOd8+Cqh9Sa4+IihY
         hV8FFght5QCaoLXkS5Umce+LzS9of50VH08J/UhcLUgqe+N2EwgyzRcx71BjnKnuDJAc
         w7YFWORII61O4ktPBrYAYT5JvEYSGUp4Z9aWOjjW1n/MDmFW52ZfjKVKyH5dJ/zX9cvp
         bYPA==
X-Gm-Message-State: APjAAAVZyJWecpRcX0RoIHufW3N9EJOVpRHr5sEGqKs+2T44+VXLWCPY
        XcPb5osP8E5yvJNhPPuLhYJou7Se
X-Google-Smtp-Source: APXvYqyQlJe9W3/6M7520tJvf1eGa4Ze7nWsppG1FqN6HzKfyERfllfdWcEZ/xpU+w7vzyf9nCctRw==
X-Received: by 2002:adf:fa47:: with SMTP id y7mr32161792wrr.93.1571163586506;
        Tue, 15 Oct 2019 11:19:46 -0700 (PDT)
Received: from [172.30.89.60] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id y3sm32311534wro.36.2019.10.15.11.19.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 11:19:45 -0700 (PDT)
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180
 instructions
To:     Fabio Estevam <festevam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <2acc57d6-da43-866b-fc01-e5e59af413ac@gmail.com>
Date:   Tue, 15 Oct 2019 11:19:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5AMbAHmoYFLQbZbzBjMkmTsPkPctU-OqArPk3_PvtznjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/15/19 9:42 AM, Fabio Estevam wrote:
> On Tue, Oct 15, 2019 at 1:33 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
>> Right, because this re-creates the initial issue. Upon any signal lock
>> you would need to throw away the first few frames. I wish I knew the
>> proper way to deal with this.
> I thought this was handled by drivers/staging/media/imx/imx-media-fim.c
>
> On imx6-sabreauto we do have the input capture pins configured in the
> pinctrl entries, but I don't see any driver handling it.
>
> Also, drivers/staging/media/imx/imx-media-fim.c driver has  a #ifdef
> CONFIG_IMX_GPT_ICAP to deal with the input capture case, but such
> config symbol does not exist in mainline.
>
> It seems we still need the input capture support to be able to
> measuring frame intervals.
>
> Maybe Steve can shed some light on this?

I submitted the ICAP driver patch quite a while ago, it was ~2 yrs ago I 
think. Can't seem to find the link unfortunately.

I'll work on updating the driver and retesting, and try resubmitting again.

Most of the hooks are present in imx-media-fim.c to use the hardware 
input capture to measure frame intervals. The only missing piece is the 
ICAP driver itself.

The FIM is explained in the imx.rst doc. It is configured and enabled 
via v4l2 controls. It will report a v4l2_event to userspace during 
streaming when a bad frame interval is detected. The rolling video / 
vsync problem caused by the initial corrupt frames from the adv718x 
produces bad frame intervals, thus the FIM event can be used to restart 
streaming, which will correct vsync (as long as the bad initial frames 
are skipped, which is the other piece of this problem that needs an 
acceptable solution).

The FIM can still be used now, without input capture support, but it is 
marking frame intervals using the monotonic time in the dma completion 
irq handler, which is not always accurate due to irq latency, depending 
on system load. So this method can sometimes report bad frame interval 
events that aren't real.

Steve

