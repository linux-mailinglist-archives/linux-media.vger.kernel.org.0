Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B1163E8A7
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 04:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiLADvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 22:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLADvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 22:51:31 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3571C1
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 19:51:30 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so3973693pje.5
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 19:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZXfW51JdHqlsxIvQQG8UhFoB6YqTx/qrGvgZGz6P04=;
        b=hSQKeLBKfGQwX9deaQZhhjTQojK5nDX1OAhfsyor0d82JCb6kQBijuNMR/PyGLaoCa
         rd72ZSLXjGAY+ZrnTO5k4B0uhQYLHdNFV1NTa6DfZ4Wznf1fEK7ETmuCb1hZbZ2DuJsv
         LTZDGTD8PPkZF5CM7eIGttJcPkvKKtN9blSVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZXfW51JdHqlsxIvQQG8UhFoB6YqTx/qrGvgZGz6P04=;
        b=P+oxeZByEQiq7oERm7GEfnOURFoRPXUAORFaj52Y0Jthjwrvqx1yEAgH0RBU14wa9h
         UllzzvKSdm6LQJO5GrHWZcckr/XyiBIG2ZjM/8YL4f/5a5b+TTpaec6g3QYLG3sQdHKV
         IxDXmQcqD7ZCXRFFQ8XnPQvdy1tdwDpwt/ciXMwNb9CkXygu+YrYpftvPC8qcFNTxotd
         QRUEykuevtsXvh15GGgRfe6QWm1JapHTHJFUyBewoMGyAoEINfg2hp5diDC9Hpfjx8ux
         4jc+wxzUSYEsg2U7FyiNXhHlT8siQlHIYAt/5EUmyuQ++qL6DqiY86wqW95EFZTG9S5n
         bIhw==
X-Gm-Message-State: ANoB5pkyiTopL+Ocuh1u3gDk+WWHiPxIyLlxrdq2xTItNYRcaUzUY6oh
        TGtrsxZUUIdORyd3oc5TrwkHLBCmAD8M4A==
X-Google-Smtp-Source: AA0mqf5qXas+nCCPCnz3jCShvion142XIQXBj1FfnPUBI2RxJyUEcs+cqYKJ19pQpfojZnaRx4F37A==
X-Received: by 2002:a17:90a:df8f:b0:219:20ed:101e with SMTP id p15-20020a17090adf8f00b0021920ed101emr24761431pjv.215.1669866690464;
        Wed, 30 Nov 2022 19:51:30 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id w22-20020a1709026f1600b001872999f58esm2275040plk.189.2022.11.30.19.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 19:51:29 -0800 (PST)
Date:   Thu, 1 Dec 2022 12:51:25 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 10/11 RESEND] media: uvcvideo: support
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Message-ID: <Y4gkvfwPD4EkeLKp@google.com>
References: <20221201023204.2177458-1-yunkec@google.com>
 <20221201023204.2177458-11-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201023204.2177458-11-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/12/01 11:32), Yunke Cao wrote:
> Add support for V4L2_CTRL_WHICH_MIN/MAX_VAL in uvc driver.
> It is useful for the V4L2_CID_UVC_REGION_OF_INTEREST_RECT control.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
