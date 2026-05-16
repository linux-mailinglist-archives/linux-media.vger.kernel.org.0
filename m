Return-Path: <linux-media+bounces-61801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIVKD0FRCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:13:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC7455B646
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06C293057D52
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31333DC87F;
	Sat, 16 May 2026 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nI/gT4DS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64373D47D2
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929629; cv=none; b=EGLTCHhn0Tk+WwJgSRd9nUc8hj9QG7h+OryJhHuZt/0/BkjLwSksHRlGEwsbDtew2telor0bQ1MHLyjYAPvaFMQLwkhpc+IqoRjZOaBx49CPEP1DrSnGXScp3f5Uw222ShTXPduItjZm6TxdHbAtdY8bnK7cGjpT+giydKhnNU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929629; c=relaxed/simple;
	bh=WhzJjcCvKJj2CD2b9qjHPi70/JQ1jm0ddKfGtp0BfmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6WIiKMIXuL6dca46oH+mMnA4+DdKyt5Wf7u4PdpJbz1Pm3p7C8PtdrX04xApwOmbK0YNvSnuiF/fe/8Fxat1ds1GonkBzCmNjjbCEwNCZqZbrS/BDIZFGi9MdWBOkQo+9V4uGyd3Qq1WTHlaMV3/4ct98d1Cfz2idIUXwA3ogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nI/gT4DS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so6620135e9.2
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929620; x=1779534420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZ3vDaJ2jqpNbKxKrO5UqJVvEsFWMV1I/ds8vkY2noo=;
        b=nI/gT4DSrXKMPYnOkBeX3O25ixeZLWFXV38sS4Z/BjJAHV2Lsqr1Y7oXxWFGVCe7UC
         pxmzga5wgkhQt30bm+tJ5NaFp1MQZrIXf+jguOHUBW8HiW1yCSTzDRnjmWkM+hhbEzMb
         Xktjr0KS46/n6vHbyQg15IbwJGdpHxty5gmqhxPfwEX4bjuMwnBjNgSrcuPk+qKQayCO
         9xZrINk9wEeiaCo90xWSuudJyYfEt6eoZMmktVs6qDgh47SEZ6tyXtpJPYDOAG554Gjh
         FuCUem0dGsAstTy4c6Bo/hknzV/kBz7J8AswblP8kiZ1rQ3d9CwPJJ/1gSzNakGMPGdE
         nw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929620; x=1779534420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GZ3vDaJ2jqpNbKxKrO5UqJVvEsFWMV1I/ds8vkY2noo=;
        b=IxMoP1121NG9A7R3aOQ0PEJ9TLaLx3TbdDf2zfuK9Z/ab0ZtlAloELPZBZZZ3kJw/Z
         gvovqJSrK2apIE07+i3syeEHmmlu3UC5/14sUP/OJ0PS0cYQ2ynOTlwXy8UE4uObxDzz
         EFKWzlH/fiLDqG1hDl/imbVRQmDAK75s64PWEDUiyUKQ0uDE5FwbpWrSQIg/imU8xJyG
         ECfd7IszfFxawhm8QJUaGXI1Rv6SBOAhTYdrFlejXr2DvAjJH3ad5tUc0qvOq9oHrhGB
         akiCRBEmVi9JVwgPkwnSb6AcrlfI+WtXijyWU8KKVrY+SVjxYZSkGAIugd4USk0V95/r
         1rUw==
X-Forwarded-Encrypted: i=1; AFNElJ+H9kHaMkhoAoLzN/UdlpKyrmOf22Eg7CqnezngBCSlKLkSDz/D5sLqTjf+y7fk8Ttx3rq2VaMWfhqDhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1XRZwHD8WLxITX8X+4P5hXtRMDnjulyG/26za4IKIy4Dad+FD
	J+Uh0qwXkh+RGGjuEybbbaZiDX4DCNweZ2qRzFQhqP6KOerVBZF9LT8CQwwrb0Wl
