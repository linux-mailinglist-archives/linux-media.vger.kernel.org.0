Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17F36344A7
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 20:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbiKVTeK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 14:34:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234276AbiKVTeH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 14:34:07 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EAB31EC5C
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 11:34:06 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id jr19so9973334qtb.7
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 11:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gK4Hv+hqSXYYQhPJs2BourCuWSPOf2CqiS0ROx9Lxc8=;
        b=CPzftK7vuA/xYmMuEz95P61nJcTJe12hw3MBpezd1074VzPH8xTgyqV0FUaxEEJksa
         76E8WmyHAbWkclqEsxLZyw2K028d+6oeTL/GrVbXvbaep1xle3bCI/IIXbt14Y0jSeae
         hwFxUpR331wfRKiGtv00NJCgbCSjlwlkaG0f+J1hdhZjyqfzc8T5JlYUGLtO5RVxeXRt
         1uZY0cRWubIqaMorhSYTMqS9yvP45WenKnS+Ug0bOR3i2oIV+EV4Zeh/dcqaRWE8XTev
         /Fdlk5XmoTs+Ej2i8M3uHFhC0B7/BkSvQSjlFsw6fF+5LmOoJQmP6i77iWjxk70IJ0t1
         pZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK4Hv+hqSXYYQhPJs2BourCuWSPOf2CqiS0ROx9Lxc8=;
        b=Bt+FGMh21kLS8ndrDJtHO/z6WqujCqoNCr8uX8wOXvqvU8lyxzFdIYRLkkqXxCNhAe
         nUHJe9PjIHrLUlLBRBdQw8lbHJslJ2FAhA2nEQwWfLnrp1pkPSf0ZySA0CtCMQgnG+9b
         3yqGAi4MNLxY+POrhKCzHqloHmRNUQXNe0sPIVIbnEFoDul0PNky59v28BWyd31GuyvG
         fWTyyhvTJgCRixZw5K/IHL+KMmUk8wiPChIuF2DBfLMp7+LxWMF8zZH/P8l1P4KTEztY
         rtzRxW28RXvwlsVtIStoKlt12AYzxxyV5nH6+y0hDgBQgCLGsHetlUXWX3WEOgkWKlu3
         S2/w==
X-Gm-Message-State: ANoB5pn7ugR1Ot6P3kSxKKeSQOJ5usOKS+C9fq5VPTX5erOs66oFDYOk
        44pVESQJLZYmd5U00i0JaFcksQ==
X-Google-Smtp-Source: AA0mqf6itFyBYcobfUpRF0+IzeljS0J+Jfi+RUYvR39ErLilLCE/4r/HMIncmxqXwEdfvSrcmm2y1g==
X-Received: by 2002:ac8:1019:0:b0:3a5:42b9:d7aa with SMTP id z25-20020ac81019000000b003a542b9d7aamr23027660qti.58.1669145645365;
        Tue, 22 Nov 2022 11:34:05 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id ay20-20020a05620a179400b006faa88ba2b5sm10743137qkb.7.2022.11.22.11.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 11:34:04 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1oxZ1v-009xu2-IB;
        Tue, 22 Nov 2022 15:34:03 -0400
Date:   Tue, 22 Nov 2022 15:34:03 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
Message-ID: <Y30kK6dsssSLJVgp@ziepe.ca>
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 22, 2022 at 08:29:05PM +0100, Daniel Vetter wrote:

> You nuke all the ptes. Drivers that move have slightly more than a
> bare struct file, they also have a struct address_space so that
> invalidate_mapping_range() works.

Okay, this is one of the ways that this can be made to work correctly,
as long as you never allow GUP/GUP_fast to succeed on the PTEs. (this
was the DAX mistake)

Jason
