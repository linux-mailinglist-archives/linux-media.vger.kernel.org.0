Return-Path: <linux-media+bounces-24333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F407A03D02
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 11:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC1871886231
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 10:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06F01EBA0C;
	Tue,  7 Jan 2025 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N9VcBerJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCC0156F3F
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247276; cv=none; b=H5ngJybNQLl7cC2zrOkBi9WMcohGMHIjzQJdNUCKi6ZxuMfeXHijjeEYq0A4J/p8o1nXQZUhgwcOibuKYD/DTM3jih5PFblNwArYya/oFkpfRk9d1a446sBQTK4TbagrXZcXYLufRzGq7SKXp3npp/Gvm6peZTjI6/KPEKFlREI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247276; c=relaxed/simple;
	bh=oPbo5iSEga4/BG+zLOFbURr9nXVRkuc0PzBC/3/+c0s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RukETMZ5OVS6vomVHwcbmWoQea/Beo0tAloNldzDxlVN4T3qfMrm+WGyMD39QbhliWszKaOVihN4FAccj3kfYV2vJlAWEoTqceNCoOAr1twz50jpBVG3aPFKKKq8LKpHJaa1srPweHIxi1t5O8NQMr8ALz2/bEqXmpZ9Z9284OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N9VcBerJ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-46783d44db0so146902391cf.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 02:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247270; x=1736852070; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cugiw2K+eF/ufpIfLajaiEhdPCPGT9dQBiwxkoPulAc=;
        b=N9VcBerJ05hVokwZHGCoRwMZyG0nVdDhDP1MtTljm3SJDSKV2zYt9/xL/ulElAKdZw
         ielyqbPkTsuevKJYBQF378P+lIIFqNPIN42rX4wzJ4nsD5RsY8kefzn7wYWzRftdHbKV
         gv9FOi3DlhR218lcXPNOUmhdPY2rSckkyzCvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247270; x=1736852070;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cugiw2K+eF/ufpIfLajaiEhdPCPGT9dQBiwxkoPulAc=;
        b=HgZRL9Kyq7aiTIv9lwW/6y/gwMur373m1mSaIfQJ3eXrMO3VAE5rHPEBCxRQWDi9x6
         15xSN/ONeWN57n18WnEEFfdCaAKawjq8Cw5N6jbu5YpBEXs0iRuoxNDid9SqBWXIzLw0
         vtDag40wJxlBvo5VAusoN6Q9eDqYdCngjC+LZxFdrwc+FhdTxjlJQHaC9yLMQ8Mf3rqS
         V5cKTAz2GQULm5aHg86ZNYmWTxfAzyyZAI0Oh2inqrGKoKZDPhY1wmWkaS9EnGP9Xrpx
         0t9W+uK7vrZ2sKy1fckHsAgKSJGE5g9QgHr0NdDhYSMs0OQHlk7j9Xq2ISFQ3bWHnFfv
         H6Xw==
X-Gm-Message-State: AOJu0Ywrtv/Pck68OUTgx81ndiDy0sQrqt4QlW9Rc0kFxAjZMSv4QhDV
	9dHEWd+zdj6akmXnKmp053L4CGyNtSd03EpNupXr2V0ORv7aiECBNuqJ13usfg==
X-Gm-Gg: ASbGncs9ZP85LC49GaLnY/AW1q/IUzF5b/zl+1CTQ8Eq1uClaoo3ZDnUO8oTwXk/GSQ
	rR4m799sJF9qcs6LqCACadN9f27Km3S8T1mZgPFu/NnOJwUj4W//azKJ+aO/lbb7KxZQiKiwJlq
	tnx+ipFjtBHXvhHwMWa/ANnjI+/OlqwgivC+VGmWExNoPxF209V1AEQ7VcSAduSHgtHln7QBlBn
	0AzmrETLpD1v1Q9vce2P0BvwdOMB9BNXa17AXL/1cN07PzJApg4yQzTvuXfbbPRiWkkVpVN8SjN
	7oUMj8CgS7o/smuRrN/d0gwyNImZEMvFtoc0
