Return-Path: <linux-media+bounces-48354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 222F0CAA561
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 12:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09CAC317B37D
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 11:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313B721D3C0;
	Sat,  6 Dec 2025 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLvpQ0TI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEE13B8D70
	for <linux-media@vger.kernel.org>; Sat,  6 Dec 2025 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765020819; cv=none; b=tTmRJlFH2gJKbbD5zGxwh0Rbq0V6zYBQG+EIRm75Ru6WbvouUOVkyjmGErlRGtFMZUcaopiwL/em1EsRIkqNzg6QDyXnlwWjFDef/OoSwkjXDtTU2TTqBAwTlGWfi0fONMA77VVl9iBq8lhJ/w1Gm8e1wnWXoEenxal4zchrj60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765020819; c=relaxed/simple;
	bh=/ahlrs1yQ6z3JUaM/Sxqc6wFL/tkbsIVPryicW9j2H8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mzsvtT42e8+ZTbCimtF1pjq4en3GRmVNwNgpZmsp7ALfA6bV2vamc5BaFEoL1iyMx0n8F4/OaN7V4yNfqOc0phxz7nsobRPk6wp73Eipgq971PEUE50LYRR0Rz42eREK5kAFWroDPP3szxKV9m2fk8p/3KTMBTgE/V0Aq0CIPNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLvpQ0TI; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7370698a8eso397812766b.0
        for <linux-media@vger.kernel.org>; Sat, 06 Dec 2025 03:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765020816; x=1765625616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iiDwBzndnl96hSb/q/NLb44uNYBwPkjb4oD5H7teprs=;
        b=kLvpQ0TIBqjaVm8wk1Ik1pOB9RZWdPBm1VbyGjltJVAUsPq6+CAnGwLiFT7nrYK7u0
         E5B5c2u7N5FBeOKFvgDcToMy8H/Yt4aNvxmbAAVLIByDxQMgQCWNOPTvVDpti74c3zGq
         1nwygkkGalOZMQBKItPVfFjCBGejgWXobpd0rLVE460Yy6xn6VKmyxrcNRyvaS2mFhXB
         UMQ+xlfwx5Gp+l8FrD+C74NR/sJSgxGIcaO8YWrZ169h9Po732IwuSVspqs78K9fpLDe
         EHll45/YQu0+cDXe5mR0pv/JsJuOLxcBR2dK3PkV1PTLjwpiWn483FTl3Dep+bvWw5Uu
         YUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020816; x=1765625616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiDwBzndnl96hSb/q/NLb44uNYBwPkjb4oD5H7teprs=;
        b=AiQc+fTdljJ/FPGaXyX4wEqGYh/hSlq4JnPiq+QtoJl8mo/Q+OAAAcF9fAIPFQtNX5
         SWQfLfCNXdArml+XCdnfZcOXkBcMlsfCD6JhuXMPZ3Bh54rM0rvF2oGQiZnCQG20ubhX
         HQomCFKITAIffP0EzYmzHkQ5sViVHa18TM+Py/SujdsNlXkTMz8mtUszIvluIuU8KLNN
         k2NiI1ktmlYLumXGSd9X/FXFN1uK2oT0Cshcw83PSfPa12+wOHy7w4/LAhkMvbBm6zeD
         4yaz1BuMNXNZwudka3TaEhHIGV0N7fDxBtHZyzlWxN6uJ6NB0zRozwg/aUxQXKAySiwe
         hZrw==
X-Forwarded-Encrypted: i=1; AJvYcCVgixhznLDkbchOzT8un+KpTFlb5jTdo0c2O6ox2ds3sKkO0KwiZSFdKZda530SQ8BsJ9YU5jXbGlydsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxO3dRlQInfAKMXVPH3ExuJ8pWQDWxvi/QGQ1H1LKi+Bv8FMli
	jFpZb2ICKAtK7W9kP98KhSikj5P1tOpaOGdjoiuC6p0Aa+k1PogGCkDzpvhjKdu0NM4=
