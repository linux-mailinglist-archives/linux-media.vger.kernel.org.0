Return-Path: <linux-media+bounces-27321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C04FBA4B95B
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 09:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D715F164D94
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 08:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E171E32BE;
	Mon,  3 Mar 2025 08:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A5CIJ1oU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A1278F54
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990679; cv=none; b=Tl9SXHJRHuiUxfhBT38VuOomPYzoAYjjzY+FYdb2J/IMz7vWV7W/gVZIKr0PYXo9bQDoiLmyY62U3kEuQ+PoVwvdYfmX1Xmh/n+gRSKD3qsksNQ0bLRUCDrll+DF6t3ptEqPsKAsCzxVcIINnJBX9vHQmxs+TRX4ru6DUaP17QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990679; c=relaxed/simple;
	bh=rSUHug29gmTI/Yw6bflgu5owwRA5axaRhKY5dpWohw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/u9qxmRgCIX41FbkDaoF5MpDT6pHSyjB6HQFQgaPOiYYiv2XxPWQlgQm5gvkWXsapsOOsEhQ/9cKrgxTrS9GFyXIcnzoUY0Zi9U5a10Um7S7uFB9fzm6EnQUjvDjJSOz8PHlQRYX2LfamwfZ+GD9fS2oCv/H8sRrwhAwer+vfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A5CIJ1oU; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54965898051so886163e87.2
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 00:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740990675; x=1741595475; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vF3V+mPg0Rc+bkc8yy2fIvzEHRv9s7758x60/KOMdho=;
        b=A5CIJ1oUAQ84uoOJDCTrD3lz3949LKVDrz+/ElFf3UqdHvy1HSBiMdBRrGX9c8DS1R
         rcJWOwnz8N3yoDAl6evwkBbVkuDChFql5Dl0gEdTjFpjkuTGojN7G+6Gh9/I5kHrcb1+
         lhHMq/pG/V1lxLPlXLT5CgmiNwNYUy2zuOkoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990675; x=1741595475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vF3V+mPg0Rc+bkc8yy2fIvzEHRv9s7758x60/KOMdho=;
        b=NCMuXj+NvEQ0r4ntBNisYhPfFyCIgAGEtXv2/wpONOTSqcLptPXvsZZmSjXPzPdW2A
         GuS3SmNa2owwixEQAqtBz7+uo6BfPBvS/mRKacFspIPEgDNFCPdYbuwLQO0ky1Nd9wz5
         iRkOuUXBuDXZfQjJAd3fvcJv+QcId2XwrKyjGVlIdiOHyP/uhkjLeyggcCpxrvzfEr5z
         k9sJm2px33rl3fidxGC0vfORxhXoCX7gYg/3lqTFqIB0xvAwCrfFP/DZlsQ3Ttaw8aoA
         xlU441KWP0ymqE/Dg7shz2gS39tOadJ7L7p5NAAauN7MOUQEtzyuhGAfsYjPmEwSjgDy
         Ue5w==
X-Gm-Message-State: AOJu0YwwuRSOWnPAfKCA0BnX3kl16X6JmsDR3+hrdsKdR+X5TWDbobVz
	9v2w+0CJQ0kM3fMVD3OdKSChA+ArsJxDrsTmtn3V9F6WSkwWty0eoAvVvC8IZpF7z7nprHvQg5w
	=
X-Gm-Gg: ASbGncvtTvfc8uBfRCJwofu7BaWF7DMoDc2wXXpFzyxvyZki3fWxFcmGKwcvjQXFUFG
	Quh+5AnlKHe6zT3x54js661cTCP30tNGOoUBiq9ulWWV2qKvyk/DWmVORLEI5MhHzhJZMInDE5O
	tdc3Bu6NLGNRaChBfwGzqRZDKy0AnycpS1lJZkCsWrLoR30slgqyRrhefoVgl7HTFGJ7Ny+bsJd
	0SMWyjVvpVnAn8HiTghhF6fQoq+zbjtj1OIILDYyofsJU9XzPDConPqoXF0CnXjHVJi/BTyrEYW
	HPp3x4omU5zEORfjGvLTh+5LP5pOZaWw5TsvanfjCY9YK8SWxXgcH+Bo4du/Q2gzj2D2NB3GAtj
	LuifaFHk=
