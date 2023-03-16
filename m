Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCF486BC41D
	for <lists+linux-media@lfdr.de>; Thu, 16 Mar 2023 04:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjCPDFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Mar 2023 23:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbjCPDFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Mar 2023 23:05:18 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7488040E6
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 20:05:14 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id k2so317909pll.8
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 20:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678935914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAJ32JUJ/u8tD4KHo0y/9csx0a9LdOuzb1AC53J8pBo=;
        b=Hzu3b0ypyUtxefOCDdRStwfJPseOMdTDAOe1bNFk+mdav8xOUgCe8HcAY7b/XO7hAV
         rcmOIxBA8lO0WvKMtn3Ydfp/CJ+lREaarW9T/J3AG0KK7O2IQhW3JYe/8WVwYf6+2nwz
         H8gadlIv3MUoprqeXaLCEgiWQCNSzqGJ/sSUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678935914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAJ32JUJ/u8tD4KHo0y/9csx0a9LdOuzb1AC53J8pBo=;
        b=3SdwRFXQG/78nvMfQbyPeEHQtdHDAWwfgMyUsaa+7xdIg9QfxMpEc81Qy+oxDkIOc0
         AQ22/wVfur4N7n/Cs3Pbs+AQzmEWVZRLnad3rumIWR4iunixmGnvNb80/GIpW8sQ+kht
         mbbeYAvRQNt/yWUBrO5b/jAaxVzMcrEaw+skQ4Jna5R8/ZaNl4ySFsDmptZGs0ZX1jJR
         HDwwDtUEb0oO9rFSxWAea+CO2q/vBPc2CguJAekH9GwsBKWR5DfrPyunYeeCo6hMBgCe
         kaWwe8gyR2tmqRSrWteaVaS1nt/qW5vJiotvUkbr/2elanzwZzOR1fpzFHNL0ycHJoYh
         B+Kg==
X-Gm-Message-State: AO0yUKXcqTgcu95j1/9eA7MM0/0OE7h82kbJFcOuaMvFNUjrDKhtkgbi
        PywFPpcECzWL325wvgdDqOI3PS4uYmhr1SNtHgrsOQ==
X-Google-Smtp-Source: AK7set9ZFTYHhd84dOmI9tzKAbY7LI7C7q2nN4XMZlm9R+t4OVOt2ZixXu1gQDxf1Ymcqa+7JGS2gw==
X-Received: by 2002:a17:90b:4b90:b0:23d:3386:95e0 with SMTP id lr16-20020a17090b4b9000b0023d338695e0mr2226245pjb.1.1678935913875;
        Wed, 15 Mar 2023 20:05:13 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id x35-20020a631723000000b00502fd12bc9bsm3958818pgl.8.2023.03.15.20.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 20:05:13 -0700 (PDT)
Date:   Thu, 16 Mar 2023 12:05:08 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v9 1/6] media: uvcvideo: Fix negative modulus calculation
Message-ID: <20230316030508.GB1927922@google.com>
References: <20220920-resend-hwtimestamp-v9-0-55a89f46f6be@chromium.org>
 <20220920-resend-hwtimestamp-v9-1-55a89f46f6be@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920-resend-hwtimestamp-v9-1-55a89f46f6be@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/03/15 14:30), Ricardo Ribalda wrote:
> 
> If head is 0, last will be addressing the index 0 instead of clock->size
> -1. Luckily clock->head is unsiged, otherwise it would be addressing
> 0xffffffff.
> 
> Nontheless, this is not the intented behaviour and should be fixed.
> 
> Fixes: 66847ef013cc ("[media] uvcvideo: Add UVC timestamps support")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
