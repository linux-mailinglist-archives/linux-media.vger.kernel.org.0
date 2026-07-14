Return-Path: <linux-media+bounces-67560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VLy9J4gkVmqazwAAu9opvQ
	(envelope-from <linux-media+bounces-67560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 13:59:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA657542E9
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 13:59:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bZpA9tl5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67560-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67560-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB84B307DA0F
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 11:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F93F3B27C3;
	Tue, 14 Jul 2026 11:47:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6CB3B14AC
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 11:47:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029647; cv=none; b=XUBmHisNtYB1At8k/bNGAJkOCZHB6EpbicXlgf0RHSIS+v5NuPGSmRRYJTdNjTRDFRIGu03W+yLzJZcYF6x0BNPMjyCeXcXnPQxL5ixwbPgcvavYNlnhABZ44HgmX0+4GWRAVUsi9NWi9m5VCmImCvAWX5MBKX2DeceDiEwzpQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029647; c=relaxed/simple;
	bh=Uy7FphsDH/6m7cGZVypayztHXs5inLwbY1LCe/lb3fU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GmraLU3R9ZdLmolPbjhI/44e8bVCuXJzOlZaiTInF0/d9hN1e7C89PanO5brnuVtynKUUYYtOBApfT93+fAvOyPSfStbT5CHZISDLECF67AOwub2LHWiWfwdKOusHHHDKmVbnj0iraddE9bqOsnnze2GVAgKH8k2iNA83/UBZ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZpA9tl5; arc=none smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e1a9d9105so497853a91.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784029645; x=1784634445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XJ+pkLF/zrrWNVQ3+TJme7MRR7lpIC8LYwT0f9F3iM=;
        b=bZpA9tl51WlU+QiBJo8jM1Z6kfYLdOPx2EyT+1a8r3OVqbH93QegbWnDa/UGcM9bY3
         +ry9inNECLk6OdJlJEstk4vJA6MXI7Jd9ZINBJTkLpSp5gO6VzvS3LvVzlkztPeItCAs
         WG2urDN7YBP3O+O9+0p7gKTTBdaMtl2LT2+eFlIbh/oCIIZ3BIpZGLmO42E0xV7UY/gg
         J5iU6zUpyfZFUleDZp5kSFv5sgrBv3hYWdb9a337HwzyjUbBCkpDHdG4Zzl/dB7yTPs6
         LczNcdEfMHygENFbb8nBwtQnRlh1ZO18wFyixHoduDuGUPh7w86NSfOPov6qVFroFXJJ
         pdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784029645; x=1784634445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XJ+pkLF/zrrWNVQ3+TJme7MRR7lpIC8LYwT0f9F3iM=;
        b=ma5ey1fSXnWD0vl7l13aiguxguIqu+25f2uh75H9v7s18kyjNvud+fVgpQmej93En+
         KiD2qwucArB3Au9ejMagxkBzE8Gn42PZBfPWWDjhpL/CqJRVx809m5QaQ6z2fjdLS0jj
         plCd+RVbPsW0Q7i2BnHO8rdetgMk0OZIkHsf6uiEl4pQK2kgCHX4cFJ8srYJjc7fFLOs
         uOPLRyIFe97csBQ71pbH/z3GBMUynojfzsuhRmrUEZkvhz0t1AubaZbD0rf8hGpiqjsO
         m1Vvst6etgJxiUPQMGz9ZnWrhBSQKSWjSnVkmYR3H87dPjPyc5ExESd1yREJjsYzMs19
         7afA==
X-Forwarded-Encrypted: i=1; AHgh+Roextw0iPo7Y+XyCMSRk+gdJh2Ir+huY+iFPA6ekoB0pw1vOp/0NjPgBb6Yg/58+ZJP7rxP17hxBM3VnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgAge/76rFfApA3qOe9lmhDOGx9TrfD+aW7sU2eNwaZYsDHfZU
	UQFU8XRC1T39ZPggC6w7EMLGCPmlXKZWMiyUhrXKVs1yc9DMkF70Tf80URYOVHOL
X-Gm-Gg: AfdE7cl5vJXj6yPaKSuyIC/Oz63IKOBCvkG1MWrd2uQubqSKle31Q7TV+bJm4uzS7i9
	2dW9OO+I7w3w4lw6U6SkN8sZtLHIMuSh5KSGR2f6Hdo5JXV9xXEV8rM98hoeANnnyQ+I1pHi2KU
	MDN+1ZO4cxdk1c87JW1xFSPUB8lZQw/goMqvD00Fd/M/J6hOWJVWRfsGLOmJvRkYwv7ZlDtcUeb
	fVkDsiDCPqE5bQ8Q/jvX6aSMmBxHV9gMlYQqgyXrZogyVcmuwLk1uwjbGvCymrePqe9YReHfWbt
	JwSMGcwgGQQ0dSqkfHv1AUPzVxIq6kciHkh8w/5Q1o0/yPXa/0P+wcUtyUjrz25sGWWpqGJE6IW
	lolBzN8TejFK9e2tmgAebZsVWngz26SXJBDEA4DDjxKhdX7Vc1Yo91JvJy+3QnUmvmYom+jjX0C
	lFGyi4RY6MdeL0H6LG
X-Received: by 2002:a17:90b:3dcb:b0:387:e0bb:5804 with SMTP id 98e67ed59e1d1-38dc7bc50femr12271219a91.43.1784029644922;
        Tue, 14 Jul 2026 04:47:24 -0700 (PDT)
Received: from baineng-pc.. ([117.133.183.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e17470008sm1356162a91.17.2026.07.14.04.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:47:24 -0700 (PDT)
From: Baineng Shou <shoubaineng@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Sandeep Patil <sspatil@android.com>,
	"Andrew F . Davis" <afd@ti.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: stable@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Baineng Shou <shoubaineng@gmail.com>
Subject: [PATCH v3 2/2] misc: fastrpc: don't publish fd before copy_to_user() succeeds
Date: Tue, 14 Jul 2026 19:46:54 +0800
Message-Id: <20260714114654.3885457-3-shoubaineng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714114654.3885457-1-shoubaineng@gmail.com>
References: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
 <20260714114654.3885457-1-shoubaineng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.linaro.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67560-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tjmercier@google.com,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:sspatil@android.com,m:afd@ti.com,m:srini@kernel.org,m:stable@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:shoubaineng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shoubaineng@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AA657542E9

fastrpc_ioctl_alloc_dmabuf() calls dma_buf_fd() which installs the fd
into the caller's fd table before copy_to_user() copies the fd number
back to userspace.  If copy_to_user() fails, the fd is already visible
to other threads in the same process but the ioctl returns -EFAULT.
The existing comment in the code even acknowledges the problem:

  "The usercopy failed, but we can't do much about it, as dma_buf_fd()
   already called fd_install()..."

Now that dma_buf_fd_install() is available (introduced to fix the same
issue in dma-heap), apply the same pattern here: reserve the fd with
get_unused_fd_flags(), attempt copy_to_user(), and only on success call
dma_buf_fd_install() to publish it atomically with the tracepoint.  On
copy_to_user() failure, put_unused_fd() and dma_buf_put() cleanly
unwind without any user-visible side effects.

Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
Cc: stable@vger.kernel.org
Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
---
 drivers/misc/fastrpc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f3a49384586d..c5143cd25767 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1709,24 +1709,20 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	bp.fd = dma_buf_fd(buf->dmabuf, O_ACCMODE);
+	bp.fd = get_unused_fd_flags(O_ACCMODE);
 	if (bp.fd < 0) {
 		dma_buf_put(buf->dmabuf);
-		return -EINVAL;
+		return bp.fd;
 	}
 
 	if (copy_to_user(argp, &bp, sizeof(bp))) {
-		/*
-		 * The usercopy failed, but we can't do much about it, as
-		 * dma_buf_fd() already called fd_install() and made the
-		 * file descriptor accessible for the current process. It
-		 * might already be closed and dmabuf no longer valid when
-		 * we reach this point. Therefore "leak" the fd and rely on
-		 * the process exit path to do any required cleanup.
-		 */
+		put_unused_fd(bp.fd);
+		dma_buf_put(buf->dmabuf);
 		return -EFAULT;
 	}
 
+	dma_buf_fd_install(buf->dmabuf, bp.fd);
+
 	return 0;
 }
 
-- 
2.34.1


