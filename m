Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D338A9AFD
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 08:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731491AbfIEG7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 02:59:31 -0400
Received: from d.mail.sonic.net ([64.142.111.50]:35122 "EHLO d.mail.sonic.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfIEG7b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 02:59:31 -0400
Received: from [192.168.23.254] (bastion.ponzo.net [69.12.218.213])
        (authenticated bits=0)
        by d.mail.sonic.net (8.15.1/8.15.1) with ESMTPSA id x856xTCj017452
        (version=TLSv1.2 cipher=AES128-SHA bits=128 verify=NOT);
        Wed, 4 Sep 2019 23:59:29 -0700
Subject: Re: hdpvr.ko kernel 5.3-rc6
From:   Scott Doty <scott@ponzo.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <7530b881-c7d0-74fd-dfeb-5e001d8b2266@ponzo.net>
 <5a6ab1fe-9776-961d-970b-5b3dbea12da1@xs4all.nl>
 <839e8ded-dfe5-9fc9-1573-2d64aa547e1c@ponzo.net>
 <00b89589-5558-f8a1-3fb7-c631002e11bd@xs4all.nl>
 <152b2b02-67be-a5ba-6283-1b81d59c145f@xs4all.nl>
 <75f04282-7625-4c7e-7e94-c45195a152b5@ponzo.net>
Message-ID: <9b5b96a9-fc14-521f-4b03-772992e57275@ponzo.net>
Date:   Wed, 4 Sep 2019 23:59:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <75f04282-7625-4c7e-7e94-c45195a152b5@ponzo.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Sonic-CAuth: UmFuZG9tSVax2WJOCWXmrDmN24NP7BhGtYzD4W4Vx8Ny6qFk6rY9HI1pTxHRANZMpjaHJl7vdlntxnSZxEEvk/3HYAr3739G
X-Sonic-ID: C;xIO7tKrP6RGMQNopn23GFg== M;PKfjtKrP6RGMQNopn23GFg==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/4/19 11:13 AM, Scott Doty wrote:
> 
> On 9/3/19 1:34 AM, Hans Verkuil wrote:
>>
>> Never mind, hdpvr uses read(), not streaming I/O. Of course this
>> doesn't work...
>>
>> Just plain 'cat /dev/videoX >x.mpg' will do.
>>
>>
> 
> Okay, tried that, it produces data that vlc can then play back.
> 
> So I think I'm running into a problem with vlc instead of hdpvr. It's
> just weird that mplayer, vlc, and ffplay would all three be unable to
> use it.
> 
> I'm at work atm, will plug it back in when I get home and see for how
> long it will read data with cat.
> 
> Thank you for looking, now I feel a bit dumb.
> 
>  -Scott
> 

Yep, reads indefinitely.

_[/tmp]_(scott@eva)_
$ time -p cat /dev/video2 > out5.ts
^C
real 45.49
user 0.00
sys 0.27
_[/tmp]_(scott@eva)_
$ time -p cat /dev/video2 > out6.ts

Furthermore, I can run "vlc out6.ts",  and it will play the file until
it reaches the end (which it won't, if I keep writing to it).

So this appears to be a problem in userland.  My apologies for reporting
otherwise.

 -Scott
