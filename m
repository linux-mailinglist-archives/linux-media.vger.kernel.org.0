Return-Path: <linux-media+bounces-57816-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFszFPc2zGn7RQYAu9opvQ
	(envelope-from <linux-media+bounces-57816-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:04:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3313A37156E
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 23:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA30B302B9EE
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 21:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A30642669A;
	Tue, 31 Mar 2026 21:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngitMcCZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B33F41B36E;
	Tue, 31 Mar 2026 21:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991071; cv=none; b=o1knk7hBLHvWkyak+Pzzw4qfvhmzXwz4cnxb4Pl3bly3fGgWK2hKkcgeHufj85+komLhFnIMjV45Hl7LwqtVXPNxyd3lU825EnBdobOFKUXW+flb43Prb29dIYYFOTgV8xeEEaRYv5Y9wib3IaPjU1cA6rTjtr1+9Y7aubOQmOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991071; c=relaxed/simple;
	bh=em86yCCRyL2CVX8urGD8oO6MxC7Rij/SyBrH46i9bEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dlQPvXTzS/1tvn5d+sSEkfOm/hy6mvAuF3CWSiahRiBrm/+voYLBbJORE2EVioTTo4tge3CV4tLsuyLyDLQknCb8Y3DbrlCB6vWRL8ULvNxh1dgyA2lA/27zM7BPXQW8jKztHrS1s4PZTsd7ACsVDKMNU9MRbtSc9xCJN4rGMYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngitMcCZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C29EC2BCB3;
	Tue, 31 Mar 2026 21:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774991071;
	bh=em86yCCRyL2CVX8urGD8oO6MxC7Rij/SyBrH46i9bEs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ngitMcCZqK8YJPw3oMlXOXSGH6ZLumD9rVj88yWO8kXfSpvgXjwYM7h65jrgonhxv
	 DWwbGSi4DG0i4a6P7F1VVkVd7IqhUlSHjKBd24empwrsrfJsbl2SmyL05ORkVwon7h
	 KCx0CWbsz1eE3HUQs6ES/BjnO85ytl77jTPf2Be/Tmxae1S6yIPGV5fErj7gVvI7RF
	 M3/HQHjQ64fBdE2RcpFv+Zn2x3BCDWkvZqloRJwoQxSB3uPFXYS8YtWCp3fezWoKDT
	 psYytvBtV/ak+QsmPhGk8pucgZ6AgZT5iT/KzmLNsXjPrbfPFYbZO+jofRWkjOBsZM
	 CQiKCZVuwRnEA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/9] media: iris: migrate to using global UBWC config
Date: Tue, 31 Mar 2026 16:04:24 -0500
Message-ID: <177499105231.956796.588474423586543717.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57816-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3313A37156E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 25 Jan 2026 13:30:02 +0200, Dmitry Baryshkov wrote:
> Having UBWC configuration in the driver is error prone. For example, the
> driver specifies fixed values for HBB, while the actual value might
> depend on the DDR type. Stop defining UBWC data in the iris driver and
> use the global UBWC configuration registry.
> 
> Merge strategy: either merge SoC bits directly through the media tree
> (with Bjorn's ack) or merge to the media tree through the immutable tag.
> The drm patches will follow depending on the way the SoC patches are
> merged.
> 
> [...]

Applied, thanks!

[1/9] soc: qcom: ubwc: add helper to get min_acc length
      commit: 68a66a44af6e196ca426d1250104d3018ed9e74b
[2/9] soc: qcom: ubwc: add helpers to get programmable values
      commit: b2571ef8d4ec9bb636889a9132090bcc3449792e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

