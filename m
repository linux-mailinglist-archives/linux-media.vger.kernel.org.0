Return-Path: <linux-media+bounces-9657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A28A7E6A
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 10:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D636B1C21159
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 08:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E42127B72;
	Wed, 17 Apr 2024 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t7Q6Ct7S"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDEC139F
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342991; cv=none; b=Olaj4o0uaqUa5v9V07BVVkrWUsTVoMVvEFNwQOzIe/fM6EXygKX/7NYUpZaTKimbCriqAY8ZuNkNVs9jZwWsnAzfKH7d3Bvr0mN7da1DLpQhur7Unp77Tkp/oqHOZrM4NJ3CjAgifK8/0RUIv2J7iha0lhVHWAxq/od2hleBnAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342991; c=relaxed/simple;
	bh=jLrSv3mDwVJf7c0urmHft4NujHyUwpP7/8/epSXi7WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4aXBb92PcshUsDHtwk4Sqp8jzlJCs8Kha+a0D7xOh4lJ2X5B7LW6gx00wExTWNJ600Ahl43ArljR4CXF5l7dhCT9+TruR50BYBJwJfCJREQa14H0CfZFPw2Er2kK/k7mihLUENar8pSRdYdtofHd8w6LikoOUt18qP57Sb1Nn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t7Q6Ct7S; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a52aa665747so369083466b.2
        for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342988; x=1713947788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQiui35tGbgrLHrxJlWNcYO7KRQh2YZtezQ4w5QZix0=;
        b=t7Q6Ct7S2/PJ0C1gD6abhxeDvZGAZmkQHqgYIfIA+Wpu5qwYOqSKjTWPOMd+KaqfNI
         iuXCtg1wbAFy3ODG13QBvTtg+Ijmi9OEQEOHCT8PqEQ8iC9jLFW7z9RaTZVwtap0QF+5
         Ckoy82ZCaSERUWFyhGjHgjBblrHVQ7GzasKMq2Mzy5vExx7ogT9OLhedEsUSubIaxV/z
         n+/Hh8P5DrqqOtbtkW/XVCIYBuPT2WIl3EeESLpBjPXah+tOwugMuPcD8qwFYhgrImfc
         hQH7Z7T+EgikKiN5y0/uO/gU6hZSvvGX9I3sArmsyXLynRU/mSYizP23syqIBNGb1zmp
         +CAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342988; x=1713947788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQiui35tGbgrLHrxJlWNcYO7KRQh2YZtezQ4w5QZix0=;
        b=bqNFRDUIhHBg0nMrtb49AZ78mzBqzSe0T2i9wfIGpPUHifvrKlV8oX5lS1zLZ5xlS3
         LG1LWJV/kgrd8afp+14sHW0VtQe+lUuQs3PESoYHj719/dJZkv8//Y4fWRqzHafevMC1
         e31qZGgHGbjWIdq+he4xR6bfSQoFveYU5xzc8y3GSu33gSDtjpy0K5V/PpRlqyFbp46S
         Sim5DgOYt1F+KIH4uywBB/IkaigLClrvfJ2qma2IuLXEWEIZq7cW2h3s5G1nxuw7advP
         rSUle7WI6TbMKSSMm1/6bzK/ApdmL4MhZXrQrrFKwr6Xo0CBB7cI4wPIaHQfJfwsBHmB
         ETRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8/rpuwf+akk/ss8IBU1v5tVmDh3Yo/ZBH6F1dJc/2my6XebWTbMH0zbiBkdWZA8Ek9BlzEFB1m8gK4SJ9TnK4jiDcNIoZNyReNZI=
X-Gm-Message-State: AOJu0YzLCpsYrhE0Z+tb5JpGSumPY/Ta2/J3QtL/1xuoBoNVzYiJx7sM
	EOxqKL69kxlfP2z8cF5dS8df3s43TDBnl01XspQ+sQbIrOcMt6O3BO3bP7yHrCA=
X-Google-Smtp-Source: AGHT+IGcBOrF6dlMwP4LWwT62iTJu3n3+RD0VmgZxc7ueD6NugKm/u+kb1GXFPPYn+h8dHTWajk2Vg==
X-Received: by 2002:a17:907:846:b0:a52:6fcb:564a with SMTP id ww6-20020a170907084600b00a526fcb564amr5823920ejb.9.1713342987569;
        Wed, 17 Apr 2024 01:36:27 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id cw21-20020a170906479500b00a52182471a2sm7905680ejc.13.2024.04.17.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:36:27 -0700 (PDT)
Date: Wed, 17 Apr 2024 11:36:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 25/35] media: venus: Use the correct div_ function
Message-ID: <06113ffe-11bd-4c73-aff7-5e55aa8e3edc@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-25-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-25-477afb23728b@chromium.org>

On Mon, Apr 15, 2024 at 07:34:42PM +0000, Ricardo Ribalda wrote:
> us_per_frame does not fit in u32
> 

drivers/media/platform/qcom/venus/venc.c
   391  static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
   392  {
   393          struct venus_inst *inst = to_inst(file);
   394          struct v4l2_outputparm *out = &a->parm.output;
   395          struct v4l2_fract *timeperframe = &out->timeperframe;
   396          u64 us_per_frame, fps;
   397  
   398          if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
   399              a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
   400                  return -EINVAL;
   401  
   402          memset(out->reserved, 0, sizeof(out->reserved));
   403  
   404          if (!timeperframe->denominator)
   405                  timeperframe->denominator = inst->timeperframe.denominator;
   406          if (!timeperframe->numerator)
   407                  timeperframe->numerator = inst->timeperframe.numerator;
   408  
   409          out->capability = V4L2_CAP_TIMEPERFRAME;
   410  
   411          us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
It looks like in some drivers this multiply can go over U32_MAX.

   412          do_div(us_per_frame, timeperframe->denominator);
                       ^^^^^^^^^^^^
But after this divide, then we're under 1,000,000 again.  Otherwise the
FPS is zero.  So maybe the right thing to do is:

	inst->fps = USEC_PER_SEC / (u32)us_per_frame;

   413  
   414          if (!us_per_frame)
   415                  return -EINVAL;
   416  
   417          fps = (u64)USEC_PER_SEC;
   418          do_div(fps, us_per_frame);
   419  
   420          inst->timeperframe = *timeperframe;
   421          inst->fps = fps;
   422  
   423          return 0;
   424  }

regards,
dan carpenter


