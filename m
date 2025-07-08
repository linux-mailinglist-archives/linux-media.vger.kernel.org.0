Return-Path: <linux-media+bounces-37078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 185B8AFC7E6
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 015EC5628B9
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5F026A084;
	Tue,  8 Jul 2025 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lq4daCdl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF472690ED;
	Tue,  8 Jul 2025 10:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969215; cv=none; b=aUb4z+pUj/84l/drKGyotRGAnsMEMhq5MrWLyn/ZFRZWwA1va1shTQwK8tOjzr6hyBMXBSiMNZisHkdYYdvEmWaRT0UcyeB8HUkLM/mmbbp/Q0wNkMBFKbk99uDXe86Yd+yraA7GpDHips3KyMkN4296nia+C3QnqYA6K6YkbSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969215; c=relaxed/simple;
	bh=GmvU9NQ3n+xafVmKhQUmC4ekaryDnjcVV4VE5S+KF8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hX6OXeDVbJqtkBwKnZW9Fl1ZqE9obR1pCmp6ddw5MZ5g6tyykC5hwmXOpNmbJhj071P/yAHoec2QICZPTcc5459qKSEtp6Kv/kYLuO0Itt8oy+OYBcX/0Dv6ey90tLucPkBXK8P6FGQgrVGf8cq237MvepmRTx1TJ7xFSmVnLg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lq4daCdl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74264d1832eso4928841b3a.0;
        Tue, 08 Jul 2025 03:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751969213; x=1752574013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FidiboXZ0gzp0Kec1LGu7nNmgcY3DYoC/ILAAPmTqbA=;
        b=Lq4daCdlhOe0CKgq/2Y08Bb8KrrAalwQvBBEjamiybyhwzsp/fPcsrBiVE7H7uUw+1
         eh5afGm+yDVEN9A37Rgk86fkjYhBbmfEgo2UH4wUId/8h8ACmE5+23PV2JxuFcdy38+i
         kqPsMD7qX3c02RlL964Og/QPwz3TzaRiWaF7VPO5ZOSnZxGXvolLyYqVyCdpPpUJI13Z
         1zW1DUo1gT0Wncip/Bt1j+45UWy7tsDvD0K7JcHHImxWrRwupDDGumrP1XwIFfmpZJ8U
         lThxtKsIqQP1HlsuMI+TBbDDx7VlWfNU7GwDia6hDbqLkH8xUgmuxdRpVUvtnvAnpxFW
         XtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969213; x=1752574013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FidiboXZ0gzp0Kec1LGu7nNmgcY3DYoC/ILAAPmTqbA=;
        b=F+W8whlotsvVDZs8dWTiw/MJKveMQKLl8A1qkNGb1pp23DXtPMO7GE+Mo+kMX035D7
         sQORCswDYmAvzcayI4l3/wdtXHbaR9tw+3Jy3n2ouwB8XPa0A9f8wXdy2pJoXiq0dB5O
         ahPl703QJSTe87lram3Sh0H9g6Ux3BufX6C5j9w6Cfory/PI44XOE9Rqvv9XGJCoZtji
         SlO1cbhN7qqvU4DBWFDrTHme4l51YMVcdHnNTAnAbjlKUrfdX5q8nPBMTNc971EpR+qP
         dy17sJLV7TpKl8E1R1kxEIJumRVJNX5A8TI+3evGBbpLfz22t0CLoN9kEjLzplA78jRj
         ELRA==
X-Forwarded-Encrypted: i=1; AJvYcCWPQzlgnQ8OWuNPJu00DLYtAPtvCvCluSttQKMOJ4wlGafAwBKE/PVZQKfgsKpIo+4b/pc5JShYW4SbpfA=@vger.kernel.org, AJvYcCWedGk9wngiCAVdb+s8az86ZUBO3nqwEvMYSrGlBMU6/WIBSvRxWY1B/1/lyIi0RW/n2kFt4uVsI5f/RF0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf/XDxXyapKbJ6AZ4tmBXajfTFea8dKipnBQaAdnGXgg+qmfsP
	WQSbfI/HeJL6V6ZPHDTdSTNubPG94E622zAdUckYOjLGji2LS+VT4HK4
X-Gm-Gg: ASbGncu/depDLo06qkBSJPLXj2rXcAtfzmZ+e0PfVhUEX6lDTfwSxmEgfAxXmg94VSa
	Hbljsi5psaYAmcStCUy3q10Ywcr12In3FOhuVsB+0anl+WOBCWnT/IYDbrfN+4t64TyYevG52DI
	7gUY92sWANRV+GW9cJXjuhP0EUvuBOGzks27ZX57r12lb3q+gwUznDt9pWUFDOS/xVBudUHSYHm
	Gx8a36iKfyWGelMhSqUTv59Vh4ETV6yugOtCGR9F4AMRCzF+B/V6YQI0tsqgHmNfOF2eym9n0Zv
	Sxmzi1M2KqcvEFaNRRQU9TfrLEg5eWw/2pU9EYJxF819PJVpTUs3+8u1trz8WGfTxLOWLodzpd8
	QCsQ7p0y4LlQfA3U=
X-Google-Smtp-Source: AGHT+IFewpzclZyxnesMZaRtcMFIElw0zsDq9OvoX0V/pR5YCz8QEjnGaDAHYbxR8XFtrnVwHMlIag==
X-Received: by 2002:a05:6a20:3d1a:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-2260a0a3749mr26243533637.7.1751969213190;
        Tue, 08 Jul 2025 03:06:53 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce359ecd6sm11971174b3a.24.2025.07.08.03.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:06:52 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 08 Jul 2025 18:06:44 +0800
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Mayqueen name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-drm-v1-1-45055fdadc8a@gmail.com>
References: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
In-Reply-To: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751969205; l=911;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=7tai5uwBpFBvYaeY6h5Abr0Rx7uTXpN3nWfu/5kwtvM=;
 b=cKOZVPExWQWMyRJmZn0BRm+70Xfoj0yzcb6DNgi9bG1oPFup6NuwxO49KkRqvjhl4zWswSS4g
 vSX+gLvS9GXAbmFzUuazjZryr0Rjz/8wi5+DwzETSoIBh99pd+6B9fO
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

From: Wig Cheng <onlywig@gmail.com>

Mayqueen is a Taiwan-based company primarily focused on the development
of arm64 development boards and e-paper displays.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..9207c25a3490a3aa5cc9d513290e7890799f92cf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -916,6 +916,8 @@ patternProperties:
     description: Maxim Integrated Products
   "^maxlinear,.*":
     description: MaxLinear Inc.
+  "^mayqueen,.*":
+    description: Mayqueen Technologies Ltd.
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":

-- 
2.34.1


