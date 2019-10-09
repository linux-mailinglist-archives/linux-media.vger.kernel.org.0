Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96B94D1573
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 19:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731948AbfJIRW1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 13:22:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39551 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731173AbfJIRW1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 13:22:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id r3so3992235wrj.6
        for <linux-media@vger.kernel.org>; Wed, 09 Oct 2019 10:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=HAHtA/5BSkxppNEfHxbn69KdYs0UvPf8QWgO0OGPECs=;
        b=SaIo51kIp/BllkJ5XVJkEyLFKQh/tdBv2tC20ptkhhd6htFXeEX+hBpGL9bM1REmHm
         ml/Wyl8AfCJ6RJoKaKMMfYfyuZ3kQ4WL5TTN1XXE9bQiWeVpkkJ2ChUV5Yo0XbFjyn5i
         TyBk4DvrVo1Xjo3n9nVnePlxzfP4/13zhwixIVUdxpDhXurry5OrW3GH//1D8BHdwhAj
         /3geLFwngGsj9nWeh67MmOHpaNX9kM+jmxmw6mHqeEfI9lRZcOVbL2xjHmkG6LlTPnM0
         TzAZc8x/u7pv2eNNz8HjMWQS/cVWp+uc57YGFO6nvW/MvPjIPDqo5GFQkKzRtqTjufLQ
         QhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HAHtA/5BSkxppNEfHxbn69KdYs0UvPf8QWgO0OGPECs=;
        b=k3y9xNlI/atOpIAeJZXuB8X4oa3cW4SH1mUdxCpmVRoZt/9EpBluA7A6Gj5/A9glkp
         aPtxiOZz20vdOJJ1foOzRuGo+EtXrkFedsEwBA+E8q7A8JGYavEVdo8iWIJdf/DwTwh6
         SM3eZX8qh3poa7NUgg/MoxYLOwaKCtHnIgJMTzwViZemdbTSUKDDMVyjHyzHiExbLdg6
         Lu/DbyvbRNSUug6xNSvWJ+4APps+wJG4cTl+VyWU0XZT7qIZ1PVPEOuTwNvdo7RFVuoy
         2XNFLLtl7YT7xbL/u/676gQ9vOM6ElD6e0Ck9xcydTwK0YpnO+hh7fH5X480Aour3NYM
         FP6A==
X-Gm-Message-State: APjAAAX4ATinsE0x953gbUFTD2ZxVbxgHmN4E46z5VP2HrttjVxRcU8E
        gwlQ4aYihPrzLHtEvY2GW2w=
X-Google-Smtp-Source: APXvYqzWGQp+D4FbbXUbTHSBdmTEn0vfgE7OSk9QcP46WYgCKQhE5JWUXMKk0JGJ1bq/KP26Y0QzLw==
X-Received: by 2002:adf:fc0d:: with SMTP id i13mr3822579wrr.354.1570641744899;
        Wed, 09 Oct 2019 10:22:24 -0700 (PDT)
Received: from [172.30.88.127] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id j18sm2908283wrs.85.2019.10.09.10.22.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 10:22:24 -0700 (PDT)
Subject: Re: ADV7180 Capture with i.MX53
To:     Tim Harvey <tharvey@gateworks.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Matthew Starr <mstarr@hedonline.com>
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com>
 <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
 <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com>
 <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
 <CAOMZO5DmD5V+nT9QhWKTNHe+UydmQP=PJgxZopj7cm9YjEx68A@mail.gmail.com>
 <CAJ+vNU0EFWA66cnB+1ze-=vMr=WBWuV_=m6+DF_xQ6gng3J-bQ@mail.gmail.com>
 <CAOMZO5ATZw80cz6WsNUxWfgsqqX-R6A6SKz7tFQa=Tdy2ynWJA@mail.gmail.com>
 <CAJ+vNU1X6kCeA=CVcGqEU4DCH8ZO_EwdARpyuXdGVMH_Uu7+7w@mail.gmail.com>
 <CAOMZO5Ct_-wjJnb9ktp7KDcAbhajjuRxWEDYfR-13x-9ZJut6w@mail.gmail.com>
 <CAJ+vNU3FUvB_a1TxxjvtKbC9xg6-VbD+3PE6-5uEwgOwXn6WvQ@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <e2c7a89c-5475-6685-2f9b-3f54e822a526@gmail.com>
