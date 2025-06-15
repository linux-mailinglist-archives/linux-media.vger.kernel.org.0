Return-Path: <linux-media+bounces-34835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EE7ADA48C
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26E718890AA
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 23:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EFD27F747;
	Sun, 15 Jun 2025 23:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NsdGIj/n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03DF2641CC
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750029109; cv=none; b=kNq66Axs9lqjpinQyCMHJieyPT/SYzNUqDBwtS5urYHvU1/r7ciKc7EpBSpd/qZoubmZjdqzVUofojGPo3jzmmq6fPkUg/IPsDe3ada5JLCPH7qOONti9318r6GqaLMYvDc2JBJQsiOl2LO0nvA8IQaLOb1CRq32H/p++NZiPP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750029109; c=relaxed/simple;
	bh=B0iVseJ6KZ3tp3xudimOormlRAJxc/UuS4tDDKg0X/4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fWdk2lfcOTmyWk8+FpVkpzmyAA6ZDLXCptLGE3f6LhLcu0+DVkUamXxaZWTFjlwoEGM87TvwArKPpQe5VxNIPL/gwND+CsRVOAN5lPck43UAGd+/CQqZQUsarRozY3V4Sz7EDehxd9Yme+eGpvodLjGIKPfTlrkIr43vXftzp00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NsdGIj/n; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso581848666b.2
        for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 16:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750029105; x=1750633905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3MfXo6iTt/rSpgf0lOwf22UCNwL2LWT3y/KcFVDzVA=;
        b=NsdGIj/nYL/Y7EpFKemzMCeUtUJTG2fajRG68LtRgjtPhy1Hytlk52IFR0167mWTMQ
         cCYCphpPj1FBi9yulcd/GdapXt7GW1k3Kp2yKQro+xDpMbp1FaoOMjI41TFQEtSc5KsK
         u5vw0lyCzAfH5EYb70No72KCEmvlk7A7JNRMZEWIkcS3MGsydo9RFcYFgLqU7sooSvC6
         fhKAjHPH/Hrfyms7C3k2Cwz1jXGG8w2MzBVCa3Y2GQGLY/pfhqj8u31nyqjLxlTYWyV5
         cZxZgWNw0kH35SXMV681vitaFUicPUf6+7uRZzyDaezniBHnXwp/0U9g6sdTUWXWgBZR
         YEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750029105; x=1750633905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3MfXo6iTt/rSpgf0lOwf22UCNwL2LWT3y/KcFVDzVA=;
        b=UyMl/0xfRmG9L0Vti3cXc+VWH36oBKhKu9Fq3qdasJEmJWd1nBdBqrJni+S1JvnKdo
         xw30+ReXZ8hWUapnVpvTLRuAsgXqKbC5MAoZf1RfBjEAXQSWpcS61hFJhqDc1Uu82wWd
         EkmKKug0/pftj83a8PYox3rQb6V28przV9MdvY3F7ArUGEHdbE8ykZXwC/ol+2qpPXxZ
         dmRdrVywhvN4vbbkZm4WHmrYO+26UFEkAjSkgZBLhBmrAsoVozXTbL+Ka7X6Bjn0W0Hu
         UuU3uMlFTqKKwzQKbyd2FRgl/SYmUVKYOhz17ZkfkSqFlqYrXrofLWEKLiKAXdF6b4RF
         xvYQ==
X-Gm-Message-State: AOJu0YxCEyQKD6u/1FK9eiRBUrkxud2DLjEYNh1Js9qthPFcJ6kkLbAB
	x2NcrPABX6R4XfKG/DQZPseXbBLIVHMgMJwIwd6AMIMQ3ATzcEHwNKSSd0rsL0173HI0NcxI
X-Gm-Gg: ASbGncvZYR5Pu+ulxr6RkejQbQ/1vyrcTmpO/9DhUguyXXGjzVo05qT66k1dI5SsdaJ
	jyTjxdQXFXdAr3Rlnn0IqPtfm6+DJPQg7R9lqeyg+SlVf3HrEZ53sWEZLwJnpTk+aRa+7JKJG8W
	ypkTjJF3y3tSy8NnIxvQKvzZw1At/yx7cBYvpqgW6Iyd4VNfm4PIRPlCRIdbPA7236s2rh1Lf51
	tS6myKoIaqHdTVZRbrugJR+qOC04kXyHobdXNzgskKPfHV6/snzWokwAdZeKiaB1Hb+RPHvk1F8
	Xj1KeTX/kcpQ303hb1b9OyuL0PaOvUE8FrTFOEMm/uS8GPv8HXF3DQjypB05SkDu4Z1t0beKU/9
	wBns5Wv8Vg3tqIWqWQ4ftsGGA7vKghGAaXjiPavJ2aVyc9j4KJ2lFhmoA5bB5TDs79nkHQPbMwZ
	qeMwEA+1N7SEMa9Czp3BTeKlM=
X-Google-Smtp-Source: AGHT+IFdrxWCL1P0Gvj/YWLyU2wCRVVWjPVxbubsgx7NVKtIKNZYJdLu2b5cXrsCRQnkNkJ+R/KaDw==
X-Received: by 2002:a17:907:94cb:b0:ad5:4440:23 with SMTP id a640c23a62f3a-adfad46a000mr686609466b.50.1750029104907;
        Sun, 15 Jun 2025 16:11:44 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0704-3500-b0b7-97b6-556d-11c4.cable.dynamic.v6.ziggo.nl. [2001:1c08:704:3500:b0b7:97b6:556d:11c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81baf3esm546347666b.40.2025.06.15.16.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:11:44 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/5] Staging: media: atomisp: i2c: hardcoded function name
Date: Mon, 16 Jun 2025 01:11:40 +0200
Message-Id: <20250615231143.1558392-2-thomas.andreatta2000@gmail.com>
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

Checkpatch fix: use func instead of hardcoded function name

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 857d7175942c..f35d1a16f627 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -779,7 +779,7 @@ static void gc2235_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
-	dev_dbg(&client->dev, "gc2235_remove...\n");
+	dev_dbg(&client->dev, "%s...\n", __func__);
 
 	dev->platform_data->csi_cfg(sd, 0);
 
-- 
2.34.1


