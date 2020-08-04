Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A74F23B4AF
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 07:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729804AbgHDF5p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 01:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgHDF5p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 01:57:45 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC97C06174A;
        Mon,  3 Aug 2020 22:57:44 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v12so11881366ljc.10;
        Mon, 03 Aug 2020 22:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5U+m+9JSkwxJJhqjPVRn3WLkY6Le0ENenqvq9/Z7HUw=;
        b=uzh1lNvgZJ6EKadMvtyrQbIJtr7vBd1YN8XcQUsa0sjlRqlPFz+Rmrr3NK7eKcgwla
         U9zfXqeLgTpds/90Qm0HlhXZYTM/UX+jwip1OCeDO0hHDqjSf8UITgnfFjf4fMsxdt8H
         8qU0Qse3pbeNGZzi1OilFilWF8vAz4c5Vv96SNqs1o43KJF1xiRQgQMsKPMnLhGtzutr
         bdn455ho3bRaJ0NHR2YG9/R/RR1q0KxtH9c/I9a2T0cFxz+NKCHjimOX2vzTJIcG9eat
         nunyaJk2qwidW+kxkDnHBAS0h46lvFGAMoHwSwstZBcKaFb9jrbcKFgba7f3rOgQTMYg
         OYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5U+m+9JSkwxJJhqjPVRn3WLkY6Le0ENenqvq9/Z7HUw=;
        b=drpQc7aqGGkrRH4gV2P5d4XCOugKgdOVzv8C4PFMG5IJG2UZK8C3POGwY0rkGG1fAj
         bi7KkFINxwfWN87b1/6npocOmf6/QSR11qbYU0DDJcIwr/JxlVSUypCYfhzj50AsTu8S
         Apd6Hubs8CvkEKlfznSOsqrcC7L2/QkqLzMlrNK01R7qgKTqSKI7rNwqB+1TII9IkEjI
         uDwiP7xq/Jek/KwsJj56mzg/iYwl0oGcX88wtlpL9O2Nzs3P0DJ5iovYaPX5iYgdI4l0
         Cjgnmx7HtBJhZ5sZ1uY0ptkd52tW88T1VRpJ7rqnUxWMzBYfqLDaFqpQ21Xwll5jzDLZ
         HTwA==
X-Gm-Message-State: AOAM533L/w19tqreQjVrPZ527sFS9HUOyVNXISGlJMCFYhW2PY1O87rt
        KrULVhxRfT6DY7GCDXKacJZDkxnm
X-Google-Smtp-Source: ABdhPJz+YuuLYuM6oYU0ejGfnA7gf/4ATRAgnz8+lidinPm8XDWxCrf/O2v5WYAIlOrneeEqKzzF2w==
X-Received: by 2002:a2e:804d:: with SMTP id p13mr4942418ljg.359.1596520663024;
        Mon, 03 Aug 2020 22:57:43 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id j4sm5074643ljc.20.2020.08.03.22.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2020 22:57:42 -0700 (PDT)
Subject: Re: [PATCH v8 06/10] media: tegra-video: Add support for external
 sensor capture
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1596469346-937-1-git-send-email-skomatineni@nvidia.com>
 <1596469346-937-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <287fb73c-63b9-e49d-095d-280179736cfc@gmail.com>
Date:   Tue, 4 Aug 2020 08:57:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596469346-937-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

03.08.2020 18:42, Sowjanya Komatineni пишет:
> This patch adds support to capture from the external sensor
> based on device graph in the device tree.
> 
> Driver walks through the device graph to create media links
> between the entities and registers and unregisters video devices
> when the corresponding sub-devices are bound and unbound.
> 
> Channel formats are enumerated based on available formats from
> the sensor and the corresponding matched formats from the Tegra
> supported video formats list.
> 
> Each Tegra CSI instance can be configured as 4-lane or 2-lane
> based on supported lane configuration from the sensor through
> the device tree.
> 
> Currently this driver supports V4L2 video node centric only.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/tegra-video/Kconfig    |   1 +
>  drivers/staging/media/tegra-video/TODO       |   4 -
>  drivers/staging/media/tegra-video/csi.c      | 139 +++++-
>  drivers/staging/media/tegra-video/csi.h      |   1 +
>  drivers/staging/media/tegra-video/tegra210.c |   2 +-
>  drivers/staging/media/tegra-video/vi.c       | 692 +++++++++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h       |  25 +-
>  7 files changed, 800 insertions(+), 64 deletions(-)

This and the rest of the patches look sane to me, thanks.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
