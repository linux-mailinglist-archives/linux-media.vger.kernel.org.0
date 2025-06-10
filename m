Return-Path: <linux-media+bounces-34439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4A7AD38D9
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F029A1BA0A16
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062D129ACD3;
	Tue, 10 Jun 2025 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dLBiYKq3"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05B91EA84
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561170; cv=none; b=j2PS/OKFKnRluiyUfunkTohGOxh4zz+U8fXwTeE/JWHbdpiNUEpsoCL6Ut4nsHATv8K00ZZ1DHG5z+3f8DcLUA9TQlNT+KNVa0bWv0rcISDlHE+ScwWWmRGS0gNg/ZGgTRoH98lQM/xxEepBlm5nqwqD1V+U1oVQPT0mXFBXvB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561170; c=relaxed/simple;
	bh=tSR7/fIjqV9+yyF1LGzAkWsi5rJ8eOhUaetz1Bfbz9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aTlz6XlMH2silMJYO54LVE2jrEUTxMWgvQvOSaCwPUPIwRMiPoCQfdTGQSC06swHbUZCwvEI+aLYvMX3gsnHv6ENRxiaRxiD2ZUPknacpRLJpe0d3zeDObNBbTpHpZLDV36EwrVVDiVjbjsXacjqSxjFyJXoKTuSJDjXPSrRqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dLBiYKq3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xKBj4p2Vjm1RVX1kUZg3pFVIOXv8dd+d+30EbLY8ru4=;
	b=dLBiYKq3jjwH7RaLT0+VBG4adkcXhgNyqbXoF2HjwmyKSvLN2CY59lGECdNuQLg7uDkx5q
	pvdpR/gpD0crP6kFpZw58epY5fDwBOQqVEO+cG3Jflc0XO9dUHIdA6tXBZcV7u0JMpjcM0
	XNUYSCtgPGupysHxd323Ct4vJAG9+LQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-6SD48X3yMU6SHngKm5paIA-1; Tue, 10 Jun 2025 09:12:46 -0400
X-MC-Unique: 6SD48X3yMU6SHngKm5paIA-1
X-Mimecast-MFC-AGG-ID: 6SD48X3yMU6SHngKm5paIA_1749561166
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7cf6c53390eso523623685a.2
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 06:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561166; x=1750165966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKBj4p2Vjm1RVX1kUZg3pFVIOXv8dd+d+30EbLY8ru4=;
        b=ZriSAwd0sbjnkmiNFgZXMP+TdmVLICmSuQqkeKN3GbM0EMu8ekwW3D1ONaJvplTOdR
         GIjDSeYd9h/XNAh000Uu1NR2Eo23vjs9TRBkIEWw8TXxrda1x8POqhc1/bZs8ggbEOVe
         ZuTX0z/jN8uu4208Xzhbn0+jOdwHm8JPje8YZgopmaqMWXog703qMq9VjgBCCLzsHs9K
         mJYBvmbtLEd/Ue9CJ0hIckJIKB01BHLQA/5IGEmV5udiaKhIDcJhQEcQcnQzJSwXja3A
         hbl9BU6pLgPEzInIOS2i1SyjCqJ1Sr+weXKKhOHDZh/PrzYLdvdOCnKNjoOvBXxEyKqd
         F9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2iJio9L2P4uCoUh9SkMllZborSv7WZ6jUJO+bK1i0eb6gtlLXC6NcuCCk6+ptQb6kALJ9fP99kI3f1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7qdK9Q2wUnzFfR9/Wmii1zyxUc6DeGcUhGvkl1C8Io7zIz61e
	4+QuAz3b30Ad7/FFCd0eGpA6moJLxEiFBBr2lmZPI3n9XW+CvnwAcMO1gMrUHjq0HF0FktIOnWv
	ldoTErgS4HkzcsNxBRmZ9J9S5O5hdBFj3ZfmoixFI1rdfoIYBHpsk3Ac7SpNCnH3R
X-Gm-Gg: ASbGnctn+0gtXt80x80av+W++0x82BBEE4vWP8Lpzvy2QvsK+NhZ1IW03RuG0VxH+og
	ZT9hTb7m1Oe/ZeVYH/cVIUDhDOkxtqvvi+wKao/SPecyx0waObmYV1zL4Xo/H2pzq0MBsJf5VrK
	jer07p490HXR1Q/nPY/B9s9uauSkGKmEQn/jS6tx4qaayJBU0JB+dqiXbolhWYUe36D9zkptdUY
	kb/daCMrFpmrG1qapwiQuWb0FZXuiTkyndVrz1WkbTogMwZgCRK2iF3yeoBjhB0F1qjzerCLipQ
	miJS3OTTWC1lTpsiMiA5fYKYLE9cgEzZgWq90n1t5XtY4na6fKrDmQ==
X-Received: by 2002:a05:620a:8386:b0:7c9:5501:80d2 with SMTP id af79cd13be357-7d22995ec82mr2171099585a.15.1749561165974;
        Tue, 10 Jun 2025 06:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrYOJLYnD20Za7bwTGNM2Zhi1hWiuol78eHZNm8ukeun1kZlhQxetU40CFKtTARDHt7p13cw==
X-Received: by 2002:a05:620a:8386:b0:7c9:5501:80d2 with SMTP id af79cd13be357-7d22995ec82mr2171094985a.15.1749561165513;
        Tue, 10 Jun 2025 06:12:45 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:12:45 -0700 (PDT)
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
Subject: [PATCH v4 0/3] dma-buf: heaps: Use constant name for CMA heap
Date: Tue, 10 Jun 2025 06:12:28 -0700
Message-ID: <20250610131231.1724627-1-jkangas@redhat.com>
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

v4:
  - Fix ERR_PTR() usage for negative return value.

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


