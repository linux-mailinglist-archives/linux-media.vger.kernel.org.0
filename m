Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45FD1A911F
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 21:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390302AbfIDSNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 14:13:39 -0400
Received: from c.mail.sonic.net ([64.142.111.80]:60712 "EHLO c.mail.sonic.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390713AbfIDSNh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Sep 2019 14:13:37 -0400
Received: from spc.noc.sonic.net (spc.noc.sonic.net [64.142.18.26])
        (authenticated bits=0)
        by c.mail.sonic.net (8.15.1/8.15.1) with ESMTPSA id x84IDapY001595
        (version=TLSv1.2 cipher=AES128-SHA bits=128 verify=NOT);
        Wed, 4 Sep 2019 11:13:36 -0700
Subject: Re: hdpvr.ko kernel 5.3-rc6
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <7530b881-c7d0-74fd-dfeb-5e001d8b2266@ponzo.net>
 <5a6ab1fe-9776-961d-970b-5b3dbea12da1@xs4all.nl>
 <839e8ded-dfe5-9fc9-1573-2d64aa547e1c@ponzo.net>
 <00b89589-5558-f8a1-3fb7-c631002e11bd@xs4all.nl>
 <152b2b02-67be-a5ba-6283-1b81d59c145f@xs4all.nl>
From:   Scott Doty <scott@ponzo.net>
Message-ID: <75f04282-7625-4c7e-7e94-c45195a152b5@ponzo.net>
Date:   Wed, 4 Sep 2019 11:13:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <152b2b02-67be-a5ba-6283-1b81d59c145f@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Sonic-CAuth: UmFuZG9tSVYl5KSGIvo2VjFeanWvMVanfc3yn5d1Oq7HihE6qHc2rc0Ra3Qf1+wsZnglsUjUDTnhk067LV0tUpuNmY/zZ+Ls
X-Sonic-ID: C;4JGltj/P6RGMRNJF5axgbQ== M;DNyxtj/P6RGMRNJF5axgbQ==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 9/3/19 1:34 AM, Hans Verkuil wrote:
>
> Never mind, hdpvr uses read(), not streaming I/O. Of course this
> doesn't work...
>
> Just plain 'cat /dev/videoX >x.mpg' will do.
>
>

Okay, tried that, it produces data that vlc can then play back.

So I think I'm running into a problem with vlc instead of hdpvr. It's 
just weird that mplayer, vlc, and ffplay would all three be unable to 
use it.

I'm at work atm, will plug it back in when I get home and see for how 
long it will read data with cat.

Thank you for looking, now I feel a bit dumb.

  -Scott


