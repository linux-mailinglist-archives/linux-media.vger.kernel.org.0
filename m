Return-Path: <linux-media+bounces-57149-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJKwK3A6xWn/8AQAu9opvQ
	(envelope-from <linux-media+bounces-57149-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:53:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFAB336539
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE009303C62F
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642FE2DB78C;
	Thu, 26 Mar 2026 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWQrUhR7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D31824293C
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 13:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532832; cv=none; b=srDvKZXdyX+OcURDAk53xyN9XzakFyeOEK+Xvd4isA5hO/r8YKb2J/dZaNgw09tLX4VS0e7fB+o6Zcxav6fDWTdRmmyH1V8YNBuolW1CWDB/3Pld4StpabxTvASLIDwSCtZhjgyc0TYTTormo70TFYQMnixXqorOmBsc/z9qNJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532832; c=relaxed/simple;
	bh=nPWJO7E0VkY1o5KPyBy14YAPEu7BVqIxTh8aFczGLsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nZxr+oKEN4qJ2NmWMufy9bBVLtl5G+2MNrS8VGxlas4wai3z52mR9wBZOY+Xapx765d3Zz6sglnGeufRXcwMtnDinPLiFBDZbZfsr8B73hZYgeGx59sVaiEE8vKUG1b7PrgiqPb9wQsSM6VeGQvWC+Rez4c7BOzDsPBJL9LQNUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWQrUhR7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso10325095e9.2
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 06:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774532829; x=1775137629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2WqOwzXZI+wT2TpgMqYGeJnq6VmoXu+8hXhXpXJVrz0=;
        b=BWQrUhR7Jjmski7VTfIZRSgGnCZCQKJf3gAWjFI9QV/YGrrUgWl+sckFHch7ruR4YC
         STGmhYDYBwoEjXSyLHND8QIkLbgJFBnrqWLulRdoU/xJ1AdP4Y7L3Ehr7mBQIYHm3vPa
         uAaTtnbSZxCCeHeklKO4eO6wdNI2VauxgKDgVRnq6sbyClhkT4G9TEbQnnJqt2fbYtwM
         89/XPqrEVklvl+HiqgR/bivFHeTCW+0XmktAo4hOrOAlGZCAW1Hxy+C/xG+0wcZmq/jk
         3gjmZTp1T9/lcONG0i2IVQnjfNg53OM7MNNAYMVzzLIVeR3VwCValW1UXzNXo0GVAz6R
         h43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532829; x=1775137629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WqOwzXZI+wT2TpgMqYGeJnq6VmoXu+8hXhXpXJVrz0=;
        b=mCpQOhtkIRWtwJHoke2+lTyTaX/iY4PD20Z08kcLxWjiN/464W6DjYRq+ZBNf+OfBZ
         F5RNJMlfUqt8UHpv0Jtj0oeaV9Vcws0BxdL55OrBSNPBhAVz+StQ9m2rgSmF46E1VjPG
         tpLCxhM5l4+4STvMBGy8SmIEbNVEgxbENdxmot52lgxULKHnAy1RPU9UJ7KxYL3fHqDl
         b82TmWhB2O5vqQhwkauA0Xdh1UD10h2rBa1UTSImtmDAVrHGl4XOqEHw7Bg5DBxz2X2I
         7OI0R/q8a9NzOj2s7gZAYeHH+s2NrpxaOS36vEgBJ12Lg4BSbQB7jn3wMYx0Ud/Ktx0k
         2fkA==
X-Gm-Message-State: AOJu0YzAnc+a5U9lhOGEBzQocVfnak7O7E5fmbUl9G9rHDxAsBiPHyO/
	NX6gAluW/fPklIRQ/QUBeOE8J9VRqVj58C1jFKH4xGF9Ydsxr4rLIOzCoMuoC+xT
X-Gm-Gg: ATEYQzx3X8jhy3Z3+dy8K36tf790N4tTYs65XfJ+IvObE+rQOXD0u9+SXFujWO4kSYM
	TA5DxX9KhEi9zfCJYWO9kRamOGnWDvOPzpsQuda6zGog7gG9ZnsOX7rDdZ0pqXbjPsbltDinVd5
	6s5Ar306rLWC1yYAKFDTyaf5gIhi3Rgi7348maHMbx9Mz5qJtU19cC+aNx4U35+XG1VK3hTrmL5
	m8zLobngKGQb2woWXEaAt6z+QyW3MiPOJbvooExxY3ywJt2fdyo2um9xBYzHSBkVOviKVChlET5
	8cguHddAyc2+yNV22d8JgnJ/KX6gG4/LY6WCkq1nXZboHA81MhGfqLUhJXqEiCamEwty9TkHte+
	sal84qXaAQ2/UKbCTIUdPdgCmK5mODsPy8z0rWUOYWbnlsGrbmzpi4Y+5MlN+LNo1TS0vcBYeVP
	ZtDnf4VOpLhMi1SBcypM+oGZmseX6DPGZI1fUuXg==
X-Received: by 2002:a05:600c:5296:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-4871605ceb5mr120849395e9.16.1774532828982;
        Thu, 26 Mar 2026 06:47:08 -0700 (PDT)
Received: from sarah-VirtualBox.Dlink ([46.31.102.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm29705765e9.6.2026.03.26.06.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 06:47:08 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: hverkuil+cisco@kernel.org,
	Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH v4l-utils v2 0/2] fix expected buffer length calculation
Date: Thu, 26 Mar 2026 15:45:01 +0200
Message-ID: <20260326134503.10323-1-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57149-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarah556726@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1AFAB336539
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

v2:

In this updated version:

- Restore single-buffer calculation using bytesperline
  Replace the multi-planar v4l2_fwht_find_pixfmt-based logic with the
  original single-buffer model, using bytesperline instead of assuming
  stride == width.

- Keep plane_bytesperline as added in v1
  The plane_bytesperline array and its initialization in
  g_fmt_setup_trace are unchanged from v1.


- Link to v1: https://lore.kernel.org/all/20260316132223.7337-1-sarah556726@gmail.com/

v1:
The current implementation assumes that stride equals image width,
which leads to incorrect buffer size calculations when padding is present.

This series fixes the issue by introducing stride-aware handling.

The previous version computed buffer sizes using per-plane
bytesperline values and v4l2_fwht_find_pixfmt, iterating over all planes.

Patch 1 introduces plane_bytesperline to store per-plane stride.
Patch 2 uses it to compute the expected buffer length.


Thanks,
Sarah

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
---
Sarah Gershuni (2):
  add plane_bytesperline to trace_context
  use bytesperline for expected buffer length calculation

 utils/v4l2-tracer/trace-helper.cpp | 22 ++++++++++++++--------
 utils/v4l2-tracer/trace.h          |  1 +
 2 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.43.0


