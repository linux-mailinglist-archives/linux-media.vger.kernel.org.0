Return-Path: <linux-media+bounces-24636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE77A0A210
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 09:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 820453A970D
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 08:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5925E187342;
	Sat, 11 Jan 2025 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kG7ZjHff"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F6A156678;
	Sat, 11 Jan 2025 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736585687; cv=none; b=EDPPlQbmPI1qXjuq8m0d/nDN1n8K4lEc59t1oTIPLma2Ye7av0H4o7jepjRtb1OiyOeTlS2NYgUy/LkohbdCiT31TSrggTknLUkq73zeC7nm/64H/8YiWPEJbMDUj2oAk0ga1/2WIxVzGM5agvbOatFEdHufiDHgvq1xuIS11ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736585687; c=relaxed/simple;
	bh=Q1leHkeRtCRi+yGc79UFLanzygVMi5/CCQJjiMUYiI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFjNaKTiX0e52hnSTaiBzTOxGIUWiILJ5dKHt0Zbfi0wnaBx8e3b+OsH16/jv/WYYL8K4M680Qtv5tJXXHm1ZyREYc2BC4yEv+k6hG2Hp0xn1dudw7dYkK8oZUrGhj/VJ7p7QK2rqyoPAFD3QSmmzWQ01huo1iFuXzzYmqlBnyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kG7ZjHff; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56169C4CED2;
	Sat, 11 Jan 2025 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736585687;
	bh=Q1leHkeRtCRi+yGc79UFLanzygVMi5/CCQJjiMUYiI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kG7ZjHffva5Z1V4EA5nTcfBjg46GCnSh313uwg97pkLr2orWlunyviLmhkaCsqy1S
	 vJKLm1BEo4LnPHxut7MDF28LTfrNKTqH/4Bo++DVDgw3SvvgeLC36v13EK+WYp8i6T
	 Lx/ROvzeC2eLQqP3mAQxbGyk8F6ewqN5rSSwS+I0A4zGkQLu7ii38TOP5UwML98PVU
	 oFpo3Pmjp1FWJjnwNq+8D3ABrTrlQf+dfiVPpIsmma+DxMFfqwrc9OxrKxDF01c9kW
	 rr0LPM7zoyjRfowCMxDR3OnUHI3nRkCdJeHkx7Os541rdbCaxmjvCEygjVo8B1Zrsa
	 0AvTAzEaeAJLg==
Date: Sat, 11 Jan 2025 09:54:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Depeng Shao <quic_depengs@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	vladimir.zapolskiy@linaro.org, hverkuil@xs4all.nl, quic_eberman@quicinc.com, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
Subject: Re: [PATCH v8 12/16] dt-bindings: media: camss: Add
 qcom,sm8550-camss binding
Message-ID: <4cuarxxr7wlebwrnhjzi7yv7cfoe53i3f72s7jteeo6buxq5et@sbccepsvyf4o>
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
 <20250108143733.2761200-13-quic_depengs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108143733.2761200-13-quic_depengs@quicinc.com>

On Wed, Jan 08, 2025 at 08:07:29PM +0530, Depeng Shao wrote:
> Add bindings for qcom,sm8550-camss in order to support the camera
> subsystem for sm8550.
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>  .../bindings/media/qcom,sm8550-camss.yaml     | 597 ++++++++++++++++++
>  1 file changed, 597 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


