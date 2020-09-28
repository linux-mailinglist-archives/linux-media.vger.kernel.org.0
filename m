Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 910D927B0EB
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 17:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgI1P3S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 11:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgI1P3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 11:29:18 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4468AC061755
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 08:29:18 -0700 (PDT)
Received: from [IPv6:2003:c7:cf13:ec00:c5de:8baa:d62d:6718] (p200300c7cf13ec00c5de8baad62d6718.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:c5de:8baa:d62d:6718])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8831F299448;
        Mon, 28 Sep 2020 16:29:15 +0100 (BST)
Subject: Re: [PATCH v3 12/12] media: staging: rkisp1: cap: protect access to
 buf with the spin lock
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     helen.koike@collabora.com, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        tfiga@chromium.org
References: <20200922113402.12442-1-dafna.hirschfeld@collabora.com>
 <20200922113402.12442-13-dafna.hirschfeld@collabora.com>
 <20200927114326.7446d970@coco.lan>
 <672c5ca3-a5d1-a1dc-5cc8-3a802208310e@collabora.com>
 <20200927130528.374342ef@coco.lan>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e65ce38d-5323-195f-36ae-5ef705912773@collabora.com>
Date:   Mon, 28 Sep 2020 17:29:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200927130528.374342ef@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 27.09.20 um 13:05 schrieb Mauro Carvalho Chehab:
> Em Sun, 27 Sep 2020 11:54:10 +0200
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com> escreveu:
> 
>> Am 27.09.20 um 11:43 schrieb Mauro Carvalho Chehab:
>>> Em Tue, 22 Sep 2020 13:34:02 +0200
>>> Dafna Hirschfeld <dafna.hirschfeld@collabora.com> escreveu:
>>>    
>>>> The function 'rkisp1_stream_start' calls 'rkisp1_set_next_buf'
>>>> which access the buffers, so the call should be protected by
>>>> taking the cap->buf.lock.
>>>> After this patch, all locks are reviewed and commented so remove
>>>> the TODO item "review and comment every lock"
>>>>
>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>> ---
>>>>    drivers/staging/media/rkisp1/TODO             | 1 -
>>>>    drivers/staging/media/rkisp1/rkisp1-capture.c | 2 ++
>>>>    2 files changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
>>>> index f0c90d1c86a8..9662e9b51c7f 100644
>>>> --- a/drivers/staging/media/rkisp1/TODO
>>>> +++ b/drivers/staging/media/rkisp1/TODO
>>>> @@ -1,6 +1,5 @@
>>>>    * Fix pad format size for statistics and parameters entities.
>>>>    * Fix checkpatch errors.
>>>> -* Review and comment every lock
>>>>    * Handle quantization
>>>>    * streaming paths (mainpath and selfpath) check if the other path is streaming
>>>>    in several places of the code, review this, specially that it doesn't seem it
>>>
>>>
>>> FYI,
>>>
>>> There was a trivial context conflict here. Basically, the upstream
>>> version has this:
>>>
>>>
>>> 	 * Add uapi docs. Remember to add documentation of how quantization is handled.
>>>
>>> I solved the conflict, but as some patches for rkisp1 got merged
>>> on a different pull request, and there were some uapi docs at the
>>> other PR, maybe this would need to be revisited.
>>
>> I added the "Configuring Quantization" documentation in Documentation/admin-guide/media/rkisp1.rst
>> so the TODO item
>> "* Add uapi docs. Remember to add documentation of how quantization is handled."
>> can be removed.
> 
> Ok. Please send a followup patch with a "fixes: " tag mentioned the
> commit that added it.

sent just now,

Thanks,
Dafna

> 
> Thanks,
> Mauro
> 
