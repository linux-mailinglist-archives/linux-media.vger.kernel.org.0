Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE93726D485
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 09:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgIQHUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 03:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgIQHUm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 03:20:42 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243A0C061756
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 00:20:41 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id q4so791646pjh.5
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 00:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=qTwre4ZeIJuKy55xpBHaxVBN8pj7CPhlTLeYSSpiSIU=;
        b=mUK1l+0V3m0aQzgpa7FBva6vX516YzP+V0Ikp9EOOpWanHA6Oqd/eds6F+JWOODp5F
         lRVkvzD5o394JcSu9xKkcS+1wIY/QVYxmY8V/+1GAwI8vuVSxeRJquEr4tUCdJ7dgwBS
         JPwCv9bw4jQvsjgSpvgiFXug1bnoUS8X3LQqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=qTwre4ZeIJuKy55xpBHaxVBN8pj7CPhlTLeYSSpiSIU=;
        b=VADWdfYhzCjHHC2mNaV9l8VJC7CROk8rtCP5A8hAVXYjbx9cJWaOaKjH8M6IU6lxzZ
         tqDLTqpVHY/xgLy9klQvkYtL3gHsUsEGnMFtOcbep6vMh0ZtLTL1TT6+ez2SOZnF4e9p
         3/Ve8zakVPtsAb2iSUpYZ9mQZKQwCjp3ZyLmP1Ct2XUlI3P1gHRZ0uSLRQR+Sq4j8FGj
         q8jXNRp66HlR/CCgFD2vMw555I8HKwvpiHNK2a3mu+I0Y45L7vFaCBEBao1aJHoaZmjE
         d/rYo7OI1LbqPcimFu6a9DbkHKpFOLdweeRwXdX1j7plsbiXl/C676a5dBs51L1l0SMM
         xV4g==
X-Gm-Message-State: AOAM532wLI1kyrNvxucSj89OT/pKcvK0CXuhmKR9Lcr+UL5HMsdNLWXx
        RsnkEvxvYvcWmcFHWF0kIQrGD5/zKozmyg==
X-Google-Smtp-Source: ABdhPJwg+azqcg7sWP3zo0LXxIcosCEY+c69pW80exTxTNCPi7oboCX55uPw+dUh9lC85AB99OkYuA==
X-Received: by 2002:a17:90b:1916:: with SMTP id mp22mr6792303pjb.132.1600327240752;
        Thu, 17 Sep 2020 00:20:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id g23sm19530034pfh.133.2020.09.17.00.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 00:20:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1600305963-7659-2-git-send-email-mansur@codeaurora.org>
References: <1600305963-7659-1-git-send-email-mansur@codeaurora.org> <1600305963-7659-2-git-send-email-mansur@codeaurora.org>
Subject: Re: [RESEND v2 1/4] venus: core: change clk enable and disable order in resume and suspend
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Thu, 17 Sep 2020 00:20:39 -0700
Message-ID: <160032723903.4188128.6871272126838595856@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Mansur Alisha Shaik (2020-09-16 18:26:00)
> Currently video driver is voting after clk enable and un voting
> before clk disable. Basically we should vote before clk enable
> and un vote after clk disable.
>=20
> Corrected this by changing the order of clk enable and clk disable.
>=20
> Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
