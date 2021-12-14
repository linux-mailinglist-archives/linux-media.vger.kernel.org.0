Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5827474D45
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 22:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbhLNVhS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 16:37:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhLNVhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 16:37:18 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA889C061574
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 13:37:17 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so17191582wmj.5
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 13:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EzrwyP7c7S34aGSSRG8kXAIbMzVIltUuUNeJlobVF+M=;
        b=R71Hn32ZiC8+LOTsQB46bAiGRVFqzMiwVPRSpePOk9oXzTPQZg+jWUHLy7YVhs3kXf
         C02lG0SaMQ48z7pKLcAaKH+oGidTlOcps/jMnTIXtUbAYkyxIw5vDC6j+Zs7RE67wqNs
         Xnh/djqbWCG+UjAotJaQth1luxshZZhv+xwvN99P/m4spkoVp1QX8CwKxJ1DIAVbNL43
         McVQhVkO95pp5+IShIGoemA4iUenuyoxFgzJcP7HXJwv08ABgTapalBmjBtr2zLf3u4K
         l1nFPdRI8l3A87quvcdtWWIJEuJbHW+kXIMdXoPsmDiRoift9m1BYBaJ+jPfK8MffERi
         EL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EzrwyP7c7S34aGSSRG8kXAIbMzVIltUuUNeJlobVF+M=;
        b=dhIdHdZHNfZb0KkVY7aJGqTvoQjmtxQ6IUotKSPxGQydEIDXuTEslnJMl1O4Lb/R65
         fnm9KbIHj0oITzkYDoXLG+2EbVIYe1lUA2RezP0iqdN4s5bfygLANtM4VmUWsMrbZFQs
         DU5C+TSt+ifQ8QmmIEHwjMqs0oauxU3tbYJyYpUomX1y7g7mZLP2MXYuJTvmiAA0xT95
         6erKl5U8g/9IMciQp0ovIZxgWPwcXS/S43reFPWCh+842zjhRj07QUzgkByo6RinW6Nx
         5m736zW1ohbSYIS6CSsc9jtui81cK2RONXWcAUH0EP66i5w5XDMQ45gX3a9okVYxY940
         UeTA==
X-Gm-Message-State: AOAM532wz/AtDQWN/H9J6hAcDaxvuxYu9guaPjtAGKYNVAAnee7k3B5N
        8Rkc11cfQgxdYvzGSCoI2Hw=
X-Google-Smtp-Source: ABdhPJzxmJVyRpOCKM/4hNLh2XV2KHNLkk/utBSjEE53KEGK4SH0OPXugMzR8UVhcumP11Rpz7dpvg==
X-Received: by 2002:a05:600c:3c85:: with SMTP id bg5mr1792776wmb.58.1639517836347;
        Tue, 14 Dec 2021 13:37:16 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w17sm38587wmc.14.2021.12.14.13.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 13:37:15 -0800 (PST)
Subject: Re: [PATCH 3/5] media: entity: Skip non-data links in graph iteration
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211213232849.40071-4-djrscally@gmail.com>
 <Ybixw0dIZyC6wQL4@paasikivi.fi.intel.com>
 <955c5e8e-d898-9987-4f21-f7dacb6b178e@gmail.com>
 <YbkLBobSglC1sgsF@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <e6d79347-0fc7-9e94-f968-e630ac87d451@gmail.com>
Date:   Tue, 14 Dec 2021 21:37:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbkLBobSglC1sgsF@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On 14/12/2021 21:22, Sakari Ailus wrote:
> Hi Daniel,
>
> On Tue, Dec 14, 2021 at 04:14:21PM +0000, Daniel Scally wrote:
>> Hi Sakari
>>
>> On 14/12/2021 15:01, Sakari Ailus wrote:
>>> Hi Daniel,
>>>
>>> On Mon, Dec 13, 2021 at 11:28:47PM +0000, Daniel Scally wrote:
>>>> When iterating over the media graph, don't follow links that are not
>>>> pad-to-pad links.
>>>>
>>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>>> ---
>>>> Changes since the rfc:
>>>>
>>>> 	- new patch
>>>>
>>>>  drivers/media/mc/mc-entity.c | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>>>> index d79eb88bc167..aeddc3f6310e 100644
>>>> --- a/drivers/media/mc/mc-entity.c
>>>> +++ b/drivers/media/mc/mc-entity.c
>>>> @@ -325,6 +325,14 @@ static void media_graph_walk_iter(struct media_graph *graph)
>>>>  
>>>>  	link = list_entry(link_top(graph), typeof(*link), list);
>>>>  
>>>> +	/* If the link is not a pad-to-pad link, don't follow it */
>>> This comment should mention data links, not pad-to-pad links.
>>
>> I wondered about the terminology of this actually...since we create
>> those links with media_create_pad_link(), and they're called pad-to-pad
>> links in the documentation [1], but in other cases called data links. Do
>> we need to fix those other references too?
>>
>>
>>
>> [1] https://www.kernel.org/doc/html/v5.0/media/kapi/mc-core.html#links
> Good point.
>
> There were only one type of links before the interface links were
> introduced. Some of the documentation seems to discuss pad links whereas
> the corresponding macro name is MEDIA_LNK_FL_DATA_LINK. What the links
> really represent is flow of data.
>
> It would be good to align this, although that should probably be done in a
> different context from this patchset.
>
Ack; I'll fix the comment as you suggested for now
