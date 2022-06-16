Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2E4154E51B
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 16:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377732AbiFPOkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 10:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbiFPOkv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 10:40:51 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7223D4615D
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:40:50 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id y79so1690049iof.2
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ia+aZunW3/SKqjznpRYEg/RHfjmMJDFiyZNqv2jirLM=;
        b=aWEuyQubEhWx39MU3KZbPWljpQ/qpjkfdQhEOY8dEvXz9Dv6XPiWMtur5UqOnzFRQy
         vpp+URjiRVZMzvxm6JaTw0xD7VHnibAcpg0VaKLvxawGtmvZGa7cd7G7sI9StgUNA6J4
         WpOnwjvCzPLG7yelLNR61930G0Uis9Wy+Siog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ia+aZunW3/SKqjznpRYEg/RHfjmMJDFiyZNqv2jirLM=;
        b=s3k93ynf6n2bv+Rr2bxBPDRLol11T5vDAGaqm2HScHeQIPLolHqmvgITRQWNQrdhcR
         whqSFj5SY7bZ0sBTnDLN0qOwaxG3wdjWFeT51uXW1vWUH2p/v2N6e+CG1+h41ys5zOKE
         a9MrmrL2croYpzNXMSeN/wJpMhKhwCqWAnyzAmcl/BSB07juRpzuu1SXgr7t5TqAHeyA
         6IH3HzsD/z1keVIYc+tqaxFy/VJH+2N9qbRH8n7ldpsq0hB+iXKbORMqu00Vzt+fYh1H
         PV720qmQV48EyA2dA1h+z83OzxQ0S9eUYY2rKybhvhe+55TLavHOwjzk/+41kjyM8KNY
         50QQ==
X-Gm-Message-State: AJIora+r0tXbyc0GWo6p1qgtNZIFYprQ5+jDiY/pX8CYNUvfQo3sUWgR
        ORlUgm6MKXxB5lHDspYHSfIFaQ==
X-Google-Smtp-Source: AGRyM1tPhQaikUpTVFtcjHR5FxDF4yAsDpc3fxELHipLjm9Paq/GPCnKnZmrMXbipHUY64yADzjGBQ==
X-Received: by 2002:a05:6638:1415:b0:331:d318:83ab with SMTP id k21-20020a056638141500b00331d31883abmr2964368jad.126.1655390449856;
        Thu, 16 Jun 2022 07:40:49 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id f13-20020a02cacd000000b0032be3784b9bsm941780jap.117.2022.06.16.07.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 07:40:49 -0700 (PDT)
Subject: Re: [PATCH v1 0/2 RESEND] media: vimc: add ancillary lens
To:     Yunke Cao <yunkec@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220610010111.3418214-1-yunkec@google.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <60301e64-6a74-8395-875a-13f917643baa@linuxfoundation.org>
Date:   Thu, 16 Jun 2022 08:40:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220610010111.3418214-1-yunkec@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/9/22 7:01 PM, Yunke Cao wrote:
> Add a basic version of vimc lens.
> Link lens with sensors using ancillary links.
> Update vimc documentation to reflect this change.
> 
> Yunke Cao (2):
>    media: vimc: add ancillary lens
>    media: vimc: documentation for lens
> 
>   Documentation/admin-guide/media/vimc.dot      |   4 +
>   Documentation/admin-guide/media/vimc.rst      |   3 +
>   drivers/media/test-drivers/vimc/Makefile      |   2 +-
>   drivers/media/test-drivers/vimc/vimc-common.h |   1 +
>   drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
>   drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
>   6 files changed, 177 insertions(+), 21 deletions(-)
>   create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c
> 

Reviewed all three patches

Mauro,

Would you like me to send a pull request for these patches?

Yunke, please make sure to run get_maintainers.pl and include everybody
the scripts asks you to. Leaving out people causes delays in patch
reviews and acceptance.

thanks,
-- Shuah
