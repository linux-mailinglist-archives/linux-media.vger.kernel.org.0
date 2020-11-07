Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC362AA772
	for <lists+linux-media@lfdr.de>; Sat,  7 Nov 2020 19:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbgKGSln (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Nov 2020 13:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbgKGSln (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Nov 2020 13:41:43 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E668C0613D2
        for <linux-media@vger.kernel.org>; Sat,  7 Nov 2020 10:41:43 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id h2so4488809wmm.0
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2020 10:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VIFvmjQkWdDW6b37HhMnD+C4qQoz3DcHwcIERG/uILw=;
        b=uUhdDeWrWvg3kBhnJ3Z5YbNUUjnHf8w9qNV7Jplf6JSbdZ7NN9mecduDua0Ypen4LI
         q3RGxZW6lSDcmREgAEbrTek0BAC4ZPw3kSH8EZAB27hPAJ2kDdYvfEODw7qFdIy7DDdd
         PHbbkdyxd+Pu1lLwuRITcSqgd8dC7RL2lwV1XC+4fwKpT6yoXraAQXBmVaAoqOuKuPvK
         FhMbqAoO3BK3KHXAaNJ2ojFcmrUx92pVsgd7G78Bq+YoNIPXIb6aeM4kboMNyhspppIk
         /lv5sxHY+q2QuKUuxjBexspwuSO9Yhqp3S4NzwWjBlsFoRMNMMycqFbGs1V1+OPw8lzb
         80/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VIFvmjQkWdDW6b37HhMnD+C4qQoz3DcHwcIERG/uILw=;
        b=Qkssh7VBMzAoiGNO9wM2cX3hgmLqNtb3G5ms7dBdM9LA2/C2Lr8a6D/EZu6o4KeU1I
         Bsjg67+exIIhd9ILY0by8MErKCqGcKoUSFWc/ymFl7/mLcAaXTusBPis86/UttKiURKB
         bBi2gNFyTitD58XSIl6Q1d0lnyOzMjoJ41bhSYu0ovT45hgndnqjDXUkVcWGGvRtxV67
         gbdZLGM1M9QYkLpKP39QJhGufzW61tVKBkvcOqLNnzJUYSukgZe04q7BhH7dj9tX18Gr
         f7tEHuIfXBrfMxIqV5RyttSULqioBQnjQBxXLw/3vBWoFCNfJHpM8mmxIP58gkbL2MjH
         mWXQ==
X-Gm-Message-State: AOAM531XOYDceuAg/5OZfmux3VqybFl3sYFB6oDOh1Oys0ia35C7yZQY
        feN57sdBPIFQ1krK2wdBL/l5cQ==
X-Google-Smtp-Source: ABdhPJweZLZnBdauFcGjFjaKCOPZtQ1RPvK4RlU+S0OevZUoKH28NQgQTvj7HEfsbFBzHknvb1VdXQ==
X-Received: by 2002:a7b:c5c3:: with SMTP id n3mr5782826wmk.44.1604774501714;
        Sat, 07 Nov 2020 10:41:41 -0800 (PST)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id d8sm7061086wmb.11.2020.11.07.10.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 10:41:40 -0800 (PST)
Date:   Sat, 7 Nov 2020 18:41:38 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
        Rob Clark <rob@ti.com>, Gareth Hughes <gareth@valinux.com>,
        amd-gfx@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Keith Whitwell <keith@tungstengraphics.com>,
        Andy Gross <andy.gross@ti.com>, linux-media@vger.kernel.org,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        by <jhartmann@precisioninsight.com>,
        Jeff Hartmann <jhartmann@valinux.com>,
        linux-kernel@vger.kernel.org, Faith <faith@valinux.com>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
Message-ID: <20201107184138.GS2063125@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <9d4be6a4-4f39-b908-4086-2b6adb695465@amd.com>
 <20201107173406.GA1030984@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201107173406.GA1030984@ravnborg.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 07 Nov 2020, Sam Ravnborg wrote:

> Hi Christian.
> 
> > I'm not sure if we want to do some of the suggested changes to radeon.
> 
> All patches for radeon looks good to me except "drm/radeon/radeon: Move
> prototype into shared header".

Was that the one where the prototype needs moving to radeon.h?

> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> from me to have them applied (except the shared header one).

Thanks Sam.

> I can reply to the individual patches if you like.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
