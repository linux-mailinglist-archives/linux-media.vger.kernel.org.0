Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 269484E61AB
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 11:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349379AbiCXKY4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 06:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238441AbiCXKYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 06:24:54 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7674C255B6
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 03:23:22 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id jx9so4308692pjb.5
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 03:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6hR2jbQSg4CSVD3f4OWHAyVNhhJ8Mh8GIYUAWVOX8mI=;
        b=lDRfzFWKN+5QH11AqFkY+X0pvWQbEiGu6cKjWqwqTw1H/Ust18pn80OYh+WDRmxqiU
         oOkEV1BTuW9pjT9LGHs6Z7H6LCFIuGQ2PqHzLqmOIrQKVI/8Ir1D6J0s2dntoNargGnd
         IaD1eOS/3kr5X44JQDlm4bMfFE/QvjHEexKs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6hR2jbQSg4CSVD3f4OWHAyVNhhJ8Mh8GIYUAWVOX8mI=;
        b=CZ+GILfaFpHRurREPZqadpDGKll7j/uVAMDNu4trMiV/1eSMbx/iSYIrpkN6cw4Rxa
         dGLb37V8vO0kWwkkGldSfKZe5kdU7NtmtOCDKiqFej/MaKrZ6isb9x7TzIggxvTF2eFz
         GORgC83Ipg52d2+2nIa7GU83T91UhnbDf6ccTDQ6EXv13sJfjgEryagay9OBHWqeq2Or
         iRo4fFOKo04O40HqwVog9iI0LV0ED2/nHzlxMC8nX6IyeYZ4XeQGzr6pYrtxu0tD282f
         oo4sJ7+dDJSW7FMHN8Z9TgukY+1jrBdfg73aSA6WTODFVZTxTzOIEIhakvUMbwGiCy1g
         Hriw==
X-Gm-Message-State: AOAM530kbuF24dH0vtxoVCy/dnhQ6+oTObCB+FpHBvqBZuqaKv5BydFh
        rB6YsnFFBXZHBNbYc/bg4Zo9rA==
X-Google-Smtp-Source: ABdhPJxq+/6bheF0HDrYCcPoo4W5reCHHq/NFJ/3QA9yOmyTPlanPgLY0yPNXRyzPODHB0KRBx8MhQ==
X-Received: by 2002:a17:902:c652:b0:154:2920:df6d with SMTP id s18-20020a170902c65200b001542920df6dmr4906472pls.146.1648117401888;
        Thu, 24 Mar 2022 03:23:21 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:f22a:8f8e:aca1:9b8c])
        by smtp.gmail.com with ESMTPSA id rm5-20020a17090b3ec500b001c7559762e9sm9066552pjb.20.2022.03.24.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 03:23:21 -0700 (PDT)
Date:   Thu, 24 Mar 2022 19:23:16 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hangyu Hua <hbh25y@gmail.com>
Cc:     mchehab@kernel.org, senozhatsky@chromium.org, caihuoqing@baidu.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb_vb2: fix possible out of bound access
Message-ID: <YjxGlIyYiULyAXy6@google.com>
References: <20220324080119.40133-1-hbh25y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324080119.40133-1-hbh25y@gmail.com>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/03/24 16:01), Hangyu Hua wrote:
> vb2_core_qbuf and vb2_core_querybuf don't check the range of b->index
> controlled by the user.
> 
> Fix this by adding range checking code before using them.
> 
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
