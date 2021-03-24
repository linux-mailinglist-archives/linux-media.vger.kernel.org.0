Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B2A348430
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 22:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234582AbhCXVxH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 17:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbhCXVwy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 17:52:54 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCB8C06174A;
        Wed, 24 Mar 2021 14:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=edyJ2Jpdh31F1Yc+hJ8xBzcMVc+NRFNIZR/GwnRdDpk=; b=FgJLmDOljj+nu/WQ5NnzK0KkFM
        mGHpGESZ46Wb4EwEowkLcLdCasSggAU+ItdMjY2L90Xa5yHaxltyJPRHRIqaqE3vtMDA+v3nRCPMa
        GaDtgB6pcqYrkhHyHmtGZuJtO9N97qxjQq+P6kJPxBQlQItNG1O2MmcTUVi7xdomPtRaT+NZ41Lqc
        VmHz++FaRGWKyxrS7C3piqL3txj8k8MEv093bayEj6O0k8wHLTOm6V1uEGW3aFJKSbNVLJWimcljz
        H77JKFq4aQPW9NNxN0SYFSO3fM54466sjgcuiQo/sDzlqi/aAHJcFA3Ut2fKT0ygYVElmH0bTy7GW
        2RLaNIxA==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lPBQp-000G60-OJ; Wed, 24 Mar 2021 21:52:52 +0000
Subject: Re: [PATCH] media: entity: A typo fix
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210324132100.18306-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1ee4a846-19a0-d256-070d-c48ed0fa5f46@infradead.org>
Date:   Wed, 24 Mar 2021 14:52:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324132100.18306-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/24/21 6:21 AM, Bhaskar Chowdhury wrote:
> 
> s/cariers/carriers/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  include/media/media-entity.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index cbdfcb79d0d0..a90e2bf6baf7 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -155,7 +155,7 @@ struct media_link {
>   *	uniquely identified by the pad number.
>   * @PAD_SIGNAL_ANALOG:
>   *	The pad contains an analog signal. It can be Radio Frequency,
> - *	Intermediate Frequency, a baseband signal or sub-cariers.
> + *	Intermediate Frequency, a baseband signal or sub-carriers.
>   *	Tuner inputs, IF-PLL demodulators, composite and s-video signals
>   *	should use it.
>   * @PAD_SIGNAL_DV:
> --


-- 
~Randy

