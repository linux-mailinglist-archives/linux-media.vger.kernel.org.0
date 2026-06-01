Return-Path: <linux-media+bounces-63200-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG8REEkHHWpUVAkAu9opvQ
	(envelope-from <linux-media+bounces-63200-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 06:15:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88386619639
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 06:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC9F43014654
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 04:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B2331D381;
	Mon,  1 Jun 2026 04:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="NZJJzOKE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23973168E1
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 04:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780287293; cv=none; b=MdV0pKm/+hBw2TS7q5Ve4BuSLD0Eu6vxSTdcHjoNDsKPXPZePUTfsg+yf4tPsiypkae7R2eQh8Z3J4kAjl4/stoHjk3W8J/zt7gyVR4rRZhB/di/EN7q+AFiGAVDau8DYwnDzIFN7n7+yAe7iVgL7iPnD7BuLXoWnAdDserDjtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780287293; c=relaxed/simple;
	bh=T/BAgSheZ6++v61mRY8etZ4qi9u0C/vqxFaS8N3TgYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkzJ0ohmiDlihIzBSjp2K5fVXfDFLIOxAMIIUr1f1U8lJGujASbaE1+3s8YqMWTa9Aon+AagD3rTWKGHLMCtGG1qaUuW0bAbUD9BpkEUu9xQkcSaFswvsSF3N6wepwhrG2JqMQk8CpdHrifTgf7OEV99CV3TlvV+6GShG+33QIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=NZJJzOKE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c3184c71so5845555ad.1
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 21:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1780287291; x=1780892091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ixy0XYV4dscvWnpDYcR6EMlE3fKq9U56m7Y4N2kjc8=;
        b=NZJJzOKEk1vucrcGq+I3TiTLr4ddAPoZgLfXaI7ceYMZ9jzTXv3jYp2RdUFHWiuz5i
         dNiRHSkfDP6hSKiI2pP6gD+kiDq3dGxWbt8SkwsIt9DK4GRsgWtHw4GTLE0QNtKQZEHL
         gdetCfvhhTA52gnAnSEHkDektbUyOEho5Bviw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780287291; x=1780892091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ixy0XYV4dscvWnpDYcR6EMlE3fKq9U56m7Y4N2kjc8=;
        b=BXyLDOpesiUU8GTu7Q135OBsx/EtwFNoFDU+qum/JS2LevTIe9TLHmhXu4TUnHbTvt
         B46bW1JsuQGT4t2jETRKumMknoeql8Kyd9ypmcD+ZQPPvY+prNtP+g0BV0Tf4+PBr/nW
         MFmFumK6MZh36vqdd1weGPYi7AJnxVgF5Gv4u+83Yke/0FAeAM2IjRZnKtdv/BKu+RqQ
         8tAhVbGOmHvU6IJ0xB+JkqKeCA3y44iS75QiCka30T+d2DxlD+H8PwhkC55EjG+9GGV2
         vfQZCn8MhCUMZbGZTs2wShTzeJ0GuKkHpi8Wzszq1JGan/DFO1+q1zX7vRtvl0MKK+M0
         dGeA==
X-Forwarded-Encrypted: i=1; AFNElJ93o8M0ox7Oupcb+KmgAGDHrMB+gmb+hmveVNfKc+37ti3h8PtkG3YtgagKljk9RsRsbVgDEYkogIO7QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVFaQQBwNxpXohF/73BViTEsY+vVBGtTs9JLLtJn+97yxOo5nU
	r5ik33Tt8Edyu+y2q1kcJQxlUJRvZnn/KQ0aiqCJa35jl26lhiALBS21TdM48JpxKl4=
X-Gm-Gg: Acq92OFMi4koGKhwct8loh2C/d/lIZ2Ls6y5orJTB2pg9bEZ5BozZdMRuMcXzo1IL5R
	X3d+RWnk/rjewhen/kugLr6rRwVNq9xNKdtWmkqlanx5u5EhX+ubn8wVebF9oAm/IUOxK+UOW85
	dBqvwm7OgtXzwmTAKy9WAn9hxfKrMoA0xsFyPOkJhwZL/K3NBKWJMsQT8v/PUzXYLCiY+Gw7OXI
	skzcn4arhLVXlWQCtfvNTzzVJTbavpbPgPExVGCBiJdVVGbINm20OdTmnRc/nOrSXzUAZ3yjeOh
	mEPAoF8VycLyfuL+br5/D52SFe6j0FnL9jujhDpcXrWA8FVrhpwsHU0aAmY/K9b7ECubBhbIxKi
	W9Cbc7mZzQhWDvJyRumRue6e3uZNmb7HtMqGBWBtTFXsMOYZBkFqwIOA5ZXzQkHnYX/Nd25UqRH
	IhrkDxFnX2gjC6CgL8kIoxCvytW9j1zbM82pFuY/rffz17uBNCTzYVu51+E/i4W2HxJT4zJMOFZ
	6YzO2TTSyolGWxWyrFpK5/7UR2mb5DgW845AFX1TWgNfzrt0l1Dv7S5UW7BjZIk36GEWGWx5E6R
	OrrOuWDoC9b55t7m6+3MotOofiNjZrk+mc56PaaAowbrS+PEsK2BkUEXrRAk7u7iTAvgDTMq1Gk
	FkWM=
X-Received: by 2002:a17:903:289:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2bf367c93admr101535725ad.15.1780287291239;
        Sun, 31 May 2026 21:14:51 -0700 (PDT)
Received: from aegis ([175.176.67.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3f496sm92980405ad.76.2026.05.31.21.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 21:14:50 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH 1/2] dt-bindings: media: qcom,sm8550-iris: Allow IOVA reservation memory-region
Date: Mon,  1 Jun 2026 12:13:33 +0800
Message-ID: <20260601041336.9497-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-63200-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[quora.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 88386619639
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In addition to the firmware-loaded codec carveout, some Iris platforms
need to declare an IOMMU IOVA reservation (a reserved-memory node with
iommu-addresses) to keep DMA away from IOVA ranges that earlier
firmware stages have already mapped through the SMMU.

Permit a second memory-region phandle for this purpose, and describe
the meaning of each entry so the ordering is unambiguous.

Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b5..6359e4953d42 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -80,7 +80,11 @@ properties:
   dma-coherent: true

   memory-region:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region

   operating-points-v2: true

--
2.53.0


