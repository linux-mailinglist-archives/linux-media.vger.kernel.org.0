Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA6830D0EC
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 02:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhBCBkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 20:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhBCBkG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 20:40:06 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D1AC061573;
        Tue,  2 Feb 2021 17:39:25 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id d2so3592394pjs.4;
        Tue, 02 Feb 2021 17:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XIYaotR9cVz0dZkIxPzlPF8z5N/cDZctzyKFUN0dyY0=;
        b=cXvYlwrI6hfAyLYI+VmHQVQQhLu2PXgyoCiLpjHxw4UxkHfexWxOgUdgUW1MnTD2H/
         ntSjl0I5N9XmHiEfPfzHzGi+CTkSytba/uqkzTrUbc7UMxjn3pAvr+yrGkXTI44sUI0X
         9JzN8XpI1Gy5EamBEPB7N2MCyMl2yR+5l0IENR5kl8l4FoUnOFNf1k2RnDJvm7irT+QB
         dSKydTAjlcwL3ukWk/UgaC/dOmNnxuyXkbnEfwnV1bTNzh3BMI73eO3ipiQr23jBYCzC
         2vK1mxCvX2O77vR3QD9SE4/tDIbWSSBVcUbUiK6NHAMJn/2hjlQlID/4oN9t7PbsKSe6
         EwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=XIYaotR9cVz0dZkIxPzlPF8z5N/cDZctzyKFUN0dyY0=;
        b=VMwsLdtuNr6/9T2K/2bnNUNyFTvt8lGXOGueQIXT4rZ7KQ78QLRHrgNk55GFBoRP6u
         J39GYd/0Mdxv1RszgvtbFjNIfDafjXbN2NJ/9eqmmCXZXFsAAwztJ+QdFMBuJFiIxFoX
         9o8qs4yvu2xN2bfH9lMdsvjZGXwas4CYozEFRSmPqxd9VENNa7yq7nLdpf7vV09LaR4q
         zRtyr/Ap75gbvwal8hniJxMxOdHYKCaFydswiLzbo/JfAH9g2A5awWble9eXKsTMn2a1
         uoHT/TVRnMQvuuzGT+3t0QJlto/XMx0G4zSu4obZFd9MbuRkwcLnYY3wKADUjmIYcr79
         HHOA==
X-Gm-Message-State: AOAM532NLuVw4NuQnUz+wcVaxT3X8lB9mLcTYBFwVDtDKPli1R733k7C
        oN52FcR6NQjLdl+dq8gFJoQ=
X-Google-Smtp-Source: ABdhPJw4+TJeBM73IhpaxHBiQrVir31ns6RnIpgpHmpCk5j9tXDdCMTWEfxafjtp+R5KhfwTy9JIuQ==
X-Received: by 2002:a17:90a:8906:: with SMTP id u6mr664117pjn.223.1612316365454;
        Tue, 02 Feb 2021 17:39:25 -0800 (PST)
Received: from google.com ([2620:15c:211:201:1502:84f8:ffc3:45b])
        by smtp.gmail.com with ESMTPSA id m10sm217140pjs.25.2021.02.02.17.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 17:39:24 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 2 Feb 2021 17:39:21 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     sumit.semwal@linaro.org, akpm@linux-foundation.org,
        hch@infradead.org, lmark@codeaurora.org, labbott@redhat.com,
        Brian.Starkey@arm.com, john.stultz@linaro.org,
        christian.koenig@amd.com, cgoldswo@codeaurora.org,
        orjan.eide@arm.com, robin.murphy@arm.com, jajones@nvidia.com,
        hridya@google.com, sspatil@google.com, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed
 by linux vm
Message-ID: <YBn+yWIE9eXbgQ2K@google.com>
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203003134.2422308-2-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203003134.2422308-2-surenb@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 02, 2021 at 04:31:34PM -0800, Suren Baghdasaryan wrote:
> Currently system heap maps its buffers with VM_PFNMAP flag using
> remap_pfn_range. This results in such buffers not being accounted
> for in PSS calculations because vm treats this memory as having no
> page structs. Without page structs there are no counters representing
> how many processes are mapping a page and therefore PSS calculation
> is impossible.
> Historically, ION driver used to map its buffers as VM_PFNMAP areas
> due to memory carveouts that did not have page structs [1]. That
> is not the case anymore and it seems there was desire to move away
> from remap_pfn_range [2].
> Dmabuf system heap design inherits this ION behavior and maps its
> pages using remap_pfn_range even though allocated pages are backed
> by page structs.
> Replace remap_pfn_range with vm_insert_page, following Laura's suggestion
> in [1]. This would allow correct PSS calculation for dmabufs.
> 
> [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> (sorry, could not find lore links for these discussions)
> 
> Suggested-by: Laura Abbott <labbott@kernel.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Minchan Kim <minchan@kernel.org>

A note: This patch makes dmabuf system heap accounted as PSS so
if someone has relies on the size, they will see the bloat.
IIRC, there was some debate whether PSS accounting for their
buffer is correct or not. If it'd be a problem, we need to
discuss how to solve it(maybe, vma->vm_flags and reintroduce
remap_pfn_range for them to be respected).

