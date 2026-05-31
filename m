Return-Path: <linux-media+bounces-63171-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDwNA6bzG2oWHgkAu9opvQ
	(envelope-from <linux-media+bounces-63171-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 10:39:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5016152B0
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 10:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B707C3004061
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 08:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA1F383988;
	Sun, 31 May 2026 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bny6zP/o"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56A83822A6;
	Sun, 31 May 2026 08:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780216727; cv=none; b=raissSuu9c4HndIkMcGwGQSaw7vSgQhvBlLF169H6t9OPjOD3B8BmfXQkCGCc20gHRZUwA62+e0h3M/S1ZjFy7WjZRa+vf/KsKT1+STiS/92oGZCyTYTRTLKvzeEe5UxSi1cBbtHiXoXlbjLrocmwDn7430Ypmv2we7AWXFiF14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780216727; c=relaxed/simple;
	bh=h3s0PGewQb/N9QwZbjmKCoQ77mP3b8AyELkig03mXe4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=n/fHy0BbIaYDbx4mCdINfXVtwdVqDfioSNESPsl/dxXGa/81kKLhdUKSKuySBAsjqkMHb1hjzwFh+YxyWomRijOJzyyTQUjctuDJ+RNUkdJJ2nVowuE5urWcvGiuOq8DOFSgll+JFENXWcigrWPI0LQE+ks4ygN+W8hHZ8ynlj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bny6zP/o; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2A61F00893;
	Sun, 31 May 2026 08:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780216723;
	bh=20NxcvG1DFlI+iqIfmBFSZP1bc5BtLZIrR78bOGLTvk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=bny6zP/oRKkw9rYRYhWe22N6ZOhS9c1DVXdDp5KLB0EYLYIoHuK0A3WEiLPLUC93y
	 7otqiyWhtBkY20fuRWpDCGhRrDs6CO7WQuYLHvS1izHJe7bgU5iWYQ0Mpoq1zGHHjc
	 bh9vB4b/N9MIUOJ31p1Ooa1vgT2AMWT8lXj8RMfRD8G9L/8cwV6BxsZmYK6B/qpMm3
	 vk/185NMEDoClC0iMWoJp8FoQ9xJkDrMEyq3Hq4NmbkKX0I3kMJgGa+nD41hs/0l8u
	 pLSdv/cMnYAlC2Ofczx28412wL9xCuJpaBp8c7LIsSTMzFdyvxn5437V08GChJk9Po
	 3tKQ8ktXLscLQ==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 3/5] media: qcom: camss: csiphy: Add support for
 v2.3.0 two-phase CSIPHY
From: bod@kernel.org
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260508-add-support-for-camss-on-sm8750-v3-3-fc6861a65c67@oss.qualcomm.com>
References: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
 <20260508-add-support-for-camss-on-sm8750-v3-3-fc6861a65c67@oss.qualcomm.com>
Date: Sun, 31 May 2026 09:38:36 +0100
Message-Id: <178021671689.11283.11439113636113995924.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=601; i=bod@kernel.org;
 h=from:subject:message-id; bh=h3s0PGewQb/N9QwZbjmKCoQ77mP3b8AyELkig03mXe4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqG/OO/+jDjaUrJwuOFTSfT3Rc75650AyPdHOdt
 SlBDL0NZ3+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahvzjgAKCRAicTuzoY3I
 OjzFD/9hZ9Vs1GrtFPb6X/nvnhCrjrcB6UoioRH6o9vhw+d9A61LA/DV5Bztvx5xb6rOFTMinHL
 QLdg6mdMigjLtsCEoL4X0jW/JTMfdneRlX170pk2lHIFajJGdx5A6ljMt2GJVPHRXa4GfGlQnlk
 2+EvTzo867SqKMuABYdXQ4mKXqGSU6ynXRm+TK6n6E2hjMWR3UNDzr1CL/lDRHXBl9S+6gTWdB+
 eh6+4BnjcVhywSGivII9OB5Jma65+B8To24NQJH+ATAW2mbZMN/tFkAXcrLpDRvWthgHNsDj3gW
 wPKNRNmq7WIGaZJVtObIb1AqL3kS+LJ038VhWVcsRN+5xERSBTw2KIfH+g5/mEorA7tvCw99TOJ
 5CQ7YR7M6G5NOfnjZ3ie+9/08gAt02Op12OS3E4IA31By1x6afQ9EV6LOoHCgsb1OT3r+JLo9lH
 5CLdlxeilDzVymjDBzWYjrRp3t/IqOfXgfocqQ/zQI3gymSmNgmgBOD2vusmx8UMhXahzlBj1E9
 vxBHBz6+QWEI0uOmGgLK4yhpx7eCBKeT2+q9InzyADwH0vHOHxur0x3+lsAZAE9ubojRYipB4v6
 CLZhTRICfwuONMht8Z/bkNWIcbCalvIU+osC1Ftxk4jbu9kLPY4Wp6b+ZDc3AJX6mfkWngOIQpW
 B2q53U5nm4kciZQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63171-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 1A5016152B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-08 02:51 -0700, Hangxiang Ma wrote:
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> Additionally, generalize the struct name for the lane configuration that
> had been added for Kaanapali and use it for SM8750 as well as they share
> the settings.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod


