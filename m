Return-Path: <linux-media+bounces-23100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9389EBB38
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 21:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23E602840E5
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4002622FAC7;
	Tue, 10 Dec 2024 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eLdFiJA/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4825E22D4CA
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 20:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733864094; cv=none; b=l/lokdKYdqy81u0ajyE7xPo+/LTnKTDbTSIT2YjSqoz43M+8zLBy4mPg4pHxDZ4tVWXbvWF/g8PlSF9VFmBg6QJZiuZ7XKs7Vy/HM0AKOZWjv3DNcBoS9Bv64NeUFlX56IB5br3DDSPmPIsJjziqVLYjLHfHsLE+deDSq+V3tu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733864094; c=relaxed/simple;
	bh=mYCw5zFdaYamjNq7yWm1N3ddyHnywTLmXo/dBHAWXWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTk3d68ZJX2wcXvc/NM1Pkp10/WtYiQb+Up6TetYdRqgIEnkwJk1Xk68aNM+1dPlTELJg95Qfqlfuexcy8TtQNToJ6KX1X8AYaHNnTXFbzIguUpmnBJMdeDnOhXqAB8GbVxBIEFIaklosAcHJSxZ8sIm9toJmphF8EuI7h1Co8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eLdFiJA/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2166360285dso22018725ad.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 12:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733864092; x=1734468892; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4ORuy0JI3fjhylUMikWO4DqO9jPwo1uX07vpSEDYjw=;
        b=eLdFiJA/6SraJ0p/4rE8CPDXeZNEysXjNUFXmgdOUWzQjRhAKGEOOVwzCAO/xkPpkL
         CrQ20WEyHOBA5Y/gx7hM1F5NgMz9dHQbY1Ik9cAP+HM6vie1MJxZLaf5HO6BXcjqWylp
         wVNKDxf/9ur/8twu1/qXXRqcZiuCECTKZ1P3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864092; x=1734468892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4ORuy0JI3fjhylUMikWO4DqO9jPwo1uX07vpSEDYjw=;
        b=XVGl/5xZAYdC6ezzK3PQdqFq2s6i4pz3u5ncip0NjlPsGDeY3OZMvGQId/s6+/HZhS
         xZCCQgv6QD9OrDgMT9DfzCUTCCvJTD36LXgAdCxM1jZ0Lr88DJleeZySdohOhrMNjnpD
         7ljlIdPLID244Cww7O9GIr1W2ZemX0UjcMnH8wlsC91StZ6sIRyO9BV1PcfFeo77XiQx
         IJKvEotGyVC21eZAX/QO8YJ74QmGJujVUXR6DPe/dw/9yjskcx1msIn7bxprmFUTRhaI
         rGsm60GTpyZ38I4LameClk3oMo4crJVW5M1vECO9lE53CCSo/I+dL+u6qSE+fLgDoSiV
         5dCA==
X-Forwarded-Encrypted: i=1; AJvYcCXYRgMw8p6UMc4Dz9PBZM9OgVv6kwsqCLADaMG7AvegLyrzPAblQ0EZTWmy2OxH/mJm8bmJpdxYpq4zhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYLD6u6tU6xDSbyzgPIZxFzM3g1DQQl4QK74nUJcX0V+PfIbB7
	dg2G+flTF0C0qs04HhE0QAn8rWYSCSyVs+r/kzAue7zI3e+OLT/ZPjHnTK4TKW2pAXbVYDFTMEY
	=
X-Gm-Gg: ASbGncsRnbZNv9bfTcSGvK6eHZkXCMN98mBvwSNOynGNy1+cIkCrgScAX0QYeWGUXQA
	5cwDNsZ1K1KuiH4AY1cMcMUQNJGpMHCm82TBGmljbQBmzqLcGnj0dLgNDqd8JywaV0CWtFkHXER
	PEMc9lM62pvMKzcJF8orJZEpAfuCE0QdvJEB76aon7Rv+2kF1QwN+tSotX6PGSJj5YBn1q4NKI/
	o6sW5+/uYqQRaPuI8kowtXMmUkCg5QvPB6vRLmgoY2GUwiAhwhKQr9LaRnBpi18F/Zks+3yl8oR
	6jr4RLqVL1kmitIH
X-Google-Smtp-Source: AGHT+IFpaa9bPPdYtMlmJFrjkEpGY8eHe7ujXsUtb3ShcBhY3KCeprEM0WoE5Cr3ZeC+Yso21EnkIg==
X-Received: by 2002:a17:902:e88d:b0:20b:8a71:b5c1 with SMTP id d9443c01a7336-2177839839cmr9454225ad.1.1733864092168;
        Tue, 10 Dec 2024 12:54:52 -0800 (PST)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f346b6sm93805265ad.273.2024.12.10.12.54.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 12:54:49 -0800 (PST)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef89dbd8eeso2341796a91.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 12:54:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUS7Jx53+1Rdio4z5aTjj0IYyku+kwhfG8Bh/i4cg98U2Srv2Z5bKyQoH7gyanXFf5LJeXp57TeJCjTaw==@vger.kernel.org
X-Received: by 2002:a17:90b:1847:b0:2ee:e317:69ab with SMTP id
 98e67ed59e1d1-2f127e2ad4amr750621a91.0.1733864088749; Tue, 10 Dec 2024
 12:54:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
 <20241210-fix-ipu-v3-3-00e409c84a6c@chromium.org> <Z1iqTe5_tiJ_ehzU@kekkonen.localdomain>
In-Reply-To: <Z1iqTe5_tiJ_ehzU@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 21:54:37 +0100
X-Gmail-Original-Message-ID: <CANiDSCtPg7i_xfUuC7fR+c8A6-EQEoyEDttKP0U1HMg_BUrSdg@mail.gmail.com>
X-Gm-Features: AZHOrDnfdIek0WgcOyPHb9bMVRu7gZ-lsusONuIHTchFVSzbluwkZ1W9KCGCwsI
Message-ID: <CANiDSCtPg7i_xfUuC7fR+c8A6-EQEoyEDttKP0U1HMg_BUrSdg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] ACPI: bus: implement acpi_get_physical_device_location
 when !ACPI
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Dec 2024 at 21:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Tue, Dec 10, 2024 at 07:56:00PM +0000, Ricardo Ribalda wrote:
> > Provide an implementation of acpi_get_physical_device_location that can
> > be used when CONFIG_ACPI is not set.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > dasadsd
>
> Yes?
Leftovers from a squash :)

I will fix it on the next version if needed.
>
> Apart from this,
>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

