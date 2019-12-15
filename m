Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B45111F898
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 16:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfLOPqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 10:46:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:33128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726204AbfLOPqB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 10:46:01 -0500
Received: from localhost (unknown [73.61.17.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A00F206E0;
        Sun, 15 Dec 2019 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576424760;
        bh=NfrKCM3tIFO2ZvqznB5sHR9LGK5hvYo3yOAuCBRzagk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ETuD1CqWvRvcCfDrJSq14uRk2s3JxN6lKf5Dhm9lBKYeoKwd0VDL4jM+rviRtopBJ
         Y3wh8ie157epT6EveTikD2fO+0XNdROSc3otg/JHhvkbdHjhNCeo5pDyQWN/X8M/fG
         F9Jcqw9BU8HLI+eFAo7tJ9Iqs2ynclw6hXnaNLMs=
Date:   Sun, 15 Dec 2019 10:45:53 -0500
From:   Sasha Levin <sashal@kernel.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        koji.matsuoka.xm@renesas.com, takeshi.kihara.df@renesas.com,
        harunobu.kurokawa.dn@renesas.com, khiem.nguyen.xt@renesas.com,
        hien.dang.eb@renesas.com
Subject: Re: [PATCH] media: vsp1: tidyup VI6_HGT_LBn_H() macro
Message-ID: <20191215154553.GA18043@sasha-vm>
References: <redmine.issue-245033.20191211005426@dm.renesas.com>
 <redmine.issue-245033.20191211005426.161918957b73008d@dm.renesas.com>
 <87k173bp76.wl-kuninori.morimoto.gx@renesas.com>
 <fb1648d4-3949-01c1-7d13-679b9b8540dd@ideasonboard.com>
 <20191211175811.GC4863@pendragon.ideasonboard.com>
 <b8891c8c-fefe-5728-f792-a56da08bd7aa@ideasonboard.com>
 <20191212073306.GB1364286@kroah.com>
 <6808431b-a5d0-0720-b276-ed8333fb26d5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6808431b-a5d0-0720-b276-ed8333fb26d5@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 13, 2019 at 11:55:14AM +0000, Kieran Bingham wrote:
>Hi Greg, Laurent, Sasha,
>
>On 12/12/2019 07:33, Greg Kroah-Hartman wrote:
>> On Wed, Dec 11, 2019 at 09:58:11PM +0000, Kieran Bingham wrote:
>>> Hi Laurent,
>>>
>>> +Greg, +Sasha to opine on the merit of whether this should go to stable
>>> trees (for my future learning and understanding more so than this
>>> specific case)
>>>
>>> On 11/12/2019 17:58, Laurent Pinchart wrote:
>>>> Hello,
>>>>
>>>> On Wed, Dec 11, 2019 at 12:59:57PM +0000, Kieran Bingham wrote:
>>>>> Hi Morimoto-san,
>>>>>
>>>>> Thank you for the patch,
>>>>
>>>> Likewise :-)
>>>>
>>>>> On 11/12/2019 01:55, Kuninori Morimoto wrote:
>>>>>>
>>>>>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>>>>
>>>>>> The address of VSP2_VI6_HGT_LBx_H are
>>>>>> 	VSP2_VI6_HGT_LB0_H : 0x3428
>>>>>> 	VSP2_VI6_HGT_LB1_H : 0x3430
>>>>>> 	VSP2_VI6_HGT_LB2_H : 0x3438
>>>>>> 	VSP2_VI6_HGT_LB3_H : 0x3440
>>>>>>
>>>>>> Thus, VI6_HGT_LBn_H() macro should start from 0x3420 instead of 0x3430.
>>>>>> This patch fixup it.
>>>
>>> s/fixup/fixes/
>>>
>>>
>>>>> I think this deserves a fixes tag:
>>>>>
>>>>> Fixes: 26e0ca22c3b8 ("[media] v4l: Renesas R-Car VSP1 driver")
>>>>
>>>> Given that this macro is not used, we could argue that it doesn't fix
>>>> anything yet :-) I'd rather avoid having this backported to stable
>>>> kernels as it's not useful to have it there, and thus not add a Fixes
>>>
>>> I'm sorry - I'm not sure I can agree here, Do you know that no one will
>>> use this macro when they back port the HGT functionality to an LTSI kernel?
>>>
>>> We know the Renesas BSP uses LTSI kernels, and the very nature of the
>>> fact that this typo has been spotted by the Renesas BSP team suggests
>>> that they are indeed looking at/using this functionality ...
>>>
>>> (Ok, so maybe they will thus apply the fix themselves, but that's not my
>>> point, and if they 'have' to apply the fix - it should be in stable?)
>>>
>>> It feels a bit presumptuous to state that we shouldn't fix this because
>>> /we/ don't utilise it yet, when this issue is in mainline regardless ...
>>
>> Nothing should be in the kernel tree that is not already used by
>> something in that specific kernel tree.  We don't care about out-of-tree
>> code, and especially for stable kernel patches, it does not matter in
>> the least.
>
>So perhaps this patch should actually remove this macro rather than fix it?
>
>> If you have out-of-tree code, you are on your own here, sorry.
>>
>> So no, no backporting of stuff that no one actually uses in the codebase
>> itself.
>
>Ok understood, It was really the 'the macro exists in the kernel, but is
>wrong' part that got me.
>
>Along with the fact that we now have various automated machinery that
>would likely pick this patch up and backport it anyway?
>
>(Sasha, is that assumption accurate? Or would you/your system have
>identified that this macro is not used?)

No, it would have likely just backported it.

The right thing to do is to just remove the macro if no one is using it.

-- 
Thanks,
Sasha
