Return-Path: <linux-media+bounces-25256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34044A1B16C
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 09:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17BDA1886F6D
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 08:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B1B205E23;
	Fri, 24 Jan 2025 08:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBEEXYtF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA5C205AD2;
	Fri, 24 Jan 2025 08:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737706237; cv=none; b=a5njUqTbqUGYEnMsTmMxUcDvm7neRZokO9/nTfPTZUBceqbupUn6ShIx4vcu8sKoKMiJPhPAdKaLObgIX9sEDB87IEKRhrVdeEHYj0N3J0m+K++vk3xvJi3GFZZT9RTrMQvJZCgBfXeb25pYl7+esFhu5YmO/RHthKglXOUfaDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737706237; c=relaxed/simple;
	bh=5/s9gWaTZKbMFZoIoQ7KLfhqbFshe8YqcBEHwCpr/IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUBvQzS3fSut2/fNCD2SdcgTnBzhfwbQriYzUjvLlfAi2EeMNfUFsn4xeUoN6/oKxgFNoCelwWEJZrFpTofaqRd0ZDUBSg/XbZA0JMu2p11jyYkzEh6oNHNPDXUQFeYtjqDUpu2y1Txp5ZQYe9vp+nSw7YiIE7zYqZcW6o8RtDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBEEXYtF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFC6C4CEE2;
	Fri, 24 Jan 2025 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737706236;
	bh=5/s9gWaTZKbMFZoIoQ7KLfhqbFshe8YqcBEHwCpr/IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBEEXYtF92FvxyOXkggIvGkGgY3f0YCptxfceXN84Me+B44IV8zoqvVdCA7Gbg8NJ
	 X29+mK5FhpgkOqvVuUmP4yaH94gKUtjLJrCMgTcyYEMAq0yUEuaALx79OXfv6CMZ6Y
	 9stp7McnMrRxq/GMPnigRgXXKs7zizbhRapvQEL+2fnemWqYeT4H/DCrKKb5kKWaS1
	 VVGg2lezuhJfeZcytuxo31ph9OUJWdnlCQ+e6AD4BnVE76gJ0gpugSh9a5sZg1yKD7
	 oEsvQO12hkMel8LfZO3zNcKhDntRktIrPdvgquLNhZXoCSC7LVwGIhOTTA1coXR5FE
	 gbhJ4qFSq25jg==
Date: Fri, 24 Jan 2025 09:10:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v2 1/2] media: dt-bindings: update clocks for sc7280-camss
Message-ID: <20250124-raspberry-aardwark-of-downpour-fc12cc@krzk-bin>
References: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
 <20250121180746.1989996-2-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121180746.1989996-2-quic_vikramsa@quicinc.com>

On Tue, Jan 21, 2025 at 11:37:45PM +0530, Vikram Sharma wrote:
> Update clock names to make them consistent with existing platform i.e
> qcom,sc8280xp-camss.yaml. Rename gcc_cam_hf_axi to gcc_axi_hf and add
> gcc_axi_sf.
> 
> gcc_camera_ahb is always on and we don't need to enable it explicitly.
> gcc_axi_sf is added to avoid unexpected hardware behaviour.
> 
> This change will not break ABI because the ABI hasn't been cemented yet as
> the dtsi changes are not merged yet and there are no users for this driver
> as of now.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../devicetree/bindings/media/qcom,sc7280-camss.yaml   | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


