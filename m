Return-Path: <linux-media+bounces-62792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QON6AvGhFWprWwcAu9opvQ
	(envelope-from <linux-media+bounces-62792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:36:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E345D6993
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27854301E6F5
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D243FB05D;
	Tue, 26 May 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q892Qets"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016193E9C2E
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802296; cv=none; b=lGhr7LNc0WSJFPFsKmoGZujlpb8OJ3pdWTSzlkIR0RMVsEXt6l3FVW/I4ktVCLqWHpGIJEp4wIvz/JXyzfUdxnlBfvrzHPZf0Gjk/D9DUUsl9Gxqivr5uCjbQH9ddPYgC4C95k2M19zDQhmeADjqlutXgLD+v8ZFlmOCsTm8MhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802296; c=relaxed/simple;
	bh=4LPn246sZQ7GUeZYHYVe97OQMA2AVBQuSkUX8Kzlk8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OL/dUjlaODr799IzKZwuRwEs+E6PR70MtYjxI6OGXUHNShOqKFCEhYld/q1gyJ50Y83q6JjAqnal/n9YBM/PTnoNobBiSmcmmjz7A2TWrhH08yqmnlyJr9CKulwAnBMjhOg3CzVhdk8mvdrDVoo2wSuhmMnT4L5BDoAZC5Zf9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q892Qets; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490426d72f7so39311955e9.3
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802292; x=1780407092; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4n5ZbQUwp/G3ciXRXlB/UDEsWvDsE0SWate1awvibH8=;
        b=Q892Qetsp+LeVA+IAsGNSqX6UoXdJZcMVKcoUO/WdCnbA0lTkmdi/rwe4z3ij9kGsG
         bHQq9krG51CCTkCU+TBtgFwtMxF/VfbrfLJWI8xoECgHbsY5b6ubZGGYLXnZDcAcBfkZ
         mA0VgUdzBwmQF3DIMJVT1/Oh8HVJsEZhRqKy10YPtk3xHpyvDPKWyDyeqIdmV47lke9i
         ZIoqI+XQEHBAavCnqM9Xssosqru5n5QTU95pHd7+JtzIRJ3GchnI/Ichduz5GK2MG+qH
         WWqJYyZS4aZi9uIoqlmDdG5dBduCXYNVMdJ5O3INUU/MLP/Gqo31TUNpBSm6wPeJkWQe
         jhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802292; x=1780407092;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4n5ZbQUwp/G3ciXRXlB/UDEsWvDsE0SWate1awvibH8=;
        b=pv5dBth7j8T+plO9/HVtC9zEgzP5MOBJ+/GS7RSwg2ScoElPx9E+Kpym0lPgMURRPr
         fG689GkWt5s9+d009mXy+3lfnA5uVo9e2YthMTv2N73MLbo3pd9ibqvSNujIdQQRo1C4
         S5G10IC91R1iaKjH3M9T1r2Z3pv0v/dPIOUEOb7UDIi5NU9kY4ZkMgl5JHOFqnKatkqL
         HCfSi7n498KZLiSsBrxOL80217PgzIt83e4WRxXaH1nsWrsYnQcHfL1a+7rCSHYC1ux2
         siOq5CdfoZCdPBf9g750Bolx/f+attUYxVaw95W1pQ3IUmEqKav59CrH6RakB4BqVN1L
         S1tA==
X-Gm-Message-State: AOJu0YwN0sOWjrS2bw0mc+p4keIA6GRp8e//2JkoN3EfQUz4rFO5NAdE
	ZGN5HJHuMQN+cA1IKK/hG450b08XfdpQHCIo1iOB1su0eFUwrvJTA9+/
X-Gm-Gg: Acq92OHBjTZRLR6a80Ma5O9QJoA+F6NbHwddaxYcqp/HuIS4Htp8l2I0jTt7GK6mHAC
	RCJdZyuP+wbARX8L/Spa8LEPsJHEhBo4RgMJzCH+uTMN+6199yOxr6g57gOOEiDMIObTShXRF16
	mTo1pBj8qr0gFjtMDRp6z5A5z2oQQt3aSrXF8qRfdKTkG2tbh/z1BKc9V30RASUTtdkOzjtw3Oh
	ufngxJcwLgZSGqUvDURQHH2CgsEltXOu1lgnNY29BkuQC/783IQh0eTlXcOJRkLAqNYw69nWyvk
	SWtfsEC2d6kS2gxROvGRJvNB6khT2y8rXyKmSe6m9R8/P19LgbxRRt9gYgmLp24uxvPRuDVY5cU
	fazeTWjF8yCL59lP6dWIw5FORaYlA7w0HJiVMBCvzuB5QSkxClygSsUKx9xWKqeSCg7VLIZk/Tj
	kt4SZQDikbJw6kFh7+RaDtGdfI6EWKaPQwaEWz
X-Received: by 2002:a05:600c:a402:b0:490:3d62:eb0 with SMTP id 5b1f17b1804b1-490426d7019mr256118175e9.24.1779802292035;
        Tue, 26 May 2026 06:31:32 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:31 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v9 0/8] media: qcom: venus: add MSM8939 support
Date: Tue, 26 May 2026 16:24:23 +0300
Message-Id: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PwU7DMAwG4FeZciYoceKk5sR7IA6Nl2xBtEXNV
 oGmvjvpOFCViuMv/f5s30SJY45FPB1uYoxTLnnoa6CHg+Bz25+izMeaBShwymonu9I1ZEhOsb8
 WOSaWrADZsrepjaLOfYwx5c+7+fL6k8s1vEW+LNDSOOdyGcav+9JJL73//ElLJVtFiRMwmGN6P
 nVtfn/koROLP8FKANwToArJUUQIxoHyW8GsBb8nmCpA02jCEDzpP4L9FVDtfmGrQGQTxgDQctg
 KuBZ2b8AqHH3A2AJHJL0V3ErQak9wVYiOrEPjkZTaCn4t2D3BV8EYduxSIGhwLczz/A0XolHpU
 AIAAA==
