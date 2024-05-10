Return-Path: <linux-media+bounces-11328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A218C276F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE60A28718A
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9473C171653;
	Fri, 10 May 2024 15:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcWpxyUZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5789012C526
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715353845; cv=none; b=oOKQd+F8UDlfnQ0pBUarK0xF08RMw1wJfzkn3sbyNaj1dp6xtRloqgz0kdE78//87NcYqdIDo5y3amv9MQtEBiYMhqCSTnKwPLxzbNLiDyW7C/hpdk0MyzM0Ql769G/ptiDZ7bint3CzblHtqdl0h+s0S8HHety5Y24YsHhAhTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715353845; c=relaxed/simple;
	bh=+6E1QWCdVlRF2Y2CqF81C3CJFrg1T9UMcvxSi9JgmAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKKq3vg3Ie0+BQiBp9pRcqZSqdZXQU+G/r8q/NU/I2coUKroD6+hfyE5Zj8rv6M/HIse6uRVhK0z0GoH19b+lyxJAipn9D8NcGBLJ4Ia9yeSsAU6cqPReshRzVPOwoxNnL7yqtTFPUtd96WcdUeHPpI6F7YcW8Aw9iqEkApT+2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OcWpxyUZ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a59ad344f7dso456386166b.0
        for <linux-media@vger.kernel.org>; Fri, 10 May 2024 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715353842; x=1715958642; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0b7Me9PZDwaqOlHu5lGpvnIETDgfY8E0wv6t+cYznU=;
        b=OcWpxyUZfXPfg0uKeVjmrIhMlYImkiA2cJ1kanM10vMrZY0LTU4VDGUAWVkHrqr29U
         MMZ2s7W+8/Q2tTz4XrZqlmCNEPLiVM/j3Mb0sP3Sc7Stbq+zw4eD+ILv8yugNAyoOocQ
         DUHXOCtl1QMd0tHyANLLDWCTBLNKfrMWAGl6nNAke2EGt7V6IOwl5IL4kDMVmJMJAnu5
         +0wOmRmjc0OJ5O7Zodxv7NtV1hvJvKiGJBOn5kmQ4tcZUF5QcI63CWUXc6uQrLYAbj4A
         XAElsmFwdwTQHlw4SdG278Ccc+uzkTDxub9BMy1V5jGSBl+6VffJWSxoUwIuwOXF0vvb
         ACvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715353842; x=1715958642;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0b7Me9PZDwaqOlHu5lGpvnIETDgfY8E0wv6t+cYznU=;
        b=bDEQTYTFKdDLm+FNdWvqz7w0fjaeH+2Opmn6azAdi/UEzC97GPTZE7c3LguZgJax9o
         d+M2kypLHbtN00/WSp72xotgt7uXKiLoiwTen/t0ro85d1LrZClUP0IjHkDcO3MO5MKj
         lZaD5yUfXxccHtrKFDJMvTBY1U6tp9RcgnJLdjmSMwRi85/zPPyQufJDouWD4qMJ+V/q
         9Qjcfp7Fz10/N/9B6GPEbcffFbvRvsSbmjIkQ08vjo+aj9im6wRr6iGqUv8RK934lm2D
         s4Q/6JM+g6241JQ9OLz4EoodBPA6BLtXqAuaio5qDbbJjgPmfpMhLFMmu9Xgv9zE7iFC
         oQJA==
X-Forwarded-Encrypted: i=1; AJvYcCXR2qjpj4kwysN3On/o5VjoP3DbfD3RSBmz1VFleNu92kZ/O9t6TaAJzDLUtXENOenCbYQVI9gEB2ni1KAnwi4FLX5LJ4tJbdF8lO4=
X-Gm-Message-State: AOJu0Yzqp8gsck0Ya7KdKy8mlzF15mgUuRhyVgt7TlEfx0w50TQTeSR4
	aMGgfvf+pc+p8iQuKotkirYUWww2pTLVlJr1RG2z2ti39Ub/bxgWqjUqZiYUpmM=
X-Google-Smtp-Source: AGHT+IE278hcS/Jr47z3kbE/00DWI4mUA+YI1L1n39yqUw2ZRvvYK93xTf7orCqbrqmfdjKjhusspQ==
X-Received: by 2002:a17:906:aad1:b0:a59:c23d:85d2 with SMTP id a640c23a62f3a-a5a2d66b4b8mr183158966b.55.1715353841538;
        Fri, 10 May 2024 08:10:41 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01932sm189826266b.168.2024.05.10.08.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 08:10:41 -0700 (PDT)
Date: Fri, 10 May 2024 18:10:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bingbu Cao <bingbu.cao@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: fix error code in ipu_bridge_init()
Message-ID: <71dad56e-0e2f-48ba-90bc-75096112a1ba@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -EINVAL if "bridge->n_sensors == 0".  Don't return success.

Fixes: 881ca25978c6 ("media: ipu3-cio2: rename cio2 bridge to ipu bridge and move out of ipu3")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 61750cc98d70..a009ee73e26f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -839,8 +839,10 @@ int ipu_bridge_init(struct device *dev,
 		bridge->data_lanes[i] = i + 1;
 
 	ret = ipu_bridge_connect_sensors(bridge);
-	if (ret || bridge->n_sensors == 0)
+	if (ret || bridge->n_sensors == 0) {
+		ret = ret ?: -EINVAL;
 		goto err_unregister_ipu;
+	}
 
 	dev_info(dev, "Connected %d cameras\n", bridge->n_sensors);
 
-- 
2.43.0


