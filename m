Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFAB3914F5
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 12:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233910AbhEZKee (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 06:34:34 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:59541 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233904AbhEZKed (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 06:34:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id lqqPlSim3WkKblqqSlCgfd; Wed, 26 May 2021 12:33:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622025180; bh=HfB+LUZU9bKstga47lx5+/7a3YOuP1UE5uU8dLDV1tA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=S/dppd7vME+SuXDlidavUZkVc/tHcDqeEqo1Ro2AC0c9WNU1PN8bCMbX4XxhzJCex
         hJkIKxNooJyR3hXSUpefBLuK1tGqj05fZHVIa16o+PKQ8zMpmma5Sle9tbbU/0yMgI
         cxlIKoQQyBRKy1RBdC5SdyDWsXZxRZx73QpkDFFXfNe+J0wVLFLMSDgvt7RoxfGbD3
         /SkwLPK0RPeP/+e1Qc5XmAERIHqawGdcTvup3Yze8Hx3bSsaAQCsLSTKXo9SBvbNIZ
         RdG3RxYaZCeMtzzXEkNVrwN6kinbH7T6f7gpP64XiDNepxzefXnJ9ToLEu0E6Iadl/
         Yg+UIoGWfVk6g==
Subject: Re: [PATCHv4 0/5] media: uvcvideo: implement UVC 1.5 ROI
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210430112611.475039-1-senozhatsky@chromium.org>
 <8a175117-d142-9265-65ee-43302bb82444@xs4all.nl>
 <YIy1suAHDrArv8fz@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a3610107-bfad-415b-10d9-41fa1c03b469@xs4all.nl>
Date:   Wed, 26 May 2021 12:32:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIy1suAHDrArv8fz@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMJXMizEQRxplhAcnqQNukeQ+o4fW7JvwVD4/JM4jCENfJHkYwHxxi6N4TJyA2d8SPmX2IgNoqnIzcxuxTRwD2Z+gDstF8XvAWNDb33mvs4E06erfKUr
 M7DjdDyxJ7T2NHTBtlWRmuC4G6zdKIpxwU45oD37NpzqyuTvpwwp0Dig96dKeKv2tUh0Q2cjDFfa4pJjS+4KgTEkJ0nTRVYSWeN1OMAd2d3q+LUEjIBVxfkC
 SG4tP2qpVbLMSgUydQVIupwK0u0HgOIDWfWeWstrJXEre72Z0rDpGfcA2LOXHdoiFKhbX+kgPism+7TTULNHoDhJh2B+RXeJbAYzuqdkptT3aemAhiYOEn4A
 34gzEF0nUb/hY4uwgivI0imBe3kz5GfNtV8+ApnyCr6muF4BKWry0ASVejoQgcLPKaNIG4e9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/05/2021 03:58, Sergey Senozhatsky wrote:
> Hi Hans,
> 
> On (21/04/30 14:49), Hans Verkuil wrote:
>> Hi Sergey,
>>
>> On 30/04/2021 13:26, Sergey Senozhatsky wrote:
>>> Hello,
>>>
>>> 	This patch set implements UVC 1.5 ROI using v4l2_selection API.
>>
>> Is the selection API the right approach for this? Wouldn't it make
>> sense to use controls instead?
> 
> [..]
> 
>> If this was discussed before, then can you give a me pointer to that discussion?
>> I couldn't find anything for that, but I didn't look very long for it :-)
> 
> I believe Tomasz raised this question over IRC back in the days and there
> was no clear conclusion at the end: selection API vs control - 50/50 split.
> After internal discussions we decided to go with the selection API.
> 
>> In any case, it doesn't really feel like it is the right API for this job.
> 
> Well, we pass a rectangle to the driver. The driver already knows what
> to do with some of those rectangles, we teach it to handle one more. So
> we don't introduce anything new, but use the existing API instead.
> 

Yes, but this works for only one ROI since the Selection API has no provision
for rectangle arrays, but with the upcoming dynamic array control support this
is trivial for controls. In addition, controls are already integrated in the
Request API, so this will automatically work with requests as well.

I don't remember being involved in the irc discussion (if I was, I don't remember
it), and that discussion definitely did not know about dynamic arrays since that's
brand new and not even merged yet and may even precede the Request API depending
on how long ago the irc discussion was.

I think being able to provide multiple ROI rectangles is an obvious feature in
general, even if UVC currently supports only a single rectangle. Ditto for being
able to use them in a request. You get both for free when using controls.

Before I can accept this series I think I need to have feedback from others
why they believe the Selection API is the right API to use.

Regards,

	Hans
