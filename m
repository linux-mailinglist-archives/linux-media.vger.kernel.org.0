Return-Path: <linux-media+bounces-50333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2697DD0CFEF
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 06:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDBA5301E6D7
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 05:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9313339875;
	Sat, 10 Jan 2026 05:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miWNr5X3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA42E1DF736
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 05:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768023456; cv=none; b=XrdKj2qI9olS05dplKjcSIwaLhR40n0L6SdTlV+t3Im4rFWk6lkjK0TE/AfOSsf43K/LTpJYhSgO2DpWoRAM89q8HzqdTPEBibrb3T0hjnmgcgBwcZhcKEWt8ZaZ+sIlmTmOwh+3Z0veUVfBzo0eeaujcPmsFI5qZdtzmymQelI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768023456; c=relaxed/simple;
	bh=QLtKh+o8/G8BkiH9eRjhcOPjp9Rddq0NDb7LhSQ/O8g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DeNYYIGPbFzAzS49Ytpa387s3nA+S0isdHHrc//lMrd+5pmMrHjsJlitqaBb0mLf/dp4eq4/Jsc8Zp7WN8JUeEr6quo8SmxGR9o+HWcIXm/IpWeaaCwG2PBbIjf0pXxs5VqvqjBHUdq0phIUAsUrKZGc7Q+Igp5HJD9R0xxaDNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miWNr5X3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-430fbb6012bso3675305f8f.1
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 21:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768023453; x=1768628253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1cLpdxtlbi2JaCKFB9k+hFNl0clCCKVFpwvaiNr7xQ=;
        b=miWNr5X3XsSY881V1XR8XAg4AL4aHPQmDyI+2jZ4aaln8RdF6Dy0K+NYHhrgS50vw7
         gehM3koqOAV3vAcba4SGVpRYDfsHhn5/xdZLaCEdZMhJJR16vesi0xkFlILm3gOWsSxx
         LhK8u61AvH29D+8fJG6evTPER61o8noYWdB0gVBcqLeQ7GRk4kGvO9p9Y8cNfzMTbFaR
         MXesqnn8TnmXLK6FRdbo52wFyo4dlg0BQxYLLnVa33CZo8104f9YNDRckZ8Hj+P9bYOm
         7w/PLjr8cc5dHgCr5BE1GYrxFIkKGT4id6M0EpvO0VyuuvmtLCgibT+eisK1p7WxYuxc
         u1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768023453; x=1768628253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1cLpdxtlbi2JaCKFB9k+hFNl0clCCKVFpwvaiNr7xQ=;
        b=CmVeLFidM+jA1H2x5PLKfpZN5YHd1A0uD0Yz+Y8O2PlzY6q9r9XwWDqDCS/7/ytKFy
         9QnMbyuuv7lvUNA+FXpn7JeSJZat6si1Z5bAhDXfWO+n38pLyj1dgIb+XJ5ReXRXITsA
         etcr/VyGSRQQsimFhrWZotfmnQXlIRDdSDF0dN+zbxFTDzXNR0fY4kzPPAgDXxM2r017
         PuMP4c5OkurCN9LCypzMQWdlhTJPYrpJsBFiN8vbe4ZpWPeUyuwaA6Hod8sSn+YBAYJ3
         CAqaIIl4hfxly/k9xq7FLSJyY2hmmUTh07/32aND8io4fNSuzzgtPt3+0nOsLeKFThCE
         sVRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtQ7EqvM9hX1AS2WwGd+1nwRLx1cevR5tncygabVWDkkKkTKEJduMcOWiPQ7F/0rFmNcnVRsyD4JkdiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLjovzN5gWmIQFFL6CeySR46mwHEl3hFizrMrPzSankCbkZkv4
	Q7DknxCh95i8NVa1xg2Z6GTXSEhGzmH1lnxdZa2Dk6XeerUfwS41o19U
