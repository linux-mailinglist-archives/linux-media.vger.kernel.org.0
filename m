Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585D12A2E72
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 16:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgKBPjT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 10:39:19 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:58696 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbgKBPjS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Nov 2020 10:39:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604331557; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nWkWyhgDV1pCPYK9XrTbWNIO5s3A7DMr3m4XNRjMFEc=;
 b=okvrbUBnIuPf+iS6Qi1q4ISf0sVDPiT+GCxkMlNg8vR9nFMV6DUY8T4q7jvtq14xUH3LLYnF
 pjW7BKpu9mT4+8XaQPtsxNXxOZGIc0iPtSkO5w0MZcahvQqLh+NlVPekM9KPXHBPSpJndW/7
 qHfWlOJHvUrIjHQoZsflYdGCvFU=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fa02825d8a9d167f3387cb8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Nov 2020 15:39:17
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3836AC433C9; Mon,  2 Nov 2020 15:39:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 710A0C433CB;
        Mon,  2 Nov 2020 15:39:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Nov 2020 21:09:15 +0530
From:   vgarodia@codeaurora.org
To:     Mansur Alisha Shaik <mansur@codeaurora.org>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RESEND] venus: fix calculating mbps in calculate_inst_freq()
In-Reply-To: <1604313097-2178-1-git-send-email-mansur@codeaurora.org>
References: <1604313097-2178-1-git-send-email-mansur@codeaurora.org>
Message-ID: <bf8acb0c470207289a09f63d829dfb08@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mansur,

On 2020-11-02 16:01, Mansur Alisha Shaik wrote:
> Currently in calculate_inst_freq(), video driver is calculating
> macro blocks per frame in stead of macro blocks per second(mpbs).
instead

> Which results frequency is always setting to lower frequency (150MB)
> as per frequency table for sc7180. Hence the playback is not smooth.
150MHz

> 
> Corrected this by correcting the mbps calculation in 
> calculate_inst_freq().
> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c
> b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 57877ea..001513f 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -928,7 +928,7 @@ static unsigned long calculate_inst_freq(struct
> venus_inst *inst,
>  	u32 fps = (u32)inst->fps;
>  	u32 mbs_per_sec;
> 
> -	mbs_per_sec = load_per_instance(inst) / fps;
> +	mbs_per_sec = load_per_instance(inst);

Good find.

Thanks,
Vikash