X-Google-Smtp-Source: AGHT+IFn3KaEX7wOHj6iR2f6n64iWUMYQKzTgEsF8/KhmJ09OttsXZX3jE7Rk+s41Gt7VQC/L1jApQ==
X-Received: by 2002:ac8:7d4a:0:b0:466:9861:3e9c with SMTP id d75a77b69052e-46a4a8e8230mr872602421cf.31.1736247269619;
        Tue, 07 Jan 2025 02:54:29 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb30b97sm185094401cf.86.2025.01.07.02.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:54:28 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v5 0/6] media: Fix coccinelle warning/errors
Date: Tue, 07 Jan 2025 10:54:25 +0000
Message-Id: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOEHfWcC/23M0Q6CIBiG4VtxHEeDHxDpqPtoHQCCcmA0KFdz3
 nvo1mbNww/+551Qdim4jE7VhJIbQw7xVoY4VMj2+tY5HNqyERDghFOBfXhhG60NGFrPnAfQtZe
 o3N+TK59r63Ituw/5EdN7TY90ed2rjBQTzKXU3gCT0Jiz7VMcwnM4xtShJTTCFqsthoKBUuVqB
 Ywou4PZBsMPZgUzy5taeKG5ITuYf7EglNRbzFfcOKOkUsLoPzzP8wdGJgo/XAEAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

These is the last set of patches to fix all the relevant patchwork
warnings (TM).

Changes in v5:
- venus: Ignore fps > 240
- venus: Clamp invalid fps instead of -EINVAL
- Link to v4: https://lore.kernel.org/r/20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org

Changes in v4:
- Remove all merged patches
- Improve commit messages.
- media: Remove timeperframe from inst
- Ignore 0 fps (Thanks Hans)
- Link to v3: https://lore.kernel.org/r/20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org

Changes in v3: Thanks Bryan, Dan, Markus, Sakary and Hans
- Improve commit messages.
- Use div64_u64 when possible
- Link to v2: https://lore.kernel.org/r/20240419-fix-cocci-v2-0-2119e692309c@chromium.org

Changes in v2:
- Remove all the min() retval, and send a patch for cocci:  https://lore.kernel.org/lkml/20240415-minimax-v1-1-5feb20d66a79@chromium.org/T/#u
- platform_get_irq() cannot return 0, fix that (Thanks Dan).
- Fix stb0800 patch. chip_id can be 0 (Thanks Dan).
- Use runtime (IS_ENABLED), code looks nicer. (Thanks Dan).
- Do not replace do_div for venus (Thanks Dan).
- Do not replace do_div for tda10048 (Thanks Dan).
- Link to v1: https://lore.kernel.org/r/20240415-fix-cocci-v1-0-477afb23728b@chromium.org

---
Ricardo Ribalda (6):
      media: dvb-frontends: tda10048: Make the range of z explicit.
      media: venus: vdec: Clamp parm smaller than 1fps and bigger than 240.
      media: venus: venc: Clamp parm smaller than 1fps and bigger than 240
      media: venus: Remove timeperframe from inst
      media: venus: venc: Make the range of us_per_frame explicit
      media: venus: vdec: Make the range of us_per_frame explicit

 drivers/media/dvb-frontends/tda10048.c   |  4 +++-
 drivers/media/platform/qcom/venus/core.h |  4 ++--
 drivers/media/platform/qcom/venus/vdec.c | 23 +++++++++++------------
 drivers/media/platform/qcom/venus/venc.c | 24 +++++++++++-------------
 4 files changed, 27 insertions(+), 28 deletions(-)
---
base-commit: 4db312bbce420e3f874302549db072211e03c569
change-id: 20240415-fix-cocci-2df3ef22a6f7

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


