Return-Path: <linux-media+bounces-1726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85442806B17
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 10:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9B75281A72
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 09:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705661DDF1;
	Wed,  6 Dec 2023 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V3zKHxDx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F25109
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 01:54:55 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3316a4bc37dso529615f8f.2
        for <linux-media@vger.kernel.org>; Wed, 06 Dec 2023 01:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701856494; x=1702461294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aTCNtdrnCjRUY4nx+WfhitLfkIdEU+u5rOlYMuK6fK8=;
        b=V3zKHxDxRBJacc0rjl/ulUt+FcyMN3s4C7lYEN9YVXwqt9gsCnZafXvMT0lcvlXw9v
         eB5+cXolpEh7PR7btu1ySvVA3rCIOttH2FS1FSRbsSaKMlWfv3mSizoFA5JPpL1s0ISu
         7qcUqZROrHCa6FbVVquKH+tY4hOgk0pz2mL86e6bhBXTvyd+sEukLIu/LRxeV2xXrCJA
         LSO7bKYDc6dtBCxb86oqjFmt01d87fp4HdKtD+v2kYFAag65JQPsht+QZzrZGJdpFdrd
         40RHGd99tdFk6DrijpEnr8d+spXbQXRChnQX2ZmEgNpuIIbZriHVP2L7MhPqwT2X2ZC/
         LFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701856494; x=1702461294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTCNtdrnCjRUY4nx+WfhitLfkIdEU+u5rOlYMuK6fK8=;
        b=DIqhf0ORDohkvVcjpcP9BuxSf/wfiVvCyv053q/x6vNa6zwnyzQ72VVlrLFHBzmsAa
         TU8S16Z2ghwQesuGBpf8CWfkCTIPmkmfgt2Fk636yhtyXYNHQP0cF3HQ/qrtGiDaeQom
         D7/ddSoiDRA6JOLiMgeDFq+6tWRXQ++nEktPIZCukRJcBfJiXoerqzekVM4RsOCadICs
         O6NBOBMFD4DeT01UUOdw+zrfkA4qcDoIjsP9zrZ6YXbysZNt4F6kI8Dj7jMNRzuEZaU1
         FBE7umtpFiuaHBnEV1LD7blGouk+dzNF77cokdDDt8YTfVxKGHg8tcmh2cOmLi9LOV85
         23Wg==
X-Gm-Message-State: AOJu0Yz714qP3+Ub5qg3TpQWxV+6QJqz6pfFhWUPqGte3bb/Il+rxYDf
	nrm24oQPKDw/cFDdr4LjBFQ8lw==
X-Google-Smtp-Source: AGHT+IEpDHw+FDWXV5qQDjf1VsIrkntIzlpWxO7g9TKHWOxe/F+ZDIhT8l5H46wJNNjZlIQhmbBNiQ==
X-Received: by 2002:a5d:58f4:0:b0:333:2fd2:4ad4 with SMTP id f20-20020a5d58f4000000b003332fd24ad4mr290215wrd.80.1701856493874;
        Wed, 06 Dec 2023 01:54:53 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d4887000000b003335ebde680sm2861777wrq.75.2023.12.06.01.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 01:54:53 -0800 (PST)
Date: Wed, 6 Dec 2023 12:54:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: hverkuil@xs4all.nl, mchehab@kernel.org, tfiga@chromium.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, kernel@collabora.com
Subject: Re: [PATCH v3 1/2] videobuf2: core: Rename min_buffers_needed field
 to vb2_queue
Message-ID: <a2011bd9-8d1d-486d-8a54-794193dc99ec@suswa.mountain>
References: <20231206085608.33246-1-benjamin.gaignard@collabora.com>
 <20231206085608.33246-2-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206085608.33246-2-benjamin.gaignard@collabora.com>

On Wed, Dec 06, 2023 at 09:56:07AM +0100, Benjamin Gaignard wrote:
> Rename min_buffers_needed into min_queued_buffers and update
> the documentation about it.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

[ snip ]

> diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
> index fa672cc8bc67..2c91f75e8d79 100644
> --- a/drivers/media/pci/zoran/zoran_driver.c
> +++ b/drivers/media/pci/zoran/zoran_driver.c
> @@ -749,9 +749,6 @@ static int zr_vb2_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers, unsi
>  
>  	zr->buf_in_reserve = 0;
>  
> -	if (*nbuffers < vq->min_buffers_needed)
> -		*nbuffers = vq->min_buffers_needed;
> -
>  	if (*nplanes) {
>  		if (sizes[0] < size)
>  			return -EINVAL;

This was not mentioned in the commit message.  And anyway, please do
that as a separate commit.

regards,
dan carpenter


