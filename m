Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4AC3FB1E8
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 09:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbhH3H3c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 03:29:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29164 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233109AbhH3H3b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 03:29:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630308518; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1W6zz4vLpLWuK7so4fW2z298+DlEPxFPAHJwtsdQLvo=;
 b=Jwk4ZweBgMyrmoiOQTAqbxKQ4yfBl6UVDxdll3uMxNYUIIOfNu4JX1uwRGoNqc2eTM3aL+9S
 ik21FCbQbvonZm+qU5uwZygWEusodFdrM2NAEjVq84fwcFLViv4uwG1olHl9aSIIHJzFy/6g
 Ur3VrOmnUD1W+H9H8EW73wMGkjY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 612c88936fc2cf7ad91af159 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Aug 2021 07:28:19
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C260CC43460; Mon, 30 Aug 2021 07:28:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 410E3C4338F;
        Mon, 30 Aug 2021 07:28:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 30 Aug 2021 12:58:18 +0530
From:   dikshita@codeaurora.org
To:     stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/7] media: venus: Enable venus support on sc7280
In-Reply-To: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
References: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
Message-ID: <22c9b9b2183fce1f426a7b82d71999ad@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stan,

Could you pls review and ack this series.

Thanks,
Dikshita

On 2021-08-10 15:17, Dikshita Agarwal wrote:
> This series enables support for 6xx venus encode/decode on sc7280.
> 
> The driver changes are dependent on [1]yaml and [2]dts patches.
> 
> [1] 
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=484019
> [2] 
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=484727
> 
> Changes since v3:
>  - addressed comments on v3 (stanimir).
>  - rebased the changes on latest media tree.
> 
> Dikshita Agarwal (7):
>   venus: firmware: enable no tz fw loading for sc7280
>   media: venus: core: Add sc7280 DT compatible and resource data
>   media: venus: Add num_vpp_pipes to resource structure
>   media: venus: hfi: Skip AON register programming for V6 1pipe
>   venus: vdec: set work route to fw
>   media: venus: helpers: update NUM_MBS macro calculation
>   media: venus: Set buffer to FW based on FW min count requirement.
> 
>  drivers/media/platform/qcom/venus/core.c           | 54 
> ++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/core.h           |  2 +
>  drivers/media/platform/qcom/venus/firmware.c       | 42 
> ++++++++++++-----
>  drivers/media/platform/qcom/venus/helpers.c        | 23 +++++----
>  drivers/media/platform/qcom/venus/hfi_cmds.c       |  7 +++
>  drivers/media/platform/qcom/venus/hfi_helper.h     | 14 ++++++
>  drivers/media/platform/qcom/venus/hfi_msgs.c       |  7 +++
>  .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |  6 ++-
>  drivers/media/platform/qcom/venus/hfi_platform.c   | 13 ------
>  drivers/media/platform/qcom/venus/hfi_platform.h   |  2 -
>  .../media/platform/qcom/venus/hfi_platform_v6.c    |  6 ---
>  drivers/media/platform/qcom/venus/hfi_venus.c      |  4 ++
>  drivers/media/platform/qcom/venus/hfi_venus_io.h   |  2 +
>  drivers/media/platform/qcom/venus/vdec.c           | 42 
> ++++++++++++++---
>  14 files changed, 175 insertions(+), 49 deletions(-)
