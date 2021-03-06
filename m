Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1853232FC09
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 17:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbhCFQrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 11:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhCFQqs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 11:46:48 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A006C06175F
        for <linux-media@vger.kernel.org>; Sat,  6 Mar 2021 08:46:48 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 124-20020a1c00820000b029010b871409cfso1207989wma.4
        for <linux-media@vger.kernel.org>; Sat, 06 Mar 2021 08:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4jFifCx7yzrzHX+eduGEW6ghoeTTOTuTIMNywZZuNQA=;
        b=Yf9RCyC+/HYEajVpFI3VFBvy/aYt08b9GbcZzmWzPlFCXgx50Wt5pIdANNyMXI7heq
         iXwg2y1hviCsf5w7epqsoKW9raF3QQEEbzURg/tO6jqUqngzeVU8NLcPT/tkFMxUqWWa
         CcjgBjOve2Z8QtXlqf7MxzRhBZ6Wzf8Y0Qy3vtWyHq8MlhZED0XCiiU99YbvN4HYXIrr
         X/W0/4KmBVFBrNTKx4VMUyaGYZxc03gZiAiwNgYoY/LUGX9wEAUmawoq9zJSdGfhVUne
         wuUJSmrXkupZw64J33GQXi3pb2ImfQYIw7+NPInl+2wNwc2br95T4Eln5ZixrB+THYm/
         Sl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4jFifCx7yzrzHX+eduGEW6ghoeTTOTuTIMNywZZuNQA=;
        b=lo6H5hIhRmRtaToUC7NdC/UDwYDqChhscYZCRCkJhSMm/r+P85eZGczmS6JF1wVvaq
         uPp7IB9bHSMOK1AxBSQG89ovv2xzca51agEnlVizGfX1S1U/4mfeL6TOUMy134lhIDwr
         dx45S4O8riqJPDem9R7IdiA8QNI2JPcghUGMsbvY8geE0jiw9SOH60mF1HRNLkKD77cf
         mtYjLL3y0Pg+gPHVgtxzdd4DlMSC+wJyuMbXvn+mTy3AtI2N57elekblJK46eRUUtxfX
         /pvqVpo9lXVAZLuwZBmtwy9VOYFuzdFd3sLCTUI7mkAjRFh4XA6GPaMNLUpge7+hNIL2
         ztmQ==
X-Gm-Message-State: AOAM532CP8uiTvtsUE8Kfr2Me1QAaRA6p00T/Qj9eqkSe1HkgaCE7JlK
        oGz8OUb5BWEHxilGR7Gw7/tcLA==
X-Google-Smtp-Source: ABdhPJzRPpyj0Kuzx7M6DUFGJ7UjBSs72yDFF376d3kXOcjwx8mCDZI8tXyxebviRot74bVTVwakXA==
X-Received: by 2002:a7b:c409:: with SMTP id k9mr14161996wmi.151.1615049206774;
        Sat, 06 Mar 2021 08:46:46 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i10sm9034013wrs.11.2021.03.06.08.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 08:46:46 -0800 (PST)
Subject: Re: [PATCH 04/25] media: venus: core,pm: Vote for min clk freq during
 venus boot
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-5-bryan.odonoghue@linaro.org>
 <21b09fd4-0b4c-3acb-ece2-f1a710bbd3fd@linaro.org>
 <94133e43-d250-7359-6cfe-c4956f5185dc@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <3e259bbd-66ee-f50f-f9eb-e788c9c311af@linaro.org>
Date:   Sat, 6 Mar 2021 16:48:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <94133e43-d250-7359-6cfe-c4956f5185dc@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/03/2021 15:01, Stanimir Varbanov wrote:
> Confirmed. This produces regressions on db410c (I haven't tested on
> other platforms yet).

db410c was broken for me on the reference branch prior to sm8250 
additions however AFAICT this change was fine on sdm845.

---
bod
