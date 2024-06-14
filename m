Return-Path: <linux-media+bounces-13245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8931690852D
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 09:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 262E62833B5
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 07:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C245914885E;
	Fri, 14 Jun 2024 07:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SG36Md/4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB69713D512
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 07:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350630; cv=none; b=lyQVGhJ/WxUGdhu7REUJF2bdy/Cibecj+V/5Ec5nf+j6QddPm4/GkKkKcWaD7id2XlVGNo98rN8m19rWy9UttNyljcJ/izy+RfuzaPRfNRh1beXcd+cJ8+Mmi4jKqHh7jL5YAzk+ekPerSTTudXLhq5usZYqlz63+g7bK7PW6kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350630; c=relaxed/simple;
	bh=64RtKLxzkRZCgdm7Qi/Y9MfqQGWpGaob44vo8997CtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jYZG1u4hDh3FYgLli5iJyxqvTDYFfCxv8n8H/m5v+j1CQb4BrRVFyhtZkzmvoUJwpfjpqZC5QipcF5x4aEn88sVqyw2bLO1fTZMV70bKUxwmr1q/e3izRQjvl40jDwJXgqkk8jqGaC5qbyZN5ZddQ6DAafsPX+Ykn8gwXzN7CXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SG36Md/4; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70109d34a16so1683137b3a.2
        for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 00:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718350628; x=1718955428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xT2UDVIliFvtTuzzqbIPKCrSkDywmWkkcUUobNAyVnc=;
        b=SG36Md/4y3ggNhIF22VnWg7xVlxHgubXgHExWfziSXARxF4NnFeLqbuHEzQWLD2Ewi
         TNxvO9l6Pih59ciMN93oIJ1/z1LoLyBKkb7BCsP8nZVvzvYPwlu1Fn/f0+FiXuyQ8OUz
         xPiqbDrY6nYSDiqrjDCB3zDwtFG0v1sA4X7oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350628; x=1718955428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xT2UDVIliFvtTuzzqbIPKCrSkDywmWkkcUUobNAyVnc=;
        b=IjvaQrh6nrObRvoxox2a0bnpzuoF1xPOE8ZjGCofd0SCbNcQ2kFIF3ywJhQMAusYfE
         1wGEhvRzMV7JK4BfGVjmgyYO4RNgQ7i8rDsgsvkFLkZeNF3q3NkfaBcTiqhLgng3j6Lp
         WDnIbhHMnCWa/9VZST4SJ0UjRGcEbgcm6crfSCV8he9I4ekAnUAIGH5p0x07NONn5zHt
         Nw33sxTsttXVd1Nt0vzBl+ULPRnTv9DX0H1lHj8odqYNM8vvxuc3ubsRHgiV8XOYHbNi
         eIYdVrVR6uvZLngTzCeMYzdY7zwuxSs0utSj9mob61KqPdqewG+G/bB4aYtgEU4ibNN6
         eJMQ==
X-Gm-Message-State: AOJu0YyTxRfBs9LiX7rr32LwgT4JDwHJLFkpaVgUXK8XHppBBMUj/xDj
	dc8LapW4xbknU1iJz2UcYKu16GqkGyel1+/7UwM+e5jJ6OU6R46oBTdHztkzjw==
X-Google-Smtp-Source: AGHT+IFcFToCevyk9g6nlXfGrx/M/e7c6DqDZ+sGH/6MZyTr/A1IcsG1wzYe+WpjYg81ZQf9+sY88Q==
X-Received: by 2002:a05:6a20:9695:b0:1b5:581e:a05b with SMTP id adf61e73a8af0-1bae7eb29e7mr1994738637.23.1718350628119;
        Fri, 14 Jun 2024 00:37:08 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:336:17cf:71d5:5733])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc922643sm2468382b3a.31.2024.06.14.00.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:37:07 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v4 0/4] media: videobuf2-core: attach once if multiple planes share the same dbuf
Date: Fri, 14 Jun 2024 16:36:58 +0900
Message-ID: <20240614073702.316810-1-yunkec@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
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

 .../media/common/videobuf2/videobuf2-core.c   | 153 ++++++++++--------
 include/media/videobuf2-core.h                |   3 +
 2 files changed, 92 insertions(+), 64 deletions(-)

-- 
2.45.2.627.g7a2c4fd464-goog


