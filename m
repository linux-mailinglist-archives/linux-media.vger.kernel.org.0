Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449251B7901
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 17:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgDXPLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 11:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726908AbgDXPLv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 11:11:51 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EE1C09B045;
        Fri, 24 Apr 2020 08:11:51 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h6so8012305lfc.0;
        Fri, 24 Apr 2020 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NCKvIwAX2lyXMS3V6hPb1K5t940QaLImTpHp7o0dE7s=;
        b=ZPPlj6KejWk1GgqB17PvtCeurdQHT9dJyPcc6ya8nlrJqICXXJUQxO5szQgOw9D+/u
         EzCY3JkhGA7rbu8v44DxyBba204k0ftrATJ02TAt/4dBuMkIhzlclFO7ixNYvtCnYPXg
         Vj0EF2QOxCYxovSVnTdHhWjKMdL8/W+aWrWL/gJUOeVJt0wZG22IH2UrHmgFuMjifPkq
         o6c9HiQINryTwKeTLeh6Oc1MUYB0lJfma2zgJ0dHDoP7agJUrMAToOXKOwpxuM2+DsRN
         ZkUCrzKMPvZ0c8knVIbQUhYNRU8Co59TjlKp1VzmDgG8/OU0M+2YV2UxHO/iiInjvNO5
         v4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NCKvIwAX2lyXMS3V6hPb1K5t940QaLImTpHp7o0dE7s=;
        b=eVDCK/OCE0ZjXSopaoKxFIMljHo9Zbspq6s/AONUIwq5PevvqxPCW4tvqCRJRc187K
         aDIeWJxcC8bY9Uc4/Jvcj0Cn7XBCYE2wFQ3TIU3sArSuLs0pYJKtuzdeuadr+oyEGwV+
         VsHXUkQL6W/HaXvhLtIRNSbFz9vkvzqkT+RwfZflcN25Hoq+ONoM5sfT9s1sd2l4B93c
         SPzYAtTyQUJw1cbpEnVrEk4sffBy22TfHnOOX+JZ7LWe/0j8BuJplNLm8R/kbsFpRfi9
         +VjJJpvNutrDMCThVPimu4QtQSkp/D5mt2xEdT6m6i7STOB+VYw9Pm1B5YWS9dSX4Oz9
         I1tw==
X-Gm-Message-State: AGi0PuZwiVl7PahJrtxuAg6PjrAV/bTYNbDzs/4zWgIUelM7uzEZ+B6t
        sewlowr4PX3oMM7TioVqYlJDlU6s
X-Google-Smtp-Source: APiQypL6Y5pP8frZ9lwc0gIlbRZu3rStQ/IZIVvDo4JJv6attpFW3Fvcwp2bbk7qQ+x9ipofzKGfEw==
X-Received: by 2002:a05:6512:308c:: with SMTP id z12mr6528775lfd.195.1587741108845;
        Fri, 24 Apr 2020 08:11:48 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a26sm4679765lfl.66.2020.04.24.08.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 08:11:47 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
Date:   Fri, 24 Apr 2020 18:11:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.04.2020 06:55, Sowjanya Komatineni пишет:
> Tegra210 contains a powerful Video Input (VI) hardware controller
> which can support up to 6 MIPI CSI camera sensors.
> 
> Each Tegra CSI port can be one-to-one mapped to VI channel and can
> capture from an external camera sensor connected to CSI or from
> built-in test pattern generator.
> 
> Tegra210 supports built-in test pattern generator from CSI to VI.
> 
> This patch adds a v4l2 capture driver with media interface for
> Tegra210 built-in CSI to VI test pattern generator.
> 
> This patch includes TPG support only and all the video pipeline
> configuration happens through the video device node.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/Kconfig          |    2 +
>  drivers/staging/media/Makefile         |    1 +
>  drivers/staging/media/tegra/Kconfig    |   12 +
>  drivers/staging/media/tegra/Makefile   |    8 +
>  drivers/staging/media/tegra/TODO       |   10 +
>  drivers/staging/media/tegra/common.h   |  259 ++++++++
>  drivers/staging/media/tegra/csi.c      |  604 +++++++++++++++++
>  drivers/staging/media/tegra/csi.h      |  144 ++++
>  drivers/staging/media/tegra/tegra210.c |  708 ++++++++++++++++++++
>  drivers/staging/media/tegra/tegra210.h |  190 ++++++
>  drivers/staging/media/tegra/vi.c       | 1127 ++++++++++++++++++++++++++++++++
>  drivers/staging/media/tegra/vi.h       |   72 ++
>  drivers/staging/media/tegra/video.c    |  153 +++++
>  drivers/staging/media/tegra/video.h    |   29 +

The media/tegra/ sounds a bit too generic, the media/tegra-vi/ path
should better reflect the driver, IMO.

It also should be better to name the compiled kernel module as tegra-vi,
IMO.
