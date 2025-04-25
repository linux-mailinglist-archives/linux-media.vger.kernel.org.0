Return-Path: <linux-media+bounces-30983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B2A9BF3B
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC2135A62A5
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 07:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A523E22FE0F;
	Fri, 25 Apr 2025 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8f8/jUX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D203D22E403;
	Fri, 25 Apr 2025 07:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564933; cv=none; b=XvKCR9DCsR8blVaYzqZ9JvsLQnd5VTNmLmMmu6uP6G41mDxjsBwyIDP8X8QJqxitS/pt8TBIZKWdcq18kJ+ZJixH9im88EpC6Htp7q5wx+wKcMtOSSTL4ARGaWIVNRX3r+nAo6Ry79CmNKxvFwiKDcGsd/1IZDznVIAquXOCkvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564933; c=relaxed/simple;
	bh=kNOFI5WhqNxTyAt+ae9h1EydhtfBVsWBxxQFRwNNLdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDQVuVaLge/iZm/0flwvaBwjPVjY8dxE4nVywVPb0EVWRk8VIN3MkkOCs7MwuLNaoG8+qYYHtA9yUHjcV3KaRE46BECcanEFfTl00SUxmOKFuyUi33n3aq5N/QNUhL24f1uiPDpFwiAsojrVXcnZ4j5i0oqbLyHKPYGqtAIwsvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8f8/jUX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0284C4CEE4;
	Fri, 25 Apr 2025 07:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745564932;
	bh=kNOFI5WhqNxTyAt+ae9h1EydhtfBVsWBxxQFRwNNLdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O8f8/jUXRZpnfJssxl8nKcy1GvNJQaccHPuXnRamx+YtU0GdKeC9r0m/Hq/lcriDi
	 HNhBksUG6K9p4QH7vUXJPszWOgi8UdXgykiSPFqxQuviHoehXlJmciDfXz4SPs5oeX
	 kNdl8XwkVyLVeRu95l2a0R96+afML7mRiRZBMhD2/pUFZxKXr3gGcj/9NmiLwwc+u/
	 zXl736+DLpEV5lY7bcfiqi6miPKcfd2SlKjKnFe4sd/Y1n5Vz9PBZqBPzx/4x4Mdn3
	 PrclqRlGSytvDHAbqCGPonrmdHUtDk9gnVsfl7RZ89ABzYi1pLCb80HsrBtTeUq8IB
	 LvBW61HlGv5CA==
Date: Fri, 25 Apr 2025 09:08:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: media: qcom,sm8550-iris: document
 QCS8300 IRIS accelerator
Message-ID: <20250425-charming-cheetah-of-gaiety-3dedf4@kuoka>
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
 <20250424-qcs8300_iris-v5-1-f118f505c300@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424-qcs8300_iris-v5-1-f118f505c300@quicinc.com>

On Thu, Apr 24, 2025 at 02:20:45PM GMT, Vikash Garodia wrote:
> Document the IRIS video decoder/encoder accelerator found in the QCS8300
> platform. It belongs to same iris v3 family as that of SM8550 but is a
> downscaled version of SM8550. It has 2 frame processing hardware blocks
> while SM8550 has 4. Thereby QCS8300 have fewer capabilities than those
> of SM8550.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


