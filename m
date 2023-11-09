Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E117E6B41
	for <lists+linux-media@lfdr.de>; Thu,  9 Nov 2023 14:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjKINdS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 08:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbjKINdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 08:33:17 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D546E30D2
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 05:33:14 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so6276695e9.3
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699536793; x=1700141593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xpZwQq3ClKTYPqwZFJ8l0YbmBZ7IrKMSjUDuetQBQo=;
        b=Ok9jUSt/nmkrMU4bFIoMFeK9Jn33xLxxj1nBuChRNqZycphGHdmQv+lo57Ey4aH4/Q
         z6ODgMlHQGDPMgz3Wn3oQtA5o+4ifY2bQEjg3WW29FBIdzUOSyQ3h8Jjn+yH30zTYYZw
         xDt6uHqgvJxZBDEhD/MAJAum40s6lGt+1IQqtkuMYZvdbWZYY3eb1CRN+QDL3rEzOTOm
         JIGeB729nklnjapJzUrdpcHEZYbVOB2jmeEKOk8ZgbrNB2+xpXba5Nyj6YsYJWSc8vjD
         hhlsBMen0IW6Z8UgUO12y+5o0cyqD58BYx+8uve8iz3RvGvCcvA4NbuLV8EobnoW1/rL
         Jzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699536793; x=1700141593;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xpZwQq3ClKTYPqwZFJ8l0YbmBZ7IrKMSjUDuetQBQo=;
        b=lYVC0ra9Ccw8T7f4zEoEvoiS77hTh66YWiWZyL5B/LA40F5yzGlsetkjvtkCnfvgu7
         csVe9r3NmHWsIXmi7KFr9NijCHMikp8GLV/VPQnz7mE4xrusSfonqV7W3ECsvO8JXPKA
         GEj0uwk0/9RB/se7bu6aLZnYYygyEZMVB2lg04SzQf9+tkTjv83XpXCch5ML6XK2FbHw
         LPibMan0UXVtQCv1w9caExwvInnSl/qMEemVfuBlpG46NjBixJZzlvKzPWJfZO5xwFKw
         qb4F23k1XJPcyq6Jfj7uhmtuQANRHjRTRy3uHX5mxd/eozYbGIiEtVARvtOzDFzXeN3n
         UuvA==
X-Gm-Message-State: AOJu0YxEVyOpvBZF1w5vDZdHmpKoRKVxqUhr3hSS/b18rU/ys7xXdxWe
        7zK5HzLzFz2A7ql25qGCPv0aNg==
X-Google-Smtp-Source: AGHT+IFuVblGjINXhI9JVRppNqdlOQCvBCHSqn2a5ilSOyiNxyCegKvGpFK7R34K1Lo55kGCcK49MQ==
X-Received: by 2002:a05:6000:2c4:b0:32f:8024:64f1 with SMTP id o4-20020a05600002c400b0032f802464f1mr3936261wry.2.1699536793142;
        Thu, 09 Nov 2023 05:33:13 -0800 (PST)
Received: from [10.66.66.2] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d640d000000b0032d96dd703bsm7425418wru.70.2023.11.09.05.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 05:33:12 -0800 (PST)
Message-ID: <9bcdbc2d-802e-4574-a801-9a234ddfd4f2@linaro.org>
Date:   Thu, 9 Nov 2023 14:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] media: qcom: camss: Add sc8280xp support
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
 <ac253acc-ae03-460a-b982-0a9f780ddb5a@linaro.org>
In-Reply-To: <ac253acc-ae03-460a-b982-0a9f780ddb5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/9/23 14:32, Konrad Dybcio wrote:
> 
> 
> On 11/9/23 12:30, Bryan O'Donoghue wrote:
>> V4:
>> - Drops all _src clocks and _SRC indexes in series.
>>    True enough the CAMCC driver has all of the appropriate SET_PARENT flags
>>    so there's no need to represent _src clocks. - Konrad
> Thanks, and if you have any manhours left, doing so for the
> already-supported SoCs would be great as well..
Of course outside this series

Konrad
