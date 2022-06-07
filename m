Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A9453859B
	for <lists+linux-media@lfdr.de>; Mon, 30 May 2022 17:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242536AbiE3P5O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 May 2022 11:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241064AbiE3P4y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 May 2022 11:56:54 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB47B41FAE
        for <linux-media@vger.kernel.org>; Mon, 30 May 2022 08:45:16 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id y199so10862284pfb.9
        for <linux-media@vger.kernel.org>; Mon, 30 May 2022 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UzXLXm8vq0opPbH6M8k2y8y+ok1gbqPBfw980V3Tkyk=;
        b=OC//hEgQZz5hudScLXcI+3NIXxxiRgV/eBvm2OMmnz0Z8udrwsrpuPPA72m7d0+4ad
         YH8xRKqUWhJqk6c2VBbCRt1rsr3umJ9xr10B6r+YoN88npTj2HUNhET6FKAGQ9FpP5sa
         grwNjNYIahG7tnWRMWx/Fv5XTCPwE9/Gvf/AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UzXLXm8vq0opPbH6M8k2y8y+ok1gbqPBfw980V3Tkyk=;
        b=SdyeL79nUPbR1wdypWkGsGhaKwHLE8ywH2LVY0KlnJ0a/SxpSkQrT3KRUhSPgZX7wT
         jQ/08pmsXuKig5tdBvtbMWTb8HmHeE3IeLDEV4h1vZYbeJNI7MjntOEH9mi+6b5WsbjO
         dwZurBUMp0HbZg+Y6rkH/Zg9Y3zekQ2FQ9NZZcJU6NxGZvffxluvyt3hph4pyETm88fl
         TXuz/+r7xr/KDn3XEWSXlz0lWERS0nsVy1O9Q9t7MBGkZQDDdBiP0th89n57D1f5EXUD
         tHq6M4mouQg4C8x5PMjan9oYqAHx5WrUBBdwAi1Z194/KclXKVaYAqDuoTdVU2g5o59e
         YWsQ==
X-Gm-Message-State: AOAM532oveflUECXjKOVmnFN/dXoOVVO0fTzZNMpB3TKLjgkqqOX8sui
        asivuxIEocCrNdxMWEaszbnLVof5WJbTNQ==
X-Google-Smtp-Source: ABdhPJyzRn6dpzJxAThZJd/mUWBZTsKavBYdkXkPO7g2uyd2aZ+PyHCjdemggRcBDIURpiq1V2iudg==
X-Received: by 2002:a63:1163:0:b0:3fa:5e1c:f86f with SMTP id 35-20020a631163000000b003fa5e1cf86fmr32724131pgr.543.1653925516458;
        Mon, 30 May 2022 08:45:16 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:7d2a:ad1f:afa1:7770])
        by smtp.gmail.com with ESMTPSA id 65-20020a620644000000b0050dc7628166sm8935262pfg.64.2022.05.30.08.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 08:45:15 -0700 (PDT)
Date:   Tue, 31 May 2022 00:45:10 +0900
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
Message-ID: <YpTmhixkV7+yh6wo@google.com>
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

On (22/05/30 16:55), Christian K�nig wrote:
> 
> If you just want to create a single dma_fence which is also only bound to a
> single context you can embed the lock into the fence without much problem.
> 
> See how the dma_fence_array does that for example: https://elixir.bootlin.com/linux/latest/source/include/linux/dma-fence-array.h#L37

Christian, I'm not sure I'm following you on the "embed the lock into the
fence without much problem" part. If I understand it correctly this should
be something like:

	fences = kmalloc_array(1, sizeof(*fences), GFP_KERNEL);
	for_each_fence(...) {

		// what spinlock should I use here?

		dma_fence_init(&fences[i], .. &lock ..);
		dma_fence_get(&fences[i]);
	}
	fence_array = dma_fence_array_create(1, fences, ....);
	sync_file_create(&fence_array->base);
