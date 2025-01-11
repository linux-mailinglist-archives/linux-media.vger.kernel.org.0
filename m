Return-Path: <linux-media+bounces-24637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB2A0A279
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 10:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B9FF3A8EFB
	for <lists+linux-media@lfdr.de>; Sat, 11 Jan 2025 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7B218FC92;
	Sat, 11 Jan 2025 09:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kk3KDQs5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA101494D9
	for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589325; cv=none; b=uSJP5Mlht7Be4aMAuP6s819xRuGniQuO0Xac/xC0ypXzsxr5k0PNXnMO2YYn5LSBqXlm0jHDwngeoqsJGM8qMISrd7lX9rqgyLCaGYczxK+cJSDz7Baa6eePV99ysp1kdPMUE+PRN/TWvMtBAPe3uaBj8xwYyaZqpRowL9odIF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589325; c=relaxed/simple;
	bh=mqBLITwRqHabzhqwgeNzb6sX2viwetgL9Fl6dN8xdtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tSHRWrncgkhcaEehhWVsNZKOopnaCVnaENoJRVxlDrdUJT9ooiPq2UQtnRlgwjwIVpAQJ+ddYweMV03+0CjB4xzIEO5OSV6gzm1xhKm/+GyAo0i7Y0Bwk8997VGWqjIZOq322EcFgbL3PjcKkhdz3iqvIXishGFzlp6RRGonxkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kk3KDQs5; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6e9db19c8so234037885a.3
        for <linux-media@vger.kernel.org>; Sat, 11 Jan 2025 01:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736589322; x=1737194122; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+vbEX6dfGe0lD4UnGFC7FwoZxd2lnIOxAQuHSPlTbc=;
        b=Kk3KDQs5EXXShZ6Vw3eO/Mg+cvev+TwoLyZjjn27ypqi4KUngTPQeYLM5INYai0aea
         IZ5LIZq7qOLzcX2rJewWjDMmeuDCpsPaQBhDxRPKFtDYvv1FW6l9xcxdeWp/hAn4x6wi
         RMgBDJ94wDe3tL7zzk5ERG+QnAWGgtmQ/Lar0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736589322; x=1737194122;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+vbEX6dfGe0lD4UnGFC7FwoZxd2lnIOxAQuHSPlTbc=;
        b=KsSZHGn5j4mHSWF40JZXOm+2QhzJytiW6zxk/cZpbHM2x5x/bVHwiuUs8U6Y3rm99o
         rkggFqDSiJGrcxM4enSeEDzqABXxumUwqnmkOAIlgHTeZfL8LXZ1PcogqRUTjG9yJQFZ
         b1tPpk4EBBhRbBPx6Kv1p9FqM99wgbgQ/WCywIqjNngGyuDx/OwqX7FoVNBKh/vpgbsp
         Ab9KgvuqLQEsRv7Q8NjmxsBLKP5vN17FMlJeirKIQN9EfjXpZEI3mNCSSAXjLTQThnaE
         8hW7O5uuPF7pp88roXkaxT3yXqwg+dbw6EusvRzxfnmzb9UyCWbzcwmzCrNrtOOfgU/w
         yWZA==
X-Gm-Message-State: AOJu0YzVpi7V43cS0ZLQQ3SyqdONIQNyswBRHcVYjmCs6tXQDnIBrRPv
	rWe1GxPy9naSlU3SXUVpPiuzCXZLBqMzCFrspyYDCi3gvslwoNxDavFwZ8quRA==
X-Gm-Gg: ASbGncv/sHMWZEEHdFeikDe2A3N/upkyu3vSUL2QK1agjJoEWovxT5QrBCGJWoMtvNE
	to4EyhOXvwmQhp1mvZGJPyYH0fL47tMAZcxzqk5u3ppBDrlLb3f1SK1i54jj9jub74I/0YpTLJ6
	xRHiBcvV5f/v16Rybn4qxyNgSoR9uDIJbqvJ7/08uXZEwdTcmQVAKNvlS7bTaHEpW2yA66yS8+k
	5u5IzKtaISzYTo6sruSCZVzobZrRYY1B8GNoK3mqvy0Kft7P/z0fjjgkweS+td64q9oitr9Q0QS
	giS3dZHYg7cAhjQLaT9T51xqp9bdXwzEnKqr
X-Google-Smtp-Source: AGHT+IEloxD4snD00AcEnnZVYP7Za55BIhAKgAM3bM3EjRchyG6kGxhTMIw9bXO1O1cJeLQHeAtleg==
X-Received: by 2002:a05:620a:2a10:b0:7b1:45ac:86b7 with SMTP id af79cd13be357-7bcd970d3e9mr2026266385a.17.1736589321956;
        Sat, 11 Jan 2025 01:55:21 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce327b8besm267096785a.59.2025.01.11.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 01:55:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v6 0/6] media: Fix coccinelle warning/errors
Date: Sat, 11 Jan 2025 09:55:13 +0000
Message-Id: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFAgmcC/23NTQ7CIBAF4Ks0rMXA8FdceQ/jAihYFoqh2mia3
 l3axARNl29mvjcTGnyOfkCHZkLZj3GI6VaC3DXI9eZ28Th2JSMgwAmnAof4wi45FzF0gfkAYGR
 QqNzfsy/Ltet0LrmPwyPl91o90mW61TJSTDBXygQLTEFrj67P6Rqf133KF7QUjVBjXWMoGCjVX
 mpgRLsNzCoMP5gVzBxvpQjCcEs2MP9iQSiRNeYrbr3VSmthzQYWNVY1FgVbkJ2RnAbF/j/P8/w
 B1YNPPJkBAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Kosta Stefanov <costa.stephanoff@gmail.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

These is the last set of patches to fix all the relevant patchwork
warnings (TM).

--

---
Changes in v6:
- Improve comments for tda10048, thanks Kosta.
- Link to v5: https://lore.kernel.org/r/20250107-fix-cocci-v5-0-b26da641f730@chromium.org

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

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Ricardo Ribalda (6):
      media: dvb-frontends: tda10048: Make the range of z explicit.
      media: venus: vdec: Clamp parm smaller than 1fps and bigger than 240.
      media: venus: venc: Clamp parm smaller than 1fps and bigger than 240
      media: venus: Remove timeperframe from inst
      media: venus: venc: Make the range of us_per_frame explicit
      media: venus: vdec: Make the range of us_per_frame explicit

 drivers/media/dvb-frontends/tda10048.c   |  8 +++++++-
 drivers/media/platform/qcom/venus/core.h |  4 ++--
 drivers/media/platform/qcom/venus/vdec.c | 23 +++++++++++------------
 drivers/media/platform/qcom/venus/venc.c | 24 +++++++++++-------------
 4 files changed, 31 insertions(+), 28 deletions(-)
---
base-commit: 4db312bbce420e3f874302549db072211e03c569
change-id: 20240415-fix-cocci-2df3ef22a6f7

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


