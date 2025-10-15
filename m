Return-Path: <linux-media+bounces-44617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB6BDFF47
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 19:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C5D6E4E6A29
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 17:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43ED2FFFBC;
	Wed, 15 Oct 2025 17:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="w4RhXdFT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D2F2F60CB
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 17:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760550850; cv=none; b=rKCu/CHJKl+ezlv+UAHJJun30J6Edu74O8l/rQkzfwA4g9wZgWIuSoiAhVepDvcI+bk6/1qvUNeAmMkpGXApAesSksmaXOK9UtaR0hlPJsJnvedNAcxSRq8aU99VmbSsy3bwvaK+tuWkF1YsP9dtPWGGhOw9igJBKKkxFb1bMbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760550850; c=relaxed/simple;
	bh=RE3vtWpP0QvpNGKTL3HABS89YCYt7BAbRul6Y11WGjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bP9/iNCBM9PPy7TxXaTm8FWQUwae2jwZO1lVdQ1oyCIlDYhFPcgFjVbgQHsS69KxofjoPb98pAl6dIJ1qEhP9HHbFzFtW9AxbsxJP1yMbIqFh1oKJnfvvCj/XFpM/nziVxgkLfw10Gfw227YsOTSrS2XFEPLN0o7UUdO7I6YIIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=w4RhXdFT; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7817c2d90d0so11016297b3.1
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1760550846; x=1761155646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20TjVxuYLuxrPBc8Usx9S2ZXr8G1tQbSoOkIE3uAZcs=;
        b=w4RhXdFT93vwL3rqLycsOknxV2cMywmYm8ZwH4oDWjRnbFnvqB5d1sJB8NC71MZjmu
         BV/F4nGV4ACzNMjwIiiZaMtrAB1hdAy6mUdrqse3KvWq5NKQco+px3pw4ORenKGuqCKr
         oUPSwOWQrtEl7oVTCG1GhvdGd0zzSoQ/ZKLkXCkgjqay8KGrIt52nq2E02BYEsOcrUao
         wUMgChz/PLic9+5XCUIIVyab1BU4lMrkJiRloHpkko95vLiZnCjMGU5eGKEcgwZ6T81Z
         MZhrRAHHi0kjdeuZjyPJSwFyC9h6sH0xZ8VbUQFPm/XgAm/z9al7BasyWCdlfddFPJgR
         FzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760550846; x=1761155646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20TjVxuYLuxrPBc8Usx9S2ZXr8G1tQbSoOkIE3uAZcs=;
        b=wkUO9H2QvbZ5yqS8Uxfdqb0uZswqEXi/3lQoJ+uBh8L629HHMmZ31xJ7MZrKfLI0js
         YYpgMjrwCCpe4ujlwoUcnIJpGcFPoyqpJCsoUCmrsKTQK5JwYvAZ1iZESvPtZ/Y+HuN3
         XCr9ihBP8SsqDysrKg2fGEdLm51ckfKFcrf+ZrkK4XVyjU+L2afEm8EGKYFIFeN6w6+k
         hxfmaHRtfvA/BMwii0TiITmmVzGwvatsL7oE62p/CO2OD5xojjIKeFFLlD++weW3jTGm
         UGavwtimeC1FjlbSQEO7xdlUWHX58p36adV9MQwBGuNfKyN/tB58Leh2wyIr5y87PFNm
         xLIw==
X-Forwarded-Encrypted: i=1; AJvYcCVYyhTyRaY52WByOTGUEl23W+cUMXRGmELVlK0OW/mCcpG4Y+yUJSOHDBUdQHUtPIcRXtxZVrSYC3pVpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp+c7V72VqyfTlY6R9p+DFGS2psUyUMZ3MwPpDXXlYFjvttjS8
	9G/52NcK0+HMOd12iwLNRDfey0YKMjkawlTxXWgf8nYcsScgfvLY5/ZmwkP3bFDsZCB4tCjECwB
	yIRDXVctq3w==
X-Gm-Gg: ASbGncvkYrN/trdK8Ka/6oT2vENOveGQ9ajhGGshX+vE44n9ZiB3vaJRgMRsRc0R1Na
	PFwJKrxkLOToIzivQbrxZHVfF2EhzO+2q9oVyhWd6ANoPFCFsbjKNqwhloLkoVtFRs6k5wmgGRn
	50wLx5ZSWQQEXVHsc91n8Oj8romtl++jfVqJtB+vqgdC3hxipwp4W7mPVAhCbUmWexezVpDigvB
	Lo3J7bm2+kcZwk3vGXy85805awsmtFz2hQ8K+Tw2IgKoNYDvWaneOJg+nKVRLXKsDXWr0vramMx
	k1E3pMUvbTEvzA8vFvPUdXp8sP8eRJJShfc/CmptA1sgZP+gV+sRabX7XvFghMD9PMk2P13huUc
	F1Dpp3QVyUAAeGS/auPgBRfaBKBT6+H5ZxZsWx2oRYYZv32Kul8DqIJh7l06Qid9lU3uzX2xLrv
	h2t9nm01PmjzmrN3s=
