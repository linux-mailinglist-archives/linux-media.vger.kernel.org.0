Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBB62DBE4
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 13:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfE2LcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 07:32:15 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:34015 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725894AbfE2LcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 07:32:15 -0400
Received: from [IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e] ([IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VwoWh76fV3qlsVwoXhtJaR; Wed, 29 May 2019 13:32:13 +0200
Subject: Re: [GIT PULL FOR v5.3] Add ZynqMP VCU/Allegro DVT H.264 encoder
 driver
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>
References: <4d45c05b-8b24-6f35-a891-4646c8e1e1f5@xs4all.nl>
 <20190529080713.03f47ab8@coco.lan>
 <ae133543-8f1e-e0b4-1086-8fc8b4fcd7f4@xs4all.nl>
Message-ID: <c90e38a5-3bb7-2e8f-8e06-e3d7676058a1@xs4all.nl>
Date:   Wed, 29 May 2019 13:32:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ae133543-8f1e-e0b4-1086-8fc8b4fcd7f4@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNug04sSlA5PYKLoDcKwVKcRVuUSILfesfGR0ywYR2UE1OUFMYaBo4Kxq8cs5t/iOTWk0Li2HaLq58CkEDazWykjl1L2TybiMshhRGkkt98E8cjd0394
 d542mitXDTsZbqZ8h1v4l0XeYBchl6xsz0BpzQdDm+NGpBXaG2DKKQyyrVJ9endLjZjky9t1SzSbaLPhMYF4t7R31xL/O10Zpu0bvOd9HsIKRlTasbD8CRsh
 fNotwyXEbJnkP5Qmu5MiqhfaBwgf1nnUDwBMiKgtcq9x90OdYUoLybSbnNuAXcu0w1yE55Ki3DNTgNcRxAqLtdjSr5cmiA27yif4cWrUBf1AsEi0jOEJF7nt
 Y7ezuu+8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/29/19 1:29 PM, Hans Verkuil wrote:
> On 5/29/19 1:07 PM, Mauro Carvalho Chehab wrote:
>> Em Tue, 28 May 2019 20:10:27 +0200
>> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>>
>>> The following changes since commit 9bec226d8c79fcbc95817b082557f72a79d182f5:
>>>
>>>   media: v4l2-pci-skeleton.c: fix doc warning (2019-05-28 13:14:28 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3f
>>>
>>> for you to fetch changes up to 75e52767fa3d58a783dd6862a7fb686e5de67fc6:
>>>
>>>   allegro: add SPS/PPS nal unit writer (2019-05-28 20:00:26 +0200)
>>>
>>> ----------------------------------------------------------------
>>> Tag branch
>>>
>>> ----------------------------------------------------------------
>>> Hans Verkuil (1):
>>>       videobuf2-v4l2: set last_buffer_dequeued in dqbuf
>>>
>>> Michael Tretter (4):
>>>       media: dt-bindings: media: document allegro-dvt bindings
>>>       media: dt-bindings: media: Add vendor prefix for allegro
>>>       allegro: add Allegro DVT video IP core driver
>>>       allegro: add SPS/PPS nal unit writer
>>
>> As this is staging, merged, but there's something wrong with DT here:
>>
>> WARNING: DT compatible string vendor "allegro" appears un-documented -- check ./Documentation/devicetree/bindings/vendor-prefixes.yaml
>> #3013: FILE: drivers/staging/media/allegro-dvt/allegro-core.c:3013:
>> +	{ .compatible = "allegro,al5e-1.1" },
>>
>> Please send a followup patch addressing it.
> 
> Huh? Something went wrong: this is the patch that is in my for-v5.3f branch:
> 
> https://git.linuxtv.org/hverkuil/media_tree.git/commit/?h=for-v5.3f&id=ae4e36dd1945380ccd97090d2099f67be9a976d8
> 
> That's not what you tried to merge.

Never mind.

The cause is that the change to vendor-prefixes.yaml was done after the change
to allegro.txt. Those two patches should have been swapped.

So nothing is wrong.

Regards,

	Hans
