Return-Path: <linux-media+bounces-8495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CCE896A32
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 11:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F3E028F22C
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 09:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D939A6FE2A;
	Wed,  3 Apr 2024 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WRJmrQEE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D66F076
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135595; cv=none; b=XhnDSNy9EoIVNbrMGQHvcvwFNv/PREYeUC5CaohnwZDs4mzlMywWfo93VVx/KRjtUwnVuqUfkXfkIyT2uxuhOetIeaKKeO+UPQ880hNAU709YdwTmNVrgIVBVbidTMAXUyH6Ud131YTYjDrck4sFiB0bOm/EppRzpr0qMXkGG34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135595; c=relaxed/simple;
	bh=Te3MXk0pozRMdwfAZ0bEtK0gtO75AuUWhMPkwqri5wI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/F6dcxnADj9ZL87m53IgwHzco42i8Q7bX9jIXRJEW7g0FgVRqwjrHfRLteLFfs8E2frLyMELmUsJ47fw2cksKflDkvY06g3Yjnl+t1WIiSN4gIASZnfZ9UBMyHqyotx+67Q3wzPXuYuaSpOwLNiXuFDlFlLMOv4S0qKq/Frtq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WRJmrQEE; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so4689783a12.1
        for <linux-media@vger.kernel.org>; Wed, 03 Apr 2024 02:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712135593; x=1712740393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXovGyAqf5bkHSnrNl1Nftgm1t0bwPuYQoy+o/XEDwI=;
        b=WRJmrQEEu4emxNm0yCEujBeCVgTqm5XQlkHJabHos6JauOT9RUh4nuNvk6lQ2OB10v
         X0dVVFCfadH2qNVuuWrJSUEV/z4M7tCKdi3sImL9kgRpf/kpBSU5aytqvb52/NG3Yayd
         tDB9kZU4Nx8Xsp5yRS4LVNjW7LHfxSucyyIj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712135593; x=1712740393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXovGyAqf5bkHSnrNl1Nftgm1t0bwPuYQoy+o/XEDwI=;
        b=pY8M2BzSL8cEXLi340CaL9bNmpoebJ9tahoHW4yayQXWpkaidqgopvrLOrPeJ/lqIx
         Sf0Pk9tl4w6958tfm4vfjtDyZdOT0mYYTjCmbvwsoMqTRvRC3FXHqnXoUe5BQs2TboZU
         sreRs9IB/PZCu+zf60ij8R3ifG+MKpUYXCO977yFYZQoN/KSz7UtlgQBjn04GrWsuntn
         ocCvvywheMrfx9SNz2xbne57gzZnz28Q33hVwSgjpmaIqIlYCixkGR8uT9xBuq0CjRu0
         RIdtECrgW37CnSNWRWlvM8OM6ycTyriH1/hfGUayn8tKRAwja1a+/nt0l3mJDTK7zdXt
         d0jQ==
X-Gm-Message-State: AOJu0YzvWlFHyqISqd7N00t5JAdf7e+t581B3rXkAc6oeNoA5Ry/vEcp
	1qJpYTeSO6H+RYP7vMgwRv49G+BNHX/NlHS8ZmzVgXKy8I+pzisbVp13Y5YbdQ==
X-Google-Smtp-Source: AGHT+IFjoxrNmVucDLFuVnYM2d+Pp6xcB9RIkBoT+vEHIBeTOy8b81KXa0+9O3DL/yrXhmO+OXJDBA==
X-Received: by 2002:a17:903:184:b0:1dd:7df8:9ed7 with SMTP id z4-20020a170903018400b001dd7df89ed7mr19775782plg.15.1712135593193;
        Wed, 03 Apr 2024 02:13:13 -0700 (PDT)
Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:d5be:b59a:f5f7:246d])
        by smtp.gmail.com with ESMTPSA id lo14-20020a170903434e00b001e0aded0ca7sm12692811plb.239.2024.04.03.02.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 02:13:12 -0700 (PDT)
From: Yunke Cao <yunkec@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: [PATCH v2 0/3] media: videobuf2-core: attach once if multiple planes share the same dbuf
Date: Wed,  3 Apr 2024 18:13:03 +0900
Message-ID: <20240403091306.1308878-1-yunkec@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
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

1/3 and 2/3 refactors __prepare_dmabuf()
3/3 adds a flag to avoid duplicated attaching

Changelog since v1:
- Add patch 1/3 to refactor __prepare_dmabuf()
- Add patch 2/3 to resolve Tomasz's comment on __vb2_buf_dmabuf_put()'s
iteration order
- Fix mem_priv in patch 3/3
- Rename duplicated_dbuf to dbuf_duplicated

Yunke Cao (3):
  media: videobuf2-core: release all planes first in __prepare_dmabuf()
  media: videobuf2-core: reverse the iteration order in
    __vb2_buf_dmabuf_put
  media: videobuf2-core: attach once if multiple planes share the same
    dbuf

 .../media/common/videobuf2/videobuf2-core.c   | 97 +++++++++++--------
 include/media/videobuf2-core.h                |  3 +
 2 files changed, 62 insertions(+), 38 deletions(-)

-- 
2.44.0.478.gd926399ef9-goog


