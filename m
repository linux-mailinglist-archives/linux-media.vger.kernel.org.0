Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6ED774D10C
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 11:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbjGJJJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 05:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjGJJJT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 05:09:19 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B69FB
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 02:09:18 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fc04692e20so26319975e9.0
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 02:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688980157; x=1691572157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2KujVDHYVUxo9oYyBlDAbR4tdZQxBizaVaIObje0g9I=;
        b=SXj9Rz4nsv8tsa6nraKDQmFv1NEjRejWmLQwQUVA7Ve3sG8m/jkG3Bxi47Waoppe4F
         FjJpdtWhJwtCa0T+ie550r4vDGkoJQx4BNlQDYwO1uW0E9aVtF57bYCavOFWFWtFubhv
         zC3oPEt0uEbrzrFQaHZ8cwKmn0frKa1X19C0fWhc0uKSk4or0qY11CBzYbXYNb5TqgcL
         oKxqkoUvuxc+N6Fft2Et22Y24nDKvSmZ3qdNH9jtxvlNlpproMgBpSYPJzOQ1XDAT+KV
         odXJEllBBOZwU4RN3jPVsWkedspCXuQWAnPo5HmLPcgi/kPNAlY6uB8hGqP2KJ3DyZqM
         vZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688980157; x=1691572157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KujVDHYVUxo9oYyBlDAbR4tdZQxBizaVaIObje0g9I=;
        b=etpX67+ySxE0+C3ai5ZJZ3Yrzcy3LbxXiayfVm3ridu6t60tUoqppWoy6H6i2Uz3v0
         4feVKLzeea1vfLoKGLNeQt0mSh9Stejt/vnTLcoNtcRfuP3YCUfY264H7YJMkSaBE1He
         bZLDINrFwLfyvewDTPQ5kPaI+nnDRzKUP0387nQhkogE8CF2VHDjIYu3u2VjhNADhcw2
         qHDdMuov6Mne5TrfrVG99lizROfeFdwLQ6hQNnhuH3d1PzvvLSENS+H+w8oZYBruk1K9
         XBlF01NBG13Vc6aDEpXGDVXl6uCQI3A9Pu5HdAJCno7+n3SxRx0V20q6r+aiVKEatWs2
         E57g==
X-Gm-Message-State: ABy/qLZHR79GCY65+fbcAzWnmD5NORi9C6gRQ6Z3TZu9rvm/6ihWPnUj
        ndDUCXdItKuJ8/d1wGeSFAXYNg==
X-Google-Smtp-Source: APBJJlGw+SpNS7MUK0khmZtSeZ1AN2xJ7wVJNGsg5GXZzu8g8injjHRG1t4b1w9W/8CiHP7WUddvHQ==
X-Received: by 2002:a05:600c:2246:b0:3fa:8fc2:3969 with SMTP id a6-20020a05600c224600b003fa8fc23969mr11079304wmm.17.1688980156913;
        Mon, 10 Jul 2023 02:09:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y12-20020a05600c364c00b003fc04eb92cbsm6637423wmq.44.2023.07.10.02.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:09:14 -0700 (PDT)
Date:   Mon, 10 Jul 2023 11:30:52 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Vikash Garodia <quic_vgarodia@quicinc.com>
Cc:     Tang Bin <tangbin@cmss.chinamobile.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Revert "venus: pm_helpers: Fix error check in
 vcodec_domains_get()"
Message-ID: <8215b9e5-e7bb-4739-a39e-e7f39efb053b@kadam.mountain>
References: <e1e46cfd-8d95-4792-ac8f-1237d2af7171@moroto.mountain>
 <7550a762-7b00-514d-07a4-d304a6342ae4@quicinc.com>
 <7d684c80-d9c7-42ca-9ef6-0d4c38ee1876@kadam.mountain>
 <73e7c244-02da-a275-f187-751c8d5b9816@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73e7c244-02da-a275-f187-751c8d5b9816@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 10, 2023 at 01:48:52PM +0530, Vikash Garodia wrote:
> > This is a video accelerator.  I would expect that it could still work
> > without power management.
> It won't, without those 2 power domains enabled for Venus. Does it work for you
> when you disabled the config ?

I have not tested this, I'm reviewing static checker bugs, as I
explained here:

> >>> This patch is also based on static analysis and review so probably best
> >>> to be cautious.  My guess is that very few people disable CONFIG_PM
> >>> these days so that's why the bug wasn't caught.


> Its better enforced in Kconfig. By allowing NULL for
> dev_pm_domain_attach_by_name does not still indicate that the functionality is
> dependent on CONFIG_PM to be enabled.

The way I'm writing it is the correct way.  I explain this better in
my blog.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

Currently it looks like the Kconfig does not have a dependency on
CONFIG_PM.  If we fix the the Kconfig, but leave the "harmless" bug here
then it will still show up as a static checker warning when COMPILE_TEST
is enabled.

We should just do it in the correct way even after we fix the Kconfig.

regards,
dan carpenter
