Return-Path: <linux-media+bounces-16262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 416659511D7
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 04:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F28C6284325
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 02:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8801864C;
	Wed, 14 Aug 2024 02:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AH738Dfs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA57BA21
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 02:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723601214; cv=none; b=pMEq57rj6i0yfMgOiJyrre+BYdTlLvAcLUgS7NM0OLz3+U7f7pSTpU8R8YnW2l+BScXRt1di9qmwDiZHH/aLOgW88k8HUXkFxC16FRGO1TjCU4OCum1hO7dnY2up2oU8GgICV8FoXNYdREhishqkVdZWzhLRZP676i6oifaKVY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723601214; c=relaxed/simple;
	bh=lhsMddOIQ0HSMg2rf73cBoCHACBw4wwpGvSvSCuzSxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=biJQ1Cc8a7yR163GnyrE87Cay8GL6jMW6JsnQ3wXZqlFORWSEGsDC9lcJI/KFjl5jMPwAJtn8Km8cqy6dhZRwbtPaUvEzXW7ai3w/uS1MGcv6SQyejvAoiPQas7+q27UfN7mXiZ+247auhAbo25n38tUOlUTO0LHJjmnCE+PpkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AH738Dfs; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d37e5b7b02so1794189a91.1
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 19:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723601212; x=1724206012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0NJ3q0M3IxzuREVGJMildXYw/yaBUiaZtlU8gKQcaw=;
        b=AH738DfsbC849uFkCwWLSst6niZvXl087kZLnoo3ccNHrk+r6lY4xIC+EDZMic2oXm
         yw+Ol+sRt3ZJochIm2bsHiYPugXQ4QERpeonuoRjXRmyRqivuLB0qjzL/DOb1XOuA4nA
         fPVow3Nf0TZP9l9yd/rPFaWxDan9zlpFSIKv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723601212; x=1724206012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0NJ3q0M3IxzuREVGJMildXYw/yaBUiaZtlU8gKQcaw=;
        b=UgFP9+MKPsyKu1bKm9oclkrwMVMAsHW4u3jb8QT6SKB4oODyMxz5fMgfjGZr+em18d
         ZDERxxpD3I62/uvG1r6i4WD+JSkxhKvhfghkDIBEVT4pNOy3CJkMlT/k9Gy5Onk9e0NJ
         2/UEtltrVbESnWzWs7uJWdX1AZgcI6Zr78O+yxDCeX1DADoeIXQvWP3x+dJErnudYdow
         Cznwxoa7LcBWhBnRhSJ8Mixg332lfsocgLk1V5pRIzlDW93tq3by+EE3u56F7/EKE/Rl
         kYTzH+PWo6vAcIWJKUnHSTG8Y2Jw4877QGS3MKz2qMNl8Ropz6/C/ZtqWSD3PLofZA/G
         iEOA==
X-Gm-Message-State: AOJu0Yycb0Wr+KCoc2g3tegATo9H7xOCmn32Vlwj9ncnHsHcF0w0HEpk
	RL5OFD2D9FXvZEJPIu+6F8dxD3wkHl7kPCzh6UNjnbYKYQ9yLvo3ZNwIwP/N9+7OqogsfaRyo94
	=
X-Google-Smtp-Source: AGHT+IFLZo33T8gOCm4Br91w7N0xuqquuW8xyNDeKVDtF02dVgf/dm4zkQ3BBJnDGfOl2QC5FzG97g==
X-Received: by 2002:a17:90b:230a:b0:2cd:2992:e8e6 with SMTP id 98e67ed59e1d1-2d3aab74faamr1442975a91.29.1723601211695;
        Tue, 13 Aug 2024 19:06:51 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:269a:7c5:e4f2:518c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7d65b1sm303064a91.4.2024.08.13.19.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 19:06:50 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v5 0/4] media: videobuf2-core: attach once if multiple planes share the same dbuf
Date: Wed, 14 Aug 2024 11:06:39 +0900
Message-ID: <20240814020643.2229637-1-yunkec@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch set avoids attaching and mapping a dma_buf multiple times when
several planes in one vb2 buffer share the same dma_buf.

1/4, 2/4 and 3/4 refactors __prepare_dmabuf()
4/4 adds a flag to avoid duplicated attaching

v5:
- Add Acked-by from Tomasz. Thanks!!
- Address comments from Hans:
- Add comment and modify commit message for 3/4.
- Fix typo in 4/4.
v4:
- Update patch 4/4, only set dbuf_duplicated when alloc_devs are equal.
v3:
- Add patch 1/4 to move clearing fields into __vb2_plane_dmabuf_put().
- Resolve review comments on v2. Detailed changelog in patch.
v2:
- Add patch 1/3 to refactor __prepare_dmabuf()
- Add patch 2/3 to resolve Tomasz's comment on __vb2_buf_dmabuf_put()'s
iteration order
- Fix mem_priv in patch 3/3
- Rename duplicated_dbuf to dbuf_duplicated

Yunke Cao (4):
  media: videobuf2-core: clear memory related fields in
    __vb2_plane_dmabuf_put()
  media: videobuf2-core: release all planes first in __prepare_dmabuf()
  media: videobuf2-core: reverse the iteration order in
    __vb2_buf_dmabuf_put
  media: videobuf2-core: attach once if multiple planes share the same
    dbuf

 .../media/common/videobuf2/videobuf2-core.c   | 159 +++++++++++-------
 include/media/videobuf2-core.h                |   3 +
 2 files changed, 98 insertions(+), 64 deletions(-)

-- 
2.46.0.184.g6999bdac58-goog


