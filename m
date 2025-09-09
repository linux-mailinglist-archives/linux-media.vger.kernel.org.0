Return-Path: <linux-media+bounces-42128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4CEB5036D
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 18:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20CAA1C6698F
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E730362090;
	Tue,  9 Sep 2025 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjs/xV6G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943735E4E7;
	Tue,  9 Sep 2025 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437006; cv=none; b=gs12KDEUyHo0Vsgm+8yHU0PXAuhvD6h+xEnfp3foYiN2/7PhtVprmvty1+LQyajcxO5RQxY0oWCsSpEshlUA45+lVEaBWwCJgjDnecME6UwKmGt2dGcvZl9iDCxu/3JU6offV2iRcbAEI2A6I6cPtcq9mhC6pMe2CqC8lsIp05Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437006; c=relaxed/simple;
	bh=RiKOVFGpK1szfWEAtc7JbhdCdxn05Y3EsK1eMenFX2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mUikxN8Xog/lGUgyJnLPgiwy1Oa1EMPF603jPPd3dxgjSsmscOv0U9cwoWbP+o/ngKzqgPdfQiryUsqkTM0QPgAvLSbGYchVhvjdBFVpoS+KgjHJjeabc7xcvDavjnFNq6CK72oRoyumgC8PAbaXzZnmIxJ6v6lwWRlHD5vzjg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjs/xV6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084D9C4CEF9;
	Tue,  9 Sep 2025 16:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437005;
	bh=RiKOVFGpK1szfWEAtc7JbhdCdxn05Y3EsK1eMenFX2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cjs/xV6G6lX45VZaokOrrb7EpYoAi7FuMKEAMrQNfaGm40vnyYkFt+q+zhhKYSTRu
	 u2woFL4A3V2Cvh1VOdzcJNl32uo/UgHlz9REfhft04/kmpq2uaZpuEfbRAgefi3DBw
	 nyYkaMtiplAVeI0RTIieGTR/iFCF7Ly96yDItiour2BDwGsXg/8vUklwRu0z2fhBD5
	 AY7oidfIPaF9APt7zabfSDanXzYwX1q2VBq+1K5OTw5pNIGYbbZ0gOsFjtDQfoFshz
	 ELPQ/vQC3TcewTNsGYvUPNaQq+RLmXhMXoy9gaOXvEHMhHbcUO5eZC/WKimBEQPrPQ
	 ShU/FCdCYkVXw==
From: Bjorn Andersson <andersson@kernel.org>
To: quic_vgarodia@quicinc.com,
	quic_dikshita@quicinc.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v10 0/8] media: venus: Add QCM2290 support with AR50_LITE core
Date: Tue,  9 Sep 2025 11:56:33 -0500
Message-ID: <175743699534.2735486.2572380919626505786.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
References: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 Aug 2025 10:52:40 +0200, Jorge Ramirez-Ortiz wrote:
> Changes since v9:
>   v9: https://lore.kernel.org/all/20250808085300.1403570-2-jorge.ramirez@oss.qualcomm.com/#r
> 
> - Note: rebased and tested on RB1 using media-commmiters/next:
>   078f1a7eb48e ("media: staging: Rename second ioctl  handlers argument to 'void *priv'")
> - patch 2/8: media: venus: Define minimum valid firmware version
>   core_init only synchronizes on sys_init response. If the firmware version needs to be validated
>   initialization should complete on version retrieved instead (also removed reviewed-by from the
>   previous patch).
> - patch 3/8: Add framework to support for AR50 LITE video core
>   - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> - patch 4/8: HFI platform V4 capabilities
>   - Reviewed by Dikshita Agarwal <quic_dikshita@quicinc.com>
> - patch 5/8: Sort dt_match alphabetically
>   - Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>   - Reviewed by Dikshita Agarwal <quic_dikshita@quicinc.com>
> - patch 8/8: Enable Venus on 2210 RB1 board
>   - Reviewed by Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> [...]

Applied, thanks!

[7/8] arm64: dts: qcom: qcm2290: Add Venus video node
      commit: 7a37bf31e3a736d86c3c801ec2116fde4fb395ce
[8/8] arm64: dts: qcom: qrb2210-rb1: Enable Venus
      commit: 9a45e985d4e8dae4226af5a8eddea4c48c62e2ea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

