Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6505F1D3536
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 17:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgENPgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 11:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgENPgR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 11:36:17 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D68C061A0C;
        Thu, 14 May 2020 08:36:17 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id u10so1293769pls.8;
        Thu, 14 May 2020 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vDS0TgiTXb3AuIn1TGaVc4FDOVBMc5MhCIE1rS7xbuM=;
        b=n2kPcLDHFVhVHAxkFp4d472eRSoSr2xeNkTsjIIvw73mYYLCswrgPHHyHFYH/8LkK5
         8CKsKSGGxDgWlgGsY9GX3tY0kM6/wWzGt7OyoF71FzWJS3DscQ8ibKiINn9KgFa4EuOF
         QtDNPCMXekB7kdV8BfY18qYQClBsfGDXpAqqv25wdgOKsfx0AC0A3hodyMtW1H+295TY
         vmq3dPzT8K9h21W/SLDv8tUjMIVNXPdYO4Xebm7uX2iJEyAF1fPXQ33wfBVzy60/JS2Y
         m326AoJP/A0EKPUipQdE48AS8id3MtNPawE6ENdB2z0Z0/fRzKPcqE1GIPPGvj2tFUbV
         0I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vDS0TgiTXb3AuIn1TGaVc4FDOVBMc5MhCIE1rS7xbuM=;
        b=V0bhUoCyz2F1sqrPB/LNdoweHtxk/Ose7nj11otNTG3+dhiazprTjVPUyFoQxzF0Ie
         kjEKdzFhJMDTq2NSvlkbmgxx7so95iCiRbW5tcLVDueE9UkI98zVFQKsVg9GaHNw5iJl
         aPBqdhy2mq5GQX6LyCifJuyezBlQ5tV0wlWcMwM1JhLMKgPJSvpf3tWQHn+sl6o18GiV
         8c3Fn90VOAHm3ZsQUbZTqw3mEQ5ZRNoPVFW5Lrn0lzEZPOIbyJjromP89oVxXbic+Bku
         AdjR13Utwdn56aZdvaoVHodP+0SXOECBuN6z98QnCSe+g23phDtr6xiyxp09uZmdbPJs
         AoOQ==
X-Gm-Message-State: AGi0PubBs0h9yqcx3378S2jd9xCazj/+Xe2d/RmdFGAg57bcjbddDBLY
        RR7c5HmjkehzlZyHawDev3VdxZSr
X-Google-Smtp-Source: APiQypINv3yX4OnROqiAXrBsEXpRyOfNsLrJa41TAWYdMG+ywzb1TKx9PmyzqA9egY1KhzoY1H72NQ==
X-Received: by 2002:a17:90a:db0a:: with SMTP id g10mr41694059pjv.54.1589470576612;
        Thu, 14 May 2020 08:36:16 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id l137sm2695644pfd.107.2020.05.14.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 08:36:15 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Fri, 15 May 2020 00:36:13 +0900
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 00/13] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Message-ID: <20200514153613.GA523@jagdpanzerIV.localdomain>
References: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
 <aa246282-ca02-a20b-8d8e-0c33f4a2259d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa246282-ca02-a20b-8d8e-0c33f4a2259d@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/04/28 16:47), Hans Verkuil wrote:
> Hi Sergey,
> 
> On 24/04/2020 11:29, Sergey Senozhatsky wrote:

[..]

> I missed that. What should happen is that q->allow_cache_hints is set by the
> driver before vb2_queue_init is called. And the documentation should be updated
> to say that the V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS flag is only valid when using the
> MMAP streaming I/O model.
> 
> Perhaps the flag should be renamed to V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS to
> make this explicit? Other opinions are welcome.
> 
> > 
> > Second. Even if the queue is setup, we still can report wrong cache
> > hint values. Let's look at the following code
> > 
> > 	fill_buf_caps(q, &p->capabilities);
> > 	if (!vb2_queue_allows_cache_hints(q))
> > 		p->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
> 
> The problem here is that vb2_queue_allows_cache_hints(q) uses stale information:
> the current streaming mode instead of the requested streaming mode.
> 
> This should read:
> 
> 	if (!q->allow_cache_hints || p->memory != V4L2_MEMORY_MMAP)
> 		p->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
> 
> And V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS is always set regardless of the
> memory model. It just needs to be documented that this capability applies
> to MMAP mode only.
> 
> > 	ret = vb2_core_reqbufs(...);
> > 	return ret;
> > 
> > The thing here is that vb2_core_reqbufs() and vb2_core_create_bufs()
> > can re-initialize the queue and invoke ->queue_setup(), possibly
> > changing its memory model, etc. so cache hints cap which we set or
> > clear before vb2_core_reqbufs() and vb2_core_create_bufs() can become
> > invalid after we call those functions. It's the same with
> > ``req->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT``, we cannot clear
> > it before reqbufs()/create_bufs(). Therefore I added two simple
> > functions which fixup cache hint cap and non_consistent flag after
> > reqbufs()/create_bufs(). So the code looks like this now:
> > 
> > 	fill_buf_caps(q, &p->capabilities);
> > 	ret = vb2_core_reqbufs(...);
> > 	fixup_consistency_attr(q, &p->flags);
> > 	fixup_cache_hints_cap(q, &p->capabilities);
> 
> These fixup functions are ugly, unless I missed something I think the
> approach described above works just fine.
> 
> With these changes I think it is ready to go in.

ACK to all of these.
Will send the updated patch set shortly.

	-ss
