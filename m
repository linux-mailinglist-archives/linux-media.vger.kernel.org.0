Return-Path: <linux-media+bounces-49511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B85CDD1A2
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 23:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79D7E301DBBC
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 22:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A2E29D287;
	Wed, 24 Dec 2025 22:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoCwg+UP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2771D6DB5
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 22:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766613615; cv=none; b=E0MmuAi1Hd2IohibucnQt2Uc5jH4sQ6Ifq3l1NvMeJRG0tJXRWw7B+H4RffUsD0TIPlTT22DaKHBhVWejOjNPl2upmKceBvOWVoM4V/uc0GjCbKlU3mwFzfUpBszbUGjXs7I/kKNngs6m3uCjXSihSFdDiSOGd8bZHDfiyHERck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766613615; c=relaxed/simple;
	bh=lTzHgt2dP+FAADKvgSdKKeUJHcUUMW7u9Qq3+pqNE/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c3MbPGO7WhPtC5Bo0XnNhARXDqeA8aMrQokJ00F9j7QqdcIeD86pj3sCiuvuJfR1siJnDG33wPtxzZFLqUIkwsXdINk329AXR0kjkQNiy5JEmOa0ffoCj1JLlXe12nKElXZc94joci6qWG1X8Uajf0YxPprf3T/h81r4Qgfhjm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoCwg+UP; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c13771b2cf9so5299034a12.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 14:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766613613; x=1767218413; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JOx7OI94a8zNv6mkfOrWrisafdhGI21lh68KgBCdS9I=;
        b=LoCwg+UP3QwTaiAi2cJycOjsNjhPBxArwM7U/pUdeBGhHIqLj9D3cXAzHkCUKbxrzP
         rxhZMz+Svmns208e/X+PEsUJ01tDtjxGl9iSey9zp7ODl17vao7IFwnsjH8MJQW5wEK9
         fdcvTMqre81bBYJZ1s9RH4sLMUSnzkJCG+YcedVBLX+2bob45ifPMrxRvw2aibTnJNkU
         e/s2iC4ArJmYvRs8tPc/rA1CZQaCK79hsE51QuXBzqsZKHXYyayw9uOdPL1MQYDJMgg1
         q95qVP/PRnI1TscHimdldDWFZWXeQN9YUgHo10BkhmqKalT4JIP+5uIAIZme/llMJ1ed
         Y/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766613613; x=1767218413;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOx7OI94a8zNv6mkfOrWrisafdhGI21lh68KgBCdS9I=;
        b=wDrFQf9ZrAuKjOZJ+JLnpU2bAQcIQIiWYkOn0mfl2RO0MJJM5KHApkR9Z4WCPhNsC6
         l6c4V/nlfBpbGTyokfMFB6HGwieK6dD4ItwhQ5VilSPUOVd3qRHttkycI1ghNTgSOzBV
         NkMzniMMKt8OLic0k+VZ6PYyEbG4/qG2WeDg3yvKU7WEk3r4ZtzZNBKU/mUbJvSCfxjZ
         FF8/wyg2vfwr6ORzXyY+C8DWCuhI3BveMpkfvQZp7+ZSmIOkANLoQBYaBW3eaQ74dEin
         gTqUUfKe2jt/qiUuk0mMYpAZQ9SiHrcR5WTKi4zzLv2G3X4/N9NJolkWPemmFHqVRiMu
         N4Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVTUPmbMZCleVvEJaI80bc6zYJkE/xa24enRoGLnO89oDS1l4whQMfutN1CkOyM6jY9O4/dEFQN4fSVZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRNZVqsc+Ic7iSVnjte83aaSQlgnmuE8lf7A76Lkqnn7kMjfua
	AMk1DolyDtPuXGCFQxIbNtaySALxA0dhxpYzjERMPgjOETftzrj/9nDm
X-Gm-Gg: AY/fxX4+Zmzm3Cr5VxSRZOgWSdGJSvlJvlKC2IARUh3vAtVTxvRqMpEKN1BaTvDHOvt
	6MJCHaoT+oW+N7Dl2sybP1himBBrlhcvROJAdbtRCQfbzEtpjbs7PBAmsgfX6LyHLIKDq7lO4vw
	M56FpG2UPchsUBSBBN/Gdf7pcRXau32t2Oj2l5jnMFsRawScPEUDQhY2s+HqDR5sufg9JeARZwZ
	JfIlGQLlYnQ97Cx1aw9x2llpSKoBsJjVzuhqGWmTRrUmPnqMGTxehIYbDEGHRO2mK++S0TukQ9B
	oUxPgN28flOp2F9FhRXB9jfO39VA67NyjGS8ynI9lvRNE0jXgrvfq9sxbgJlRKSw6q2tY8RaU5X
	1GAlCniWz11FszYjMHvqF9zPCuHBB269Ujy+6eELavBXobiuY1O+bs3xql4zweLJDuD2lroIfoM
	PbUZ7yEmReNNd0/Sg6Q62YIw==
