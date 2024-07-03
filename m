Return-Path: <linux-media+bounces-14565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61064924FCE
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 05:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 185521F21259
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 03:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7ADB134415;
	Wed,  3 Jul 2024 03:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZF3u9+9V"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6BD13211F;
	Wed,  3 Jul 2024 03:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977869; cv=none; b=MVCOdbzLXh1Ri4wUAthUP5+CABi9s6sVi1f+i/67ahBYjX0dQvWm5PIwndop/+5b4ggEBChvdjqlRCs/A8cEOadCYN0pqb+Ib3IuZ0AG/FwBkee1FWuu7NRINfCRAGe4f1xnqAAjyZk3vNTZo9p5yJXUpln46GDhBewXtCsyYrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977869; c=relaxed/simple;
	bh=NfMX6AxgEWkmydSYyIYMXgmN8GtRr0cFUtsi6+s/YO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TmOdVC2iCPFZ3HiCEYWomG/6rFxOx+8HcjdoEVV/puVjQ0SaoxX8V1jbxzr+5qgg2uRh/5gREtQJ4fGGsWWnIznUenlh1wIaDe8dQOhKx07L7KhW0H0q8FwFS+7R4YPR7cS5bFJpcGrDXwCjF1fLFJ6LkqXay6R377HOLGeUVH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZF3u9+9V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D31C32781;
	Wed,  3 Jul 2024 03:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977868;
	bh=NfMX6AxgEWkmydSYyIYMXgmN8GtRr0cFUtsi6+s/YO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZF3u9+9VLl4K2F7EurpCKxuNIWDpbB3MpKItwLUwjQVh1V/GndUf0ISYNMtPS/Cic
	 khy+quFI2raOi6WUmTaQqe8EhQFaYHVPw0Dbrp7MR9GhoJNpG5EN0N0hF+ypllPRzA
	 rggltnsm7HhvraZOWoc9AT6hcPVc4Ua25uYCB2Cvsk4oU77OsF1CfyZNeAi28vWxZK
	 8GjzEmW511HA4fGb6PMjwCxx0godDB+Yl7yvcRTyoLbwwpGNRieDU7gCpkW3hLj5hr
	 pPTkZ0pXV8N7L1Yk3s3g2PIQBNGNSe1PW9J/EkLx9VKAnsCmioaOJsCoB02tzXaRYO
	 P3CfWPNCGsFiw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
	linux-media <linux-media@vger.kernel.org>,
	DT <devicetree@vger.kernel.org>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Arnaud Vrac <avrac@freebox.fr>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bryan O Donoghue <bryan.odonoghue@linaro.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: Re: (subset) [PATCH v5 0/3] Add support for qcom msm8998-venus (HW vdec / venc)
Date: Tue,  2 Jul 2024 22:37:31 -0500
Message-ID: <171997785368.348959.9807486159795737442.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
References: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Jun 2024 18:41:04 +0200, Marc Gonzalez wrote:
> Changes in v5
> - Collect latest Acks (from Vikash)
> - Resend to Mauro
> 
> Marc Gonzalez (1):
>   dt-bindings: media: add qcom,msm8998-venus
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: msm8998: add venus node
      commit: 1c6285e10d76b0cfb5b0384dc9c02e266a2ffd0a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

