Return-Path: <linux-media+bounces-37821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 113B3B069C3
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 01:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB0C4E5ED0
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 23:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 123072C17AD;
	Tue, 15 Jul 2025 23:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9Mh2/JS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C892619F464
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 23:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752621267; cv=none; b=iz5ozf1ssLo6B0U22DNJXGoLF445MM4FeIslUMl7/YeBL297dji3COguHtuBh3GuVkd+faWWSiPmtEZFfyk1WVjw9R2O8W48nN0eQzgA49eP1nz4Y8ZYOcMP1Bu/nseQFe9LWNyAvwwn0s3AUkR5/h9mdMXmHftUm04NHua850Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752621267; c=relaxed/simple;
	bh=T70YuI6R/12TLPSfDs/CEZOSabhgQP1vYd6Da4SDFnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVHGzb6zmZh4q+dHaT83opi1RmuXmuA87FW7yqU14MM2X3RbCTVfDkyYjzuo9Wf5AOcq3kVYc+nnBK9JdTiG1mwciY22oPPxqWC0yiKkDRAfE7+WxdQEIVYHZag1IjL6WuxXtHWx9eiyHPawE7lG+WFX2rkBpNOgRBqhQlnJUD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M9Mh2/JS; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-73d0152369fso2238866a34.2
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 16:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752621265; x=1753226065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4OoXe1g1YJ25jzLZS1XR88/igkO8IDiytyAJZ7OFPDY=;
        b=M9Mh2/JSq3r8cOgnUUMmTvj+ERuYiniKa0cj3vC0iJvHafR22FWtFCtg6Q7Cyk6fJY
         PlYvUifA7YjO1Mf+m4BYJB4VPsifXZ7ZCiAQqa8dX2kExXUEAm0NpjOrQbabOKze4KMn
         O4kYorYB+tVRBdi/7BBJ9kVEdpjm68hoLpieDtXreddhw0GShebQx+4uKeqKfwskpTCG
         hohuYqmPg6PW53UOFKXoZ9brC4FVW1VZcEgIS/j2NLBXAXfSIj+irCcdZQjAHTyswnZ4
         6d+Y/YhMCR3GVIxcOHaupHivuXFndsWJUaicT2svDx9e+guXfPWGyrZsvz0ACQYHvROp
         msXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752621265; x=1753226065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OoXe1g1YJ25jzLZS1XR88/igkO8IDiytyAJZ7OFPDY=;
        b=SolQUkCmPQGSOUdI2E0QQUoFHsvSxgzMgOXrq/5+nShoeuE0/xrvX13znX9OpTkwgx
         ET+JuUclmwsr+zqCPi6PE8K2ByY8/pXDbZyoqFjul2J22HJWA4ALtumxCcdPKxoH8SgU
         WU/Xm0FDKeMGv7gfbc/smwmAx3JQ5gXfIBPqyko8vjBPG4UtO4w3om4nY1m39PVXSn2F
         CEgPmrxEoD2OIcYy2gQ0Be9t8/m4Vws3vR/Sh6MSaND3M3HxKp8vHqVWyb0jZSdpHUPB
         kBs/1HB3tJZjmPsQfUyp+WaJ8UKJqJTCEjm5JZUM1Qinn1eFa0Zf9+jmXR2cFOwlyIot
         uGxQ==
X-Gm-Message-State: AOJu0YxlwRnjHIVboFBqzKOcuV+pptpVGujbaQVFQsTIW4DJHz9w685h
	bFfSeXNTY+8L/aW1+NXb0XwZ4IIcWQV3aEcsuLUvRPNU0zNR1mKTnsMpKvPEZlF1VRFyedZmoDR
	Fm6xl
