Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70F3C33CFA2
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 09:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234444AbhCPIVf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 04:21:35 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:40767 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234417AbhCPIVW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 04:21:22 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M4x1l0ZIR4ywlM4x4lADjJ; Tue, 16 Mar 2021 09:21:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615882879; bh=AHNyczeZhzRzA1wPfTPxhjvuXgjaH/hVRMnFAtLIzog=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=anlPt0Qo+J3s6UvHR2Wgx0t6Wdrvv8wevlRcDNsKDAt8t9s1x4ABo8lEJzmP9PUPp
         AZE5FA6zvabVLhQl0rK1k4Ncbx64j0O7vRL+UujLvI4Q76ymNcHWdVuOmPK0QAcOJ3
         0jKli9M+1RO9LkcTMYg9cwlErh14uKtpmo6AjmQloH3pJdgTBf4V9wGN7bZH8X+yCg
         R1S64Mk5FiS37mJ292orBCPzL9wszj7WPGz33aqNaK0aYnVjGlKCet3v5oknGSbFh0
         apgfaNAiwdweFUkWdTl0CnR/KP9X/ZhYkiVHX5BSf3P5BKhhJ3KSOzIbr3Rm+6MUJs
         DwClhneGx6OpQ==
Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-3-biju.das.jz@bp.renesas.com>
 <133f8b63-3b84-c60a-725d-30b8d6df35dd@ideasonboard.com>
 <OS0PR01MB5922BE9F9D151623773CF53286919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <56c2d53e-8d1f-5b84-1480-5965ae9cbae2@ideasonboard.com>
 <OS0PR01MB5922ABCA7A782950B63DCA6686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YE7XwWVZeOZ+HsYx@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c757d90e-da85-6862-36fc-2343795de4b4@xs4all.nl>
Date:   Tue, 16 Mar 2021 09:21:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YE7XwWVZeOZ+HsYx@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOxqULdCsye68NSuxO/k9cZa3gsMvTUdSCRP/n1dXXIP51aIuDCR1ywgFXopehDLjCKm3HoIX+6Hsq2jr/4u/aNHvkCYzUN4cXDojx4U1klpwjEXGw91
 dIiMsQa0hlKNXGfUUc+K6tARE+ayZr/8cblEo/ZOFanGnFu+KdK2gUIGQQi8Ky/HBCEVa7g7Vh8qEwQVHIUB9vKcPkpXWQ1GHiyhCruRs/O4emhQ7990BFJU
 uExEDeW6PpgEaRO/ql0721lYMFBzsmp2fxJFWWW3AzP9H/fovsNkIHPH1KEDSo8y3dv0uPd20HfJ9Gg/zmahzdCz29Hc8uCiH7Sy93xjWVzDh+9QBcfGw58u
 ekB722O4jTbOf3AkR9JQ0PqUz6BZBj2rHBcfx9UCXMG3MShncCFoEcwBMS2rlvu252U5KhklNXVEUbyBJkSin5uMzH3sO9+SxFP3Y+JegnFM71j53o00+vAI
 Q8wvjBsUFDd+za51e42VeqOqLUAVlJB+8JSIufb2L+Yqe1adXXGz2gqx2OxEOJ03VM2HoSnyxCMqZtDN2ASbyPZKvrNrvtvJBgPFljNTBqapxF9n+SdpuRXT
 ocBzTisHitOT2mf3FhgdYqTO
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/03/2021 04:42, Laurent Pinchart wrote:
> Hi Biju,
> 
> On Wed, Mar 10, 2021 at 02:50:23PM +0000, Biju Das wrote:
>>> On 10/03/2021 13:56, Biju Das wrote:
>>>> Thanks for the feedback.
>>>>> Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer
>>>>> access
>>>>>
>>>>> Hi Biju,
>>>>>
>>>>> On 01/03/2021 12:08, Biju Das wrote:
>>>>>> RZ/G2L SoC has no UIF. This patch fixes null pointer access, when
>>>>>> UIF module is not used.
>>>>>>
>>>>>> Fixes: 5e824f989e6e8("media: v4l: vsp1: Integrate DISCOM in display
>>>>>> pipeline")
>>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>> ---
>>>>>>  drivers/media/platform/vsp1/vsp1_drm.c | 4 ++--
>>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c
>>>>>> b/drivers/media/platform/vsp1/vsp1_drm.c
>>>>>> index f6d2f47a4058..06f74d410973 100644
>>>>>> --- a/drivers/media/platform/vsp1/vsp1_drm.c
>>>>>> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
>>>>>> @@ -462,9 +462,9 @@ static int vsp1_du_pipeline_setup_inputs(struct
>>>>>> vsp1_device *vsp1,
>>>>>
>>>>>
>>>>> This looks like it complicates these conditionals more than we
>>>>> perhaps need to.
>>>>>
>>>>> What do you think about adding something above the block comment here?:
>>>>
>>>> It is much better.
>>>>
>>>> This patch is accepted in media tree[1]. So not sure, should I send a
>>>> follow up patch as optimization or drop this patch and send new one.
>>>
>>> Oh, I didn't realise these were in already. Sorry, I didn't see any review
>>> on the list, and it was the earliest I had got to them.
>>>
>>>> Please suggest.
>>>
>>> Up to you, I don't think this would get dropped now it's integrated.
>>> It's in, so if you want to update on top I believe that's fine.
>>
>> OK, Will send follow up patch as optimization.
> 
> That would be nice.
> 
> I don't think this patch should have been fast-tracked as a fix, as
> RZ/G2L isn't supported in mainline yet as far as I can tell.
> 
> Hans, next time, could we get a notification instead of a silent merge ?

My apologies, it seemed a trivial fix, but I should have checked with you.

I jumped the gun here :-(

Regards,

	Hans

> 
>>>>> 	if (!drm_pipe->uif)
>>>>> 		return 0;
>>>>>
>>>>>
>>>>>>  	 * make sure it is present in the pipeline's list of entities if it
>>>>>>  	 * wasn't already.
>>>>>>  	 */
>>>>>> -	if (!use_uif) {
>>>>>> +	if (drm_pipe->uif && !use_uif) {
>>>>>>  		drm_pipe->uif->pipe = NULL;
>>>>>> -	} else if (!drm_pipe->uif->pipe) {
>>>>>> +	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {>
>>>>> 	drm_pipe->uif->pipe = pipe;
>>>>>>  		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
>>>>>>  	}
>>>>>>
> 

