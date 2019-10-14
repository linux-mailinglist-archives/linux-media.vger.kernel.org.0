Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 219F5D5CA4
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 09:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729979AbfJNHve (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 03:51:34 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50051 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727038AbfJNHve (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 03:51:34 -0400
Received: from [IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d] ([IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Jv8ZiFGrCop0AJv8aicxLH; Mon, 14 Oct 2019 09:51:32 +0200
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
 <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl> <20190828093820.GE2917@ulmo>
 <2eed5ed3-85f3-4c19-4dd2-3d8432829c2a@xs4all.nl>
 <20190828115400.GA30919@ulmo>
 <3f7fe51a-8958-a425-f5fd-01df5301d6b2@xs4all.nl>
Message-ID: <cf936882-155c-90d3-2a10-728699392c6d@xs4all.nl>
Date:   Mon, 14 Oct 2019 09:51:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3f7fe51a-8958-a425-f5fd-01df5301d6b2@xs4all.nl>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGbuU7DDL7KyVME5FwCzYOw1TzZkGOvsTJjVw3Y0FGCy76Zxyq86vy8M0cacjLOF97XRpO5TyMuyREZUqJ1gvYIVTn3BkMk8NgDLygSg5pLmNj0uLZHI
 zn0hiVOQwcHxc9kGe1rNGatQhAvo8quCB0MSphrw4m1sOAzkavW2DGhyAIXnLrAPSzw2TJeKzGiOJtsTN/0aE0BHgfSLoKH98o7Vqp56Ww3482ioh5a2HD8R
 1fFPY20AX8HLdSqMwybPLfyXeWhvm2ZmKB/HsSbGI/jDJ3qjxSUy8n6UTMUGZRzEP1shWNNJEBUaE5vvOu3C7v6q7f0CTaH804/+4+BbujVv3NCf1zYWM1Lg
 dOPGrU3pxHJIW8g9+Vk+UtUVJ5QaVZUmgppcn8WZjti3uZ54pf6aCwJmWcM6wkIcpmttTPPB0/lT0HBN3kmFuwGdDeoAh/1rWePMcnqWbfOz8naI7geFIdYz
 tTKLc++ubZgOMQuqhU5nri+CbdSKDH6o4H2QfQTasmug1a7YYdLfl1tzsr7P4gbH2XvQixfvpgHC3F+USUk8icIahPy3Hzuhzvv08g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thierry,

Another reminder :-)

If you want me to do this, then just let me know!

Regards,

	Hans

On 10/4/19 10:48 AM, Hans Verkuil wrote:
> Hi Thierry,
> 
> Just a reminder: this patch hasn't been merged yet for v5.5.
> 
> Thanks!
> 
> 	Hans
> 
> On 8/28/19 1:54 PM, Thierry Reding wrote:
>> On Wed, Aug 28, 2019 at 12:06:34PM +0200, Hans Verkuil wrote:
>>> On 8/28/19 11:38 AM, Thierry Reding wrote:
>>>> On Wed, Aug 28, 2019 at 10:09:30AM +0200, Hans Verkuil wrote:
>>>>> Thierry,
>>>>>
>>>>> Can you review this patch?
>>>>>
>>>>> Thanks!
>>>>>
>>>>> 	Hans
>>>>
>>>> Did you want me to pick this up into the drm/tegra tree? Or do you want
>>>> to pick it up into your tree?
>>>
>>> Can you pick it up for the next cycle? As you mentioned, we missed the
>>> deadline for 5.4, so this feature won't be enabled in the public CEC API
>>> until 5.5.
>>>
>>> Thanks!
>>
>> Sure, will do.
>>
>> Thierry
>>
> 

