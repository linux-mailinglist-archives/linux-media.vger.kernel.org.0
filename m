Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE97E652943
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 23:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234134AbiLTW7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 17:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbiLTW7j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 17:59:39 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038F31EC7B
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 14:59:36 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso281644pjp.4
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 14:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ICLf78g069YlarZFOH/RAfq/kPyBj0gwwFdq8yqL+kY=;
        b=an3nNST4k6pANUJ6FHis5g0oN1arkIBWn4ilAFg7EcBcScdjimkNix6gTFVAI9JnNw
         7e0mA8rrAfcNnyGqGetv/m4b5N2sLG0C6L/d4Oa/yZxbJBoHV3EKHdTSsBhWdvfGKTkj
         ricVyuRRxm/AtVEcR+jzx1uqGNvOv4tIJHWcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICLf78g069YlarZFOH/RAfq/kPyBj0gwwFdq8yqL+kY=;
        b=fa7cJBm3AC3TxZl1GIskh/veANlhwQmwmQ3EST32L10khJprXPlH+shS3N5qNJXYlr
         9vSPTwVrg4G1C9pv1rfMgDMw3uHMIIH4jt9Xs7sULlh3hewqqzIZ7huVAKQ+K2r3hE6E
         lKGWvHGDwPTbcmIcEsayE8vLi9EKnhndJIXjueGNLz7TbvpQnQQRcCXMjih+Ta4c9P3m
         vC5E7l1aTxn5PZPW96INe1eTS67waNnTwD1hSq5FCOrC1LesyL+CMtwZjDYPoHS1ZyoD
         dpnvkK3mtUjqBt0hhVqiywQSSn5Pp5aycRByQe1zWgYxP7FQn3tQ2Scw44snysV0NTOU
         BXLQ==
X-Gm-Message-State: AFqh2kr0MolJIQXgqxniPuT1Ev0XHWWqYKrSrINYNZ4h5jejIdDltjmk
        4SDPuUq28B4gDLXkOJOA157EvG5woWEiMUMcnnM=
X-Google-Smtp-Source: AMrXdXtRYrwN2vHMyESXghJBST6G7LOrBkYOW7wWZg93SGvFcnMiA76vC335r74B+JFmtW0CxPIfbg==
X-Received: by 2002:a05:6a20:4e24:b0:af:7774:4de4 with SMTP id gk36-20020a056a204e2400b000af77744de4mr13437pzb.22.1671577175412;
        Tue, 20 Dec 2022 14:59:35 -0800 (PST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id mm2-20020a17090b358200b0021937b2118bsm38035pjb.54.2022.12.20.14.59.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 14:59:28 -0800 (PST)
Received: by mail-pj1-f48.google.com with SMTP id u5so13915612pjy.5
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 14:59:28 -0800 (PST)
X-Received: by 2002:a17:90b:1489:b0:219:8132:70db with SMTP id
 js9-20020a17090b148900b00219813270dbmr2554503pjb.183.1671577167363; Tue, 20
 Dec 2022 14:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20221214-uvc-status-alloc-v3-0-9a67616cc549@chromium.org>
 <20221214-uvc-status-alloc-v3-2-9a67616cc549@chromium.org> <20221215124837.GA19113@lst.de>
In-Reply-To: <20221215124837.GA19113@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 20 Dec 2022 23:59:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCsA-Rq4xSLUsAazv=ZjYDOAJNDqFjbNKDno1VzZmUrCDA@mail.gmail.com>
Message-ID: <CANiDSCsA-Rq4xSLUsAazv=ZjYDOAJNDqFjbNKDno1VzZmUrCDA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: uvcvideo: Do not alloc dev->status
To:     Christoph Hellwig <hch@lst.de>
Cc:     Max Staudt <mstaudt@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ming Lei <tom.leiming@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yunke Cao <yunkec@chromium.org>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph

On Thu, 15 Dec 2022 at 13:48, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Dec 15, 2022 at 11:57:19AM +0100, Ricardo Ribalda wrote:
> > +     /*
> > +      * Ensure that status is aligned, making it safe to use with
> > +      * non-coherent DMA.
> > +      */
> > +     struct uvc_status status __aligned(ARCH_KMALLOC_MINALIGN);
>
> This should be ARCH_DMA_MINALIGN, not ARCH_KMALLOC_MINALIGN.
>
> Note that without an __aligned tag on the next member as well, those
> next members might get cache corrupted.
>
> >
> >       struct input_dev *input;
>
> .. and without also aligning the next member you'll might still
> corrupt everything adter the DMAed member.
>
> That's the reason why I generall advocate against playing these
> __aligned games as they can easily go wrong if someone reorders
> the structure.

Thanks a lot for the explanation. I agree, we should keep the
allocation as it is :). Sorry for the noise

Best regards!



-- 
Ricardo Ribalda
