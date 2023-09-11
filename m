Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A58679B7A2
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 02:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235133AbjIKUsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 16:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236140AbjIKJv3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 05:51:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C504FE4F
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 02:51:23 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110ACC433C8;
        Mon, 11 Sep 2023 09:51:21 +0000 (UTC)
Message-ID: <80c2cacb-a2e0-4b77-acc9-6f5d1aa23108@xs4all.nl>
Date:   Mon, 11 Sep 2023 11:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BTTV] [FSL P50x0] [PASEMI] TV Time doesn't work anymore after
 dropping the overlay support
Content-Language: en-US, nl
To:     Deborah Brouwer <deborahbrouwer3563@gmail.com>
Cc:     Darren Stevens <darren@stevens-zone.net>,
        mad skateman <madskateman@gmail.com>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Christian Zigotzky <info@xenosoft.de>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        linux-media@vger.kernel.org
References: <94a617be-00b3-6dc8-eb7d-ae13c6fffae5@xenosoft.de>
 <cb82b6c1-035c-cc6b-2843-6b87ed6315ac@xenosoft.de>
 <f23204ec-ff42-5907-fa28-c1975a87f4e6@xs4all.nl>
 <79ea7cc5-6981-a791-7fed-7a6e27225000@xenosoft.de>
 <a02d481b-562c-803a-a71d-b8d95ba7ebb5@xs4all.nl>
 <82799d05-db42-c6a3-51ef-15e262344d4f@xenosoft.de>
 <f3c18b6e-0a3d-49bd-9553-71bd610588c2@xenosoft.de>
 <0e7d6689-d522-4438-9acb-952995c57f32@xs4all.nl>
 <CAONMFfAyBOoPKo+K-qZG_E5d+_F++Nn7q5LK-sONMd2=XWHCzQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAONMFfAyBOoPKo+K-qZG_E5d+_F++Nn7q5LK-sONMd2=XWHCzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