X-Gm-Gg: ASbGnctL93GnrE9n8U0KEsVqCNDhz4WKHe/CaO5L8TV7ihcOQhOGLUAoP6uluEq1Q63
	wYFZMU5jJoCLwhPwl5RujYhzlN3ijlMarrYI9/S2CZj7I408y93ZGPxkdHdfKMD5rAH0vXqclMU
	1u1R1XFVYLU+/TLPeD1h9rQagMwv2C6KQaMQPFxVVeHTcrFTnHpsf4KJnja+MEtTRsFYmGH1AbA
	Vskdh/sN3ELu/834wpQG1XYmkNhzofP+Cu+zViActe64rUWRFrGehtYlZPeZ88Et+F3BfHxuQhT
	lKhefAF9zOeux/Yvxe3tbpi/6r7gMw52c0iFEhjDAWYGGIQ/FLV2vgnm7PrHD0ZSNEreD4Z3Ybu
	6wIdA9M2jv2zWizYLezkx7+aIYuovNDXyMr8vQsw=
X-Google-Smtp-Source: AGHT+IFd4VIqWrf3OcvmEDZQ3XGb6/Wep274z3xD0EyFxazK+y7+luFv0GR0y/5s80o0IsL+nYw04Q==
X-Received: by 2002:a05:6808:1789:b0:40b:3530:9c9c with SMTP id 5614622812f47-41d05754020mr475705b6e.34.1752621264754;
        Tue, 15 Jul 2025 16:14:24 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a172:6205:b5e:43cb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4141c1ac4f9sm2386354b6e.37.2025.07.15.16.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:14:24 -0700 (PDT)
Date: Wed, 16 Jul 2025 02:14:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yu Liao <liaoyu15@huawei.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [bug report] media: use struct_size() helper
Message-ID: <47676fce-55ae-4d29-9bac-c85deea1ad48@suswa.mountain>
References: <72cfeef1-589d-4946-ace3-c5796fad767a@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72cfeef1-589d-4946-ace3-c5796fad767a@sabinyo.mountain>

On Tue, Jul 15, 2025 at 03:28:21PM -0500, Dan Carpenter wrote:
> Hello Yu Liao,
> 
> Commit ba85aea885a1 ("media: use struct_size() helper") from Aug 16,
> 2023 (linux-next), leads to the following Smatch static checker
> warning:
> 
> 	drivers/media/common/videobuf2/frame_vector.c:162 frame_vector_create()
> 	warn: saving 'size_add' to type 'int'
> 
> drivers/media/common/videobuf2/frame_vector.c
>     152 /**
>     153  * frame_vector_create() - allocate & initialize structure for pinned pfns
>     154  * @nr_frames:        number of pfns slots we should reserve
>     155  *
>     156  * Allocate and initialize struct pinned_pfns to be able to hold @nr_pfns
>     157  * pfns.
>     158  */
>     159 struct frame_vector *frame_vector_create(unsigned int nr_frames)
>     160 {
>     161         struct frame_vector *vec;
> --> 162         int size = struct_size(vec, ptrs, nr_frames);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Using struct_size() and then saving the result as an int, doesn't add
> any safety.  It needs to be saved to size_t.
> 
>     163 
>     164         if (WARN_ON_ONCE(nr_frames == 0))
>     165                 return NULL;
>     166         /*
>     167          * This is absurdly high. It's here just to avoid strange effects when
>     168          * arithmetics overflows.
>     169          */
>     170         if (WARN_ON_ONCE(nr_frames > INT_MAX / sizeof(void *) / 2))
> 
> There are some integer overflow checks here which are unnecessary if we're
> going to use struct_size().
> 
> The reason why this uses INT_MAX is that you're not allowed to allocate
> more than 2GB of data with kvmalloc().

What I meant was not only will the allocation fail, there is a WARN_ON()
in kvmalloc() to teach people to be stricter about what they let user
space do.  So if we used struct_size() correctly the code would be safe
but it might trigger an annoying warning.

Btw, if anyone wants to remove the WARN_ON() in kvmalloc() that's fine
too.  Probably people have been educated enough by now.  And the
WARN_ON() hasn't really made anyone start using sensible limits, they
just limit it at 2GB which is just going through the motions.  If you
send a patch to remove the WARN_ON() you can use this paragraph as the
commit message.

regards,
dan carpenter


