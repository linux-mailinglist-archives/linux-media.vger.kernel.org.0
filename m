Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F073D3766
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 11:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhGWIa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 04:30:59 -0400
Received: from mail.netline.ch ([148.251.143.180]:37235 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhGWIa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 04:30:58 -0400
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id 2CEB120201B;
        Fri, 23 Jul 2021 11:11:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id kxQLFzKYo8nX; Fri, 23 Jul 2021 11:11:29 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch [85.2.99.24])
        by netline-mail3.netline.ch (Postfix) with ESMTPA id BF6A920201A;
        Fri, 23 Jul 2021 11:11:29 +0200 (CEST)
Received: from localhost ([::1])
        by thor with esmtp (Exim 4.94.2)
        (envelope-from <michel@daenzer.net>)
        id 1m6rDM-000Bg4-UO; Fri, 23 Jul 2021 11:11:28 +0200
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210723075857.4065-1-michel@daenzer.net>
 <f5f37693-bfe2-e52f-172b-00f4aa94dbd9@amd.com>
 <4cf94f59-f953-f5d7-9901-cfe5fd63bfbc@daenzer.net>
 <YPqFiPftjTUV4361@phenom.ffwll.local>
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Cc:     linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf/poll: Get a file reference for outstanding fence
 callbacks
Message-ID: <babe4878-d99b-2ae4-2389-8139477783db@daenzer.net>
Date:   Fri, 23 Jul 2021 11:11:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPqFiPftjTUV4361@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-07-23 11:02 a.m., Daniel Vetter wrote:
> On Fri, Jul 23, 2021 at 10:19:49AM +0200, Michel Dänzer wrote:
>> On 2021-07-23 10:04 a.m., Christian König wrote:
>>> Am 23.07.21 um 09:58 schrieb Michel Dänzer:
>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>
>>>> This makes sure we don't hit the
>>>>
>>>>     BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
>>>>
>>>> in dma_buf_release, which could be triggered by user space closing the
>>>> dma-buf file description while there are outstanding fence callbacks
>>>> from dma_buf_poll.
>>>
>>> I was also wondering the same thing while working on this, but then thought that the poll interface would take care of this.
>>
>> I was able to hit the BUG_ON with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 .
> 
> igt test would be really lovely. Maybe base something off the
> import/export igts from Jason?

I'll see what I can do, busy with other stuff right now though.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
