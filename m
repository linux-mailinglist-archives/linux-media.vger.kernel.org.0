Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB382FCC30
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 08:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730000AbhATH52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 02:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730328AbhATH5D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 02:57:03 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4B0C061757
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 23:56:23 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id u11so7784016plg.13
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 23:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=uD3doS0EVCu1WoiDmQKvRQ7GKx+7H2pBnCgA8Mq4TGY=;
        b=Ik2EQFIOdWoF83W0IFY4s5vJcg5khkzq8iuElxJp2W/hCn54d74jRJlfYqzAFYeaE/
         SCwZ7o4QaSmoCOaLOdCXLvHwC0SwazOJG7I5ZpRXrz/CniD9lcjd8IImxM59SSJEnpNp
         +Un7zsbGbIec4DskaXWM6tUOldf3p/66yeNL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=uD3doS0EVCu1WoiDmQKvRQ7GKx+7H2pBnCgA8Mq4TGY=;
        b=ZqAQbk9MxbNFi17xNTziP+q84OkzHN14YHYGyB1AEvknW61NtitmGzSHun+tW3tKSJ
         gUFOxx2hTyRZ3mFDQ5o4KPW8rKcNzgkj4NiDmFQXEndgWnkQCp9tOmwyBL3Iy37s4b3C
         +chVoQ7FqwjZ36eMb2VBRQaVmhhVGXGCZhaaaiejrFoogrJk96R/6+W914zFTptzgmxC
         v24vAOJRLwcMB5gh8rEp1a76MSPg7FcN0UPFmGgnKpn3hzLza6krNQlgFKlK7vjh9pU0
         d1LURj3WHqjAR9tvQxlTe25rrkI1TQpa0ustQe61xtQsxw2odHKOzIbsBxlqBFSIalep
         xILg==
X-Gm-Message-State: AOAM533QSBeI/IZG2yrKdR0hBWIcIeDATU0tssnW0Jm13FVZZoYy9MBB
        LQbmq6+yJOCimfNgy2SF/rSAzw==
X-Google-Smtp-Source: ABdhPJy0JUQmrhyJ+jBmDeADXQqctK0klVJV0/Qjm9JoxIHblf4rrb/sYMmsksqvU2HE6wOKugM29g==
X-Received: by 2002:a17:90a:eacf:: with SMTP id ev15mr4364491pjb.209.1611129383013;
        Tue, 19 Jan 2021 23:56:23 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id a188sm1362494pfb.108.2021.01.19.23.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 23:56:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1608055716-14796-1-git-send-email-dikshita@codeaurora.org>
References: <1608055716-14796-1-git-send-email-dikshita@codeaurora.org>
Subject: Re: [PATCH v5] venus: core: add support to dump FW region
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Tue, 19 Jan 2021 23:56:20 -0800
Message-ID: <161112938062.3661239.3637358377915949789@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Dikshita Agarwal (2020-12-15 10:08:36)
> Add support to dump video FW region during FW crash
> using devcoredump helpers.
>=20
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>=20
> Major changes since v1:
> - update the name of function (Stephen)
> - store start address and size in resource structure during
>   probe and reuse while dumping (Stephen, Stanimir)
> ---

Can this be picked up for the next merge window?
