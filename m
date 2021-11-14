Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6417D44FC48
	for <lists+linux-media@lfdr.de>; Sun, 14 Nov 2021 23:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbhKNWhb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Nov 2021 17:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbhKNWhZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Nov 2021 17:37:25 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123B3C061746;
        Sun, 14 Nov 2021 14:34:21 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b40so38298725lfv.10;
        Sun, 14 Nov 2021 14:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p+aN2Fw/pl9sOfjBfLZbMXZ2NVqQ0RZKH9knWs/miVs=;
        b=l55D4wFasj6Crr+0ib/nhlP3nTxm0LEBZCljqCdzXY6kmqhI0yBTEwP+7/EoEHA6KB
         Avm0kmrzMJce7c2z6BCuO07OTjE/mA6eN0YbjbTsu+6QKh3sRhGt0Vc0eNs3bKsJiAUt
         Pu5rs7226aJjzC2ZNo7ZaYrelcY6659c7wt15xMIwbolyMAop3oXLLr3XAuZZGiqdNfu
         LDoLMRUuOCKfcnTg5f+tz2wMQhnMkVhtuAGZmXMy3o3vv3Sfj9X+LKLRkFn4M1DuHg0a
         6GYL3WMlFY9Elnq8TiBBUT8d4069/LFBRiv/atT+atrFsaEdY22JPFZnOH5jdQ53Vyqk
         zbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p+aN2Fw/pl9sOfjBfLZbMXZ2NVqQ0RZKH9knWs/miVs=;
        b=EdlfiaNKTgsiZGNhXiojK04/1uFnkHsCeC95eKFOKov6BkZpen5CKhI85IFiL94VbI
         KoSt+5xjJm01pkzi3z5OCGeYYSvQHNGZpy59yfucbduYxiWS8TuOZl9W1AYprbak+7XN
         bUx4WB/5b8HM7EdfvDneTiJ7DMIwWPvNW60FiSF4k7VQOFNeaiWnsXCIpt4F6dTBResr
         azFtpiATotxFl5E+/1kXioN1dV3QZ4AJE47DyTIED1kGuNlI+aBMWCeVkDAFQsA1yCc7
         7KHTM1pDihAaBvyc7Fens9S1m48/vyAGHwuHlSrZ3ysvKcR3xvW+2NZf5FHXUDhhyw86
         k99Q==
X-Gm-Message-State: AOAM532z4n4f9AREwmiqeAwZ2ParYmOZffnOBF/hwk4qwwZuZihb3oPB
        Z8tHpdWcz6SEnF2FUJe+/JkympTK0eg=
X-Google-Smtp-Source: ABdhPJx0Fia6fhfP5IM0wKyq+kUl/IAPLqCO8a5Ry8I/ZbsJ6BeZhkgM6kr70/4ASveBq0YiT9LQUw==
X-Received: by 2002:a05:6512:74e:: with SMTP id c14mr29984746lfs.162.1636929259383;
        Sun, 14 Nov 2021 14:34:19 -0800 (PST)
Received: from [192.168.2.145] (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.googlemail.com with ESMTPSA id f17sm1203461lfk.145.2021.11.14.14.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 14:34:19 -0800 (PST)
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
Message-ID: <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
Date:   Mon, 15 Nov 2021 01:34:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211114222353.22435-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

15.11.2021 01:23, Dmitry Osipenko пишет:
> +	vde->secure_bo = tegra_vde_alloc_bo(vde, DMA_FROM_DEVICE, 4096);
> +	if (!vde->secure_bo) {
> +		dev_err(dev, "Failed to allocate secure BO\n");
> +		goto err_pm_runtime;
> +	}

My eye just caught that by accident err variable isn't assigned to
-ENOMEM here. I'll make v2 shortly.
