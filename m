Return-Path: <linux-media+bounces-27263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A13A4AAD3
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 12:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B84C1882431
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 11:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101661D5CD6;
	Sat,  1 Mar 2025 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AzUJjcof"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF1423F37D
	for <linux-media@vger.kernel.org>; Sat,  1 Mar 2025 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740829724; cv=none; b=VrpYzjYOhpQ9XcsKEu99X5SLGnSmiYda779U5N8kVU+CRWEfQLI/57brBlty7pZka3PkFAy88miAV2o7wK5tXYHM3UmblPxaJ9JHXe/e/U5XUca3sQTL3xKSlnuEWmN7kzQZcrHhGcr/8CrBEK6ETg3S/crBGj61tcmj+VE+W+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740829724; c=relaxed/simple;
	bh=aol893qkUmPrauzREroIY+LDFqyd0jeW5Tl9jaNpqDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNdB0O6EVJ7MTQbOsBnavqzIU11AHB5HDgm/4L6RcOuun0mLpYNOmBKcHzs/JFwoY+EIV3uLwTbHY1GHIQDSo12zO6hLM20zRHMZywXX56xsQCSr7xPrbKbi5m/gxoSyP/oDZluMnGah7KZVWJ2S1c++/4lg9DihBVSy3V+2OQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AzUJjcof; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740829721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUvkoXI5ipBqJ2Ds4PzpHKcnXxDpcZHwBkzH7246wt0=;
	b=AzUJjcof44SqNHI1/yKOpDjVk0HFCUvLVrCZq9tlAtFhNbj3exW0OhZmFwYKl/aGhB3GB8
	yg1o1JX7hI6+y5weud75MWMr7LtMuJaFxUv0vU/yzyTKjEUna+Q0smPUSRG0xwR211K84d
	IDZ+AvwO3MpWu1E/aUpRq5JhBugzhxk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-5PPqol31MhSj5PdBTo1S2w-1; Sat,
 01 Mar 2025 06:48:38 -0500
X-MC-Unique: 5PPqol31MhSj5PdBTo1S2w-1
X-Mimecast-MFC-AGG-ID: 5PPqol31MhSj5PdBTo1S2w_1740829717
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 521391800268;
	Sat,  1 Mar 2025 11:48:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.9])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 119C619560AE;
	Sat,  1 Mar 2025 11:48:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: ov08x40: Log chip ID when identifying the chip
Date: Sat,  1 Mar 2025 12:48:30 +0100
Message-ID: <20250301114830.22668-2-hdegoede@redhat.com>
In-Reply-To: <20250301114830.22668-1-hdegoede@redhat.com>
References: <20250301114830.22668-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Debug log the chip ID after successfully identifying the chip, this is
useful to see if the identification is done on probe() time or if it is
delayed till the first stream on.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index a4790e68f523..cf0e41fc3071 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1955,6 +1955,7 @@ static int ov08x40_identify_module(struct ov08x40 *ov08x)
 		return -ENXIO;
 	}
 
+	dev_dbg(&client->dev, "chip id 0x%x\n", val);
 	ov08x->identified = true;
 
 	return 0;
-- 
2.48.1


