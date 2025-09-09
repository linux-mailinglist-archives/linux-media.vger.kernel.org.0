Return-Path: <linux-media+bounces-42108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CBB4C238
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 693764E1FBE
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 12:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E70C31CA7D;
	Tue,  9 Sep 2025 12:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rhf6baJQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B992BEC28
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 12:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419679; cv=none; b=EdAOSAByL+RJnQvZoVfTjHIz2uoXJ6Y99W0BhQTgJ4Q6baEp25VDpTddOEOUE/6ka3drB21aw5Jzm1wdLnkQSZKfRkLcUvjGz3CSz6id+rl/3CiPukJdmggwolDbbhqpvlcDjljfOR2wRVUGdzUS7esGUQZEOegeuL2dLreOiyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419679; c=relaxed/simple;
	bh=0FrK4FamD8TNwIF1I4qhlGMcoTe60qDFY2il0kn/vyo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SJ8/S9q97sKHJ/cu7ceFVjyoqS33Ecf3L9rmtrlsWU3Kd0sUp9p4YTd1H9FJqC0PO2994BkHAsqfv2UvAeWbTLUouTnURdQ4t3qM/r/DL9ThapLoXbVirgZIsToSM1l2RW0gXOTZNH5URwlsh5sJ5Wl+Q1rkIjcAHqZWrWNTUrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rhf6baJQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC7CC4CEF4;
	Tue,  9 Sep 2025 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757419679;
	bh=0FrK4FamD8TNwIF1I4qhlGMcoTe60qDFY2il0kn/vyo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Rhf6baJQBXCrD4Hx5BJCyyy4CwEo8/7Uy4pvYZxNhZdR54mNfV8V2AIaX7wkwWywc
	 10ysD6IVvFIa94DDkpCrtOW0MnvfQvBmVHhY3/fnd6Ndw7oiHatms4M93Nsi1UAnvx
	 XcbXfe+9Rjxlt0kbyDV2o8ZuyyKNUbylV5+JJKQFWATkZN64F/O7jIfoFaoTzH6w0g
	 tE6YNUHPD5HOvtfMNj6ffpYmRXWTbNJJ9RTSaB/GnQEbmN4IkIvmdf18jUADl1cG6h
	 MKWZ5PCRd6CXTmmbbk7dH3k3HCxtjHi83vDxeCsu9c/1LCd4JMlfBfphaUnl7pCELr
	 ue3pJqeHrz7hQ==
Message-ID: <951b925e-3d0f-4016-a45e-e1b4ccf5f3fc@kernel.org>
Date: Tue, 9 Sep 2025 14:07:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT PULL FOR 6.18] Please pull
 platform-qcom-iris-encoder-plus-dependent-fixes-for-6.18-v2
