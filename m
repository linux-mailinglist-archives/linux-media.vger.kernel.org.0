Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C30BBB16
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 20:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440405AbfIWSQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 14:16:45 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:41440 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394280AbfIWSQp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 14:16:45 -0400
Received: by mail-io1-f49.google.com with SMTP id r26so35737786ioh.8
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 11:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aOvM/GrmXBZPpWJ3nhQUEcOKTgVL7wkyGq4dLu7R+Rg=;
        b=P5Gwnf+hPR1H8hxFTtb8irJmxnz4D8461CTwv7gJ0I1nS/rHdxOuLtDKCqSuMbdUG2
         ygKPsCaBPr18Iul4dRqKeEEbR7BTLUlciFKuOeVd97vMMVnQVwSvr00iQ94dkchInXA/
         q+q4iIUAOrzZaxqDIJ5MrhLxb56VPl6T6OnWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aOvM/GrmXBZPpWJ3nhQUEcOKTgVL7wkyGq4dLu7R+Rg=;
        b=CVGS5ziOh16EkGGKu3+nGzhBRIenId5G94ua+5075X1JVRBFVmkFVdpir98w3ctMMs
         aPhokSGoSpG7onAc5eT3ZiMkXYeFT6WpN35rlH8qrR0POooaJoEOevCCwKNmxhwprnf1
         kRdpj6d8ML8QAUfgOLkPNBG5HcQKrGZuyuvNRPy26JW95fnQD2NxuOpzO1FUpkAYEo5Y
         SdAV7y1X7IvXs20ff7Q5xjg1MK7KfR/m90qDdml+QTK//vkqdDSQ4INLl8vV0lqeObNA
         UTaizFPnhMKEt5qLRqa4VXrqgVONHpskN3WQnfaWlOudsqSmnFjdbkhAD0yKgC6BWdgz
         WHzw==
X-Gm-Message-State: APjAAAU6h6QpZT4IBROELpeOctUL8irjBuRmBan7JzDgMNWK2TlSZygz
        hy/XRqsxOL9onp89gaIphodJcg==
X-Google-Smtp-Source: APXvYqwqVOqtWZKHdkuRVMR7Ezw/4qlYjkFXfUH2jb671QaZSrN0/H+cNJNiyRhXkE8JjOnvuRz4mg==
X-Received: by 2002:a02:344a:: with SMTP id z10mr769396jaz.123.1569262604063;
        Mon, 23 Sep 2019 11:16:44 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v84sm20200066iod.10.2019.09.23.11.16.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 11:16:43 -0700 (PDT)
Subject: Re: [ANN] Media sessions in Lyon in October: libcamera
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
 <7f154b1ce154b75b352945cf05f6359393e9cc3b.camel@ndufresne.ca>
 <cd309f07-16c7-94bc-2de6-e0baa22080ff@ideasonboard.com>
 <20190923155709.GC5056@pendragon.ideasonboard.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <336f155e-9f1c-1df8-2761-8136cf8d201e@linuxfoundation.org>
Date:   Mon, 23 Sep 2019 12:16:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923155709.GC5056@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/23/19 9:57 AM, Laurent Pinchart wrote:
> Hello everybody,
> 
> On Mon, Sep 23, 2019 at 04:03:54PM +0100, Kieran Bingham wrote:
>> On 23/09/2019 15:47, Nicolas Dufresne wrote:
>>> Le lundi 23 septembre 2019 à 16:21 +0200, Hans Verkuil a écrit :
>>>> Hi all,
>>>>
>>>> Since we have three separate half-day sessions for different topics I decided
>>>> to split the announcement for this in three emails as well, so these things
>>>> can be discussed in separate threads.
>>>>
>>>> All sessions are in room Terreaux VIP Lounge - Level 0.
>>>> There is a maximum of 15 people.
>>>>
>>>> The second session deals with libcamera and is on Wednesday morning
>>>> from 9:00 to 13:00.
>>>>
>>>> Attendees for this session:
>>>>
>>>> Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> Unfortunately I can no longer attend ELCE.
>>
>> (My second baby will be a bit too new for an extended stay away from home)
>>
>>>> Boris Brezillon <boris.brezillon@collabora.com>
>>>> Alexandre Courbot <acourbot@chromium.org>
>>>> Tomasz Figa <tfiga@chromium.org>
>>>> Ezequiel Garcia <ezequiel@collabora.com>
>>>> Daniel Gomez <daniel@qtec.com>
>>>> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>> Eugen Hristev <Eugen.Hristev@microchip.com>
>>>> Shuah Khan <skhan@linuxfoundation.org>
>>>> Helen Koike <helen.koike@collabora.com>
>>>> Jacopo Mondi <jacopo@jmondi.org>
>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Niklas Söderlund <niklas.soderlund@ragnatech.se>
>>>> Hans Verkuil <hverkuil@xs4all.nl>
>>>>
>>>> If I missed someone, or you are on the list but won't attend after all, then
>>>> please let me know.
>>>
>>> I would like to join this one to, as after ELCE I should have some time
>>> to spend on this. I understand thought hat this would make use reach
>>> the limit, let me know if there is any issues, I can spare my seat if
>>> needed.
>>
>> You now have my seat, and I've just made you a required attendee to go
>> in my place :-D
> 
> Thank you for the offer Kieran.
> 
> We're reaching the room capacity, and I know of several people who may
> attend ELCE and would be beneficial for the discussions. If anyone in
> the above list only has a general curiosity about libcamera but doesn't
> expect to really contribute to the discussions, and would consider
> giving their seat if required, could you please let me know ?
> 

Looks like I have a conflict with my talk for the an hour so towards the
end of this morning session. I might as well give up my seat so it can
be given to somebody that can attend the session in full.

I am attending the afternoon session on Wednesday.

thanks,
-- Shuah
