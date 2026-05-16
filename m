Return-Path: <linux-media+bounces-61789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFHBCNJPCGoMjAMAu9opvQ
	(envelope-from <linux-media+bounces-61789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:06:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7CB55B45F
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 13:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0702D3007B83
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 11:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11F93D5677;
	Sat, 16 May 2026 11:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdVTmOB+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4522E3D3D08
	for <linux-media@vger.kernel.org>; Sat, 16 May 2026 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929608; cv=none; b=GyHQm43DQ57ZXRi3ogGyxNRPvD5guLWb4GVFp8i8Vv7kDFEfk1S/d2E9pBPrV2PTy0tKKVDuisMwI4vQzeKAQe2unSk5IxwQ6sZLpBdnsp7UE2YpEFiot+XdRh6qx8g4yiqX7EA5tmCLmHxxEXtnQBasR9SdIifoaVuBRMJeKLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929608; c=relaxed/simple;
	bh=xGLM080fZDT6fjgKMdHlzv2Fg/jga2+0PO1niQABJfY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u6Y1EBL/GrShK6DHk7795alX6umIQdL87PPlUk7Tn8dNLf8N9zi+cM8prDO/ZLuLPy2ryuQ5c+oZOlmW1NOSthiXB0/ChbWBl3ByIETtuGNF1/RU/ySRHBKfw5dohoPJ6/0uqmGY9WqIcWI993+nm6MySuej08fEhdeQ59fGdq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdVTmOB+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so4171725e9.2
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 04:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929604; x=1779534404; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gz4+cZA8LSphozrVyKGbCKvf5hEOiKCi+FAiUdVKJ/A=;
        b=sdVTmOB+f9mZPSjk+s5pVWCST2ytO0fkDfznZQ6Lxi5LJSWYYYMcJB6M4A1VmiOTSA
         a9JhqTzs9OXoCXi8QtWlvU2sC7PJ3wA5BGq2NQc5JAI4ow14jTLPj+K7yiYweB6/ffhy
         pZhQGA5OA2RoodqOOXNytDnEbcCygV5Ry26VP9cW0N7MqceR73kVr4epNlX7hBlSoN1S
         +w+TNUqJB0q+YUxdz/e9p4ZmPGWKWJlHivjqZ83pFLikKfTGde7iUL87lRS0XLZw8c5c
         +uOFTwGmoeAvx2HLIL09HVSpTQxH3cVZBw+LnSLldYjL7nNpyXuOKxYP+yQtgOVFHQwE
         lgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929604; x=1779534404;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gz4+cZA8LSphozrVyKGbCKvf5hEOiKCi+FAiUdVKJ/A=;
        b=ZOW51JvxYsohp9TRblXMjzLdSPUD21WKH0XPgfXucnubXu+SnSKLLRfXAmYcuq2U6/
         x0QjoBgkktqKYCdulsOAB2Ky07ta2FPGdAajkFOn9eDXQ2deggz7LdTtBniBSgx8/yS4
         skC9prcWw/P4DLBI7vcUUT5H2ISZJxsEesUkuEnffTtbfkL984ppcvsZeMQSnBzlgv3B
         EWjsn0ym6rA1zI13f7k+5IoorTQHJ2J1r9K/oknRiEuGgG/UPjtgbtUCsa2RgJgpEWNG
         YROfXE9WdgqqcrkmlnOHD8e3IV1sFJctoTi0I0MQcGEDSzdJ636bxCB8UuAhQr1mOrQC
         i9MQ==
X-Forwarded-Encrypted: i=1; AFNElJ/R4zis4W2OOxWqMx6gp3zOG2sEZt/WJfsnQqO05CTUvehFlGQc7tN1h6viF/l/XdrqXQQarxZuM/46/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz11VU1Rs7WAckthKnEcGI9UGQw+GMO00xx+9Ld+mPuzSeMFOGS
	0cAwODbZMC3d4JSgFX826X89XTqUdl7ygnBipxSPb/+2PBH4O6RFBXxoc38933cq
X-Gm-Gg: Acq92OEpBwinSV6ZhX4IlbKaza7VMzvA4p3k49FrHl0IqxoNHDGIhu2tcrjT1nwIQ8e
	6G0AS8MNdDCQaiFALWJIuVnvUQhroAkNr3EQ/35V+R07s8oNo6U6MKKPsOY4CVbFCmsspcruO4a
	1svj6Y3u7W+GZVNpnARehfWlRB0tRi72Jn+1tAbtSRKRUbCd7JNYzecfgBi0iuP44woo2R5K2lm
	XR2OFOFYubQsXCbHVADFPRXME47TtgOKn2iCoRm+0q+2Y3h3i4T7b8B8JrSYt77dWNyCSWdiLiQ
	Y9CzWdQf/bf/VB72vh+jHlEAv96afB3gGbLJ5GQFHLFkQx2u9UJuZKXfis6ctpv6r/eo8AaVaRV
	Qa3ijgtyOQS8PnnKZI1QpjBjqXgzK2tT5u8YCgUkmsWT0u17r6ijpx7h78HRrymxswiCY46uXES
	Az7URiPaRicDSpKj5vBXhB5ivgyBZCHvNvnVJTrTCVkHOCI8QDuTgIJmy+NUs6gjc2MpJ+tYity
	2qyLH9RGAw4jx9KLA==
X-Received: by 2002:a05:600c:8b45:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48fe63253f3mr102196835e9.21.1778929604120;
        Sat, 16 May 2026 04:06:44 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:43 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Subject: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
Date: Sat, 16 May 2026 13:06:03 +0200
Message-Id: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0Mz3az8opIM3eLKvOT8pCzdFJMUY3OTZItkM8MkJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAM1IAHdxAAAA
X-Change-ID: 20260516-jorth-syncobj-d4d374c8c61b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=3472;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=xGLM080fZDT6fjgKMdHlzv2Fg/jga2+0PO1niQABJfY=;
 b=zo0vZL9hPQu19bKw29wiQABC4vBPxw410iM5DsRWLuc6m/S5L7nGm9ePhoRvAq++IQEZPRF8E
 59xKe6ltBezDBB645EtSqjyATdjsklrspEITvGiRK0KsaSfJfdtER39
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=
X-Rspamd-Queue-Id: AE7CB55B45F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61789-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series adds a new device /dev/syncobj that can be used to create
and manipulate DRM syncobjs. Previously, these operations required the
use of a DRM device and the device needed to support the DRIVER_SYNCOBJ
and DRIVER_SYNCOBJ_TIMELINE features.

There are several issues with the existing API:

- Syncobjs are the only explicit sync mechanism available on wayland.
  Most compositors do not use GPU waits. Instead, they use the
  DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a CPU wait. Being tied to
  DRM devices means that compositors cannot consistently offer this
  feature even though no device-specific logic is involved.
- llvmpipe currently cannot offer syncobj interop because it does not
  have access to a DRM device. This means that applications using
  llvmpipe cannot present images before they have finished rendering,
  despite llvmpipe using threaded rendering.
- Clients that do not use the Vulkan WSI need to manually probe /dev/dri
  for devices that support the syncobj ioctls in order to use the
  wayland syncobj protocol.
- Similarly, clients that want to use screen capture have no equivalent
  to the WSI and are therefore forced into that path.
- Having to keep a DRM device open has potentially negative interactions
  with GPU hotplug.
- Having to translate between syncobj FDs and handles is troublesome in
  the compositor usecase since syncobjs come and go frequently and need
  to be cleaned up when clients disconnect.

/dev/syncobj solves these issues by providing all syncobj ioctls under a
consistent path that is not tied to any DRM device. It also operates
directly on file descriptors instead of syncobj handles.

The series starts with a number of small refactorings in drm_syncobj.c
to make its functionality available outside of the file and without the
need for drm_file/handle pairs.

The last commit adds the /dev/syncobj module. I've added it as a misc
device but maybe this should instead live somewhere under gpu/drm.

An application using the new interface can be found at [1].

[1]: https://github.com/mahkoh/jay/pull/947

---
Julian Orth (12):
      drm/syncobj: add drm_syncobj_from_fd
      drm/syncobj: add drm_syncobj_fence_lookup
      drm/syncobj: make drm_syncobj_array_wait_timeout public
      drm/syncobj: add drm_syncobj_register_eventfd
      drm/syncobj: have transfer functions accept drm_syncobj directly
      drm/syncobj: add drm_syncobj_transfer
      drm/syncobj: add drm_syncobj_timeline_signal
      drm/syncobj: add drm_syncobj_query
      drm/syncobj: fix resource leak in drm_syncobj_import_sync_file_fence
      drm/syncobj: add drm_syncobj_import_sync_file
      drm/syncobj: add drm_syncobj_export_sync_file
      misc/syncobj: add new device

 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 drivers/gpu/drm/drm_syncobj.c                      | 374 ++++++++++++++-----
 drivers/misc/Kconfig                               |  10 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/syncobj.c                             | 404 +++++++++++++++++++++
 include/drm/drm_syncobj.h                          |  21 ++
 include/uapi/linux/syncobj.h                       |  75 ++++
 7 files changed, 795 insertions(+), 91 deletions(-)
---
base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
change-id: 20260516-jorth-syncobj-d4d374c8c61b

Best regards,
--  
Julian Orth <ju.orth@gmail.com>


