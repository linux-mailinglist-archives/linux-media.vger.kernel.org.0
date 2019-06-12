Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5852941EFE
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 10:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436816AbfFLI0A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 04:26:00 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36881 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730187AbfFLI0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 04:26:00 -0400
Received: by mail-pl1-f194.google.com with SMTP id bh12so6329165plb.4;
        Wed, 12 Jun 2019 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5KktLArBUOD7UNE/RSxB9p8yeyZnfK95gCsWMNHlRI8=;
        b=ZYqaWP9lhPsCU5OjDxArTJB5bBr4l60KVhHS/jHUjG0wBQDRFQpBEhDmx5aof0x96V
         xjAt27Ss6TIkjXNmtY+RFHZnaxtcUoBKCrRq6hBJmyE5DsOXVe6qpikOqvhV+CrbPIrJ
         DRBQWcUkBtQ1EAClTDvvKXdT4YhaWCsWjjeoIJOO6AIStMNtxp9IA7BumEfocc3nIJCz
         2Dq4HNBkXl43mc40bIu2GAlyr6YqsVb+W2EftfI0vRHokLBujYKRXygDmHHK6+VuqI5P
         1K3ee0AjKVuyG69fEJvJPVGLFAdLSGldLcrjGD2Rfv9mrSlEKx8nan4G79zx9HsnIDuU
         1FAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5KktLArBUOD7UNE/RSxB9p8yeyZnfK95gCsWMNHlRI8=;
        b=Pd8gaoEW3fzgU8L82gNy2+hW4QPzXbonnItGzGsF7PZ+sveVd1NvHJJ4uFG6NMg8J5
         6xoFdr2HaL5b+waVWGu8njrgcHiMPFqSfsV8FJ4Wld2dEPg1HzuQFf7obP/tWePpwXFn
         rpmKDZXUdyeR7kb/9nYMDlfqH9Ag66FeGRlVW9VCVBRhrfrEFXJ2v2117ZjhsOXrkeV9
         JD8W4naxF53KpESHWdz1LweEd9AnEXOyPhG+xeV+heSrcMxvPsAt311tkTFY0EcD7NUU
         LobcqEWtgpP3ZYbfJBqVYb/EOCm1oCyW7PolcOJeemZKV3v//wmZMJW74Sp4evn2ncWV
         FC0w==
X-Gm-Message-State: APjAAAV2HqiaCgaKZCAM1osEGSH/kbOO1Oi1d9XtJj820PeQqw1Vv6bl
        1klJ9mRh0yqVK6UScSDHfTg=
X-Google-Smtp-Source: APXvYqy3uLUDObUndlzZKGCHTjtuqh5HyOuDno0Hn+nbevH0PlkBlwuEdIxdnRDaQ0zyrH0ATf2A9g==
X-Received: by 2002:a17:902:d717:: with SMTP id w23mr36501859ply.275.1560327959741;
        Wed, 12 Jun 2019 01:25:59 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
        by smtp.gmail.com with ESMTPSA id s15sm14381203pfd.183.2019.06.12.01.25.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 01:25:59 -0700 (PDT)
Date:   Wed, 12 Jun 2019 01:25:49 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
Cc:     "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] dma-buf: refcount the attachment for cache_sgt_mapping
Message-ID: <20190612082549.GA9072@Asurada>
References: <20190612012219.21652-1-nicoleotsuka@gmail.com>
 <261b46c7-0c5e-4268-619d-f8381fbc3aeb@amd.com>
 <20190612080214.GA8876@Asurada>
 <170c3828-115b-38e5-35fc-1b88c08c492a@amd.com>
 <20190612081554.GB8876@Asurada>
 <c5e04bf7-d07e-9e26-df65-d7382d6051ba@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5e04bf7-d07e-9e26-df65-d7382d6051ba@amd.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 12, 2019 at 08:20:41AM +0000, Koenig, Christian wrote:
> Am 12.06.19 um 10:15 schrieb Nicolin Chen:
> > Hi Christian,
> >
> > On Wed, Jun 12, 2019 at 08:05:53AM +0000, Koenig, Christian wrote:
> >> Am 12.06.19 um 10:02 schrieb Nicolin Chen:
> >> [SNIP]
> >>> We haven't used DRM/GRM_PRIME yet but I am also curious would it
> >>> benefit DRM also if we reduce this overhead in the dma_buf?
> >> No, not at all.
> >  From you replies, in a summary, does it means that there won't be a case
> > of DRM having a dma_buf attaching to the same device, i.e. multiple calls
> > of drm_gem_prime_import() function with same parameters of dev + dma_buf?
> 
> Well, there are some cases where this happens. But in those cases we 
> intentionally want to get a new attachment :)

Got it.

> So thinking more about it you would actually break those and that is not 
> something we can do.

That's true...

> > If so, we can just ignore/drop this patch. Sorry for the misunderstanding.
> 
> It might be interesting for things like P2P, but even then it might be 
> better to just cache the P2P settings instead of the full attachment.

I see. Thank you for the answers!
