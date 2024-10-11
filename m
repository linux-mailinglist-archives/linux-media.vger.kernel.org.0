Return-Path: <linux-media+bounces-19382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D15999B3D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 05:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFCC11C22BD0
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 03:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407EC1F4726;
	Fri, 11 Oct 2024 03:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+VCt4bt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48132804
	for <linux-media@vger.kernel.org>; Fri, 11 Oct 2024 03:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728618143; cv=none; b=EgL1Bef1U71+qdqORgou/cPiRi1Gq92pp50nqKe2KPGq6aTl47DeVwxmpRdqEEtvAaOoms3tHhfShsNLYsnFOXf/wHrBtw1AK0svoCMyKnMRj2138i5AKqH25QAyNia4cC0pcdnpqmBo9AFG++4jbQLqMCI162EMWrXUPnkjH+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728618143; c=relaxed/simple;
	bh=0VtCi9/GPr03UacaMXpLzJfova+e3y7PnQFLcTc3jIA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtnmVP4dLP/v2m+zSN75KhKeqZa2GpOg52XI44wuHRfrmkVWOLCvUD1K1YtrPBpllmVfYXA5CtQkIjk9jaPBV+C5elEbhv9/SrmUweyLtsKjklfn/FzCTkJU/CsdzLEMrFzUVOj3+YA5JAWNloWVQBWVOLLCt6BPmcmIYJnydbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+VCt4bt; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4603ee602a0so12926811cf.2
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2024 20:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728618140; x=1729222940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozv1B8tUuB48HAjAJD6TasPxZxNFiXSHofJ84PWMkrw=;
        b=h+VCt4btuOA3DAtetXX315Vx6Es3GLy2FdTSIUl+y7Qf2gwTHtFcp7IqOY/lIsL/Hu
         Steh7aYhw6oL7eHyzxyCFcuO+0gDZTBjhouVg8mrzy15qYcQ9mgW5++yt/dI2a3QkNA6
         L+WB7vTsRV4qK8Nnhf5plMdxC5Y3efuQUsIuDFVKds/MtQI8YPIl4eHYeFnXxFKzFMB2
         T4VjAVgZql6Z0VVGTBaganrGSE21sRwM188p4UCoeu14K5wTRBkL20ReajDh0JdXeE9h
         HKymCrCUjZGXzi+rbOvb40PtTJw0sO5mX/+nom5Ub+h/JtsnUx9fuvoPfzl70cqoxvmr
         7THA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728618140; x=1729222940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozv1B8tUuB48HAjAJD6TasPxZxNFiXSHofJ84PWMkrw=;
        b=si8GYD8Gl8P3PFg1AH11WsyzgE/HOLDl6JEWPekxjXUleN5B0bQxTHD0QnpN3TS8FZ
         hcq9HQy+cbm5Ohf9Q6iALxlswZehUREtuP9r5qXkuk12fRDQVsI4Lr9WQl0ceD8nQnEn
         H+LjhiUG6jVPJc/57jZJmbfkPyZ+Xz8xg4IHN0fsiNcRWnoYnokqvdCHY1WR4kkom7ND
         7lWyvTu93nCbhI8Xz7yFT+Z33+UsQxpNwz0niW8xqSP/k1qQM8wO79ae1t+lkHTqFuur
         1UH89McrJyIYh0RapMdQZLWGDnnBU9UseXqjUuCXLfTL6ktJ46M7XMwJEgV5+umXR5dk
         jOKA==
X-Gm-Message-State: AOJu0YyFgOqruFNiaE6BnL6B+bojJgPhO7oheYZLl7NzC4adcGB1bIYM
	5Jqs6lTEmlYbByI793q7PpwB911f0RbLD4g6WXzFoNxnl2nRcnymlj4n3IY+
X-Google-Smtp-Source: AGHT+IFubBPTry63OpDNQH96Zeudngo4/yeSOCPCFgzcBnK35T56+t+WXMhKeyEyS02E7EKDQyYnQw==
X-Received: by 2002:a05:622a:5293:b0:460:50c0:c484 with SMTP id d75a77b69052e-46050c0c641mr2670671cf.6.1728618140166;
        Thu, 10 Oct 2024 20:42:20 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::786d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460427d5178sm11558091cf.25.2024.10.10.20.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 20:42:19 -0700 (PDT)
Date: Thu, 10 Oct 2024 23:42:16 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Linux-Media ML <linux-media@vger.kernel.org>,
	Patchwork Integration <patchwork@media-ci.org>
Subject: Re: [v6,0/5] Add SDM670 camera subsystem
Message-ID: <ZwiemHNML7St9T9R@radian>
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <67089532.050a0220.29f00b.1905@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67089532.050a0220.29f00b.1905@mx.google.com>

On Thu, Oct 10, 2024 at 08:02:10PM -0700, Patchwork Integration wrote:
> Dear Richard Acayan:
> 
> The unreliable Media-CI system has found some issues with your series.
> Check the report at: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/64934232/artifacts/report.htm

Ah, this patch (5/5) depends on commit 7f58b336f3e0 ("dt-bindings: i2c:
qcom-cci: Document SDM670 compatible") for `make CHECK_DTBS=y` to
succeed.

> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> If you believe that the CI is wrong, kindly reply-all to this email.

The CI isn't wrong, it's just easier to state the dependency in a reply
without sending a new version.

