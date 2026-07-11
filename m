Return-Path: <linux-media+bounces-67368-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PGajAIeeUmo6RgMAu9opvQ
	(envelope-from <linux-media+bounces-67368-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 21:50:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3073742BA3
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 21:50:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OzLZmZQM;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67368-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67368-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2E49301DEE7
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 19:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA57313E10;
	Sat, 11 Jul 2026 19:50:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582ED30B51A;
	Sat, 11 Jul 2026 19:49:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783799400; cv=none; b=B9COwLZcnXRoDGdF7u7zoPqkI85xGw62fOk+5hIUbdVGfOiwZAJvQEb2Ofj2D6Q13t478KtaeT5llqfPpdMIHLaPcDMlheFRnX9Qa7yKcHX/OuVboYJLKOdMhNJLkcgAJeEB2hXgCoR4eDQnpxtko3H2V6d60nTmhpT75J1XBvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783799400; c=relaxed/simple;
	bh=cnStKgouEira5ORQ4Gjr7kEMGeizlIeG1tKsvtb4DZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOUrt2XjPB+0zyPOHK1StxbvLxSgARQWB3ekNQ3u96JdkOjB2RY8ADdc4ANUdfH21mTpAULVNYRDVQZUidmdTs3wVHxJnOjB+u8eQ5NHUnJJoc/ENUaJr2UnEQ3xb6l+HFvtJfWx4HEC1SZDAA8m6CByUwr91IfiD9iVFoNBQh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzLZmZQM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0501F00A3D;
	Sat, 11 Jul 2026 19:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799399;
	bh=35FyaTXq+nGWlA1B1CN4WNG6qY0MnEpe0vs6FvB/xkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OzLZmZQMM/6MpC+Q4tqAS/Pt6WTynq1vkOu2tmLEJ2OyxayIY5t5PgJkgJNepPSCv
	 Ks0dPzcP6kYpI2g64l4NrF2DnxqjZSItS9fRwgrWVzX3iY+CXtK5J7pAyh79s/jah8
	 jfFoTqjxO12EL7k9FLt1/GnG9rPvJWQpQWy2WAekTG2V5O9VT2nVfkxnpJ7cBHQBwG
	 vZjl4Sk06BMYzhUILvMedMF5EKEJpxWHq+sVNI4UhA4daT4v0QefdNScpoYbot5Njq
	 WXsr4NPPergM9gS7VITufQhznlghIUTIheFUpy1Iu6YLo5L5ozg+HcQ3N7mD3K7PvE
	 YG5vyQMvm7N5w==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Hans Verkuil <hverkuil@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dikshita Agarwal <dikshita@qti.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/2] arm64: dts: qcom: fix power domain handling on SM8250
Date: Sat, 11 Jul 2026 14:49:39 -0500
Message-ID: <178379938617.163099.9882135996822796179.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67368-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3073742BA3


On Thu, 04 Jun 2026 19:22:22 +0300, Dmitry Baryshkov wrote:
> As pointed out by Konrad during the review of SM8350 / SC8280XP
> patchset, Iris aka Venus description has several flows. It doesn't scale
> MMCX, the frequencies in the OPP table are wrong, etc.
> 
> Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> stopping it from being overclocked).
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8250: sort out Iris power domains
      commit: baa60f0354fdfe186e2876af8aa61e25cf7a070f
[2/2] arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table
      commit: d1fe67315216695df4f9a7aadefb27c3c0e1104e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