X-Gm-Gg: AY/fxX56aS7iMcBVMk+2zY/2Ox3RBc13qIMpajlLhi3xqskIgt0ovyZBV9QfwxGVtQy
	axZvMl/M7QZSSAM8B3CDj6eDecHYu1HwWc+be4QM8m2usvXxIcmhHCUK8gfilNR+ismHVuX2oie
	rEIbNOZag6+NcN6FiW5BnMKpHvEbBnOD+/K0gw4qEiOmGMPMnYF5EDUzlIv9VDHqkbBnrCWpMpz
	uEfvY5GmFOrNEgqVJtQMkLEL4adXcMxRgfHJ8Yb5TG0nmFCY9+7ismhMNsG864aOKJa3s1tFK3D
	bYDdrFqcZEdRYWSwTCPJmQwn+j9xeo2kM5WdZnMGRUIkGROE0KrNblxEIdvKi0nNkIBiKero5f7
	QdVtEUkAs7NUq5Sa6HhFWik3APq/tOShcVFPaXR7Yc/ZxCXWRzTzXCh3Q3ak8sGYIxKUyhkKT0A
	/SJAflHCNOIJdqmLU=
X-Google-Smtp-Source: AGHT+IHqz2oFkcgw1N0DW7nQfkfUSHeBgK9Y/qbS9vSjvgU/OqcgBea5+ijbS7zgou3BC4qfPLuZbA==
X-Received: by 2002:a05:6000:420c:b0:42f:bad7:af76 with SMTP id ffacd0b85a97d-432c3775a39mr15366785f8f.15.1768023453015;
        Fri, 09 Jan 2026 21:37:33 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dadcfsm25973825f8f.3.2026.01.09.21.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:37:32 -0800 (PST)
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
Subject: [PATCH v3 0/3] media: rockchip: rkvdec: add support for the VDPU346 variant
Date: Sat, 10 Jan 2026 05:37:24 +0000
Message-ID: <20260110053727.2295260-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series depends upon Detlev Casanova's current v8 series for VDPU381 and
VDPU383 support [0]. It adds support for the VDPU346 IP block used for H264,
HEVC and (in active work) VP9 on the RK356X boards. VDPU346 appears to be a
close relation to VDPU381 used with RK3588, except with a single core, output
limited to 4K, and minor feature differences, e.g. HEVC level 5.1 on VDPU346
vs 6.1 on VDPU381. To handle differences we declare a new compatible.

The device-tree changes are derived from prior-art in Detlev's patches for
RK3576 and RK3588, the vendor kernel [1], and some earlier patch attempts
from Piotr Oniszczuk and Diederik de Haas.

The register differences between VDPU346 and VDPU381 appear to be minimal so
we currently and intentionally reuse the VDPU381 h264, hevc, and regs files
to avoid duplicating code. There is some evidence of buffer size changes in
testing which still need to be explored. If further register analysis needs
separate files for VDPU346 the refactoring will be beyond my current n00b
coding skills and I will either need some coaching or would be happy to pass
the series over to a more experienced developer.

NB: Testing with the v1 series showed lower mbps bitrate performance. This
appears to be resolved though it's unclear to me whether this results from
kernel changes or the ongoing reworking of ffmpeg v4l2_request support [2].
However with my current Linux 6.19-rc4 test branch [3] I'm now able to play
Jellyfish H264 and HEVC test media over 100mbps.

Changes since v2:
- Use correct .max_width/.max_height from TRM (Diederik De Haas)
- Add Tested-by from Dang Huynh

Changes since v1:
- Drop DO-NOT-MERGE patch as changes included in Detvlev v7 series
- Adapt to variant/capability changes in Detlev's v7 series
- Add bindings ack from Rob
- Add rkvdec ack from Nicolas
- Rebase against Linux 6.19-rc2

[0] https://patchwork.kernel.org/project/linux-rockchip/list/?series=1040540
[1] https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot/dts/rockchip/rk356x.dtsi#L1539
[2] https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3
[3] https://github.com/chewitt/linux/commits/rockchip-6.19.y

Christian Hewitt (3):
  media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
  media: rkvdec: Add support for the VDPU346 variant
  arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X

 .../bindings/media/rockchip,vdec.yaml         |   2 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 +++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
 3 files changed, 154 insertions(+)

-- 
2.43.0

