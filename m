Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1927974B7
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 17:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235851AbjIGPkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 11:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235721AbjIGPXP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 11:23:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40706E47
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 08:23:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C624C433C9;
        Thu,  7 Sep 2023 15:23:06 +0000 (UTC)
Message-ID: <0e7d6689-d522-4438-9acb-952995c57f32@xs4all.nl>
Date:   Thu, 7 Sep 2023 17:23:04 +0200
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <f3c18b6e-0a3d-49bd-9553-71bd610588c2@xenosoft.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

On 04/09/2023 13:51, Christian Zigotzky wrote:
> On 05 May 2023 at 09:20 am, Christian Zigotzky wrote:
>> On 05 May 2023 at 08:45 am, Hans Verkuil wrote:
>>> On 05/05/2023 08:25, Christian Zigotzky wrote:
>>>> On 02 May 2023 at 08:57 am, Hans Verkuil wrote:
>>>>> If v4l2-ctl fails, then try again
>>>>> after applying this series:
>>>>>
>>>>> https://patchwork.linuxtv.org/project/linux-media/cover/cover.1682995256.git.deborah.brouwer@collabora.com/
>>>> Your patch series solved the issue. Thanks a lot!
>>> Nice, but somewhat unexpected :-)
>>>
>>> I'm a little bit unsure how to proceed: the 6.4 kernel will remove destructive overlay
>>> support, but it won't have this series yet, that's for 6.5. But that would make 6.4
>>> unusable for you.
>>>
>>> I might have to revert the overlay removal, at least for bttv.
>>>
>>> Regards,
>>>
>>>     Hans
>> Hans,
>>
>> You don't need to revert the overlay removal because your patch series work with the latest git kernel (6.4).
>>
>> Thanks for your help,
>>
>> Christian
> 
> Hello Hans,
> 
> I successfully used your patches for the kernel 6.5. Everything works without any problems with your patch series from May.
> 
> Your patches have been added with the latest Media updates [1] for the kernel 6.6.
> 
> The patches works but I have a green bar in the bottum of the window if I use the composite input. [2]
> 
> I don't have this green bar with your May patch series.
> 
> Could you please check your latest patches?
> 
> Thanks,
> 
> Christian
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=307d59039fb26212a84a9aa6a134a7d2bdea34ca
> [2] https://i.ibb.co/D4K6j2c/Kernel-6-6-alpha2-Power-PC.png
> 
> 

After some testing and debugging I found this change in the bttv vb2 conversion
patch:

https://patchwork.linuxtv.org/project/linux-media/patch/d785cd8b0d8c19c05fcaa1536622e2fdd9f8ede3.1689379982.git.deborah.brouwer@collabora.com/

> diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
> index 3e0dac56de54..436baf6c8b08 100644
> --- a/drivers/media/pci/bt8xx/bttv-risc.c
> +++ b/drivers/media/pci/bt8xx/bttv-risc.c
> @@ -67,8 +67,10 @@ bttv_risc_packed(struct bttv *btv, struct btcx_riscmem *risc,
>  	/* scan lines */
>  	sg = sglist;
>  	for (line = 0; line < store_lines; line++) {
> -		if ((btv->opt_vcr_hack) &&
> -		    (line >= (store_lines - VCR_HACK_LINES)))
> +		if ((line >= (store_lines - VCR_HACK_LINES)) &&
> +		    (btv->opt_vcr_hack ||
> +		    (V4L2_FIELD_HAS_BOTH(btv->field) ||
> +		     btv->field == V4L2_FIELD_ALTERNATE)))
>  			continue;
>  		while (offset && offset >= sg_dma_len(sg)) {
>  			offset -= sg_dma_len(sg);

It is this change that causes the issue: basically the condition
(V4L2_FIELD_HAS_BOTH(btv->field) || btv->field == V4L2_FIELD_ALTERNATE)
is almost always true (it is only false for FIELD_TOP/BOTTOM), so it is
as if vcr_hack is always turned on.

It looks to me like some debug code accidentally ended up in this patch.
Reverting this change makes everything look good again (Christian, it would
be great if you can confirm that this also fixes the issue for you!).

Deb, can you remember anything about this change?

Regards,

	Hans



