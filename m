Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF5C53FA99
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 11:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240509AbiFGJ6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 05:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240345AbiFGJ6D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 05:58:03 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAACE5FF3B
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 02:58:01 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 15so15106906pfy.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jun 2022 02:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9nz45oEtyhdTWw5aO28hFMmlfoUDNSYCCQA7E4jzSvg=;
        b=Q3IKUDBLa76ueYeyE3Ees+lmhUDrZC6sZBet1cDrndFuXyWXfV+os9erO4buG03x5h
         V3tnWiFXfDjcuV5McLJJF2clQBKPYE/UEmulJWNl6VClMORDQPuJ9BvV3xvOu+VZXNKA
         /yvpYD7+NohGW6E4j+YgXTp2Vj1w7zXWtmSfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9nz45oEtyhdTWw5aO28hFMmlfoUDNSYCCQA7E4jzSvg=;
        b=3bsthK3zf5+3ai6zEBtoQu/eDaFdoaferCq5qiUkRphcGcLdoUGxmv2uXKeRAqxGvc
         d4EJBOzfSnWnAX86mlf9OFfBPSoiIh4pGyPK2g/WxW3KM5we0guivuuuTR8rCrooDpKk
         YyxyAiJfPnbYv3OFIB0tKom1MvDhGbrOPNyuFiVJWt7WhsvK+somAunxX+Z1CebtQfAb
         tsyNVnuQ0x3v6HUCtTywij7E3TPqw971K2tfu+Oer2vE3kciNVnHPvrZYvGo7zcjlqzu
         9Q2BDGzIf/mJ/cYZpnxZdNKr0vnfYHpR1C//lWz0rpFhNww320sIUxpse7l3BE3SGsvo
         rULw==
X-Gm-Message-State: AOAM532A3IOf6ODxyNwSJktq94v/nr4qecTdj6UXy5XPJla+y9ZdYopE
        INztS0tUKzW614U9m+kpToBU8ufx1SvssA==
X-Google-Smtp-Source: ABdhPJzVDbKNA6gfvbkptY/KFBmh911SC4DaYSI04lxcehxOkrAzRt4x8Ba/bNtklmWYLy6mOMDi9g==
X-Received: by 2002:a63:688a:0:b0:3fa:a80c:a228 with SMTP id d132-20020a63688a000000b003faa80ca228mr23999361pgc.182.1654595881446;
        Tue, 07 Jun 2022 02:58:01 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1d9e:c04a:f940:ddd6])
        by smtp.gmail.com with ESMTPSA id y9-20020a1709027c8900b0016782c55790sm3173271pll.232.2022.06.07.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:58:00 -0700 (PDT)
Date:   Tue, 7 Jun 2022 18:57:55 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Justin Green <greenjustin@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org,
        "tiffany.lin@mediatek.com" <tiffany.lin@mediatek.com>,
        "andrew-ct.chen@mediatek.com" <andrew-ct.chen@mediatek.com>,
        mchehab@kernel.org,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH] mediatek/vcodec: Enable incoherent buffer allocation
Message-ID: <Yp8hI3654zQ+3WcE@google.com>
References: <CAHC42RegxBFjqMwR2gv8EwqE0FG+oS7QA9rcopapktf7tD_y-g@mail.gmail.com>
 <YpbDJ+PUmUTcOD3n@google.com>
 <CAHC42RfnEmBzzLpRikJovq6-E-VWf04Wxrc6Go96y5w2MKT2YQ@mail.gmail.com>
 <92a0163fa2bb20a5c577ca0222e497f0e2bee926.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92a0163fa2bb20a5c577ca0222e497f0e2bee926.camel@collabora.com>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/06/01 11:13), Nicolas Dufresne wrote:
> I'd be very interested to learn from Sergey on why this feature wasn't enable
> more broadly.

Well, we needed this for one particular device and we didn't plan on
expanding this to drivers that we cannot test, verify, etc. and for
the hardware that we don't run.

> I notice though the begin/end access bits have not been
> implemented, so when used with DMABuf, this isn't going to behave quite right by
> default.

We cared only for MMAP buffers. Got time to cook patches?
