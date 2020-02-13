Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3C9715BD02
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 11:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbgBMKo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 05:44:27 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:40541 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729428AbgBMKo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 05:44:27 -0500
Received: from [IPv6:2001:983:e9a7:1:517b:ad10:523d:fa83]
 ([IPv6:2001:983:e9a7:1:517b:ad10:523d:fa83])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2ByqjB60V8i432ByrjM5VF; Thu, 13 Feb 2020 11:44:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581590665; bh=znoeVGPWcgXKmZofUTt2zSdIbzQOMwdopbuwo+ykg2A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jQNVpjI6UolEqtCXTvVooGH726Fu8djAzkpMH+aEd5XZLt4t+I9wJ5TFgV+adcm6A
         loNkpwSi5asYPoXsMqrr6M0hPzdI4rX8d1dqVF4oeuFQP4FWFLweCdBLBWQ2FTiJ3F
         3hTLwjl3IlHQgPfzH5ISiIV7CBZciPPAHVJtmJyJHJTaWEhibulDiiqdeJ6n3wwwtg
         PHSlumklZViLPruxKM7KDxYTySgSqH4W/On14p+MoHz+zh5cTZuIFfwvXGxwVJZF4k
         q6gthB63vMS1YLypjy7x1yQagwDJBv9umBXeFMZRziB/9AfRQ0mll4ii+BGEVTKlOR
         +fMnxixi/4Bfg==
Subject: Re: [PATCH] MAINTAINERS: Add dt-binding files for Venus
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20200113145424.4867-1-stanimir.varbanov@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fa84da43-5954-6b32-17d6-a6c8c01fa93e@xs4all.nl>
Date:   Thu, 13 Feb 2020 11:44:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200113145424.4867-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPOXmvHkmKKXq7IFeCItCHp8c6HRtuq7/ipAds/K1gUHVXsPqOTcTRWgkkXM49z7SuiSmu6yFH9lJxnUyrY+cjvOr7FE6ojdcV6twCUFoC/Zmre9Sjz8
 f4Hua40lQDoO6A2Mm45taNIbyHy5KDLeSoHFc0eMmqYIit5Mm9/B2KQchV+sryYRsR3fa5efRRIV3MCTqVxoBUnNLPsQyCmKZyV7dQyXLr5EuGWDl6vQMQsk
 nFVfiB5eujfgD6ZlCrOojMUYt02O72W6ze1WN6FSQXf+ad4ciM7G7kGVjzoz4qPZaO0QWAuRHwouGFHeWCQOvSdFYLuOG8aS7BOpxNYJr8eqx6e6G7U4JCJ6
 wixLeJhbgMMkCoUkc9sr6FkssJs8QiCBjT3ghQdHWXjGu4uhc9DaNB3wZxiABPZ4cwxceU1E8Bm+NWt2NMDiDTq/3lxkocgwqoWH66xE6iDaMZIhNOE=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/13/20 3:54 PM, Stanimir Varbanov wrote:
> Adds a path to devicetree dt-binding files.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 983d3c97edd1..8c97d1e7ea50 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13732,6 +13732,7 @@ L:	linux-arm-msm@vger.kernel.org
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Maintained
>  F:	drivers/media/platform/qcom/venus/
> +F:	Documentation/devicetree/bindings/media/*venus*
>  
>  QUALCOMM WCN36XX WIRELESS DRIVER
>  M:	Kalle Valo <kvalo@codeaurora.org>
> 

