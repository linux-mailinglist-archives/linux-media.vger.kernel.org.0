Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11326365C5
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 17:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236692AbiKWQ1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 11:27:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238511AbiKWQ0w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 11:26:52 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56328F3EF
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 08:26:51 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id v8so12755122qkg.12
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 08:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MVWe1KbwH32KSdOuQUG2Cu353SfSlMLZuLamaD0dXtw=;
        b=Np4/bmkbkzbftxGu4Xfe3xPQnjtFBVjVs43hK0IMuIqj9d2b1aoHPdKTK7d9Ke8toz
         vOgB2vyRSUHIOeOu08dhDULtwQ5j+Nbp3OXGGHP8uw0vYLcrZi8vWive1qZKcSt9hoRV
         jFsR4rVjQqfhTeGYX8ZG5pyjJ3Eg2qkFKwYOYV1JnyWVyaKQd5Rmsk3g9LEj/9JeMwHW
         amUNSpUWJBWWt+UHDSHxKcCBFghFqojIUB4o8Z7v5GEjrMyNSaiD1O7YOJziZes7RGDa
         +2zg/YESx8k6j6m/4J/9pN9kTb9ioXiCa5Zk1vAlP3lGUhhmojae4twzM8At5SJfTPkR
         FaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVWe1KbwH32KSdOuQUG2Cu353SfSlMLZuLamaD0dXtw=;
        b=jbvUC0Dyy+UQjelwMX0EbDrIqe7hwkHbsOQBTNon8q74zsGvcLlyVJ3ny5Ky2Ntxd0
         p1YNIUEVuAUILOcICqmzPY177Y5Ru1ghy4ud87NOQAk7KnUWyrmQRw5dx1vA5NQrThOb
         DeCRWgE5bBDD5ok2mU2/vMeJpklYW36m5Kg1AbMN1rsNNyZraP7WfwxHVVBFu7J4ahAc
         i0S3i8TRj/6sMzLOT6e2DKBeMnNAWbLljt9tQcspn4AbKP3iQPP0j9A1vghi/JObJGTp
         Mpd47bULCSnbtLnYLR93n4shYEbK8PM6eTudKm755IrGJoXKWhfsfFoaS7ww2J7T5jhj
         Vutg==
X-Gm-Message-State: ANoB5pmzCihBbL90epSoMADbikIAJT5V+FtJAFKNDUgqxi3IAK9UUs2z
        N9Gs6JrmyOKFSnXn/RoWIGjIhOmwg6IenA==
X-Google-Smtp-Source: AA0mqf4OyB3Ehnx6E7JWKWLmbM/ehJ6uXDD6TAq7u3b6JJ9+PO7nvAjKFynqi4t74Jyi+NjK8gQVJQ==
X-Received: by 2002:a05:620a:2795:b0:6ec:51cd:c376 with SMTP id g21-20020a05620a279500b006ec51cdc376mr22947878qkp.300.1669220810961;
        Wed, 23 Nov 2022 08:26:50 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id q25-20020a05620a2a5900b006ee7923c187sm12521991qkp.42.2022.11.23.08.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 08:26:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1oxsaH-00AONK-SY;
        Wed, 23 Nov 2022 12:26:49 -0400
Date:   Wed, 23 Nov 2022 12:26:49 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <Y35JyVM/jvYjjDb+@ziepe.ca>
References: <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca>
 <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca>
 <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
 <Y34gBUl0m+j1JdFk@ziepe.ca>
 <CAKMK7uEzaUjroODbWe4DtxHQ+gmr7_DVK+fUJjAgMsgP61uGSQ@mail.gmail.com>
 <Y343ijGoqyf73d+I@ziepe.ca>
 <dcb88724-c68e-6f2a-03d5-0641d2e68ec6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcb88724-c68e-6f2a-03d5-0641d2e68ec6@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 23, 2022 at 04:15:05PM +0100, Christian König wrote:

> I have not the slightest idea how people got this impression, but I have
> heard it so many time from so many different sources that there must be some
> common cause to this. Is the maybe some book or tutorial how to sophisticate
> break the kernel or something like this?
> 
> Anyway as far as I can see only correct approach would be to use an MMU
> notifier or more high level hmm_range_fault()+seq number.

It already uses a mmu notifier, this is why I have no idea what the
page ref is doing..

Jason
