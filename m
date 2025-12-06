Return-Path: <linux-media+bounces-48352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C91D6CAA39D
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 11:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83BE630F61CC
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 10:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D112F12AD;
	Sat,  6 Dec 2025 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7M4hfjK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8D31D31B9
	for <linux-media@vger.kernel.org>; Sat,  6 Dec 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765015203; cv=none; b=TbhuTb5JJe0w3rVe7J48c9jqkKu4hTebBP706LGwA5+NgIihGOCuxp6duG9kHRYm5kgaaZRNl5cP9tyKyCncZLByDlTIq2i1a7kP9zhsHabGTOn9XXvmln/K6Oo5pbkwrCSUYvDaT5oWnBYahZHSPAyslgCJwYb2Zbx7Q7CZ0vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765015203; c=relaxed/simple;
	bh=/ahlrs1yQ6z3JUaM/Sxqc6wFL/tkbsIVPryicW9j2H8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rOKhSxkIl0fAtm4/Xz0goqCRuPdhqIMKS4pf01+2iZGdNmyeyzlM8aCjeGAh7D4LN/hTSx71egrzSXzLU9We8f+qxSS4CORjhrgl/Ae/QV8TzbXq8H10RXcWq+mVu3xHiq7oBit6iDepNCiGPzVpuJC7FFuIz3vS8H8EBZ2PSVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7M4hfjK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477632b0621so21232675e9.2
        for <linux-media@vger.kernel.org>; Sat, 06 Dec 2025 02:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765015199; x=1765619999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iiDwBzndnl96hSb/q/NLb44uNYBwPkjb4oD5H7teprs=;
        b=O7M4hfjKdTBbWu8pRDsLwWdkLgnlW8YJKLbovNnT7V4xxCdDzOLFgX17+PND7bS7CV
         JoSQWU7GJOHYtXjSJF1nSassHFe7W7KFmamNN0iB7XbIBF54DR5wdT+D/GgfwMgZQk1R
         BLeLEv1uAPQ84Xhl+zJUcC3iCkhzdqv9w8pGQGAQksy8kPIYN/m5QGqidD/8EUnyvach
         a+yQrHEpH7sGvphgGOBO64AVe6Q0Mm6HtsKA2U8EM9ztw2v8cf6R4fzFUlqR1T4x9X1d
         Z8yhx9DX+paalacbXiGO+HoUnDrZNkcIDoaIPIr4tHr5BbVUc7EQQ4coJTdtWHeHgEVA
         JmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765015199; x=1765619999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiDwBzndnl96hSb/q/NLb44uNYBwPkjb4oD5H7teprs=;
        b=Hza6C+6flmQXt9DYFJPLJtsxSHqSwlRwskD+d5OaxV7/miCYFqSTq4NVEqeFskU69M
         uzRhuTFGctXqz6QUdI/jU2rgQ88dD9YSF3Sc+u1wB+NunbKwUTWSK7g6nsNNf/7K9H7D
         GSOAkcAd/de15ooB8rjNZBVNwQI7Ha7ucrE2y7+6yotylmfeWzHI7EtTzfjoD7tdM417
         0JMGWQLKq5MMa4fKaau72cWzLoG1RzW1YASN+bbEe3Hza9460j99QLsEZUsysg//G45v
         G63q4N2pv/9AkDXLriLDIlJ/6Rs9DSJ/viDNoSXtxHDK/C6FeSDpwA7eyynv7fjQqBaq
         0RxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJqTpypCeuzf3mpClyv+xxfi+m4aDYMutP2M3i0Cffb5iv79tOYHUONJSLG70OPkwwSEH3vK5spQ9zEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx529qSpd1xQjn90DDibDTYqWVcyORwujCsrpbAPnZObv1nqCR6
	FFA3rQBCuwLFiuGT6oeyndMN6KRZD/N4h2S+rUel1Ks3B+EXEIpuHg6NYj2Y1h/fa7k=
X-Gm-Gg: ASbGncskLKGwdxoQfENc6Z3tAy9qbFifGNCO2WIgjyPBQ5upUaJJX1HTSucbv1naGnP
	SaETpNzR8z3llLLKUZN0AuJ0C8+BnrpZATXwJttREI/ak2n5/y2XT/IiT2p7E4oiZ26BXjPvFiC
	IKscLgGnl3hJEVnexsMvsZlrFuG9Cz5MKzaoMySsOkspCZzEbGCrI056HTmh0lRndGEaRdDuM3+
	1TsSlS6931fyVVPjcQRE4iYszzB2BTcmlTW5Lpe6SjDYWglc2A3CHQaXS5tqD+pWOYt09z2r+Bz
	KigyRHNQwP55c0clpCnAigOXVHzTlThPbraHXmgcpXImIovgsAPlCZyrTqhqSnicu/ujbswgzI4
	w0qy6eXJ4vOrqMJsn2j6sizIsTK2G39IpQjGwF5sOprMONDFoXMVHQffg8EhBrITY0NYM6JJdJQ
	7hByBC0N3mU8AWu1HhvfjR4laMmA==
X-Google-Smtp-Source: AGHT+IHCCSKpPzDS66jMH4ALE7X9BZR5z4AUj5KRqSpHUrEc/DwbowSb3EPWCQS5cwLW9Z47DlGV3A==
X-Received: by 2002:a05:600c:1c0c:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-47939dfa46dmr19757195e9.11.1765009694011;
        Sat, 06 Dec 2025 00:28:14 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6d9dsm123094705e9.2.2025.12.06.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 00:28:13 -0800 (PST)
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
Date: Sat,  6 Dec 2025 08:28:05 +0000
Message-Id: <20251206082809.2040679-1-christianshewitt@gmail.com>
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


