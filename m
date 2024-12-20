Return-Path: <linux-media+bounces-23935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 998DB9F94B0
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDF91188A8EB
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3B3218853;
	Fri, 20 Dec 2024 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZwrQ87Cn"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132632185A0
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705722; cv=none; b=A07lZTT/gW6RJ2bvX+aWXJ4oACZvxSvni7O+UZObk8bcjJwYla8XpnyPW37ktaTBRy4KKUMVBMUrsisHQ2lvj37RbQjNA0iLh5KIXIxSiXw3aBwMtbDhyTmNOEDylwUGehQl8oayjYWJyIQBRPWcW28saR3+53fsi9hqk9ZDy8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705722; c=relaxed/simple;
	bh=J2H9yUj6fiZ47ZdPt/vENlD5aKLNsBd81NxJL8IQcl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRYbDPs6O0CX06KAyJWR+jh+pSTp21jbuKLVBcbV1nOK3Qz8Z/OgsJmw8Pesf2e9xNHHwOKQI0maQF5u9noZVN4zfn8JjDPKymdo7dZRAcf9wmDLLeuMYffLIpWPxqAZ9AjGniGFHsR94rd2C5CuVuZRCJ1v6PDXvcMiB0xm7kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZwrQ87Cn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734705719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OdoBXwAV8TXNuswtRO2tnC8mjZc0e1UCL8sDyEJVxUc=;
	b=ZwrQ87CnxB277Re8KqsTk8cOW0tPknqHHE07RA6WNvm4mJHVgOOTXpYRqrjLLUxlfPjYFq
	gCZxiI7iUoghk2mb/s0rij7E6Jp63M1gfA4T2AdW7ZUKeg+q6sPEJl33bYdNWixfNCxROg
	6A/IUo9OCzQ+CWl8zqfm9jFlmfM0ALo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-168-cqnr0t1FOx2oVOjY4kQs2g-1; Fri,
 20 Dec 2024 09:41:55 -0500
X-MC-Unique: cqnr0t1FOx2oVOjY4kQs2g-1
X-Mimecast-MFC-AGG-ID: cqnr0t1FOx2oVOjY4kQs2g
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 82C941955F42;
	Fri, 20 Dec 2024 14:41:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C029E19560AD;
	Fri, 20 Dec 2024 14:41:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 06/10] media: ov08x40: Improve ov08x40_identify_module() error logging
Date: Fri, 20 Dec 2024 15:41:26 +0100
Message-ID: <20241220144130.66765-7-hdegoede@redhat.com>
In-Reply-To: <20241220144130.66765-1-hdegoede@redhat.com>
References: <20241220144130.66765-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

ov08x40_identify_module() already logs an error if the read ID mismatches,
so having its caller also log an error results in 2 errors in this case.

Add error logging to the ID register read in ov08x40_identify_module() and
drop the error logging in the caller.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 8d683af54d35..10ec9896ca61 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1943,8 +1943,10 @@ static int ov08x40_identify_module(struct ov08x40 *ov08x)
 
 	ret = ov08x40_read_reg(ov08x, OV08X40_REG_CHIP_ID,
 			       OV08X40_REG_VALUE_24BIT, &val);
-	if (ret)
+	if (ret) {
+		dev_err(&client->dev, "error reading chip-id register: %d\n", ret);
 		return ret;
+	}
 
 	if (val != OV08X40_CHIP_ID) {
 		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
@@ -2262,10 +2264,8 @@ static int ov08x40_probe(struct i2c_client *client)
 
 		/* Check module identity */
 		ret = ov08x40_identify_module(ov08x);
-		if (ret) {
-			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
+		if (ret)
 			goto probe_power_off;
-		}
 	}
 
 	/* Set default mode to max resolution */
-- 
2.47.1


