Return-Path: <linux-media+bounces-39910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C00B26387
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 12:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40DE99E71BD
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 10:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9CC2FC89D;
	Thu, 14 Aug 2025 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="LEwAwmld"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFF92FAC01
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168718; cv=none; b=lJWH6Ba+/kv/oHqV+74YZmzjNIt2e4/Q2fNuyLaJq0jJiQG9EYr6q/x/jD5mUqQ4bl1uhbR4uUaSqUc/fh2SfoqyGnfkM5DH04m4net1Rozr+o/CtOXvaVypp4brQwbmkJzP86rH/DtRj4gfFo27R6LkmPnLwocd0zIEyHS12Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168718; c=relaxed/simple;
	bh=PNTx4CmRkSdUd0ZEOTO9fu2xfKKN1RKXSc8Ys7kT/1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZjcGG76qDcAiPb3ZpqUw7T5C8JIC+LcXIm3EWQZ+zNgirC7Yf7w3kQOB1xWBwAke+kyddshxe3E5dqTcjP0VQpO4fhbY5vYuu26lLwvulGeNChLZTkrXc9pErNahjQRLHR8U3bGuG7jUpcdyiV642ny2sH6UkMyjKRKv72r8oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=LEwAwmld; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7e87030df79so78908885a.0
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 03:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1755168716; x=1755773516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EyUvbzeFbhuIBv4W0x0po1vS1DTZvcEEYsQW7Y4FHOk=;
        b=LEwAwmldPCTdR5S8wSeAK7U+tCZfASH6MVtSkQwrRn5/GaDjz1XZu6MYD3NCghr7km
         Uzlx/j5eFeLGMowQYG9WvcsVAj+RHXY9hEdVgXONZ/jXqQdhcjvJaEgiuas6mpWZNBQl
         RSlOQKsQXQ3cZPVoxj2lMEtMtBgH6xSTbbsyqVJBGrQ+rURAFciNE2wsjQKWAKtgi7W1
         u9XfT3aCGmetPRPgM3MMkRcHnmUAnxoHd59mJDYkRCzX2lNr6CXC05X9mLvNJvaAxoPJ
         0Zo3QnGsgCRIHKQ8nOgASSG4YDGl3569d3xdVuJZfHvKHQQiPfwjMA5DaGfBC8IRVR7m
         tuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168716; x=1755773516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyUvbzeFbhuIBv4W0x0po1vS1DTZvcEEYsQW7Y4FHOk=;
        b=BR6Fn3WaljAQs0MReqXEWyjuugQbQMdpK485eJTyr/B3szEtNBC0fETlmjgDPO4Fad
         d3wS4EuPSDeGDgcp6QXGJJ3NC7+nqwSJPru14cs9ZxZr4BKkKE3KHAqOtpT7Los1tTW9
         cTsYsn9RXNo7ECQrjBloYsdeE9SBeRVbnJck6/whm+ecq9qsSVG+3NQ7VAhHKWbXlrQQ
         xIEAYvaekNZHxDVeINBcOaPDgNCjYc4wqJNOrWNsGZpfROqtgchxKsZAqv2NFFKGHozS
         aO6jE4PjnSttiq6Au+cGfhALy3CvWq9cR6H/eCzvNos1vOQOq0zSs6H1n9Lvr22iOugy
         gL5g==
X-Forwarded-Encrypted: i=1; AJvYcCUaZZNezXnVnKafOHReLLQ+GgVBy6SV0jrf8yhEfG5kZKtPGi6NtfKmPrVHyo8ZDwLTqv8EKlU0J3l1BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+nCAweMHVeGjR6DiPaQpR+T4ZTeRmXKFLdVKPCE0wnv/bJH9+
	tc1opCixqzCmONFYXdqJoOapiFDI4l6Z/Z4ocbtY4s0Fy9XoXfldjJicRcLD/3eulfKJHJ486bj
	bm6mCN7AIxr0m6i/eVRkWZsg5Mdq2zSzaFcU84xhhkA==
X-Gm-Gg: ASbGncuwyurMuOJ4A7kr4uLN0vBMuA7M0SgOtlQ5KIxWFSLAOKY/peC3KqSzjY/1vx6
	9BqSXnulz6j3pukkqJgGnEeFLvBiOGk76P+Lv5lC5Bhjjs8Wf1TxJc8ocNyiIHiWcGOkbGYpMWr
	qFgSGDQli8jo/5JBtidl31kCMFJwjc64b88CX2SmQY6Uk7M5OU8OexpaDeWKJqBZRiO5fiBKRqW
	U6Z1lsaifdDMYcHNR+5i+UcZvJaUGtl+5TdemiWrw==
