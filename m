Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061F72868CC
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 22:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgJGUEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 16:04:00 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:27377 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727916AbgJGUEA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Oct 2020 16:04:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602101039; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=StpMkHqz702M9TNRAosRWVwfnSKbRhnK2lan3cAXz80=;
 b=VS8r0uelWz+7VPb/8VXNOf567YGibVBUesUYjyELffK+EZbO8vE3AM6XyeTzTEEcaY0lA0X0
 /rhb7ecHBgvZfOZYF7vP9hzPzo9nwaXMviaY+7ZkQ/Hh/bOGiHIfKwxtRYrOKkw10UpTtvyW
 aiOnSGm4cs7TAWCdwZJTz2wOrIc=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f7e1f2fd63768e57be82e62 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Oct 2020 20:03:59
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D365FC433C8; Wed,  7 Oct 2020 20:03:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vgarodia)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0DF09C433CA;
        Wed,  7 Oct 2020 20:03:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Oct 2020 01:33:56 +0530
From:   vgarodia@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: Re: [PATCH 0/3] Venus dynamic resolution change fixes
In-Reply-To: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
References: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
Message-ID: <cd91071c76f8f2151fdcd70a16c19edf@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

On 2020-09-28 22:14, Stanimir Varbanov wrote:
> Hi all,
> 
> Those three patches are needed to fix setting of LAST buffer flag 
> during
> dynamic-resolution-change state.
> 
> The first patch in this series fix the LAST buffer flag setting, the 
> second
> unify the driver behavior no matter the event from firmware is 
> sufficient or
> insufficient resources and the third one is moving the locking from 
> buf_queue
> helper function to encoder and decoder buf_queue vb2 ops.
> 
> Comments are welcome!
> 
> Stanimir Varbanov (3):
>   venus: vdec: Fix non reliable setting of LAST flag
>   venus: vdec: Make decoder return LAST flag for sufficient event
>   venus: helpers: Lock outside of buffer queue helper
> 
>  drivers/media/platform/qcom/venus/core.h    |  5 +-
>  drivers/media/platform/qcom/venus/helpers.c | 15 ++--
>  drivers/media/platform/qcom/venus/vdec.c    | 92 +++++++++++++--------
>  drivers/media/platform/qcom/venus/venc.c    | 11 ++-
>  4 files changed, 76 insertions(+), 47 deletions(-)

I have made some comments which are more towards optimizing the reconfig 
event
handling in the driver. I would leave that up to you to either update in 
this series
or take it separately. Either way, i am good with this series.

Reviewed-by: Vikash Garodia <vgarodia@codeaurora.org>