X-Google-Smtp-Source: AGHT+IHcJ9YX7/vbKvd1DTvDt4x1SCf4fmNYgRW5Ft2pvYLXa1mJWJxx1uYTmto2kAsZOR2MooNtZw==
X-Received: by 2002:a05:7300:fa18:b0:2ae:546a:f2c3 with SMTP id 5a478bee46e88-2b05eb7d6b3mr15755485eec.3.1766613613123;
        Wed, 24 Dec 2025 14:00:13 -0800 (PST)
Received: from [192.168.5.77] ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ff8634csm46610293eec.3.2025.12.24.14.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 14:00:12 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v2 0/2] Convert et8ek8 and omap3isp bindings to DT schema
Date: Wed, 24 Dec 2025 13:59:57 -0800
Message-Id: <20251224-dt-bindings-et8ek8-omap3isp-v2-0-0728cc1fee27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1iTGkC/x3MwQqDMAwA0F+RnBdY4zrFXxke6pppEGtpigjSf
 7fs+C7vAuUkrDA0FyQ+RGUPFfRo4Lu4MDOKrwZ6kjVEBn3GSYKXMCty7nntcd9cbEUjkrP+zS/
 TmamDOsTEPzn/+2cs5QbaYhwIbQAAAA==
X-Change-ID: 20251221-dt-bindings-et8ek8-omap3isp-2a5d6e4171b7
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alex Tran <alex.t.tran@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1500; i=alex.t.tran@gmail.com;
 h=from:subject:message-id; bh=lTzHgt2dP+FAADKvgSdKKeUJHcUUMW7u9Qq3+pqNE/Y=;
 b=owEBbQKS/ZANAwAKAXT5fTREJs3IAcsmYgBpTGJrRqA3Oyl9w5gWZx9WNeqNeH7aXxTIh/uxW
 BD4R67Cvl2JAjMEAAEKAB0WIQQAohViG04SVxUVrcd0+X00RCbNyAUCaUxiawAKCRB0+X00RCbN
 yI/bD/99m+9DvwNp9UiwppuoAGeeLC/AgXN7ffWBFTVcxEbtwfyZHRZvU19yws/+XpgslUjp20J
 zdTjzJ2gDuMZt8hgrb6JqSFE18p9pe+fTkJN5AVIIfPKNPxVvzbFZgn1vZoN3mmleUfPrij15NB
 rzXJ0ARwqZTpnRJpM10RG72YhNKqfN+jgcSdW/o5uYu1J9ggimLfz08OztV88l1A8zClHLGKeLP
 mn8fgrDU2c1ff0vuY6Q2cHdjx/xXYjWa1O0lYylenmcVV80+B30lp2DFs4nuWR5mPvSziJ1R6Nz
 NqfAxCW8XQsEIFNdYK0jXBn9jydhe2nT5KRj5iPDSu054iJ5EB4nQTqSems4rTUJIvBFE1CyXZ8
 hC3hbedTSI6bzVyfkLd4CoTrhzDX87sgtRhrz822YPnTlo7sV+1Pf/GETEJXI6lPnEy2UtwrcOt
 seF38exJ8OqXsRWxEXeKs5myPzIVTmCjNxXtqp3ZgoDnat1lgHMWjS5cCpu4IJh/bWOIVxAkMnO
 byM/9YCIypEOltsS2/ZNhl4dkj8ZqWWQzhAR3MtkcmoajeJYemWoHPbhdGyM0vACIyjil1YpEYW
 OwMO72PdxamFGeQxdLy8CY93Cf0wfyg4XsPSvOs359tmx2WhY5aMFwyoxp8WtYP/oWXa+hv2pSb
 eSUkivypS9/J7Ag==
X-Developer-Key: i=alex.t.tran@gmail.com; a=openpgp;
 fpr=00A215621B4E12571515ADC774F97D344426CDC8

This patch series converts the dt-bindings for media components
toshiba,et8ek8 and ti,omap3isp from the TXT to YAML schema.

The series is composed of:
Patch 1: Converts the Toshiba ET8EK8 sensor binding and updates
the MAINTAINERS file under the NOKIA N900 CAMERA SUPPORT accordingly.
Patch 2: Converts the TI OMAP 3 ISP binding.

Changes in v2:
- Dropped obvious et8ek8 clocks description.
- lens-focus and flash-leds: fixed schema reference to
  video-interface-devices.yaml using allOf.
- Dropped pointless et8ek8 remote-endpoint property.
- Dropped obvious omap3isp interrupts/iommus description.
- Removed standard property omap3isp descriptions.
- Completed examples for et8ek8 and omap3isp.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
Alex Tran (2):
      media: dt-bindings: i2c: toshiba,et8ek8: Convert to DT schema
      media: dt-bindings: ti,omap3isp: Convert to DT schema

 .../bindings/media/i2c/toshiba,et8ek8.txt          |  55 ------
 .../bindings/media/i2c/toshiba,et8ek8.yaml         |  88 ++++++++++
 .../devicetree/bindings/media/ti,omap3isp.txt      |  71 --------
 .../devicetree/bindings/media/ti,omap3isp.yaml     | 189 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 5 files changed, 278 insertions(+), 126 deletions(-)
---
base-commit: fa084c35afa13ab07a860ef0936cd987f9aa0460
change-id: 20251221-dt-bindings-et8ek8-omap3isp-2a5d6e4171b7

Best regards,
-- 
Alex Tran <alex.t.tran@gmail.com>


