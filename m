Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E125293467
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 07:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730342AbgJTFsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 01:48:08 -0400
Received: from z5.mailgun.us ([104.130.96.5]:35672 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730302AbgJTFsI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 01:48:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603172888; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DlWUKsZMBs5+rfXZncpSLNI7e28fGmiAnheUVzpABSE=;
 b=Vd09sm2hVk3vJKXe+mHPnyPTMvNNbMiLZ8PbgaavCZSaCU/9tt8c6hvhuXIfhj/6E2GCs2ho
 610qEdcMwrVZ99mW7BSl54yHFs2WHrkcdqbGlPrecS3SZbZ0FvnqkR7OYV9YO4WrThvQmix9
 qk3+jp4RBMBnsb2rrT2xmr2r7nU=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f8e7a0c06d81bc48d60382a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Oct 2020 05:47:55
 GMT
Sender: asitshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E36F6C433CB; Tue, 20 Oct 2020 05:47:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: asitshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4667DC433C9;
        Tue, 20 Oct 2020 05:47:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 20 Oct 2020 11:17:55 +0530
From:   asitshah@codeaurora.org
To:     linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
        mchehab@infradead.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Cc:     vgarodia@codeaurora.org, dikshita@codeaurora.org
Subject: Re: Update venus firmware files for v5.4
In-Reply-To: <290a085b0fb686ce6aacbd02be560e52@codeaurora.org>
References: <290a085b0fb686ce6aacbd02be560e52@codeaurora.org>
Message-ID: <dfbf51326d00ae72ed2b6149e7ccf570@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Team,

Gentle Reminder. Please let me know if anything is missing.

Regards,
Asit


On 2020-10-08 15:20, asitshah@codeaurora.org wrote:
> Hi Team,
> 
> Please include updated Venus Firmware bins for v5.4.
> 
> Snapshot of pull request is as below, let me know if anything is 
> missing.
> 
>>>>>>> 
> 
> The following changes since commit 
> 00a84c516078defb76fbd57543b8d5c674a9a2be:
> 
>   linux-firmware: Update AMD SEV firmware (2020-09-16 08:01:44 -0400)
> 
> are available in the git repository at:
> 
>   https://github.com/shahasit/video-linux-firmware/tree/master
> 
> for you to fetch changes up to 
> a09b728b77f5e3b335ff85c6c729248e0121f02c:
> 
>   qcom : updated venus firmware files for v5.4 (2020-10-08 15:07:59 
> +0530)
> 
> ----------------------------------------------------------------
> Asit Shah (1):
>       qcom : updated venus firmware files for v5.4
> 
>  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>  qcom/venus-5.4/venus.b02 | Bin 870812 -> 873100 bytes
>  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>  qcom/venus-5.4/venus.mbn | Bin 916924 -> 919212 bytes
>  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>  6 files changed, 0 insertions(+), 0 deletions(-)
> 
> Regards,
> Asit
