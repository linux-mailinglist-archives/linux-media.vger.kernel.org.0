Return-Path: <linux-media+bounces-61321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NyNEmOMA2pN7AEAu9opvQ
	(envelope-from <linux-media+bounces-61321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 22:24:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F8B529117
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 22:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BF2F3051BE9
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 20:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E943CA48E;
	Tue, 12 May 2026 20:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOQkBGWl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239E43C061D;
	Tue, 12 May 2026 20:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617413; cv=none; b=DgiXF/k8bbpcsepLbsoIczCpWwZmtOhkasEsmXcLRYi/JbqHsd19qmldG5mpxtQ+erwwNqkWW6b4qke8VT+QqK8HQAKOs9gNlgzuXaXy6CEvpX/OtSbMu6ExyKHFHCzHqpV58k6npv20bvEP3TP0TjtqVpHnSWOyP3gp3HhcgKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617413; c=relaxed/simple;
	bh=smrhsw5WzxYLyP5GjviwuGAL96+rihH0k141oRv60BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhYqkU2bLKlHuzjyUIGnE/H8hdgo1FccuQSCWMJewzb4hdTiqe7hOqmDHRZBL5f8aEEFIXa7Q0bmEagi+FqEacOTl2dh9SG3RIejn7BvI/GTqIRGT8TsQGqoioVcTjfDxgw67omieD1neO2y4EpQdTwJep3XMmXTpXueMjBZ/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOQkBGWl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EFDC2BCB0;
	Tue, 12 May 2026 20:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617412;
	bh=smrhsw5WzxYLyP5GjviwuGAL96+rihH0k141oRv60BM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nOQkBGWl41IfumLFKVRzZwtEhWFsSwuOl2uMSaTPCtzhH+816Nr+1l+F2J6pmj50X
	 vGIkV5sYqBK+3R5cIplmpVf8xQTnCjhWJYxM4CV7+gepGVyqpc0dX76V7lzi5pxQec
	 PJuuHe6ygIvqFmlwCP7fOkTb62Uc0K4MdABQqzeSpsJ+NNaEF8mWGB1Xmc/5AZ0Ijb
	 hoKiJ0Vt5FmzH1e0stIT5yoJimbuRZY4dlRtipMoVtuLsFWQVsiyEhIFI3K2SvbJF2
	 6WwDSm9J0LOZYRiEU1ApG+hlcC7Yofy5Bf2Go8jziNhE/lSykqEJ9+pBt6DkPjKLZz
	 6+1hrdJqojKFQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 00/16] media: iris: Add AR50LT core support and enable Agatti platform
Date: Tue, 12 May 2026 15:22:44 -0500
Message-ID: <177861739346.1242344.3408282680025332189.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 28F8B529117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61321-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 07 May 2026 09:42:00 +0300, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> AR50Lt introduces a few platform-specific requirements that need to be
> handled in the iris core and VPU abstraction layer. To accommodate
> this, the series adds minimal hooks and updates needed to allow the
> firmware to operate correctly on AR50Lt without impacting existing
> supported platforms.
> 
> [...]

Applied, thanks!

[16/16] arm64: dts: qcom: agatti: add higher OPP levels
        commit: f8874bc5792134b7bdda9706e2a48e6285da3664

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

