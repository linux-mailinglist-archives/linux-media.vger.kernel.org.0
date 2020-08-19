Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32CC0249FC5
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 15:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgHSN0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 09:26:36 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:58707 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727996AbgHSN0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 09:26:22 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8O6dkcvKSuuXO8O6ekhGDC; Wed, 19 Aug 2020 15:26:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597843580; bh=k4CyG5Qq54vxXk/1xGJbjzzlnEo+v6cUalGVdZ9UNHI=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Oh6qt6EDQ/N1K0Nf0Lvo6MlJRK64on3esya29Q4qiPt8H+JwY7+T/gyqTquq1Lzf6
         xsTVu8s5zg3BM7PonezxwJjkwji2siPgUgl0cqroCCwrXs9JLxBARiAIsyKXEb0HJs
         KRrN7O5ThVEuiEAhyMlpPsYiyXcgLaLm0mW0R4AVsNNmF2ilHugsrsQ6viAA4EcJHo
         YYauw7sCYo3Kq/EL0aLj++Pn0v1XqfOkvLS6z/UhYUdszTRxtO7JUo2x9Ose4BwvjB
         BPYSZOeBv5Co1vCN0i//3eIkVWsg7zAZ6mgtrEl0Qgt1ss/4psW9q0WV6tmw9hy29O
         O3E9BetpehQ7g==
Subject: Re: [PATCH 1/2] media: Revert "media: exynos4-is: Add missed check
 for pinctrl_lookup_state()"
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-media@vger.kernel.org
Cc:     hslester96@gmail.com, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com
References: <CGME20200810153301eucas1p2684476145e627ba124ba4740ef204712@eucas1p2.samsung.com>
 <20200810153240.23827-1-s.nawrocki@samsung.com>
 <bdcb0a29-8c7e-3736-9936-2b25460f9aef@xs4all.nl>
Message-ID: <9b240ddb-0d03-5d51-386d-fce100a70aed@xs4all.nl>
Date:   Wed, 19 Aug 2020 15:26:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bdcb0a29-8c7e-3736-9936-2b25460f9aef@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM486MN3QSCAdJcP+Ut+D2oHitKpGHNGxmepL3N9f831HuqqJHNdoXtsQmci8D4T/woHOUOj/Y4tEkXWTThbCrveCo/4lwcmgdXXOtI11Djn9LwQrGnc
 bdg3COFSRvNHRlormPsU1tWbtFA5m8CLqgzkLxnhKp5TRDSPQmPQ+1JuRJZtOnhFiKA4lvMQ4aCL1mi/ZZv64d2x1zKaXY3kThs007JYEE20zlCTXSdKH6k2
 xqMGmUsM1Fbs06fSSjhmkY/wjMIyI+cCOUlJM+dBu8nNxMaPjHCwvShkAdz2bnKZGU2cSPSTmlgr4u+Wc1EWjuU5RHYQ3iaf38h79RnUhbuu/um967hHE1jX
 fw3VlqP/8w4O/V/kFEw6pwq1bZqyRq+wFJt0CF2/FH6tp9Ag7hxyTAMryBEJ8yJxMEriLXYim5Wo3hwwcY28qkWuS0Tq9ZpU6WDvlrWa6VN0N814eY8f6oum
 KD/DFSV6+YeLQFRsHvsYOnk94XjhplQ5w0mOG4K0yZ8vbKXOScm9aNvdJ6vbALhwNms8VhBsFk4diM4iTDvT3125IjBI+SpF/ZLfSDLqbL2JaCmg+0hoNU9m
 0dE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/08/2020 15:15, Hans Verkuil wrote:
> Hi Sylwester,
> 
> Can you rebase this patch series on top of the media_tree master?
> 
> This series didn't apply anymore.

Never mind, it was a conflict between this patch and this one:

https://patchwork.linuxtv.org/project/linux-media/patch/20200807083548.204360-2-dwlsalmeida@gmail.com/

I'll fix this up myself.

Regards,

	Hans

> 
> Thanks!
> 
> 	Hans
> 
> On 10/08/2020 17:32, Sylwester Nawrocki wrote:
>> The "idle" pinctrl state is optional as documented in the DT binding.
>> The change introduced by the commit being reverted makes that pinctrl state
>> mandatory and breaks initialization of the whole media driver, since the
>> "idle" state is not specified in any mainline dts.
>>
>> This reverts commit 18ffec750578f7447c288647d7282c7d12b1d969 to fix
>> the regression.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>>  drivers/media/platform/exynos4-is/media-dev.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
>> index 16dd660..9a57523 100644
>> --- a/drivers/media/platform/exynos4-is/media-dev.c
>> +++ b/drivers/media/platform/exynos4-is/media-dev.c
>> @@ -1268,11 +1268,9 @@ static int fimc_md_get_pinctrl(struct fimc_md *fmd)
>>  	if (IS_ERR(pctl->state_default))
>>  		return PTR_ERR(pctl->state_default);
>>  
>> +	/* PINCTRL_STATE_IDLE is optional */
>>  	pctl->state_idle = pinctrl_lookup_state(pctl->pinctrl,
>>  					PINCTRL_STATE_IDLE);
>> -	if (IS_ERR(pctl->state_idle))
>> -		return PTR_ERR(pctl->state_idle);
>> -
>>  	return 0;
>>  }
>>  
>>
> 

