Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429891B8DCA
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 10:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgDZIHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 04:07:38 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:50373 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726112AbgDZIHh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 04:07:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ScK2jiToB7xncScK5jZO5d; Sun, 26 Apr 2020 10:07:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587888454; bh=QhVuhF+AVfllDkBKFsK2AKInudEe6KEWl3QCVzDXRws=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IQIm+mAi/a7dkltvRvHFD0IiBjJXhIgiOr68C/GogyDzpk//xijALKZE3zvjvw0fF
         mr8w1d1PLJHW1OHNXfzqPNhlIUcTpn1UaEFWY8Iozd1SkU8Fan3ZBSk/buhcSGS4ce
         cRLPbdkNJ0oynSmbbfYnuNlDws2ftxOwl49jDUSJMJsNnoKlj5Y170rCDqPwKrgO6T
         FdfzMq3zewo8oqZbpJHFNxvjWEv67t22rlQOkp/ADhMuICU8NtvZLfPjOGEJ3c2OMX
         ZVy7Q39blSovYVV3pGtDmIg5kn9QGkpxnv8GPQ3r6pQdcHzpwNkhWc3Umft0WKeLeY
         /zKh4RlUpAqug==
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <3155e0d2-94b0-6e0a-bf35-b3560c201039@gmail.com>
 <fffc09d1-a25f-2d6e-83bd-f7657dd2ff16@nvidia.com>
 <e5602c48-a73e-8e71-188d-6a53ebf8e4a4@gmail.com>
 <f6d62dde-9ab5-7001-0ff4-93ed70cb207f@nvidia.com>
 <6568af00-3d65-4ddb-f003-7a4161d751a0@gmail.com>
 <f3a122b9-3600-b1eb-be4f-39be79d979a5@nvidia.com>
 <5a6f61c6-2049-fb61-3a80-e729708b3fb8@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9aaf6c09-1a01-aa82-cab5-d2dd07649707@xs4all.nl>
Date:   Sun, 26 Apr 2020 10:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5a6f61c6-2049-fb61-3a80-e729708b3fb8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfE0xlF+3OKnPUNkt9qK2y1N8a9STspTDxXqp8oaV5OuA5fmxZb/86Uh6I9qWV4gyzl7Y0sVsgUYkjgH4+MAOHXfwB+sXmVcXI8fESiqFmBRMZitGixOV
 ngA7m+8yZrXxGfeJZKW1tdODtDBftrJyXmKHCRGQ4BeCyoS48I2R0tRg9ybpabEz7oM/kPRXaYy1FJ0affh6Y6e49UOmGjpwFNkv+CAxezDHaOkXPvjgMRkA
 uR9Y+dbAZLezw4B+yr0y9wLLUHTyubaeUlMXshqJe5Cuk2c5SPNJpJRqgN3KMeSovmGiAIxqAWk/DyANTy/I8m/jGnJwo9nnK8c3cmZcF9+Opu33hBwOrNye
 JjcI1Jjf/aUzirZxkj1Trp67MtDKibwBRBkv6UOXCoS/Nmb2P7wkwIZjbrTWcWxSZDAkqFagSE32pT2A857Di4f8EpaXSnwve+2F6AhSytaR1g1+IL7nOhzA
 gh+qxQ6R6dOEPv9bSEAW+hRVKIP6L8TDv4ApUVGjNqlawtOsDaUkTustiQuArcrC9SqI3zsxG4fitBrPkJ/JAm6Ot2m03DhAUA4gcF2Teo9qKO7qRWPNh9E6
 5g4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/04/2020 02:19, Dmitry Osipenko wrote:
> 26.04.2020 02:44, Sowjanya Komatineni пишет:
> ...
>>> How much of the T210 code could be reused by T186/194?
>>
>> vi/csi are common driver where soc structure should be populated for
>> T186/T194
>>
>> Tegra210.c can't be reused for Tegra186/t194 as programming seq is a
>> whole lot diff
>>
> 
> How are you going to separate Tegra210/186/194 drivers from each other?
> I don't think you'll want to have one "fat" driver that covers all those
> SoCs, won't you?

As long as the differences between SoCs are small, the media subsystem policy
is to keep it all in one driver. You might split off some of it into separate
SoC-specific sources that are included only if selected in the Kconfig (see
e.g. drivers/staging/media/hantro/ or drivers/staging/media/imx/). If that
makes sense for the Tegra, then that's a perfectly fine option. But creating
multiple drivers for SoCs that only differ in relatively minor ways is not
recommended.

Also, these drivers allocate *huge* amounts of memory when streaming video,
so a somewhat bigger driver is not something you'll notice. Keeping things
readable, simple and maintainable is much more important.

Regards,

	Hans

> 
> In the end it should be three modules: tegra210-video.ko
> tegra186-video.ko tegra194-video.ko.
> 
> Using a per-SoC OPS doesn't allow you to do that because the "root"
> driver will have to lookup OPS' code symbols of every SoC, and thus, the
> unwanted driver modules will get auto-loaded if you'll try to factor out
> the OPS into a separate driver modules.
> 

