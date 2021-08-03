Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8E13DE44A
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 04:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233562AbhHCCSd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 22:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233304AbhHCCSd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 22:18:33 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54D3C06175F
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 19:18:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g13so37106941lfj.12
        for <linux-media@vger.kernel.org>; Mon, 02 Aug 2021 19:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p0Rg8uoQAdCMqNvWG4KJ4Lml0OYquOl0PzeY+NghgIs=;
        b=rJeSRXesNgqD/ctsEcHci3GJIr+ZkXbWSPIKY0cGUASov47tyDQAO5lBimd0asmIsL
         +4rmPRHpsXvlmc0U/W2TuK9bg1MhTeOs7bo8xF8pbSMAURvWUezdYoi0kluk8bQwRucC
         sVI0o4Nkcozxs0qQcniS007Mw17HutvMJYPWo5XFmdPmurdTI4nsoUb6cEW5QHA4gsJ4
         MY2BCxRTcVYUddEibbqdE6MT3YsNNPvMNUJ4G0z+qJSPoRFIEO4PXKaGHgQ81CJhLojN
         HoAJQ0Sf6F0cfaImhnZg544kzLmUxPDV3XS8Ilm6pjvOYyzbU5onvpQy6uTTI+FiM5Jk
         1R8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p0Rg8uoQAdCMqNvWG4KJ4Lml0OYquOl0PzeY+NghgIs=;
        b=f3JbnkSOc1xSRfBClWyWgJF9L+cwkKxMDX9t3hyqX2APQPf5mCDSVBp4hML7adwF+8
         A4TSglkFpWLQDkwAMneAOI2ksxvvvOLOrhvR5YbvDhQBfdb9U0h44NzYteoNOiSPstBt
         0ZgFdW54kd51sbXn5QVL5vk5nyN0jKCUUU453A9JdWssh4C3a90nJaSildZ5duSSGeHp
         dcUkSVLOAA1h7IJ++NS82st6OT4Vm9058oBhJ/Nv4UWgDxriJR8H83/adToXQCREsEAQ
         3TiW6lgbGmYc7zz7uYl+FIEqmv4oBmYI/pMloMcZN6KyI3umoiRy1neSUp2m4FZ43drz
         HFRQ==
X-Gm-Message-State: AOAM531MLGQnGTjtPynOfegxAgYI5ZcKJ/wxTovJmlxb69PxOTwvDRsb
        WWpq8r83xp7jofhZQMS4/WkWwZmkJldVSKLwcLcpEQ==
X-Google-Smtp-Source: ABdhPJwB8Bh43O7mdPYun1vDdLefZZTbI63nsPtzVedjyUVpk4FUL0NZ+QI6+2qAksUHe2ZBeqUpGQ1yETx3aQ9XVsw=
X-Received: by 2002:a19:c10a:: with SMTP id r10mr14608548lff.508.1627957101180;
 Mon, 02 Aug 2021 19:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210722190747.1986614-1-hridya@google.com>
In-Reply-To: <20210722190747.1986614-1-hridya@google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 2 Aug 2021 19:18:09 -0700
Message-ID: <CALAqxLVLMt7rbJBQtFBw-ikBAjKrVgfS8=Nu6NFQbp_gq1m22Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation limit for system heap
To:     Hridya Valsaraju <hridya@google.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 22, 2021 at 12:07 PM Hridya Valsaraju <hridya@google.com> wrote:
> This patch limits the size of total memory that can be requested in a
> single allocation from the system heap. This would prevent a
> buggy/malicious client from depleting system memory by requesting for an
> extremely large allocation which might destabilize the system.
>
> The limit is set to half the size of the device's total RAM which is the
> same as what was set by the deprecated ION system heap.
>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>

Seems sane to me, unless folks have better suggestions for allocation limits.

Reviewed-by: John Stultz <john.stultz@linaro.org>

thanks
-john
