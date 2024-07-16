Return-Path: <linux-media+bounces-15056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DAD932780
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 15:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE08284DAE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 13:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A2919AD89;
	Tue, 16 Jul 2024 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UnYxXSv1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D7D19AD4F
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721136602; cv=none; b=sHpttMNvmC/yG3NL0KEV3DmpABMxVjoseP7x/a3xNgQYEg5xBcL3VHQueuQao7r76yWGu4+RFEzOn2fHzbUBhS2AhxBpf//CSqlyIbwanGIDtIZYbbvqE6xeGD94v5HnNbc8NenAX+xr6dQdheyy+cYVR4EdhqXqq0lHrBGLcGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721136602; c=relaxed/simple;
	bh=8HYNgawfLv03Fo16wDlQSi8akNrj5qYOfYyy6GcDQyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9lYfmTiREUDd9fdpxIh9StjjTDvrnYTZAl30UvyQXi+rUuUCwbUJw8t6QS8b0Iv65b6Ng4xKH4mCrfupWfH1UUTYZb8a9bOr8xn51J9Ib7wgSHLhWXL+bK2cj0Ax3/dTWA116mEkDC9qUCElywGZ9sfXGLKchQbi0m1lTEeWdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UnYxXSv1; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5ce74defe42so1432842eaf.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 06:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721136600; x=1721741400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X6kPITFPoONsrONfKI8fOyMFNRW5N14Zi9RiqD3y1RQ=;
        b=UnYxXSv1PHAEo96a+sPND/WbF0IrM2ppdyw85OnXyQin10b6JUP/bjOZiXrUctAAU5
         /0I7tE0wbXCDeq5IYgVIfEm+ePxDGQ9z+zTpdVu5vBTiC4bBXUau551xhatWbsdnRe79
         3yjGNO20Th8ZckhbwvXT5SnvJ/VKQrl+OXG4QO7qH6xtXXhF4Xq0QaZ+QJZbwy3LPfbQ
         VPt5NxwjWElB6eaHGdibulqF52Nc7UlgWHWSPp25f7xla/maRWAPApsw8dYQMnGOyB7I
         +08Ue2M7YszIo6KsSd6ovVgVh1orsW9maxKkxmhy7cMhTUP1d+Cr4YDI0zzSM5wY9BAl
         LVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721136600; x=1721741400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6kPITFPoONsrONfKI8fOyMFNRW5N14Zi9RiqD3y1RQ=;
        b=vPIanVkAQGlN2WatyY4gn+3ymGyeYDTzW9DNf5zbw1SoZT+5832WSlBJvySW7YvvGu
         95oOuP1O1/iSb2kzJHgJoI5ZH4hWIdp5Y1paeA21jAxkWvPNCIndoNFKfazCNf9GygEt
         Xrqj0l8CTv7IbkFnCsNjfL0VCSHxYOr0s5baP0dBF2mu8rh+R4WMwhxXXra3lICbiAXo
         zYT+K7T/UozjQDz25ewfnUf9d3UPdUVnvMhwbqFPNGgOdD/x0QQN7BSpISwhmCWFLvHY
         OGPEI8oVO6YBs3PFKVcJmYxfQ25uaNTbwdjUMbIpjty3Kpdl25Evhf0Vbc+CbSgHl3WI
         xn7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0dzQRfDtBerCN7RGevyYfmi7epU0xqwEizNQSgsX8/aAZfPKJVmTrkgNCJJiBl1EQdoqruzZOjAkztoDr/O9CFVk6a/xW83x7NHw=
X-Gm-Message-State: AOJu0YxpXN5hR8MQiN5G03SgsJWSUX7uLPqwtQS56pzxE+1coHMlPI4O
	RpIcWJSbxp4ZTqvUUKUmoF1a3OFCRtqFxH+ClzsEf3RFNssnLgXfL3O+ICY6GxA=
X-Google-Smtp-Source: AGHT+IHAJzKTzIVB/fjO3bMu8ucV/36Iax5msM+XxaRxcJRhKHCsERhBvnA0iypsMo+N7w6fX136KA==
X-Received: by 2002:a05:6870:214:b0:254:7f9f:3f21 with SMTP id 586e51a60fabf-260bddd8206mr1759131fac.27.1721136599907;
        Tue, 16 Jul 2024 06:29:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:b5d2:9b28:de1e:aebb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-26075137228sm1319564fac.22.2024.07.16.06.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 06:29:59 -0700 (PDT)
Date: Tue, 16 Jul 2024 08:29:57 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: pispbe: Protect against left-shift wrap in
 V4L2_COLORSPACE_MASK()
Message-ID: <f6696dbd-0b1f-45df-823f-bc738d95ff48@suswa.mountain>
References: <20240715102425.1244918-1-naush@raspberrypi.com>
 <t4zv56rnrprztgyjyjx3k3lzaitddky3c22bqslykq3qvxi7gi@jaafmm5uw6rs>
 <CAEmqJPrUbK-gpHfJG84iBeA_9WOJYLDoa4JaGjLvZYoq-nUgdg@mail.gmail.com>
 <74hch6w64p7yzn4wustd3btn7dglxxbuge3r6bapb6chbbddeu@vljc2qopn5kj>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74hch6w64p7yzn4wustd3btn7dglxxbuge3r6bapb6chbbddeu@vljc2qopn5kj>

On Tue, Jul 16, 2024 at 10:48:20AM +0200, Jacopo Mondi wrote:
> > I did consider this, but did not like the undesired behavior it would
> > introduce.  With your suggested change above, we now switch the color
> > space to an unsupported value (V4L2_COLORSPACE_DCI_P3, assuming we
> > shift by V4L2_COLORSPACE_LAST - 1) if the user passed an invalid
> > value.  Of course, this does subsequently get fixed when used in
> > pispbe_try_format(), but not for the usage in pisp_be_formats.h.  In
> > my original change, we revert to the default for the requested format
> > instead.  Although, perhaps my test should be if
> > (!v4l2_is_colorspace_valid(f->fmt.pix_mp.colorspace) ... instead.
> 
> Keep in mind the core 'sanitizes' the colorspace for you (see the
> usage of v4l_sanitize_colorspace() in
> drivers/media/v4l2-core/v4l2-ioctl.c) so a fix is need only to silence
> smatch not to actually address any run-time issue.
> 

Ah.  That's true.  Let's just ignore this warning in that case...

Smatch would have an easier time parsing these if we passed p instead of
arg to return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg) in
v4l_try_fmt().

	struct v4l2_format *p = arg;

	v4l_sanitize_format(p);

	return ops->vidioc_try_fmt_vid_cap_mplane(file, fh, arg);

I can just filter out that call to say that when v4l_try_fmt() calls
ops->vidioc_try_fmt_vid_cap_mplane() "arg" variable is trusted data.

regards,
dan carpenter


