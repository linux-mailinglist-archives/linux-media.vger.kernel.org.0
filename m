Return-Path: <linux-media+bounces-42957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CE3B92513
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 18:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 084D62A662E
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 16:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D94311C38;
	Mon, 22 Sep 2025 16:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZumRcMh8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434C31195A;
	Mon, 22 Sep 2025 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758560089; cv=none; b=Cr9PbVLF9oci+NeHrJP5ZSqYH5/tiWx2r2yKYrtTtbLlImJ0iATod96493i+xwjCdiod9MP7hiHR8tpDCmtZOtiVpAg73f5U9qsHbb4qsiBS4qwmk1w+YoCivfDvOrbz6+1Zj/A3Jize8ooKJWkOAK6XjsRcfZMY6v88PAJH8lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758560089; c=relaxed/simple;
	bh=ymMmzTp4EnxrYkm69r1TPDGsncG3tXK6gHua10vVyNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mN+xl4F9gc35RRY9xVzTbcc2ztCDuqF5+428GemfDrlUrYTUoWWMhVs+mKUjSzkFtdfjKeK0qJUgraLf+263371E0ZNE3wntPJVjlQPRKNAM3UVf7OXi+ADOYAQ5PQwzvWXNiiZZtKA4pv7EuLn4qkaiOloP9jhxflXyoDIJHCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZumRcMh8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F61C4CEF0;
	Mon, 22 Sep 2025 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758560089;
	bh=ymMmzTp4EnxrYkm69r1TPDGsncG3tXK6gHua10vVyNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZumRcMh8jm0KqGBSZyCF42mMASpEBcfAlsxnbT1a5Cw5HjxL29txLT6wRycCpy58/
	 xCfoNVjWsQFAjYPXIQ/ZKudI3gEYpRPNGqql1MP4dJ6bWxv2B2nyMrPLcO8VZqsQpx
	 Nr+GPl6F2D1FXZ7p8fI9V6EmIXws+SJm7U5npCZKflv7cQcodcw6Hs5Mf5sVA786f7
	 eVo0OlN3PEPh+4/dCBS5Z6+ZYaHpossPyHAm+QPB+pt7VrRUtE0jzxkb4SjfVpplVm
	 5qX81wdLsEPALK1Kxip+zVgsC1KdVfeYX2sWh615p8TRTSyZWeWCUZfERYi8ysLYmN
	 68IZ8ShEarFXg==
Date: Mon, 22 Sep 2025 11:54:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, krzk+dt@kernel.org,
	andersson@kernel.org, vladimir.zapolskiy@linaro.org,
	cros-qcom-dts-watchers@chromium.org, quic_nihalkum@quicinc.com,
	will@kernel.org, linux-kernel@vger.kernel.org,
	hverkuil-cisco@xs4all.nl, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, konradybcio@kernel.org,
	bryan.odonoghue@linaro.org, catalin.marinas@arm.com,
	quic_svankada@quicinc.com, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
Message-ID: <175856008717.464887.16008377245653350497.robh@kernel.org>
References: <20250917130647.1701883-1-quic_vikramsa@quicinc.com>
 <20250917130647.1701883-2-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917130647.1701883-2-quic_vikramsa@quicinc.com>


On Wed, 17 Sep 2025 18:36:45 +0530, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> The three instances of CCI found on the QCS8300 are functionally the same
> as on a number of existing Qualcomm SoCs.
> 
> Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
> common fallback.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


