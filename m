Return-Path: <linux-media+bounces-56165-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IzLIfrtuWnPPgIAu9opvQ
	(envelope-from <linux-media+bounces-56165-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 01:12:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC602B4906
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 01:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C0733137AFF
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 00:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6098B481DD;
	Wed, 18 Mar 2026 00:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4ryhp7u"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F8D1A285
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 00:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773792662; cv=none; b=r3AYrMu/qdpHrEST0RsmJcqapUv2olbNAILWfijSSOqh1TwsU/JOVcPxxtz3jJApBQAx38CnIuTEXVB3voFpmyoAHxM6gxhcl54qNBKR1kBXtAPkxVjn/QDWeyanHiO4E94WsGJtHMJec8i8NJ3qUrURcP6yQ4dOtYD83MickFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773792662; c=relaxed/simple;
	bh=iuAtwXulJKrQPifPr5vdqOnE8HfpABHuYPihkLVFOew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbjMfM8wPdW/wtW1KmHLl04b7+iILsUsZIZ5qPUKpHvNd3MywM7vuqb3zWrC+JrSXBNzIUXGBfAtzydcLwfD38fnNW5y9M9OmBevpm9zwIy8pAbOJBgnLYYFxPXR6kr88N26AXbHYaHhgD42frH+YYw3IquwwM7/skKgK90fR3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4ryhp7u; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d750eeaec3so2349591a34.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 17:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773792660; x=1774397460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHpKv0zvpfE1J94QOa30HSP5+N4nIFr3Gk/EV+2iOEY=;
        b=g4ryhp7uJXZQBDpaYhK1CtYfsKALb5zMKGn9jum4iXfF/KyggjXwWDwrJlwVIWAfp9
         kkOJA4ErfhE46nuGeLrfcuD4dYO66QqQvVZaKnikgvM5vfUz/CwYzvgs8winNRiX1pQY
         h0aSfuO94IAFTqnutVnV8RpNV+QvTOirNadM1o6awI1snXvOuHIHCkMw/lZ/gnGjhFhu
         rL3P/7g6iFUA5ILFCLHrgy9hRUsD0aTbZpwS8CDtWePYpD3BXSkqtAzuPauMECDEI8wl
         Rk39CzG1FwwkuIn0gVzEZxWLutI1dlqlyq3dcCJt7WmvxxNKxCQmaqgVay3+VxCrD2VD
         O1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773792660; x=1774397460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mHpKv0zvpfE1J94QOa30HSP5+N4nIFr3Gk/EV+2iOEY=;
        b=S0+B6EF66PviyK1GzdMw6L4vCp3hCWmyhzh+IzI/lkNkD9SJR40bLGHYtDyzzWget+
         JhWELg4uzjuHIzwh9p/tvz3TNFMDQFczOYYDZj2OI3tdS7iSjtUbQtV2dvfeKBptA1ur
         j5BSV52QRY5pnzvhXvqkfS9OgUMVMtJJ5zILnk4BnsdGD5TyDRC6gWLa/ysQFO/f6vqg
         YDu8NrFn2nM0mM3Z0n5+oo5GbcAbbazGn1knnZTMpheIBUcpaze1euWFl6t8tKQvHFrS
         YppmmdBOsXeSC48P0WkBLl6DSarYY30iJPvgU4L9/9OPntawiT03xhpRKJb6Jq2bVy8t
         dKig==
X-Gm-Message-State: AOJu0YzYt0g6Q4T0DUQAffWmfwIO+H8T/7e/YNdZq24PkkZG9e8MgSCX
	oGCXTwLxjRVnWrXswq2Z5aDiiNkFO9pB+wQIY9UAOjUwYdkwl4GKjq3eE6AUCSaI
X-Gm-Gg: ATEYQzxC0H283LrIN1zZ4zl32fLI1BJesOLrojzaxlDQprdxnSF/vkmFrqdwcBXEcGa
	dY5t7Q2ZN0jFH6x0zjYtcBECzGwcwuppZmzeN3HofxDgT8VKiJpAs67dSj7jAdqViGwDypU3QoO
	iqWsMmRqkkREsopX2DIJbIF+v2MSJUXsvNdHl9zJAvYWWeb8tq+5nQVrAHQJT72d6aZpQ0IK2Un
	d0qEeWCJtAJSOgXHKH4qyYmzkYJmR+RbYtAFFXuHiC3KQueLNsO+h+QyorT7B/ztSO7oxP4rE2z
	mEmfps+CNNYACHVNvjHXZ2s/ywP0Cnr5AMKht7AigHYalidMMg/ozriFhGoYpD6sBG7oJqappMA
	PK+q4bZJmB0+mkb4eEe0Qk2AA3ywgCK14bW/98nnjvUOxM569Crj0jrvRlmU4kH3V7WUNPnp3UN
	AUq71ODHADcAXoHbw4gMbv3MdcGavDw2f+SGa3HflVarVtTqjn3Y8cJZ7y2bpDriqN0eMaBAVr
X-Received: by 2002:a05:6830:3745:b0:7d7:bf70:c021 with SMTP id 46e09a7af769-7d7ca7b8d20mr861550a34.27.1773792660286;
        Tue, 17 Mar 2026 17:11:00 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7c9b39e11sm897413a34.18.2026.03.17.17.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 17:10:59 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCH v2 0/2] media: pci: add AVMatrix HWS capture driver
