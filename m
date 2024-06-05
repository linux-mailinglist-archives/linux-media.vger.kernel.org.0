Return-Path: <linux-media+bounces-12558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC988FC4BE
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 09:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 311292835A4
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 07:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0D618C337;
	Wed,  5 Jun 2024 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GqSya3f7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486B71922D6
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573242; cv=none; b=ElMx33CoSfJubHz9nmnJ9hE6XYYw5svNq+lEIv2q7NhnGPmxHPY8pc3NtMr/v8mbX0luIZa9aMQ0KIwCsLRVFuFPgcyYrhbVE2Ca9qChG1ydWdY4fHEjwUnAthGGmBrEhtl6yhcmGHM1QdFsAYoth0TntXXqLbK9q5XTEtINhsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573242; c=relaxed/simple;
	bh=pHDQhTq79LaF2dULHYh1eWT89Tmb7CGljmw/7dHd7gY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNRzZgm9RwcSlfojhfWaqwSw45LUXBdqxy7bQPtF7h9u/fEVeH2tnOxrPUIkDqdsPlkBaYGNFVWBVbpd8PGEQ3cKmpCigzkC3j06sK4/gTHscHGPdPfPHHZUUw2WgMCr1ChFZqsnvyXqgzjirUKUEhGC53ZVcvHDg+LQ/8gUqu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GqSya3f7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7024cd9dd3dso3778995b3a.3
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717573240; x=1718178040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajLi/u47C++YRIKcpp5yfagl5oWCYOeQy+neH32kj80=;
        b=GqSya3f7tO6vq2pf/DMnl9hdEB/Zl8ZbOp0lgmfQqWq8Ouvl3KbEJqxHXkn1zVT1Cu
         hIbKSvaAWVKfaI1OZo43nu+fRRRtF0v9O9kH+OBmrnteyrOp1lRfRvNdWPA1ru0Kgywr
         jiq9FCxVPnFiBzujdPHGtjtQnIednoaCyEQlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573240; x=1718178040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajLi/u47C++YRIKcpp5yfagl5oWCYOeQy+neH32kj80=;
        b=VoX7UvcDfwt8VSsNFMkDMhkdZO3PWjJbC9o9/tZRRGtWSVIYdWYLS/YijpIjGDpwcw
         JNczLVVpMk3T9FJipxE284Fxntvug85T0RqRqyIcVXSqKPN1A//WECgaBMPH5X4dUlfR
         hdRNrdjjt1TJRif2NF9Prikf/iJxEGPAvyK1clzyOXtKJMjhkjWiM1Vs9M8/X+WxhxhH
         ueXJ6OHBP5feGwwODLR4APfZ7nqDWHu4L643CrDvA79ayEkkTVschkW3Ze6VHMrg4rF4
         L7kcn8MKwheROmqI7575McsJ6SKXGm80mXwdyx+NvUw3dRiryFnTavzFpvusmJheeEKQ
         b8ew==
X-Gm-Message-State: AOJu0Yy3hatPp/92bcbZhzFHFq/do7yoWqp1qhhp/EM1a6os7NL4ki7h
	9a2oBnczXlM4fV2wDzsUW+LENamC8ah99fZhDbfJrKohjA5GmPu3VD81Z3etGw==
X-Google-Smtp-Source: AGHT+IFZMNFbzzsxJOctM7AHk9wYi1BB+2X4343WfVmogxoqaUU9zhfS3nQU7vkArwEiVzQk/u6A4A==
X-Received: by 2002:a05:6a21:1f0f:b0:1af:b0b6:a367 with SMTP id adf61e73a8af0-1b2b710a31fmr1727707637.43.1717573240525;
        Wed, 05 Jun 2024 00:40:40 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:f834:a68:ab2:f744])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6324e54besm95500405ad.254.2024.06.05.00.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:40:40 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v3 0/4] media: videobuf2-core: attach once if multiple planes share the same dbuf
Date: Wed,  5 Jun 2024 16:40:31 +0900
Message-ID: <20240605074035.2620140-1-yunkec@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
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

 .../media/common/videobuf2/videobuf2-core.c   | 152 ++++++++++--------
 include/media/videobuf2-core.h                |   3 +
 2 files changed, 91 insertions(+), 64 deletions(-)

-- 
2.45.1.288.g0e0cd299f1-goog


