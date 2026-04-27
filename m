Return-Path: <linux-media+bounces-59704-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKxUNzil72mpDgEAu9opvQ
	(envelope-from <linux-media+bounces-59704-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:04:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A574781D4
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 255CB30772A9
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 17:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4ED43D667D;
	Mon, 27 Apr 2026 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq7d2KcZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A184C3D6462
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312722; cv=none; b=DQqpeT+N1jf/ewnbegVX2zfjiKR9uj2ptQiqBAu+kO6eLYfdx8n4OQg/cEX4B6QY6hhc/rAc3ZXntXL4D5LPmJKiREKgJ3R7S5LMGrHBcICRrLf/dBJNjwnjuXrHjF+G+Ma5pnf1kC7/cFcpK6hcattDNCv4vrIrVIOcrue1UZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312722; c=relaxed/simple;
	bh=/8ZPi24r+2KjLGP7S/vkRpBzqTPelKRknbWu+/4Pfq8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mudFHd1sGf+lnAaYq2CZcHkE0z20/3UpFeycTWNK11BVgx5kiWNRiv4mmi1c1cocoy23aBZxewPJmHv0ZA00+2USgiqfkVmLxm5UbERlocoghFrfUuzGoLFIFhpErnEVhmVJ2620gGMlyoUVmnmX1lgydYYPpZJMhTmJslsE0cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq7d2KcZ; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bb0d18c7f9so59728077b3.0
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312719; x=1777917519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yDDYwvsriCdPFU1Y3E6YCoMsHtkfAqF5QUr0mwz7Of0=;
        b=Hq7d2KcZNoA0a0fK29wCEghyCF07aIfpeuEULvw8i1nmBHrX5H6SgK+QK1/RVZFA6P
         dgUBmXW/V3CGXeOLWW5neiXcosOL46sugrjwcu1QfsLapPuGaOgDqbO7T6fODPEtGFP+
         lCk4yYklxzZCv1EiNiBJRF6tQt/dsNh9CNV3w+Vg2wbOVFOSynpbIeo2aneHqlRyK8Ak
         qBPe61g0er2yEgADNBSve/4H81LHAhnO5XWGllTsTb7tUgbuda5Wh90/b1vrxNXghsuE
         u/W40jwDsWVOwTJYWTRt9QdswZjQd0QY20leZXUWC745XVIZbVirMKMC22Y00MaYQ5NF
         oBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312719; x=1777917519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDDYwvsriCdPFU1Y3E6YCoMsHtkfAqF5QUr0mwz7Of0=;
        b=NmcV7xnj7yPpxmN45xEc7sHCIpI/8hwLGCUEKYcuObGaJ0pjsDUEg32Mz3zDIbeL0E
         6nFkkcWjelefBgkqPef/WLtXTJmbOiLCCU5zDi8i5XYxalRZXU+AVQ+f+l8k417yzuxS
         zjwpz8slSn4QaQQmXhnRXbEleEQLnphbKjxeYjKvC88tCCtnvr8kS4oM4EAPgMTVPX5r
         7JJQdyQz1facPGgINc6PfD+9pTMk8Zd0DFGACMKuZRdlITNJyz5QAERVAduqXQNPoL1C
         XgpoReanWwmVwve9e+ScBmAA65h80urnYStD1WHMhI7ptdfKg6p2MZ2kTLdnbvkBZBeZ
         gr3A==
X-Gm-Message-State: AOJu0YyP5gwuGIBZGWb9azb0D8MjgIRVKbSMUcPWBH2IvLcLte+ijYkR
	HPa88kESKbN9v4So5xT0O5+IzQbwXhzt0XCcTf7xmy36lfwfyy8sVM8p
X-Gm-Gg: AeBDievxfZG2j/drTKT9gMFkhyhOrPARpvJO6spWVxdU8odnaII26DuK6A5Wcgc1PP/
	sub/H4WvquNWaJ2uOc7OeNiJaIAq8yxcxZ3bxF2SdlbbgkPio230tf21X/orv3QHAYT59da9iFf
	EXR6xYUBzr9ec/Q0zMBn7/JYaGscSxfG2XSYNreMPbV1x1EGUOuSPuoQJXqE5x+KF6t3bdeI+C9
	UEw5C1PWyTB80HFqplMutqmYAfSTCGCHWVCDioc8Emq7i4UmalRBDJ9kQ+9sQeOIeHRD/D0tdUN
	a73kp2WnAdjpKUVx0EIcZ8FEN+/D9P7eDHnMfHDe4MWLyj8zkvr0QKg23o/5KLACaVX0noknZ9p
	gBdbZJfC7vJ3IzV8ajAxevkzGulMUAvVvsqL8/J3DIDLy4PDeZnsKMDcnaStoKUR4o4k0mHX69I
	lGKX+w7J6cHypXT3Et0LLIrSTjpom68ISybttzXZ/IGGBIkRE=
X-Received: by 2002:a05:690c:12:b0:79a:cc18:19c6 with SMTP id 00721157ae682-7bcededfdecmr3022397b3.34.1777312718633;
        Mon, 27 Apr 2026 10:58:38 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:58:38 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH RFC v3 00/11] media: qcom: venus: add MSM8939 support
