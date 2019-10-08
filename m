Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77E4ACFF96
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 19:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfJHROw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 13:14:52 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:45406 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfJHROw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 13:14:52 -0400
Received: by mail-wr1-f54.google.com with SMTP id r5so20250936wrm.12
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 10:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=telUTRQAS2Wvyr6v/9BijprO5QvsvnHx5hYCOFWVrMQ=;
        b=PRk2oiCyYH/2/EkKws+Q7vQaWKfbUv3PtoFWYysOQmPMGYtEVWyZW4POLLd5qUYo1I
         5OD7VpEuGdm0Vm6V8xd0JeYi6Hb/QpEXWiuT+k7goRc+69nT8Dmvwfjbng27sdhdpqhA
         Ru2m0yf8gQuBW8deyCMOvsMVUghKG0QG5x1HmZqb+R51hHuMCbBuFDYfu3/S9f/u2mjb
         xoWITQphUMMnXYOA26Z2vFcwYNv7dQocFffTc4lmDtYjLPbRnD+qwWBl6tal0OuUMWjC
         wXSxiOy6o764W4NZ5wFH42NeEB2soIdkspN2zoFhPMLmWzsUxeqIpQRr+/1tDmH94Ec+
         PNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=telUTRQAS2Wvyr6v/9BijprO5QvsvnHx5hYCOFWVrMQ=;
        b=IDA53JeU6lv2RVcd76mBJyc1EOEt1yMtSwf8ih1+2XxPTb1sc1xKvw63BCWfZH5FMl
         w4tbXwYr2ZBjAG32vMLq/etWimFrEAabm3ZeIO7qy+/5b+t/SgTHlO9vOYV9p3huABsH
         A6vtu3YFrrrvVRkccLwpYDmDH63F7HauIeH4ow5EbnMTfrVajG5HO/OqDDqxHrbkCKnH
         xQnFq2RFgAwPCR25G+LIrPmqD8nYs78HrpMQQQlE2v3qpKLAlVfa+JWgz8n61S5CgM5Q
         JE9X10qtqPbnblrBf+N0S0Cu2N02PI/N8/ThQ3XOBcmSAa4tYyZLNP2q8RUsPA596/qA
         +u8g==
X-Gm-Message-State: APjAAAU5ZC+wYt4ZMZWWf5fhzbLg+10T3d5QB9YFj0nb7JFKsvLhfL1A
        vkbvF2mX0lLyxIh+iXxcP30=
X-Google-Smtp-Source: APXvYqw7Pp5EZw3DH7f5WtBI7pv3HhDusWB6iO3N8ZOmVKle87+EHn2lA44wfjsPr0BJ6K1JLTXI+Q==
X-Received: by 2002:adf:e292:: with SMTP id v18mr30162902wri.232.1570554888161;
        Tue, 08 Oct 2019 10:14:48 -0700 (PDT)
Received: from [172.30.88.213] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id o4sm39662606wre.91.2019.10.08.10.14.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 10:14:47 -0700 (PDT)
Subject: Re: ADV7180 Capture with i.MX53
To:     Tim Harvey <tharvey@gateworks.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com>
 <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
 <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com>
 <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
 <CAOMZO5DmD5V+nT9QhWKTNHe+UydmQP=PJgxZopj7cm9YjEx68A@mail.gmail.com>
 <CAJ+vNU0EFWA66cnB+1ze-=vMr=WBWuV_=m6+DF_xQ6gng3J-bQ@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <8bcd8085-c1a1-0b6c-8470-cf77e5047a7a@gmail.com>
Date:   Tue, 8 Oct 2019 10:14:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU0EFWA66cnB+1ze-=vMr=WBWuV_=m6+DF_xQ6gng3J-bQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/8/19 9:55 AM, Tim Harvey wrote:
> On Tue, Oct 8, 2019 at 4:21 AM Fabio Estevam <festevam@gmail.com> wrote:
>> On Mon, Oct 7, 2019 at 10:07 PM Fabio Estevam <festevam@gmail.com> wrote:
>>
>>> So now I need to see if I can get Gstreamer to accept a pipeline like:
>>>
>>> gst-lauch-1.0 v4l2src ! kmssink
>> Ok, so now I decided use the hardware video deinterlacer:
>>
>> media-ctl -l "'adv7180 1-0021':0 -> 'ipu1_csi0':0[1]"
>> media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
>> media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
>> media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
>> media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
>>
>> media-ctl -V "'adv7180 1-0021':0 [fmt:UYVY2X8/720x480 field:alternate]"
>> media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x480]"
>> media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x480 field:none]"
>> media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x480 field:none]"
>> media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x480field:none]"
>>
>> And then Gstreamer can be launched:
>>
>> # gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink --verbose
>> Setting pipeline to PAUSED ...
>> Pipeline is live and does not need PREROLL ...
>> /GstPipeline:pipeline0/GstKMSSink:kmssink0: display-width = 800
>> /GstPipeline:pipeline0/GstKMSSink:kmssink0: display-height = 480
>> Setting pipeline to PLAYING ...
>> New clock: GstSystemClock
>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
>> video/x-raw, format=(string)YUY2, width=(int)720, height=(int)480,
>> framerate=(fraction)25/1, colorimetry=(string)bt601,
>> interlace-mode=(string)progressive
>> /GstPipeline:pipeline0/GstKMSSink:kmssink0.GstPad:sink: caps =
>> video/x-raw, format=(string)YUY2, width=(int)720, height=(int)480,
>> framerate=(fraction)25/1, colorimetry=(string)bt601,
>> interlace-mode=(string)progressive
>>
> Fabio,
>
> Yes, you need to use the vdic to capture from adv7180 with gstreamer
> as it can't handle alternate.
>
>> However the video looks like a broken old TV scrolling the image horizontally:
>> https://www.dropbox.com/s/2yef8egn6s8z7ff/mx53_adv7180_capture.mp4?dl=0
>>
> This would be because of the initial corrupt frames that this and many
> other decoders produce while waiting for proper sync. I added
> 'g_skip_frames' support in 9483a3f8e1b58ba1d7cd21687d8d0a63a015c36b
> but I'm not sure how to get gstreamer to use it?
>
> I still carry around a patch from Steve for imx-csi that drops first
> few frames from BT656 sources:
> https://github.com/Gateworks/linux-imx6/commit/959fbd42ee6433f49ef4a04fb1abe8f8c78db5ad
> to deal with this.

Yes, that's likely the issue, from a look at Fabio's video. The patch 
referenced by Tim hard-codes the number of frames to skip, instead of 
calling the adv7180's g_skip_frames op. I still don't have an answer as 
to how to call the adv7180 from the CSI subdev.

Steve


