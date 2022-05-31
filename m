Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62721538A03
	for <lists+linux-media@lfdr.de>; Tue, 31 May 2022 04:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbiEaCvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 May 2022 22:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232597AbiEaCvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 May 2022 22:51:50 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B4B12AFC
        for <linux-media@vger.kernel.org>; Mon, 30 May 2022 19:51:48 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id gc3-20020a17090b310300b001e33092c737so934169pjb.3
        for <linux-media@vger.kernel.org>; Mon, 30 May 2022 19:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xcpbx9Lt9Owdlm64rePa6qexHLWiyypbRMgxN1JLv/M=;
        b=CyYXFkxhZiXQiu14RxVExNHuXRW0mFlO3k3+vtcoaKX56jC5Ba1StMa8qKRpw1gBRQ
         m2pdXOpOXP5yoNapy24x4BR7MDFAg/xRghRxTbuu49cw3iyj+gWoa8iNtf8UAns32Wob
         fQmMqbHWuHhV5B4vVeGxYjmDjsojaHhPcIBeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xcpbx9Lt9Owdlm64rePa6qexHLWiyypbRMgxN1JLv/M=;
        b=MizVd+qQTq7dzchobiT4TiN6i7UBzYgbYjhZXR8awvCQ+0GZmvwQm9PN+9hWut35Xf
         rKiokbyGxCyRIwL6asC3GCXt+jZJJNI4BjmM5dg4rRlSWIToKvkDkkk8fbQ/+dyseh+X
         BYzuUNM7VIILHp/AZvfN1B60e+bqRtw+eN74+rsiRDpW1sLwHGMChBPNpSFUzi7ajpwp
         aakkG2W4d9Q1iovmaKUdYDG148dkovNRnQrd0KQcWbk+48GHV0tvlsbn701OXFtuioWE
         SRWN9MTEjibtH3Q0OKFXzuWPqByAKjiiizuLPd7yoKD+3KpTyCYbPwa2DlrLJozk9QCh
         IZ5A==
X-Gm-Message-State: AOAM530J+DLx0hvrWQ9FbbTTux3sCZNsv/S5soEqLENdMRV9OvqxB/Iw
        TJ/rskN3lNGAGbZpHC7qE1NOwQ==
X-Google-Smtp-Source: ABdhPJylou6Lhk/REVZIpM88w/Cw5uS6g71yGFXefOXkdi3IddUox11VUsoNOmO40/Smst1WUN/3KA==
X-Received: by 2002:a17:90a:de01:b0:1df:cda5:8332 with SMTP id m1-20020a17090ade0100b001dfcda58332mr26157122pjv.123.1653965508382;
        Mon, 30 May 2022 19:51:48 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:7d2a:ad1f:afa1:7770])
        by smtp.gmail.com with ESMTPSA id i16-20020a056a00005000b00518382bceaesm9479310pfk.57.2022.05.30.19.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 19:51:47 -0700 (PDT)
Date:   Tue, 31 May 2022 11:51:42 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@infradead.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-fence: allow dma fence to have their own lock
Message-ID: <YpWCvniLzJfcp684@google.com>
References: <20220530142232.2871634-1-senozhatsky@chromium.org>
 <7eee4274-bd69-df8d-9067-771366217804@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eee4274-bd69-df8d-9067-771366217804@amd.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/05/30 16:55), Christian König wrote:
> Am 30.05.22 um 16:22 schrieb Sergey Senozhatsky:
> > [SNIP]
> > So the `lock` should have at least same lifespan as the DMA fence
> > that borrows it, which is impossible to guarantee in our case.
> 
> Nope, that's not correct. The lock should have at least same lifespan as the
> context of the DMA fence.

How does one know when it's safe to release the context? DMA fence
objects are still transparently refcount-ed and "live their own lives",
how does one synchronize lifespans?