X-Gm-Gg: ASbGncsiVlD0gZy2B/pCscd1Xg6w8bjnnU/PMA9y5CGKHHhLXfAyGe1EaYfU8XvE6sz
	UeFiOf/RKdmDEYgDEP7k8x7lBCc+aXhSxypRz9NKmt70YN8j80TzoemfpFOscxPPunp3KZ+sLB8
	r5K+ISt5udOf27202v1uVTDIYzLmWu6B+Wo9W9OmQlsH5xLirURjJ0MyPzb5+VIoc1P+oiu26hA
	p/bK6fylcinYHt89gCy836rhCNgR/JHNCWmnWEFJQu3zBRkW92ycDf2FWU/DeSh9MJgMla4jWnE
	5q74xtQoPh3hAo8N15bGK/PVmsZJbTBU6t2oCpyOk2MtHM65hl2+p4QEHwEiEg5S0Eo1ftdroGW
	tOGqnzz8FB5t/KzC28X5GBzMqIf/lomiY2HIEjBhGK8xqjl4msKWdSv/+sI5ErbhIic7zhZs1ws
	8H8hB/fQR7zIJwFe4=
X-Google-Smtp-Source: AGHT+IEutgnW3ziDYssPsy/rObFW3KXEtxwegCsIX+tFKBiL4raHPJrNmS+xnXzqQl+ZEEwHsCOK3Q==
X-Received: by 2002:a05:600c:354d:b0:46d:ba6d:65bb with SMTP id 5b1f17b1804b1-47939e4a8e3mr22685325e9.31.1765015323917;
        Sat, 06 Dec 2025 02:02:03 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310c802bsm126055205e9.6.2025.12.06.02.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 02:02:03 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	=?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: rockchip: rkvdec: add support for the VDPU346 variant
Date: Sat,  6 Dec 2025 10:01:57 +0000
Message-Id: <20251206100158.2041439-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series depends upon Detlev Casanova's current v5 series for VDPU381 and
VDPU383 support [0]. Patch 1 is marked DO-NOT-MERGE as it contains fixups
for minor nits spotted in Detlev's series. I've flagged them on IRC after v2
but the messages may have been missed as they are still present in v5.

Patches 2/3/4 add support for the VDPU346 IP block used for H264, HEVC and
(in future work) VP9 on the RK356X boards. VDPU346 appears to be a close
relation to VDPU381 used with RK3588, except with a single core, output
limited to 4K, and minor feature differences, e.g. HEVC level 5.1 on VDPU346
vs 6.1 on VDPU381. To handle differences we declare a new compatible.

The device-tree changes are derived from prior-art in Detlev's patches for
RK3576 and RK3588, the vendor kernel [1], and some earlier patch attempts
from Piotr Oniszczuk and Diederik de Haas.

The register differences between VDPU346 and VDPU381 appear to be minimal so
we currently and intentionally reuse the VDPU381 h264, hevc, and regs files
to avoid duplicating code. If further register analysis requires separate
files for VDPU346 the refactoring to Detlev's drivers is a little beyond my
current beginner level c skills. As the overall minor changeset to VDPU381
it would be awesome if this series could be absorbed. I had some discussion
with Olivier Crête during VideoLan Dev Days last month that suggested this
might be possible? - hence sending now. If not, I'll wait until Detlev's
series has been merged before sending a next iteration of these patches.

Testing with Jellyfish files of varying bitrates shows that RK356X starts
to experience jerky playback above 10mbps, which seems rather low compared
to RK3588 which can play 300mbps media without issues. The vendor kernel
documents 'advanced' assigned-clock-rates but increasing them does not have
any obvious impact so the difference looks to be something deeper. NB: The
same is also seen with Detlev's patches for RK3576 (max 15mpbs) so further
or follow-up work is likely required. Despite the apparent limitation real-
world media from my collection plays well.

[0] https://patchwork.kernel.org/project/linux-rockchip/list/?series=1015221
[1] https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot/dts/rockchip/rk356x.dtsi#L1539

Christian Hewitt (4):
  media: rkvdec: minor fixes for current DETLEV patches
  media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
  media: rkvdec: Add support for the VDPU346 variant
  arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X

 .../bindings/media/rockchip,vdec.yaml         |   2 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 ++++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     |   4 +-
 .../rockchip/rkvdec/rkvdec-vdpu383-hevc.c     |   6 +-
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 110 ++++++++++++++++++
 5 files changed, 166 insertions(+), 5 deletions(-)

-- 
2.34.1


