Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8079CB69E
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 10:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbfJDIsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 04:48:50 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48721 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725730AbfJDIsu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Oct 2019 04:48:50 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id GJGWivNPfjZ8vGJGZisjho; Fri, 04 Oct 2019 10:48:48 +0200
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3f7fe51a-8958-a425-f5fd-01df5301d6b2@xs4all.nl>
Date:   Fri, 4 Oct 2019 10:48:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190828115400.GA30919@ulmo>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIxtuyQfDELsyaEhapLOQeAHB7QAyJDRd8x05tHFxVJYMlGGvg5VX//j//cdR+KvdtarwKYhD4NRQrssc7yvwEN+yiyuBiFa1CRULA1iQjqwTHvN9hvg
 I3h+Lc4e/ODHchCGAjVhlQiBPgmXfPjyrxWPVPkSccYG25LXhbEas0Absg1gU4QIMKA1fToOk/oIBRS9HNPQEZGQdVoCO8h4pm2Xlz46TM5lW+FGDYiz/gtD
 Ik86LXISf6CXkM3zrizPiGxwMptBjrwicNmd0Z3bMYwDMA/En4sAM5C9qrf8xlPOgYyql4jDscGeIEd7tm4xZZmeoe2wOd8UOod3rpaxRP7/Z0ijvbz7a9zL
 07DbcgRhu0f2J2Kt07CcgmLOZsCoErFmfK8UiqUCD9mVagvcegJYrdC8Xq4mhjrff1Gi+yt/brLuGMC54uNBvPLP55UHVBLM4NT2BmxTy6356tuWvPM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thierry,

Just a reminder: this patch hasn't been merged yet for v5.5.

Thanks!

	Hans

On 8/28/19 1:54 PM, Thierry Reding wrote:
> On Wed, Aug 28, 2019 at 12:06:34PM +0200, Hans Verkuil wrote:
>> On 8/28/19 11:38 AM, Thierry Reding wrote:
>>> On Wed, Aug 28, 2019 at 10:09:30AM +0200, Hans Verkuil wrote:
>>>> Thierry,
>>>>
>>>> Can you review this patch?
>>>>
>>>> Thanks!
>>>>
>>>> 	Hans
>>>
>>> Did you want me to pick this up into the drm/tegra tree? Or do you want
>>> to pick it up into your tree?
>>
>> Can you pick it up for the next cycle? As you mentioned, we missed the
>> deadline for 5.4, so this feature won't be enabled in the public CEC API
>> until 5.5.
>>
>> Thanks!
> 
> Sure, will do.
> 
> Thierry
> 

