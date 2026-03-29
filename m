Return-Path: <linux-media+bounces-57522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NiGEUt0yWmxyAUAu9opvQ
	(envelope-from <linux-media+bounces-57522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 20:49:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEF6353A8D
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 20:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3709301C3C6
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 18:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE94F38551B;
	Sun, 29 Mar 2026 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5lFzf3r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3842387346
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774810167; cv=none; b=NUGIZNDFOy2roV/2OoFj9Ji67UAPxLITX07tQ2I+o6Pnzlr0HsrHJgTgzvP1eTqbGKRd6rzxG9ctciMlT0GyYiq9GUtioIy5WOnr0Uivz2FWl26O6qiUTNGPRR4wjtAZ3xmbAdp5jbhg59uF6+LX5XZH3HSE75PSRm0p+XKQ/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774810167; c=relaxed/simple;
	bh=6waufSmesp2JgfF19DKXBQuLDjcjbl+OJb3oAYIjJSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BA0LJlgAgDhdVzaePLmJ4UnH6wecPGZsDFdc5Fu8CSBxgyxJ3obst3+RizZs80wLbGxVjZUZzgPE452NbxvcW579hHOprr41iIoJZRugjxr33pDbkQ2ySPKHJlvsGqLfr/9Ar/ZUQM9/VWPz4BoMiYigd6f5cTpjMiC9VAQNKyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5lFzf3r; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so236885f8f.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 11:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774810162; x=1775414962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12hnKdjz6/Mr8B3it9Q0v2b6LVUl8V91nVrdlKXH76o=;
        b=j5lFzf3rJnOJvUWSQ/DirIQcwq1P3Fzi3kX7sr8P27AOtY+VhE+MW6M8zf92qN4u1s
         4oIz9nZHxY+Lckx4wi6tY4GPYPVugcI2cDc3uTTmuWE+2MyjrwOoN37JmdcfFyRryNdf
         A1MWjGZ+5aKazMBTjXdBGhZWWlCNA2d4TDjfeDsaUMCftd8qftO+PqohjBj5y0hMVCiS
         67/OAUFx96odlicbEnkMKcPXAkUDOMMxyPW4JdMA3EElkWNGlMXmYPGsdmX2K7w573qr
         vUFrMgOMERQc5HpNMUNcqEryINBGp0W8k0ETEoMIkNxznH4c1y6sYzio0TzeEfEcyjEW
         SThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774810162; x=1775414962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=12hnKdjz6/Mr8B3it9Q0v2b6LVUl8V91nVrdlKXH76o=;
        b=CSryPMBm/UM6nt89VmsbSvSVOQpI0/Q31hBNcrj41y11Z7jC+4GSED6xstA0v6PBmh
         mhu7X9TfUUvCsKcjdpMRIN0twLjQgKzs8dCsEhnK+joiMiKKJIScmIxxnlbyxNdaJi+f
         OnwlZ5XGAbnnhgE+QNT8DF1WQ6LqS+Ty2OdBzu9PjG0a2qgG/8hx2rItEw/GCCsb0L69
         N6nEfzsBH2kGbPCal8v48QwLukTRswJkgeeAHGqoF4UwHh+RbIPUNPfaIJodMoPOqnSj
         XVTXJO7xveUCOqQgp3Ig62VSKhJQEOh9cZXe4t/qbyWTL4A06PXp/Rvamr+4IAMCPqFj
         T8Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUQYQ/d1PaKCKkcrt0zIuxXA9F+p82UgZJyJJsDfU5xEu6XiiQ8cgwgdvM6I5qLPX+gfDumMg3cTqoqNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4OGjGTFAeJXDi3WcE0fh0Vb98H7DvsWucQ3Iv2FvqgcmVDzJN
	Orz+cnxqB9p+w8TmGnTjbWNH9diymultY2K/353ieSYL+FNN7rt2E0W7
X-Gm-Gg: ATEYQzy3oDRYVbipwgBBFPa/XBQXDRGHjLcOnUqS63PuGEGvd+PoVSGJmfi2XV36o1I
	F6EqHagQmQR5Otcl69JTaOLqh8BGxdRiipQzeUYa0Zx+KSTE5rFuNP6SpcAcITVibwWNPAZDe0P
	SKznwLW8J9atS9XI4kFaQvqKHoHjAbYLE7sA/pSkCaiJgFaKNPzWOFrViqSBw/3xn4yW5syD9T/
	MpzNiUm4K1JfOAKRsFszoq/WQFF/vArAXnHv5pJxPsWqW38ZMYD3RjD/Up9LpQxcRveMdBBAHHO
	tIwwBNKByGe7Ayj/rPioPEBghKcM86DJznLOrr2Ui/4QdHa6z/Uxjr3js1m4llgm+jNZ/wQXkPy
	8M7V80m2UA6euRho+OjcQDxO9AdtN1n25LI3UzTE93dMMuas3H0wYs3h0eeznwdJI+mdVWlFEg9
	0HAHoyRvoe19VGvn3m9JLB1U4Hv0m5a76jUfVpB82UWvY+xwPzCiAHqvLfrtlonQ==
X-Received: by 2002:a05:6000:2511:b0:43b:9c08:4a30 with SMTP id ffacd0b85a97d-43b9ea16d7amr15928290f8f.11.1774810161650;
        Sun, 29 Mar 2026 11:49:21 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm14058443f8f.11.2026.03.29.11.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:49:21 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	daniel.baluta@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v3 1/4] staging: media: atomisp: fix SPDX license identifier style
Date: Sun, 29 Mar 2026 21:48:07 +0300
Message-ID: <20260329184810.455285-2-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
References: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,nxp.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-57522-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robyserbanpascu06@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9CEF6353A8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the C-style block comment for the SPDX license identifier in the
header file as per Linux kernel coding standards.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index e8a29f73d67a..c99fb649fb5f 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -1,5 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *    (c) 2020 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  */
-- 
2.43.0


