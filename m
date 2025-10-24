Return-Path: <linux-media+bounces-45495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57037C063A6
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 14:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92E0C19A230B
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 12:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1658B3161BF;
	Fri, 24 Oct 2025 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mYoV4IHn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCABC2FC877
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761308665; cv=none; b=nb7CWihx9Sp0Q/rCdHfZjpJvm6Ozk+Up0bE6oAhQt1JQgvAnA8JXVfmfdaAISekfrYVsu0nk3PhWD4jBtV1dKCg34vVMhSsGVGAXFB4T2RaBaVcTvIFBGjbGn6jNrRQHaRmSruwQiyVbbQ6vIFeNRnJxxnraThwXGax54sweisk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761308665; c=relaxed/simple;
	bh=kWCSqyw+5B5hiollOsuNPCYTsxQeIPv9OUnrObjMnmI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p7joEBA3mmODGIGDbkEkAXYI8XjXhXB1YVrRDDeQQ1YgnEyAp993jxzh9BL8K4REiZsCEcWjmqDJJRZfaMQKumRLDICeBF/u0AmICbSXqPUuIBOkvoYfUKm1/d/MKsReO+rNmIJCb2a4l4QQ29vVeDuFUH/ATe5Ke34WOKlt/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mYoV4IHn; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so241669666b.2
        for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 05:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761308661; x=1761913461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4EnPd8CSxuEQwQl4Ho0QB8vgor65hkR0HOfZfLDA/cs=;
        b=mYoV4IHn/iqMmMzxjPumdyspFHTtMB0b+UWyzuVZTOQ0sjzPXEOsIBhi0MSItwC2Fz
         Fi61FE8106YgCGpUTsNZiswrMXdiTb/N45fwtV6sVps3uGN84lmDdIxzhtwkSgOjXvgx
         Qya0fu9+KWTGJkV/X8MruCapXRZCrs8pzJgZ5DiW9aFfeGfBjJuvoPYdGchanWhhgyVq
         te7w9shQ4H1+O0wwVMeeiLJZRELFR4tGMkPfVIqVj4MwlQMwhm4V9E9+OfW34ZtZKTFm
         naoyIVZqLEPT6Ap9B3hG97+Yp2FSkbi5fo/oi7/lDQU9xSG2glHHaAF3RnEyaSUsr9Ti
         1/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761308661; x=1761913461;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EnPd8CSxuEQwQl4Ho0QB8vgor65hkR0HOfZfLDA/cs=;
        b=VkMU0s8eBWVWJg29Qa3ItPqvADcm2Xjcz3GE7nqpzC8TulbZA3XoKjTgx4vTWuowae
         wJWDUsvQ+SSc1KfiJhu/wX8NO42FsAoQoLNcFYnT3JaOIZHQMwuaKc0pKZJNaZQZU/mx
         qMpb8jZugoS4LQuTbzj7ALQWVltPTv0GISHI8APSlueu+Uonl5oI/10XwO3rI5utQyhU
         loSAP48Irml2o0Ty/wsVd02HYnzWuhaHlfZA9pKtlRvY9EYuuF3f0mgDmE8Ai9yy6NXY
         iq6oluDOxm64+pcwjv9Ptola6Z1slxBt4MswN4qzYlwXa3353pWEOq6Gx09i00YQ/cKv
         NxXw==
X-Forwarded-Encrypted: i=1; AJvYcCWiRzadXTRHfEOCPnV111lvThyEAy0hNu2BExaJ+piJI1Mg/WPSYI+RvwrzvWXImuQeO8/icfiWj168HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN6xdtWf8lna24uZ6IYmHcStgK/zKK8SZq7F2eAOECIWScIQ0q
	ZHG7IyhLSjmLhAbpQ94Ix85VTpcKCnox1EKQdscpgc5s8z6prrlpgE7+sBGhfvIpPDM=
X-Gm-Gg: ASbGnctuI5iKT0UaMs/rY+TKP9Ej/a/ZGhOFu5268sr1/yHlbYzvr/FJCLQBGQolJUc
	jFklb8CF/301BiYs2XDpThHn3sr5lDRlxcaZA+hhshFcONhsKz2HtZ0N1MO23rYVvHEwx7eH+lX
	Br3+pAlVEAeeeEGrW30GQpoFNLajok/uAps7+w/ZRrdo82GgVuvGOzFzfjnGcXzDhTkTMp2HBNT
	rXqJs64KBs98hKTruL3G4cKkPoU/uqJn59Mky2avnN0b9MYw5scv0jR+kfaQ19HsA61EWkbkFX6
	hBgf5IMMXABGO5F1G7Yp908pSWIfzKPFQgR5Ch3++czLUprnnYKXQGg5kZ+cJKOT8zg1EcdIfge
	ZGSsNLbajvZ4tRQddFYxxyWK0Kty49yALLs9i6WPbtwv/rG6Qty0eSBgB0HDeCw2nOmwFTAzKTc
	TxSnAJvD/hBm0JhlK6MP/mJo+71wJu6Ph5PYNB0l1U1qzbMO6xwikqlL0A
X-Google-Smtp-Source: AGHT+IFxGhcZW9IRg0ysaZx+dcfZbpusXNL9CAu9Q54la1WCXa7PdEoVStvQbLcNkX5XBWFi+ObSQg==
X-Received: by 2002:a17:907:97cd:b0:b41:3c27:e3ca with SMTP id a640c23a62f3a-b6d6fe02ef8mr217607866b.7.1761308661129;
        Fri, 24 Oct 2025 05:24:21 -0700 (PDT)