X-Google-Smtp-Source: AGHT+IGbQmYipv35FLF1d5tVy4SiBSK5w542M2tREXPvy7EzKi15NHnEq2VeswF1LFhcn4sbZDLKoQ==
X-Received: by 2002:a05:690c:d85:b0:77f:73a1:c346 with SMTP id 00721157ae682-780e1639491mr287838377b3.4.1760550845953;
        Wed, 15 Oct 2025 10:54:05 -0700 (PDT)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com. [74.125.224.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7828ced0c21sm912357b3.3.2025.10.15.10.54.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 10:54:04 -0700 (PDT)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63b710f276fso7294634d50.1
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 10:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsjX75TwoQ3ns9KMU+/qnw7ceidmn3etuffSPIMFLMQ7M9u9vt+yk5809P3pT0qjxYzZ4fVNH0kXHObg==@vger.kernel.org
X-Received: by 2002:a53:d4d1:0:b0:636:1ebd:5692 with SMTP id
 956f58d0204a3-63ccb8e1736mr19417699d50.32.1760550843677; Wed, 15 Oct 2025
 10:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015-ethos-v4-0-81025a3dcbf3@kernel.org>
In-Reply-To: <20251015-ethos-v4-0-81025a3dcbf3@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 15 Oct 2025 19:53:51 +0200
X-Gmail-Original-Message-ID: <CAAObsKCcKsejFju6dxTn6AQ6MdidsxXbfxTxcUXGo_8KabD4GA@mail.gmail.com>
X-Gm-Features: AS18NWATPatMxMDqAM9YqlMk9ayn38myAnVms0LmmVnqJLfravwxby5QSFqTV7A
Message-ID: <CAAObsKCcKsejFju6dxTn6AQ6MdidsxXbfxTxcUXGo_8KabD4GA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] accel: Add Arm Ethos-U NPU
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Oded Gabbay <ogabbay@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
	Daniel Stone <daniel@fooishbar.org>, Frank Li <Frank.li@nxp.com>, 
	Sui Jingfeng <sui.jingfeng@linux.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 7:47=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> The Arm Ethos-U65/85 NPUs are designed for edge AI inference
> applications[0].
>
> The driver works with Mesa Teflon. A merge request for Ethos support is
> here[1]. The UAPI should also be compatible with the downstream (open
> source) driver stack[2] and Vela compiler though that has not been
> implemented.
>
> Testing so far has been on i.MX93 boards with Ethos-U65 and a FVP model
> with Ethos-U85. More work is needed in mesa for handling U85 command
> stream differences, but that doesn't affect the UABI.
>
> A git tree is here[3].
>
> Rob
>
> [0] https://www.arm.com/products/silicon-ip-cpu?families=3Dethos%20npus
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36699/
> [2] https://gitlab.arm.com/artificial-intelligence/ethos-u/
> [3] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v4
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For the series:

Acked-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Regards,

Tomeu


> ---
> Changes in v4:
> - Use bulk clk API
> - Various whitespace fixes mostly due to ethos->ethosu rename
> - Drop error check on dma_set_mask_and_coherent()
> - Drop unnecessary pm_runtime_mark_last_busy() call
> - Move variable declarations out of switch (a riscv/clang build failure)
> - Use lowercase hex in all defines
> - Drop unused ethosu_device.coherent member
> - Add comments on all locks
> - Link to v3: https://lore.kernel.org/r/20250926-ethos-v3-0-6bd24373e4f5@=
kernel.org
>
> Changes in v3:
> - Rework and improve job submit validation
> - Rename ethos to ethosu. There was an Ethos-Nxx that's unrelated.
> - Add missing init for sched_lock mutex
> - Drop some prints to debug level
> - Fix i.MX93 SRAM accesses (AXI config)
> - Add U85 AXI configuration and test on FVP with U85
> - Print the current cmd value on timeout
> - Link to v2: https://lore.kernel.org/r/20250811-ethos-v2-0-a219fc52a95b@=
kernel.org
>
> Changes in v2:
> - Rebase on v6.17-rc1 adapting to scheduler changes
> - scheduler: Drop the reset workqueue. According to the scheduler docs,
>   we don't need it since we have a single h/w queue.
> - scheduler: Rework the timeout handling to continue running if we are
>   making progress. Fixes timeouts on larger jobs.
> - Reset the NPU on resume so it's in a known state
> - Add error handling on clk_get() calls
> - Fix drm_mm splat on module unload. We were missing a put on the
>   cmdstream BO in the scheduler clean-up.
> - Fix 0-day report needing explicit bitfield.h include
> - Link to v1: https://lore.kernel.org/r/20250722-ethos-v1-0-cc1c5a0cbbfb@=
kernel.org
>
> ---
> Rob Herring (Arm) (2):
>       dt-bindings: npu: Add Arm Ethos-U65/U85
>       accel: Add Arm Ethos-U NPU driver
>
>  .../devicetree/bindings/npu/arm,ethos.yaml         |  79 +++
>  MAINTAINERS                                        |   9 +
>  drivers/accel/Kconfig                              |   1 +
>  drivers/accel/Makefile                             |   1 +
>  drivers/accel/ethosu/Kconfig                       |  10 +
>  drivers/accel/ethosu/Makefile                      |   4 +
>  drivers/accel/ethosu/ethosu_device.h               | 190 ++++++
>  drivers/accel/ethosu/ethosu_drv.c                  | 418 ++++++++++++
>  drivers/accel/ethosu/ethosu_drv.h                  |  15 +
>  drivers/accel/ethosu/ethosu_gem.c                  | 710 +++++++++++++++=
++++++
>  drivers/accel/ethosu/ethosu_gem.h                  |  46 ++
>  drivers/accel/ethosu/ethosu_job.c                  | 539 +++++++++++++++=
+
>  drivers/accel/ethosu/ethosu_job.h                  |  41 ++
>  include/uapi/drm/ethosu_accel.h                    | 261 ++++++++
>  14 files changed, 2324 insertions(+)
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20250715-ethos-3fdd39ef6f19
>
> Best regards,
> --
> Rob Herring (Arm) <robh@kernel.org>
>

