Return-Path: <linux-media+bounces-28335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B700A63C6F
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 03:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FAFC3AF2E4
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 02:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3AF1B424A;
	Mon, 17 Mar 2025 02:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCOjgGeg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F11B1A8F68;
	Mon, 17 Mar 2025 02:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180181; cv=none; b=GpxQyLZ90E+3YaY4zNqm8gMd5PFWNgGZl0hLSUZk0yPIwAlXStv3+0/hTCB0jBUV7p1iZNkwABYshUtiuZiQ0tCWs4LkzunTP/SdYiSJXxzunF2Jlhy3IUgVeSvBf/wHivTq2N7lxyybIwSN5MkPkKhKdVSqdJXRIqnJFbfYpAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180181; c=relaxed/simple;
	bh=lAznnt8Ub0g0fJn7VAfYtR0EILvS7z3VrcFUWHbFZPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BvXYw/7mH4GPVkUoIamZpJ1g2+U85hpsNQrV8H5gqW6Mj+BqkdipP7k87SBMgFpqp7vnsDTcDhUlLCkA4voWPeI+MFhUtxZsVnbHeQmC2f8F9bzhsqDUDJyyCjM+gDoFWizOnh3C7i0KazsyIFr+TTWU5bV4DGyS+e/CK8wfq/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCOjgGeg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50527C4CEF2;
	Mon, 17 Mar 2025 02:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180181;
	bh=lAznnt8Ub0g0fJn7VAfYtR0EILvS7z3VrcFUWHbFZPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bCOjgGegN08+3CvIjAYKkn0uGfactgTFFXxQwhTAfaC+Rpt23DsNQAXUxnbcCg7Gf
	 5DWTFTx6UIqkT26Uh/FC9erAg1/Bzmofs3HrRdJ0M+7YrH7QHnt30cfwTXg0CvqIIl
	 UpkwuOd0nbZzso6Nn7J22ap6tWqrSWi5SgaQ3JVP9KDKzrKiCzin5zZGXlSzyGZd1Z
	 rypAh+L4Qonegtz8VcNd4dtGCwuFlHwJ0Ny1s5XVfr7tNa3gUxzDMjQS9BxtG6c/ng
	 h5EKuJ8N9wCGkugfyULA74YYeZxx6gUEvftw9nQTmKPLG3H3PU/iD5tLdjV4DfmI3y
	 oUKM3Ke4KSHGg==
From: Bjorn Andersson <andersson@kernel.org>
To: rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	cros-qcom-dts-watchers@chromium.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/2] media: qcom: camss: Add sc7280 support
Date: Sun, 16 Mar 2025 21:56:00 -0500
Message-ID: <174218015892.1913428.13707146883622182488.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
References: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 09 Feb 2025 04:21:41 +0530, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY,
> CSID, VFE/RDI interfaces in SC7280.
> 
> SC7280 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sc7280: Add support for camss
      commit: d4da3adfc560fcb55578f8564d9f5a972507b118
[2/2] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
      commit: 39e6ca14ace9d138e40ddd42313c2649a6f3e69f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

