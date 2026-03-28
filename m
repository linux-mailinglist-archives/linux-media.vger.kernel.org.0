Return-Path: <linux-media+bounces-57470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOhiHG0syGlWhgUAu9opvQ
	(envelope-from <linux-media+bounces-57470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 20:30:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C81D834FD26
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 20:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC2E8308A8CE
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 19:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E83C346E64;
	Sat, 28 Mar 2026 19:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZYWPVri"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB50344DA4
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 19:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774726073; cv=none; b=uKpwBQB4zxcXy5/Bzx+epvexIU3RgBS8SbyGc/PZTANbWziFunesMUybWczJ+SBPx+pNTsUnKGTH/JZliHZVVDA0W+0QQCGwnjUmOPzlsFU+qJS+ROJ0JtmJnBltmaajdHu6+pj9Wec9frru6b2Cg22NN0cxo5+cQmyQZK1wKCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774726073; c=relaxed/simple;
	bh=VCjYkJlHt2KeassIJGy2N0LBPr08lc0SqtKIK+BsqKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebfXuCpzWGaoW+qDM8QNEovrjb/5W+BVfGPLOB66oTI63u3eUzhbxvSqE7hFjxtHCApkhNOPJhVDDoRR933REty1Id2wUDkOJNA2BTRFhVlXJ1CqCxGmxbf9m5dTDCgKHqVJmEvhsdhvOcsHtcvBsdV7P1LwwKOAUZrk3G8p6+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZYWPVri; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-661d20c9787so4242046a12.0
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774726070; x=1775330870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HJqgHNS0jccRam77IAJrO7UQzaoX2UBlCisSbr01r0=;
        b=YZYWPVrioOPx/n7zXoeLQ22/lt1VfXYp8v1U8/aL5q/aj/5y7Q8eqi9H5JMwvm4Iyn
         pK1l/1hR03l84POKAqe6yDZPndN3GUplklom4tj7ouW5m1R63uCzoPzwTY9stGVXYCmK
         equXZ/Nw6bPqzKzIFrxtClYEmTe8vkcfkZP2DK93ycVQ7y8fIjtKcuMiFHwWK1QFU89a
         i/AHTDV+jbtJk2O/BTViYlL7+LmhteSEiJY33pwNn41U1wS6Gaz93GuGS55XVejXqwGL
         A7Kp0nMijWo4GDZ9Qxn+YnYjI7zHlY7kO16j+KN0V1GyJYcBmpSvTIee8Blf6YAszoPq
         LrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774726070; x=1775330870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4HJqgHNS0jccRam77IAJrO7UQzaoX2UBlCisSbr01r0=;
        b=Mak4wBFAMkENDkpDsuqk62XDozy8258QQCw6kxDSn39WFjot3YignmwHsWJjEJ84A9
         yY8/fm/L9eUq4GkajS0pmxgjLbjX3euvqjkI2hncUdcx7PJLtYscGNkuQRMGWSe6TbO6
         KoiF31lpZ/0KnOVDkTNF0xBtaaoeTuq/poSGDQM/Re+z9s6ipwyvwa3BjGG7uDV8xESg
         U5sFI8KP+QuapWC1ye/1dF0w+waNkugKZ6BeK4/cJ3BsKVTygLXf/8WQkICIPAGd0rJw
         SntYWoiPDIqtbW+iBl/MARBW+VnZY5ZfkJVtz2scxIkOxirkZl+GEUOWvHA+fpATRI86
         JE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVY5A14DuQD9mMo6O22/O98sDPDyK+OJQhZB9TcZgPl44aWSgQvDIqVfzDlR+xCgrJC3yhCgf/1iM8K3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs0Kl0PrD3xz01URqy69mn9XYq4wuzPnlhm5mVRRkCXnrBEUr4
	Hs7rsOAdm1LtDusHKVJx8oVhPwoJzjOzw0/ZwCjVX+VODfECpR537yws
X-Gm-Gg: ATEYQzxKc2uyd1QbayyftbQiQm4VFZj10nxahgkKxP8Rb8lcu/JHdqFSyDITG2BMEX7
	blzul1wxO18hXBndeUhQdNcMO+ZdmKcNayW8k8w0Mmylccs2qiYcZGM2I1+rOmIjog3jkE/CFLn
	E2kAj8FfmnmylEpfaSna0KlSF4sesheto1z/EepcmG2QCl1aVDkJnoAOhaniRGhonPYcZbxUSfH
	8x+Z+5lK18wtA+9wWkPulsv5wVtHiJ7HuH++VSrBG+7IySTbQWvSda61++bbtCL00Vmq5nqEd4D
	mhAOlfr2rspezAXItdBHUJA1BzzBD8wpUb1Q3E7ePNtWTabetxxWVclqSRWyOiyYe8HgXN8ixGN
	qTeKEcTIo5iXC0lDwjNOZM9eb0ThiJuRXRLfstsWgrElV2ULTyNzzeqRoH+jukCO7Tqio3iTJId
	XDUFkZ1OOcI7iRBW7cqDpGuBAVgexgrzo5TX4CIDDNv9ky9A==
X-Received: by 2002:a05:6402:4403:b0:66a:7888:eb25 with SMTP id 4fb4d7f45d1cf-66b28b565e5mr4767304a12.14.1774726069986;
        Sat, 28 Mar 2026 12:27:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:18b7:e580:68f0:a6ff:fe88:bed7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76081af8sm857420a12.27.2026.03.28.12.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 12:27:49 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] media: atomisp: remove redundant call to ia_css_output0_configure()
Date: Sat, 28 Mar 2026 20:21:38 +0100
Message-ID: <20260328192721.255493-3-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328192721.255493-1-azpijr@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57470-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C81D834FD26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function configure_isp_from_args() contained a duplicate call to
ia_css_output0_configure() using the same output frame index. Remove
the redundant call to simplify the configuration path.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 2904455b35f7..1612bb2fd8b0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -796,9 +796,6 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	if (ret)
 		return ret;
 	ret = ia_css_copy_output_configure(binary, args->copy_output);
-	if (ret)
-		return ret;
-	ret = ia_css_output0_configure(binary, ia_css_frame_get_info(args->out_frame[0]));
 	if (ret)
 		return ret;
 	ret = ia_css_iterator_configure(binary, ia_css_frame_get_info(args->in_frame));
-- 
2.53.0


