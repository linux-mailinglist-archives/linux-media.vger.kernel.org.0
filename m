Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2664E73CAAD
	for <lists+linux-media@lfdr.de>; Sat, 24 Jun 2023 14:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjFXMDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Jun 2023 08:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjFXMDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Jun 2023 08:03:07 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8D1116
        for <linux-media@vger.kernel.org>; Sat, 24 Jun 2023 05:03:04 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qD1yh-0004QA-Ft; Sat, 24 Jun 2023 14:02:55 +0200
Message-ID: <d34ed005-730a-a985-663f-48671ec15a94@leemhuis.info>
Date:   Sat, 24 Jun 2023 14:02:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] media: uvcvideo: Fix menu count handling for userspace XU
 mappings
Content-Language: en-US, de-DE
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Poncho <poncho@spahan.ch>, linux-media@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        regressions@lists.linux.dev
References: <20230606170919.GJ25679@pendragon.ideasonboard.com>
 <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
 <785fcf0b-3f63-a0da-3eea-f57124e99e15@spahan.ch>
 <20230624002517.GF1669@pendragon.ideasonboard.com>
 <7dd4f71e-afbd-2f0a-b6bb-8324916ab3d1@leemhuis.info>
 <20230624104017.GH1669@pendragon.ideasonboard.com>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230624104017.GH1669@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687608184;387e4272;
X-HE-SMSGID: 1qD1yh-0004QA-Ft
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24.06.23 12:40, Laurent Pinchart wrote:
> On Sat, Jun 24, 2023 at 11:07:14AM +0200, Thorsten Leemhuis wrote:
>> On 24.06.23 02:25, Laurent Pinchart wrote:
>>> On Wed, Jun 21, 2023 at 05:26:39PM +0200, Poncho wrote:
>>>> Friendly ping. I think this patch was forgotten.
>>> Thanks for the reminder. I'll send a pull request for v6.6.
>>
>> Why 6.6? If this would be a feature I'd fully understand. But this
>> afaics fixes a regression and thus should be handled as one, even if
>> it's a regression from a earlier release. For details see this recent
>> mail from Linus:
>>
>> https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/
> 
> Linus has decided to not pull from the media tree for the next kernel
> release due to a set of mishaps, see
> https://lore.kernel.org/linux-media/CAHk-=wgzU8_dGn0Yg+DyX7ammTkDUCyEJ4C=NvnHRhxKWC7Wpw@mail.gmail.com/.

Yeah, I remember.

> Re-reading the mail, fixes should be fine

Yup, he even pulled some fixes during this cycle.

> even if the issue has been
> there for several releases. I'll send send a pull request for v6.5.

Great, thx!

>> Side note: as it's a regression it would be good if this commit had a
>> "CC: <stable..." tag as well.
> I've already added that to my tree.

Thx, too!

Ciao, Thorsten

>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
>>
>>>> On 06.06.23 19:11, Laurent Pinchart wrote:
>>>>> When commit 716c330433e3 ("media: uvcvideo: Use standard names for
>>>>> menus") reworked the handling of menu controls, it inadvertently
>>>>> replaced a GENMASK(n - 1, 0) with a BIT_MASK(n). The latter isn't
>>>>> equivalent to the former, which broke adding XU mappings from userspace.
>>>>> Fix it.
>>>>>
>>>>> Reported-by: Poncho <poncho@spahan.ch>
>>>>> Link: https://lore.kernel.org/linux-media/468a36ec-c3ac-cb47-e12f-5906239ae3cd@spahan.ch/
>>>>> Fixes: 716c330433e3 ("media: uvcvideo: Use standard names for menus")
>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>> ---
>>>>> This is untested. Poncho, would you be able to test this patch to see if
>>>>> it fixes your issue ?
>>>>> ---
>>>>>   drivers/media/usb/uvc/uvc_v4l2.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>>>> index 5ac2a424b13d..f4988f03640a 100644
>>>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>>>> @@ -45,7 +45,7 @@ static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
>>>>>   	map->menu_names = NULL;
>>>>>   	map->menu_mapping = NULL;
>>>>>   
>>>>> -	map->menu_mask = BIT_MASK(xmap->menu_count);
>>>>> +	map->menu_mask = GENMASK(xmap->menu_count - 1, 0);
>>>>>   
>>>>>   	size = xmap->menu_count * sizeof(*map->menu_mapping);
>>>>>   	map->menu_mapping = kzalloc(size, GFP_KERNEL);
> 
