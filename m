Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 764FE6DF2FF
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 13:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjDLLRf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 07:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjDLLR2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 07:17:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A15C86A2
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 04:17:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 917196331E
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 11:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA096C4339B;
        Wed, 12 Apr 2023 11:16:09 +0000 (UTC)
Message-ID: <1bb63685-96d6-057a-8644-844ec99ab5fc@xs4all.nl>
Date:   Wed, 12 Apr 2023 13:16:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: saa7146: please test the vb2 conversion!
Content-Language: en-US
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Stefan Herdler <herdler@nurfuerspam.de>
Cc:     linux-media@vger.kernel.org, Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
 <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
 <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
 <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
 <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
 <c735aadc-80cd-9332-6661-638cad63afa2@xs4all.nl>
 <026b1342-2b0f-f61d-ea33-63f3992d1473@nurfuerspam.de>
 <20230208100847.3ec87576@coco.lan>
 <99397771-409b-e487-e429-d5c9feb82209@nurfuerspam.de>
 <016c57b2-8538-c630-b72f-a3c608c33a02@xs4all.nl>
 <6c5433ff-a6c8-10f3-789b-bc231291c642@xs4all.nl>
 <a1059b8f-77ef-3ccc-2ae3-d4846fb8a305@nurfuerspam.de>
 <9dec250e-72b2-3c03-c01d-e211a270a751@nurfuerspam.de>
 <fc0244d7-1edc-d0f9-1777-65521d781d7b@xs4all.nl>
 <60ee8312-fecb-3fc6-6496-95ab894bc7a1@nurfuerspam.de>
 <8fd63839-c876-44ef-7597-8436cf0239ae@xs4all.nl>
In-Reply-To: <8fd63839-c876-44ef-7597-8436cf0239ae@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/04/2023 12:11, Hans Verkuil wrote:
> On 10/04/2023 00:36, Stefan Herdler wrote:
>> On 07/04/23 09:04, Hans Verkuil wrote:
>>> On 07/04/2023 00:43, Stefan Herdler wrote:
>> [...]
>>>>
>>>> VBI output is used to switch the aspect-ratio via WSS.
>>>> this should be supported by any av7110 card.
>>>>
>>>> The software is run a daemon or plugin, so the userspace-facing change
>>>> shouldn't matter.
>>>>
>>>> I'll test this as soon as possible.
>>>>
>>>>
>>>>
>>>>
>>>> I've done only basic testing so far, but unfortunately it already failed.
>>>>
>>>> The test:
>>>> Switch to a channel[*] and view the decoded video with tvtime.
>>>>
>>>> The resulting picture is corrupted.
>>>> Almost green with some pink traces at the outlines.
>>>>
>>>> It reminds me to YCbCr component-yideo on a RGB-input.
>>>> Maybe the input-format of saa7146 not set correctly?
>>>>
>>>> The OSD is equally affected, but the card seems to run stable.
>>>
>>> That's weird. When you are in this state, can you run
>>> 'v4l2-ctl -V -d /dev/videoX' for the video device that tvtime
>>> is using? I'll try to test it with tvtime as well next week.
>>> I have done my tests using qvidcap and qv4l2, and that looked fine.
>>
>> I've done some more testing and the result is somehow confusing to me.
>>
>> At first I tried qv4l and it shows correct videos with any driver.
>> And with any pixel format setting I tried.
>>
>>
>> After boot /dev/video0 (there is only this device) starts always with
>> this settings:
>> Format Video Capture:
>>         Width/Height      : 384/288
>>         Pixel Format      : 'BGR3' (24-bit BGR 8-8-8)
>>         Field             : Interlaced
>>         Bytes per Line    : 1152
>>         Size Image        : 331776
>>         Colorspace        : SMPTE 170M
>>         Transfer Function : Default (maps to Rec. 709)
>>         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
>>         Quantization      : Default (maps to Full Range)
>>         Flags             :
>>
>>
>> On the working "old" driver tvtime switches to the following settings:
>> Format Video Capture:
>>         Width/Height      : 720/576
>>         Pixel Format      : 'UYVY' (UYVY 4:2:2)
>>         Field             : Interlaced
>>         Bytes per Line    : 1440
>>         Size Image        : 829440
>>         Colorspace        : SMPTE 170M
>>         Transfer Function : Default (maps to Rec. 709)
>>         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
>>         Quantization      : Default (maps to Limited Range)
>>         Flags             :
>> It seems tvtime needs this 'UYVY' pixel format to work.
>>
>>
>> On the "new" driver, with patches [1], tvtime switches to:
>> Format Video Capture:
>>         Width/Height      : 720/576
>>         Pixel Format      : 'BGR3' (24-bit BGR 8-8-8)
>>         Field             : Interlaced
>>         Bytes per Line    : 2160
>>         Size Image        : 1244160
>>         Colorspace        : SMPTE 170M
>>         Transfer Function : Default (maps to Rec. 709)
>>         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
>>         Quantization      : Default (maps to Full Range)
>>         Flags             :
>> And now it is getting weird:
>> I can switch to the correct 'UYVY' settings using qv4l.
>> But tvtime always switches back to 'BGR3'.
> 
> The cause is "[PATCH 10/17] media: common: saa7146: fall back to V4L2_PIX_FMT_BGR24".
> 
> Can you drop that patch and test again?
> 
> It's really a tvtime bug since drivers are allowed to either reject an unsupported
> pixelformat (the old behavior) or replace it with a supported pixelformat (the
> new behavior). And tvtime only supports the old behavior.

FYI: I posted a patch fixing tvtime:

https://patchwork.linuxtv.org/project/linux-media/patch/a5dff340-ab8a-46e0-1f0c-25ceaf9fe5ca@xs4all.nl/

That said, I do plan to drop patch 10/17 from the saa7146 series, since it is better
to keep the old behavior.

Once I get the green light from you, I will make a pull request for this vb2 conversion.

Regards,

	Hans

> 
>>
>> Using qv4l while tvtime is running doesn't work and sometimes
>> causes freezing of both programs (on all drivers).
> 
> Are you just starting qv4l2 when tvtime is running? Or trying to stream?
> Do you see messages in the kernel log?
> 
> I couldn't reproduce this. Since tvtime is streaming, qv4l2 shouldn't be able to
> do anything since all attempts to change something should result in EBUSY.
> 
> Regards,
> 
> 	Hans
> 
>>
>>
>> I have also build a new driver just without the patches [2].
>> It shows the "old" correct behavior.
>> So I think, the cause of the change must be somewhere in the
>> patches.
>>
>>
>>
>> Btw.:
>> I also tried to open the video device with the usual
>> media-players, but I had no luck so far (with any driver).
>>
>>
>> Regards
>>
>> Stefan
>>
>>
>> [1] git checkout -B saa7146-clean 837736a79a76c9becddf0caf905b27c144a64030
>> [2] git checkout -B saa7146-clean 2653fad0d8a9625667e9a78133ea9e1245b7c40c
>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>> [...]
> 

