Return-Path: <linux-media+bounces-49924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4EECF413A
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 15:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4294300749D
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 14:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44DF26A09B;
	Mon,  5 Jan 2026 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUb5V8Nq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59603315D47;
	Mon,  5 Jan 2026 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622114; cv=none; b=Ww87qqTkIgpdEDmYIq8fSgJU/yQ7qhxdSBCAhNcHmzMB2mtMQVO850O/uzVIMyOIxxrGeV2ibfSsDCfhXY3xt1pBMuQ1EkR0IE/AM79OShbU7s/VbfFW2w6FLJnl/GehDY317KS1NjXh+sa7CHr2vIjf1IdnzMVbCvk4hloCSf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622114; c=relaxed/simple;
	bh=lhRqkJCiNXB/Z5CTm0DjouaCzn5YbbAFUtBaa7SbiDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFGWg+w2GKXUUWhmvu106z9x9fK4nBU2abc76qq4+CySYvzIS11oLyxO6+NWFk2Q+8KgdQJFxQl0W4/0kLVOCK1onGOeDaVReBIEqJHSUxSNRhCl2yAcdrKVhOyDcOSjjUlw/PxVGEvdPl6a4rEyMXM29mjwmbw0+uIQp9G13D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUb5V8Nq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38600C2BCB3;
	Mon,  5 Jan 2026 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622113;
	bh=lhRqkJCiNXB/Z5CTm0DjouaCzn5YbbAFUtBaa7SbiDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bUb5V8Nq+E7wDEUQSZnxy0EkhZUz6L4b7PrbHKAE1K8RHbT3yRXt1WYNIcHpRlTDf
	 9kzCmAWZWTqL/8x3+doFRK8ZevmNuE2YQg3hhYoW+/QEu6wqs6pCUvm+l99MGyE+mQ
	 qlKioxCtyOQxZYOqf25XFhsjufqa1dYtCIF2FMGU9k8mN9fK7zDebkQjFjOdf9yZoD
	 jqIdA1979GgdHwkSKOXmP941pzu7Av9YQcrzCYGOY5jDO7F2LjZ2lsUBrB0FRgl9tY
	 FDoMy+Id56EWGR/PkZgWCh2nxwaWmcaOs+O5OuzXCyEDKXrukKoI1uuPgHSUeSDoMG
	 KvxZnRArgsscA==
From: Bjorn Andersson <andersson@kernel.org>
To: bryan.odonoghue@linaro.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	cros-qcom-dts-watchers@chromium.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org,
	quic_svankada@quicinc.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_nihalkum@quicinc.com
Subject: Re: (subset) [PATCH v6 0/2] qcom: qcs8300: Add qcs8300 camss support
Date: Mon,  5 Jan 2026 08:07:36 -0600
Message-ID: <176762206420.2923194.7249195555946524673.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251107162521.511536-1-quic_vikramsa@quicinc.com>
References: <20251107162521.511536-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 07 Nov 2025 21:55:19 +0530, Vikram Sharma wrote:
> QCS8300 is a Qualcomm SoC. This series adds bindings and devicetree
> and driver changes to bring up CSIPHY, TPG, CSID, VFE/RDI interfaces
> in QCS8300.
> 
> QCS8300 provides
> - 2 x VFE, 3 RDI per VFE
> - 5 x VFE Lite, 6 RDI per VFE
> - 2 x CSID
> - 5 x CSID Lite
> - 3 x TPG
> - 3 x CSIPHY
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: qcs8300: Add support for camss
      commit: ec593a86dfa1bbb5ef02165711f7ed8bb1046e29

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

