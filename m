Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6222055EED1
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 22:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbiF1UGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 16:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbiF1UGF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 16:06:05 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C4840A3C
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 12:57:29 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id u20so13957341iob.8
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 12:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H/IcYSqHGj13umJjeH8Q2041jy2ApKaQSIoxh4bh4Rs=;
        b=ibUCDZkWNN77uRYjMk2xeuRwqYu3QFHv+XjEUKalQ8LAmY1e0x7JFKaNgmkf8w5cij
         Ecvh2zfz4HRWiS5bMsjVn5JgqSF7HFIrP8Cf4vuaYNmb5uRqx9/qs5aS59VC6mbxPxjY
         m2mTCixjnZ2AxjnjHMC2uPtw+DvlC3trSNG8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H/IcYSqHGj13umJjeH8Q2041jy2ApKaQSIoxh4bh4Rs=;
        b=K47xcxMIw8ETeLTgfx/af7z5E0vVJbw71F0vn5VkFNvyUzrVnl2DNUHsb42J77uwZO
         /I80vmQqCxRpl6enpwuBjRckUE1CqOxX6OJFsbq3kyEmJ14QZWn232PfGWuyXAXPR4u0
         BgBdYCa9mzUfWvPmibrC3Yr+7WcRK+KOHWKn4LKQRnd6HsRDINGFOrYHj9ciol3FV6ZJ
         2gHSkplsJ301WPJzLgzdib89in4ZUzB5BDaqe3Hh6cVbr2y/qurbogc5Y1rlIAZbnswO
         EgBnG1mHnY9DqrzWYdr6Kev+fYYo+5us/Art3sHT9vyU/9EMwrSrTpbqFt8C2lIaMgUA
         XGoQ==
X-Gm-Message-State: AJIora/WuDfsxq2Y2esjaV+23V5Z2iDFFVMddwddbSrhJUbxeJ95RZ7f
        TdFFtlc2/n+6SYy9ZOENMjxP7ITq3HHthg==
X-Google-Smtp-Source: AGRyM1uX1pH4zBchTVsqc/c4DjU8dKbasCjMgSjfq6zYhFl9E51/FvxzckYnrYsITaEBDTXPKxnxcA==
X-Received: by 2002:a02:6d2b:0:b0:332:1027:a2dc with SMTP id m43-20020a026d2b000000b003321027a2dcmr12260792jac.65.1656446248876;
        Tue, 28 Jun 2022 12:57:28 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id u9-20020a056e021a4900b002d946b38ce2sm6081399ilv.46.2022.06.28.12.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 12:57:28 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] media: vimc: documentation for lens
To:     Yunke Cao <yunkec@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220628005353.1719403-1-yunkec@google.com>
 <20220628005353.1719403-3-yunkec@google.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <75485861-f17c-001c-b656-881d3be22144@linuxfoundation.org>
Date:   Tue, 28 Jun 2022 13:57:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220628005353.1719403-3-yunkec@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/27/22 6:53 PM, Yunke Cao wrote:
> Add documentation for vimc-lens.
> Add a lens into the vimc topology graph.
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>   Documentation/admin-guide/media/vimc.dot |  4 ++++
>   Documentation/admin-guide/media/vimc.rst | 19 +++++++++++++++++++
>   2 files changed, 23 insertions(+)
> 

This patch failed to apply. Please rebase to the latest Linux 5.19-rc4
and resend.

thanks,
-- Shuah