Received: from [192.168.178.36] (213162084087.public.t-mobile.at. [213.162.84.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d513199d0sm507233366b.37.2025.10.24.05.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 05:24:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add CAMSS support for SM6350
Date: Fri, 24 Oct 2025 14:23:58 +0200
Message-Id: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN5v+2gC/y3MQQrDIBCF4avIrDtgjCkkVylZGB3bWWhax5ZAy
 N0rTZf/g/ftIFSYBCa1Q6EPC6+5RXdR4B8u3wk5tAajzdBpY1HStR80epdEcPRW2yWOPoYA7fI
 sFHn7cbf57EKvd1PrOcLihNCvKXGdVKat4l/uYT6OLxt3tkuPAAAA
X-Change-ID: 20251024-sm6350-camss-9c404bf9cfdd
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761308659; l=4216;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=kWCSqyw+5B5hiollOsuNPCYTsxQeIPv9OUnrObjMnmI=;
 b=NHiclYXPKKz/rcgdVp4iyUmUFrcV/r1TF8ubxVaEOcwu7DLIpZXQ8et0d+HzrtsCBfndupQUf
 ab377Y2jJi4A3uCXKnUli3kHhYR4gOignW9Kq+tisvI9wCJ4GvalPFG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings, driver and dts to support the Camera Subsystem on the
SM6350 SoC.

These patches were tested on a Fairphone 4 smartphone with WIP sensor
drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
far as I can tell.

Though when stopping the camera stream, the following clock warning
appears in dmesg. But it does not interfere with any functionality,
starting and stopping the stream works and debugcc is showing 426.4 MHz
while the clock is on, and 'off' while it's off.

Any suggestion how to fix this, is appreciated.

[ 5738.590980] ------------[ cut here ]------------
[ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
[ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
[ 5738.591081] Modules linked in:
[ 5738.591099] CPU: 0 UID: 10000 PID: 6918 Comm: plasma-camera Tainted: G        W           6.17.0-00057-ge6b67db49622 #71 NONE 
[ 5738.591118] Tainted: [W]=WARN
[ 5738.591126] Hardware name: Fairphone 4 (DT)
[ 5738.591136] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 5738.591150] pc : clk_branch_toggle+0x170/0x190
[ 5738.591164] lr : clk_branch_toggle+0x170/0x190
[ 5738.591177] sp : ffff800086ed3980
[ 5738.591184] x29: ffff800086ed3990 x28: 0000000000000001 x27: ffff800086ed3cd8
[ 5738.591208] x26: 0000000000000000 x25: ffffda14fcfbd250 x24: 0000000000000000
[ 5738.591230] x23: 0000000000000000 x22: ffffda14fc38bce0 x21: 0000000000000000
[ 5738.591252] x20: ffffda14fd33e618 x19: 0000000000000000 x18: 00000000000064c8
[ 5738.591274] x17: 0000000000000000 x16: 00001ae003667e9e x15: ffffda14fd2a07b0
[ 5738.591295] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
[ 5738.591317] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffda14fd2a0838
[ 5738.591338] x8 : 0000000000057fa8 x7 : 0000000000000a16 x6 : ffffda14fd2f8838
[ 5738.591360] x5 : ffff0001f6f59788 x4 : 0000000000000a15 x3 : ffff25ecf9d7e000
[ 5738.591381] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000baf5c100
[ 5738.591403] Call trace:
[ 5738.591412]  clk_branch_toggle+0x170/0x190 (P)
[ 5738.591429]  clk_branch2_disable+0x1c/0x30
[ 5738.591445]  clk_core_disable+0x5c/0xb4
[ 5738.591462]  clk_disable+0x38/0x60
[ 5738.591478]  camss_disable_clocks+0x44/0x78
[ 5738.591496]  vfe_put+0x7c/0xc0
[ 5738.591512]  vfe_set_power+0x40/0x50
[ 5738.591528]  pipeline_pm_power_one+0x14c/0x150
[ 5738.591546]  pipeline_pm_power+0x74/0xf4
[ 5738.591561]  v4l2_pipeline_pm_use+0x54/0x9c
[ 5738.591577]  v4l2_pipeline_pm_put+0x14/0x40
[ 5738.591592]  video_unprepare_streaming+0x18/0x24
[ 5738.591608]  __vb2_queue_cancel+0x4c/0x314
[ 5738.591626]  vb2_core_streamoff+0x24/0xc8
[ 5738.591643]  vb2_ioctl_streamoff+0x58/0x98
[ 5738.591657]  v4l_streamoff+0x24/0x30
[ 5738.591672]  __video_do_ioctl+0x430/0x4a8
[ 5738.591689]  video_usercopy+0x2ac/0x680
[ 5738.591705]  video_ioctl2+0x18/0x40
[ 5738.591720]  v4l2_ioctl+0x40/0x60
[ 5738.591734]  __arm64_sys_ioctl+0x90/0xf0
[ 5738.591750]  invoke_syscall.constprop.0+0x40/0xf0
[ 5738.591769]  el0_svc_common.constprop.0+0x38/0xd8
[ 5738.591785]  do_el0_svc+0x1c/0x28
[ 5738.591801]  el0_svc+0x34/0xe8
[ 5738.591820]  el0t_64_sync_handler+0xa0/0xe4
[ 5738.591838]  el0t_64_sync+0x198/0x19c
[ 5738.591854] ---[ end trace 0000000000000000 ]---

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: media: camss: Add qcom,sm6350-camss
      media: qcom: camss: Add SM6350 support
      arm64: dts: qcom: sm6350: Add CAMSS node

 .../bindings/media/qcom,sm6350-camss.yaml          | 349 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 165 ++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 249 +++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 891 insertions(+)
---
base-commit: a92c761bcac3d5042559107fa7679470727a4bcb
change-id: 20251024-sm6350-camss-9c404bf9cfdd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


