Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAF73CFFF3
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 19:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfJHRdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 13:33:12 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:53106 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727409AbfJHRdM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 13:33:12 -0400
Received: by mail-wm1-f50.google.com with SMTP id r19so4072143wmh.2
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 10:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YQWQrN3LyGjpCwHlgAYJp4e4s+rb1H5+xh1CqKRKWDo=;
        b=PKmPjNad3bLTfEvLu5lvisyp5XLzDOlg13NnXGGMlglcpyNZXtt8CfXYEs1gUo7P9K
         iqUz1sGepqfptCEfRMOyNXNE7NKT8HZyFuzM4PshdK8UGeG0NMWlWXeSbd4fV5YxrJ4W
         Z1LzCrjuQ4NYaffqpDojiz/EoSeeqpt7/ezqIuhRog249t3g06fIel5MlQ5l0hLx0msn
         zlZ5htuVrEaOLqP7BdJJm4AE0v1y2hdEUZ9pStFjIwOOcd4ZIW9qYkBrEpAX6gJlaX1H
         Hz9E8DZ7zMsSTNrsWhmcXMpy8FbGkFrSD1e4DJQHaNEDX69KNgwOPi96LImkuicMCwdk
         i0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YQWQrN3LyGjpCwHlgAYJp4e4s+rb1H5+xh1CqKRKWDo=;
        b=b8e1xz5uxV7d4lo0fuSOw6A05C9UVzWVyFCNxFSxgmk9ooCt5af6T3roDhADNvjoig
         Zxzr+LaUM3O6ITLAN9UJRaULermSvJeZvRS6an0zOI86UuIOjUgTPar8Upyl29A+CWgz
         Sn5EgZeyf92KGkHWEEzWxqfC7rc3xSx8+lArqcp+kWJ3Nz+U4nlwWn/82Zknuo5nfE5f
         Jit8OOXGamuoNui8oMaiTkhex3YpuIhzIpWtZYZhtjc+0AkoxaH53imYAuX1bExChmaZ
         76xrGijOCT5tHw3htgOvJUOBjFu67CRKR9JF0+u/6KYVMLRo74bnWb72Qup5Fp+Tfrrn
         Dc0A==
X-Gm-Message-State: APjAAAXsNEX99Px9kafwCErzJoG+QkH3TFVxj+kDFaslvLJc46JVa+s4
        B3OKyjRisjKYGnaepTV6t3c=
X-Google-Smtp-Source: APXvYqypd8nEdp42St2AtV0SK9QOgNQHzx3HaGUy4QHGi74V+C2Si/uqMf17gjFmk8XSZqdU+ngfCQ==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr4434227wmj.119.1570555989398;
        Tue, 08 Oct 2019 10:33:09 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:1c64:3600:ef32:9810:b6a2:ebe? ([2a00:23c4:1c64:3600:ef32:9810:b6a2:ebe])
        by smtp.googlemail.com with ESMTPSA id z142sm5420386wmc.24.2019.10.08.10.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 10:33:08 -0700 (PDT)
Subject: Re: ADV7180 Capture with i.MX53
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
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
 <8bcd8085-c1a1-0b6c-8470-cf77e5047a7a@gmail.com>
 <bc7968aa-5719-bc70-09b4-b0cc79f06924@gmail.com>
 <cdae23ed-9cce-ef33-47d6-2ca86cd2aa0c@gmail.com>
