Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D49716B70C0
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 09:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjCMIAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 04:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjCMIAO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 04:00:14 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78DA58B74
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 00:57:32 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v16so10409315wrn.0
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 00:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678694242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hBjjdjdk0cAS1l9xYCIeZ3s2HGI/2BEDHI7O2SLVb+M=;
        b=l7ditS0bzw4+S7Xl1P7EEiOMoKK2OTP6z9cH0aimzusa2bYrEpTbrqI+2kzNGfilYT
         la8uRcBUS2zRViU/QlTjXQQp7hM2nsJDFEIvm8GW5oe8O419ClXheuB+uL36qAgsO1uC
         JiP/8HAQNZfXa3NgYbn+pkwZhGesOhs1OlMTJqAG4JeyjRfG/M1s1qPMj3qDgW7Ac3IF
         jnxrBD01Ua1lvrYj6OwKb4XwxF3HYPtCrCst5s5Wz6+ZipeGa4pWuHqEDvTtsGXqkHgl
         /svDKAbYJUqf+p/RhT9WEIrU04bWCLQZAzz4jfqOfX9Iatel23zT997grvvsKrIF0SGC
         V+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBjjdjdk0cAS1l9xYCIeZ3s2HGI/2BEDHI7O2SLVb+M=;
        b=HYNYu+kWL+1CjACtGOfqj8wjy5k1j6wX7424LhO9CV2EJadgiF8I1AyBpS3jcNWkH9
         hRkdCx86VGs51aEIR4FuXR2pwerKLxyV+hyQN2xUwVa5IOsLjODKi8dKP+hesJvravoG
         ZHV7FAwPOQwDrpRUTAbcHQ1qpFFBAs/8n9gqDxtrsePk6Jtri2b+Cw/tGGi/OxeU2hBw
         Q2SNBgTrbhQA0TIiIatTnb/PsMHR8oT93+ITMgSVL5XYxqvcjlxIk1qGUzCKWga96eI5
         ViLdpyLVLS3lXWKBwKbsWxC8WUk/acnkq61CJ8B/6vXzhPTOQskCM3lc40Neklx2ywD0
         ho5Q==
X-Gm-Message-State: AO0yUKXewsm7trAZJYv/PfW3UpwEJL7Rf1Ow3VMeuEN2wTgldYXjXFHW
        3Qs19B7afy2iVaHXZaF0zQg=
X-Google-Smtp-Source: AK7set/tjpa2KAgRVVFGL0attyU2FJJPtCOnIyI2aOXdMJInYkv59Rlk1lVXAOXyAbes2Kx0qRx46Q==
X-Received: by 2002:adf:ef90:0:b0:2c5:a38f:ca31 with SMTP id d16-20020adfef90000000b002c5a38fca31mr7369945wro.7.1678694242171;
        Mon, 13 Mar 2023 00:57:22 -0700 (PDT)
Received: from [10.228.210.75] ([80.156.160.146])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d48c3000000b002c54e26bca5sm6965417wrs.49.2023.03.13.00.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 00:57:21 -0700 (PDT)
Message-ID: <d5776457-6fae-2192-ffe4-2791a595b1e3@googlemail.com>
Date:   Mon, 13 Mar 2023 08:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [v4l-utils] [PATCH v10 1/5] Add support for meson building
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        mchehab@kernel.org, sean@mess.org
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
 <20230223164441.22719-2-laurent.pinchart@ideasonboard.com>
 <250e45e0-de13-5ef8-ce68-eb2cc9e58f73@googlemail.com>
 <20230312144903.GO2545@pendragon.ideasonboard.com>
From:   Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <20230312144903.GO2545@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 12.03.23 15:49, Laurent Pinchart wrote:
> Will you submit the patch to the linux-media mailing list ?

after fighting more than one hour with git send-email and Google Mail I 
finally gave up and pushed the patches to the master branch.

/me wishes for:
* a low-entry barrier patch submitting mechanism
* a nice CI system with configuration-as-code
* a bug tracker

Thanks,
Gregor
