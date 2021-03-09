Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22490333052
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 21:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbhCIUxs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 15:53:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbhCIUxm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Mar 2021 15:53:42 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE199C06174A
        for <linux-media@vger.kernel.org>; Tue,  9 Mar 2021 12:53:41 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id l12so18452006wry.2
        for <linux-media@vger.kernel.org>; Tue, 09 Mar 2021 12:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=3I/q3EG/IHI7OWLh5V7u8JYHe3VN4NygFslGDCdX/wI=;
        b=TYF5YWMpU+aB46Sbxy5ULNmv5TcDAaJAXT85t3pxPJ9pjgt6rjmKNawbfL3ykGdrqb
         rMe2+vdbcPy6v8gk9YQW2OYNkS8LgY7KHkCQChqXeOmzUuwcE5YfVA81L2CshrqZDbBL
         IWC5Ityp6hZCP7h9PolZBK81l0g2qx9N1/t5Z2khTmpmPu1nZ53JpaHxAZztIqMjb3VM
         MK2gzRBj6AUlByiiTzzzAWo5rA/kvCLDPbBbkBmE0CbxA+M/6Gs2X55P/Wck/eG96Dg0
         8bhFjzSe4nQ+JvilP2K8lXEy82Oobiav6HmCPhjHvg3DNDo2eXa97ovFtzvH0SY2Q6/f
         uJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3I/q3EG/IHI7OWLh5V7u8JYHe3VN4NygFslGDCdX/wI=;
        b=IgqDDUJYeq5GhE9Y1SGBKTeZqntxrgYnbZeqBRLZsvoBf+VXv6y5avYSrrXN0gMIxy
         PtIqZDjNLsRCFrmFwHBYv6qZBx18afT1+dOMOTFsJO/gqCj3+29phDNXxVgfFeVwQorv
         soOGpG+2L8PqfOa81BdCNtoJZTSuNVmDgpfyf/MAqwB0sMKzx35ig2TY5XwafRGxKeHt
         DXg1qbwUScn/7CzmJWMJHMV2rQRzlQ3LR3aN461svJD/2wnPpEc9DB9+aaW154XQxbFD
         FwnTPOr92OTbtBBCB8RkD+1pmBXQZGxEgNTLgjbzz/dFaUfPyu0E1frlxK9E0UOrgPm4
         2PJA==
X-Gm-Message-State: AOAM530aBmg4aw8sXs2kllEvZq9MIWYdDWH//LliiWybKIPJM3E6rwVi
        EX3mIXZ3xNCOUPhPK3B5ODYiIw==
X-Google-Smtp-Source: ABdhPJzUPVAEd/6qItSD+NPDdAmk1NXcohdkKkks7iXoEtO3anZObHaPtVkFnPJVDbaHX5l6vQKaoA==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr30149368wrw.277.1615323220628;
        Tue, 09 Mar 2021 12:53:40 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h20sm5615246wmm.19.2021.03.09.12.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 12:53:39 -0800 (PST)
Subject: Re: [PATCH 0/5] Venus msm8916 fixes
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210308105205.445148-1-stanimir.varbanov@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <315c062f-04df-af09-6987-6845862eb40a@linaro.org>
Date:   Tue, 9 Mar 2021 20:55:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210308105205.445148-1-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/03/2021 10:52, Stanimir Varbanov wrote:
> Hello,
> 
> Here are few fixes for msm8916 (Venus v1x):
>   * Two fixes in hfi_parser
>   * One fix related to opp_set_clk_rate
>   * Default header-mode for encoder is changed to join-with-1st-frame
>   * Added support for actual-plane-info for v1x too
> 
> regards,
> Stan
> 
> Stanimir Varbanov (5):
>    venus: hfi_parser: Don't initialize parser on v1
>    venus: hfi_parser: Check for instance after hfi platform get
>    venus: pm_helpers: Set opp clock name for v1
>    venus: venc_ctrls: Change default header mode
>    venus: hfi_cmds: Support plane-actual-info property from v1
> 
>   drivers/media/platform/qcom/venus/hfi_cmds.c  | 24 +++++++++----------
>   .../media/platform/qcom/venus/hfi_parser.c    | 12 ++++++----
>   .../media/platform/qcom/venus/pm_helpers.c    | 20 +++++++++++++++-
>   .../media/platform/qcom/venus/venc_ctrls.c    |  2 +-
>   4 files changed, 39 insertions(+), 19 deletions(-)
> 

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
