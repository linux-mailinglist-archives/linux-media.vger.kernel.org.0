Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08EBB36D3F2
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 10:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237221AbhD1I2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 04:28:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:40130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229643AbhD1I2T (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 04:28:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D023061428;
        Wed, 28 Apr 2021 08:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619598454;
        bh=MMdojTNsABdHbx90yhpxY/qSAQ0sMQ1zeneARF2DHr4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dx+sIiSpWRqddOtUTc+JhzpKDPpbLGDkvs06tkwI7Yw8y3HamdWE5plk9jwEs5j2z
         Tm/1DpIKdz/3GH/LhLtT0pLNxVQPRCoLmPgBNJScH69Emi3IWiqMF4NEMKM3fjwBC9
         BqjJeCTbPR9hZczow28fzc92gFyeQkvkWnq8+mZsr08lPJ5SDQu3yOxDRHe88cxQO8
         252VpD1qJM58PgiiPzqtk0kLyNPHH96i8tmxmWnlVdgicI0Qqw2MBPZ+LngZaozBsv
         qt+puDwUSSzTYbu1SUoQ6pG5e9ITDmsOSFio8Uw8uTz/pEb7z7g2j33u14HI1IgIkK
         k2f+4ZFQ+vvCA==
Subject: Re: [PATCH 58/78] media: exynos-gsc: use pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <CGME20210424064556eucas1p1e89378837c377168c9782b4172e70482@eucas1p1.samsung.com>
 <9c7d683907b9f9cf4a99f57f978671ec7f5a1dbc.1619191723.git.mchehab+huawei@kernel.org>
 <ee7b580a-d5bc-bdbf-3efc-c9d8f43316db@samsung.com>
 <20210427113055.745d0560@coco.lan> <20210427114235.45a7b2a4@coco.lan>
 <5f6088c7-c839-f097-737f-b4234c413eac@samsung.com>
 <20210428091302.64af1e5d@coco.lan> <20210428091707.3c99d124@coco.lan>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <01a14e06-b7f2-7246-ad12-4a13a96622a0@kernel.org>
Date:   Wed, 28 Apr 2021 10:27:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428091707.3c99d124@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28.04.2021 09:17, Mauro Carvalho Chehab wrote:
> Em Wed, 28 Apr 2021 09:13:02 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
>> Em Tue, 27 Apr 2021 13:50:44 +0200
>> Sylwester Nawrocki <s.nawrocki@samsung.com> escreveu:
>>
>>> On 27.04.2021 11:42, Mauro Carvalho Chehab wrote:

>>> I think if the device is brought into suspended state (e.g. by
>>> disabling clocks as above) the pm_runtime_set_suspended() call
>>> should be there. IOW a following sequence:
>>>
>>> 	pm_runtime_disable(dev);
>>> 	if (!pm_runtime_status_suspended(dev))
>>> 		/* put device into suspended state (disable clocks,
>>> 		  voltage regulators, assert GPIOs, etc. */
>>> 	pm_runtime_set_suspended(dev);
>>
>> Not sure if this would work, as the clock framework would try
>> to do things like calling clk_pm_runtime_put().

It's done in multiple drivers this way. clk_pm_runtime_put() operates
on different device - the clock supplier, not the consumer device.
We just need to disable runtime PM for GSC as the last step, to avoid
any possible v4l2 m2m device_run() call with runtime PM disabled.

>> Perhaps an alternative would be to just return an error if it
>> can't resume PM runtime, e. g.:
[...]
> Nah, forget about that. Despite the platform driver having a return code,
> support for it bogus:

Yes, we can't really stop remove() from driver level so as much complete
resource release is being done as possible.


Regards,
Sylwester
