Return-Path: <linux-media+bounces-40457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B705B2E157
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B265FA01B48
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB41636CDFB;
	Wed, 20 Aug 2025 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AfmCwaWy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC3236CE15
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755703890; cv=none; b=olf6lN9Fw/Ct3X8rG0g8BHFD1laeRPSkgsGLrVlkHdBy3hsdkQ6ioFWoiiKJejiuUW7iKiUTAVD24bowMhoyCDlMoQ5fY+211fLyShCpPSRGMe8p5ayDSYrMlbk1yRH/z9PZ377VtuR+CfqnRk+bo9hYl/VEb0RqmV8KnR/J2Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755703890; c=relaxed/simple;
	bh=qJmN7kIaBiDpEn9+ld3jsBe/j1DtCdZXbIRHnPsu52U=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tz6REE3lVbLn3hH9P0Vvtms/lQTdmuZHxn4S/fQY/DJ/2dyoQ6MDRWCe2qQ5TRgZbJM478kQPDwMaNOAn6yBYUrITxSTMBfI3+6RAnMaDr9mX8Fd2vItL/esqn9E6JK0lxj+aGRe01VjK0uL4ngjYPVpJCmXv3BcfFnAsO0f8Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AfmCwaWy; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9e414252dso22601f8f.3
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755703886; x=1756308686; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzqjecvcjM5mA1QnPXvB2YqRcxPwKlC0jZ1qJk3Y19E=;
        b=AfmCwaWyZ+R0XgZj2+N8/A/xtLh6FjP6f4WvVwBhEcdP8KC+2nIqXEkWmisYor7H0Z
         P6XAP3+0ydWfLEd+O8Ys/muhJLdsb0ckmD2HdM6MKfeV0cW+/jlaUepX84IF+Rg3PyxG
         dKrdhhBE01EezdMNEUMK0yYrhmKvgUvMRddwgg5SQtcCoA9MZAU+M5naXQrkxjR0PvE4
         z6O2GIIBqw08ExzS9sBVPsYKxm5G9+uRnSTn/Sb3D1W8SPRZakcK+9DJDjypPH8mBdmW
         sIaI0DtHutC5G3mPQxQOg0zQWVf0fpQFagF4WIVEuXZed+jUavI6KtCir6Vv56FmoSVa
         imHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703886; x=1756308686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzqjecvcjM5mA1QnPXvB2YqRcxPwKlC0jZ1qJk3Y19E=;
        b=B6ngntHs2UQhlALVkDHpGLfJWOpuSazDmB50W4bY/12uCAoOYgK+XH0WjeJMFDs/rs
         kIaTCW6bDKgUpO3PASK3q0Ja6ypVLfJmWOtM5MZ4GbkvOu8SNzdqRS74QdJmHKFfbZyI
         yxcWl62uv8d17nap4DhmozYnVMYs/4SWP3PMZJAViwKM12bJoZhVN66WC3m5Kv6Je3Bp
         5kLmCi2ujIuXUl8bgfStG3t45R/Nn/8qa8hNbaAwFIrenHAxc1sxr0f3w3cwpr8EpB1j
         I136Il8zYP+RzRaxl1rEQOjw3MDYGUQ/CvIijnTA4PXmufP9NNLxF3FrrYE5NEYkxjDo
         y3bw==
X-Forwarded-Encrypted: i=1; AJvYcCWH7b8ZG0bCXZRlwx4r/I6FtF/myl5bWjjqYRIzpOa7g21dP7h8Jc12Xr0QNtB0c7yz9W2COn18F6oxZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyggxzhwumxR+6SoieQZCsRIhbdeiHqQ+fS4GAjdeFWgqHVkvqB
	a5/bye1J3Gd3fRofjl2O3kePvA2VJvO0ERI+iJM132DD6LudqiYyEKvsx7TWeueqdUs=
