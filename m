Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB5137BE71
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 15:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhELNpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 09:45:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55858 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhELNpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 09:45:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: adalessandro)
        with ESMTPSA id E17E81F42685
Subject: Re: [v4l-utils v4 2/5] Add support for meson building
To:     Rosen Penev <rosenp@gmail.com>
Cc:     Gregor Jasny <gjasny@googlemail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi
References: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
 <20210317172227.620584-3-ariel.dalessandro@collabora.com>
 <7096f897-1e48-c1e5-5503-008fff60d2b2@googlemail.com>
 <e9dc1ebd-9a68-adc6-2a61-5555d622ccf3@collabora.com>
 <CAKxU2N_b8758FUKF=MoWRny59NxAZ6qSWETH4_6OhQpAP0OBTQ@mail.gmail.com>
From:   Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <29ac2c16-5d0f-a6a5-77ca-4e046aeecceb@collabora.com>
Date:   Wed, 12 May 2021 10:44:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAKxU2N_b8758FUKF=MoWRny59NxAZ6qSWETH4_6OhQpAP0OBTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rosen,

On 4/28/21 11:11 PM, Rosen Penev wrote:
> On Fri, Apr 23, 2021 at 2:03 PM Ariel D'Alessandro
> <ariel.dalessandro@collabora.com> wrote:
>>
>> Hi Gregor,
>>
>> Following up on this patchset after some time.
>>
>> On 3/20/21 1:56 PM, Gregor Jasny wrote:
>>> Hello,
>>>
>>> Thank you again for these patches. Building v4l-utils has never been so
>>> fast and easy. It will accelerate my Debian / Ubuntu packaging and
>>> really sparks joy!
>>
>> Happy to see it being useful :-)
>>
>>>
>>> On 17.03.21 18:22, Ariel D'Alessandro wrote:
>>>> Supports building libraries and tools found in contrib/, lib/ and
>>>> utils/ directories, along with the implemented gettext translations.
>>>
>>> Here's a patch on top of your tree:
>>> https://gitlab.com/gjasny/v4l-utils/-/commit/a9853f79c2675bf08fc3e93f15aa4158c9769bdd
>>>
>>>
>>> I changed the following:
>>> * Use pkgconfig to detect libbpf (like configure.ac does)
>>> * check for libbpf presence in the keytable subdir (like it's done for
>>> libelf
>>> * refined the empty rc_keymaps dir hack with something supported by
>>> meson: https://github.com/mesonbuild/meson/issues/2904 (your hack
>>> stopped working for me with meson on Ubuntu 20.04.2)
>> [snip]
>>> Tested-by: Gregor Jasny <gjasny@googlemail.com>
>>
>> Thanks a lot for your changes! LGTM, I'll add these changes, test and
>> post a v5 asap.
> I recommend adding c_std=gnu99 and cpp_std=gnu++11 to default_options
> as otherwise compilation will fail with older compilers.
> 
> gnu is needed. the C variants do not work.

+1

Thanks!
