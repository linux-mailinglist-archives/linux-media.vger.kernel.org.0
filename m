Return-Path: <linux-media+bounces-59355-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FgsKBm26WkJiAIAu9opvQ
	(envelope-from <linux-media+bounces-59355-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 08:03:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5F444D65F
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 08:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A897B30179F1
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 06:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E3438B143;
	Thu, 23 Apr 2026 06:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0ZRlVCj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6312BD01B
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 06:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776924178; cv=none; b=mMGw95q3jsdrb1yXz2Da6rjlnnvM8vPETKo7wj+QJ2EtWKHcciT1/9THJk4zwXwbSqRn4EDv7fTH7JeKzGoRJasHYfqZpJXYfKuVm0W393X4mr2/B5RzUv+YD7R1db4Dq24UIKAKnOUkhJ6JIBGmgIHgOsicujjdI2461ZBzpcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776924178; c=relaxed/simple;
	bh=ceEokkRv7J/gIQScaEcq2PSqrKrV/4PD5eqMMtVhjDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d3BD74V0eTScDuXR97BBnW2uvpEYoG+B55hFZi1KEsl9Z4gBbca1lYZJf0TIcdwL928f/I1guVmGOD9E8BEhnFJqomu7ymWTrN4bWxvC6F6bvdjcmPBNl1XjUTXmjQ6CzC/b7n7ShcdpcV+XRMJuolFCcumAAaDq/mvNx06UZyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0ZRlVCj; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35e563b0ee7so2977751a91.1
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 23:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776924176; x=1777528976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TbfsvgaTL4tZwAILAQQupP5ysgI2o47XYAQ59piLtY=;
        b=M0ZRlVCjs92Sl/aGMEoDp6J/JFo08iWtvN7BY70EESoBKu2G+y2JcgTf48TrqXEeWR
         JV1aNU0XK6h2i9O2ituqih73sZpBW3hvS0+f/kWf3AqCgESRt0xVNacUwFk8n1XSuCO0
         S1TVH+/f/spLQ72JNpa7ralyX7v8n9ZxDmHLJT3x6yxyxwbWJM2/Q2yuPPjkDMkKsf9i
         CHXHHoAK0e2UmhBwagXYoPt0kQ9VVBqvk8+VEkOKxbped13ZHCLBOwBg721GxqHVKEvW
         0rvj/jrhEmZLpIocTopWpCEkBJMI5vzvbD3TgqwaKxSVnXy55MjzywawrCW92ijvgNWD
         giSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776924176; x=1777528976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TbfsvgaTL4tZwAILAQQupP5ysgI2o47XYAQ59piLtY=;
        b=fFOXab+IgfLziVJ9kIcZoBDZbk4ZSrIIdraZahsyGfwgr/GOhLRX4+De2uPiXn1Ps+
         9kSWN5iAUuvnc9J2FuqfxoHkLOjCxAfqIHsSDEJylNEfV75jzJ+mZmmiIYOW6Jdhx77L
         3aHT2ZilyNMDtS+7Rfph+PQ7RO8rX7pLrXjRmh3qa2rUptghWVjIdiQCiDDsrTuZXZy8
         LgEybvLT4s922wD6y8MrpCNFSSPEaSI6QEnnBdRcjDGSXze5OwsOtsCm0QIHIdmKk6jD
         ivDsNmwFd7liNHvedQhQZwR+moXd6mHM6+DjttPvsvaScHPa/sqWVdjlvkl4aDtNdTJf
         qAqg==
X-Forwarded-Encrypted: i=1; AFNElJ8zZB1iEThfufKJ9zJzRSkXwRhWrGnme1rW66ZAWFJBndBtTZ2OPDJ5qziF+SZnk1OEzmPwIvMoakORSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl8DHSSYtltpRlarn9/eJRIeLSws3b7GS6QsOpU4LAYeaMmEj3
	rgJWl88VGuqcPOsqTVthyc09b8cZZ7Z6LG8PZl9bN/WjET3TJzm0BiOc
X-Gm-Gg: AeBDievBQlY9Wz8vjXVrgp07+TpLc6lHkQ7kUFPmdJj/ac13L1xvEsXVkpMcUYdHwFg
	PgsedxV+9nRYV+wUIIC9x5Ks6vkPIH5VHh6/K2nULJqS6PpSawGWRvUSthySRGg3zMLVw7uzfxU
	lflJowCZ1zR7Pn7BHvz2r41117lDEIkotS9zj1d2vo3mywuYzCwV+7vyLFoZOIAvW1D0VqE8G2i
	QN3NV2SvcBCkJoCEPxxPBmQIXvXcjFHWyFWDHMhPt3HivHwRc7IHRd1Laq1N6NFLzSRuv2Ge1Zg
	z6bl26kTb6lLb5FS7Y5u7cszuYyQSJPdnaVSaKg6IZ13DwmO/3VezCnf0G7TdTR+mjgV47M883w
	9zsvCKdn1Z0g1nlpr/f8km+kH2yBHIuD1rru8DSYwbxS5d842b/a8WCenv7IuVMq0s9dV+J4Nm9
	b6LA9cstlyVSbfaBMobg5sRrZBR0LWLbs41g==
X-Received: by 2002:a17:90b:3d02:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-361401ec4b4mr20061094a91.5.1776924176225;
        Wed, 22 Apr 2026 23:02:56 -0700 (PDT)
Received: from soyboi ([158.140.171.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a9fbsm24479325a91.11.2026.04.22.23.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:02:55 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH RFT] media: atomisp: Add error check in create_host_regular_capture_pipeline()
Date: Thu, 23 Apr 2026 13:02:46 +0700
Message-ID: <20260423060246.296986-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59355-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robertusdchris@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4C5F444D65F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When calling ia_css_pipeline_create_and_add_stage() function, there's no
condition to check whether ia_css_pipeline_create_and_add_stage() throw
an error or not. So add conditional check for the return value of
ia_css_pipeline_create_and_add_stage() function.

This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.

Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
I am not sure if omitting the error check is intentional or not, but from
what I see from another ia_css_pipeline_create_and_add_stage() usage
in the same function, we check the return value after the call and return
the error code if it's non-zero.

I also don't have the device to test this change.

 drivers/staging/media/atomisp/pci/sh_css.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..6aa8a883cc76 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7041,6 +7041,10 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 			err = ia_css_pipeline_create_and_add_stage(me,
 								   &stage_desc,
 								   &current_stage);
+			if (err) {
+				IA_CSS_LEAVE_ERR_PRIVATE(err);
+				return err;
+			}
 			local_in_frame = current_stage->args.out_frame[0];
 		}
 		err = add_capture_pp_stage(pipe, me, local_in_frame,

base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
-- 
2.53.0


