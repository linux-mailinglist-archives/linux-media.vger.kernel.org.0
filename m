Return-Path: <linux-media+bounces-64505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NlU6ONSrKWoSbwMAu9opvQ
	(envelope-from <linux-media+bounces-64505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:24:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CD566C395
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:24:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=acI6uFje;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64505-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64505-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 236953126D60
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB443546CA;
	Wed, 10 Jun 2026 18:24:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BBA349CDB
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 18:23:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115840; cv=none; b=C9aJNQA+8Kz9YQ/Dh3fAM4iCV8s1pv/jrZ9XJ0Cp0VJC/d6Mm7X818zELpVNpvFbDsmwwd8ooyEWQhEdjuCHsrczA1vzLJ6bkA1SKF1sqJbbMDVgQIO0urupQHS2pnHVKJHmGPSBsue68vqLuVfRQgotzUijdTAUWKWFvQRWZo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115840; c=relaxed/simple;
	bh=2uQYG0+UxIGPrJJoDURKujx8iY/HU5qavKxT/c6bm2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jkiuuXp/gkQkXc+nC++PoYiQ1sTLOx+kBSvnGeR7wuHhbMe2Il1VpgiE3SBES6WqQ8aJjZ6PnHorjaNHZrLOTZxbKN6CQ3fwT9J/JKAFkvlKjDl4bAh4tAnkSTihRWCaYKPCcs3ZRJsD2RZ04aJGsOr5Q0LbY4uCntNfRK2pmkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acI6uFje; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef4223be7so3943852f8f.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781115837; x=1781720637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwl2CxOhRSpVYfaOipOYrbFt3AnGc5jte9ni5QIriGM=;
        b=acI6uFjeIW/byJ7a2kKsnRVR6yyEsu/K/HfBX9Q3ZdvYvZ53jkeZ7k+eiVXoAB+cYM
         8D6chtvslv23HwcACllG9fKgjGPYPEMQlzWpuPrkisPF6MGvnQ0DZrH4bq9obseH3HZZ
         9NiVIGZCv6mxolfoyKrSbVEMpWPReN/jsZgYY9W6b4boGikEHvrmYdLBkCbQTFyQWORw
         06Gr/deM4F6Muwwrcr0ioLH4NDuzErWvgo53TMamN0YKQf8LQrBSee7zJrPayC2bCFcG
         hbIVz3K9b+IlxKwnlKrDNdmMBw+fZHeCg5ivZG4CBRok2AojHWS5+vZKWtgYhYqZX8H8
         EHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781115837; x=1781720637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dwl2CxOhRSpVYfaOipOYrbFt3AnGc5jte9ni5QIriGM=;
        b=IJDMslwIp0cRJ8Ud4bN6G/y6LUltjruKBeZH5W/sVvVn1C7dEoFuXOmNmZaYt0MUxb
         LhYLxM+wYtlswakDwzAorUFN7xPE+1LpG8EzYH5DPajIGn1QU9Iu45oHTGNfwF15s0zY
         dwwxLKHxmKatNebPK5zpOlb0OIkU0/oP9/gFIzJ5ijSL8gY9GWtujN92LsR9XkKYShED
         ylMRwELZQEmroAatcjmL6C/XNzRDmJdU4dG06Eat2ifNyN5Th8WL8EbAlGkS/suH0zlI
         D6RTfDSDpqm8hZankQ6utmeBEW9XgN6uycFuBR/WE5xXEf2aQ1lr/t23QvjrCC98pvrX
         2kTg==
X-Forwarded-Encrypted: i=1; AFNElJ/YKamFnGKGVDqj543T4dQUDjYs5J/Q8vD6GWywwS7j9I2VC9zzfmpji5zph/rvWtrnss0s8bKQD/YL/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHre7qJp+YbUrUOceM0cbKsiiKue7Toh5m+/Ikevv0dJvqfpgB
	iP62PBAgvfsMM5I89T3wmjx2WbMX/2Nj/fNEFNjKZYFgqj9RtgIbbmL8
X-Gm-Gg: Acq92OEUGi2AIaXa2AIS0/w/BehjRJ4nToDJLd5GX/C+2ymjGSAitlEySvV6UQOyGi3
	b/KnCZmIWKWn810ELu7Q7KUfETqkR8iGPx22/oDaXsNrjCjzcM3CAgzP0VmD6LzqM1A18Lp6E6R
	SQj6AC68Ivf7pjKwXaLVPTpVokTK571Zuj2ncWcpiiiUqPz8CEA9hK4MOKXK+CAqp31qrZ7K2hq
	8i3JBUNwQw4bE42E9LiOtl2MJiNJbOrPHLV565CNLFf8/gJW0RMpDw/G8TZ7tHDhewH6ul0/YLy
	APuAUfC5k753hqtbz4ygvsR2wwfH1gt8gbN6XMqzbpXrYrki5UBDd33+YTr3T39EfKSh9jZqhOL
	xeTbJ0zb+VTxI42cZGpy0QCI4fRtwRo5jvycpR1jykXv7l1Rw/c1HKuEiOMs1xgEVMD/B56O4za
	cN/jYXrDz8DoB4amrkrxKZyzm0RS4su2Qz3FVMZld7mA3VmPlCtALmHZ4YNia4TtTvPAjsjctyN
	xY/ftVNS6l1HV+4pVhhdDmZz0r4R+fmUnV2mw==
X-Received: by 2002:a5d:5f91:0:b0:45e:edc8:d440 with SMTP id ffacd0b85a97d-46056680e18mr12031063f8f.1.1781115837178;
        Wed, 10 Jun 2026 11:23:57 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d50732f0d071ef8c240021969f.dip0.t-ipconnect.de. [2003:d5:732:f0d0:71ef:8c24:21:969f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm73075615f8f.0.2026.06.10.11.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:23:56 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>
Subject: [PATCH] media: atomisp: gmin: Use str_on_off() helper
Date: Wed, 10 Jun 2026 20:23:48 +0200
Message-ID: <20260610182348.217892-1-mertsftl@gmail.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64505-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:mertsftl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84CD566C395

Replace the open-coded "on" : "off" ternary with the standard
str_on_off() helper from <linux/string_choices.h>. This improves
readability and reuses the kernel's existing string helper instead of
duplicating the literals.

No functional change intended.

Signed-off-by: Mert Seftali <mertsftl@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..322eca4a3755 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
 
@@ -917,7 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		return 0;
 
 	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+		str_on_off(on));
 
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


