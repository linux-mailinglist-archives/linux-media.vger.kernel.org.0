Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE4F192DD9
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 17:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbgCYQLM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 12:11:12 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:48321 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727592AbgCYQLM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 12:11:12 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id H8cUjfvjnBr2bH8cXjIUDQ; Wed, 25 Mar 2020 17:11:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585152670; bh=N1aL72K74dVq4OM/Q+SULOX0XMZFbM+AJ/jCHEDufw0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bmTqHC6OqA4fM3fg5VDRTJM3Bez6YyzANlbWRV4Jr3egFqpVc+y+/mc/Bfofi4GLG
         4eHDr62SJKh3XqjGbD/St8nBDC7uqU7ctD02HTZF69ZOmiYv50W5oin9Y/2WIDwpL9
         g2EqSY9Dq3iv6GFKFCA7meRswd50wOfAyhEE6jGkK2S8PqZVShzdJzhF4TbFCppvOT
         tBG3fprCuhyE0V49IdmzbHxDE0/KJJJZAx0QJr30hko5xSsEAim+NfWZS8ZVzrfNDk
         NfHNUOWjk7cqLUEl8C73y3aENh7jG80qFnHZ6DQMHwWiRxP4SoZJBGcZ6tKNDbHEPX
         xF+SaZmWRAQcA==
Subject: Re: [GIT PULL FOR v5.7] ti-vpe/cal and imx7-mipi-csis cleanups/fixes
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <64c740ae-3ebd-cec3-14f4-e65f2cb53af3@xs4all.nl>
 <20200325170623.57804089@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5bb2ec02-0e28-c4e0-a87d-ce8927a05ec0@xs4all.nl>
Date:   Wed, 25 Mar 2020 17:11:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200325170623.57804089@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCyRsWebFqEtSYv349xvAi/Y4w3psyqjPu/6oRW5RbXIdiPA8YkYafdelNrMZ+W3uGwDb9BBnpi4eo4SlhW3q260ugjBSwCdM3kV9zfT+VDKI0UzlHan
 bWr/Q6pjbwBvrzbxtDmaq7NSdMJY9aqBpRIKmhXtXYBDSepvbb00IJPhCDIMSZBT8caKRQHWrmBssdlyzpgVOZSqcmiXFz6XBr+aaR+Oi1mMn7SEqsCNg2Rg
 K1HVTDeYfUoXa4qLHZS8x6RZKcnCGRe1gOIaCeZ/ukI71dJRGiAqypFy0rQqFWud
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/25/20 5:06 PM, Mauro Carvalho Chehab wrote:
> Em Wed, 25 Mar 2020 14:51:55 +0100
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> The following changes since commit ad71693f41aa60217eaf1c29afb49b3aa0a2db5d:
>>
>>   media: mtk-vpu: load vpu firmware from the new location (2020-03-24 17:11:47 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7n
>>
>> for you to fetch changes up to 938b4f6cbbd7c7bd2236f4594ef37431c519f7a7:
>>
>>   media: ti-vpe: cal: fix stop state timeout (2020-03-25 13:21:59 +0100)
>>
>> ----------------------------------------------------------------
>> Tag branch
>>
>> ----------------------------------------------------------------
>> Laurent Pinchart (14):
> ...
> 
>> Tomi Valkeinen (19):
> ...
> 
>>  drivers/media/platform/ti-vpe/cal.c        | 397 ++++++++++++++++++++++++++++++---------------------
>>  drivers/media/platform/ti-vpe/cal_regs.h   |  21 +--
>>  drivers/staging/media/imx/imx7-mipi-csis.c | 446 ++++++++++++++++++++++++++++++++++++----------------------
>>  3 files changed, 518 insertions(+), 346 deletions(-)
> 
> That sounds too much for a late pull request. Any of the patches here
> are fixing a regression? Otherwise, I'll likely postpone merging it
> only after the merge window.

I expected that anyway :-)

I forgot to update the subject line to say 5.8, my fault.

Regards,

	Hans
