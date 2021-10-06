Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED63423750
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 07:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhJFFCw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 01:02:52 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32987 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhJFFCw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 01:02:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633496460; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=asupr90LKsNaEFoWBmYQd4HeemIExSGhJTwTT6Jn+b0=;
 b=QKUqXOEQJpp5IvNsVzrK966TrEsSkVXW6RlL+KOJaUlllIn5zRNzkDVuzVMwyX7IcfgudagS
 Q6RIMiyZpZlEIPGzVEsiTBp6JDAuerzy9PpBiXQxxcxveRJGHel+4Xb8ylZaioV0I8kMiBYn
 ffrGUeFVfZGo1tcl2rIMb74Qj5k=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615d2d77ff0285fb0a057399 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Oct 2021 05:00:39
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8817CC4360C; Wed,  6 Oct 2021 05:00:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E84C8C4338F;
        Wed,  6 Oct 2021 05:00:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 06 Oct 2021 10:30:37 +0530
From:   vgarodia@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: Re: [PATCH v2 0/5] Venus fatal error handling
In-Reply-To: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
References: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
Message-ID: <df1faba0582c8e60730e7d86900a38d6@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-06-08 17:11, Stanimir Varbanov wrote:
> Changes since v1:
>   * replace pm_runtime_get_sync with pm_runtime_resume_and_get in 1/5.
> 
> regards,
> Stan
> 
> Stanimir Varbanov (5):
>   venus: venc: Use pmruntime autosuspend
>   venus: Make sys_error flag an atomic bitops
>   venus: hfi: Check for sys error on session hfi functions
>   venus: helpers: Add helper to mark fatal vb2 error
>   venus: Handle fatal errors during encoding and decoding
> 
>  drivers/media/platform/qcom/venus/core.c    |  13 ++-
>  drivers/media/platform/qcom/venus/core.h    |   6 +-
>  drivers/media/platform/qcom/venus/helpers.c |  16 ++-
>  drivers/media/platform/qcom/venus/helpers.h |   1 +
>  drivers/media/platform/qcom/venus/hfi.c     |  48 +++++++-
>  drivers/media/platform/qcom/venus/vdec.c    |  18 ++-
>  drivers/media/platform/qcom/venus/venc.c    | 116 ++++++++++++++++++--
>  7 files changed, 201 insertions(+), 17 deletions(-)

Tested-by: Vikash Garodia <vgarodia@codeaurora.org>
