Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88CC938B376
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 17:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235669AbhETPsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 11:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232645AbhETPsF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 11:48:05 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393ECC061760
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 08:46:44 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id kr9so1276310pjb.5
        for <linux-media@vger.kernel.org>; Thu, 20 May 2021 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oQs9jtWBxUSYheKfenr+oS5kRIQjvZiaP96jdn9gsMU=;
        b=sLtEbitldgXrD8ZBjQvwX8vXZsSeGCvELvSzENcd2YSqXu9iBk1TDDVBxvGX2WckOo
         ZLff2Dr5rf7BZosrT+ewzXMyOMJf7XdiMM+n3CouAjKLmyJ4lGRwEzzaStNPUE+WjS7D
         c4LMP0I9t0UmqsR5mCkTOYB5wd2kxuubtNhodBLwxrETygnNDHDCHy31/oGVyKeNzdvA
         oWnKYwvfUNzPUzQWFbzq2skT99K0pE/S0vy4Ytuvbak/Y0917zqNoYtlUW9/+DpwLaIl
         gnMbO4DOkYo0VcpgnuDlYdMT3S9glBXtaGx55Sc4kX843kWuILdUe5osSIXS/GEEbknw
         Mxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oQs9jtWBxUSYheKfenr+oS5kRIQjvZiaP96jdn9gsMU=;
        b=ezPOKiF/g0EWz178LBkZ/uSWRTZ1gs0He6vqOzHHXkbkx3v7onVwSvrVqYtSst3Ajd
         eJGaEEiY9Ac5Q3cxalaMkCFnyHWtzvtZVDMKmKzBWco7JkPWPj0gYu7sGskNfWYQQ4+6
         HTG72Gnsnpb/CwJM4E5xM58U2ftAAADgSVWzRxnHrnB9wE4eHAKmJchhKo+F0/qdiiG9
         Cr4WNxnQ2xQESeLw+g43j9PSDnzYauh//daHDQBv48C+KiArwEUv0024oCszr7/BNC/g
         3oVOZwO2F3pEytlTbk3Vk7DcX6DGKRUyrQLqoeZ1uhrVePL9iTiV3kWXYcWKGReQNacJ
         wCsA==
X-Gm-Message-State: AOAM530Y20crhf7cKKv5iDrbmZh+Rt5oFyPhP7WmGYhsBtpBvI2aVYW4
        DmonGoV04GGvw6TqVmKVtelHRQ==
X-Google-Smtp-Source: ABdhPJxiFrIPGyZeGPWU+3qcevfuOBti/QMH85WV51tQ0Qoku7ZeZreMmR0xPInOvOCdtXteJDisrw==
X-Received: by 2002:a17:90a:fb51:: with SMTP id iq17mr5581236pjb.4.1621525603564;
        Thu, 20 May 2021 08:46:43 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
        by smtp.gmail.com with ESMTPSA id x13sm2654328pja.3.2021.05.20.08.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 08:46:42 -0700 (PDT)
Date:   Thu, 20 May 2021 15:46:39 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Joe Richey <joerichey94@gmail.com>
Cc:     trivial@kernel.org, Joe Richey <joerichey@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Zhangfei Gao <zhangfei.gao@linaro.org>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-accelerators@lists.ozlabs.org
Subject: Re: [PATCH 2/6] KVM: X86: Don't use BIT() macro in UAPI headers
Message-ID: <YKaEX35G9Qmx3thQ@google.com>
References: <20210520104343.317119-1-joerichey94@gmail.com>
 <20210520104343.317119-3-joerichey94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520104343.317119-3-joerichey94@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This feedback applies to all patches in this series.

On Thu, May 20, 2021, Joe Richey wrote:
> From: Joe Richey <joerichey@google.com>
> 
> A previous patch

Heh, I think it goes without saying that the code was introduced by a previous
patch, unless you've invented a time machine, in which case we should talk...

> [1] used the BIT() macro to define the
> KVM_DIRTY_GFN_F_* constants in KVM's UAPI header.
> 
> This macro is defined in the kernel but not in the UAPI headers.
> 
> [1] https://patchwork.kernel.org/patch/11854393

Linking to the patch isn't helpful/desirable in this case because it doesn't
provide any info about when the commit actually landed in the kernel.  And
depending on the whims of the maintainer, what was posted may not exactly match
the code that was commited.

What you want is a Fixes: tag that points at the offending commit.  The Fixes:
tag will also get the fix picked up for stable kernels, though in KVM we often
explicitly add "Cc: stable@vger.kernel.org" (though IIRC tglx prefers not to have
the explicit Cc).

Anyways, the changelog can simply be something like:

  Replace BIT() in KVM's UAPI header with an open coded equivalent.  BIT() is
  not defined in the UAPI headers and its usage may cause userspace build errors.

  Fixes: fb04a1eddb1a ("KVM: X86: Implement ring-based dirty memory tracking")
  Signed-off-by: Joe Richey <joerichey@google.com>
