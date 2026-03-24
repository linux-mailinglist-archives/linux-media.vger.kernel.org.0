Return-Path: <linux-media+bounces-56798-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Lm6CMgIwmlBZAQAu9opvQ
	(envelope-from <linux-media+bounces-56798-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 04:45:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F00301CD9
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 04:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5E3D3105F25
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80963A0E8A;
	Tue, 24 Mar 2026 03:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6/5/HZl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163DD39F192;
	Tue, 24 Mar 2026 03:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323737; cv=none; b=kHeETLeDHJmT/3FA5ZVVyh5xwEPOoqHhQ63w/z/KAcyfhOhqxpvxuH6NOjbCWd7MAyoC5ryeqTrlaivTV1JIDpPKMeepQmPULxPPirRaXxneG9Aoo76H78dKIvKDwZg3Ld+tc/xQi+wuZ/YnllnsT+dvZ5HfjlH/FNu1DLxw8HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323737; c=relaxed/simple;
	bh=1RQSZ/eC9essIbPGdgGsoMnSL85ywRErC/Ci9wpgfeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pbFdQNgNx8P5HWketthV0MOvXeeAQliNJY2coq9HytsBSq5RxWqXc0sdx2GYxhS6i05bLmcFAwv8B8vONZRaXGWUpGihQxy8Djl2Y1AK/DIyCWrCbdhL8fJchvgWJc9Ks3UTNutHxe8dwyfSOSK0WBcGZQSaWz+GmYWcJelTM38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6/5/HZl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557C6C2BCB6;
	Tue, 24 Mar 2026 03:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774323736;
	bh=1RQSZ/eC9essIbPGdgGsoMnSL85ywRErC/Ci9wpgfeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F6/5/HZlqAcDmODucJTKiyu5zONy8FXCxPTNZ99h9hRm1qZJsqCldNUye0Aux5+6v
	 ogSfb3CqXsXN8i3oWsdq+VDQJCyKBK4xH34hZsZON9QMgGH0lwGDLjfvZpi8tutyBy
	 vNW4+DcebHN2nc4CrD2AQLqDfSJPpVVZ5lkDpelmFT7ftm4lxo1dw9Q4LcF4H8ZyFk
	 J0oeLYjucKfylc+zDz683eVGuTqlxWph6Rt6Y8tC/iBK7uubol/gXSUF3RKiVnEV87
	 sgrzdwJ6/goAXmAljVR8wikahw8qIrr9fDG4AofRlsMCFvb3i/XcQIwi9o/ixcXcmf
	 E0gM0GeMDpIag==
From: Bjorn Andersson <andersson@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/5] media: qcom: flip the switch between Venus and Iris drivers
Date: Mon, 23 Mar 2026 22:42:02 -0500
Message-ID: <177432372685.35532.7488465406897095432.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56798-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B7F00301CD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 31 Jan 2026 15:58:49 +0200, Dmitry Baryshkov wrote:
> As the Venus and Iris drivers are close to the "feature parity" for the
> common platforms (SC7280, SM8250), in order to get more attention to
> squashing bugs from the Iris driver, flip the switch and default to the
> Iris driver if both are enabled. The Iris driver has several
> regressions, but hopefully they can be fixed through the development
> cycle by the respective team. Also it is better to fail the test than
> crash the device (which Venus driver does a lot).
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sc7280-chrome-common: disable Venus
      commit: a9ca757518f35f336c43c5bc3b36856dd8d1ce54

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

