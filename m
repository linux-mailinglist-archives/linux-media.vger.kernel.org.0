Return-Path: <linux-media+bounces-45396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F62C01C98
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 16:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B3EF507AD7
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 14:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D1530F7ED;
	Thu, 23 Oct 2025 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEhlRY9W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53028330B29;
	Thu, 23 Oct 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761229839; cv=none; b=Xl8RY/cDzXPbZeQTZGxm5nkee6hBBg8jt55vHFU83vL2qcL+8LmAVBKFca/gGcmc/FVE6WyZJh0Fo09de4K+nnN7w7AE/Ok8upoYCzwVJls+5ECc3gcn4yvB0UoMD5ybAl07ntZJMluhrRzQ5zcwoFzr9yqvQWpgfZrJ/RWBBUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761229839; c=relaxed/simple;
	bh=8jWBZymH5QTt8c150L0evYjJSEI+8ji+eHa5bEcksMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l2iwuULXNzd0/LCuK02Uxh3qK3FmyoI2iEsYEycDFkuheemDrEmtIGwGDqSZiciHY1p9si+V04MdPC8j9d2nsku7qX3/LKxrxYokLuKB04ZYOLNn6/cN7ddz220utr5KB5z42yDdn5y0ECNBxr3Px8tcj7CtPJz52BAetGkHmok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEhlRY9W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BA5C4CEF7;
	Thu, 23 Oct 2025 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761229838;
	bh=8jWBZymH5QTt8c150L0evYjJSEI+8ji+eHa5bEcksMA=;
	h=From:To:Cc:Subject:Date:From;
	b=cEhlRY9W8CMoBk0eV/tNP9c2hNrAN096x+IHo5GrduYd6HotQae8LG1Hj/VeKVfoZ
	 Fd09cm5dcFEk39eVzxRGWCcRwylvZdXHHbYBuRki1qK1GrLeqMvwJa1Gk1xabESEnM
	 TeFd6DqMmPU4FTn5OFGDZGbdehdCAlFLGekTmld2f2vlofbjpa0mj1gwVh3LGXo1q0
	 0B5dcpLsR0cTmuPr8NMXQvG8G7Fz19gKgO0DeXHusa28AKmJo1j/3k3Z7eSr5RZIj5
	 oqmS4k6CY0HokqQrlNOZOnM3Yl+UwkpKxdi3f1QUHJPOEXXJ0oAB7wV1H2ReDigN+C
	 CyZ6GYeAtL27Q==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/4] Add TODO list (+ small docu change)
Date: Thu, 23 Oct 2025 16:30:27 +0200
Message-ID: <20251023143031.149496-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched has so many problems that we should have our own TODO list for
contributors who might wanna help.

Changes in v2:
  - Add generic TODO list example that can stay in the file forever.

Philipp Stanner (4):
  drm/sched: Remove out of place resubmit docu
  drm/sched: Add a TODO list
  drm/sched: Add TODO entry for resubmitting jobs
  drm/sched: Add TODO entry for missing runqueue locks

 drivers/gpu/drm/scheduler/TODO | 51 ++++++++++++++++++++++++++++++++++
 include/drm/gpu_scheduler.h    | 10 -------
 2 files changed, 51 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/TODO

-- 
2.49.0