On 10/09/2023 04:33, Deborah Brouwer wrote:
> On Thu, Sep 7, 2023 at 8:23 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Hi Deb,
>>
>> On 04/09/2023 13:51, Christian Zigotzky wrote:
>>> On 05 May 2023 at 09:20 am, Christian Zigotzky wrote:
>>>> On 05 May 2023 at 08:45 am, Hans Verkuil wrote:
>>>>> On 05/05/2023 08:25, Christian Zigotzky wrote:
>>>>>> On 02 May 2023 at 08:57 am, Hans Verkuil wrote:
>>>>>>> If v4l2-ctl fails, then try again
>>>>>>> after applying this series:
>>>>>>>
>>>>>>> https://patchwork.linuxtv.org/project/linux-media/cover/cover.1682995256.git.deborah.brouwer@collabora.com/
>>>>>> Your patch series solved the issue. Thanks a lot!
>>>>> Nice, but somewhat unexpected :-)
>>>>>
>>>>> I'm a little bit unsure how to proceed: the 6.4 kernel will remove destructive overlay
>>>>> support, but it won't have this series yet, that's for 6.5. But that would make 6.4
>>>>> unusable for you.
>>>>>
>>>>> I might have to revert the overlay removal, at least for bttv.
>>>>>
>>>>> Regards,
>>>>>
>>>>>     Hans
>>>> Hans,
>>>>
>>>> You don't need to revert the overlay removal because your patch series work with the latest git kernel (6.4).
>>>>
>>>> Thanks for your help,
>>>>
>>>> Christian
>>>
>>> Hello Hans,
>>>
>>> I successfully used your patches for the kernel 6.5. Everything works without any problems with your patch series from May.
>>>
>>> Your patches have been added with the latest Media updates [1] for the kernel 6.6.
>>>
>>> The patches works but I have a green bar in the bottum of the window if I use the composite input. [2]
>>>
>>> I don't have this green bar with your May patch series.
>>>
>>> Could you please check your latest patches?
>>>
>>> Thanks,
>>>
>>> Christian
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=307d59039fb26212a84a9aa6a134a7d2bdea34ca
>>> [2] https://i.ibb.co/D4K6j2c/Kernel-6-6-alpha2-Power-PC.png
>>>
>>>
>>
>> After some testing and debugging I found this change in the bttv vb2 conversion
>> patch:
>>
>> https://patchwork.linuxtv.org/project/linux-media/patch/d785cd8b0d8c19c05fcaa1536622e2fdd9f8ede3.1689379982.git.deborah.brouwer@collabora.com/
>>
>>> diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
>>> index 3e0dac56de54..436baf6c8b08 100644
>>> --- a/drivers/media/pci/bt8xx/bttv-risc.c
>>> +++ b/drivers/media/pci/bt8xx/bttv-risc.c
>>> @@ -67,8 +67,10 @@ bttv_risc_packed(struct bttv *btv, struct btcx_riscmem *risc,
>>>       /* scan lines */
>>>       sg = sglist;
>>>       for (line = 0; line < store_lines; line++) {
>>> -             if ((btv->opt_vcr_hack) &&
>>> -                 (line >= (store_lines - VCR_HACK_LINES)))
>>> +             if ((line >= (store_lines - VCR_HACK_LINES)) &&
>>> +                 (btv->opt_vcr_hack ||
>>> +                 (V4L2_FIELD_HAS_BOTH(btv->field) ||
>>> +                  btv->field == V4L2_FIELD_ALTERNATE)))
>>>                       continue;
>>>               while (offset && offset >= sg_dma_len(sg)) {
>>>                       offset -= sg_dma_len(sg);
>>
>> It is this change that causes the issue: basically the condition
>> (V4L2_FIELD_HAS_BOTH(btv->field) || btv->field == V4L2_FIELD_ALTERNATE)
>> is almost always true (it is only false for FIELD_TOP/BOTTOM), so it is
>> as if vcr_hack is always turned on.
>>
>> It looks to me like some debug code accidentally ended up in this patch.
>> Reverting this change makes everything look good again (Christian, it would
>> be great if you can confirm that this also fixes the issue for you!).
>>
>> Deb, can you remember anything about this change?
> 
> This is not debug code.  I made the change to fix the latency and
> frame drop issues
> that were otherwise occurring with vb2; as I said in the cover letter to v3:
> 
> "- remove the last four lines in interlaced,
> sequential top/bottom, and alternating buffers
> to prevent long latency and frame drops
> (this is instead of just enabling the existing
> VCR hack by default);"
> https://lore.kernel.org/linux-media/cover.1689379982.git.deborah.brouwer@collabora.com/
> 
> However, if your testing shows that it isn't needed, then it would be
> fine to remove this
> code and just let the user enable the "vcr hack" as needed.  This was
> my original approach
> in v2, but I thought you had said at the time that you were seeing
> massive framedrops in v2?

That's not quite what I said:

"Another thing I discovered is that for PAL the vcr_hack control has to be enabled,
otherwise the video is full of glitches. This was present before your series, and
happens even with a video signal from a proper PAL video generator, so this is really
strange. I can't remember that I needed this in the past, but it has been years
since I last tested it.

PAL capture is fine for Top/Bottom/Alternate settings, it only fails for Interlaced
and Sequential Top/Bottom capture modes."

This issue was present before your series, so this is not something that should be
changed in a vb2 conversion, since this has nothing to do with it.

In addition, it is a PAL only issue, and this change would turn on vcr_hack for NTSC
as well, and also for FIELD_ALTERNATE, even though that is not affected by it.

Interestingly, since I was wondering why Christian didn't see it even though he is
in a PAL country, I tested with tvtime and that displays it fine, but qv4l2/qvidcap
show the glitches. This suggests that it is a problem in those utils, and not in the
driver. I'll dig deeper into this.

In the meantime, I'll prepare a patch reverting this change for v6.6.

Regards,

	Hans

> 
> I didn't notice this green line before because I was testing in qv4l2
> with the default
> Pixel Format  : 'BGR3' (24-bit BGR 8-8-8) whereas tvtime is using
> YUYV' (YUYV 4:2:2)
> 
> One fix that worked for me was to adjust the "OverScan" configuration in tvtime
> so that it is at least 3.5.  The /etc/tvtime/tvtime.xml configuration
> file recommends
> even higher at 8.0.  Christian, please try adjusting the overscan
> value to see if
> that is a possible solution as well.
> 
> Thanks,
> Deb
> 
>>
>> Regards,
>>
>>         Hans
>>
>>
>>

