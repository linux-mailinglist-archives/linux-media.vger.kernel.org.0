Return-Path: <linux-media+bounces-15895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E52A94A26E
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 10:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE6241C22952
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 08:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7171C9DD8;
	Wed,  7 Aug 2024 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6zndThM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3C2868D;
	Wed,  7 Aug 2024 08:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723018252; cv=none; b=Iv1ED+bRpCMRdO7Lqw/ngLsdsSRqeFc/ElRtrOxYaiMwriM5qTJGsajDSwJxWpjncWOB+7QBXXcd5Nc7GvifNHtZ5etN4fxOO9kcvT5KGsEh1jZawbnXIrrs6Rf/q1ALU1WkeKy2wzJgIiYcQ4R7OC4D0Uj4KD449JZKuWo+0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723018252; c=relaxed/simple;
	bh=/c5NnwWo/gGiCvJPvtR6JPf1RzRAXqhf/M38xXiiQ6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W/i2CWGDqlAHicd7QBV+9XDjnTl3MCszj9Ywo5R5ECV4kyQb8Wn7ZhFUu54+kTB+GagIcFOETupOMGJM49QH2KMtZDz6iY0sc/jzI9/XRCzMV9FxSvrPWnBTYwpmU63zweXhwBwjFBDZineHSCIYmwOYYTedIjhWKmDUOUwEpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6zndThM; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so151263266b.1;
        Wed, 07 Aug 2024 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723018249; x=1723623049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi/HpZRL8SrIAWP5iMhIR6qUgSWwMPRdJAbA3YwHvJU=;
        b=N6zndThMrVfnj59kQVLtQyAHn4WIYOXFY8+uG7cgeco+q6lkVZNSmPOb2Mz2CWlbEu
         kfmL32j2r/6cz3PSKu+lUDxNPFY1puBXVoYSGN/frKx/iULtsMZarjrE1c+s6p5dfuJ0
         8BtD/WYXZuIFCBFl+twSRsZ19tEuqaG7Yff2tCmKiVemFPYCbtjnS7ZRutzd0xTq0bMy
         1aJfFGZhyxRVPb8d6WovYFct8Ayb7ok33Ryt0Up6kpK/i/9r8ZzHR8H/0wxeIKgR45A4
         rtN2xzBXHw5EwNrJIzoUZWMiWcXglZxoE4BUhpselruyh70TNAUSShY3xpE0qlMG5s0T
         i6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723018249; x=1723623049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi/HpZRL8SrIAWP5iMhIR6qUgSWwMPRdJAbA3YwHvJU=;
        b=lxTKLAdgMLiZ2TKvGIJWVw8T4ao65AkBPq5x3V6TGIVFSyi++hMhONSzxrv3G2svw4
         fF6baaCmW4vt4yBf3ASyd1mUhkLSZdtzV0R7ReY/XHQ/pekGTZgpgkwWN7hFTbSuGQEX
         53PpMRobYMYLt5Ug0797MgyHWE2WOyQtyOfnr/4WFVQ3QeKCq/cQejpBc2W3qO4UuKVO
         dN/bfitZVGnMq+JmNCXphBH1/nDSoHlE9bml3Qz7BvFQ7N8DGINkpMnloQ69++LQT59b
         q99Xp+4YeHfhARmRqwqAVhzzyVpEGX/q2iICXIaWwPfyMORrKfWCr84vD7Mpk37qQSSb
         P77A==
X-Forwarded-Encrypted: i=1; AJvYcCWk5TeT6cHfkOFDDxgQ05SVbJsGdyq/kr84476Gc9HcDGoP9LuA8OpxkoC0ClnSzcPxDZ1EZOSat2Gmc33AlL4c7g/R8GTxt+uLD5vBAk/OaNR1Mhp16QffkUwwO4lh7uOtu/1uBPjhn5M=
X-Gm-Message-State: AOJu0Yz8JYtVUSnhoIf2x4EvGfvIs7NbdghcVpmie7bVw76wG0Vv9g7O
	knLP/CM3cNLNn6s5J3upkCTptZCsY5PCsiJ7VSVtzmal3JzDFDSY
X-Google-Smtp-Source: AGHT+IEg3pjEggcWfxOwQQd7dLQxdfrb/eL9qLgc8zX5gXiEftFIaGrgiwllnOn8JbNS+f3PwQa+GQ==
X-Received: by 2002:a17:907:944c:b0:a7d:c330:34e3 with SMTP id a640c23a62f3a-a7dc4fbeba0mr1007543466b.33.1723018249110;
        Wed, 07 Aug 2024 01:10:49 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c12be2sm614118666b.89.2024.08.07.01.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 01:10:48 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
X-Google-Original-From: Benjamin Bara <benjamin.bara@skidata.com>
Date: Wed, 07 Aug 2024 10:10:27 +0200
Subject: [PATCH 1/2] media: v4l2-cci: Allow "empty read"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-imx290-avail-v1-1-666c130c7601@skidata.com>
References: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com>
In-Reply-To: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

Make the read pointer optional for cases where only the return value is
of interest. This could be the case for availability checks during
probe().

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 drivers/media/v4l2-core/v4l2-cci.c | 5 ++++-
 include/media/v4l2-cci.h           | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
index 1ff94affbaf3..c402e0377a57 100644
--- a/drivers/media/v4l2-core/v4l2-cci.c
+++ b/drivers/media/v4l2-core/v4l2-cci.c
@@ -30,7 +30,8 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
 	 * to a valid value whenever this function returns 0 but smatch
 	 * can't figure that out currently.
 	 */
-	*val = 0;
+	if (val)
+		*val = 0;
 
 	if (err && *err)
 		return *err;
@@ -45,6 +46,8 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
 			reg, ret);
 		goto out;
 	}
+	if (!val)
+		goto out;
 
 	switch (len) {
 	case 1:
diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
index 4e96e90ee636..ef5e0d875e68 100644
--- a/include/media/v4l2-cci.h
+++ b/include/media/v4l2-cci.h
@@ -60,7 +60,7 @@ struct cci_reg_sequence {
  *
  * @map: Register map to read from
  * @reg: Register address to read, use CCI_REG#() macros to encode reg width
- * @val: Pointer to store read value
+ * @val: Optional pointer to store read value
  * @err: Optional pointer to store errors, if a previous error is set
  *       then the read will be skipped
  *

-- 
2.46.0