Date: Mon, 27 Apr 2026 20:58:22 +0300
Message-Id: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBAF0KuYrq0pAxRxZWLiAdwaFzBMoUbAt
 NBoCHe31A0L4/JP/rw/MUtGk2WHzcQMOW113/kQbzcMm6KrievKZwYCpEgiyVvb7vM454660XK
 jkKOAFBPMElUQ839PQ0q/gnlll/OJ3b5HO5Z3wmHRllqj7dCbd1h2USj/GXERF7wQuUIFCHGlj
 nVb6McO+zb4DlYCpL8E8IKSOaVQxhJEthbmef4AoE2cMAsBAAA=
X-Change-ID: 20260416-msm8939-venus-rfc-c025c4c74fae
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 89A574781D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59704-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This patch series adds support for Venus on MSM8939. It is mostly
similar to MSM8916 Venus, except it needs two additional cores to be
powered on before it can start decoding.

This patch series is marked as an RFC. Before submitting a non-RFC
series, I would like to have some details clarified regarding how Venus
works in order to improve and eventually upstream support for MSM8939.

1. In downstream, particularly in LA.BR.1.2.9.1_rb1.5, the buses
   for vcodec0 cores have only decoding bits enabled, as depicted
   by qcom,bus-configs property of qcom,msm-bus-clients children
   in qcom,vidc node. Do I understand correctly that these cores
   are only needed for decoding, and not for encoding?
2. Currently in device tree there is a video-decoder subnode for Venus
   node, however, for SDM845-v2 (and newer) chipsets, Venus does not use
   subnodes. Does this mean it should be dropped for MSM8939 as well?
3. MSM8939 supports HEVC decoding, however, as the patchset is written
   now, it does not work. It can be enabled, however, it will result in
   breakage of Venus for faulty MSM8916 firmwares, because the code
   disabling HEVC for HFI v1 needs to be removed, and as per commit
   c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
   this would break support for some MSM8916 devices. What could be the
   best way to work around this?
4. To attach vcodec0 power domain list to dev_{dec,enc}, I had to move
   vdec_get and venc_get later in the probe. Should this be avoided, and
   is there a better way to attach vcodec power domains?

There may be some other issues with this patchset - this is WIP code, so
feedback is very appreciated. Thank you!

Also, as per Dmitry's request, I am attaching Fluster results and
v4l2-compliance output. Fluster results were very inconsistent and
caused power collapse fails.
H.264: https://pastebin.com/C15qeq5W
H.265 (HEVC): https://pastebin.com/WDsnxvuk
VP8: https://pastebin.com/egAgEm15
v4l2-compliance: https://pastebin.com/VpBhEFc1
Power collapse fail log: https://pastebin.com/rTivMcpK

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
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
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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

Erikas Bitovtas (7):
      media: qcom: venus: add pmdomains to the struct based on the purpose of cores
      arm64: dts: qcom: msm8939-asus-z00t: add Venus
      clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      media: qcom: venus: move getting vdec and venc for later
      media: qcom: venus: Move HFI v3 venc and vdec methods to HFI v1
      media: qcom: venus: add power domain enable logic for Venus cores
      media: qcom: venus: Enable HEVC decoding for MSM8939

 .../bindings/media/qcom,msm8939-venus.yaml         | 147 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  34 ++++
 drivers/clk/qcom/gcc-msm8939.c                     |   4 +
 drivers/media/platform/qcom/venus/core.c           |  42 +++++
 drivers/media/platform/qcom/venus/core.h           |   6 +
 drivers/media/platform/qcom/venus/hfi_parser.c     |   3 +-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 187 ++++++++++++++++++---
 drivers/media/platform/qcom/venus/vdec.c           |  12 +-
 drivers/media/platform/qcom/venus/venc.c           |  12 +-
 11 files changed, 430 insertions(+), 33 deletions(-)
---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260416-msm8939-venus-rfc-c025c4c74fae

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