Date: Tue, 17 Mar 2026 20:10:52 -0400
Message-ID: <20260318001056.465071-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
References: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56165-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,acasis.com:url,checkpatch.pl:url]
X-Rspamd-Queue-Id: DDC602B4906
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an AVMatrix HWS PCIe capture driver and its MAINTAINERS entry.

The driver exposes one V4L2 capture node per input channel, supports
YUYV capture through vb2-dma-contig, reports DV timings, emits
SOURCE_CHANGE events, and provides the basic brightness/contrast/
saturation/hue controls used by the hardware.

Changes in v2:
- keep scratch DMA allocation on a single probe-owned path
- fix hws_video_register()/probe unwind ownership to avoid control-handler
  double-free on late registration failures
- on live input resolution changes, emit SOURCE_CHANGE, error queued
  buffers, and require userspace to renegotiate buffers and restart
  streaming
- add enum_frameintervals and report DV_RX_POWER_PRESENT, addressing the
  two v1 v4l2-compliance warnings

Testing for v2:
- build-tested with W=1:
  make -C /home/hoff/swdev/linux O=/tmp/hws-build \
    M=drivers/media/pci/hws W=1 KBUILD_MODPOST_WARN=1 modules
- checkpatch.pl --no-tree --strict --file ... is clean for the new files

Context carried forward from v1:
- audio support remains intentionally omitted from this submission
- the driver is derived from a GPL out-of-tree driver; the baseline tree is
  available at https://github.com/benhoff/hws/tree/baseline
- a vendor driver bundle is available at
  https://www.acasis.com/pages/acasis-product-drivers
- the vendor is not involved in this upstreaming effort

Ben Hoff (2):
  media: pci: add AVMatrix HWS capture driver
  MAINTAINERS: add entry for AVMatrix HWS driver

 MAINTAINERS                            |    6 +
 drivers/media/pci/Kconfig              |    1 +
 drivers/media/pci/Makefile             |    1 +
 drivers/media/pci/hws/Kconfig          |   12 +
 drivers/media/pci/hws/Makefile         |    4 +
 drivers/media/pci/hws/hws.h            |  176 +++
 drivers/media/pci/hws/hws_irq.c        |  271 +++++
 drivers/media/pci/hws/hws_irq.h        |   10 +
 drivers/media/pci/hws/hws_pci.c        |  864 +++++++++++++
 drivers/media/pci/hws/hws_reg.h        |  144 +++
 drivers/media/pci/hws/hws_v4l2_ioctl.c |  778 ++++++++++++
 drivers/media/pci/hws/hws_v4l2_ioctl.h |   43 +
 drivers/media/pci/hws/hws_video.c      | 1546 ++++++++++++++++++++++++
 drivers/media/pci/hws/hws_video.h      |   29 +
 14 files changed, 3885 insertions(+)
 create mode 100644 drivers/media/pci/hws/Kconfig
 create mode 100644 drivers/media/pci/hws/Makefile
 create mode 100644 drivers/media/pci/hws/hws.h
 create mode 100644 drivers/media/pci/hws/hws_irq.c
 create mode 100644 drivers/media/pci/hws/hws_irq.h
 create mode 100644 drivers/media/pci/hws/hws_pci.c
 create mode 100644 drivers/media/pci/hws/hws_reg.h
 create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
 create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
 create mode 100644 drivers/media/pci/hws/hws_video.c
 create mode 100644 drivers/media/pci/hws/hws_video.h


base-commit: f0caa1d49cc07b30a7e2f104d3853ec6dc1c3cad
-- 
2.53.0

