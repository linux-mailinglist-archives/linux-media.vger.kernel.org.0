Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F4D1F173A
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 13:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729452AbgFHLJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 07:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729439AbgFHLJV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 07:09:21 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D1DC08C5C2
        for <linux-media@vger.kernel.org>; Mon,  8 Jun 2020 04:09:20 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b16so8376749pfi.13
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2020 04:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1R9xLMjXQCMGdBAN+yHkG9lUt4OU/rnejA2ctw4rSOY=;
        b=r3MsiaoyNy6NZs9ua/zKfKE0PVMwHv+L0jIWL9XLAizH6j6hAEMAWM2vv2aTMyyurG
         30O0D73tTfcanXraiixj8Md7vZLJm42SFPUHS2S9WO77qWBP99otelv9WUMIPgTF5cRZ
         6V+l4afXgOrrDlL8j3M5k6R+1xEW0ASSBGupNNLdo+aRdjRR02DvR23jViKap7Pb5/T7
         5QySXuBtDU+orrCYONYDcaJhEk74JjL+GMItsCp8uewxAt+Qk5EAo0WfGdYixbsv5xlu
         aqSdhqL/UpueE8ecW3imc1d9peDDqt9j8aU3c5luQ0Bz+80vZCg4rGaGZwQpFWtYkRQh
         N4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1R9xLMjXQCMGdBAN+yHkG9lUt4OU/rnejA2ctw4rSOY=;
        b=B0kO4qTbHiOjZFtH1ixoMSoQomohT+aCUNSLDbdbLTE8STLSQ15WWQS4BZsBWbJv0r
         3k61+5vs/GPw2RnSwnWh2Lh9viLK2L6klup841Aa1ra39p5pQNs0gvafiGhJzOwW1PwU
         RiITuiX4zCTBg26nrtgLGeUQyE9Z5nGQAAGiPHEbn4YFOp/BN1DWKlPejSnkGeqzK0DL
         oRq1QkGjXRYIHgjrcnKYQseYckGv1r8QEfs1xVSMg1+iUm9QR+fzs8Ot+cOHzWKKhXqP
         hJIFcbID3aB0o3GIFfWDGXo+SbTFJtJDwIG8S4nKfkXAXS/ieNbhEVIMvjI00jCdo1ZF
         VNPw==
X-Gm-Message-State: AOAM532Z2nnFSvkQ3mEEH7S3cJSwqVGxjnmZHx4cBcigdzhQreBZ1cV2
        rsF5KWOwDbmxuh0nMoRYsS1mUxec
X-Google-Smtp-Source: ABdhPJyf09rpwoTtUJdD5h85EzI3bJQ8frMrs604L/LRKPr/acgdQH4qPLtviGqjUsvXbBZeC+97vw==
X-Received: by 2002:a63:e74b:: with SMTP id j11mr17548812pgk.237.1591614560425;
        Mon, 08 Jun 2020 04:09:20 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id r8sm7104714pfq.16.2020.06.08.04.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 04:09:19 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date:   Mon, 8 Jun 2020 20:09:17 +0900
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] v4l2-utils: test cache_hints for MMAP queues
Message-ID: <20200608110917.GA31444@jagdpanzerIV.localdomain>
References: <20200604044752.107856-1-sergey.senozhatsky@gmail.com>
 <401fe6a5-542e-cc3c-8455-aa7c424122b8@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <401fe6a5-542e-cc3c-8455-aa7c424122b8@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/06/04 13:43), Hans Verkuil wrote:
> With this patch the compliance test passes.
> 
> But I have some comments about this code:

Hi Hans,

[..]
> > +
> > +	if (cache_hints_cap) {
> > +		crbufs.count = 2;
> > +		crbufs.memory = q.g_memory();
> > +		/*
> > +		 * Different memory consistency model. Should fail for MMAP
> > +		 * queues which support cache hints.
> > +		 */
> > +		crbufs.flags = 0;
> > +		if (m == V4L2_MEMORY_MMAP)
> > +			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs) != EINVAL);
> > +		else
> > +			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
> > +	}
> 
> The code above can be integrated into testReqBufs() in the
> 'for (m = V4L2_MEMORY_MMAP; m <= V4L2_MEMORY_DMABUF; m++)' loop.

OK, do you want me to stop testing ->flags = 0 case, or shall I test both?
I wanted to test those separately yet keep the size of testReqBufs() more
or less reasonable (I just prefer to have small functions all over the place
and let the compiler decide what should be inlined)

> Currently it sets reqbufs.flags/crbufs.flags to 0, but you can just set it to
> V4L2_FLAG_MEMORY_NON_CONSISTENT instead and add the relevant tests.

Ah, OK, so no test for ->flags = 0 case.

> > +	q.reqbufs(node);
> > +
> > +	/* For the time being only MMAP is tested */
> > +	if (m != V4L2_MEMORY_MMAP)
> > +		return 0;
> > +
> > +	node->g_fmt(fmt, q.g_type());
> > +	q.create_bufs(node, 2, &fmt, 0);
> > +	fail_on_test(setupMmap(node, q));
> > +
> > +	q.reqbufs(node);
> > +	q.create_bufs(node, 2, &fmt, V4L2_FLAG_MEMORY_NON_CONSISTENT);
> > +	fail_on_test(setupMmap(node, q));
> 
> This test should be part of testMmap instead.

OK. Let me take a look.

	-ss