X-Gm-Gg: Acq92OFZjXU7w0WD3yh+Gsw+kzQI+j/vtYWji4xi/Zbu05Ksmzb8RpSQ1EdO9HFpKbq
	xI19cghbY42vzYjwPrHRi/J8luyb0eAPEdflrZmVfTEtLhXSMC0f4C4qtvuyszGtgOepzMbagls
	kQJK3HhP8n77BC7wa8WkJJFtoTzfqOYKxALcmQHFY8mOWV3N+neVYcB6JvYlnSox2B0jOqV/KKS
	UyFHYYDZvQHgO0HIzlzWOP2WwyTQDyVWaBlveHGAoGAAVSh3lDO5WqiiwWK9aJI/9aQuSEbQHUF
	hjpe1S1CB1S77wo9DQWR+pk7B2DhH3HphJgoHZvKtnVijq2VNye0lyQgSqCvtc/fbN6rCK1Trbt
	hYsCBr4bOtlxIEHGuyWn/cNnMvIqB5k6uTHGzV8Jq2o35ZjWfNXLOHnvNc2g/OsPeNQdI1RxKWB
	izrDbFm4Fy6+WLqExG9agT2TV1o6rEm0yyKqqWxz+nRquLjV6+djokDwHUQyNWIbBX1S3YBTs87
	nBpuEM=
X-Received: by 2002:a05:600c:4fc9:b0:48a:7a10:4f17 with SMTP id 5b1f17b1804b1-48fe60e50b9mr96881595e9.6.1778929620265;
        Sat, 16 May 2026 04:07:00 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:59 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Date: Sat, 16 May 2026 13:06:15 +0200
Subject: [PATCH 12/12] misc/syncobj: add new device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-jorth-syncobj-v1-12-88ede9d98a81@gmail.com>
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
In-Reply-To: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 ju.orth@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=15478;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=WhzJjcCvKJj2CD2b9qjHPi70/JQ1jm0ddKfGtp0BfmM=;
 b=jK2Bs4uyWC+jcOGk8NJpgy6AhVj99OtKJKeddomFMCahmbTtCGP/1EMGI3Uk76dKu/2he7YQr
 MHj5Bk+wIAfC0Qq8ZU8mGV3xEfWXNYUa3uV6jFFeOZROh9bhflVxWag
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: BEC7455B646
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61801-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lwn.net,linuxfoundation.org,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linaro.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,shuttle.de:email]
X-Rspamd-Action: no action

This device makes the DRM_IOCTL_SYNCOBJ_* ioctls available via a
dedicated device. This allows applications to use syncobjs without
having to open device nodes in /dev/dri, on systems that don't have any
such nodes, or on systems whose devices don't support the
DRIVER_SYNCOBJ_TIMELINE feature.

Wayland uses syncobjs as its buffer synchronization mechanism. Most
compositors use the DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a pure
CPU wait for syncobj point. DRM devices are not involved in this process
except insofar that a DRM device needs to be used to access the ioctl.

Similarly, a software-rendered client might perform rendering on a
dedicated thread and use the wayland syncobj protocol to submit frames
before they finish rendering. Again, this does not involve DRM devices
except insofar ... as above.

