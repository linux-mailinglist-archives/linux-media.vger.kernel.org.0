Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFCE2D5262
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2019 22:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729555AbfJLUYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Oct 2019 16:24:38 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45580 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729506AbfJLUYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Oct 2019 16:24:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id r1so6556304pgj.12
        for <linux-media@vger.kernel.org>; Sat, 12 Oct 2019 13:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qfv7Wcu3vq6Cxr+gPQeHa61RBHCh0bv9VI+TGO9YDQU=;
        b=FcWEJOvjKMbIzHJ80YYyFdFJ+VpMrDwm09VxQtrvXKmDbYS0PkQa/j8KPwos+qKsad
         bN13sDtFS/X4gxFV9aozxJ8jePnFglM5cYVyT1c2ceTLEqpwEficNyGKKZdFLOXSoP7w
         duQKQZOIESJgD4urZa0QNxoh3TEDzqBO5Br9UtiIMp2q7nzmuyT1kaWBXb0FdVF8WqZF
         5miiy47haLOOmP5OB6j2QuvZbH7OdNr3rjnFzcHDaXW0D05WNy1RoG751uxF8dJsO3di
         eh56iPWEfGH1dE6Stkc5Grcjis6UP/M9FxMQjbL5klxSdpOFcPF96+WelNyD27Bz7pFF
         IEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qfv7Wcu3vq6Cxr+gPQeHa61RBHCh0bv9VI+TGO9YDQU=;
        b=HbG2CJbDZOteGDA1EYkEm5QhwJdNBKL9e027GrZroawpetmFRo5DFLFfPwOQ/wrmWm
         f8xq9VVce+nP6hebb1iKuSo4clvKM1lCdCzP/dRfbxevi/f6dNGkgpvC2s/igy6GkTJl
         MLmojzgJHGJtTkkTzd1Bj6Fj4AEM4h1IQMxcvlJvv+h+I1Yu2NOPm6RotV2P7aPhdBot
         uTegPFF8t6q7tWejlQBz1lrozT1YH7lIs/eomkCJxe6GAlo3gqycIlzfq3LEjmUEMbyH
         PBrxktuHxYi45L111420KlQikU6irCaM2qHz0uKm802ULvZ9vLXrlI6eK75+MJ2OhE+n
         K6NA==
X-Gm-Message-State: APjAAAU3quV32HqPRjKh5bPRwcMwk9essgL8vlyC0LZyDi7CoqIxlh8Q
        3mZd46hP0OSQXJ0ZNc7va9w=
X-Google-Smtp-Source: APXvYqy+lRBzscvWmcjUHPZ7Hrhg+t9bJstFwDamKos/PKMBNCeWWloNszszfkE1fjqb0oL5MuPaog==
X-Received: by 2002:a63:d803:: with SMTP id b3mr24675452pgh.310.1570911877083;
        Sat, 12 Oct 2019 13:24:37 -0700 (PDT)
