Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0429E356D4D
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 15:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244140AbhDGN3t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 09:29:49 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39309 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236210AbhDGN3t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 09:29:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id U8FRlS2pSMxedU8FUlIW01; Wed, 07 Apr 2021 15:29:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617802177; bh=cHiy59c4nHy7psXKJXhYxIBqc45M/lKTnaFjf26XdU4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tF/SVikA0aYFdtT0T31ZRm0w2J/rmnoA/trHn7o8dmJePOOUJVlIMNTgRMNWZqTsO
         B3c/l6o60o7zoRnbnRhc8U/eivYXCa5AZuXkdWoPo7EEY6XwLXkywtabeTGH3Z/gRC
         8JV9bnmpuWDLjEm6VANzFjCGIcy+FhLFOTAWbnKnwRAUZU6BKx4KN2Ej5VqGQI07eS
         tLDurQH5jD9hu5AuDZgrfcz5+2IOU/s1ptFtKaqzO2i6oib0aUlxDopgfSimuob8CU
         6/+NucXvTmWiwRj7OyFAAiWTEYfS41QsyiYRqtqIoZSlgD3jDPvlxi0DeIwOBNGeJn
         dFtVGntn/kXzw==
Subject: Re: [PATCH] media: Fix compilation error
To:     Bixuan Cui <cuibixuan@huawei.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        skomatineni@nvidia.com, mchehab@kernel.org, treding@nvidia.com,
        mperttunen@nvidia.com, john.wanghui@huawei.com
References: <20210402074017.49009-1-cuibixuan@huawei.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c5b9fc40-0d52-4a31-2e73-14ec07434af4@xs4all.nl>
Date:   Wed, 7 Apr 2021 15:29:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210402074017.49009-1-cuibixuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF62goWA+Uzk5uL1M0pqI5RIBvqwoQboyP00Z5suPJ4H5qYPXFf4QK8DVIyWu+kgrCRpyS82gwcUkg2siirKV1U2Gn2RSj9IyBlSNF67GlO/3lQq4hCn
 PAFsfDuXl24W0rpyADtx+56yIzedOGbEkJOOeRE+Kd5UJ6IqvoV1CF5DTxCgsn9WOVFAmA7y1fH1KcYqcwnosO5AAP9jvg/gPhKZJ+42wf7MeXIzsGnrZK0n
 CamUe4Cnax/6SfJ6nXsraAU1kFElQ959hKgn+W6uGmaJbO11PkAH8QYGvMiSwaqhBW9wlyEBQn1/DODY4K631ZOcBw0PHBkhrgynaK6dG2seXsBKAn9H4s7V
 RfmvMB8U8EPDCGNnx70jPgq98Ag9t7cPWL1GO5ebn0W0WD8rh1xpHFRkH7sen/pWk2pi3P4MX1PUihRW5TyefmI0eXfDmqiz90qDOGk4R9BT6A2+824KaI89
 5PyupYHezo9tu9IR6V8VmVwSvg8Jij26VY0Dbw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/04/2021 09:40, Bixuan Cui wrote:
> Fix the error:
> 
> drivers/staging/media/tegra-video/vi.c:1180:4:
> error: implicit declaration of function 'host1x_syncpt_free' [-Werror,-Wimplicit-function-declaration]

Against what tree is this being built? The mainline kernel doesn't have
host1x_syncpt_put, only host1x_syncpt_free.

Also, the subject line is very vague, something like this is much more descriptive:

[PATCH] media: tegra-video: replace host1x_syncpt_free by host1x_syncpt_put

Regards,

	Hans

> 
> Fixes: 3028a00c55bf ('gpu: host1x: Cleanup and refcounting for syncpoints')
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 7e0cb5529b49..df5ca3596470 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1177,7 +1177,7 @@ static int tegra_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
>  		mw_sp = host1x_syncpt_request(&vi->client, flags);
>  		if (!mw_sp) {
>  			dev_err(vi->dev, "failed to request memory ack syncpoint\n");
> -			host1x_syncpt_free(fs_sp);
> +			host1x_syncpt_put(fs_sp);
>  			ret = -ENOMEM;
>  			goto free_syncpts;
>  		}
> 

