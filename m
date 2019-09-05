Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7F2A9B76
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 09:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731628AbfIEHPg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 03:15:36 -0400
Received: from c.mail.sonic.net ([64.142.111.80]:43790 "EHLO c.mail.sonic.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730937AbfIEHPg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 03:15:36 -0400
Received: from [192.168.23.254] (bastion.ponzo.net [69.12.218.213])
        (authenticated bits=0)
        by c.mail.sonic.net (8.15.1/8.15.1) with ESMTPSA id x857FXl5007709
        (version=TLSv1.2 cipher=AES128-SHA bits=128 verify=NOT);
        Thu, 5 Sep 2019 00:15:34 -0700
Subject: Re: hdpvr.ko kernel 5.3-rc6
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <7530b881-c7d0-74fd-dfeb-5e001d8b2266@ponzo.net>
 <5a6ab1fe-9776-961d-970b-5b3dbea12da1@xs4all.nl>
 <839e8ded-dfe5-9fc9-1573-2d64aa547e1c@ponzo.net>
 <00b89589-5558-f8a1-3fb7-c631002e11bd@xs4all.nl>
 <152b2b02-67be-a5ba-6283-1b81d59c145f@xs4all.nl>
 <75f04282-7625-4c7e-7e94-c45195a152b5@ponzo.net>
 <20190904154001.6a6109f9@coco.lan>
From:   Scott Doty <scott@ponzo.net>
Message-ID: <91f1362c-20a6-f4f0-2491-d34c0332a8a0@ponzo.net>
Date:   Thu, 5 Sep 2019 00:15:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904154001.6a6109f9@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVaxtA6WVLgnNl89KXFUiP8rQFUXFGEi0S+o4Hg31szIhY+rRoy+lhmsOT3fxxmZR3eLjuF+SyGxfKarTUnBBr1j
X-Sonic-ID: C;lAuR86zP6RGSm9JF5axgbQ== M;8CCd86zP6RGSm9JF5axgbQ==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/4/19 11:40 AM, Mauro Carvalho Chehab wrote:

> You can use any of them, provided that it is opened as if it were a
> normal file, using the read() interface. For example, this should work:
> 
> 	cat /dev/videoX | mplayer -cache 8000 -
> 
> The thing is that most apps assume that a V4L2 device supports mmap().
> 
> This is true for almost all devices, being hdpvr - and pvrusb - two
> exceptions.


That works, and this works:

_[/tmp]_(scott@eva)_
$ cat /dev/video2 | vlc --prefetch-buffer-size 8192 -

So I've learned something more about the driver (and the direction
playback apps have gone).  Thank you very much for the assist. :)

 -Scott
