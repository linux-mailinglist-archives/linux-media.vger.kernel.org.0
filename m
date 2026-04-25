Return-Path: <linux-media+bounces-59600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCt9KYII7WkEegAAu9opvQ
	(envelope-from <linux-media+bounces-59600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:31:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 054EE46744C
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 20:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2129300A133
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B215358D27;
	Sat, 25 Apr 2026 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g92CNeNE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2F517736
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141879; cv=none; b=NQRx1dM8SB3Xe54IlCjQcr/SovX/azijjao3nTTsOvjjSxQav64pZfoy1gcWyjjXvfnIt64mhrMJp55QywGBgWP5PiLlb5jrpzcwfXmAtr+GnfwOGy7SSKUHhkVN6TKE3VoegFU6a+svjpAijPQ18o/OHO55AVSbIRqSUqB/0WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141879; c=relaxed/simple;
	bh=U3NTNG5ps2y829SCx0uun7nXl7uxno5CYNbsN2T/U70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MY8aBXAH1OC5WWJVBDGik6VRoNQ5vSltzviMwc8+6jTXiCQXV3hDX6xbb45yymDAzh14FufLY5cZQQtmzgkDdnyjSl79s6pM4+rV4+aeWVwt5m3cc2/fLqdefkxcMMk6sbeHkVExuX5jbN/RBNyicuflaCnFOCXql03ZDirHpQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g92CNeNE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891f625344so76688315e9.0
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141876; x=1777746676; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIYUuVoFgC4mPGBv/zDRz5d52rse0ZXYeR52JZrxie4=;
        b=g92CNeNENJNR4Z8B8hIIAW84kbD9cgEH67/Pj9fV9/QcQ3nXlVF/YcYiqtDpGnUbzi
         ud5LZQIT35BiXwzKh8sVjveQ7A8A94xZ8r1urgafszN03P2U1NTC81h1w0tfewA5s7Kh
         d/VWFNozIsWI7aTUrs+os43H9WlDzo6QFKz4/oR+vKJKL3jNIH8hTD/CCbTdPe6lDNl5
         7IN4N8/ReMsrMq9rvM/E7UD8kfMSJBkuLoUM4UwsgZueF68ts5qaOHfX2fB0GoT4qgON
         IOzWannZdIxhYmfyFa3clfpvzQJk9yppcBpqs0fdPQzeMN/P7nnxgykyFdgJQPr2WvN9
         i2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141876; x=1777746676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIYUuVoFgC4mPGBv/zDRz5d52rse0ZXYeR52JZrxie4=;
        b=eeOz33jKi35Qo7xMWhHw54qscx/VniBlMKx0XKAvPlB3IZLVjd0GK98CXY87NXZ8jl
         g2OBjYwQXC2RTCsg7Nh+jAXYud12cGPy2AyYeYIYndQGD8NZNXyxnHTAHP4BiI/8SyA8
         3kNP6SqDRw7YA0K/xb3PfuaWgoZo84mPkh9muvYq7NHRY2epTl2rpoN6D5P+lGPslP2r
         w6T+wUYP+2i3CPNSxhnRkNfH+UbaOd1sFFgmrFqF5qfeIu9pcouGibUbr+zfKgf4/f+S
         SLMtNh4qzZ3hDKLgUdpBIE9jxyTaC2KJgssDfyLcx8RewhT71O7QU+B7r3c3bcy5Xt8k
         jhFw==
X-Gm-Message-State: AOJu0Yzyh+lfZPZHuA1o6Y1NvpT+aK556pAkNwc6RZ9ZsvLf9a8QEfu1
	D9eVbpZ/WZ7OyXRBWdvZSavQEG5TgEA3SpRX00EzUn2Dm2ro8K7qO/vM
X-Gm-Gg: AeBDietjH3Krx+n7uVd975cqZqVNwoInTxNTn9ri2cYVwwSg9lFSzlzaWF/AiFCVRwo
	0NkDckdheZgeqHMKThoxmieBKWFsB7Uo+eMFqE0tIAf/7AjVx2MBLtwtouHVG1jBVix+ou6AuV+
	4KO4qn21I1gItkY1TBD7sqsDB/ijoId+ULNSc/eIGdV3cjH5Lb3P/Ofe8L5KH/ziscyilc2fw6e
	K0ADROvtMxFhqCa+2ESyfHVSmJmPCZVFP+iIgVTwCQFhz1cUftrReZ2Wf+akd1U/5wdv/LVeFPC
	3N2vb2vuuTLXsIbmB+ebWpWh2hhfRvVlNB6XctpZ/fTK6NjyBzuO8i4PGs5b0S6GknoapdTgLJC
	GTf/8wUMahQn5KVR1/oYOZi5A0bJMWXd5b7ulud+/mIfd+xF8IzJG9hObqdqPpv0mY0VRZy7m2/
	llMuDZmYR7f1a3an3z2yeL68leiNOqWpmcI4C2WoNZ2mlYcA==
X-Received: by 2002:a05:600c:1d05:b0:489:1baf:8c03 with SMTP id 5b1f17b1804b1-4891baf8d2cmr364837255e9.11.1777141876132;
        Sat, 25 Apr 2026 11:31:16 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:15 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH RFC v2 00/11] media: qcom: venus: add MSM8939 support
Date: Sat, 25 Apr 2026 21:31:01 +0300
Message-Id: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf4Xs2ZpSEMWTiYkf4NVwqMsWamwxX
 Wg0hH8X8O5xJm/ejMAULDEckxECRcu283NQmwSw1b4hYes5g5KqkHlaCMfuUGaliOQHFsGgQKl
 2mOM+N5pg3r0CGftenTe4Xs5Q/Uoe7g/CfrEtWGu578JnfY7pCv85iamQQsvSoFGostqcGqftc
 4udg2qapi9tSIVUyQAAAA==
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
X-Rspamd-Queue-Id: 054EE46744C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59600-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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