From:   Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <3a47ab02-95e4-8920-2ed8-4d02295a2fe3@gmail.com>
Date:   Tue, 8 Oct 2019 18:33:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <cdae23ed-9cce-ef33-47d6-2ca86cd2aa0c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/10/2019 18:30, Steve Longerbeam wrote:
> 
> 
> On 10/8/19 10:20 AM, Ian Arkver wrote:
>> On 08/10/2019 18:14, Steve Longerbeam wrote:
>>>
>>>
>>> On 10/8/19 9:55 AM, Tim Harvey wrote:
>>>> On Tue, Oct 8, 2019 at 4:21 AM Fabio Estevam <festevam@gmail.com> 
>>>> wrote:
>>>>> On Mon, Oct 7, 2019 at 10:07 PM Fabio Estevam <festevam@gmail.com> 
>>>>> wrote:
>>>>>
>>>>>> So now I need to see if I can get Gstreamer to accept a pipeline 
>>>>>> like:
>>>>>>
>>>>>> gst-lauch-1.0 v4l2src ! kmssink
>>>>> Ok, so now I decided use the hardware video deinterlacer:
>>>>>
>>>>> media-ctl -l "'adv7180 1-0021':0 -> 'ipu1_csi0':0[1]"
>>>>> media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
>>>>> media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
>>>>> media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
>>>>> media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
>>>>>
>>>>> media-ctl -V "'adv7180 1-0021':0 [fmt:UYVY2X8/720x480 
>>>>> field:alternate]"
>>>>> media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x480]"
>>>>> media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x480 field:none]"
>>>>> media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x480 field:none]"
>>>>> media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x480field:none]"
>>>>>
>>>>> And then Gstreamer can be launched:
>>>>>
>>>>> # gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink --verbose
>>>>> Setting pipeline to PAUSED ...
>>>>> Pipeline is live and does not need PREROLL ...
>>>>> /GstPipeline:pipeline0/GstKMSSink:kmssink0: display-width = 800
>>>>> /GstPipeline:pipeline0/GstKMSSink:kmssink0: display-height = 480
>>>>> Setting pipeline to PLAYING ...
>>>>> New clock: GstSystemClock
>>>>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
>>>>> video/x-raw, format=(string)YUY2, width=(int)720, height=(int)480,
>>>>> framerate=(fraction)25/1, colorimetry=(string)bt601,
>>>>> interlace-mode=(string)progressive
>>>>> /GstPipeline:pipeline0/GstKMSSink:kmssink0.GstPad:sink: caps =
>>>>> video/x-raw, format=(string)YUY2, width=(int)720, height=(int)480,
>>>>> framerate=(fraction)25/1, colorimetry=(string)bt601,
>>>>> interlace-mode=(string)progressive
>>>>>
>>>> Fabio,
>>>>
>>>> Yes, you need to use the vdic to capture from adv7180 with gstreamer
>>>> as it can't handle alternate.
>>>>
>>>>> However the video looks like a broken old TV scrolling the image 
>>>>> horizontally:
>>>>> https://www.dropbox.com/s/2yef8egn6s8z7ff/mx53_adv7180_capture.mp4?dl=0 
>>>>>
>>>>>
>>>> This would be because of the initial corrupt frames that this and many
>>>> other decoders produce while waiting for proper sync. I added
>>>> 'g_skip_frames' support in 9483a3f8e1b58ba1d7cd21687d8d0a63a015c36b
>>>> but I'm not sure how to get gstreamer to use it?
>>>>
>>>> I still carry around a patch from Steve for imx-csi that drops first
>>>> few frames from BT656 sources:
>>>> https://github.com/Gateworks/linux-imx6/commit/959fbd42ee6433f49ef4a04fb1abe8f8c78db5ad 
>>>>
>>>> to deal with this.
>>>
>>> Yes, that's likely the issue, from a look at Fabio's video. The patch 
>>> referenced by Tim hard-codes the number of frames to skip, instead of 
>>> calling the adv7180's g_skip_frames op. I still don't have an answer 
>>> as to how to call the adv7180 from the CSI subdev.
>>
>> Seems to me initial corrupt frames would produce a fixed offset of 
>> some kind. A rolling video like that looks more like the number of 
>> lines being captured is wrong.
> 
> Nope, rolling video is one of the symptoms of initial corrupt frames, 
> from my own experience. I don't really have an explanation for it, but 
> IIRC the IPU will insert lines on its own to recover from an initial 
> wrong # lines captured, to regain vertical sync. That should mean the 
> rolling should eventually stop once vertical sync is re-established, but 
> I've seen many instances where rolling video continues, and skipping the 
> initial corrupt frames fixes it.
> 

OK, good to know. Thanks Steve.

> Steve
> 
> 