X-Google-Smtp-Source: AGHT+IGdoH+pQFMHtptuhOpAd7N/nTFkNvYJdnYjLcJC7aYONHPIiJH5gTG34Wa8BNmyFXilFL2tmQ==
X-Received: by 2002:a05:6512:3ba8:b0:545:81b:1510 with SMTP id 2adb3069b0e04-5494c10c90cmr4224591e87.2.1740990674553;
        Mon, 03 Mar 2025 00:31:14 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494f8bdde9sm949266e87.148.2025.03.03.00.31.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:31:13 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54965898051so886134e87.2
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 00:31:13 -0800 (PST)
X-Received: by 2002:a05:6512:3f28:b0:549:3af5:352d with SMTP id
 2adb3069b0e04-5494c32faf7mr5087882e87.35.1740990673050; Mon, 03 Mar 2025
 00:31:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250301222207.GA15528@pendragon.ideasonboard.com>
 <67c3a1e6.050a0220.15f6f9.275d@mx.google.com> <20250302001737.GB18557@pendragon.ideasonboard.com>
In-Reply-To: <20250302001737.GB18557@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 3 Mar 2025 09:31:00 +0100
X-Gmail-Original-Message-ID: <CANiDSCtArdsVs5BBKRVov1N_4pnbaG=uiHKrVgCN9yTmch3q-Q@mail.gmail.com>
X-Gm-Features: AQ5f1JoT5k51g9DZX6VL3gctUCfb9SvgubPmDqE51VEp12r_zDUJbzD4LewHtJM
Message-ID: <CANiDSCtArdsVs5BBKRVov1N_4pnbaG=uiHKrVgCN9yTmch3q-Q@mail.gmail.com>
Subject: Re: [GIT,PULL,FOR,v6.15] uvcvideo improvements
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linuxtv-commits@linuxtv.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Sun, 2 Mar 2025 at 01:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Ricardo, should I drop those patches and wait for a new version, or is
> everybody happy ignoring those warnings ? Some of the warnings look
> reasonable to me, were they ignored, or was the last version of the
> series run through CI ?

I am happy ignoring the changes. All the versions went through CI.

They are just checkpatch warnings, CI will pass.

Regards!



>
> On Sat, Mar 01, 2025 at 04:10:14PM -0800, Patchwork Integration wrote:
> > Dear Laurent Pinchart:
> >
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> >
> > # Test checkpatch:./0001-media-v4l2_ctrl-Add-V4L2_CTRL_TYPE_RECT.patch checkpatch
> > WARNING: Avoid logging continuation uses where feasible
> > #83: FILE: drivers/media/v4l2-core/v4l2-ctrls-core.c:374:
> > +pr_cont("%ux%u@%dx%d",
> >
> > total: 0 errors, 1 warnings, 0 checks, 98 lines checked
> >
> > # Test checkpatch:./0002-media-v4l2-ctrls-add-support-for-V4L2_CTRL_WHICH_MIN.patch checkpatch
> > CHECK: Alignment should match open parenthesis
> > #286: FILE: drivers/media/v4l2-core/v4l2-ctrls-core.c:186:
> > +static void std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> > +    union v4l2_ctrl_ptr ptr)
> >
> > CHECK: Alignment should match open parenthesis
> > #297: FILE: drivers/media/v4l2-core/v4l2-ctrls-core.c:197:
> > +static void std_max_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >      union v4l2_ctrl_ptr ptr)
> >
> > total: 0 errors, 0 warnings, 2 checks, 598 lines checked
> >
> > # Test checkpatch:./0008-media-uvcvideo-Support-any-size-for-mapping-get-set.patch checkpatch
> > CHECK: Alignment should match open parenthesis
> > #282: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1406:
> > +v4l2_ctrl->default_value = uvc_mapping_get_s32(mapping,
> > +UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
> >
> > CHECK: Alignment should match open parenthesis
> > #293: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1440:
> > +v4l2_ctrl->minimum = uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> > +uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> >
> > CHECK: Alignment should match open parenthesis
> > #299: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1444:
> > +v4l2_ctrl->maximum = uvc_mapping_get_s32(mapping, UVC_GET_MAX,
> > +uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> >
> > CHECK: Alignment should match open parenthesis
> > #305: FILE: drivers/media/usb/uvc/uvc_ctrl.c:1448:
> > +v4l2_ctrl->step = uvc_mapping_get_s32(mapping, UVC_GET_RES,
> > +uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> >
> > total: 0 errors, 0 warnings, 4 checks, 332 lines checked
> >
> > # Test checkpatch:./0017-media-uvcvideo-document-UVC-v1.5-ROI.patch checkpatch
> > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > #10:
> > https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/release-R121-15699.B/camera/hal/usb/
> >
> > total: 0 errors, 1 warnings, 0 checks, 73 lines checked
> >
> >
> >
> > Please fix your series, and upload a new version. If you have a patchwork
> > account, do not forget to mark the current series as Superseded.
> >
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/72096058/artifacts/report.htm .
> >
> >
> >
> > Best regards, and Happy Hacking!
> > Media CI robot on behalf of the linux-media community.
> >
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > to this message.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

