Return-Path: <linux-media+bounces-42632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F30B59E9B
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 19:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0FB5461A06
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 17:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B73B343D73;
	Tue, 16 Sep 2025 16:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5PnQyOr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5331323F71;
	Tue, 16 Sep 2025 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041914; cv=none; b=ZXFV0r3dkSqCgs/G2JhfYYldeeE/i3wRiZJQsoLGBJH1cKSJxuXzhVOLYNzJBO+8B+9ndDScLYNlxnjVlZf9qsblkcRUVI4iVtL33yee6sq1iC7pCmQf+VEpltz+OZ6hsv2quKPqwSsbK9zUsPoGM/jrVBu0/RbF0Vm92yLKqck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041914; c=relaxed/simple;
	bh=n9jFZ8L5DsjRvc5S9GBCejk/BAUuMkiJFJJ3uBsLaxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TmFtGU9J18E+u5y4SLu0h5ZYmjsvvg53KRPx1JFC/KW+id/f48IsXzJI36WHpEoUk8gvB74aXYbG3yPtnUghI1eYQ2yPIAUqgkM5A2Ld3VOLP4OQaa9nJ06G9HE8D0aiYn8gIoto7mj/q8GYX2fO+wAup7iBUYQWLzSMOcMkpPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5PnQyOr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EC5C4CEFF;
	Tue, 16 Sep 2025 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041913;
	bh=n9jFZ8L5DsjRvc5S9GBCejk/BAUuMkiJFJJ3uBsLaxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5PnQyOrz/U7GSYW+Yzil7LUSbRZfJtqXjySaMyUzfspF8eQrY3Ao0ddfJW51V+8c
	 H5mzrCE12CWQ3VDJZLH+nphDv8NUUrEg2AShsPnyzxJEC8L+jyz97tn8vmXVD73Odd
	 ZzjiTM7XzcIUbgwTxunF57jT0TD+0BCCU4DTjHo5TqsV+fA+bl3i2Eby124qSo7Z92
	 WUJqlMLnHa9hgdAq4kwjmaYAfvZ27WQhW3wLC4iuY5BcCQL2sYmaQys7ItBgmOQGHN
	 pEgGvaML/uVs0ytdD4sGGhgx+0y3s6La7tILvglczLi692LCGn5YQRIjvtgos8CKR+
	 lTL82SU+3lEwg==
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
	Hans Verkuil <hverkuil@kernel.org>,
	Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org,
	quic_svankada@quicinc.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/9] Add lemans(sa8775p) camss support
Date: Tue, 16 Sep 2025 11:58:16 -0500
Message-ID: <175804189856.3983789.9613227965968869684.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
References: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 Aug 2025 15:46:06 +0530, Vikram Sharma wrote:
> From: Vikram Sharma <vikramsa@qti.qualcomm.com>
> 
> Lemans is a Qualcomm SoC. Previously referred to as SA8775P. This series adds
> bindings and devicetree to bring up CSIPHY, TPG, CSID, VFE/RDI interfaces
> in Lemans.
> 
> Lemans provides
> - 2 x VFE, 3 RDI per VFE
> - 5 x VFE Lite, 6 RDI per VFE
> - 2 x CSID
> - 5 x CSID Lite
> - 3 x TPG
> - 4 x CSIPHY
> 
> [...]

Applied, thanks!

[9/9] arm64: dts: qcom: lemans: Add support for camss
      commit: a19c879b69b12cc31ed59b50e743a1ef2e5b08b1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

