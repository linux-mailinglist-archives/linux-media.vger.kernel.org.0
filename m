Return-Path: <linux-media+bounces-50743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D903BD223AC
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 04:01:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 953663041CEF
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 03:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6828942049;
	Thu, 15 Jan 2026 03:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csbwfIg0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB827146D53;
	Thu, 15 Jan 2026 03:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768446035; cv=none; b=FVtL7BPAawsXTJTDk42/S4JcMp5jYe2rKBg4/3m6y7AKiePWxxbq19OKw+K5UkMTF/a56pIwBkn3dBo56oqsOgIPtlfYPA1r5CjYalA3bpiK02HWCJqLOSYIRKepwSgSXZpcvyqeq1qnm4V+N9qmGCIRsxMX+xhdwOqwseyO77Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768446035; c=relaxed/simple;
	bh=+GhhQh/xv9b8mB4AbqjJbyQyD0w76D1PrH5aFdc1RTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s2O4w9UJUHlgv8sVtsUCbz9Hi2/BJjWEnP3Qn/WeEzxH6q+O8APXDdzch1G23xe3Tl+fBZQppXJ4Dw0MWfNWMdDoCZ4Qfcnew7pwZWF1QTHApv6BZemcUDbnMm435qxGquLnmMMVWEY9AtQVIYY7QSsOSD2EYMRWGXOfB+VaGaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csbwfIg0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0BFC4CEF7;
	Thu, 15 Jan 2026 03:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768446035;
	bh=+GhhQh/xv9b8mB4AbqjJbyQyD0w76D1PrH5aFdc1RTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=csbwfIg0y2K63uqi/6Lo7542Ohyld0LZxahUWtIhSRKkC0Z1q3I9UvI4ZcDqjxqu8
	 1A9MkvycSfb5tMR2mD/MAQbF/a5PH86yWx9g7/4RsqWwra0E46HJwImVH9G4HIztXN
	 uy+i0D5Q5RIwfYSsDpU2NVqMRqpn4HSOmn70fmZJba2x7mgzyIGXeY9dyLNKJh0dts
	 Tqhxh9dyYgwcBgYH4Nt7LPjBFB87aUjMM8hNNw5cLvjyLvd/hV5FNqkdiTxNCxF/ww
	 OacHQ05Ir+cpnj5y5s8O1gQhakRHjv0SnFIizCF/z2twPGhdQPhWSO4k5MhVDCtpLU
	 UKDr4xXu21RQA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org
Subject: Re: (subset) [PATCH 00/11] media: iris: migrate to using global UBWC config
Date: Wed, 14 Jan 2026 21:00:28 -0600
Message-ID: <176844602411.144544.5791366481076327049.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 10 Jan 2026 21:37:52 +0200, Dmitry Baryshkov wrote:
> Having UBWC configuration in the driver is error prone. For example, the
> driver specifies fixed values for HBB, while the actual value might
> depend on the DDR type. Stop defining UBWC data in the iris driver and
> use the global UBWC configuration registry.
> 
> Merge strategy: either merge SoC bits directly through the media tree
> (with Bjorn's ack) or merge to the media tree through the immutable tag.
> The drm patches will follow depending on the way the SoC patches are
> merged.
> 
> [...]

Applied, thanks!

[01/11] soc: qcom: ubwc: add missing include
        commit: ccef4b2703ff5b0de0b1bda30a0de3026d52eb19

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

