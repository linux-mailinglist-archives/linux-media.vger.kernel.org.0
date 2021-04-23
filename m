Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F195E369C96
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 00:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbhDWWbv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 18:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbhDWWbt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 18:31:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9217CC061574
        for <linux-media@vger.kernel.org>; Fri, 23 Apr 2021 15:31:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: adalessandro)
        with ESMTPSA id CB3171F43DBA
Subject: Re: [v4l-utils v4 2/5] Add support for meson building
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Gregor Jasny <gjasny@googlemail.com>, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi
References: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
 <20210317172227.620584-3-ariel.dalessandro@collabora.com>
 <7096f897-1e48-c1e5-5503-008fff60d2b2@googlemail.com>
 <20210320203209.14c65453@coco.lan>
 <YFZUf9RfS6rdD8Il@pendragon.ideasonboard.com>
From:   Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <5eb90b59-8896-ae22-690f-340f4ec9d8db@collabora.com>
Date:   Fri, 23 Apr 2021 19:31:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFZUf9RfS6rdD8Il@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Laurent,

I can see this thread didn't follow up.

Regarding Mauro's reasons about why not switching to meson, I totally 
agree with this response from Laurent's. I don't see any of those 
aspects being really an argument on why not supporting meson, but in any 
case, discussion can follow up from there.

On 3/20/21 5:01 PM, Laurent Pinchart wrote:
> Hi Mauro,
> 
> On Sat, Mar 20, 2021 at 08:32:09PM +0100, Mauro Carvalho Chehab wrote:
[snip]
>>
>> I'm not a lover of autoconf tools. Yet, replacing from it on this
>> project sounds a bad idea, for a couple of reasons.
>>
>> The main one is that nobody has yet provided any real reason about
>> *why* auto-tools should be replaced.

IMHO, switching from autotools to meson has many advantages, like a 
clear syntax, an active community and *faster* build speed than autotools.

On a cold cache:

   $ time (meson setup build/ -Ddefault_library=both ; ninja -j4 -C build/)
   real 0m15.945s ; user 0m51.235s ; sys 0m6.914s

   $ time (./configure ; make -j4)
   real 0m45.985s ; user 1m57.454s ; sys 0m9.404s

Although I haven't been involved in v4l-utils previously, I can see some 
people interested on having meson build support, I'm not the only one 
involved in this patchset.

I understand that every change comes with a cost, but I believe meson's 
been adopted for some time now, other projects have already done the 
move, and the advantages overcome the possible negative aspects 
mentioned. Again, this is just my humble opinion, and to me that's the 
*why* porting to meson is a good idea :-)

I'd like to hear for other reasons.

Thanks,
Ariel
