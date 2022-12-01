Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D77763E8A4
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 04:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiLADtX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 22:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiLADtG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 22:49:06 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A04A6B6A
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 19:47:15 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id v3so575099pgh.4
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 19:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vjWb2PuP119bMf+GK5jEbG/8ZqzIqOIvy9kaxYB0Tnw=;
        b=jIewRzsd3S79+Y422hWMrEfqBDxCTDRz0KyJkj2zg2sw/64vKXo3gLQ9jMcaYQUnhU
         EPTJ0IoiMaqeTmpaUdc5y3webLHZ6kkm9zZPFZ4C8AysBWQiBlabXNA0WE4sZnLThgmb
         vteANXiKn+GpsWUdA6uJoFJ0kkmXOkeNm0Ngs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjWb2PuP119bMf+GK5jEbG/8ZqzIqOIvy9kaxYB0Tnw=;
        b=L43Mhsv2ucLmjOCEPN0+2wKuikOkXRtbs/LCFOcazXp72gf8V/UKA4u2GaR1dw+Z5v
         7PF4AO9cqTr0ltzipYePF8jzV4hvDnGo/1D7TVqKLxO6HKz/DZV/9y3ku4TfS25pjbXg
         gAU7PHmSgnPrIkKJvS2qwoBHFpkbhpuvhdU4286zFUtHxFRci2vyBgvL24b6V8/k5P86
         SB7T+0Xskk6b/C5nnTKshtfMLQoO76OFAYy9EJno2Nsn3NrVqg33Nd07tfOkuRostTdf
         eicteAZCjfooZa6thlPCeBxNWv+JEW6SItT2m5++rHpGgCjKrBVl7IOkrqWnl/yRF1j7
         +NGw==
X-Gm-Message-State: ANoB5pkVe6b6+MwlbmRRtJ6ofKxWOZ6BGND65vbnxsvqyMQuIoJKO2NA
        zHZ5B1Ou3uU9VYakjovZm/VT7Q==
X-Google-Smtp-Source: AA0mqf6mFMfuc2iEp/r2Ru/jswrzNQm9ljwVqquGM8N2w26Tabnl/i4Vi+mpQjz4NCsF4LDLUuS1gQ==
X-Received: by 2002:a63:185a:0:b0:476:e84c:ab63 with SMTP id 26-20020a63185a000000b00476e84cab63mr43406468pgy.496.1669866434876;
        Wed, 30 Nov 2022 19:47:14 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id t9-20020a17090340c900b0016f196209c9sm2278817pld.123.2022.11.30.19.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 19:47:14 -0800 (PST)
Date:   Thu, 1 Dec 2022 12:47:10 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 02/11 RESEND] media: uvcvideo: add
 uvc_ctrl_get_boundary for getting default value
Message-ID: <Y4gjvuv5PhnHpKBS@google.com>
References: <20221201023204.2177458-1-yunkec@google.com>
 <20221201023204.2177458-3-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201023204.2177458-3-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/12/01 11:31), Yunke Cao wrote:
> Introduce uvc_ctrl_get_boundary(), making it easier to extend to
> support compound controls and V4L2_CTRL_WHICH_MIN/MAX_VAL in the
> following patches.
> 
> For now, it simply returns EINVAL for compound controls and calls
> __query_v4l2_ctrl() for non-compound controls.
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