X-Google-Smtp-Source: AGHT+IFU90m48TZvu7emDeXfQb++9pXmCA/ExMi3L8cHu3e/h3aMjPcuvjlvwAbLWla/D0jCK64yfVaPIBbatOC3QzI=
X-Received: by 2002:a05:620a:7088:b0:7e8:4693:4cf0 with SMTP id
 af79cd13be357-7e8705d8895mr317330585a.54.1755168715779; Thu, 14 Aug 2025
 03:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org> <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
 <CAPj87rNG8gT-Wk+rQnFMsbCBqX6pL=qZY--_5=Z4XchLNsM5Ng@mail.gmail.com>
In-Reply-To: <CAPj87rNG8gT-Wk+rQnFMsbCBqX6pL=qZY--_5=Z4XchLNsM5Ng@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 14 Aug 2025 11:51:44 +0100
X-Gm-Features: Ac12FXwC6fsbGm2wMI2VtffK314czO8RhVctNAh3tnx01lPB-4vBApOS_6ocfcM
Message-ID: <CAPj87rNDPQqTqj1LAdFYmd4Y12UHXWi5+65i0RepkcOX3wvEyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] accel: Add Arm Ethos-U NPU driver
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Tue, 12 Aug 2025 at 13:53, Daniel Stone <daniel@fooishbar.org> wrote:
> On Mon, 11 Aug 2025 at 22:05, Rob Herring (Arm) <robh@kernel.org> wrote:
> > +static int ethos_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
> > +                                  struct drm_ethos_job *job)
> > +{
> > +       [...]
> > +       ejob->cmd_bo = drm_gem_object_lookup(file, job->cmd_bo);
> > +       cmd_info = to_ethos_bo(ejob->cmd_bo)->info;
> > +       if (!ejob->cmd_bo)
> > +               goto out_cleanup_job;
>
> NULL deref here if this points to a non-command BO. Which is better
> than wild DMA, but hey.

Sorry this wasn't more clear. There are two NULL derefs here. If you
pass an invalid BO, ejob->cmd_bo is dereferenced before the NULL
check, effectively neutering it and winning you a mail from the other
Dan when he runs sparse on it. Secondly you pass a BO which is valid
but not a command BO, cmd_info gets unconditionally dereferenced so it
will fall apart there too.

> > +       for (int i = 0; i < NPU_BASEP_REGION_MAX; i++) {
> > +               struct drm_gem_object *gem;
> > +
> > +               if (job->region_bo_handles[i] == 0)
> > +                       continue;
> > +
> > +               /* Don't allow a region to point to the cmd BO */
> > +               if (job->region_bo_handles[i] == job->cmd_bo) {
> > +                       ret = -EINVAL;
> > +                       goto out_cleanup_job;
> > +               }
>
> And here I suppose you want to check if the BO's info pointer is
> non-NULL, i.e. disallow use of _any_ command BO instead of only
> disallowing this job's own command BO.

This is the main security issue, since it would allow writes a
cmdstream BO which has been created but is not _the_ cmdstream BO for
this job. Fixing that is pretty straightforward, but given that
someone will almost certainly try to add dmabuf support to this
driver, it's also probably worth a comment in the driver flags telling
anyone who tries to add DRIVER_PRIME that they need to disallow export
of cmdbuf BOs.

Relatedly, I think there's missing validity checks around the regions.
AFAICT it would be possible to do wild memory access:
* create a cmdstream BO which accesses one region
* submit a job using that cmdstream with one data BO correctly
attached to the region, execute the job and wait for completion
* free the data BO
* resubmit that job but declare zero BO handles

The first issue is that the job will be accepted by the processing
ioctl, because it doesn't check that all the regions specified by the
cmdstream are properly filled in by the job, which is definitely one
to fix for validation. The second issue is that region registers are
not cleared in any way, so in the above example, the second job will
reuse the region configuration from the first. I'm not sure if
clearing out unused job fields would be helpful defence in depth or
not; your call.

> (There's also a NULL deref if an invalid GEM handle is specified.)

This one is similar to the first; drm_gem_object_lookup() return isn't
checked so it gets dereferenced unconditionally.

Cheers,
Daniel