As an added benefit, this device removes the need to translate between
file descriptors and handles.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 drivers/misc/Kconfig                               |  10 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/syncobj.c                             | 404 +++++++++++++++++++++
 include/uapi/linux/syncobj.h                       |  75 ++++
 5 files changed, 491 insertions(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 331223761fff..5e140ae5735e 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -395,6 +395,7 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:michael.klein@puffin.lb.shuttle.de>
 0xCC  00-0F  drivers/misc/ibmvmc.h                                     pseries VMC driver
 0xCD  01     linux/reiserfs_fs.h                                       Dead since 6.13
+0xCD  00-0F  uapi/linux/syncobj.h
 0xCE  01-02  uapi/linux/cxl_mem.h                                      Compute Express Link Memory Devices
 0xCF  02     fs/smb/client/cifs_ioctl.h
 0xDD  00-3F                                                            ZFCP device driver see drivers/s390/scsi/
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 00683bf06258..c1e7749bd356 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -644,6 +644,16 @@ config MCHP_LAN966X_PCI
 	    - lan966x-miim (MDIO_MSCC_MIIM)
 	    - lan966x-switch (LAN966X_SWITCH)
 
+config SYNCOBJ_DEV
+	tristate "DRM syncobj device (/dev/syncobj)"
+	depends on DRM
+	help
+	  Creates a /dev/syncobj device node that provides DRM synchronization
+	  objects (syncobjs) without requiring a DRM device.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called syncobj.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index b32a2597d246..9e5deb1d0d76 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -75,3 +75,4 @@ obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
 obj-y				+= amd-sbi/
 obj-$(CONFIG_MISC_RP1)		+= rp1/
+obj-$(CONFIG_SYNCOBJ_DEV)	+= syncobj.o
diff --git a/drivers/misc/syncobj.c b/drivers/misc/syncobj.c
new file mode 100644
index 000000000000..11ef46ddfeef
--- /dev/null
+++ b/drivers/misc/syncobj.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * syncobj.c - Standalone device for syncobj manipulation.
+ *
+ * Copyright (C) 2026 Julian Orth <ju.orth@gmail.com>
+ */
+
+#include <linux/fdtable.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+#include <drm/drm_syncobj.h>
+#include <drm/drm_utils.h>
+#include <uapi/drm/drm.h>
+#include <uapi/linux/syncobj.h>
+
+static int syncobj_array_find(void __user *user_fds, u32 count,
+			      struct drm_syncobj ***syncobjs_out)
+{
+	u32 i;
+	s32 *fds;
+	struct drm_syncobj **syncobjs;
+	int ret;
+
+	fds = kmalloc_array(count, sizeof(*fds), GFP_KERNEL);
+	if (!fds)
+		return -ENOMEM;
+
+	if (copy_from_user(fds, user_fds, sizeof(s32) * count)) {
+		ret = -EFAULT;
+		goto err_free_fds;
+	}
+
+	syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
+	if (!syncobjs) {
+		ret = -ENOMEM;
+		goto err_free_fds;
+	}
+
+	for (i = 0; i < count; i++) {
+		syncobjs[i] = drm_syncobj_from_fd(fds[i]);
+		if (!syncobjs[i]) {
+			ret = -EBADF;
+			goto err_put_syncobjs;
+		}
+	}
+
+	kfree(fds);
+	*syncobjs_out = syncobjs;
+	return 0;
+
+err_put_syncobjs:
+	while (i-- > 0)
+		drm_syncobj_put(syncobjs[i]);
+	kfree(syncobjs);
+err_free_fds:
+	kfree(fds);
+	return ret;
+}
+
+static void syncobj_array_free(struct drm_syncobj **syncobjs, u32 count)
+{
+	u32 i;
+
+	for (i = 0; i < count; i++)
+		drm_syncobj_put(syncobjs[i]);
+	kfree(syncobjs);
+}
+
+static int syncobj_ioctl_create(void __user *argp)
+{
+	struct syncobj_create_args args;
+	struct drm_syncobj *syncobj;
+	int fd, ret;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	if (args.flags & ~SYNCOBJ_CREATE_SIGNALED)
+		return -EINVAL;
+
+	static_assert(SYNCOBJ_CREATE_SIGNALED == DRM_SYNCOBJ_CREATE_SIGNALED);
+
+	ret = drm_syncobj_create(&syncobj, args.flags, NULL);
+	if (ret)
+		return ret;
+
+	ret = drm_syncobj_get_fd(syncobj, &fd);
+	drm_syncobj_put(syncobj);
+	if (ret)
+		return ret;
+
+	args.fd = fd;
+	if (copy_to_user(argp, &args, sizeof(args))) {
+		close_fd(fd);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int syncobj_ioctl_wait(void __user *argp)
+{
+	struct syncobj_wait_args args;
+	struct drm_syncobj **syncobjs;
+	signed long timeout;
+	u32 first = ~0;
+	ktime_t t, *tp = NULL;
+	int ret;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	if (args.flags & ~(SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
+			   SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
+			   SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE |
+			   SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE))
+		return -EINVAL;
+
+	static_assert(SYNCOBJ_WAIT_FLAGS_WAIT_ALL        == DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL);
+	static_assert(SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT == DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT);
+	static_assert(SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE  == DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE);
+	static_assert(SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE   == DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE);
+
+	if (args.pad)
+		return -EINVAL;
+
+	if (args.count == 0)
+		return 0;
+
+	ret = syncobj_array_find(u64_to_user_ptr(args.fds),
+				 args.count, &syncobjs);
+	if (ret < 0)
+		return ret;
+
+	if (args.flags & SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
+		t = ns_to_ktime(args.deadline_nsec);
+		tp = &t;
+	}
+
+	timeout = drm_timeout_abs_to_jiffies(args.timeout_nsec);
+	timeout = drm_syncobj_array_wait_timeout(syncobjs,
+						 u64_to_user_ptr(args.points),
+						 args.count,
+						 args.flags,
+						 timeout, &first, tp);
+
+	syncobj_array_free(syncobjs, args.count);
+
+	if (timeout < 0)
+		return timeout;
+
+	args.first_signaled = first;
+	if (copy_to_user(argp, &args, sizeof(args)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int syncobj_ioctl_reset(void __user *argp)
+{
+	struct syncobj_array_args args;
+	struct drm_syncobj **syncobjs;
+	u32 i;
+	int ret;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	if (args.flags)
+		return -EINVAL;
+
+	if (args.points)
+		return -EINVAL;
+
+	if (args.count == 0)
+		return -EINVAL;
+
+	ret = syncobj_array_find(u64_to_user_ptr(args.fds),
+				 args.count, &syncobjs);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < args.count; i++)
+		drm_syncobj_replace_fence(syncobjs[i], NULL);
+
+	syncobj_array_free(syncobjs, args.count);
+	return 0;
+}
+
+static int syncobj_ioctl_signal(void __user *argp)
+{
+	struct syncobj_array_args args;
+	struct drm_syncobj **syncobjs;
+	int ret;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	if (args.flags)
+		return -EINVAL;
+
+	if (args.count == 0)
+		return -EINVAL;
+
+	ret = syncobj_array_find(u64_to_user_ptr(args.fds),
+				 args.count, &syncobjs);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_syncobj_timeline_signal(syncobjs, args.points, args.count);
+
+	syncobj_array_free(syncobjs, args.count);
+	return ret;
+}
+
+static int syncobj_ioctl_query(void __user *argp)
+{
+	struct syncobj_array_args args;
+	struct drm_syncobj **syncobjs;
+	int ret;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	if (args.flags & ~SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED)
+		return -EINVAL;
+
+	static_assert(SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED == DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED);
+
+	if (args.count == 0)
+		return -EINVAL;
+
+	ret = syncobj_array_find(u64_to_user_ptr(args.fds),
+				 args.count, &syncobjs);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_syncobj_query(syncobjs, args.points, args.count, args.flags);
+
+	syncobj_array_free(syncobjs, args.count);
+	return ret;
+}
+
+static int syncobj_ioctl_transfer(void __user *argp)
+{
+	struct syncobj_transfer_args args;
+	struct drm_syncobj *src, *dst;
+	int ret;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	if (args.pad)
+		return -EINVAL;
+
+	if (args.flags & ~SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
+		return -EINVAL;
+
+	static_assert(SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT == DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT);
+
+	src = drm_syncobj_from_fd(args.src_fd);
+	if (!src)
+		return -EBADF;
+
+	dst = drm_syncobj_from_fd(args.dst_fd);
+	if (!dst) {
+		drm_syncobj_put(src);
+		return -EBADF;
+	}
+
+	ret = drm_syncobj_transfer(src, args.src_point,
+				   dst, args.dst_point, args.flags);
+
+	drm_syncobj_put(dst);
+	drm_syncobj_put(src);
+
+	return ret;
+}
+
+static int syncobj_ioctl_eventfd(void __user *argp)
+{
+	struct syncobj_eventfd_args args;
+	struct drm_syncobj *syncobj;
+	int ret;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	if (args.flags & ~SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)
+		return -EINVAL;
+
+	static_assert(SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE == DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE);
+
+	if (args.pad)
+		return -EINVAL;
+
+	syncobj = drm_syncobj_from_fd(args.syncobj_fd);
+	if (!syncobj)
+		return -EBADF;
+
+	ret = drm_syncobj_register_eventfd(syncobj, args.eventfd,
+					   args.point, args.flags);
+
+	drm_syncobj_put(syncobj);
+
+	return ret;
+}
+
+static int syncobj_ioctl_export_sync_file(void __user *argp)
+{
+	struct syncobj_sync_file_args args;
+	struct drm_syncobj *syncobj;
+	int ret;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	syncobj = drm_syncobj_from_fd(args.syncobj_fd);
+	if (!syncobj)
+		return -EBADF;
+
+	ret = drm_syncobj_export_sync_file(syncobj, args.point,
+					   &args.sync_file_fd);
+	drm_syncobj_put(syncobj);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(argp, &args, sizeof(args))) {
+		close_fd(args.sync_file_fd);
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static int syncobj_ioctl_import_sync_file(void __user *argp)
+{
+	struct syncobj_sync_file_args args;
+	struct drm_syncobj *syncobj;
+	int ret;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	syncobj = drm_syncobj_from_fd(args.syncobj_fd);
+	if (!syncobj)
+		return -EBADF;
+
+	ret = drm_syncobj_import_sync_file(syncobj, args.sync_file_fd,
+					   args.point);
+
+	drm_syncobj_put(syncobj);
+
+	return ret;
+}
+
+static long syncobj_dev_ioctl(struct file *file, unsigned int cmd,
+			      unsigned long arg)
+{
+	void __user *argp = (void __user *)arg;
+
+	switch (cmd) {
+	case SYNCOBJ_IOC_CREATE:
+		return syncobj_ioctl_create(argp);
+	case SYNCOBJ_IOC_WAIT:
+		return syncobj_ioctl_wait(argp);
+	case SYNCOBJ_IOC_RESET:
+		return syncobj_ioctl_reset(argp);
+	case SYNCOBJ_IOC_SIGNAL:
+		return syncobj_ioctl_signal(argp);
+	case SYNCOBJ_IOC_QUERY:
+		return syncobj_ioctl_query(argp);
+	case SYNCOBJ_IOC_TRANSFER:
+		return syncobj_ioctl_transfer(argp);
+	case SYNCOBJ_IOC_EVENTFD:
+		return syncobj_ioctl_eventfd(argp);
+	case SYNCOBJ_IOC_EXPORT_SYNC_FILE:
+		return syncobj_ioctl_export_sync_file(argp);
+	case SYNCOBJ_IOC_IMPORT_SYNC_FILE:
+		return syncobj_ioctl_import_sync_file(argp);
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
+static const struct file_operations syncobj_dev_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= syncobj_dev_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+};
+
+static struct miscdevice syncobj_misc = {
+	.minor	= MISC_DYNAMIC_MINOR,
+	.name	= "syncobj",
+	.fops	= &syncobj_dev_fops,
+	.mode	= 0666,
+};
+
+module_misc_device(syncobj_misc);
+
+MODULE_AUTHOR("Julian Orth");
+MODULE_DESCRIPTION("DRM syncobj device");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/syncobj.h b/include/uapi/linux/syncobj.h
new file mode 100644
index 000000000000..c4068fbd5773
--- /dev/null
+++ b/include/uapi/linux/syncobj.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_SYNCOBJ_H_
+#define _UAPI_LINUX_SYNCOBJ_H_
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+#define SYNCOBJ_CREATE_SIGNALED			(1 << 0)
+
+#define SYNCOBJ_WAIT_FLAGS_WAIT_ALL		(1 << 0)
+#define SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT	(1 << 1)
+#define SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE	(1 << 2)
+#define SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE	(1 << 3)
+
+#define SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED	(1 << 0)
+
+struct syncobj_create_args {
+	__s32 fd;
+	__u32 flags;
+};
+
+struct syncobj_wait_args {
+	__u64 fds;
+	__u64 points;
+	__s64 timeout_nsec;
+	__u32 count;
+	__u32 flags;
+	__u32 first_signaled;
+	__u32 pad;
+	__u64 deadline_nsec;
+};
+
+struct syncobj_array_args {
+	__u64 fds;
+	__u64 points;
+	__u32 count;
+	__u32 flags;
+};
+
+struct syncobj_transfer_args {
+	__s32 src_fd;
+	__s32 dst_fd;
+	__u64 src_point;
+	__u64 dst_point;
+	__u32 flags;
+	__u32 pad;
+};
+
+struct syncobj_eventfd_args {
+	__s32 syncobj_fd;
+	__s32 eventfd;
+	__u64 point;
+	__u32 flags;
+	__u32 pad;
+};
+
+struct syncobj_sync_file_args {
+	__s32 syncobj_fd;
+	__s32 sync_file_fd;
+	__u64 point;
+};
+
+#define SYNCOBJ_IOC_BASE		0xCD
+
+#define SYNCOBJ_IOC_CREATE		_IOWR(SYNCOBJ_IOC_BASE, 0, struct syncobj_create_args)
+#define SYNCOBJ_IOC_WAIT		_IOWR(SYNCOBJ_IOC_BASE, 1, struct syncobj_wait_args)
+#define SYNCOBJ_IOC_RESET		_IOW(SYNCOBJ_IOC_BASE,  2, struct syncobj_array_args)
+#define SYNCOBJ_IOC_SIGNAL		_IOW(SYNCOBJ_IOC_BASE,  3, struct syncobj_array_args)
+#define SYNCOBJ_IOC_QUERY		_IOW(SYNCOBJ_IOC_BASE,  4, struct syncobj_array_args)
+#define SYNCOBJ_IOC_TRANSFER		_IOW(SYNCOBJ_IOC_BASE,  5, struct syncobj_transfer_args)
+#define SYNCOBJ_IOC_EVENTFD		_IOW(SYNCOBJ_IOC_BASE,  6, struct syncobj_eventfd_args)
+#define SYNCOBJ_IOC_EXPORT_SYNC_FILE	_IOWR(SYNCOBJ_IOC_BASE, 7, struct syncobj_sync_file_args)
+#define SYNCOBJ_IOC_IMPORT_SYNC_FILE	_IOW(SYNCOBJ_IOC_BASE,  8, struct syncobj_sync_file_args)
+
+#endif /* _UAPI_LINUX_SYNCOBJ_H_ */

-- 
2.54.0