To: bod@kernel.org, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org
References: <20250909094256.40537-1-bod@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20250909094256.40537-1-bod@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2025 11:42, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bod@kernel.org>
> 
> The following changes since commit dcd2ca10faaf59fedcafffc6bbf41ba628a23cc4:
> 
>   media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper (2025-09-08 20:32:43 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-iris-encoder-plus-dependent-fixes-for-6.18-v2
> 
> for you to fetch changes up to 105d6bc8583498dee6b8c665143a8d8eef135610:
> 
>   media: iris: add VPU33 specific encoding buffer calculation (2025-09-09 09:59:37 +0100)
> 
> ----------------------------------------------------------------
> This tag contains:
> 
> - A number of Fixes:
> - An set of patches to enable the encoder which depend
>   on the Fixes: in this PR to apply cleanly
> - A power-sequencing update from Neil which also depends
>   on code in this tag
> - v2 missed inclusion of "Fix buffer count reporting.."
>   from Dikshita - fixed in v2.
> 
> platform-qcom-iris-generic-fixes-updates-for-6.18-v2 should be
> merged first.

This fails to compile since this patch is now merged:

https://patchwork.linuxtv.org/project/linux-media/patch/20250902-sm8750-iris-v3-3-564488b412d2@linaro.org/

"media: iris: Add platform-specific capabilities for encoder video device"
doesn't take support for SM8750 (added by that patch) into account.

I marked this PR as "Changes Requested".

Bryan, if the changes are trivial (I suspect that's likely to be the case),
then just adjust the patch and post a new PR.

Regards,

	Hans

> 
> ----------------------------------------------------------------
> Dikshita Agarwal (26):
>       media: iris: Fix buffer count reporting in internal buffer check
>       media: iris: Report unreleased PERSIST buffers on session close
>       media: iris: Fix memory leak by freeing untracked persist buffer
>       media: iris: Fix port streaming handling
>       media: iris: Allow substate transition to load resources during output streaming
>       media: iris: Always destroy internal buffers on firmware release response
>       media: iris: Update vbuf flags before v4l2_m2m_buf_done
>       media: iris: Simplify session stop logic by relying on vb2 checks
>       media: iris: Allow stop on firmware only if start was issued.
>       media: iris: Send dummy buffer address for all codecs during drain
>       media: iris: Fix missing LAST flag handling during drain
>       media: iris: Fix format check for CAPTURE plane in try_fmt
>       media: iris: Add support for video encoder device
>       media: iris: Initialize and deinitialize encoder instance structure
>       media: iris: Add support for ENUM_FMT, S/G/TRY_FMT encoder
>       media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder
>       media: iris: Add support for VIDIOC_QUERYCAP for encoder video device
>       media: iris: Add encoder support for V4L2 event subscription
>       media: iris: Add support for G/S_SELECTION for encoder video device
>       media: iris: Add support for G/S_PARM for encoder video device
>       media: iris: Add platform-specific capabilities for encoder video device
>       media: iris: Add V4L2 streaming support for encoder video device
>       media: iris: Set platform capabilities to firmware for encoder video device
>       media: iris: Allocate and queue internal buffers for encoder video device
>       media: iris: Add support for buffer management ioctls for encoder device
>       media: iris: Add support for drain sequence in encoder video device
> 
> Neil Armstrong (1):
>       media: iris: add VPU33 specific encoding buffer calculation
> 
>  drivers/media/platform/qcom/iris/Makefile          |   5 +-
>  drivers/media/platform/qcom/iris/iris_buffer.c     | 222 ++++-
>  drivers/media/platform/qcom/iris/iris_buffer.h     |   7 +-
>  drivers/media/platform/qcom/iris/iris_common.c     | 232 ++++++
>  drivers/media/platform/qcom/iris/iris_common.h     |  18 +
>  drivers/media/platform/qcom/iris/iris_core.h       |  20 +-
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 675 ++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 +
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +-
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 482 ++++++++---
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 112 ++-
>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  60 +-
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 359 +++++---
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  44 +-
>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  46 +-
>  drivers/media/platform/qcom/iris/iris_instance.h   |  24 +
>  .../platform/qcom/iris/iris_platform_common.h      |  76 +-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 526 +++++++++++-
>  .../platform/qcom/iris/iris_platform_qcs8300.h     | 352 +++++++-
>  .../platform/qcom/iris/iris_platform_sm8250.c      | 236 +++++-
>  drivers/media/platform/qcom/iris/iris_probe.c      |  33 +-
>  drivers/media/platform/qcom/iris/iris_state.c      |   9 +-
>  drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>  drivers/media/platform/qcom/iris/iris_utils.c      |  36 +
>  drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  58 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       | 251 +-----
>  drivers/media/platform/qcom/iris/iris_vdec.h       |  13 +-
>  drivers/media/platform/qcom/iris/iris_venc.c       | 579 +++++++++++++
>  drivers/media/platform/qcom/iris/iris_venc.h       |  27 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       | 299 ++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 922 ++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  24 +-
>  33 files changed, 5051 insertions(+), 716 deletions(-)
>  create mode 100644 drivers/media/platform/qcom/iris/iris_common.c
>  create mode 100644 drivers/media/platform/qcom/iris/iris_common.h
>  create mode 100644 drivers/media/platform/qcom/iris/iris_venc.c
>  create mode 100644 drivers/media/platform/qcom/iris/iris_venc.h
> 


