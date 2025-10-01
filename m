Return-Path: <linux-media+bounces-43460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A0BAFD61
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 11:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 308B77AB903
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 09:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25F027D771;
	Wed,  1 Oct 2025 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZxnQ0Qn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292252652AC
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759310256; cv=none; b=k0AGJ1FsucDovFnf8uwkCzs4FpssFJsRAiWhkeOFwTVMUKcgMGNnffNUeoQshUzH/CQrFa6/+2HPZVcmY+nzhbte2hXtnqW26I07iMe/GLW+TSOqq26trVRHb50lsWM7Qa6VpzYgANpYCe1X4JOB2n3QzO8mSv0quOMUZ7rHm2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759310256; c=relaxed/simple;
	bh=W/CRBjamX3DO//BIUDk+HsrPJkg29i1xnBRtFd0/1xw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=j5Gw8200XzLTJYGSZkjElCTV+bu+fn3j6ubhAgVCnotUGREOWs3JLheg3FKYcobuhm5KEX3Z4gP8LaNSzEVAqh7nvliK3aKOKEc79hpO1IEpyZZrVgqUm5Z88Jt06AnLk8WfuWa+PgUOFBF4NuWkJaDn7UutIHB9RdLug8gXsCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZxnQ0Qn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2EDC4CEF4;
	Wed,  1 Oct 2025 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759310255;
	bh=W/CRBjamX3DO//BIUDk+HsrPJkg29i1xnBRtFd0/1xw=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=tZxnQ0Qn0wO95PaS6ZznBOImBA36noYRi2I0TBauLsBrPrmGNpg2CjS0nQCYSxi3g
	 GmDbV0nNK4FMnUQA2YLWT3Pdpnk3o2bqsl41ZtgMMDFq6P/j4q1UtKLVfh1rDcuOgr
	 WlZmbHrSI5Yh26BI8ecPk8CvtMVJAPlGWsbhn7RatKQkDMh7AE7ld2a3P+OcTPt0OL
	 3SCTBVCn27tR791esNIvfKNsp/gQi7yUHnVtS8v4rA/92Z7zAGLjVMvYo4NUDUX70i
	 R9tPFDfhLTd+jPPwXcbuwZpGFAbEm8pFKjsFBVgUMfB5V6F0FxH67d4prgbcO5guQ9
	 vTCh6F4Kp/uCQ==
Message-ID: <f5a942fd-478c-4a5d-bf68-d53191d543f5@kernel.org>
Date: Wed, 1 Oct 2025 11:17:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 0/3] v4l2-ctl/rds-ctl: support optional ioctl and migrate
 some code to it
To: Quentin Schulz <foss+kernel@0leil.net>, linux-media@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
Content-Language: en-US, nl
In-Reply-To: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2025 14:19, Quentin Schulz wrote:
> Some ioctls are optional and the logic around it handle it nicely,
> except that doioctl (via doioctl_name) sets app_result static variable
> to -1 if the ioctl fails.
> 
> However, both rds-ctl and v4l2-ctl exit code is from app_result. So it
> is possible to have those tools perform the expected task (albeit
> failing to use an optional ioctl) and still report to the user that it
> failed to do so.
> 
> Let's add a new function doioctl_opt which allows to NOT set the
> app_result variable when the ioctl fails.
> 
> This migrates two ioctl VIDIOC_SUBDEV_S_CLIENT_CAP and
> VIDIOC_SUBDEV_QUERYCAP to be optional ioctls.

Actually, those ioctls must be present, unless you run an old kernel, but
they've been around since kernel 6.4.

I'm dropping this series as this isn't quite the way to do this.

Perhaps you should explain the problem you encounter first (and mention
the kernel version you are using)?

Regards,

	Hans

> 
> Note:
>  - rds-ctl receives the same patch but doesn't make use of it, simply
>    for consistency, but can be dropped if desired,
>  - wondering if VIDIOC_SUBDEV_QUERYCAP really is optional considering
>    the code in v4l2-compliance/v4l2-test-subdevs:
>    fail_on_test(doioctl(node, VIDIOC_SUBDEV_QUERYCAP, &caps));
>    which also has a nice comment above saying "// Must always be there"
>  - wondering if there aren't more optional ioctl considering how many
>    doioctl calls aren't actually exiting early the tools,
>    Should we add something like __attribute__ ((warn_unused_result))
>    so we know for sure doioctl shouldn't be used if we don't check its
>    result, though that wouldn't catch if(do_ioctl(...)) for optional
>    ioctls like VIDIOC_SUBDEV_S_CLIENT_CAP here for example,
>  - I assume we may want to backport those to stable branches? (e.g.
>    Debian Trixie is using 1.30.1 and I experienced this bug with that
>    package version)
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Quentin Schulz (3):
>       v4l2-ctl/rds-ctl: do not set app_result if an ioctl is optional
>       v4l2-ctl: do not fail on kernel not implementing VIDIOC_SUBDEV_S_CLIENT_CAP
>       v4l2-ctl: do not fail on kernel not implementing VIDIOC_SUBDEV_QUERYCAP
> 
>  utils/rds-ctl/rds-ctl.cpp   | 7 ++++---
>  utils/v4l2-ctl/v4l2-ctl.cpp | 8 ++++----
>  utils/v4l2-ctl/v4l2-ctl.h   | 5 +++--
>  3 files changed, 11 insertions(+), 9 deletions(-)
> ---
> base-commit: fc46fc8771bff905204e7463ab03ed1f355436b1
> change-id: 20250905-opt-ioctl-387192021068
> 
> Best regards,


