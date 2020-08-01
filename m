Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99F2234F08
	for <lists+linux-media@lfdr.de>; Sat,  1 Aug 2020 03:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgHABEn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 21:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgHABEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 21:04:42 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2A6C06174A;
        Fri, 31 Jul 2020 18:04:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h19so34171579ljg.13;
        Fri, 31 Jul 2020 18:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BTY9ORqa/NmqSxiM+l8GOdfpcDj/aETw/P73xCc8UJI=;
        b=MuKtyiNAOzSSMiYf9c9kVOiNl848JLDig08Iaen4r1+vLninQtqjaCZEu82SqvOcL9
         Z/b+3CyiSzRswyAeID/F4sft6xeFHQqbv0sUpbgpktxdXffJfmJM0W9tiIpJPqN6yB5G
         pRW+C5GXQbNmOWU5tVEb9i7qIXCoJVXMIFUSoE65uePDNFtkiZTNmRHaNtf6HFtPa5Sa
         AyVix/fqnD39fNomNFwZ/5wSzD2pnLzL68aslTuArnHnvNhGvheXTc31bpF27aX3gfxW
         jYdEc4+Tsi1wlLH42qaKDMF0Qz/gd2je7cyxRX3aaKvrTb1k6UCr/7L+KylakmEOJoJi
         eIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BTY9ORqa/NmqSxiM+l8GOdfpcDj/aETw/P73xCc8UJI=;
        b=B0Jvbki/7uaxpgeoyWwLmDZPyky1gYRs7pB2PGIuzQtHtCUIKJskDTSiP2YRVXqGLp
         BteaKoDAlYEwEX28dFOMI/W3gDEFmlE3kG95ZjQ/lKQ1ftbGOzz4bxB2hyfVE2vxuOD2
         nIziJ6hlc6Cab3dpxhdavIRyfbNZM7Zyij45mPAmQjcEZQCLLIDqf6V6eQ9fN1GziL3e
         zGq9e+pSr4wa95O1EIOFOVugwvJqrGcfbwYzHszfvTUbYX/yQv9107xFErxbxMEHQ0vq
         y+ixsM/QoU1AjmYoxxY+5Chacin2IuGIlpRGXpIyUmLgW+UheJzXRUd/PHuxzPC6/hrM
         IkrQ==
X-Gm-Message-State: AOAM532oPE3RCWoF3vGOmsVwaOoa4sj07Pf8/ZUUgFtiwrkyd+ww4AyB
        4LuKadwoZlAilhVUdhIotSHAcu2W
X-Google-Smtp-Source: ABdhPJwMMHcg26eE0myeFk9RESHLJob8e/K4WadrXIFVgqT8N73wBX3U3uT2G54QvHRdFiwKWEUS0g==
X-Received: by 2002:a2e:2f16:: with SMTP id v22mr2843603ljv.39.1596243880459;
        Fri, 31 Jul 2020 18:04:40 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id s4sm526850lja.124.2020.07.31.18.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 18:04:39 -0700 (PDT)
Subject: Re: [PATCH v7 09/10] media: tegra-video: Add CSI MIPI pads
 calibration
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596231144-12554-1-git-send-email-skomatineni@nvidia.com>
 <1596231144-12554-10-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <af5506d4-52a4-8693-b95b-d1e0a9a53e79@gmail.com>
Date:   Sat, 1 Aug 2020 04:04:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596231144-12554-10-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

01.08.2020 00:32, Sowjanya Komatineni пишет:
> CSI MIPI pads need to be enabled and calibrated for capturing from
> the external sensor or transmitter.
> 
> MIPI CAL unit calibrates MIPI pads pull-up, pull-down and termination
> impedances. Calibration is done by co-work of MIPI BIAS pad and MIPI
> CAL control unit.
> 
> Triggering calibration start can happen any time after MIPI pads are
> enabled but calibration results will be latched and applied to MIPI
> pads by MIPI CAL unit only when the link is in LP11 state and then
> calibration status register gets updated.
> 
> This patch enables CSI MIPI pads and calibrates them during streaming.
> 
> Tegra CSI receiver is able to catch the very first clock transition.
> So, CSI receiver is always enabled prior to sensor streaming and
> trigger of calibration start is done during CSI subdev streaming and
> status of calibration is verified after sensor stream on.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/tegra-video/TODO  |  1 -
>  drivers/staging/media/tegra-video/csi.c | 61 +++++++++++++++++++++++++++++++--
>  drivers/staging/media/tegra-video/csi.h |  2 ++
>  drivers/staging/media/tegra-video/vi.c  | 28 ++++++++++++---
>  4 files changed, 84 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
