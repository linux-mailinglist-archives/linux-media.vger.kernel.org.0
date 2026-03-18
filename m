Return-Path: <linux-media+bounces-56212-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDCWNMWuumlXagIAu9opvQ
	(envelope-from <linux-media+bounces-56212-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 14:55:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 916C42BC6CB
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 14:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FA6A3017DEA
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B473D6CC0;
	Wed, 18 Mar 2026 13:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIyYEcjQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B4F3DA5CC;
	Wed, 18 Mar 2026 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841865; cv=none; b=gQtS+lJ1iztSsvqiSia5f9kF1O7pKkhJF7b3SI0wC91RHhjagNAnKGO7kKn8FgbYJdwvl2i+NmcHV5CE24vWsIbYi09czq4K9ZlsuiWOG9jInCC3z/IKsozM3/uRtiXqPf3aNmvhV/SyiRGpvhtsJPiracS31DkapF4ToMZ690E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841865; c=relaxed/simple;
	bh=t4XrOTAp1NUQqg+dCJBOJQbE7YyQZQbY5D1CqGz1zSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JgKuNDI/PKffLZdlx1TBKsLjQfpQJlcycQG5/vpB9AuB2zG4wHhTOeJQgvafFHgtNYkoMZKGDNgO1Ebv/zyXmFToBHK5NeC7RF9vqEOtaAby/5wJNxp+fr8F1SLLn9nFf7vc1hT581errYNyxiAh6tzRMEAfGXevje5ANn9GeRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIyYEcjQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D06FC19421;
	Wed, 18 Mar 2026 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841865;
	bh=t4XrOTAp1NUQqg+dCJBOJQbE7YyQZQbY5D1CqGz1zSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RIyYEcjQWYYsCIx+GGVX+zc3Qf7f4VtmeLLzL9h1R40tMW8YZMvZdcJmugCGa3piA
	 J4mz06U+N2KNfRLkCQGh2d4NsvqXLDxx55I/Co9LOJlzFr4V0zn+Z51fymZOaDkZux
	 QDpqW37zpFJMVnyaHLNHs9RZTLbInc3VVnOM+qn8I+AIAaVeOoxzo+bv1sKCikvuD5
	 1BeKuyNtdx+30zbgqNC37M5tRJB+lPZ/K/3gdk8T8NUOtGzcNq9N/aZ9P289tPDpym
	 59jVvY+G0dFTZOUrR/+TW/uyoW5JjaP7gTfHznIybgd7kilnReXYDe6nqSc0HbaOSe
	 VjA6mbIPXbh8A==
From: Bjorn Andersson <andersson@kernel.org>
To: bryan.odonoghue@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	loic.poulain@oss.qualcomm.com,
	rfoss@kernel.org,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	cros-qcom-dts-watchers@chromium.org,
	Hans Verkuil <hverkuil@kernel.org>,
	Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Cc: quic_svankada@quicinc.com,
	quic_vikramsa@quicinc.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v10 0/5] Add CCI and imx577 sensor support for monaco evk
Date: Wed, 18 Mar 2026 08:50:20 -0500
Message-ID: <177384182916.14526.14815252097843930157.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213132058.521474-1-quic_nihalkum@quicinc.com>
References: <20260213132058.521474-1-quic_nihalkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56212-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 916C42BC6CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Feb 2026 18:50:53 +0530, Nihal Kumar Gupta wrote:
> From: Nihal Kumar Gupta <nihalkum@qti.qualcomm.com>
> 
> Monaco EVK is a single-board computer based on the Qualcomm QCS8300 SoC.
> It lacks a camera sensor in its default configuration.
> This series adds CCI support and enables the IMX577 sensor via CSIPHY1
> through device tree overlay.
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: qcom: monaco: Add CCI definitions
      commit: ff1dbc3c093120cfea2bde95f406dad951c5ea83
[3/5] arm64: dts: qcom: monaco: Add camera MCLK pinctrl
      commit: 6754e6b5d69745513c254139368cf765bd15c6a3
[4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD regulators
      commit: e9f95530ce1298e2b3e2770d441857df4592adad
[5/5] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
      commit: cb473de813004512c8cdf3ef0fb882723a47f33c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

