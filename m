Return-Path: <linux-media+bounces-20122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC659ACD98
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 16:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2DBAB266CD
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 14:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFFB1E7C16;
	Wed, 23 Oct 2024 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqX7g682"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282571E47B3;
	Wed, 23 Oct 2024 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729694544; cv=none; b=Ck8kFW+2vDY0qMUyC/D3//2AbHgj4GzfFbkXQBBS1oJJflJC1Q4vqYpzEmdBwp7C2auWvy3stRMCpXqBZYdcXmsShHdJLve+2fqvLj2H+Lq3mFX1/pGaLeKsq2RqnX1n4ygR0L3WM5wypThJqQgSdkmGCsYPnIEnyNT4h05ImEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729694544; c=relaxed/simple;
	bh=BhiW6CeRG3/1Tl7nXzS2upHElx3PwSbc6S0h6rOfBio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gYLiG9YZFkYfw3kKUjqi7+loNfzczDgTvLhz0Kxc365jxZUfEgaBQc91g7SB5lreAoqI/ufvboGY6fLgVOPIuOYfhaWJT4Shu58QHXdTdQcRKjZL3UhiVe0tF1ugHkmCDKB6Yu7gcmGs7QUNgHbuQqBiudJ+Gz7oAKDoyNKA/hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqX7g682; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20ce65c8e13so58909025ad.1;
        Wed, 23 Oct 2024 07:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729694542; x=1730299342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAZtW9NjaJRCd02uPiUXqi3LhoLZg99JQlzHPisrjt4=;
        b=FqX7g682va0ER0Apw6PWkq6wUYzxvVKb358W2MPMwqWR71Lx8dAuDDe59T0hg4/K37
         Xx7mW1akCLXruJhUfn5Le0OsgP95xXuqbt6UrT5qo1cLrQbS6GC2jPlyjkHNQup5bZ//
         6GXOZjt4XZ7nigkkYKDMbmy1Xs1Xhozf1DeVv00moLSJenr8da/l9DrAj67+wBBnL+NT
         G3SvBC+W0KJOn146OMcZURNyBwAqDR5nJoG7dxyTkzbBQlYe3NuYPy7xrXvI8xmbuVjb
         nvwxxUEWH2hqoTRid2AtQ4d4MI/FOhOc5L47vvt+ygj91Ql3JzGtjIx3cDTIlcdGpES6
         txgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729694542; x=1730299342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAZtW9NjaJRCd02uPiUXqi3LhoLZg99JQlzHPisrjt4=;
        b=EYTMElitte1bMzcLcr400ef9Wld1Rcjs/L3Z8IvLEHvGSiChpOp4+XFGBdH4frwl42
         DiWUtmZsxOq3pJcsE5B9+QG/AA0ww8um5Xtm/YPApx8Vej3GahIvEla8iJBxjzLP9FXX
         Yd95zpKAiqBMAGUQEnSgw8neSWpqlXa52cVy29/O/JXZSCNqsN+fEm8Emm5qYyckrbKM
         bIdHw2yKZ9FglmD4a6h6+0S575VLi9F8JBSK04Fc8YMoDAzYM+jxuAw5V/6qUDe0aaKg
         2yyfDE+3HPz1yVZt6xhYRENz/1rEDiebmb/v3tkOP/83AeqaeggwDYm38L8MZwpCS+/x
         d7Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV/DNLnS8dnvgRp9pG5reJynpLXREZBR87VNc7mLa9xXK/ERR/TTRRTuWMWo7faRvJk2q+dg5UvweG0@vger.kernel.org, AJvYcCVv76iWaQf3Zhw6DWjpEDG6nxWgf1DHhcjeRX1wHyzquX0PX6B59aYBTmNlP6qgRI/Tq4/YeT8bJC1+9HY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy8+4BQELD/UPRkyTh5IHL0iVyxLjQNCnGstQHAybTgfCKZSJs
	sKXj7GSoFwaSfmRG9jmnuj1B3GHzV+Krx++fFmgegxO2DterDrza
X-Google-Smtp-Source: AGHT+IHtFI+W2uEX9Bpbgk8Y/oO1hucjnLHdsZzQdADv9NyLsS84aIUvZDstLfDUxYK/QEtVQbGdYA==
X-Received: by 2002:a17:903:1c2:b0:20c:7898:a8f5 with SMTP id d9443c01a7336-20fa9e5c43cmr29315235ad.28.1729694542344;
        Wed, 23 Oct 2024 07:42:22 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3468:366c:e529:6d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f109c5asm58573725ad.305.2024.10.23.07.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:42:21 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: lars@metafoo.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	francesco.dolcini@toradex.com,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] media: adv7180: Also check for "adi,force-bt656-4"
Date: Wed, 23 Oct 2024 11:42:05 -0300
Message-Id: <20241023144206.1099622-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023144206.1099622-1-festevam@gmail.com>
References: <20241023144206.1099622-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to adv7180.yaml, the correct property name is
"adi,force-bt656-4".

Expand the check to also test against the "adi,force-bt656-4" compatible
string.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/media/i2c/adv7180.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 819ff9f7c90f..ff7dfa0278a7 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1440,7 +1440,8 @@ static int adv7180_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	if (of_property_read_bool(np, "adv,force-bt656-4"))
+	if (of_property_read_bool(np, "adv,force-bt656-4") ||
+	    of_property_read_bool(np, "adi,force-bt656-4"))
 		state->force_bt656_4 = true;
 
 	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
-- 
2.34.1


