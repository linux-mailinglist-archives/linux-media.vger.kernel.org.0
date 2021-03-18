Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484C6340CAB
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 19:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbhCRSPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 14:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbhCRSPP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 14:15:15 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A2CC06174A;
        Thu, 18 Mar 2021 11:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=8Fkbd93Aq1q97jNctPteNuHQ9DD1eBmwgRUQ35hJ0rA=; b=V0w6Kb4Fi43X4zYOIkAMdjTWsk
        S9/vwlXjY6r4HCHXAEod+UTbZPkMX5fKjVvWVYOUjuNn03/jt6cXDp6ak6qm4VNCeaG/GiMiZPC3M
        3IOkP8pCB7HSMBqq/6N9uBCJhEswE3SBi23EvX0mQl+/elBrvJkoAkpg4Yfk/mClpAXKprmfhZg/R
        Z5QLOm4hyncuW1Seq0UZ2Tn2FwvaqduQXZNOcxYHn/WxVHgH7irSLMfQrLXEwtfvg69rjsJdlZDMM
        1vapm1DHm6hQlhM4BWMwkuzdYWV3CeM/qvUkfbFjhJt3zbSLhlYMM3+t/Q+HMLPDbLYHT14t5JyLQ
        HQhG7hRg==;
Received: from [2601:1c0:6280:3f0::9757]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMxAm-003Kqs-Se; Thu, 18 Mar 2021 18:15:07 +0000
Subject: Re: [PATCH] drm/i915/gt: A typo fix
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        chris@chris-wilson.co.uk, tvrtko.ursulin@intel.com,
        mika.kuoppala@linux.intel.com, maarten.lankhorst@linux.intel.com,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20210318101932.19894-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <027de4bd-cefc-0988-bd3b-b0bcc12d93b0@infradead.org>
Date:   Thu, 18 Mar 2021 11:15:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318101932.19894-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/18/21 3:19 AM, Bhaskar Chowdhury wrote:
> 
> s/bariers/barriers/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/gpu/drm/i915/gt/intel_timeline.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
> index 037b0e3ccbed..25fc7f44fee0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
> @@ -435,7 +435,7 @@ void intel_timeline_exit(struct intel_timeline *tl)
>  	spin_unlock(&timelines->lock);
> 
>  	/*
> -	 * Since this timeline is idle, all bariers upon which we were waiting
> +	 * Since this timeline is idle, all barriers upon which we were waiting
>  	 * must also be complete and so we can discard the last used barriers
>  	 * without loss of information.
>  	 */
> --
> 2.26.2
> 


-- 
~Randy

