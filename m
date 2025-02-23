Return-Path: <linux-media+bounces-26662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4EAA40E62
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 12:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42FD27A195F
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 11:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF6F205E06;
	Sun, 23 Feb 2025 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmmNrSra"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B442AA9;
	Sun, 23 Feb 2025 11:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740310503; cv=none; b=uL9DlMT+6AYYpJwENlKQ2RjnA2K03ZGcaEsWd5c53/Unw3095tOQqNuZ0diESPU3cvLst0qajpVYSBh5UH7ssGKbyP+WPs3MGPJE0rhQ0dGO+VKtMBM5p31KsRDCDaWyCZGKBE65dWtquqlxcL3XGKk/JiuTWfIN2zIEqEy30m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740310503; c=relaxed/simple;
	bh=SIoCw3QNopW0wdw1Ltz/BztUJr/y8LR6kPoAGjKQVYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hr7VNNTgiYfHViSmceOTbuFPJxUvV/iDu5z/pxljPenb1+CAIYCqFuVBQ4cdPUf7rud8PNzC1D0k1a4kg/03h+Mkuz13+NIAbS4rhq+11cJmrqtYecES2F7bjI42xDwc8NKPeg7OoRmKCZ0YPZZzHnb4wmMXWz0IlcaRgxxwjzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmmNrSra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F312FC4CEDD;
	Sun, 23 Feb 2025 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740310502;
	bh=SIoCw3QNopW0wdw1Ltz/BztUJr/y8LR6kPoAGjKQVYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmmNrSrasm5Sm4kd5CJknE2jyM6izFDAYUFNk2+a52T4XF+nqNiif1VRMnQtJ/EwT
	 mYDP2fYxFGbS0PnBubBzits/RcKgJB4es/LcnyhAiQYTfBhXV0QE7Ze3+3MKql+QXD
	 3GcvqtenvlYCz04kwKd8ToNijOgTxOlOFBAzvIh7zlKiqHKdVcLn6KUZPlmZSpdtSu
	 9QwAjQhPoN5U5XPqws1FL4kUc54tAS1pfIPihsEprYiRlT7mr9hV1NCi/mLhxxPgL3
	 hfUQQdc2a56irEnsXfZwF0PP+8/cgIL84le9SlDETFz2+ExQyvnWtk1X2srUv7UQ9h
	 q51QuR9avbwAA==
Date: Sun, 23 Feb 2025 12:34:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Suresh Vankadara <quic_svankada@quicinc.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs8300: Add support for camss
Message-ID: <20250223-holistic-booby-of-persistence-e51b76@krzk-bin>
References: <20250214094747.2483058-1-quic_vikramsa@quicinc.com>
 <20250214094747.2483058-3-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214094747.2483058-3-quic_vikramsa@quicinc.com>

On Fri, Feb 14, 2025 at 03:17:47PM +0530, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the QCS8300.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++


I don't understand why DTS is combined here with media binding. There is
no driver, so this canno work.

The binding is no for arm-soc, but for media and it always goes with the
driver.

Best regards,
Krzysztof


