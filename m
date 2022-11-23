Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE68635EF5
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 14:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238658AbiKWNAW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 08:00:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238498AbiKWM77 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 07:59:59 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED25A414C
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 04:46:38 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id d7so12278748qkk.3
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 04:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vHSuZN4AhWII4Tion5kFnCBewGFiwsSNV+ZIjchf+f8=;
        b=OWqc+/Hcjy1lIN4itSKeUt1Kcn+4uEhyp7axNuC8sBdmRDxXEr1/45JaFAlkEs+ANC
         TTzox7M2rFR6joSL/dcTy/ayQ8/phDoQeWBmeyKWeFkHysVtMOruUYasTM+0EYVpVBTU
         iJJYzUW4aIhktj/Mn0/YtwGPsitoADuYiRaIdCj4+Ifq9+PRR5vjOD0PqtFu1VnIoEp5
         qbvtl/Al85v7h5rs6UtSs4Ie6avliszVZ2ug/lrB5SPZb7L8ptPkjy5Ui9BPfpfEIca8
         20LOtxII2GHAjYH2KE3XX4AZsrbcUetO5EM2ayOptn03TFfYmFrecMcMsQI2P6Hg2l1r
         KAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHSuZN4AhWII4Tion5kFnCBewGFiwsSNV+ZIjchf+f8=;
        b=RSCgEOxhQ6V4KGq4Y1v8Zlw7fsWspVLsdo7lZ70BcBhmrrrGSgbC0RDfLwGO+p3KD6
         0IvSyZSYZ7y4N7MdTknPmQC7/UqTA2VapWR5+6EQmM1CcTucCWUbrkerr/yGDPw+xru/
         K0cv4J6Qd7pV/dnxd4+bXHIOcAHcvaEN6yTPREJMyQRj9xTiZS3jUNEE4FOZawLsNNqo
         yYGeVrH++8FC+kqGmtFXSyGM6NhxpiXnTLvnmEin9Bp/B/rVHcXXgntG978Yf4H4IYZS
         zab1q8HIehTH6MLvlb//d9078mSzPzJZ7+zeWh82eq5HO/1COnLwUADswrB2xY4mtPAZ
         qORw==
X-Gm-Message-State: ANoB5pksLKmQeDDyVwwYF3xbWa5GnJ8u9vTnGJnhrScmSmMOoLt7Vwz5
        bKgMtVOiJqOHexHcTdMM43dKoA==
X-Google-Smtp-Source: AA0mqf5Pm6Gy/kcLjlysVCJSGWeOxmxlzXEFr3h2NLg2kKMpx3KAmbZGLymStChcFWZp5XFVCFIotQ==
X-Received: by 2002:a05:620a:7eb:b0:6fa:aa59:ef9d with SMTP id k11-20020a05620a07eb00b006faaa59ef9dmr25280510qkk.108.1669207589794;
        Wed, 23 Nov 2022 04:46:29 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id r5-20020a05620a298500b006ecf030ef15sm12216462qkp.65.2022.11.23.04.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 04:46:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1oxp91-00AJCh-Qz;
        Wed, 23 Nov 2022 08:46:27 -0400
Date:   Wed, 23 Nov 2022 08:46:27 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
Message-ID: <Y34WI9SZdiH/p1tA@ziepe.ca>
References: <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 23, 2022 at 11:06:55AM +0100, Daniel Vetter wrote:

> > Maybe a GFP flag to set the page reference count to zero or something
> > like this?
> 
> Hm yeah that might work. I'm not sure what it will all break though?
> And we'd need to make sure that underflowing the page refcount dies in
> a backtrace.

Mucking with the refcount like this to protect against crazy out of
tree drives seems horrible..

The WARN_ON(pag_count(p) != 1) seems like a reasonable thing to do
though, though you must combine this with the special PTE flag..

Jason
