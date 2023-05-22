Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54B3070B684
	for <lists+linux-media@lfdr.de>; Mon, 22 May 2023 09:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbjEVH2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 May 2023 03:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232653AbjEVH1v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 May 2023 03:27:51 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 618031B0;
        Mon, 22 May 2023 00:27:37 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.31:33128.1682002454
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
        by 189.cn (HERMES) with SMTP id B866E100300;
        Mon, 22 May 2023 15:27:32 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-75648544bd-xp9j7 with ESMTP id abbe5cda707343189d29c65c97453682 for kernel@xen0n.name;
        Mon, 22 May 2023 15:27:35 CST
X-Transaction-ID: abbe5cda707343189d29c65c97453682
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <b54d8f78-9d7c-8441-20f7-a4f3a2393081@189.cn>
Date:   Mon, 22 May 2023 15:27:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To:     WANG Xuerui <kernel@xen0n.name>, Sui Jingfeng <15330273260@189.cn>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Emil Velikov <emil.l.velikov@gmail.com>
Cc:     linaro-mm-sig@lists.linaro.org, loongson-kernel@lists.loongnix.cn,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Javier Martinez Canillas <javierm@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Liu Peibao <liupeibao@loongson.cn>, linux-media@vger.kernel.org
References: <20230520105718.325819-1-15330273260@189.cn>
 <20230520105718.325819-2-15330273260@189.cn>
 <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,


I love your reviews,


On 2023/5/21 20:21, WANG Xuerui wrote:
> Hi,
>
> Someone else in a discussion group brought my attention to this 
> series, that I've neglected for a long time because 
> loongarch@lists.linux.dev isn't on the Cc list and I'm not subscribed 
> to dri-devel.
>
> While I'm reasonably familiar with LoongArch internals and Linux in 
> general, I don't regularly tinker with the graphics things, so I'm 
> mainly focusing on the natural language usage and general code smells 
> for my reviews below. Pardon me if some of the questions seem silly.
>
> (After going through the entirety of this: *please* spell-check your 
> comment blocks, and correct obvious grammatical nits as best as you 
> can. From my first impression, although a reader not familiar with 
> LoongArch nor Chinese could go a long way in understanding this, some 
> of the rest would be misunderstood, or don't make sense at all. And 
> like 90% of the sentences are grammatically incorrect, i.e. are 
> obvious "Chinglish". Maybe something like those ChatGPT-based services 
> or someone in your company would help.)
>
OK, I didn't realize that grammar problem could up to 90%.

I'm focus on feature development previously,  I will do the grammar 
check before send the next version.

>
>
[...]
>
> On 2023/5/20 18:57, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> Loongson display controller IP has been integrated in both Loongson 
>> north
>> bridge chipset(ls7a1000/ls7a2000) and Loongson 
>> SoCs(ls2k1000/ls2k2000), it
>> has been even included in Loongson self-made BMC products.
>>
>> This display controller is a PCI device. It has two display pipes and 
>> each
>> display pipe support a primary plane and a cursor plane. For the DC 
>> in the
>
> "supports"
Ok, you are correct here.
>
>> ls7a1000 and ls2k1000, each display pipe has a DVO output interface 
>> which
>> provide RGB888 signals, vertical & horizontal synchronisations and pixel
>
> "synchronisation"
>
Ok, you are correct here.
>> clock. Each CRTC is able to support 1920x1080@60Hz, the maximum 
>> resolution
>
> "is capable of" sounds more natural?
>
I think they are equivalent, I can't perceive the difference.
>> of each display pipe is 2048x2048 according to the hardware spec.
>>
>> For the DC in LS7A2000, each display pipe is equipped with a built-in 
>> HDMI
>> encoder which is compliant with the HDMI 1.4 specification, thus it 
>> support
>
> "supporting up to 3840x2160@30Hz"
>
acceptable
>> 3840x2160@30Hz. The first display pipe is also equipped with a 
>> transparent
>> vga encoder which is parallel with the HDMI encoder. The DC in 
>> LS7A2000 is
>
> "The first display pipe additionally has a transparent VGA encoder"?
>
The first display pipe(pipe 0) also has a transparent VGA encoder.

>> more complete compare with the one in old chips, besides above 
>> feature, it
>> has two hardware cursors, two hardware vblank counter and two scanout
>> position recorders unit. It also support tiled framebuffer format which
>> can be scanout the tiled framebuffer rendered by the LoongGPU directly.
>
> "The DC in LS7A2000 is more feature-complete compared with the older 
> revision: in addition to the above, it also has two hardware cursors, 
> two hardware vblank counters and two scanout position recorders. It 
> also supports tiled framebuffer format so the tiled output from the 
> LoongGPU can be scanned out directly."

OK, acceptable.

