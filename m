Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAA94466443
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 14:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354797AbhLBNM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 08:12:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354377AbhLBNM2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 08:12:28 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904FFC06174A
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 05:09:05 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so2268029wmj.5
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 05:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qkloyzmgkZa50FZSGGF+wfEwZstu/TdZOMc2VxsMJqs=;
        b=apYEp4vpKMGECl5LlrWhArJI/Lx+RPDNkc9Sz/dJ2M/+U/1nkVPXqFJSXrKTvi4apH
         heKE5CoKV4bCpl2WIye7eBXiYDVbgQKE4nqX8FAPpe2CI3Fv6ImWnS3zUO/J9bN6CduI
         tY9May4bHaZJC9BQNuXEJhTJsKCguOtYVS8P1196mtcSGLWYFykp0V0q7euqHqvBnkoe
         b1c0nAbanwZVwusDYW600mdeNN/6vXr3uqZfxSrlPzzuL8faLppgc/0t/YD6J9BkjeBv
         kXlhAy3y6kG2lQWaz1gA5bPuZl3T2+YyELAP66vflwHp679Q6JvDJxODbx7ik9JiPtpo
         58OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qkloyzmgkZa50FZSGGF+wfEwZstu/TdZOMc2VxsMJqs=;
        b=A3nU+Vv/oT9eJPWtI0rCC32q5pt9wtbYJTU28AGDFzGeSvocrmGmkytdfUPFIIKgut
         djajy+LcyFdgIAsI9cMVBWfagd7cye7dOewvUqHKM/O3/oPC8TcLvD+ywS6oQ9dXPBNy
         E8/l+W5WoJjv3Q0YQbkllYopQsAdsiCrjK0DeN/8hedFj60z7mjBD6YqEM3tkl4eH2Bh
         khR9Pd5ui655RDPiQkpds8EtHtTcnfVx31Jb/Hpt76UBMXDEZD4msc+FnOtRtPpKHBnm
         +zdLFhTLrayrt0ONBgY2l2v4C1+HqBa9v85J+U7NP9+5XRDo25c18TtDGxPvcJPsaglY
         WNpw==
X-Gm-Message-State: AOAM5331G+xGAXMknIH5QQBRDQxTn/wyx6nQu758Fgsc0P8Enzw7kI1b
        KGNx20FcRHBARv4YTfELxPcPWQ==
X-Google-Smtp-Source: ABdhPJxfqQfAywXSxFLngYVN4tPDat61yp/6i71R11WBpwUS44vkgyhgIPpJHV9bt49GoG3JJyALYQ==
X-Received: by 2002:a05:600c:190b:: with SMTP id j11mr6258700wmq.112.1638450544141;
        Thu, 02 Dec 2021 05:09:04 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u15sm1812119wmq.13.2021.12.02.05.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 05:09:03 -0800 (PST)
Message-ID: <76ed0769-897a-5636-81a6-877c72d7df13@linaro.org>
Date:   Thu, 2 Dec 2021 13:11:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2 01/19] media: dt-bindings: media: camss: Add
 qcom,sm8250-camss binding
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, robert.foss@linaro.org,
        jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
 <20211124175921.1048375-2-bryan.odonoghue@linaro.org>
 <a1c7a29d-115c-881f-4f00-fe502365242e@xs4all.nl>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a1c7a29d-115c-881f-4f00-fe502365242e@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/12/2021 13:06, Hans Verkuil wrote:
> Hi Bryan,
> 
> This patch needs to be CC-ed to devicetree@vger.kernel.org. I need an Acked-by from
> the device tree maintainers before I can merge this series.
> 
> Everything else looks good, it's the only thing preventing this from merging.
> 
> Regards,
> 
> 	Hans

np

I'll resend with a cc

