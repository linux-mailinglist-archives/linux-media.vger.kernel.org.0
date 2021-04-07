Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7352C3577A1
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 00:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhDGW1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 18:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbhDGW0v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 18:26:51 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50DD9C061761
        for <linux-media@vger.kernel.org>; Wed,  7 Apr 2021 15:26:41 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id s11so376409pfm.1
        for <linux-media@vger.kernel.org>; Wed, 07 Apr 2021 15:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=JXPy38tfqTqfc+T5dVpi1XXHqSqn3E1QM/6f1Rr5mOk=;
        b=i6oxZsrN2uHTsT61cNxB1nxF9hb2PhcteS0JlifLdBsW4BiSL+gbz8trTvNHKaMOMd
         3/SFsC68vJSzHmkLKIz1iOr39J4rPCDvKrNvyBpMY7oyk2c7Ca19WyluVDpR+chWCQk2
         +Gi9lZoKRprSmuvobSbozdQPP4be5kdldZf64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=JXPy38tfqTqfc+T5dVpi1XXHqSqn3E1QM/6f1Rr5mOk=;
        b=git412svzKR0IEpufEWvCHBWVvdLFaVl/cYQw0sqcBLbwkshrprxz0TP2wSAKAd37R
         /s3xloO4MXVZO0T8UUf12tgBQ9q2Z/HOOu5Cc5iIXf8BPxwqLPc71eolESEYWE3omNGE
         u9EFfcfu6+swFjswyB1X/3CULDxQwWxwO2whHKAbt/g3VUq7q/inbOhoIF6wW0C/piQd
         UuzMWVLTh1PxVb5WsSVT8jCPaCoYajkHdk+fGCpa8cCd1Mx9Xd8/1/SuYgSS9yUJ5vpF
         V7NB76Wvk/hJB1C3cdfPb75aVcr3hbsnBeTkqNW0idchmxIWBzO+eX0aaqwV7RlT/qfj
         LKPA==
X-Gm-Message-State: AOAM531+kSAVZmXNgZSMWkAt2j8GcWoYnO2kjM0DA9Ba9C1PwdCXk9Sj
        /qr1T3ch77pc17vxr6eRyzI7cOsZ2p1uPg==
X-Google-Smtp-Source: ABdhPJwuRGlxdxk1WdD4pe5eQF+zxZrxvAYORZ86RBH7fPDz58DVdW+JSKIGoISeFTHJhi0QYinqMw==
X-Received: by 2002:a63:1d18:: with SMTP id d24mr5449733pgd.402.1617834400851;
        Wed, 07 Apr 2021 15:26:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e193:83c5:6e95:43de])
        by smtp.gmail.com with ESMTPSA id t16sm22857191pfc.204.2021.04.07.15.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:26:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1617774437-31293-1-git-send-email-dikshita@codeaurora.org>
References: <1617774437-31293-1-git-send-email-dikshita@codeaurora.org>
Subject: Re: [PATCH v3] media: venus : hfi: add venus image info into smem
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, bjorn.andersson@linaro.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Wed, 07 Apr 2021 15:26:38 -0700
Message-ID: <161783439891.3790633.10162001433140117260@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Dikshita Agarwal (2021-04-06 22:47:17)
> Fill fw version info into smem to be printed as part of
> soc info.
>=20
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>=20
> changes since v2:
> - adressed all review comments.=20
> ---

Please address the krobot errors. Looks like we need a 'depends on
QCOM_SMEM' in the Kconfig for this driver now.
