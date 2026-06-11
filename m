Return-Path: <linux-media+bounces-64534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HH4tDE9SKmqOnQMAu9opvQ
	(envelope-from <linux-media+bounces-64534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:14:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B149F66EF0B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:14:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BQZ6ppPW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64534-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64534-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C527302333A
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 06:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41D135A925;
	Thu, 11 Jun 2026 06:14:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE133260C
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 06:14:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158470; cv=none; b=NePzMqqXVugIi7oe7aWKfUGq/lQFgX68nNuuAhY6Tzf7T4aYrZoofjKK0BBJUtQMInq36QeXlejPyzEhyWfs8T7RnjzAKl7wsYCa3J/wjljJejDWGbEL14WahkU2c9NAjp3+k64TMe4mgj97O+WTZyzOaT2oW3sZ+NkZlv/M92I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158470; c=relaxed/simple;
	bh=ZfgJxhiXGAMiDs2dI9HeWzbQGt/5F4/ByJE1n7rDnMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=au3Mj0oJtX9rQ+yXlxJJy2Scx8DeNSyts3cDNrbDx4nGJqin4udyT/GCoqdVkGJ1ROQ3rMek/RqI2tyFeprmZqoZ1T4jbI2PoNlg80KdP718ybCt3kcD2eR+ED8m263CvnHVRgOZeGYizaCF4AMIqVf7cyS28Ge6v8JWiI5zWSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQZ6ppPW; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso3601478f8f.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 23:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781158467; x=1781763267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TLceGIgYtQktvlq3SjtOMVDSRSFyQjcK599lhjYa9E=;
        b=BQZ6ppPW/vOX3NEVrFodC8cx6CR5lIvaEDDYQz+9jlay8LzW+H1SMJrjkmbpXQShQF
         y7GNLOC1OO3ikMBLzko6Z13MY5Tk/BfNI2ZoxmjLR5Ust2P7l/5DmxkaxsgOESP1l1PF
         OxH+j2IFiJIBL3jdpuZlPjXkJsTBU7mnqfFPiCE1+zKXTpsTr27rcdBk0iUxwYNoRhGw
         RefU1pQmE1aQWdGMgsZkhUiSyKgOVmk3vT7dtFRtb9JhqaaKnaMjpXEi4po2hPutq6Na
         OcUgF1dU1/QUtFeOoiH73hIisakXF1cAxPbyrRyy4t7nb0Y/QQ/83pjZgd8ahCCOQeQ7
         xjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781158467; x=1781763267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TLceGIgYtQktvlq3SjtOMVDSRSFyQjcK599lhjYa9E=;
        b=a5b3nR3c5nl0pRZiLsWEv9XrcKYAdeQfNhJBVdKMaGqGNeJE2QBsUE1VWTMiJENGjn
         XcMRY8wgFyNQsBBo2U743gdvLf1j0bxrkTCH8gHEeZqmCAGdtxmhKuHiVVNH2K3VUBBC
         d5A+lYNrCk59uPmxZ/ffoxelvX705BNIRnbgmoII2qVWHCKQZkj5BTJnTUIKchtbM3AZ
         KSQlcO896cVc74NCGuMPJxAyxNw7WrJ7TPEx58CWpqD5PYU8u9+n+R9C6oBQZYbHdv9T
         cHWglWQVHaoDBFejKrUR7kkE+9in+ma3AQYJHGdWNaCTHuVKbEiDLTmtixUrA6M+O4+7
         EKlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ln/aPW5ANWaydxJKRt7h43Gaq0xUAMitmqromsL4rvipSZttFCVf36rmybuegxb4ZxMUezuf96MYvvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG99PFZ13BHly6F8PaqYuM2VKHBEoieVVotDxWN5F4NdvLNTHu
	/Np8o8UCB8nGXrb7EmgbrsnpF/aNdsAbk8xX5fRx93bTeG9o5SOC7cfh3UhQ/w==
X-Gm-Gg: Acq92OF6Z3ASC4OJV5rOllED6u/Yn2yx9RHZatG9LzGzNIqLdv7Zp4F54hsMF9ldvV0
	sVCSHg1gD0bPPjRyPcrBURfVN1QOc5dp23WpA2mXeVuQ8R0gH+axSgsv2muqY5thw+fKc6olyTR
	azbfUE/bY1XM6mz58xTXO8XLOj3nXfdM3z4Fprsibn/BTA9UrMwN9NvNBfjviOCp4tOM0z/BODq
	kVRMzuyV+L80uKqXUu6ZTG6+t+Bx2SkOeluvrkn6V8h9SCVxpzicOsn9wttCiGwEA5R8hTGFw1T
	M+zyDY8LgIQailjWnOsrglm/Pf4xyWLyd1jmrHzrHNbWP1e+e1uAzIyDwRIHlCDSrb9bHIVhQ5z
	/KbwuwJyo2/uvc0gxlWxsM18DpdeHFcVuXsO+ezp4vHtK/d21uje3O8CHTIdQJa1O+NxudCkMl6
	oFPr7KGt8Iq70aIZ6Ke6e1BdLxQd1Bj/K/TNeMTUFB9DMBeCbJAkvwDdcV9BM942lgV7fxG/56n
	6I3dJc8EfM1A5l9h/SdbloiJmYD3JFGEqSvBYfh
X-Received: by 2002:a5d:5f47:0:b0:45e:ea9b:edfb with SMTP id ffacd0b85a97d-460677cb174mr1805311f8f.39.1781158467136;
        Wed, 10 Jun 2026 23:14:27 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d507395eb363324778b2a2e5aa.dip0.t-ipconnect.de. [2003:d5:739:5eb3:6332:4778:b2a2:e5aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm61047792f8f.14.2026.06.10.23.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 23:14:26 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>
Subject: [PATCH v2] media: atomisp: gmin: Use str_on_off() helper
Date: Thu, 11 Jun 2026 08:14:17 +0200
Message-ID: <20260611061417.11747-1-mertsftl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aipI6J4kDWESZgtA@ashevche-desk.local>
References: <aipI6J4kDWESZgtA@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64534-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:andriy.shevchenko@intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:mertsftl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mertsftl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B149F66EF0B

Replace the open-coded "on" : "off" ternary with the standard
str_on_off() helper from <linux/string_choices.h>. This improves
readability and reuses the kernel's existing string helper instead of
duplicating the literals.

No functional change intended.

Signed-off-by: Mert Seftali <mertsftl@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
Changes in v2:
- Add a blank line between the system and local includes.
- Join the dev_dbg() call onto a single line now that it fits.

 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..cb60cb3fab48 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -13,6 +13,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
+
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
 
@@ -916,8 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 	if (gs->clock_on == on)
 		return 0;
 
-	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+	dev_dbg(subdev->dev, "Setting power state to %s\n", str_on_off(on));
 
 	if (on)
 		ret = acpi_device_set_power(adev,
@@ -930,7 +931,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		gs->clock_on = on;
 	else
 		dev_err(subdev->dev, "Couldn't set power state to %s\n",
-			on ? "on" : "off");
+			str_on_off(on));
 
 	return ret;
 }
-- 
2.54.0


