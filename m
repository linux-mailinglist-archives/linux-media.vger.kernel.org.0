Return-Path: <linux-media+bounces-26756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F5FA415D5
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 08:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6454A173C19
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 07:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E0C23F420;
	Mon, 24 Feb 2025 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SyEIklq2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8D1A317E
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 07:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740380640; cv=none; b=NSH9aAl6/ady9XUEH9V0txlBJHrzI0AwFTwttcgsVyCZCcSq+WzDR/rSiSUNQRxxk82eewFtD7yiodgwB7nSWzWKivOGzvteOu13yNBZXW4btwJDW6yXy3bhZfEv2sD9tkxxffC/gYO7e5G0s03+O3er5/uhVFbrDkl6sckkDcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740380640; c=relaxed/simple;
	bh=RPkr2Yle/AQxgRyUW8B77AJqlobQFEDPL71xwQL/gG4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NFqHxTbqKud/Gj5M3Y07JrxBpvMLlhjnnmf1u6edWHavRDubmqc6XMoHOciveGoCca70FQlUX5xe8c0AuQccwa0tmu2OdhfYtE8h/viRWoToeO2XsLlHhH4zR46YHg3WO4iNvyNRf3tDjcbp6T2J8VwuUZqvi3/7teOn/pJA6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SyEIklq2; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c0e135e953so139274985a.2
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2025 23:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740380638; x=1740985438; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHRUOB722SP2pT9GOeb3cvEiqmLTG17HzDuBznymqOc=;
        b=SyEIklq2FmUI7LQzbzRtYZcbCHQO0ZXYX1kPQbZxOoejwxVIBSWwRT8UtJjDqsDSRd
         U4pTzLyIILWahG7P2cZa1RlQ/9Y5tx4klo8opq89SU/1Aw+VZwKdf2DI4vYzlhqpwmgY
         7w+B2ujxMhEIXu6ByiraLTS62V6eYuP9SyV9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740380638; x=1740985438;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHRUOB722SP2pT9GOeb3cvEiqmLTG17HzDuBznymqOc=;
        b=pXUjpxhF9yvPiIuXfeyuJnRI2yC9MEP7V/N+kWjdHhGJoE4bmODPuShAz9xPswSfoh
         ZdnQSIJNv0Sfx0l6dCSgjDxT7/NaqkKqcJ6/qBq1XSNKT1Oh6rV4W9yCIiZwTaBOBxM3
         ja+UQgPu0o26iDnFdyAQuGqVWQ4C7fzzGplCHAVlY5lcYojcBHzuOQ8Sm3T5Dc4mGaUc
         T+gWPyh+a1LUuEE+DTbk/KwvKMdZP3KWnTVMLJyQgHqyPpDBBORV5GuAYlcCmrHKJ+19
         6eJpjZrad+NpNXSh/YZD7gyMPcIFTOSHO1tq49BHGC72VOJXW/PeQFcMNkB90V7REKhm
         B9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXk39/H3UvFAJBrFteaEVyntarb6tqxrlzjP8c2CNf4BE3P+RBnwtcK6DiCwUzVg5tFepJV27pzhSl60w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNzBfc+q0/1XQsrqhCnYHQJsOauQKvB/YfUb8ygNooRuAT441
	nRUR+PWvLYeU4GtJHzu6CbQ8BhpWPvM5/eU5ODoTSk08UdtEHhRCDOCyVRziag==
X-Gm-Gg: ASbGncsV1tR4lMWB75xppgZhTxx4jln2iZLyjHKx6anTPPD4y4n8M/msszeTR0jC+dF
	AVkbBVzT6/1ppug4FJVQUpJVkHd6pab8VV7cb2FMqX8RZU/A3XiHGYDXLO40ksXhOqGzMenO4f4
	K9IU+m7Yh4BOcqAFgd3bxl2Q3T/uVWOCbpKEN8pfGkxvcbeb0G+FKSNYEHanyZe1sKYSsREqD6Q
	/cixNqdMBxFLxg4w9lpoBOQ0Asf4vQwxrIEoqN79Jni1wEpdMT7UUij7GxzBguwzicKbubOJTCu
	MVTWPMDOcyfTVrJWL6kjzQLJdlhxagDw9ID2GgZ3hULq6BlztUiJXBDWtuC3J4uMqVQ/xO+BwXD
	aKc4=
X-Google-Smtp-Source: AGHT+IFkIZyKy46tv3pPOrC7t02hlkGCHtN8wPMQx/td4toBFnJF7+sLcSy9HQrjuNm68CaBgRk5CA==
X-Received: by 2002:a05:620a:450c:b0:7c0:abe0:ce64 with SMTP id af79cd13be357-7c0cf8aec7emr1654304985a.9.1740380637686;
        Sun, 23 Feb 2025 23:03:57 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm977920485a.47.2025.02.23.23.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 23:03:56 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: nuvoton: Fix some reference handling issues
Date: Mon, 24 Feb 2025 07:03:53 +0000
Message-Id: <20250224-nuvoton-v2-0-8faaa606be01@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANkZvGcC/2XMyw7CIBCF4VdpZi0GiLe48j1MF1yGMosyBlqia
 Xh3sVuX/8nJt0HBTFjgPmyQsVIhTj30YQAXTZpQkO8NWuqzVFqJtFZeOImAt6t0FkOwF+jvV8Z
 A7116jr0jlYXzZ4er+q3/RlVCCoXmFKTz1hv9cDHzTOt85DzB2Fr7AoP7C4ehAAAA
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marvin Lin <milkfafa@gmail.com>, linux-media@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.1

When trying out 6.13 cocci, some bugs were found.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Squash fixes and port to cleanup.h.
- Link to v1: https://lore.kernel.org/r/20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org

---
Ricardo Ribalda (2):
      media: nuvoton: Fix reference handling of ece_node
      media: nuvoton: Fix reference handling of ece_pdev

 drivers/media/platform/nuvoton/npcm-video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: c2b96a6818159fba8a3bcc38262da9e77f9b3ec7
change-id: 20250121-nuvoton-fe870cbeffb6

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


