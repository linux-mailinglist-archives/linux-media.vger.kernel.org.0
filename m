Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1335A7B6411
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 10:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239412AbjJCIaS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 04:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239398AbjJCIaR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 04:30:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BAC97
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 01:30:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50573e85ee0so727065e87.3
        for <linux-media@vger.kernel.org>; Tue, 03 Oct 2023 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696321813; x=1696926613; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tCVLlGuDttXDAeKBU2+UulxgkQbSJpXxQEIW9ibhWmE=;
        b=XtV2aQ5pP3lijq+WPAGkg0AonpQvNinUqaEFjGYaTtgLgElc/rHZDyudwKEeOmW4Rj
         gYLN2Jv2nxOkIjGxAjdY3g3eHJmR9Fk1fZXCHylRl505aMlAzcEZjUnNDoqst+l4crFx
         HVIqcXbAMr+cUQvBBeQ/Dn3Daz6pMnAfwUN3Pg5JwKtt6KucIMOqKnrsuL8ZrB/gymd2
         nsMiKk+nXbozizb9/Wcv1RNWwpsD4FzVXjgA9QscN73gkoOAxKzSBwFIxS1IEmmoUy0c
         XNEANSME1h/nwbucZZrSBkjtQRDgTdwIvyfQ992SJ4eTg711bFsNy8fAn+yAblJr9Dgx
         sy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696321813; x=1696926613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCVLlGuDttXDAeKBU2+UulxgkQbSJpXxQEIW9ibhWmE=;
        b=eoXROrgIIWNZK4lIuEy+k0lVDA71E7aFZBLypU1FvqSFm6USIVr/qFx+Gtcm3HrMaE
         dw+cXnSw2GZa9FJRBVLaRAlUnacfhAt5gfPTSOgHnTZo697WJRqc44avpOiPp/ljISfV
         3A9/bSKSGvViH2+wSEdu0ocvU0Jz51xhme1Euzf32bq+MwXqYFekpE+6olmhVuyyv4s+
         61amEiIEcDjsbImTn6ijqum5CZ9WcYC1/BA5ZhXkIoHJknk9vX9rkqN3lhq7g9/c3nDA
         hYJVwhF8R+zEQ8XeF8g7Ft1z07fpJLXwwYs+bYXN0KTAFCzM0R+C0kQlKprUhkNn2mVl
         mzZQ==
X-Gm-Message-State: AOJu0YxgGjPHGwaWAcPrkzB9mbxOIu26QdHZgkID+P9HyU+DRo9HV8QH
        /WLRBFsdAs2I/IlAPATtbbaffQ==
X-Google-Smtp-Source: AGHT+IF5jqCZuut1egRUR+esMIoO1bSWn9DsA6o33yNuDo0JmBUPqEnTCoPt8mrVyD2S7D9i02Vjdg==
X-Received: by 2002:a05:6512:360a:b0:502:d35b:5058 with SMTP id f10-20020a056512360a00b00502d35b5058mr10185024lfs.4.1696321812713;
        Tue, 03 Oct 2023 01:30:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q20-20020a1cf314000000b00401b242e2e6sm8801252wmq.47.2023.10.03.01.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 01:30:11 -0700 (PDT)
Date:   Tue, 3 Oct 2023 11:30:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "T.J. Mercier" <tjmercier@google.com>
Cc:     John Stultz <jstultz@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dma-buf: heaps: Fix off by one in cma_heap_vm_fault()
Message-ID: <04ea5706-7373-48c4-a93e-e69c50816a0b@kadam.mountain>
References: <bc145167-0471-4ab3-935c-aa5dc20e342a@moroto.mountain>
 <CABdmKX1PsCcRpsnUgwoS9yMhCXcin1bQt6D+N0b2mHP93cmX-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX1PsCcRpsnUgwoS9yMhCXcin1bQt6D+N0b2mHP93cmX-A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 02, 2023 at 10:16:24AM -0700, T.J. Mercier wrote:
> On Mon, Oct 2, 2023 at 12:04 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The buffer->pages[] has "buffer->pagecount" elements so this > comparison
> > has to be changed to >= to avoid reading beyond the end of the array.
> > The buffer->pages[] array is allocated in cma_heap_allocate().
> >
> > Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index ee899f8e6721..bea7e574f916 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
> >         struct vm_area_struct *vma = vmf->vma;
> >         struct cma_heap_buffer *buffer = vma->vm_private_data;
> >
> > -       if (vmf->pgoff > buffer->pagecount)
> > +       if (vmf->pgoff >= buffer->pagecount)
> >                 return VM_FAULT_SIGBUS;
> >
> Hi Dan,
> 
> Your fix looks correct to me, but I'm curious if you observed this
> problem on a device? The mmap in dma-buf.c looks like it prevents
> creating a mapping that is too large, and I think an access beyond the
> VMA should segfault before reaching here.

This is from static analysis and not from testing.  You could be correct
that this bug can't affect real life.

regards,
dan carpenter