Date:   Wed, 9 Oct 2019 10:22:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU3FUvB_a1TxxjvtKbC9xg6-VbD+3PE6-5uEwgOwXn6WvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/9/19 8:40 AM, Tim Harvey wrote:
> On Tue, Oct 8, 2019 at 4:48 PM Fabio Estevam <festevam@gmail.com> wrote:
>> Hi Tim,
>>
>> On Tue, Oct 8, 2019 at 6:01 PM Tim Harvey <tharvey@gateworks.com> wrote:
>>
>>> Ok that's strange indeed. I did recently test 5.3 on a Gateworks IMX6
>>> board with ADV7180 and the one patch to drop the first few frames and
>>> its stable. What does your testing show on an IMX6 and do you know
>> I will give it a try on a imx6q-sabreauto board for comparison.
>>
>>> when it may have broken for IMX53?
>> i.MX53 capture is relatively new and this is my first time trying to
>> get it to work with mainline.
>>
>> I assume I should do something similar to your
>> https://raw.githubusercontent.com/Gateworks/media-ctl-setup/master/media-ctl-setup
>> script, more especifically the mode 3 setup where you have:
>>
> I struggled with coming up with a way to easily document all the
> variations with our boards as we have several different boards that
> have an adv7180 using different CSI ports and then you also have to
> deal with the differences between IMX6SDL and IMX6Q. The script was
> the best solution I could come up with but if you read through it its
> pretty complicated.
>
>> case "$SENS" in
>> adv7180)
>> fmt "'$SENSOR':0 [fmt:UYVY2X8/$res field:alternate]"
>> fmt "'ipu${IPU}_csi${CSI}_mux':$((p+1)) [fmt:UYVY2X8/$res]"
>> # rec709 config at CSI pad 0
>> fmt "'ipu${IPU}_csi${CSI}':0 [fmt:$fmt field:$field colorspace:rec709
>> ycbcr:709]"
>> # CSI src pad output is frame height
>> h=$((h*2))
>> res=${w}x${h}
>> fmt "'ipu${IPU}_csi${CSI}':1 [fmt:AYUV32/$res]"
>> fmt "'ipu${IPU}_vdic':2 [fmt:AYUV32/$res field:none]"
>> fmt "'ipu${IPU}_ic_prp':2 [fmt:AYUV32/$res field:none]"
>> fmt "'$EP':1 [fmt:AYUV32/$res]"
>> ;;
>>
>> Why do you multiple h by 2?
> The input the the CSI is a field of 240 lines but the vdic will
> combine these and have 480 lines. I don't recall exactly why but for
> this to propagate properly you need to set the 480 lines on the csi
> output.

The reason is because there are is no register status bits that will 
tell you whether a captured field was field 0 or field 1. For this 
reason the driver can't support alternate capture mode (which captures 
individual fields and reports to userspace in the returned v4l2_buffer's 
whether the field is a top field or bottom field). So the CSI captures 
two consecutive fields and reports field type seq-bt or seq-tb, and 
doubles height, at its output.


>>> I do have a discussion going on here about NEWAVMODE and BT.656-3 vs
>>> BT.656-4. I wonder if its something to do with that as that issue
>>> causes rolling video on IMX6 with ADV7280:
>>> https://patchwork.kernel.org/patch/11117579/
>> Tested this patch, but it did not help.

About a year ago Matthew Starr reported similar horizontal rolling issue 
with i.mx53 + adv7180. I didn't have an explanation for the problem, 
since IPU register-level is the same between i.mx53 and i.mx6, and 
adv7180 capture is working fine on i.mx6 SabreAuto. And like now, the 
skipping of initial corrupt frames solved vertical sync but not the 
horizontal rolling. I never heard back whether he was able to track down 
the issue.

Matthew, were you ever able to solve this?

> That patch won't affect adv7180 but I wonder if the issues you are
> having have to do with something like this. The adv7180_init function
> will set BT.656-4 mode and adjust V bit end position for NTSC... I
> don't know if that's consistent with the IMX53 CSI needs?

Well, like mentioned above, the IPU CSI is register-level compatible 
between i.mx53 and i.mx6, at least according to the reference manuals, 
so the non-standard V-bit position set by adv7180, and adjusted for by 
the CSI, should work for i.mx53 just like it does for i.mx6. But it's 
possible there are some undocumented differences in the CSI between 
these SoC's.

Steve

>   There are
> lots of little tweaks that can be made to the EAV/SAV codes and its
> not clear to me how to deal with compat issues like i have run into
> with the adv7280 config not being compatible with the IMX6 CSI needs.

