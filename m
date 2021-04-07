Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32273576BB
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 23:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbhDGVXC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 17:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbhDGVXB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 17:23:01 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47985C061760;
        Wed,  7 Apr 2021 14:22:51 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id u11so7008869wrp.4;
        Wed, 07 Apr 2021 14:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=YqC1MvbDb+PpI/oVtnbZYXRa+wI43UAIv4i3U4Q2Ho4=;
        b=SZf0Pw4lDUzRtid00z08mx0iKP9kHkh9tZ4nw0LpmLTlXz9q8LBz6U3i9XKexOuYqV
         ZSwqTlJhv2T6D2WQs5xDasRhmhUdnpsYbFdjiO+JR7Ghkb+2PcQJDL3W3OsUv+nZq6Mf
         qIx8MLbkOYHw2L09a6TBSeqCpVlfq9Mhj/Od0Ydjyt7uZIyv/DMqlY0v5F7zJxUorqk1
         Cvci8maDOnWX8zSlSvXPCSxtBsYwuABiSler9qw8iiDF6cciw8gN9p4bRrLcIVw2cQR/
         GILKiAt/Fle6VThOPjGKgP6XhqxpSK/3g/zbEOOrBXmFg9LyD8BPMTjweZcsQJ+w2Vlo
         07Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YqC1MvbDb+PpI/oVtnbZYXRa+wI43UAIv4i3U4Q2Ho4=;
        b=LZnbCgtNCMxAnzuwtFU9IZe/852SQ9owBqAGxrmP6h6A0yUE6CV6wEYHWvKHOX9JtB
         LJlPjwImhmpcRWOiyy0ZjCXa/7qnjGGIBgK5lA02MwAJDYKkAu9C2QVOZ9PQxjKcm5GH
         Kdomr3mEitk229pucDo1G3sW5dCXme37hzvSCQDXtct7c4ecfjPB4VEsjnuLZK/XbFYm
         iVFAxZzoX1al5i6m8dy7IW2/ZD31wMFYa+/Fe8ymPXZQ5Fs55WZ2R3F1bJvNAhQVc1W7
         UVT549WjApqNGq9XKnpZ3NdZB09T88Y6aN8prhSYGpI5CN2a5Wi0FPj/KMEEfa+zqwdl
         FBpw==
X-Gm-Message-State: AOAM531wqj22Dm0CI9vdoPBcrl/vPsZTaH7HNRj/Jkva+fkQ4QFDzbIP
        qcRmKSotKOFGmp5RvpvUE5o=
X-Google-Smtp-Source: ABdhPJw0LR/0N07bR1S+Ix97QolAIk1xlDpSQyO/2kV1hMwqR5bJWWafmdduSsH8NiQBWT9q1gg/lA==
X-Received: by 2002:a05:6000:228:: with SMTP id l8mr6667127wrz.401.1617830570090;
        Wed, 07 Apr 2021 14:22:50 -0700 (PDT)
Received: from 192.168.10.5 ([39.46.7.73])
        by smtp.gmail.com with ESMTPSA id n5sm21037581wrp.50.2021.04.07.14.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 14:22:49 -0700 (PDT)
Message-ID: <5b1390ea12eb87c8180de61304d00a7d4bb66436.camel@gmail.com>
Subject: Re: [PATCH][next] media: venus: hfi,pm,firmware: Fix dereference
 before null check on hdev
From:   Muhammad Usama Anjum <musamaanjum@gmail.com>
To:     Colin King <colin.king@canonical.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     musamaanjum@gmail.com, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 08 Apr 2021 02:22:43 +0500
In-Reply-To: <20210407141004.495093-1-colin.king@canonical.com>
References: <20210407141004.495093-1-colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-04-07 at 15:10 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer hdev is being dereferenced twice on the assignment of
> pointers cpu_cs_base and wrapper_base before hdev is being null
> checked.  Fix the potential null pointer dereference issues by
> performing the null check of hdev before dereferencing it when
> assigning cpu_cs_base and wrapper_base.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: ff2a7013b3e6 ("media: venus: hfi,pm,firmware: Convert to block relative addressing")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_venus.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index cebb20cf371f..3eabb2646572 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1094,12 +1094,14 @@ static irqreturn_t venus_isr(struct venus_core *core)
>  {
>  	struct venus_hfi_device *hdev = to_hfi_priv(core);
>  	u32 status;
> -	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
> -	void __iomem *wrapper_base = hdev->core->wrapper_base;
> +	void __iomem *cpu_cs_base, *wrapper_base;
>  
>  	if (!hdev)
>  		return IRQ_NONE;
>  
> +	cpu_cs_base = hdev->core->cpu_cs_base;
> +	wrapper_base = hdev->core->wrapper_base;
> +
>  	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
>  	if (IS_V6(core)) {
>  		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||

Reviewed-by: Muhammad Usama Anjum <musamaanjum@gmail.com>


