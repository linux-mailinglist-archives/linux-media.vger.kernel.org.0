Return-Path: <linux-media+bounces-30732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1659EA9755A
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 21:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53872440092
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 19:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676FD297A64;
	Tue, 22 Apr 2025 19:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UTdmpNqx"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDE9B666
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 19:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349715; cv=none; b=P9Idjn76BONEiDEt7i98hZsbvdhVIZ5iGxH1KqP1A6lMzPQzmXi5rQYdguYBiEfu5DFqVgWhOKs+HEvSHMmqItnpvJOXHMSqisyOn3uUDQ9tYj6i+O0eUuk2Leh3UFch+ry3mNt6FtKV8io98NK2VbNVgXRDioIQp4ts1QPEwMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349715; c=relaxed/simple;
	bh=kw5xSLwjdxLb5UzO93JefRlAfAqBFORrjIP38P6h/8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g8fAbL+izNRrZdy9TYcV1yn/WgOrdtBbSe3sp/zr2YpEfLliedlKgUt9zT9ijbCuhCX/GfDaZ3NPXghXRYqBlnknGN+m8WxRWvYGE3ZupQRDGx7gr9eIOhjcfZkl48MQwsVI4KyVnEEeq0wnug126h1Fb+VvEVI+9CF7tKgyb+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UTdmpNqx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745349713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y+KK05zMW7c3LQIz7d14BdD80ooDf/JC+jFj6UdPYvQ=;
	b=UTdmpNqx6fy3A+yOSRa12NPYHZFLy23mRom2bAIpzRVfQMEvS5caEiU/svho8ASfrxJaJS
	a2030YOTOBypt9ZzJigDp2/fu5KNNLpZUvOS64XiUitrB15rpK3qfrLFYwgV8bXVwVdwFd
	dt+nGTgakUPa5lFWJeCUD8JKAf8WRKQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-gGjp8F_DO26Jnb0tpg2FFQ-1; Tue, 22 Apr 2025 15:19:45 -0400
X-MC-Unique: gGjp8F_DO26Jnb0tpg2FFQ-1
X-Mimecast-MFC-AGG-ID: gGjp8F_DO26Jnb0tpg2FFQ_1745349585
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4767816a48cso144254041cf.3
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 12:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745349585; x=1745954385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+KK05zMW7c3LQIz7d14BdD80ooDf/JC+jFj6UdPYvQ=;
        b=AiyqYjrHvwG9leo+73u2KU9DQbKueJDD7qsL065kqvHQGEV3C9sUYxpgoq1Uu80xbW
         q8R6ypKIQgd6PF+rrubk9j+TmpFCO3aSZeb8L8r8o4TBR8SRjzHGYLv/dIcr6jaBU8Eb
         IzLbmAENIPx6p7FZ48/kjHNozE2ojcUxQUl/rD+ApexMfbz682G7aF4ediTINSnE0orh
         VevV7K2/ex+Md2CpkX09VHs+E21QJhwa3K3YtWBS3vKkrHG8dNsspNi+yz7FTE5eOsGj
         tKAc3NJVnDi711afxM+YRe6ff1h6wNJY5VPrm80YMOLaATvwPDDpZ1oF+9KVRqs8XaSW
         7/bA==
X-Forwarded-Encrypted: i=1; AJvYcCXPei8uzA9hBuRNL9afXa+g4LgHDfrDKhjxc9LLF7gWSlha1Fvzw8dqtWnA08JbD2Z95vbNwAlcVDIYbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/hHjFZDX2M0Oh/xOAKer+Qp4z+qgSc4eGirAdVBwyh3v/Uum
	iKuTZMwrQsVFnZCfTHsGG8qsKeH7ZOxzR4SqX8bB3z/zJ7WiDr4NPskPYf8pEm0LdRtbc9WGcuM
	NKTrRAOsD7CYS3GpQ9tbMIZk2J7XiG1CyXcDuMTwdPpPtVqsauCwLYQuRvP2k
X-Gm-Gg: ASbGncvkzWovR0P+Ok7EkQxXrxQU4ecmx5g6HI7yZgxpqivnSSrPbW7/DbBBX7vYPKD
	H/mKspIGEt6jkAph/mvT0XdRPuQX2KU2UTfnjn2Q5+ST5IxkVQ5BHBw0A55NNZ1iE5LsE+fLgkz
	MXyzuBpvCtdQ6D6jrR2A9zDUYo6uctPwa+lCScwxctRAYHBFFuC870r10o6VkYhnDHtI6gwnTYV
	v6gJbDUnVmRHTwA4K06rUMiCmGkGk6mlbBINnqkhl/Qhih0cxYejRNyzduct7/ovvxCvDnE+7C2
	TiJkDR2uvKdsyGjhu9xv39YKLL3sDy94CqrRsPVGBDk=
X-Received: by 2002:a05:622a:10a:b0:476:60a1:3115 with SMTP id d75a77b69052e-47aec49fe50mr306107531cf.33.1745349585340;
        Tue, 22 Apr 2025 12:19:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpIAsSnkkHHksne2RzJemve8iXpTk1ZF86CXiy9hxjUVtuSkEj08Rwo52JAcVf57qaA/nAwg==
X-Received: by 2002:a05:622a:10a:b0:476:60a1:3115 with SMTP id d75a77b69052e-47aec49fe50mr306107231cf.33.1745349585034;
        Tue, 22 Apr 2025 12:19:45 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47b01bef3ecsm40842141cf.55.2025.04.22.12.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:19:44 -0700 (PDT)
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
Subject: [PATCH v2 0/2] dma-buf: heaps: Use constant name for CMA heap
Date: Tue, 22 Apr 2025 12:19:37 -0700
Message-ID: <20250422191939.555963-1-jkangas@redhat.com>
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
    v2: Use tabs instead of spaces for large vertical alignment.

Jared Kangas (2):
  dma-buf: heaps: Parameterize heap name in __add_cma_heap()
  dma-buf: heaps: Give default CMA heap a fixed name

 Documentation/userspace-api/dma-buf-heaps.rst | 11 ++++---
 drivers/dma-buf/heaps/Kconfig                 | 10 +++++++
 drivers/dma-buf/heaps/cma_heap.c              | 30 ++++++++++++++-----
 3 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.49.0


