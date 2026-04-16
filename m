Return-Path: <linux-media+bounces-58942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JVlHuIc4WmmpAAAu9opvQ
	(envelope-from <linux-media+bounces-58942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 19:31:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A9D412C1C
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 19:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02F8430511C2
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 17:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9C8330337;
	Thu, 16 Apr 2026 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWFOuna4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4347532B9A9
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776360633; cv=none; b=OPuYvyG88JNga317YhOZVnCN2O4zoqrzwaVSAiR0TZUyaJevYFyLUIXk1xZ1gVTChuy5UbPUXS81AjWSs+jC7l85W3hf0GNQtsq1afW3tXB/EZ3D+WEeWnQbdk+f4MhaWqja9ntOtH0mSmgCvY9qKqXnDgMrOcHN5rF761FZhNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776360633; c=relaxed/simple;
	bh=AOK7AYkvv1obcIpouo3ENPG0MhGWbHfwfKB3qaKofQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lO1sIkUapSGgmWExel8ykICgJpWKtMDHVeY2YtUueWN+Kmu2npr239UuN7o7YHXFJ40hDt6FB1cpMF9HH7p7luuaee7GRV7cW0qHbBz+BI5qfka6lZ0duQokrDutqEHlPbWQiNhdLczFl3K+YHI44SYwO/Zg8jemynaiAhV7QEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWFOuna4; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82f5dc076ddso2100677b3a.0
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 10:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776360632; x=1776965432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lSU4s/m9nFxmJ8D1T8BXP5KkkEUp3UCaNpB+YyLW09Y=;
        b=BWFOuna4MIAwtAoo1LUGn/YmYW3F4gWzg0+N3JJWSoH6lsJhuRRzHKwBG3yHLCdnPn
         tpqCUi87kHqXfYFOULBVngpzpYGM20hxnJ+/iGKF315uXI+0l9ZJwoV40u/bo4Cke+aZ
         pd5Y2Qg8Qsz3xum/Z9l4+lrzucMnU7jxuTZbjC97yx8/cPCXxTsUIQKnaYlrFKLIjvog
         D9sxhSfmkSnUP1JFRK/6LyjOSEeHEMeU3kfg6dj+EeqmH2b4fU+jDxal0qeccLtrCEUB
         Dg+VN1AHY4GVPXweu5Ej9KwNwLwlz2FN5tIlNMLZxk21HzHd7lh47QqdUxfAuFn9Fr8I
         7y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776360632; x=1776965432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSU4s/m9nFxmJ8D1T8BXP5KkkEUp3UCaNpB+YyLW09Y=;
        b=BzlbsHnse1W4EZ2p5tx06MzrJa+CDDNsu9gyyKg62Xv0WjXKzR1upVWHENpGxPafsF
         s1ORzGkuBVVF8KZgv1BzvCgShG2AKxs5vIGqFLWIB0nNXScWTP3v89CIwUG5mSGLNNb/
         ++Ad0H5uTb8VOfhH5drbPvB8VOY8cy/xD54qmHKmjURX43a5MYkQ6iPNkdfx+FIOhVar
         FGhuE0Lxiu+ASKFC+IE7bnqWVbVZn8ZeVLcuPslPp82y6clwaeS0qOt/MzlVVhr1Ocjb
         9ItSZ2mmn6d8m3jgBMP848Bd+I4OckRH44parKf5oRoHS9nXq+kDS2/uMr+jh7e2sgkZ
         qiMQ==
X-Forwarded-Encrypted: i=1; AFNElJ89jCNDwm8T9X79B4Z/Uj3aypByFZeLpifo/T4vIdK/1jfM8IRQVABao+/bUGMXG8Vdc8dCO3+g06Tp7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0dfStcsKK3uuRbbxlztRIYij/PEvVXaGKalPmqqit62m1pSTs
	UaFT1VrggV7x9UP8g+PUZU8Y3/g2ORM5bKYg+CKcPh2iteuH3zXiPpIJ
X-Gm-Gg: AeBDiesZdIrWWC+TaBUJTRP7N1BaN8qnMF3qEGzDdMvEIYRIhd8lxhV9ZaIYGT+skk6
	SoCFmVUsq5kdp1c3c5AXq0Zgvcu5J02mGO2XSuN7Gb3FlSlGfqP5RGtJN3nXBhEpqzaDG+XWkIh
	pnwThXdZOsSSf5pXCI2aET5BH2mH4d4y9wfhwOSfztXUGiylTizhIEge6zPpLz+2GOHMKkDxbK9
	zGyP4Om0NBSV0eGh/JhmNOSwipY5PpaZhKeie8sPudKFWpQNSeuadVZ8DAnhZ0WqV3I6mU94DTI
	t6EFYCPwoIXqKNT9sRpQiyNPmWUfTVyw1/yjI5k81O3g2f86diGmOd6oLIAt7tnD4v1fKTidtWf
	j/8/dFTH6DybCINHDJSmJrK6ootGQHVGtFPTrkbC1M2CKTeQrfAwKT1y2+P/9yRYITM3c4oa+vm
	OOOEcxW790r0cq0HOFofW43alJFFw+vIPOwEhr
X-Received: by 2002:a05:6a00:8011:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-82f888ad495mr218697b3a.46.1776360631546;
        Thu, 16 Apr 2026 10:30:31 -0700 (PDT)
Received: from lgs.. ([2409:893d:11a8:8d82:9994:1f65:38d8:cb81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8571893esm729229b3a.16.2026.04.16.10.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 10:30:31 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] [media] marvell-cam: disable PCI device on remove
Date: Fri, 17 Apr 2026 01:30:15 +0800
Message-ID: <20260416173015.3981161-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-58942-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lwn.net,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31A9D412C1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During manual code audit, we found that cafe_pci_probe() enables the
PCI device with pci_enable_device(), and its probe error path properly
calls pci_disable_device() on failure.

However, cafe_pci_remove() tears down the controller and frees the
driver data without disabling the PCI device, leaving the remove path
inconsistent with probe cleanup.

Add the missing pci_disable_device() call to cafe_pci_remove().

Fixes: abfa3df36c01 ("[media] marvell-cam: Separate out the Marvell camera core")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/marvell/cafe-driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
index 632c15572aa8..22034df6cba9 100644
--- a/drivers/media/platform/marvell/cafe-driver.c
+++ b/drivers/media/platform/marvell/cafe-driver.c
@@ -609,6 +609,7 @@ static void cafe_pci_remove(struct pci_dev *pdev)
 		return;
 	}
 	cafe_shutdown(cam);
+	pci_disable_device(pdev);
 	kfree(cam);
 }
 
-- 
2.43.0


