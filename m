Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0319B4EA9A0
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 10:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbiC2IvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 04:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbiC2IvY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 04:51:24 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD814BBB9
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 01:49:41 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id d7so23732511wrb.7
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 01:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3WOsP0N8pQYSZR7dCr/GEolSLsBOcDjGOSuUf4Q8y5c=;
        b=Cr8k1GfBxjxgkiKcehLqVxYA6mL2h4XI3jCGech6aDvqrYzO39ohK4BWHM7caw8U+T
         vYUExF3iJ6E0zzY1UXPqlQQu0ZEda+9cCZVbaE1pv1kCOJ7Fqmw3GXMhujiTrYvzPJ/t
         DGAmNOSeVp8M3HYk+vTLA/ofD2NBtrKdEuzP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3WOsP0N8pQYSZR7dCr/GEolSLsBOcDjGOSuUf4Q8y5c=;
        b=kVe2GaoRFSsuWgYyceq6qXcSoKs4Gu+iVH0zrjNOCO5s7z+xVXZoxkajzcJbe5MPbL
         f0TwLhILyEy8nSHQvt4WEpS2UkbgVn0Cvg0kShMXc6oqIIwCyl/g4ViskuScffiRNkiS
         mnVazJpj8tyjAWgxOh7JjNXtUREQaeAIYIeMLUHbpHqz78LH+RL3DZtKxP1y5AJgh1sQ
         PyjMSLHxx7kwxSq0RVBCoFf2fkFiJVwKvtldG8nMH1xitHZ0fdbAqubZ6CVVhhefJAsR
         Nwys1BNlU6up6BwDCOnX3o4RC9b2W1ZU5fH0v8DAEXNAWas4NRueNYSdRC6e/6G9au/V
         IKNA==
X-Gm-Message-State: AOAM531OK5k5PWidG8O7KeLvLAUKlNDbrnxJglZcpbdARXnUeUyw3Keo
        cX1d2up1+zw3uTQ66Oegq07dtA==
X-Google-Smtp-Source: ABdhPJxsBo7mH6qQdvfu4gCQhAS59ss1wdC1AX1XGHJLm8qth9AwFe6z+gofLqam6doW5OJmi4ZNmA==
X-Received: by 2002:a5d:64e7:0:b0:205:8cc7:aa82 with SMTP id g7-20020a5d64e7000000b002058cc7aa82mr29697748wri.247.1648543780450;
        Tue, 29 Mar 2022 01:49:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w7-20020a1cf607000000b00389a5390180sm1613852wmc.25.2022.03.29.01.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 01:49:40 -0700 (PDT)
Date:   Tue, 29 Mar 2022 10:49:38 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        ville.syrjala@linux.intel.com, daniel@ffwll.ch,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 2/2] dma-buf: handle empty dma_fence_arrays gracefully
Message-ID: <YkLIIhzuiE9jN8xK@phenom.ffwll.local>
References: <20220329070001.134180-1-christian.koenig@amd.com>
 <20220329070001.134180-2-christian.koenig@amd.com>
 <YkLHypwNnLd+qA4H@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkLHypwNnLd+qA4H@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 29, 2022 at 10:48:10AM +0200, Daniel Vetter wrote:
> On Tue, Mar 29, 2022 at 09:00:01AM +0200, Christian König wrote:
> > A bug inside the new sync-file merge code created empty dma_fence_array instances.
> > 
> > Warn about that and handle those without crashing.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> 
> > ---
> >  drivers/dma-buf/dma-fence-array.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> > index 52b85d292383..5c8a7084577b 100644
> > --- a/drivers/dma-buf/dma-fence-array.c
> > +++ b/drivers/dma-buf/dma-fence-array.c
> > @@ -159,6 +159,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
> >  	struct dma_fence_array *array;
> >  	size_t size = sizeof(*array);
> >  
> > +	WARN_ON(!num_fences || !fences);
> 
> WARN_ON and then dying randomly is kinda not nice, I'd wrap this in an
> 
> if (WARN_ON)
> 	return NULL;
> 
> with that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Uh strike that, you handle it gracefully with the check below.

> 
> > +
> >  	/* Allocate the callback structures behind the array. */
> >  	size += num_fences * sizeof(struct dma_fence_array_cb);
> >  	array = kzalloc(size, GFP_KERNEL);
> > @@ -231,6 +233,9 @@ struct dma_fence *dma_fence_array_first(struct dma_fence *head)
> >  	if (!array)
> >  		return head;
> >  

Maybe add a comment here that this is just defensive programming, like

	/* No fences isn't allowed and splats in create, but be defensive */

Either way Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> I guess,
coffee not quite yet working.
-Daniel

> > +	if (!array->num_fences)
> > +		return NULL;
> > +
> >  	return array->fences[0];
> >  }
> >  EXPORT_SYMBOL(dma_fence_array_first);
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
