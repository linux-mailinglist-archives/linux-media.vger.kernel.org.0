Return-Path: <linux-media+bounces-33202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F945AC14A5
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B19A1B634BF
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A62D29ACEE;
	Thu, 22 May 2025 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gzOAkFqK"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052AF29ACC0
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747941291; cv=none; b=XaLGgomdZt+or/W94QaYOXd8kj10PQ98Bo5HIidjOH2Vk++PMh64pgkothaezP2w6NX+PsF11xDGN0iSTUiMPzsRYSlNAJ/30NC3OFa1VxL2LNqbZr0KmFqEzAazVZDpkZs8p2bt2m4c51TK9dQtxjyRr9/Qdb/QHhHT+Y2dmP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747941291; c=relaxed/simple;
	bh=ZKftViqfFFhN799plnLsAOvLuBZBpAPSXcMvWbXpQ+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOkTjhKx09m/hoCRjZYlM8uD4chFgb5cqYQC6bpc3hscd70SN+jzUmOW18H/Shun8GcNaRXlBc3uG6t4mBmd+sRLV28jkZmPAS5UGrU06fPrxTguPj9tFBwEGRkUBiP0RthSfURaEiipi+3iMqWVFs470hGf4dtQ8oEhOyylLg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gzOAkFqK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747941287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D7brFv7pUq6T8Mxdu91uiPIb94+Tmd0tGfLRCcDs510=;
	b=gzOAkFqKHRCb7qcf4mTI6xRIEsl8OVMswd0m57f4V6oWaDQyGQQA5va7UP/XO+Wp/b2t2G
	MQqMDjVRoGIV1tIAHjZXZ/NdZ1q1g0DtAV+XWTxlzjlIh7VEFQjcyUJqJB8caTxozB5SEP
	PAfoz2WZmjd1ShQ0r0jTiENpYERuRhc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-_wkmsPyZOh60uHfjQMyDbw-1; Thu, 22 May 2025 15:14:46 -0400
X-MC-Unique: _wkmsPyZOh60uHfjQMyDbw-1
X-Mimecast-MFC-AGG-ID: _wkmsPyZOh60uHfjQMyDbw_1747941286
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8dbab898cso104274146d6.3
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 12:14:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747941286; x=1748546086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7brFv7pUq6T8Mxdu91uiPIb94+Tmd0tGfLRCcDs510=;
        b=qPELa/yGnhupGNMiRO2Lh4/oBmnbXTJ914BiLxR3AkdkTuOvl4qhS6Y1WqrSA2ZuaA
         b4i5NkduelfSaUTEDkCsCYJPF+IymNiMc6tVXv9cUKu8Y8o/ylFTBNK/kQbstffc6Lxk
         +eXGiFGHUD0PJFvAbacfqMCW6r0Cgs5a1UlgpQ5PCXQXF38r+GFBQc/Uu4gc/zzg+yyo
         gyWX3RD0v9Qq5jqIcyW1pUDshNjnXAcFj4yyw45l2yshVBHoEHR80w3q7HXZdVz3hwMY
         0tPWX3yUsrSY0ggfKSWnaaTfJXzbkpZL/r3i0MMksHwCtaTklulWtkeT/OAqjQNi1z7D
         dn/A==
X-Forwarded-Encrypted: i=1; AJvYcCUDByTJh4d7TEtYPsHAvWTiwDsPG9Eg9kxLd902pCNAywuaLkddK+5CzUwpv5GXrPZsa7kUDwScWXsNQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys+JAYOPX60+I66L5hLDURhgsAnQJkpxEbnWVVqwnq1imzRH8u
	4xis+/esJ+GPl+RyH+XhanmYIkBmm3vorADpo0cGTJ8mKe+MSUj4WiLl+GgMoT5hyUXNuQUY1F1
	toAm7pKjIoxlx5dfSRUtnETv4kjqomTtVw84j1CdqGIWM23AixaDKsRh0tPn+IWjf
X-Gm-Gg: ASbGncuxsJE4ke/4JUlam9JvsEgXNTHCoaeECgTN+ltd3BwvOIJvIdN2ajH2NCJ5U33
	SYwTitRRnVVtZgbeHN1KB/+B3KS7lBooRflRrTOyoQvdfjrRtwLGQP97l70ZXrmhTOKY080ZYjr
	oot/1SmTAzGvVvBbNhS6eG/pb74CQ29UPSkQy1L+GGhzjTSvYSWOu2R1I1vkVi95Zhfuj/rKcwn
	ILPjO5rdVI1YRd6yfmcFXdPolEeGlOUgnuyyV6XrD/NE3iGbNCFeJZfRZGTKs35NzsZ2pw49zBk
	LGn/n/uQQj67oMm9KJydfstW825Zi3tKO6SnGRY2Btk=
X-Received: by 2002:a05:6214:cc2:b0:6e8:9394:cbbe with SMTP id 6a1803df08f44-6f8b2c7b117mr370336266d6.20.1747941286012;
        Thu, 22 May 2025 12:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnvP93RgtHFU3/OIdPk/sEAnUG6j69VFPbMwWobtaNerAwoUt+hZltUAYDKdgFPSEjENLeGA==
X-Received: by 2002:a05:6214:cc2:b0:6e8:9394:cbbe with SMTP id 6a1803df08f44-6f8b2c7b117mr370335926d6.20.1747941285457;
        Thu, 22 May 2025 12:14:45 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ab862sm102862916d6.38.2025.05.22.12.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:14:45 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com
Cc: mripard@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v3 0/3] dma-buf: heaps: Use constant name for CMA heap
Date: Thu, 22 May 2025 12:14:15 -0700
Message-ID: <20250522191418.442390-1-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series is based on a previous discussion around CMA heap
naming. [1] The heap's name depends on the device name, which is
generally "reserved", "linux,cma", or "default-pool", but could be any
arbitrary name given to the default CMA area in the devicetree. For a
consistent userspace interface, the series introduces a constant name
for the CMA heap, and for backwards compatibility, an additional Kconfig
that controls the creation of a legacy-named heap with the same CMA
backing.

The ideas to handle backwards compatibility in [1] are to either use a
symlink or add a heap node with a duplicate minor. However, I assume
that we don't want to create symlinks in /dev from module initcalls, and
attempting to duplicate minors would cause device_create() to fail.
Because of these drawbacks, after brainstorming with Maxime Ripard, I
went with creating a new node in devtmpfs with its own minor. This
admittedly makes it a little unclear that the old and new nodes are
backed by the same heap when both are present. The only approach that I
think would provide total clarity on this in userspace is symlinking,
which seemed like a fairly involved solution for devtmpfs, but if I'm
wrong on this, please let me know.

Changelog:

v3:
  - Extract documentation markup fix to separate patch.
  - Adjust DEFAULT_CMA_NAME per discussion in [2].
  - Warn if the legacy heap name and the default heap name are the same.
  - Fix DMABUF_HEAPS_CMA_LEGACY prompt.
  - Touch up commit log wording.

v2:
  - Use tabs instead of spaces for large vertical alignment.

[1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com/
[2]: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com/

Jared Kangas (3):
  Documentation: dma-buf: heaps: Fix code markup
  dma-buf: heaps: Parameterize heap name in __add_cma_heap()
  dma-buf: heaps: Give default CMA heap a fixed name

 Documentation/userspace-api/dma-buf-heaps.rst | 11 +++---
 drivers/dma-buf/heaps/Kconfig                 | 10 ++++++
 drivers/dma-buf/heaps/cma_heap.c              | 36 +++++++++++++++----
 3 files changed, 46 insertions(+), 11 deletions(-)

-- 
2.49.0


