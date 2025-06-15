Return-Path: <linux-media+bounces-34833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9907ADA48A
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51C663A674D
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 23:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A60D281530;
	Sun, 15 Jun 2025 23:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fln6JjFB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0840527E7F2
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750029108; cv=none; b=RFEkUiVuQyWss7J49ktEMpwzAXi8bvbCvrJWZ757jrjAVl6MAjXJ+BBurHFyzU40CWCokdr4OS5UiZB2AGXHDwJ44KJ8pGBGDPsnrEwZdf4nWZtV6h3QkOcoh9tlvHUXX7uWm2sfClBKD0q1+RUaML+7dCy49LlDIgo9RN379gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750029108; c=relaxed/simple;
	bh=4HDa+kZfszLMUgYNYONQFzq5OXdyA7J5cTxvAeHxi78=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cXVR6ZJwNEYyqWehpbsv+YTzq7RucfxQPcHmmeWLbqGnkeH3rDtO0R4yzk8EgC1zDTaKC1w4NBVH+6hdPLcXx6Mmu84Ck9jERotVzNlxF/hz3vB5YkrugR3ogpRiRtOI4WUxfwedORoXyvb4xECO9obswuta0hJ4qmqR6OYNA2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fln6JjFB; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so7626361a12.2
        for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 16:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750029105; x=1750633905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcvIE+9LcHgBj6QzseTYwWoeEVndXUkqFgV+umJPgZ0=;
        b=Fln6JjFBJsJPKnOtA6hBkLlS/qY01x67klKUv7bbZAUkgoZ7US4rEgiY4WCyp19x0C
         9PmYob8qlZRkJRI/81X8JLoO93K8ZWjJwAuHvczjfyrSxu9d+qxQEepiICrB7ZSD0H87
         6Waa26uoEYDZNkdYUs2ce1Rs5I511lfdzDFBwl6ckwk/ntC+37wj0WjJJRsgAkInsIjr
         uQgJGc5IhTTMWlRP+ckg1gmWkRhUZXcRrDyOerI8f9fYv+3O7bVsjXUW6DStTSRDgSud
         +rOWhQGFlRhB05SOrkvM6d4rTprHdOMsXTtBevceC3oSnX3I35HFsMZLeaU+bw0G/gk+
         jEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750029105; x=1750633905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcvIE+9LcHgBj6QzseTYwWoeEVndXUkqFgV+umJPgZ0=;
        b=NyixCYT6DgeVW3an6/VA/rRGGGI+AToyuuW2jrXbjXJTR0aV4CSlbmTnI6BwIBAA2L
         sfKWNOid1QB26Xn7eDT4Po0EAwDFPiHSPCtJJc6xXb9S0yNui2pkI5h1J1k3W5UzrJ1m
         80a4xhIcwl6YC9m5Uymp2ACLaK+IqkntzGx1tVLrpPoChNhDwZQrocVfJcAdzw5HzZ1v
         MtGY0ZH6s/YYc6i8LNWjFXFZtgSQZEZRZjtqVSTK7zTUs6MRIIwcVOKfZqSD2zBSWVH8
         8iw4X63I6gcI3I/6rZ9RR1VvezX9y9xZupqZXwh/BoFvG+Ox5HIMBfP+hcgN1fwTJ3OX
         FBNQ==
X-Gm-Message-State: AOJu0Ywt1CaK+a1ANwXPoQ2cfmeTUv7+VamIrjl+2OlRQdL3lNDM0VvL
	/dwiGFBAZHvDB1/zqdhMp9pDO3XI+lENONqm/ja/QhE6P7BWvVyfDCX7
X-Gm-Gg: ASbGnct75bnGneUcrktcbL+h2pJ9K1XqYL+ohsxPbJ8+eAxNvoiHj44nkoXXDDC5IoL
	lFnHSi8R3sGYY7hsPCfGY+Uo3pFuzBDR/Jgue+FBA2upR9MllVMAGpRJMdliGbQiDDjeTYNj36W
	vzySt5PqGqLLIkbBbPmJAoEvtA8UraTWztJWwUtKrWWeVsOWqte5b8PqgdEQR/m6FmbVVoQDrgj
	SSaIwV301PmBs50o0oAhqxAgKpE2xHGPXY4mTWwZ4cTC51PgTISi1zdFP6cNnzdM1fKLn4V0EtQ
	tmJLINgl3bATqn049zTxSA42AaHHiVGBQp2uwmHxFX78zOXYH7FpnKgEZdcdHOLY+tbn9XYlp9N
	No6auBaad++CWYFCxQc828uN/ipSAdpRn8agiD0XjGTBf+GIOxXxuAnT3cG6Bh3u3KfHszlN/aw
	q2MZwSvM+KJCVlw8C6OQhwziI=
X-Google-Smtp-Source: AGHT+IF7JhUsm0FGPzBzpz4BiVYQgWKUlm55RLUwDD8GmQAi8WR3r224UP/NzLqu8111/AuQiZs2pg==
X-Received: by 2002:a17:906:6a1b:b0:adb:4203:cc9c with SMTP id a640c23a62f3a-adfad46a361mr659102766b.50.1750029105340;
        Sun, 15 Jun 2025 16:11:45 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0704-3500-b0b7-97b6-556d-11c4.cable.dynamic.v6.ziggo.nl. [2001:1c08:704:3500:b0b7:97b6:556d:11c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81baf3esm546347666b.40.2025.06.15.16.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:11:45 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/5] Staging: media: atomisp: i2c: sleep time
Date: Mon, 16 Jun 2025 01:11:41 +0200
Message-Id: <20250615231143.1558392-3-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

moved to usleep_range instead of using msleep which could sleep up to 20ms

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index f35d1a16f627..48ec2cb03806 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 			goto fail_power;
 	}
 
-	msleep(5);
+	usleep_range(5000, 6000);
 	return 0;
 
 fail_clk:
-- 
2.34.1


