Return-Path: <linux-media+bounces-66510-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rlYWLvfaR2pzgQAAu9opvQ
	(envelope-from <linux-media+bounces-66510-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:53:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D66B70409F
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:53:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=vBQIsHnw;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66510-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66510-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75A8D304B7CA
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10412E62B7;
	Fri,  3 Jul 2026 15:51:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871202D0620
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:51:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093916; cv=none; b=OQy0LVjfVszzA+zMOsWejUkdeSRuE/2fx4lBUnfkkLNj5aENlXDoQYzXfzcinELqaVdQITcW05BXC4Eo1dV8/RWR9ry/uw4j2CeJbIXUwIISdUSCJNwSqRwQQNUbvsuFsFALqFN2bR/zdK3DsVJnE8novCyyAWnA8563BTfXTy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093916; c=relaxed/simple;
	bh=XR5GmfLppTRjfvh+jR6iAEUTO0QmhFRfwyLH9bqDL/o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HI4qqp27Nz8t5LdB5hc54mYYPk3/wcdPys8YchdN9Zc36tU3kOr7rGWjbY+Zgaz3+IjsiuOVHcye4jNYEFXzBkWy4Zg8VKwn6Srhs7FiY4cD+HeEvfMPCka70oPxv8nzf3HIR/ub200PbfhI0+t04VHQVjm81qmf9yF9vVbE1KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vBQIsHnw; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b77b150aso5764615e9.2
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 08:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783093911; x=1783698711; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sWTYk/ImBGBMqdkQLWrj/FjPpL1zJsAf8G7wpBOF3BU=;
        b=vBQIsHnwmVQ6eBGDE098B65etj0u1RXDlntT1qUZFNYxOwxo64M9vecYh8h1y2oMD0
         RiNtN6kcl7W+v0JAmQfEuZ4hSh5+zHlB6hcqRzNNBjCW5ynzXa8122CoYtBxaa4b9h9u
         N2SwnEe8m4BRplgeOl6Qbx8/13PIfnJugJTZ2HUUPSaIenxNNC9m8KQKf309KIjbsdBb
         z2/3R55AlxsurWG2cf4xZKmZR1ujobwbQDOrL4cNQwnGIs96O/gkqfTVXJv8KT3bel05
         YgERJL28bGdSNJ1KUUXXhiUhbm+2kgQULzrcJv4P/ynuf0jKwXFOtjYnkvVQThppyarv
         8wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093911; x=1783698711;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sWTYk/ImBGBMqdkQLWrj/FjPpL1zJsAf8G7wpBOF3BU=;
        b=FEGARQg7rztSBo+QSwe4E4TtSqNmNAhNq3/fZqD0wELlATIzZ30OqDN7jINrkjCAiL
         5ezoMhn2FBIZz0adW9QhGIZookD+iRMNnAvTNe2P5rAaLPaUGNVPkLt9DhglYy4dHJ0H
         o2XPmOf0qOC6YLpmBhN+YMMEu6u5ZKfpOFXF49Eb5ps7XcHPRO19GTrQuvaBrvq5qT4J
         coBkrPJ8sPFgv43sfvAlMq/GZ6PSHmLaLm8RPNWvHxdH+XiMJLDFW6u4usC50QDHVOdt
         hmdB5708XhJFkZplVUZNqrWMr5f0rgAyOZ/ARaJcmKaWYvzNhNYQusD0lgCYScGeoso+
         Kl/g==
X-Forwarded-Encrypted: i=1; AFNElJ/ziRoGzd38GXHENbxjNmkeLZvpWTQ/pGfPwUwtv5/eO7izRWy0IUEdU2Zpgb/R098LBaNyMn9B9AZkkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd6k3+5GKntQS93mUO7WsTcWtQWjsZRmwaDLnhDW4ESQvxx+ZC
	EfEzIdtpJ8tNSMhWgPnsbb/6Ai8dNwTsKj9wcalX1RXSvW8VVJc7c+0JvEyvddRsue8=
X-Gm-Gg: AfdE7cmJXM7EZwao3H2frKtjQifBbsqX0TsOw1U7QwALYl/Ujl/VI2j54f2EIbTJKTQ
	s5XeyTyTi72vaxIbfMmRdC0ToUWhG/VK/WKA3w3o15z1TTy2k0yg4jC6U7u/EvDl7NBNG4xusuB
	l5R9oPqj5cJU0M6boJkL6VYX8yjIfIs33wlhEPo5ySFbVEOjr73Ui8eVwSPpdW14slnLi5DrAab
	FH9a7BkHtzAzi86xn+tPPB3JVUYiu4/NHuy1Q8xLmE1Lmb4EtVwno9R22X2eEu07x1MU6OQ/HQ1
	46QMgndzlR9BM2C6se6s4N2Ttdq/YZ37TRXaOimeU4y+l4grZm74n9rVIHV+Y+2Q2tBHnA+Jhtv
	HOwBm/6KtSGfEb5KWQOEvgDGgj2qmxkTjxRWgeWnidIOKJrwjR1bSx+SRq09rVl0YpB+4V+X69g
	2TlpjsNA==
X-Received: by 2002:a05:600c:8b61:b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-493d0f0797dmr4957755e9.6.1783093910827;
        Fri, 03 Jul 2026 08:51:50 -0700 (PDT)
Received: from [127.0.0.1] ([78.152.220.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba97csm141294655e9.12.2026.07.03.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:51:50 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Subject: [PATCH 0/7] media: qcom: camss: icp: Add HFI/ICP v4l m2m driver
 for x1e80100 BPS/IPE
Date: Fri, 03 Jul 2026 16:51:44 +0100
Message-Id: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw7CMAwFr1J5jaU0hBa4CmKRjwEj2qRxqJCq3
 p1AN09vZjMLCGUmgXOzQKaZheNYod014B92vBNyqAxa6U71ao+TjwO+bCoxCc4dtkfM3qC3gwi
 yT+iq50Tbj7EISrF1nUGnD9r2p1YHE6AWUqYbf/71y3Vjebsn+fJLwrp+AV/cy3KfAAAA
X-Change-ID: 20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-b252a7912d4d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14215; i=bod@kernel.org;
 h=from:subject:message-id; bh=XR5GmfLppTRjfvh+jR6iAEUTO0QmhFRfwyLH9bqDL/o=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqR9qSpuluBcH1z22wmkzFKUo7B7CqIkzl9o6am
 2pkEwJfE3GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCakfakgAKCRAicTuzoY3I
 OoKND/908vDFQrpnjw2s4PPEJklVmtfO4FRMURq7L4j2XzhMSihi6Ee1dChFvGTUExSb99i3sOJ
 6+I4Q/SLdO9XYHcYep3w+fGo7Nro88zLScGZMIaXsJEFJOD3TDwiljXbaH0X3uKzfhRWsdlOedG
 ItjVjTnwmRBTIToaLaA5pSwbOY2o2nko0pOfamBSQ7lRtEV9SmKDDSpuDkXxTtk+7kMQDRH+bHr
 Z/j3ozcEP+9cPCaYgSChFT9CdBMRK7PWPC1rGs4GApzO737GajhJZnN1IamnVn+M+YSs4Ko+rGK
 II3/q7RGJ0OdTYQfFModjesqruE72zmsQOsk1UgXq3T4Yet5om4pBgbjf5qwEUE8iZuXoSPpT4w
 U7e06b+faIIV4nKQH0F5v2vHsMk20xE9e51uAAY6Z/iRaJ17K/Pr1pInZYcGWej84q31W4N5eqJ
 TZ8G81btXzZ8nzp26HB4/jr0Mb64dCFPX4db08QNWjzrzVWbAgXI0vlwr64X0YH4ACIkVitNaQi
 L7wx312ug7DI89g+DRVm5iqVGAiHeHW9upL+KEcQdK3gImYV6sV0AwlfUsni/KO3surZxvjCc+7
 OgEmJUBR2WkZjkcvH81Baqfvt9bdrGTfd+C5BNA5JbwH1+m5sTr3CZeiB/bncTNkPhWomZdParU
 mCNX5P+lwGhRmJg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66510-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D66B70409F

This series is a very loose RFC for a block of code I've been developing to
enable the firmware based camera path available on most recent Qualcomm
platforms.

The Image Control Processor (ICP) provides a Host Firmware Interface (HFI)
which implements a session based system providing all of the most advanced
Camera algorithms on the Qualcomm stack.

Since it is firmware based with a session the ICP can achieve things like 

IPE:
- Motion Compensated Temporal Filtering - MCTF/temporal denoise
- Image Correction Adjustment - ICA warp/geometric correction
- Advanced noise reduction - ANR - multi-pass noise reduction in a single
  frame
- Electronic Image Stablisation - EIS
- Upscaling
  Not present in the inline hardware
- Local Tone Mapping / LTM - done on current frame using current stats

BPS:
- Multi Frame Noise Reduction / MFNR
- Bracketed HDR frames

All of the same functionality as with Inline Image Front End (IFE) is
available in the ICP version with the key differences that inline processes
sensor data directly whereas the offline processes frames submitted to it
via HFI.

One thing I'd like to reason about is if the offline engine would be a
better fit in driver/accel. This RFC solve the engineering problem of
actually getting the ICP to boot and exchanging some data with it.

A putative structure of bot the BPS and IPE appearing as /dev/videoX nodes
in user-space is sketched out and the stastics and parameters the ICP/HFI
expects are included in the drop for reference.

As is obvious YAML is missing, uAPI documentation is missing.

Speaking/listening to several people at the media summit in Nice this year
got me to thinking v4l2 m2m might be a another solution for an offline
engine like this one, with the inline engines fitting into v4l with the
media-graph and the ability to route different sensor/PHY combinations to
different CSI decoders.

This version of the code uses simple-mfd to probe the bus but that is _not_
my intention for a v1 and beyond. There is already code in-flight for
CSIPHY to effectively make sub-nodes probe themselves so please ignore that
part.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git/log/?h=qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots%2Bstats-b4

Here's an example of the ICP log right now on my reference machine:
camss -e csi
[    0.000000] OF: reserved mem: initialized node camera_icp_mem, compatible id shared-dma-pool
[    0.000000] OF: reserved mem: 0x0000000bef000000..0x0000000bffffffff (278528 KiB) map reusable camera_icp_mem
[    0.000000] OF: reserved mem: 0x0000000081f20000..0x0000000081f2ffff (64 KiB) nomap non-reusable usb-ucsi-shared@81f20000
[    1.443825] platform ac01000.icp: Adding to iommu group 5
[    6.665683] camss-icp ac01000.icp: assigned reserved memory node camera_icp_mem
[    6.673517] camss-icp ac01000.icp: clk=ahb
[    6.687251] camss-icp ac01000.icp: clk=core
[    6.704545] camss-icp ac01000.icp: clk=debug_xo
[    6.716389] camss-icp ac01000.icp: clk=gcc_hf_axi
[    6.727918] camss-icp ac01000.icp: clk=gcc_sf_axi
[    6.727919] camss-icp ac01000.icp: clk=cpas_ahb
[    6.727920] camss-icp ac01000.icp: clk=core_ahb
[    6.727921] camss-icp ac01000.icp: clk=cpas_fast_ahb
[    6.742587] camss-icp ac01000.icp: clk=camnoc_axi_rt
[    6.742588] camss-icp ac01000.icp: clk=camnoc_axi_nrt
[    6.742589] camss-icp ac01000.icp: clk=bps_ahb
[    6.742591] camss-icp ac01000.icp: clk=bps_fast_ahb
[    6.754909] camss-icp ac01000.icp: clk=bps
[    6.754911] camss-icp ac01000.icp: clk=cpas_bps
[    6.754912] camss-icp ac01000.icp: clk=ipe_ahb
[    6.754913] camss-icp ac01000.icp: clk=ipe_nps_fast_ahb
[    6.767222] camss-icp ac01000.icp: clk=ipe_pps_fast_ahb
[    6.781681] camss-icp ac01000.icp: clk=ipe_nps
[    6.803558] camss-icp ac01000.icp: clk=ipe_pps
[    6.813041] camss-icp ac01000.icp: clk=cpas_ipe
[    6.827852] camss-icp ac01000.icp: Voting for BW now ahb
[    6.837128] camss-icp ac01000.icp: Voting for BW now hf_0
[    6.871958] camss-icp ac01000.icp: Voting for BW now sf_0
[    6.983317] camss-icp ac01000.icp: Voting for BW now sf_icp
[    6.989219] camss-icp ac01000.icp: HW version: 0x20000000
[    6.994830] camss-icp ac01000.icp: FW memory: phys=0x0x000000008e100000 size=8388608
[    7.012769] camss-icp ac01000.icp: Firmware loaded: qcom/x1e80100/CAMERA_ICP.mdt (7340032 bytes)
[    7.012770] camss-icp ac01000.icp: HFI struct sizes: q_hdr=956 q_tbl_hdr=24 (expect 956, 24)
[    7.012962] camss-icp ac01000.icp: Allocated: vaddr=ffff800085201000 dma_addr=0xfff00000 size=0x100000
[    7.013650] camss-icp ac01000.icp: Allocated: vaddr=ffff800087801000 dma_addr=0xff800000 size=0x700000
[    7.013803] camss-icp ac01000.icp: Allocated: vaddr=ffff800085601000 dma_addr=0xff700000 size=0x100000
[    7.013804] camss-icp ac01000.icp: HFI memory layout:
[    7.013805] camss-icp ac01000.icp:   SHMEM:      dma=0xfff00000 size=0x100000
[    7.013806] camss-icp ac01000.icp:   FwUncached: dma=0xff800000 size=0x700000
[    7.013808] camss-icp ac01000.icp:   QDSS:       dma=0xff700000 size=0x100000
[    7.013810] camss-icp ac01000.icp: QTBL initialized: ver=0xffffffff size=0xb4c
[    7.013811] camss-icp ac01000.icp: Queue headers in QTBL:
[    7.013813] camss-icp ac01000.icp:   Q[0]: status=1 start_addr=0xffb00000 type=0 q_size=262144
[    7.013815] camss-icp ac01000.icp:   Q[1]: status=1 start_addr=0xffc00000 type=1 q_size=262144
[    7.013817] camss-icp ac01000.icp:   Q[2]: status=1 start_addr=0xffd00000 type=2 q_size=262144
[    7.086701] camss-icp ac01000.icp: Firmware ready! version=0x01000100
[    7.098579] camss-icp ac01000.icp: CIRQ after FW init: MASK=0x0 STATUS=0x0
[    7.098581] camss-icp ac01000.icp: GP registers after FW init:
[    7.232986] camss-icp ac01000.icp:   GP0 (unused):        0x00000000
[    7.239586] camss-icp ac01000.icp:   GP1 (FW_VERSION):    0x01000100
[    7.246249] camss-icp ac01000.icp:   GP2 (INIT_REQ):      0x00000001
[    7.252839] camss-icp ac01000.icp:   GP3 (INIT_RESP):     0x00000001
[    7.259434] camss-icp ac01000.icp:   GP4 (SHMEM_PTR):     0xfff00000 (we wrote: 0xfff00000)
[    7.268067] camss-icp ac01000.icp:   GP5 (SHMEM_SIZE):    0x00100000 (we wrote: 0x00100000)
[    7.276691] camss-icp ac01000.icp:   GP6 (QTBL_PTR):      0xffa00000 (we wrote: 0xffa00000)
[    7.285319] camss-icp ac01000.icp:   GP7 (SECHEAP_PTR):   0xff900000 (we wrote: 0xff900000)
[    7.293949] camss-icp ac01000.icp:   GP8 (SECHEAP_SIZE):  0x00100000 (we wrote: 0x00100000)
[    7.302710] camss-icp ac01000.icp:   GP9 (STATUS):        0x023200c3
[    7.309294] camss-icp ac01000.icp:   GP10 (SFR_PTR):      0xffe00000 (we wrote: 0xffe00000)
[    7.317920] camss-icp ac01000.icp:   GP11 (QDSS_IOVA):    0xff700000 (we wrote: 0xff700000)
[    7.326559] camss-icp ac01000.icp:   GP12 (QDSS_SIZE):    0x00100000
[    7.333141] camss-icp ac01000.icp:   GP17 (FWUNCACHED):   0xff800000 (we wrote: 0xff800000)
[    7.341778] camss-icp ac01000.icp:   GP18 (FWUNC_SIZE):   0x00700000 (we wrote: 0x00700000)
[    7.350447] camss-icp ac01000.icp: Starting HFI core init (SYS_INIT command)
[    7.357741] camss-icp ac01000.icp: CMD_Q before: read=0 write=0
[    7.363919] camss-icp ac01000.icp: MSG_Q before: read=0 write=0
[    7.376337] camss-icp ac01000.icp: hdr->type 0x00010001 size 0x00000008 tx:00 00 00 00 00 00 00 00
[    7.385590] camss-icp ac01000.icp: CMD_Q after write: read=0 write=2
[    7.392168] camss-icp ac01000.icp: Raising HOST2ICPINT (CIRQ STATUS before: 0x0)
[    7.399925] camss-icp ac01000.icp: CIRQ STATUS after HOST2ICPINT: 0x0
[    7.430285] camss-icp ac01000.icp: MSG_Q has data (polled): read=0 write=14
[    7.437487] camss-icp ac01000.icp: CMD_Q final: read=2 write=2 (FW consumed: YES)
[    7.445226] camss-icp ac01000.icp: MSG_Q final: read=0 write=14 (FW responded: YES)
[    7.453146] camss-icp ac01000.icp: hdr->type 0x00020001 size 0x00000038 rx:00 00 00 00 01 00 00 00 04 00 00 00 c3 00 32 02 05 09 06 00 00 03 01 01 00 00 00 20 00 00 01 20 02 00 00 20 02 00 00 30 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    7.475216] camss-icp ac01000.icp: Parsed: size=56 type=0x20001 error=0x0 prop_num=0x1
[    7.483406] camss-icp ac01000.icp: Props 04 00 00 00
[    7.483409] camss-icp ac01000.icp: hdr->type 0x00020003 size 0x00000104 rx:08 00 00 00 e9 00 00 00 00 00 00 00 eb ca 70 01 43 49 43 50 5f 46 57 5f 45 20 3a 20 48 46 49 20 20 3a 51 43 5f 49 4d 41 47 45 5f 56 45 52 53 49 4f 4e 5f 53 54 52 49 4e 47 3d 43 49 43 50 2e 46
[    7.483412] camss-icp ac01000.icp: ICP FW [24169195]: CICP_FW_E : HFI  :QC_IMAGE_VERSION_STRING=CICP.FW.5.0-00020,OEM_IMAGE_VERSION_STRING=CRM,BUILD_TIME: Feb  8 2023 03:05:23,CACHE_ENABLED at icphostinterface.c:683 QC_IMAGE_VERSION_STRING=CICP.FW.5.0-00020 OEM_IMAGE_VERSION_STRING=CRM
[    7.483414] camss-icp ac01000.icp: hdr->type 0x00020003 size 0x000000ec rx:08 00 00 00 d1 00 00 00 00 00 00 00 ba 71 71 01 43 49 43 50 5f 46 57 5f 45 20 3a 20 48 46 49 20 20 3a 45 4c 46 20 76 61 72 69 61 6e 74 3a 20 43 41 43 48 45 2d 45 4e 41 42 4c 45 44 3a 54 34 38
[    7.483416] camss-icp ac01000.icp: ICP FW [24211898]: CICP_FW_E : HFI  :ELF variant: CACHE-ENABLED:T480:API_V2:USE_CDM_1_1:T680:TCM_ENABLED: , API version: 0x23200c3 at icphostinterface.c:684 QC_IMAGE_VERSION_STRING=CICP.FW.5.0-00020 OEM_IMAGE_VERSION_STRING=CRM
[    7.483419] camss-icp ac01000.icp: CMD_Q before: read=2 write=2
[    7.483420] camss-icp ac01000.icp: MSG_Q before: read=14 write=14
[    7.483421] camss-icp ac01000.icp: hdr->type 0x00010005 size 0x00000010 tx:be ba fe ca ef be ad de 00 00 00 00 00 00 00 00
[    7.483423] camss-icp ac01000.icp: CMD_Q after write: read=2 write=6
[    7.483425] camss-icp ac01000.icp: Raising HOST2ICPINT (CIRQ STATUS before: 0x0)
[    7.483529] camss-icp ac01000.icp: CIRQ STATUS after HOST2ICPINT: 0x0
[    7.650377] camss-icp ac01000.icp: MSG_Q has data (polled): read=14 write=18
[    7.657677] camss-icp ac01000.icp: CMD_Q final: read=6 write=6 (FW consumed: YES)
[    7.657679] camss-icp ac01000.icp: MSG_Q final: read=14 write=18 (FW responded: YES)
[    7.657680] camss-icp ac01000.icp: hdr->type 0x00020006 size 0x00000010 rx:be ba fe ca ef be ad de 00 f5 b0 76 c9 78 e5 26
[    7.657683] camss-icp ac01000.icp: Ping 0xdeadbeefcafebabe Pong 0xdeadbeefcafebabe
[    7.685850] camss-bps ac2c000.bps: BPS registered as /dev/video18
[    7.702906] camss-icp ac01000.icp: CMD_Q before: read=6 write=6
[    7.711157] camss-icp ac01000.icp: MSG_Q before: read=18 write=18
[    7.717472] camss-icp ac01000.icp: hdr->type 0x01010008 size 0x0000001c tx:01 00 00 00 00 80 4e 03 08 00 ff ff 00 00 00 00 00 00 00 00 00 80 ff ff 00 00 00 00
[    7.732077] camss-icp ac01000.icp: CMD_Q after write: read=6 write=13
[    7.738751] camss-icp ac01000.icp: Raising HOST2ICPINT (CIRQ STATUS before: 0x0)
[    7.746535] camss-icp ac01000.icp: CIRQ STATUS after HOST2ICPINT: 0x0
[    7.770466] camss-icp ac01000.icp: MSG_Q has data (polled): read=18 write=26
[    7.777770] camss-icp ac01000.icp: CMD_Q final: read=13 write=13 (FW consumed: YES)
[    7.785691] camss-icp ac01000.icp: MSG_Q final: read=18 write=26 (FW responded: YES)
[    7.793701] camss-icp ac01000.icp: hdr->type 0x01020008 size 0x00000020 rx:00 00 00 00 98 19 29 00 00 80 4e 03 08 00 ff ff 00 00 00 00 00 00 00 00 00 d5 12 df c1 60 13 01
[    7.809366] camss-icp ac01000.icp: fw_handle = 0x00291998
[    7.815006] camss-icp ac01000.icp: CMD_Q before: read=13 write=13
[    7.815008] camss-icp ac01000.icp: MSG_Q before: read=26 write=26
[    7.815009] camss-icp ac01000.icp: hdr->type 0x0101000a size 0x00000028 tx:04 00 00 00 98 19 29 00 00 80 4e 03 08 00 ff ff 00 00 00 00 00 00 00 00 01 00 00 00 98 19 29 00 00 00 00 00 00 00 00 00
[    7.815011] camss-icp ac01000.icp: CMD_Q after write: read=13 write=23
[    7.815013] camss-icp ac01000.icp: Raising HOST2ICPINT (CIRQ STATUS before: 0x0)
[    7.815116] camss-icp ac01000.icp: CIRQ STATUS after HOST2ICPINT: 0x0
[    7.882581] camss-icp ac01000.icp: MSG_Q has data (polled): read=26 write=33
[    7.891973] camss-icp ac01000.icp: CMD_Q final: read=23 write=23 (FW consumed: YES)
[    7.899895] camss-icp ac01000.icp: MSG_Q final: read=26 write=33 (FW responded: YES)
[    7.907896] camss-icp ac01000.icp: hdr->type 0x00020008 size 0x0000001c rx:ff ff ff ff 03 00 00 00 cc 00 00 00 28 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    7.922501] camss-icp ac01000.icp: ack.hdr.type != HFI_MSG_IPEBPS_ASYNC_DIRECT_ACK
[    7.930419] camss-bps ac2c000.bps: failed to destory handle -71

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
Bryan O'Donoghue (7):
      arm64: dts: qcom: x1e80100: Add ICP/BPS/IPE nodes
      media: qcom: camss: Launch ICP from CAMSS
      media: qcom: camss: qcom-icp: Add minimal ICP driver with HFI infrastrucutre
      media: qcom: camss: qcom-icp: bps: Add initial v4l2 m2m BPS driver
      media: qcom: camss: qcom-icp: ipe: Add initial v4l2 m2m IPE driver
      media: qcom: camss: Switch on ICP and BPS as make options
      media: uapi: qcom-camss-stats-params

 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  250 ++-
 drivers/media/platform/qcom/camss/Kconfig          |   24 +
 drivers/media/platform/qcom/camss/Makefile         |    8 +
 drivers/media/platform/qcom/camss/camss-bps.c      |  684 +++++++
 drivers/media/platform/qcom/camss/camss-bps.h      |   74 +
 drivers/media/platform/qcom/camss/camss-icp-hfi.h  |  534 ++++++
 drivers/media/platform/qcom/camss/camss-icp.c      |  623 ++++++
 drivers/media/platform/qcom/camss/camss-icp.h      |   58 +
 drivers/media/platform/qcom/camss/camss-ipe.c      |  558 ++++++
 drivers/media/platform/qcom/camss/camss-ipe.h      |   69 +
 drivers/media/platform/qcom/camss/camss.c          |   29 +
 .../linux/media/qcom/camss/camss-stats-params.h    | 2022 ++++++++++++++++++++
 12 files changed, 4926 insertions(+), 7 deletions(-)
---
base-commit: ae28dda0ce21b86f8aa1c4456ede819d46eea536
change-id: 20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-b252a7912d4d

Best regards,
--  
Bryan O'Donoghue <bod@kernel.org>


