Return-Path: <linux-media+bounces-66572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C6ALAu/ESGqdtgAAu9opvQ
	(envelope-from <linux-media+bounces-66572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 10:31:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E4E707197
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 10:31:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CZrndztP;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66572-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66572-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AEDB330086AC
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 08:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0FA39C019;
	Sat,  4 Jul 2026 08:31:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFD9322A2E
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 08:31:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153890; cv=none; b=F0e9M5JnX1MorU6GHzahzmzqsfMOW1pEsBl4nHpITWsNQ9AR3y0pRdJwiVNPBF8+jfb/dOP6URoga5TzK8hH+U4fKXAsGJ0Ey7BbJ8vmYEZjRxQvbpJzNfrjUprYNxWIjcwVt90FWIJTnax/ITvvjI/QTiUmOAVVQ9ehhJI+jNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153890; c=relaxed/simple;
	bh=MVU2FpDXvrbWaYS3WXF545Nn+twYVu34kFeqKxYSacI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NuMnQa+hNbHHtCWbrwUCBnOeul9QRfXIUOaotPoCB0YH0+ue8YpJ5mL3Hbvw5LsmDrl72JNlwmsL4+FTK1Bl734sDm3ShPwl+RzKBSIY0xOPr9WfL0HiPnnrCcKqznryws8OrB46fGxGTa+YDgRuZxUrmnKGMBF9/a4zAx6GBqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZrndztP; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38426d04bb4so104301a91.1
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783153874; x=1783758674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bnTIg4b+qm3LWW9BhIg3L3anyHB6Z01GNepnsagvpI=;
        b=CZrndztPcG5GbO3qPWyH9jnIpfH1ZusFlRtwHFJ4oV9zDsBO+fmM4cHogUpmhZ9T69
         RgjcilHYQYC64pfN39P8vuYPiHMhrcBm65r6tRqmOaBl8OhHKrA3MTdfQKXngOXHsZMt
         9itkY8Ag8A2bLECTW3syRA53OvxN4QgzCrG+qk19pn6cqmeDi9oSJN7CvmQEzaI7b9BG
         BzGtPKkXTLBPG9MVgPBAlYwXeDZeJclFouUGGIIZWxdckd3LpAFR7HCxP16ia66/9ACz
         9zIEpJFF2ajNFouu9Rx7xuV7hTj5qmLchZPeBbnG945/8euSr32hS8mLRwa2EWWLNGu6
         CL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783153874; x=1783758674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bnTIg4b+qm3LWW9BhIg3L3anyHB6Z01GNepnsagvpI=;
        b=KQdsMy3sERYByaWhPQHdbCt2nHsdRBGknBzSP6EGEFjMBzU9b4+472dfbq0nCyFPJM
         zy3+FiaQ2wlWsW7kdSac5EKUGhKbKsmY/h23YFwEsg7WmUwPzRY2HB2ONDhLy2l7kc4h
         rdP2BfcLNzhK/3g9NYxW6Y0BO4E0y6iw1NWbbBMeWyTopYRZ0N38x0HDLrfYQrfAHvSs
         TCuq+DVta8AKoVRK0NKymAz6GgTnzh2vcFR82ZBgD2TzgSes3T//SdIWuSMAVZ5VuT6o
         1MW6niRr1E3km9aJp7U26uXrOW4e2g/rhEQEubQw1xIyIbH+HLorSsG5Fdb19apbpFik
         psYw==
X-Forwarded-Encrypted: i=1; AHgh+RrTU4HkTmugwY+4BUXUU29imoggTWgfMv4OV+YbpeEewz4czfxk4/DpdOx07yrUE1XkOLmKrgrIjJfsHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl0CxC3SFuLXveMjUJcKAFJZxDWedZz6oBtWwsUpGAZlmYNGyo
	sATnG41oPeinbk1f5uq2YGfy63YHWdCIZ0EBG9tyI92ApL0C5RMyCmbt
X-Gm-Gg: AfdE7ckyIx/KAH4jzpvOzw31aIdD14I4p+LBWuKxd3kAoyUhVW6VRFobqH6Ihs1yRhx
	aivbSVO7mV2AKCt/Bmc/1O3lBgfbHYbf7MYh6I/ISRcS/A+zBSza+p8ho/S0bvV84Wc0+A1mZim
	0Pk7X1bEW7xMr/O418sJtUlnMXXcn1D7bLCw613y5q5Cic+NAF55XLX/1QzB+nZQ9HcA3lEFRtO
	1+MfefGSkt5aMkWjfAEC+BB8KaXB2ZOGKr8nkniKtcsLxFueg9pquqIqzXocyeCe7O2vHO/kqZb
	l99TvWAyHuywknVV8Q/rXM3FgK3UX7YDVNb3zGJkC8qDmS4+vxpqs7pisrbeSBvc8WIZLUG9DHD
	UDwavJjSnrAODcPydu3GWgRVt3zzuMQMgZP8Kw3kaCmy917FmOgKVctkCuyTXdbOEHqHLVViKqJ
	NCSSsdGgpk8r1o1XXauSGac23qAzLNepWD/uQtXgXv5w==
X-Received: by 2002:a17:90b:394e:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-3811236e007mr8531640a91.16.1783153874574;
        Sat, 04 Jul 2026 01:31:14 -0700 (PDT)
Received: from primary ([223.181.23.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f376bf710sm10074745eec.6.2026.07.04.01.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:31:14 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	kernel-mentees@lists.linuxfoundation.org,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH 0/2] staging: media: ipu7: fix pm_runtime refcount leaks
Date: Sat,  4 Jul 2026 14:00:29 +0530
Message-ID: <20260704083031.8524-1-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org,lists.linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-66572-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:bingbu.cao@intel.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:kernel-mentees@lists.linuxfoundation.org,m:vidhu.linux@gmail.com,m:vidhulinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vidhulinux@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vidhulinux@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8E4E707197

pm_runtime_get_sync() is used in two places in the ipu7 driver before
accessing the device. If runtime PM resume fails, the usage count
remains incremented, but both error paths return without dropping the
reference.

Use pm_runtime_resume_and_get() instead, which balances the usage count
on failure and avoids the leaked runtime PM references. This matches the
equivalent code in the ipu6 driver.

Vidhu Sarwal (2):
  staging: media: ipu7: fix pm_runtime refcount leak in
    ipu7_init_fw_code_region_by_sys()
  staging: media: ipu7: fix pm_runtime refcount leak in ipu7_resume()

 drivers/staging/media/ipu7/ipu7.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.53.0