X-Gm-Gg: ASbGncss/SKGMAsC9Yug6KCPEKpJ45TlZoaA7Hfw95nXb3N4kuxS0YCk8lulbFiJk3F
	LgJDGMQOUD8gZMV1qiDkj3yaCNXatZbPoEXlKw3oRQpF/0XDgoaofh74T+7LJzD0atNLfgTe01O
	Wa9QdXtS9PIRPoRQiDyKIUXkxEMYI+Ej7GspF+msDyFQEtlC1zZF/7bKcEwqbAT99NTRZz2ibLE
	VisVOUs4yMy+o96jjRrH/016ir6IYXibddiF2LVVIXfjM6LdTCymbyQmYoPbiAuIGZRC9d6cFbM
	CWgtUPTAWm14u8TIc+wn5gdDRzsTutGjdENEGO3QMtQh3ULlUd8lVM35odLbF5HDLsDCzaYmchZ
	XAKimHwqxefm69UPxNQGauNc+ELvTAeSWOD1WFgI2GqdQ8A==
X-Google-Smtp-Source: AGHT+IE4T3vY+puKqxGjG4X7XDJYT7z1Ltxe4/gOKPnjv/zWlcl1JE04RbAJZfYJjhbRaovEv1kUCg==
X-Received: by 2002:a05:6000:2c07:b0:3b9:2960:bf92 with SMTP id ffacd0b85a97d-3c328efe064mr2441811f8f.0.1755703886390;
        Wed, 20 Aug 2025 08:31:26 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d9eb:6295:cf25:b839])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c3c49fe4b6sm2083836f8f.65.2025.08.20.08.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:31:25 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:31:21 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <aKXqSU-487b6Je2B@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
 <aKWDXySSt57tXHVP@linaro.org>
 <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>

On Wed, Aug 20, 2025 at 08:48:22PM +0530, Mukesh Ojha wrote:
> On Wed, Aug 20, 2025 at 10:12:15AM +0200, Stephan Gerhold wrote:
> > On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> > > The resource table data structure has traditionally been associated with
> > > the remoteproc framework, where the resource table is included as a
> > > section within the remote processor firmware binary. However, it is also
> > > possible to obtain the resource table through other means—such as from a
> > > reserved memory region populated by the boot firmware, statically
> > > maintained driver data, or via a secure SMC call—when it is not embedded
> > > in the firmware.
> > > 
> > > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > > etc.) in the upstream kernel that do not use the remoteproc framework to
> > > manage their lifecycle for various reasons.
> > > 
> > > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > > also want to use the resource table SMC call to retrieve and map
> > > resources before they are used by the remote processor.
> > > 
> > 
> > All the examples you give here (Venus/Iris, GPU) have some sort of EL2
> > support already for older platforms:
> 
> Example was taken from perspective of remote processor life-cycle management.
> You are right they have worked before in non-secure way for Chrome.
> 
> > 
> >  - For GPU, we just skip loading the ZAP shader and access the protected
> >    registers directly. I would expect the ZAP shader does effectively
> >    the same, perhaps with some additional handling for secure mode. Is
> >    this even a real remote processor that has a separate IOMMU domain?
> > 
> 
> I don't think it is the case and think the same that they can skip
> loading and Hence, I have not yet added support for it.
> 
> Will check internally before doing anything on GPU.
> 
> >  - For Venus/Iris, there is code upstream similar to your PATCH 11/11
> >    that maps the firmware with the IOMMU (but invokes reset directly
> >    using the registers, without using PAS). There is no resource table
> >    used for that either, so at least all Venus/Iris versions so far
> >    apparently had no need for any mappings aside from the firmware
> >    binary.
> 
> You are absolutely right
> 
> > 
> > I understand that you want to continue using PAS for these, but I'm a
> > bit confused what kind of mappings we would expect to have in the
> > resource table for video and GPU. Could you give an example?
> 
> We have some debug hw tracing available for video for lemans, which is
> optional However, I believe infra is good to have incase we need some
> required resources to be map for Video to work for a SoC.
> 

Thanks for the clarification.

Personally, I'm a bit concerned about the code duplication in PATCH
08/11, I think parsing the resource table should ideally be code shared
between the remoteproc subsystem and whereever else you need it. The way
you parse it and handle the IOMMU mappings is largely the same, you just
don't support all of the resource table functionality. Have you checked
if sharing the code would be feasible?

If there is no upstream requirement for this right now, you might want
to consider handling this in a follow up series, after you get the
required functionality in. This would reduce the amount of changes in
your series quite a bit.

Thanks,
Stephan

