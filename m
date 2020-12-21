Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652102DFB23
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 11:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgLUKlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 05:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbgLUKlm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 05:41:42 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAF5C0613D3
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 02:41:02 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id y5so8414938iow.5
        for <linux-media@vger.kernel.org>; Mon, 21 Dec 2020 02:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tzabDuWmM3g5ZkaOr2QySkn/9M6a1A2MD8omeBNCWbM=;
        b=OoK9GePTmRNbd6WWPi0aUbjvK9fwYRW49mNoUmvsgE0GRxMQ9EjdYWTRQFXzKM6VV3
         TUPCQFzVNsdor9TmGl6s25zqjVR0tRyoOFGzepRpANjqRNGPpNZkR5dhZyH6qXwDgqnV
         hsrh7rL2/eHAijyYeXEEKiy0QDQNjCobg23N39P44MS2AxATpCtb2lejXlhWpHRDQPNL
         8n4qGA7Yll74ppfXUE3eQAQ6KsiLOzCt/Wa3rudRjbJ66veA4Dv7U1d0f0WhPnQxNznf
         jJI3M91U1n8Sk8BIpIMytPZussgTfiEpwjgpDps3qAhEbEFkFtWGE1GnsR5KEuAShxGj
         2ZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tzabDuWmM3g5ZkaOr2QySkn/9M6a1A2MD8omeBNCWbM=;
        b=od/dyr3+0RwAy8kSQz+qJLIv98IOIJokWwTAKKw73WPZdD7F0jgY8ccCwwFDjw3jeK
         2J/uxz9mhwU8Lf0fS+6PgiCjxNuJGaJpuBQQhlyzz6KATuYQCJaiWuGjnptSwTC0o3YL
         trG2JIH7tJQxbq83S4XCPOei2CAG3ckT1nFzm5d5s6xZ4EH7r7x4qaTXFeP7vCMU0XmV
         4TJZ1nc9Zc73ghzCo/cBiwtsRmQoC/XkwslWAYjVKWcX8WUn4oZ6TqNdcH+6dMryERv7
         D8dk5BL+8t2gtXu+zDJz6H4pa4zv0q1gUK4HyQwCf/dYk/m4KTVrrRvqJ5zA45GjuyNr
         PWQQ==
X-Gm-Message-State: AOAM532xCTgZ8f4DLBEWGev4T/QXcLOCBiYrC7Tdum7BPUfJkw74nPJ0
        i0b7JXifFGBxnS4DwI0Jd2GNvUXNjys3Xgx4RkYNSg==
X-Google-Smtp-Source: ABdhPJyFQyl1t0H4p6tZG/o1SwqRmGMAx0ZxPSCwOV7m56OEBD7j9iKK9VmxZJ3e+OwcF6LCmRCkuR8LP/mn38i3NyQ=
X-Received: by 2002:a05:6602:2b01:: with SMTP id p1mr13586508iov.156.1608547261441;
 Mon, 21 Dec 2020 02:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20201221095820.27192-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20201221095820.27192-1-stanimir.varbanov@linaro.org>
From:   Shawn Guo <shawn.guo@linaro.org>
Date:   Mon, 21 Dec 2020 18:40:50 +0800
Message-ID: <CAAQ0ZWRU71ayBKQG3956XqEBkOmwjKi4LE8_OH=YYZ9LFbZB5g@mail.gmail.com>
Subject: Re: [PATCH] venus: core: Fix platform driver shutdown
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 21, 2020 at 5:58 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> With TZ system reboot cannot finish successfully. To fix that
> enable core clocks by runtime pm before TZ calls and disable
> clocks after that.
>
> Fixes: 7399139be6b2 ("media: venus: core: add shutdown callback for venus")
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

It fixes reboot on Lenovo Yoga C630 laptop for me, so:

Tested-by: Shawn Guo <shawn.guo@linaro.org>
