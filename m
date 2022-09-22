Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC67F5E67CE
	for <lists+linux-media@lfdr.de>; Thu, 22 Sep 2022 17:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbiIVP5x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 11:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbiIVP5v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 11:57:51 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1F2E5FB8
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 08:57:49 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id q3so10217382pjg.3
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=DFca6W2geua6z8QZaei3L7obYL69ycUV+0eXMSxJFmM=;
        b=jvl2IXIRx3EhOhhqaTOf5Lt+fk9xx9Irq6xcu/7k7oCaAudZivnlCg4zfyCIBsgQa9
         qBtVWGjfuRNfAqWNaj6IsSNxrO0lvCUNMMis5T9m3env78npe1AQYwW4n7mGlSRQHwQP
         cG9vbxRd7c25yIHtYw1xafxyLneU1vdiRP2x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=DFca6W2geua6z8QZaei3L7obYL69ycUV+0eXMSxJFmM=;
        b=3o7CehrMjesT/0yB02tYyXWE42kg3J4s1tst5zA3DGXtMy7eJKvqXCjvI0PVmE81CK
         PRV16jbRBNeZl8J0ON5jQD+8ud6R7pwAUIq/gJE5yXHF8Vfo/SYmdIIELmfHsadj3kq6
         IcRDXQedJyzo/7C2AMYc0hIvjvNMqVWOQLtdXmFL9MT1ThG30oQXaNAMUu5NCth4Q+1D
         jge8R/J2I/f2YGa8ZB/N7JMH0TerMK4yjOaKB4IT3hTNB3EQre9rn9dsUi9pVArt3lHg
         Aw3R+Z7KrjqhtZZpZLWuNQmRhPf6V+CdO7XcEqTq7tEzla875ffOUrBsU4Q9onYuN7+i
         Bd2w==
X-Gm-Message-State: ACrzQf1YZHj7Ghoq8CgGnhVIa8Ult2YInm5NNxGqpxH2hc4cGJeU6wlq
        +6K8DLrnOwEKf0YBQP/iIPpUtQ==
X-Google-Smtp-Source: AMsMyM4DbOcH8T52s44Y0t4Ur0sebk5QTw9RJNQKJ+FFAkxJV0gLFIOVmBX/n1oFJJpAp4+llFExqQ==
X-Received: by 2002:a17:902:e848:b0:176:c746:1f69 with SMTP id t8-20020a170902e84800b00176c7461f69mr3892270plg.125.1663862268452;
        Thu, 22 Sep 2022 08:57:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p63-20020a625b42000000b005367c28fd32sm4575617pfb.185.2022.09.22.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 08:57:47 -0700 (PDT)
Date:   Thu, 22 Sep 2022 08:57:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Alex Elder <elder@ieee.org>
Cc:     Vlastimil Babka <vbabka@suse.cz>, Alex Elder <elder@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Josef Bacik <josef@toxicpanda.com>,
        David Sterba <dsterba@suse.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Daniel Micay <danielmicay@gmail.com>,
        Yonghong Song <yhs@fb.com>, Marco Elver <elver@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Jacob Shin <jacob.shin@amd.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-btrfs@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, dev@openvswitch.org,
        x86@kernel.org, linux-wireless@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 03/12] net: ipa: Proactively round up to kmalloc bucket
 size
Message-ID: <202209220857.A6EBCF031E@keescook>
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-4-keescook@chromium.org>
 <4d75a9fd-1b94-7208-9de8-5a0102223e68@ieee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d75a9fd-1b94-7208-9de8-5a0102223e68@ieee.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 22, 2022 at 08:45:19AM -0500, Alex Elder wrote:
> On 9/21/22 10:10 PM, Kees Cook wrote:
> > Instead of discovering the kmalloc bucket size _after_ allocation, round
> > up proactively so the allocation is explicitly made for the full size,
> > allowing the compiler to correctly reason about the resulting size of
> > the buffer through the existing __alloc_size() hint.
> > 
> > Cc: Alex Elder <elder@kernel.org>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Eric Dumazet <edumazet@google.com>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Paolo Abeni <pabeni@redhat.com>
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >   drivers/net/ipa/gsi_trans.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
> > index 18e7e8c405be..cec968854dcf 100644
> > --- a/drivers/net/ipa/gsi_trans.c
> > +++ b/drivers/net/ipa/gsi_trans.c
> > @@ -89,6 +89,7 @@ int gsi_trans_pool_init(struct gsi_trans_pool *pool, size_t size, u32 count,
> >   			u32 max_alloc)
> >   {
> >   	void *virt;
> > +	size_t allocate;
> 
> I don't care about this but the reverse Christmas tree
> convention would put the "allocate" variable definition
> above "virt".

Oops, yes; thank you!

-Kees

-- 
Kees Cook
