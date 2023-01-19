Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E74F67366B
	for <lists+linux-media@lfdr.de>; Thu, 19 Jan 2023 12:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjASLM7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Jan 2023 06:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjASLM6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Jan 2023 06:12:58 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E787E4AA6B
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 03:12:56 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id v13so2388311eda.11
        for <linux-media@vger.kernel.org>; Thu, 19 Jan 2023 03:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7K/wAavTHD3yjxOEf3hWbFpxnOCpCaOAoyK6swnaVmQ=;
        b=IzwjSqiWGYJMs3bVmEWbYtZ1IaRc9hGtbn4sZxdenKfZlRModMhBoNCablsES6Kwcr
         btVgHDSMlp5nuTlxkYqol+ZbiMPPz7M/e3+WpMXYj+8Zw5MsUnNTQ2f4CMy2zz35PH7w
         zLR7IrhJpO9zs/o3s3t7AUTSOy3qatWjRquyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K/wAavTHD3yjxOEf3hWbFpxnOCpCaOAoyK6swnaVmQ=;
        b=fGcU4PJAtpH8bwByAGMt5HLmQ0HTnVNXPJrDeS0sxcDOHtJUk2XnnNOn3B2zBB1Ory
         SwCZB8ipAQ0u+RLAhdJ16rxwchfa8HZZaA5nKYt3WNrKbWDdfDQcjwVjgt6OStqixUXi
         LD6vK0py7GmH/A0AdkbdmUd9kbBK2us0RO99iScMdsTKHrK4YsoQYW2rdnmXQw241eHx
         geGEQ9MgIXM86dh1lvqOvTtofcn2w4ObRwcfu4tV3DKKANz5siz1WsVWMj8MYG154BBd
         GRjMMNJkIRoF7VZN7uYwOjXW+5815oK5ZJd3Kby7UkCg8N6RJZPmAqKWX5oy1Zq0vezc
         32hg==
X-Gm-Message-State: AFqh2kov0F0i/e8wu6cRFFm5cdj1QRnkkruMTFR2KYHF2FUIXxPxYJi6
        qZbzfQ1iK7sC1+mfUmPIbNplNA==
X-Google-Smtp-Source: AMrXdXvabi0yt86/XFRD78aKBfmhP8jESyuhJTXDUkm0efBnp3xBQLfHdqtj7O4V+/5cf9bBQp7LvA==
X-Received: by 2002:a05:6402:100b:b0:462:6e5e:329a with SMTP id c11-20020a056402100b00b004626e5e329amr10642094edu.8.1674126775519;
        Thu, 19 Jan 2023 03:12:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a8-20020aa7d908000000b0049dfd6bdc25sm6428169edr.84.2023.01.19.03.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 03:12:55 -0800 (PST)
Date:   Thu, 19 Jan 2023 12:12:53 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: RFC: dma_resv_unlock() and ww_acquire_ctx scope
Message-ID: <Y8kltaITYoTEl9SQ@phenom.ffwll.local>
References: <730e5a40874c0e5bf66ddcb9fe7b2e4f28e09b1a.camel@crapouillou.net>
 <33c2d360-31f9-da8b-127a-d473029192e6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33c2d360-31f9-da8b-127a-d473029192e6@linux.intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 19, 2023 at 11:37:39AM +0100, Maarten Lankhorst wrote:
> 
> On 2023-01-19 11:24, Paul Cercueil wrote:
> > Hi,
> > 
> > Just a reflexion I have after an intensive (and intense) debugging
> > session.
> > 
> > I had the following code:
> > 
> > 
> > int my_dma_resv_lock(struct dma_buf *dmabuf)
> > {
> > 	struct ww_acquire_ctx ctx;
> > 	int ret;
> > 
> > 	ww_acquire_init(&ctx, &reservation_ww_class);
> > 
> > 	ret = dma_resv_lock_interruptible(dmabuf->resv, &ctx);
> > 	if (ret) {
> > 		if (ret != -EDEADLK)
> > 			return ret;
> > 
> > 		ret = dma_resv_lock_slow_interruptible(dmabuf->resv,
> > 						       &ctx);
> > 	}
> > 
> > 	return ret;
> > }
> > 
> > 
> > Then I would eventually unlock the dma_resv object in the caller
> > function. What made me think this was okay, was that the API itself
> > suggests it's okay - as dma_resv_unlock() does not take the
> > "ww_acquire_ctx" object as argument, my assumption was that after the
> > dma_resv was locked, the variable could go out of scope.
> > 
> > I wonder if it would be possible to change the API a little bit, so
> > that it is less prone to errors like this. Maybe by doing a struct copy
> > of the initialized ctx into the dma_resv object (if at all possible),
> > so that the original can actually go out of scope, or maybe having
> > dma_resv_unlock() take the ww_acquire_ctx as argument, even if it is
> > not actually used in the function body - just to make it obvious that
> > it is needed all the way to the point where the dma_resv is unlocked.
> > 
> > This email doesn't have to result in anything, I just thought I'd share
> > one point where I feel the API could be made less error-prone.
> 
> Hey,
> 
> This example code will fail eventually. If you have DEBUG_LOCK_ALLOC
> enabled, a fake lock is inited in ww_acquire_init. If you don't free it
> using ww_acquire_fini(), lockdep will see that you free a live lock that was
> never released. PROVE_LOCKING will also complain that you never unlocked the
> ctx fake lock.
> 
> If you do call ww_acquire_fini, you will get a loud complain if you never
> released all locks, because ctx->acquired is non-zero.
> 
> Try with PROVE_LOCKING, your example will receive a lockdep splat. :)

Also CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y any time you change ww code please.
Otherwise it's just not fully tested.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
