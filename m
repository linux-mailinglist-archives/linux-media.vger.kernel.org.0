Return-Path: <linux-media+bounces-30238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D898A89DD7
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86FEC3BB8E1
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 12:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4379E296D36;
	Tue, 15 Apr 2025 12:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubMczIaY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B291F418F;
	Tue, 15 Apr 2025 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719549; cv=none; b=pHWkqN2ZzNJD2iftM0XAR01Bkl2EEXU6HYufEHnHvLcVf8wp2eTR9wLeDwuAfKdt1C83LJ9psUVGmyXoV1/OSyGOg5nXqQ67t2dkrU/9Hxx5o4kciWR5lolGOV9qhqV7sjv+XKhEz+iQr8X37q3T05BK3X+B6ATHZ5za7kU1SwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719549; c=relaxed/simple;
	bh=ZXQ6hDhSI4430uuHaK9P1SM9exODYN0ru/5bciErF30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tclND1IuvxfX9Q37c7KioJTqDE/4eMJTceoYOzxSPHL+XMJwncSt97/Ou5B+A3nQzEV1XzHQMEIELyrABUKfpXdbht9DkRhy41QfN44Y3dZoEZpOc11dL3kdYGbh27cIK25qcWNnR0MFfrhW17eevYLSiU6n2gjppoOy+W37OmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubMczIaY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7286AC4CEDD;
	Tue, 15 Apr 2025 12:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744719549;
	bh=ZXQ6hDhSI4430uuHaK9P1SM9exODYN0ru/5bciErF30=;
	h=From:To:Cc:Subject:Date:From;
	b=ubMczIaYX+WclUcufziZyoz5Lfa6B6XTyicQB5Tnqj8cMIHyvDq9ZEYMhPFGtK3Rk
	 iaZVrUfK8dw4eIcRSyvXYCF11NMXFPn7SiHbw6lDJtoVhN4p8KCDYrHCdcZWK7wJGB
	 p+qhXhsnXEn/AfoCqihsgNUAJ8Vd4xg7/YXHPBGN9P7qpwhZWvfhzGUb+lwNL6lpzv
	 YnWuc2YkdXM+fGSFfJtPSL4bNqa7kG4Nwz/r+i+iU0khqTtpQIljBSIUcpTdT2nbxu
	 wBkPSPa9DPu7sxGOX1rQ5p2t5iYohuRDm62+KT+PeF62xglDmKz4MChUWCPo3sP4co
	 TEVqKQmVyuZoQ==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 0/2] drm/nouveau: Don't set signaled fences' error codes
Date: Tue, 15 Apr 2025 14:18:59 +0200
Message-ID: <20250415121900.55719-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:
  - Only fix the issue by checking for a fence being signaled in
    nouveau_fence_context_kill(), before setting the fence's error.
    (Christian, Danilo)
  - Drop cleanup patches. Instead, idiomaticize for-each-loops.

Was called "Fix & improve nouveau_fence_done()" before.

I've tested this with KASAN & kmemleak.

P.

Philipp Stanner (2):
  drm/nouveau: Fix WARN_ON in nouveau_fence_context_kill()
  drm/nouveau: nouveau_fence: Standardize list iterations

 drivers/gpu/drm/nouveau/nouveau_fence.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.48.1


