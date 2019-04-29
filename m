Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7D0E1BF
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 14:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbfD2MAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 08:00:43 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:58553 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727913AbfD2MAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 08:00:43 -0400
Received: from [192.168.2.10] ([46.9.232.72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L4xZhM1IOb8gSL4xch8Xvv; Mon, 29 Apr 2019 14:00:41 +0200
Subject: Re: [PATCH v11 0/7] [media] Add analog mode support for Medion
 MD95700
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc:     Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org
References: <cover.1556365459.git.mail@maciej.szmigiero.name>
 <9a0d5e31-120b-c0fa-7782-c330a06c23b3@xs4all.nl>
 <370e45ab-5534-4e65-5631-5d7a2babcb19@maciej.szmigiero.name>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bc2ee280-8916-ad2c-0408-358d7c661366@xs4all.nl>
Date:   Mon, 29 Apr 2019 14:00:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <370e45ab-5534-4e65-5631-5d7a2babcb19@maciej.szmigiero.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOS1PtGx4+3MIgh1c3okRiC4p4wn8LiIp4ABM1QF0th54+9laJ9U7Yv7WRTf7V22a70/piRKc/1tPhiSODUr4vQhM9QCzL37wc8tcRfzoC8zC3/8/Zsr
 Wjx4ZpJ7HwKpTOelSM59g2xuqWEo4fXdEm5NV3Pm3TmgmwaBCIn1rjfghU+Sr5TsV06UEbJWrfoWRf6KxvtlJaeSnm4Uve6XIb1Ed1gCIHyR5hqyiZk3efQD
 Q750aac7qaVfeouKuGRzeWPUESEvoQIaAJRTHGttFSiFTSX4TNI4dJUqrieNDbHmXTLTHdvhXO1A3DrmObMAPBZfi+wKfTsZ2XYZ8tSwQtpJGAqv3taw2GV4
 HKqLm+zT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/29/19 1:42 PM, Maciej S. Szmigiero wrote:
> Hi Hans,
> 
> On 29.04.2019 10:17, Hans Verkuil wrote:
>> Hi Maciej,
>>
>> I reviewed v11 and I had only two comments in two sources. Can you fix that
>> and post a v12?
> 
> Thanks for looking at this quickly, will do.
> 
>> Mike, once v12 is posted, can you try and test it on your hardware?
>>
>> The goal is to get this merged for 5.3.
>>
>> Maciej, just FYI: I won't merge the last patch. It's OK to post it, that
>> way it is archived if anyone is ever interested in this in the future, but
>> it's not something that we want to merge. It adds a new public API to enable
>> this, and that's not something we'd like to do unless there is a really
>> good reason. And adding a debug feature for old hardware isn't enough of a
>> reason. Sorry.
> 
> :(
> 
> I was hoping that maybe something like CONFIG_VIDEO_ADV_DEBUG will do the
> trick.
> 
> I'm afraid that if this is out-of-tree it will quickly bitrot since people
> will submit patches to "optimize" the in-kernel code unknowingly breaking
> compatibility with this patch.
> 
> But I respect your decision here.

If analog TV was still a hot new topic, then this would be interesting to add.
But the reality is that we see very little activity in that area. In fact, I'm
impressed by your perseverance with this patch series since you have been
working on this since 2017!

Regards,

	Hans
