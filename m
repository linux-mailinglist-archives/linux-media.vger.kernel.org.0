Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A240475B9BE
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 23:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjGTVsC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 17:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjGTVsB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 17:48:01 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861C52711
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 14:48:00 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-26598fc0825so1713724a91.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 14:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689889680; x=1690494480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twEvmkPU0mxcvyzF5PqdNe8AyZ4NwFNYaQ1CTqmcu+E=;
        b=No5VDdWPDUvfW7+NJOwgoJQDfOD+IhbiqUf5oJwIfT5+B0/WTewqNZPzRdC+JgE/lP
         kjJjektXdbhx3MC2con9lxGY6jtKJu4fUqeSH3TvDBcAMLaRTxOfTxMfNZ8F4mxf+mDR
         KAea+ZtWfUbezLnbGHamUG+Wo9A/RULPP2LYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689889680; x=1690494480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twEvmkPU0mxcvyzF5PqdNe8AyZ4NwFNYaQ1CTqmcu+E=;
        b=JxQdHdGezSWXiJyDb5ubn9hcMeIjfKGUpi063MoFETS0O92/Gn+FTndMU4gfDGFg2M
         CVoX3of6MHEmT3tF00Lq+LZ3ywA9tSwOE6F9Au1aiUEiG2oEYxtQgBHwBFOZ1Efo5XDo
         7BKz8wsEeMh8TD2naTK33V8D9rIL5SX4Eh6pUxAk/NbJZ8f9pJL+tk+jO4g8MPJKN9ev
         VmZbzuf3fobvWPbtZdiI73w4mjCTPgiA3eXDfQh7L+RvC7o4VPBdGP6baPaagWpfXTKS
         UrNAIrAiUX4NRNMqFIsu3qefIYbrhMDFi98YsNJYCcZDmz6rAL7zCZ7jdzEqmE+pvOf8
         nELQ==
X-Gm-Message-State: ABy/qLazBPFSAiPAmQgmDajIpulu+ONZbQjcyYdGsFoQioLxoDim3Syl
        qxb5VffMCvrhTLjzX9NE3XCOrQ==
X-Google-Smtp-Source: APBJJlGgt8Uu256GC15jac2zmoopBLCBf3En87S/BmxQdJUTUmMg3SvdGETr/NVT/gJlxKlMTrezCw==
X-Received: by 2002:a17:90b:118e:b0:262:fe4b:b45 with SMTP id gk14-20020a17090b118e00b00262fe4b0b45mr171679pjb.19.1689889680021;
        Thu, 20 Jul 2023 14:48:00 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id lc14-20020a17090b158e00b002612150d958sm3082786pjb.16.2023.07.20.14.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 14:47:59 -0700 (PDT)
Date:   Fri, 21 Jul 2023 06:47:55 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        stable@kernel.org, Zubin Mithra <zsm@chromium.org>
Subject: Re: [PATCH v2] media: uvcvideo: Fix OOB read
Message-ID: <20230720214755.GE57770@google.com>
References: <20230717-uvc-oob-v2-1-c7745a8d5847@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717-uvc-oob-v2-1-c7745a8d5847@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/07/20 17:46), Ricardo Ribalda wrote:
> 
> If the index provided by the user is bigger than the mask size, we might do an
> out of bound read.
> 
> CC: stable@kernel.org
> Fixes: 40140eda661e ("media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU")
> Reported-by: Zubin Mithra <zsm@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
