Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9899654FE07
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 22:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234538AbiFQUBY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 16:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbiFQUBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 16:01:19 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFCE5AA56
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 13:01:18 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id h187so6598619oif.4
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 13:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JKe3jT9wj8kxwx+lhn3i+a4rhlIcM5Z5Ey30NiC2vMI=;
        b=azcdpCrlSK5Mzv6JAhhMRpAPYC4iPGkeCqwr84C1qRMNwFRLyNPpqiDZaFzA4odr52
         g4Vm6IR5RtXn/lVbSbz9hekYH9BHd4nVIcn5+irdsId7SEMFtC1BRRlKafOGkwhmrlpu
         4ewcgSyMkJg9J07GEhKba3uGXzbOsnz+xItQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JKe3jT9wj8kxwx+lhn3i+a4rhlIcM5Z5Ey30NiC2vMI=;
        b=5fNYjcG7Mq/nNVrB362baoJuEdkIR0WD4g7pgvKXUf9++kxbJ5sseKGWaafKSpBCX6
         IoGZylnACW2dxpAs7EhfG7gGUbP1JGjwfh6loO7CBv33F7XXzkpCQvWJ8w8iIuf7jB1+
         lzUjZnj7vdMYZpxQPU2TDllNRcrnoVMKLQCbgY62VrCtQIgW4reGElI+GAjB2GfEaYnx
         nJNBaIy54CIW6Ymrye5LWg+WcY1aCvcKb1zqCdEekwJUqfqRqi686Gwz5rOYFeRRaMco
         Eu/gWxkozmRR12pvewY1owvpm68Q2u6OSd3I8Ie1gUbwvNGA2vLxyI2Jo8HvstNvobBf
         wgGA==
X-Gm-Message-State: AJIora/WcWw7QJCDvRkrY+iCGVqR/QFwUbcqbjLlaOmschO+cJGkkPGx
        qE/Ba6+t1yqGjQJSsWFB+HEi4w==
X-Google-Smtp-Source: AGRyM1tAZa7dgU3TCyDxf0HFFEP5WL9e4sJu/NA1JcR3g9GWwudOmn6xBb9hEnR0RXygYeJl5bowuA==
X-Received: by 2002:a05:6808:14c9:b0:32f:4a7e:f3b2 with SMTP id f9-20020a05680814c900b0032f4a7ef3b2mr5865974oiw.241.1655496078272;
        Fri, 17 Jun 2022 13:01:18 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id t23-20020a05683022f700b006060322125esm2997636otc.46.2022.06.17.13.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 13:01:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] media: vimc: add ancillary lens
To:     Yunke Cao <yunkec@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220617015745.3950197-1-yunkec@google.com>
 <20220617015745.3950197-2-yunkec@google.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <177345ff-f601-e440-31e0-2c967736af6b@linuxfoundation.org>
Date:   Fri, 17 Jun 2022 14:01:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220617015745.3950197-2-yunkec@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/16/22 7:57 PM, Yunke Cao wrote:
> Add a basic version of vimc lens.
> The lens supports V4L2_CID_FOCUS_ABSOLUTE control.
> Link the lens with vimc sensors using media-controller
> ancillary links.
> 

Commit log lines are usually ~75 charracters long. Make it easier
to read.

> This change can be used to test the recently added ancillary
> links.
> 

Care to add instructions on how one would test ancillary with
this feature?

> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>   drivers/media/test-drivers/vimc/Makefile      |   2 +-
>   drivers/media/test-drivers/vimc/vimc-common.h |   1 +
>   drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
>   drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
>   4 files changed, 170 insertions(+), 21 deletions(-)
>   create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c
> 

thanks,
-- Shuah
