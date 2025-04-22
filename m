Return-Path: <linux-media+bounces-30722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F949A972ED
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 18:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB023B467A
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 16:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC0E2951C3;
	Tue, 22 Apr 2025 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQc/UWLj"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8FE293B71
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340129; cv=none; b=H/na48baCj69GMoS8IhwU6ZQHb7NBsyHWRhsXyS2s6Niq7xg5pz8opNMjhIjOFmxzNBJRTzxASqzz+ZX2QM62mMVo9gWiIdC+isZVMYAZYCgOPoH/Om7AwpxRV11iRsT+ZlVjfJ3cXP/4F3Ipm2ASMT/ks6RpWwEdhYQd8iIizo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340129; c=relaxed/simple;
	bh=UQBX8x4rTC1R9wFJI5Tf5/gNMsjeHaRLmt9zIWXzchg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NE77oBgR/pDSgKVDykghQYRboK8L8Gug3MJmxRWArNDbwth3Oa2V+D0wEjRADJJwCgyP7iloNsYqZ7Ol3GASWSlTfCUmdLqTnj/JjErsbI+4otZtoY5SPmucnObHDSlyPWdYTTsUnjbYWLPrLhZEnwqaFURmUDS2871ekNbMxWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQc/UWLj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745340126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KK4TWsLp0PtMCarQy+1TyJOWeXbWvyau46qeTqoxrRM=;
	b=IQc/UWLjuNm7ZXho0avBVw0bofte8s+fFwclZii8+UINy5z63/e4UK5qdUTl1N1FyLEfeO
	xG91lOdhyvGPhTfFJqyLnlzXYZLCcFCifxYwxYnatFKeyP7T0Ouenh+fq8jtPAyHb7WKfg
	5oM/QwW2CRru/63hewNK5DSOv6SfS0c=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-UXqTPYaLOF-Nv6liSLMgFg-1; Tue, 22 Apr 2025 12:42:05 -0400
X-MC-Unique: UXqTPYaLOF-Nv6liSLMgFg-1
X-Mimecast-MFC-AGG-ID: UXqTPYaLOF-Nv6liSLMgFg_1745340125
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eb2480028cso92305836d6.3
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 09:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745340125; x=1745944925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KK4TWsLp0PtMCarQy+1TyJOWeXbWvyau46qeTqoxrRM=;
        b=TL9+fm4B4AywWFoFvdJFLlxov9fOoifDDERhaThfxFuIG4tjcnfErz+921gWt/uPXq
         JgLR3FZv1XrcfHgF9yQuJAs4+OWtwOQcnAICH2hPT69S24Nc6l1HBRrKp5GC8gffPyiF
         Ima4u64abM6643npdj3OZw2wc6D5NGsfXEWKx7pbsnCYq03XgEwg+u3PSydDuLpeoUYz
         RfYMKECV4pGBqK/blbBKNEmvnd6d8/NXbHr0nS2hxZDotW1+sMzRjNyWH2whJNhjWkeD
         KJG7xUzbMPFQruwcSlwZ8eXEcvtuOmeRjLYMQgkEX+d3BlYuDwEPFGuWrhDUep9oM/ck
         dSbg==
X-Forwarded-Encrypted: i=1; AJvYcCVyZnVEX6ERAMY0VARgjsf08VwYTvXTLZtS+Vd6W4BL9QfUonvFU/rMpXgT1Ir6vnB/WrcQC5a5fgESWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZarTS3EuI22i1N8DtDJI5St6EuvkHcGq9sqxOp0TJZNaUmUZ4
	d+xzLIYNSIf+us+vSPSW+Rv01DUCiSVuQvtzU43YZm353+4RowWQ/2YNvdTaJqpmKw1/LJzDq9B
	ILje6J8mcj0lgprNE0HvFGyuzJ+5uaL0fs8rtIzn1j+LSwLc5lApVQARX/1le
X-Gm-Gg: ASbGncs9uWY2eM0o0qONWk28qySjHOnto+lDZhW516BiAIAAxmXxFW0uwSNsAy/q6VE
	RsM5fXvk9kwUsEJSPY5rny457cx4cUSRVTy5wlX2F3+chyl9lyfVl4UpHCiXvWr8hooAC+U9y+D
	VJ6RyuPQ4XlOnq2aYrvcDsMLywWyJe/nMeWRXX02D3YEntZWv8q8w2K0nrzP2OuLAOujQ4Bygja
	LchjC1ym3RtTtcNBqIqSqEUkzWg8pBFH6bKf+4Fbfpi/pJ5Cp7PH8YVFbfuGj5O2MaKNm2azg9/
	Xaq/M5V2TpNJNep+zSuRjY3Pdr8CYW57+mwSDPdyZrw=
X-Received: by 2002:a05:6214:c64:b0:6f2:c10b:db13 with SMTP id 6a1803df08f44-6f2c44ea415mr295054696d6.5.1745340124692;
        Tue, 22 Apr 2025 09:42:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHDj03Kvoy5X2geaEJFNrce1J9/+WUYtjeTgPtoN7cjkmOT88E1rMHseJK37Trf6aqqKx0kw==
X-Received: by 2002:a05:6214:c64:b0:6f2:c10b:db13 with SMTP id 6a1803df08f44-6f2c44ea415mr295054326d6.5.1745340124403;
        Tue, 22 Apr 2025 09:42:04 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd182sm59451376d6.80.2025.04.22.09.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:42:04 -0700 (PDT)
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
Subject: [PATCH 0/2] dma-buf: heaps: Use constant name for CMA heap
Date: Tue, 22 Apr 2025 09:41:46 -0700
Message-ID: <20250422164148.547798-1-jkangas@redhat.com>
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

Thanks,
Jared

Jared Kangas (2):
  dma-buf: heaps: Parameterize heap name in __add_cma_heap()
  dma-buf: heaps: Give default CMA heap a fixed name

 Documentation/userspace-api/dma-buf-heaps.rst | 11 ++++---
 drivers/dma-buf/heaps/Kconfig                 | 10 +++++++
 drivers/dma-buf/heaps/cma_heap.c              | 30 ++++++++++++++-----
 3 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.49.0


