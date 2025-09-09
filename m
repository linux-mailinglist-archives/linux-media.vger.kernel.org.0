Return-Path: <linux-media+bounces-42129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2DB5037F
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 18:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A1A11C66CD3
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51DA369993;
	Tue,  9 Sep 2025 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCdP9Kak"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A738369346;
	Tue,  9 Sep 2025 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437010; cv=none; b=QdJwxhcRTEnqehg7JTmLH++MMNRM3W1zAD6sprG3M/DaUsEz4mjnI5svA+bCyX4rPwWeEtGWvHFyj727+SJqYghMqsdMmmj+Iw2+tJ+SAq8NM3BQ6KUsA2a/oqLoNVPDDdbAlPyNhJzqmtarnWqEragJRYIvGT4q8dfSpDTQMfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437010; c=relaxed/simple;
	bh=RVC8K+1UTX6tq5vAq/+QD3dWzgRhJmE39XDNPx9/a5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4Q5WeXZ/nANNH/c3bK0nOUTyM4zFqtQ0dwAW2MZKq/et2ormGbRpeQ8XwfxRXjhxKACVUi2zuYP/09cBSESUZ8+zj5vjuNdyDlzusX6NXmjM7eTL+uRbt6oCXKyUQYUz3xJ4qeeXH0T3L9xRGIiUpVxM8sQWzEzY0naCINvAys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCdP9Kak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42D3C4CEF9;
	Tue,  9 Sep 2025 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437009;
	bh=RVC8K+1UTX6tq5vAq/+QD3dWzgRhJmE39XDNPx9/a5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gCdP9KakabN0En6wppGjLveC14ubP9gteL3ajrf41D9ECr+3fBHml0hv2fTDepJlY
	 l/1/ffCnkQbmt3K4Pbg1Uq7Fa0irjk3WXrJO1X1wlGV70RmiA7YNM7k2TOAHhquu4c
	 mHguv7RCRETUojQ3thKNRGo3VCm/bqyUQu4buHI7It3RLd/Fsgbb05SD/RF2j3UA7g
	 pL0n7Xp/dUXWJZPUZfXWIrLXqyBrUjvkNqBHCGjhrx1h/XCEGPNHVwGWu0qeCst6ih
	 jFnMwLjYQ1sLNXbpQCQTH/CBj+U0W7Gz9nisxV00B7X2phVy8vAG5/mgaQViiGTJtI
	 KALUuoKLlAwgw==
From: Bjorn Andersson <andersson@kernel.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Renjiang Han <quic_renjiang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v6 0/4] media: venus: enable venus on qcs615
Date: Tue,  9 Sep 2025 11:56:37 -0500
Message-ID: <175743699533.2735486.13218200958925195499.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Dec 2024 11:11:52 +0530, Renjiang Han wrote:
> QCS615 uses the same video core as SC7180, so reuse the same resource
> data of SC7180 for QCS615 to enable video functionality.
> 
> There are no resources for the video-decoder and video-encoder nodes
> in the device tree, so remove these two nodes from the device tree. In
> addition, to ensure that the video codec functions properly, use [3]
> to add encoder and decoder node entries in the venus driver.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: qcs615: add venus node to devicetree
      (no commit info)
[4/4] arm64: dts: qcom: qcs615-ride: enable venus node to initialize video codec
      commit: cafb56f78a04c90b41109d077a1b8aef2736980b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

