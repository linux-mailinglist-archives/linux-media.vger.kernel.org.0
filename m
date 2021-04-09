Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAC935A423
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 18:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233657AbhDIQ4h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 12:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234189AbhDIQ4f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 12:56:35 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6252C061761
        for <linux-media@vger.kernel.org>; Fri,  9 Apr 2021 09:56:21 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id i4so3192864pjk.1
        for <linux-media@vger.kernel.org>; Fri, 09 Apr 2021 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=rewoe3CU6NQhZHn3sKpNWMwFtGUPcxHkscQhvZ9rfgY=;
        b=FD20Y6/gmNZQlAQWsrniTXwDZhO/AZ3Ye/ZXFigtco4P5Y6Qe4xKgwzSaR9K6XCXPm
         /Gxerme/sOn8neqs/GhsiUBBfekgS902DMOEXoWrGpKAy+0avJ2KLZnwXhtztzBjP69B
         wPsd/lV6jNOfrak6CNHplcO/FYi5tPEcKwTyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=rewoe3CU6NQhZHn3sKpNWMwFtGUPcxHkscQhvZ9rfgY=;
        b=gfvASS4jym2c7GUs/WS7r89oNO56vA25pcAvFCE00CuK6/IQJcLrXagkRVrOZ1nzY/
         Qw/QTSU4kW76G8Gv29owOqR3ruxLLtFjDZFTzwRUn6DHx3G2Dq4cIxHGC/pW4iaNMd74
         PlDvJzN9qPIMX/+FFMThseq+9ta+mrBQ29acndoN16lYwxsmHwio5qDN5hsQzCWA4MOL
         GSrJr1ONOInqIqBJ9hy1UTRseuAaMqwUlJS+0cLF1LzrzX4bVn1CKaEi1zEc/u7XQrLw
         yyFlGg8Cd6JjTaz1E6bVrianZTG/XniRhxHxHYF0VVJX+xMAe5SdfVPXWgy1a6iKvzHL
         EB4Q==
X-Gm-Message-State: AOAM530oRQLhzIeNpZJaRW5FexhEYFaYFKVUp4w4c1gVwz1hhVzX5p57
        qXeYB46D2eJRL6NRLucW4ihIVw==
X-Google-Smtp-Source: ABdhPJzUc03geYAbLcQczqCE8qtvhv/bRTUXGG1B2mx1gKHENLWZsorD3aooPgWhugvVASb9R+cYrA==
X-Received: by 2002:a17:903:2281:b029:e9:f78:751c with SMTP id b1-20020a1709032281b02900e90f78751cmr13787318plh.19.1617987381289;
        Fri, 09 Apr 2021 09:56:21 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:44c3:3248:e7f5:1bbd])
        by smtp.gmail.com with ESMTPSA id j19sm2304895pfj.127.2021.04.09.09.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:56:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1617968779-28526-1-git-send-email-dikshita@codeaurora.org>
References: <1617968779-28526-1-git-send-email-dikshita@codeaurora.org>
Subject: Re: [PATCH v4] media: venus : hfi: add venus image info into smem
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, bjorn.andersson@linaro.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Fri, 09 Apr 2021 09:56:19 -0700
Message-ID: <161798737958.3790633.17357856004042185175@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Dikshita Agarwal (2021-04-09 04:46:19)
> Fill fw version info into smem to be printed as part of
> soc info.
>=20
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> change since v3:
>  added dependency on QCOM_SMEM (Stephen)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
