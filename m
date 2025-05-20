Return-Path: <linux-media+bounces-32939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A93ABDF58
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 17:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE4C3A97A5
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A0B2609FC;
	Tue, 20 May 2025 15:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t27D2+vi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16A92571D7;
	Tue, 20 May 2025 15:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755717; cv=none; b=S7RzSdtTyD9TmWNL0WQmGEtJ/i8OU+XJu3hQ3DJXNyZ6/HgE/WYdackFFH3Rv2j+lGakBlCWGn6hngskAnVK+jccBoT2TqEdWbX5oM1amiZphy/c4kD6TQvNtdWYUuIRWHE6eYHjctbB4eNGuHYdcfc0gEcSEcQUdkXlCB3kd3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755717; c=relaxed/simple;
	bh=iM0kAw4/nWyGDWNAeRKHD+BaGigBrgJDfwS7US+j1/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cwOfSrLaABz4gvlfvcSd/qxLdBArXtwkc9iZvrmGNAaWoW5R/hIBWUJVY+km+4n4R3foK3a1mR3W5/vMtWxlOSh6Jqum4C2Az52TqzEp+FK32MWx/MaVtFhIeHv7PjM5R80brQ64XlMOJCOPHQw8Ez9QJEsHsNLPnMwWCNy86Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t27D2+vi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28519C4CEE9;
	Tue, 20 May 2025 15:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755717;
	bh=iM0kAw4/nWyGDWNAeRKHD+BaGigBrgJDfwS7US+j1/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t27D2+viqHtztdjdMHjpCAUF8Lu+Bh7vLVPgZNSS1odAFu1XXczgWH7kHbfpaBEGr
	 HEgBUnBfyhAlQkRsvW0C1tYawmvIA2hhoWpcy/PRroqBUwvn/C+VhepxJ5F3DgVnk7
	 1ZgMlfNhmBf5urqytVfLAomqHfodvYUYiRraCDn+hSn2x4zPupzSmDhaAXxKomruqa
	 bI/OVbbtIx/+vBz5qyGqCRXiZmCcGflHovDOa/EhQt+4pZ1p8jYO/qh2UHJe8qMBk7
	 mIG95JCsWo4nvdkFHHIHx9aLAvsD2D+vH5hbprSknGWT0DJ1oCdco1SCgGuSqjDRbz
	 kdqVr+fGe9V7w==
From: Will Deacon <will@kernel.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Christopher Snowhill <chris@kode54.net>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	iommu@lists.linux.dev,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Jun Nie <jun.nie@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 00/40] drm/msm: sparse / "VM_BIND" support
Date: Tue, 20 May 2025 16:41:47 +0100
Message-Id: <174774086363.2165484.11245120942986308301.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 19 May 2025 10:51:23 -0700, Rob Clark wrote:
> Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
> Memory[2] in the form of:
> 
> 1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
>    MAP_NULL/UNMAP commands
> 
> 2. A new VM_BIND ioctl to allow submitting batches of one or more
>    MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue
> 
> [...]

Applied io-pgtable change to iommu (arm/smmu/updates), thanks!

[05/40] iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()
        https://git.kernel.org/iommu/c/3318f7b5cefb

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

