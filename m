Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AAE031C319
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 21:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhBOUkN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 15:40:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhBOUkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 15:40:09 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C86C061756
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 12:39:28 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id o21so5726455qtr.3
        for <linux-media@vger.kernel.org>; Mon, 15 Feb 2021 12:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=izMPWC9xzdGUwutm2Q6mM8UrXkyQ+i4Rd0btbUUbmuE=;
        b=Qt0K1XUEVhzGGmGW9DPr+ZslPovr8CzYvRlVZE6qa5zt86N4A6SmndrbogZUwOO3Rt
         TTxPfxPpmSBrXu9xKVJq7pZpe4Wl6COfBzooWrSSYg+9FrV7melBNwwcmELOvVLX8PQH
         G6gR5DAFvW3LRvW8BMnuRS/Fc3+v10M4GMCNsjLDwrXu/fG0nWelO/ujXQWE/NFH6sGY
         2kK4sQioDdTzWquAZrlDhFU4gDOZpGNZvVPYMFHaUic5i9uJo5REqwTQm9XtOf84CDmn
         iVGtl52LvSHafrOhRfg2DVIictloHr3dVciOJv3vyyoeSIXlJzGymZhO4ZvUJ7vePLCj
         pImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=izMPWC9xzdGUwutm2Q6mM8UrXkyQ+i4Rd0btbUUbmuE=;
        b=tKlhvmJkkxwh5l5jKTbz2tFbrsS4/R4Q9VLzEL+hcJuCO6n3GNz4kHi1iGSFtm7I4X
         Zjb4K3a/I4hLeeu3UW2ppsPtpHjz+Jt7hp+Hb1EfVhpW9fkBFFKQ4ZdDWvCVCCpIv/Eo
         4SgeKpR2DDqqmoXHfw8y67wIF11n9Uv8njfILdqrTNA1/E8rK8WbdskqzU0NwdC/frUx
         YJJxz03NqMTVK7IKCRhQZ0GlO69K3mtnGCoadpXXPanlN5oc9PPK9q2hp4762hKIY0gz
         tXFZ72O8wnINdtNsreA/t5Y/J31sHj7xEQs45dPvArqqQTrECnfzeyB0X+teLvBtTlU7
         deNA==
X-Gm-Message-State: AOAM531H0ulQM9jCz1prtWbHksupv4lrfZLd+kf/3OgwUY5L3zI4vnae
        BQdmFWNhBTMcB2LydD6DSkw+vA==
X-Google-Smtp-Source: ABdhPJxWqkD3hf4mY/GDpcC4EsRa6i2RiBg3HXU3ro5LrIrS77GYinDVNo+FQ5vbq0WTSCZrhq389g==
X-Received: by 2002:ac8:7456:: with SMTP id h22mr15833673qtr.297.1613421567977;
        Mon, 15 Feb 2021 12:39:27 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id i5sm13131110qkg.32.2021.02.15.12.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 12:39:27 -0800 (PST)
Message-ID: <cdb508e49eb1439f4e4c327d2a6738f219e04bf8.camel@ndufresne.ca>
Subject: Re: DMA-buf and uncached system memory
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org, lkml <linux-kernel@vger.kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Sharma, Shashank" <Shashank.Sharma@amd.com>
Date:   Mon, 15 Feb 2021 15:39:25 -0500
In-Reply-To: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 15 février 2021 à 09:58 +0100, Christian König a écrit :
> Hi guys,
> 
> we are currently working an Freesync and direct scan out from system 
> memory on AMD APUs in A+A laptops.
> 
> On problem we stumbled over is that our display hardware needs to scan 
> out from uncached system memory and we currently don't have a way to 
> communicate that through DMA-buf.
> 
> For our specific use case at hand we are going to implement something 
> driver specific, but the question is should we have something more 
> generic for this?

Hopefully I'm getting this right, but this makes me think of a long standing
issue I've met with Intel DRM and UVC driver. If I let the UVC driver allocate
the buffer, and import the resulting DMABuf (cacheable memory written with a cpu
copy in the kernel) into DRM, we can see cache artifact being displayed. While
if I use the DRM driver memory (dumb buffer in that case) it's clean because
there is a driver specific solution to that.

There is no obvious way for userspace application to know what's is right/wrong
way and in fact it feels like the kernel could solve this somehow without having
to inform userspace (perhaps).

> 
> After all the system memory access pattern is a PCIe extension and as 
> such something generic.
> 
> Regards,
> Christian.


