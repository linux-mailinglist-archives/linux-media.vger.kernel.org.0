Return-Path: <linux-media+bounces-37104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E1AFCA0B
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 14:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 280F518918BD
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 12:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870852D97A0;
	Tue,  8 Jul 2025 12:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="LVVDpAkz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCFC19E97B;
	Tue,  8 Jul 2025 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751976269; cv=none; b=Kuuzt6QZNgNYXmcsby5AVAtxNglNBPCKYst4fGA3ZxIsJD9rYaUOyuMk01Iz5uGCIX9yHzT/iBRehzjMegI43AZgHt3vEac4pGIUUnHlGpvrfCschCm2cHE9ID/G9L7W5TW4c4jim9LupnBP0YPP2pBM1Mc+++5Kf87VhAVGRf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751976269; c=relaxed/simple;
	bh=KUkUkcbhSeIM/oEythP1t5/8OWC0g7sFV1wanOeltYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a6LrghxmlTftz7pGJNgl1ct5Hv4gQ/YjsjW54BieNeOqYj2L9ab9C2i9/URuU2z8bJ09C/5sFSvEopBBjhI6wgN8lX63ImochPTk3RDuxryEDLqDRUeu89x5zDeoRA37QfgkRuTqqdoKYS5GUqqF7rsoNC2TMGrv9DvXFcCsEVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=LVVDpAkz; arc=none smtp.client-ip=91.232.154.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=333UjN4eHKc0RjjTsjqzayuh98B9JZxJ0covjA32MJ4=; b=LVVDpAkz/KbiFXS6tXhta7ZwYn
	nw4od5X5ZYtmrxw/bokv4w1p11SL4+Gc7cvaHYw64PkIDSKN5N7DuOA/8GTk+UP9IhmsNdzm6Qv4X
	c4/CaHnJfN1/a6O6mRiOBi7Sb3vn7AbViN/rIB1jmks1eU4RKCsWfvFUpGPHhsyFV6Dm0YbHBT6z1
	yEqx68ZE53PsyFGFsF9mUyTL/KVKB5cOHEp4ARBD65DIjbfpJNJanWRzsDW9XYqgPBbn6pUxMOK/Z
	3hZpCaGRuPH+J46lWlOjF+QQJWZjaMYwOK01KFAHJ6hz52MnLYQUJyJmCJLRxa+E7kUZGtaqfi5JQ
	hcH0ENhA==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f] (helo=senjougahara.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1uZ73d-008RZp-33;
	Tue, 08 Jul 2025 15:04:22 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Tue, 08 Jul 2025 21:03:49 +0900
Subject: [PATCH] dma_buf/sync_file: Enable signaling for fences when
 querying status
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-syncfile-enable-signaling-v1-1-9f6e6cd9fcda@nvidia.com>
X-B4-Tracking: v=1; b=H4sIACQJbWgC/x2MSQqAMAwAvyI5W6iK61fEQ6xpDUiUBkQR/27xN
 Mxh5gGlyKQwZA9EOll5lyRFnoFbUQIZXpJDacvatrYzeovzvJEhwTlBOQhuLMFg31fovC+6xkL
 qj0ier/89Tu/7Aft3EkZrAAAA
X-Change-ID: 20250708-syncfile-enable-signaling-a993acff1860
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mikko Perttunen <mperttunen@nvidia.com>

dma_fence_get_status is not guaranteed to return valid information
on if the fence has been signaled or not if SW signaling has not
been enabled for the fence. To ensure valid information is reported,
enable SW signaling for fences before getting their status.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/dma-buf/sync_file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 747e377fb95417ddd506b528618a4288bea9d459..a6fd1d14dde155561b9fd2c07e6aa20dc9863a8d 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -271,6 +271,8 @@ static int sync_fill_fence_info(struct dma_fence *fence,
 	const char __rcu *timeline;
 	const char __rcu *driver;
 
+	dma_fence_enable_sw_signaling(fence);
+
 	rcu_read_lock();
 
 	driver = dma_fence_driver_name(fence);
@@ -320,6 +322,7 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
 	 * info->num_fences.
 	 */
 	if (!info.num_fences) {
+		dma_fence_enable_sw_signaling(sync_file->fence);
 		info.status = dma_fence_get_status(sync_file->fence);
 		goto no_fences;
 	} else {

---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250708-syncfile-enable-signaling-a993acff1860