X-Change-ID: 20260416-msm8939-venus-rfc-c025c4c74fae
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62792-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,linaro.org,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 25E345D6993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds support for Venus on MSM8939. It is mostly
similar to MSM8916 Venus, except it needs two additional cores to be
powered on before it can start decoding.

As per Dmitry's request, I am attaching Fluster results and
v4l2-compliance output. Fluster results were very inconsistent and
caused power collapse fails.
H.264: https://pastebin.com/C15qeq5W
H.265 (HEVC): https://pastebin.com/WDsnxvuk
VP8: https://pastebin.com/egAgEm15
v4l2-compliance: https://pastebin.com/VpBhEFc1
Power collapse fail log: https://pastebin.com/rTivMcpK

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v9:
- Squashed conversion of MSM8916 to a new blacklisting mechanism back
  into one commit.
- Extracted passing hardware control to GDSCs into a new function. Power
  control is now passed to hardware after core clocks are enabled, not
  before.
- Set halt check for Venus core clocks to BRANCH_HALT.
- Link to v8: https://patch.msgid.link/20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com

Changes in v8:
- Only enable vcodec clks if power domains attatched to them are
  present.
- Reworded GDSC clock commit. Frankly, I'm not sure why exactly it
  happens, I only know that if I don't set this flag and pass control to
  hardware, the cores won't power up.
- Extracted conversion of MSM8916 to a new blacklisting mechanism into a
  commit of its own.
- Fixed GDSC power domain not being powered off after failing to pass
  control to hardware.
- Reordered commits to include schema first, then driver changes, then
  device tree source.
- Link to v7: https://patch.msgid.link/20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com

Changes in v7:
- Moved codec blacklist mechanism to be applied before MSM8939 struct is
  added.
- Vcodec power domains are attached with a managed method now.
- Removed duplicate clock rates in msm8939_freq_tbl.
- Redid the merge of vcodec_clks done in v5.
- Removed the {vdec,venc}_{get,power}() methods and moved them to their
  respective core_* parts. Vcodec cores are now powered up along with
  the core.
- Switched HW_CTRL to HW_CTRL_TRIGGER in Venus core GDSCs. They are now
  powered up first, then their control is passed to hardware.
- For now, document just the change of halt check in the commit message
  of setting GDSCs to hardware controlled. I'm not sure what happens
  exactly, but if they are set to BRANCH_HALT, probing the driver fails:
  https://pastebin.com/EYQekR1p
- Given the power management behavior has changed substantially in the
  power domain enable logic patch, I removed Bryan's "Reviewed-by: "
  tag.
- Link to v6: https://patch.msgid.link/20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com

Changes in v6:
- Added a more generic mechanism on blacklisting codecs.
- Reworded a commit for setting Venus core GDSCs to hardware controlled.
- Reworded a commit for adding HEVC decoding to MSM8939.
- Link to v5: https://patch.msgid.link/20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com

Changes in v5:
- Undid the merge of vcodec_clks, they are split back to
  vcodec{0,1}_clks now.
- Extracted a dev_pm_domain_attach_list() call into a function of its
  own to reduce nesting.
- Added missing "power-domain-names" required property to device tree
  binding.
- Renamed vcodec clocks and power domains to match other Venus bindings.
- Reordered commits and grouped them by subsystems. Now first come DTB
  patches, then clock, then media.
- Removed "status = "disabled"" in the device tree example.
- Link to v4: https://patch.msgid.link/20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com

Changes in v4:
- Removed vcodec{0,1}_pmdomains and merged vcodec{0,1}_clks into
  vcodec_clks instead for MSM8939.
- Inlined video decoder and encoder device tree nodes in the driver and
  removed them from the binding.
- Kept vdec and venc methods for HFI v3 separate from HFI v1.
- {vdec,venc}_get() are now called as early as before, since it is no
  longer needed for us to attach power domains to dev_dec and dev_enc.
- Link to v3: https://patch.msgid.link/20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com

Changes in v3:
- Added missing vcodec1_clks to resource struct.
- Removed enc_nodename from resource struct since we include
  video-decoder now.
- Link to v2: https://patch.msgid.link/20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com

Changes in v2:
- Enabled GDSCs during encoding as well.
- Merged vcodec{0,1}_pmdomains_num into vcodec_pmdomains_num.
- Reworded commit for marking GDSCs as hardware controlled. Same
  situation as in cdc59600bccf ("clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock")
- Clarified the reason for missing firmware-name property in device
  tree.
- Clarified the reason for moving vdec_get and venc_get for later.
- Link to v1: https://patch.msgid.link/20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com

To: Bryan O'Donoghue <bod@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: André Apitzsch <git@apitzsch.eu>
To: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

---
André Apitzsch (4):
      media: dt-bindings: venus: Add qcom,msm8939 schema
      media: qcom: venus: Add msm8939 resource struct
      arm64: dts: qcom: msm8939: Add venus node
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node

Erikas Bitovtas (4):
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: add codec blacklist mechanism
      arm64: dts: qcom: msm8939-asus-z00t: add Venus

 .../bindings/media/qcom,msm8939-venus.yaml         |  79 +++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 ++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 ++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  23 ++++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  45 +++++++
 drivers/media/platform/qcom/venus/core.h           |   5 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |  10 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 146 ++++++++++++++++++++-
 9 files changed, 318 insertions(+), 10 deletions(-)
---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


