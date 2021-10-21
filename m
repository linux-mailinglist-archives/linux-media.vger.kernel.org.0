Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89FE7435DDA
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 11:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhJUJ1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 05:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbhJUJ1B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 05:27:01 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18F9C061755
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 02:24:45 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id ec8so1803346edb.6
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V5V3mrMbGu1ppi6ARFhGUSANkmRh+1a3b9M8ZtI/3z4=;
        b=ddBd6V4x0LmBfVs0vWUySyZVPTrIMF1gV+CCLfHKHDKc3ECi5Fmd/GaH8SzbNtk/8A
         EoM0ln1xJOL7zBl2ZRajrUOHvohw8Swt4OA8rIc81MlinO1h5+ySqYC+40rQ+NxBJfsh
         0W40qXW4TCeVGiqmw6FLXQb2xzRF1kCnx91dmbldr1K5iDIOQbiXILBBSJU5buxK2Cwh
         VWqaUnwpsfR00unKVDXvsRI02792Ajy/YXTWrpOAm53ZkbAG59myMlmtriBJvvSlUxNN
         9eDOkMTVaO29cfs+bdSZS97QtQnH5ut5qvCIgjRS1bZE3Yqdq/vwThRvauytwAAi9T50
         a0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V5V3mrMbGu1ppi6ARFhGUSANkmRh+1a3b9M8ZtI/3z4=;
        b=Tjw47fazJtUFRWl/wSj3P6E9mR0hXyUyfSjcO6CcBh/vuSafB/ji+KLLStW3ceBQqC
         xjJ9vU6dpsrQIrcANfC2G7ufyDkvLM7iG988WI3l5A+QUwpBh2s5wIu9ovmmyWoTqBUo
         6sDqzPS+Rl9UOvB/rGsBLc6k5zBJ2kBxvCvw6jArOJSqHIZX0AEnhnwv5QtsbJ4plCKh
         FGloIs0vnmqEqRUina05eAuou3jy4tA6SU1dn2nDt7+hu3zS5XH/k5xRubcW9J/3ky3v
         hrjwvMhMtvNUfAmeApSSPlm8QqEL4Sv8IqSJ47FBtqcnY9dSVAtnslLmOk6q4PMLuqqS
         LYrQ==
X-Gm-Message-State: AOAM530hNU8r1YEzOWRV65fshXa1hwVxNvtgE5wl9WJoeJVGIglImvZg
        +49q+gTz8An9afpHEmueqrhYMA==
X-Google-Smtp-Source: ABdhPJy8oS0zIhlGWv0DvQGXh9QF2VSWhQLKdi+HZnhxRaaHACjc9YqWyLKfLgZGT7KGPkEhCd2ssw==
X-Received: by 2002:a17:906:8893:: with SMTP id ak19mr6013410ejc.124.1634808284520;
        Thu, 21 Oct 2021 02:24:44 -0700 (PDT)
Received: from [192.168.1.15] (hst-221-64.medicom.bg. [84.238.221.64])
        by smtp.googlemail.com with ESMTPSA id t6sm2558168edj.27.2021.10.21.02.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 02:24:44 -0700 (PDT)
Subject: Re: [PATCH 1/3] dt-bindings: media: venus: Add sdm660 dt schema
To:     Rob Herring <robh@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mchehab@kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, martin.botka@somainline.org,
        robh+dt@kernel.org, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, agross@kernel.org,
        stanimir.varbanov@linaro.org, bjorn.andersson@linaro.org
References: <20211008102119.268869-1-angelogioacchino.delregno@collabora.com>
 <YW824G+mII83pjU5@robh.at.kernel.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <99a0bb09-6892-f103-6eb7-b6333b56090a@linaro.org>
Date:   Thu, 21 Oct 2021 12:24:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YW824G+mII83pjU5@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Rob, I will push this through media tree.

On 10/20/21 12:21 AM, Rob Herring wrote:
> Reviewed-by: Rob Herring <robh@kernel.org>

-- 
regards,
Stan
