Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8AA20ACA7
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 08:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbgFZG60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 02:58:26 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:41249 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728590AbgFZG6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 02:58:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id oiJVjZpLgxmkVoiJZjgaTI; Fri, 26 Jun 2020 08:58:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593154702; bh=R6Ir/Bz75ZuOudF6KyzPGOEaxClJeiHyCzSqQo5MsMQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VUQyqp4fpNHEEBJ7tqRiL6kX8TE90+9Ueif61BuvbZCy335uBrqwDpy6hnA7wSFFW
         J16jrFXDlILKoJdBsY2yN47tkOiMReQoY0F9eUGHdr1BBYdyfpUEEJ0l5FZQq3R8mU
         dZaxFJt67FA+oz0STAsyQ9j+XHa4oKTiz0cVb/nOjZ+41WXSH3WOZi10lwxzr5BlVW
         XvClmBSB155wsE+FanYyqcfI7QM0IL5Zoz9vxiH3zPH8qPOALzIxToaJXOpD47zME6
         KKT1CEufKEM0jJxNgJt3dJkQXIzaOpNtvwX04WYx9+SZREE+0T8x1GAyzM+hk/zV07
         FKyaaUxM77IAA==
Subject: Re: [PATCH v2 0/4] Tegra Video Decoder driver power management
 corrections
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20200624150847.22672-1-digetx@gmail.com>
 <90323aa6-38b5-0a45-69a7-ccf380690a78@xs4all.nl>
 <23cbaa18-9461-8f72-3d43-aa14cd0c1095@gmail.com>
 <0e14df05-8299-52d6-df8f-0dd476f4109d@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e41ff660-6c6c-d603-c767-34e7f4b4a23d@xs4all.nl>
Date:   Fri, 26 Jun 2020 08:58:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0e14df05-8299-52d6-df8f-0dd476f4109d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPLvU4k9HoHcsriBfUKOvb1jI4bhwxiauTAC9rGOgP28MbgwWKOlxenX5oo62ZWwMWqckA5P6RtdkVpGxhVm/RgmH3edVm1o86fl/r+1N8w+Ohwly0ZA
 +bnnPZohhYlepqoQUcBy4KrNDAloZOAclQ9KJYO6vae8dXFpzf1BAGJ5bMcik5bIvmqu5GGRZq5Ng/NdoDk8ZlmdDYJNFMC5Pc5jg0Jd91X2T5B1iAqzpz1I
 fruTlmbflCZy3U/dKwB9pK02fZ0adpyGBRnMRzR6VgXzOvMnhXviimkwcrv8p3e5vPlGBmMOFmUEOHyalREmtKst3yKT103wlYG9sgkfU61Ns3l19BDuIjwQ
 5gJAb+9dP2ZvKSa4nfvxNuaV/rl2tiQYFANyPf8tfOmK3ifqIKsb9e58EadMV6iL6RDR6/rR
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/06/2020 02:17, Dmitry Osipenko wrote:
> 24.06.2020 18:23, Dmitry Osipenko пишет:
>> 24.06.2020 18:16, Hans Verkuil пишет:
>>> On 24/06/2020 17:08, Dmitry Osipenko wrote:
>>>> Hello,
>>>>
>>>> This small series addresses a Runtime PM issue that was discovered during
>>>> of Tegra VI driver reviewing by balancing RPM usage count on RPM resume
>>>> failure. Secondly it fixes reboot on some Tegra devices due to bootloader
>>>> expecting VDE power partition to be ON at the boot time, which wasn't
>>>> happening in case of a warm re-booting (i.e. by PMC resetting).
>>>
>>> Can you rebase this on top of the media_tree master branch? I think a variant
>>> of patch 1 has already been applied. I found a mail today where you mentioned
>>> that you preferred your version (it looks like I missed that) so you'll need to
>>> rework patch 1.
>>
>> Hello Hans,
>>
>> I'll take a look at what patches has been applied, my bad for sending
>> the v2 too late. Thank you for the heads up!
>>
> 
> I tested the already-applied variant of the patch 1 and it has the same
> behaviour as my variant, so it's okay.
> 
> Would you want me to send a v3 without the conflicting patch 1 or you
> could apply the patches 2-4 from this series?
> 

I'll mark 1/4 as superseded and will apply patches 2-4. No need for you
to do anything.

Regards,

	Hans