Received: from [192.168.1.59] (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.gmail.com with ESMTPSA id d22sm14288066pfq.168.2019.10.12.13.24.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Oct 2019 13:24:35 -0700 (PDT)
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180
 instructions
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, tharvey@gateworks.com
References: <20191010154417.9437-1-festevam@gmail.com>
 <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
Message-ID: <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com>
Date:   Sat, 12 Oct 2019 13:24:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/12/19 1:14 PM, Steve Longerbeam wrote:
> Hi Fabio,
>
> On 10/10/19 8:44 AM, Fabio Estevam wrote:
>> In kernel 5.3.x the I2C bus that the adv7180 is under has changed from
>> bus 3 to 4 and the ipu_csi0_mux numbers has also changed as shown by
>> the kernel log below:
>>
>> [    5.159423] imx-media: ipu1_csi0_mux:5 -> ipu1_csi0:0
>> [    5.164618] imx-media: ipu1_csi1_mux:5 -> ipu1_csi1:0
>> [    5.169953] imx-media: adv7180 4-0021:0 -> ipu1_csi0_mux:4
>>
>> Update the instructions accordingly.
>
> I just booted the imx6q SabreAuto with 5.4.0-rc1 (and media-tree HEAD 
> 3ff3a712a9ea), I am getting:
>
> arm:~ % uname -r
> 5.4.0-rc1-13672-g3ff3a712a9ea
> arm:~ % dmesg | grep 'ipu[12]_csi[01]_mux'
> [   13.042519] imx-media: ipu1_csi0_mux:2 -> ipu1_csi0:0
> [   13.042590] imx-media: ipu2_csi1_mux:2 -> ipu2_csi1:0
> [   13.042656] imx-media: adv7180 3-0021:0 -> ipu1_csi0_mux:1
> arm:~ % dmesg | grep adv7180
> [   12.905157] adv7180 3-0021: chip found @ 0x21 (i2c-2-mux (chan_id 1))
> [   13.042656] imx-media: adv7180 3-0021:0 -> ipu1_csi0_mux:1
>
>
> So the adv7180 i2c-bus and pad numbers have not changed. The adv7180 
> is still on bus 3, and the output pad from the IPU-CSI video muxes are 
> still pad 2. The video muxes have no such pad 5 in fact. I'd be 
> curious in learning how you came about that pad number.

Ah, now I remember. You are using the imx6dl sabreauto, it's IPU-CSI 
video muxes have five input pads for each of the four MIPI CSI-2 virtual 
channels (pads 0 - 3) and one parallel input (pad 4). The output mux pad 
is pad 5.

But the doc should clarify which SabreAuto corresponds to the given 
example pipeline config. Can you send a v2 of this patch that clarifies 
the config corresponds to the imx6 quad SabreAuto. If you like you could 
also include the analogous config for the imx6dl.

Steve

>
>> Also, in the last line pass the fmt field explicitly as done in the
>> previous lines.
>
> Thanks for catching that, it was left over from a pipeline 
> configuration script of mine.
>
> Steve
>
>>
>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>> ---
>>   Documentation/media/v4l-drivers/imx.rst | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/media/v4l-drivers/imx.rst 
>> b/Documentation/media/v4l-drivers/imx.rst
>> index 1d7eb8c7bd5c..75430cd2f222 100644
>> --- a/Documentation/media/v4l-drivers/imx.rst
>> +++ b/Documentation/media/v4l-drivers/imx.rst
>> @@ -530,12 +530,12 @@ NTSC, or 'alternate'):
>>   .. code-block:: none
>>        # Setup links
>> -   media-ctl -l "'adv7180 3-0021':0 -> 'ipu1_csi0_mux':1[1]"
>> -   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
>> +   media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
>> +   media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]"
>>      media-ctl -l "'ipu1_csi0':2 -> 'ipu1_csi0 capture':0[1]"
>>      # Configure pads
>> -   media-ctl -V "'adv7180 3-0021':0 [fmt:UYVY2X8/720x480 field:seq-bt]"
>> -   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/720x480]"
>> +   media-ctl -V "'adv7180 4-0021':0 [fmt:UYVY2X8/720x480 field:seq-bt]"
>> +   media-ctl -V "'ipu1_csi0_mux':5 [fmt:UYVY2X8/720x480]"
>>      media-ctl -V "'ipu1_csi0':2 [fmt:AYUV32/720x480]"
>>      # Configure "ipu1_csi0 capture" interface (assumed at /dev/video4)
>>      v4l2-ctl -d4 --set-fmt-video=field=interlaced_bt
>> @@ -553,19 +553,19 @@ at its output pad:
>>   .. code-block:: none
>>        # Setup links
>> -   media-ctl -l "'adv7180 3-0021':0 -> 'ipu1_csi0_mux':1[1]"
>> -   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
>> +   media-ctl -l "'adv7180 4-0021':0 -> 'ipu1_csi0_mux':4[1]"
>> +   media-ctl -l "'ipu1_csi0_mux':5 -> 'ipu1_csi0':0[1]"
>>      media-ctl -l "'ipu1_csi0':1 -> 'ipu1_vdic':0[1]"
>>      media-ctl -l "'ipu1_vdic':2 -> 'ipu1_ic_prp':0[1]"
>>      media-ctl -l "'ipu1_ic_prp':2 -> 'ipu1_ic_prpvf':0[1]"
>>      media-ctl -l "'ipu1_ic_prpvf':1 -> 'ipu1_ic_prpvf capture':0[1]"
>>      # Configure pads
>> -   media-ctl -V "'adv7180 3-0021':0 [fmt:UYVY2X8/720x576 field:seq-tb]"
>> -   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/720x576]"
>> +   media-ctl -V "'adv7180 4-0021':0 [fmt:UYVY2X8/720x576 field:seq-tb]"
>> +   media-ctl -V "'ipu1_csi0_mux':5 [fmt:UYVY2X8/720x576]"
>>      media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
>>      media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
>>      media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
>> -   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:$outputfmt field:none]"
>> +   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
>>     Streaming can then begin on the capture device node at
>>   "ipu1_ic_prpvf capture". The v4l2-ctl tool can be used to select any
>

