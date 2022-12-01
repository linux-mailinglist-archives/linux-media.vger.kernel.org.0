Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09DC763E8A6
	for <lists+linux-media@lfdr.de>; Thu,  1 Dec 2022 04:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiLADun (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 22:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiLADu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 22:50:28 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B935F7D
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 19:50:11 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id b11so695945pjp.2
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 19:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DX5Y28o71PKbgEjZB0+m2lYvWHSamk7lzl54f1xg2wQ=;
        b=jHHvIRTDlCf/LNOwDdcsdvAMrUaTofp3jmFGNOtdvNerF5I/RbxsX1YpbkuExAjkM0
         WB+zbGZ/3XSkfg91MJb/3jUHgxqTdmqAPcCCg0yFo6NGzFVJv8y3JTPpgz/FFETfXZg3
         +yii+w0bBL5hgsmIYQ1ZWam+V5M0Bjj6/hG5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DX5Y28o71PKbgEjZB0+m2lYvWHSamk7lzl54f1xg2wQ=;
        b=L5F4cgoVjH7ZQMimU0vR7Fs50rsp9NoGnSn/yZtQ8tl7NWnDUXnEIRRZkSFTSIAVh4
         YZfd96dlxJ5acS2Vny95eWnOi73Jwl9tr3teMZiPmrIPtVRrghuVQU8MIf5ZY7uuaChK
         h6mVhovP2olYN1KK10rdoElzaGC4uxhNphbfL3KOKkKH/MRVOwEru62HeTQYkcoIZEUN
         wypvxiWieMOz2+7FUHJuPSbB4uPaHUQ1PahDG6ycH3NrlvexQZq/JBCTJmyWWH/ZaKly
         CWz5Z1liJVTsxQFi4nPrQLPpvw0QlvVB6ub4829/tJjaUz5AlGVqTHDm9a5fIrnBL33B
         GhqA==
X-Gm-Message-State: ANoB5pkhCt2UleW6Yyiw26DCBe6SlMJfpaBRu9mFYfEDCsGpMWfPpM3T
        GrVqvW1YnggooOqcp5TO4Zf7zg==
X-Google-Smtp-Source: AA0mqf4KfpXRNil7YCf/bAs+5nTwjFSTHCYfEMKOVfUUA3Y7ce98I3Oo2UwA7+vQmyq9Ecm4mCM9Fg==
X-Received: by 2002:a17:90a:aa93:b0:218:94ff:ce1f with SMTP id l19-20020a17090aaa9300b0021894ffce1fmr59384573pjq.217.1669866610822;
        Wed, 30 Nov 2022 19:50:10 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id x28-20020aa7957c000000b00572275e68f8sm2101227pfq.166.2022.11.30.19.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 19:50:10 -0800 (PST)
Date:   Thu, 1 Dec 2022 12:50:05 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 11/11 RESEND] media: uvcvideo: document UVC v1.5 ROI
Message-ID: <Y4gkbWm91u3kkmzt@google.com>
References: <20221201023204.2177458-1-yunkec@google.com>
 <20221201023204.2177458-12-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201023204.2177458-12-yunkec@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/12/01 11:32), Yunke Cao wrote:
> 
> Added documentation of V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
