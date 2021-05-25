Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E3F390B89
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 23:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232933AbhEYVgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 17:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232573AbhEYVgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 17:36:14 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BFBC06175F
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 14:34:43 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id w127so27839179oig.12
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 14:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=AV1x4xY7BNlvbADnTNrQXi/pFbf3brHLvoWH+DisJu8=;
        b=TVv/M+CITgXJfBorA0YOq7+hshFN1qCmyi7/acuHDjIxa5rN4/3A6i2PsmL5+17oV2
         S+cCUc9QAtjPKA1TU++KXfTwbEPFGfcYc8H/W0Wd844tGn+fT6ZgcjK3Pvjho31P8dTZ
         Zld23f9YNBRYC3Xo68O6dW7FMZ2eny1a2GHAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=AV1x4xY7BNlvbADnTNrQXi/pFbf3brHLvoWH+DisJu8=;
        b=C3+Tzh3KqLTwAC91e/Uny7aw3NHO8o4OA5Njvv+xuwU7VRNLg2yg/36+tR7IOd2ceG
         XVMepky/IDaKZuPJbg+MDG91jM7flZ8sIE89TflaXDd3lHLPTCHsHAcdKiVH3DGDvtk2
         g5PBcp/Fs+N2kWpMY7FKF+bOkda1M+Gd2OSOVGQ55Vgqb9dmM5cVJotKSK7BFe72eZee
         ltW2G+MAw9pmVKNfaHXwCTsumY6Gd/HeD/SuDYWkd97KNW0gMgapeHONZ7uRo30ULcBH
         MtBFOh9Q2Ei9pDPPaeapG0zk0l1H3LZYI6do4FzHtFD43VbWr15scU9csucHAjlJasTd
         VnIQ==
X-Gm-Message-State: AOAM530Xk31czrDx2Rzlk3/JUVgh3MvY8GfTc85ff9kKq1407JCoNwvx
        oQixhngqixGveovwUxowzNtYnf0+whOz66+EWUXK7w==
X-Google-Smtp-Source: ABdhPJyDalNERHMC9OBcejmrwU3aDmCi5jtvRGCgbJT4ryJX3N8M2IpQuBdgh2aLEnO1vLHG6HGVTjg0vZ5ikvYn7LU=
X-Received: by 2002:aca:654d:: with SMTP id j13mr262572oiw.125.1621978482401;
 Tue, 25 May 2021 14:34:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 May 2021 17:34:41 -0400
MIME-Version: 1.0
In-Reply-To: <20210525131051.31250-2-rojay@codeaurora.org>
References: <20210525131051.31250-1-rojay@codeaurora.org> <20210525131051.31250-2-rojay@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 25 May 2021 17:34:41 -0400
Message-ID: <CAE-0n50LiQWZSgHZaPL4xq2Bf-EFTb9U7YJ6Ey3Tja1099ij6g@mail.gmail.com>
Subject: Re: [PATCH V11 1/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
To:     Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Cc:     dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        skananth@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Roja Rani Yarubandi (2021-05-25 06:10:50)
> If the hardware is still accessing memory after SMMU translation
> is disabled (as part of smmu shutdown callback), then the
> IOVAs (I/O virtual address) which it was using will go on the bus
> as the physical addresses which will result in unknown crashes
> like NoC/interconnect errors.
>
> So, implement shutdown callback for i2c driver to suspend the bus
> during system "reboot" or "shutdown".
>
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
