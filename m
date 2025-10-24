Return-Path: <linux-media+bounces-45452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A72C0469E
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 07:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A844D3B8B62
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 05:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE6E26A1C4;
	Fri, 24 Oct 2025 05:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iX7MkurQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8833A257846;
	Fri, 24 Oct 2025 05:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761284991; cv=none; b=WbImH7cOHmzLNYLuJLIx4wQ7orPkhQ+CKfEDujGWv8GJFrM6UYOYiagn71rIKQGAOU7yP7Eubcuow8deG6Ye39wC/p5gPpA4XWfhxg2MfWkQaXpEzEYBrbaGKLTuHZyCRBv4F8Q+6n3XG17NxoOxyWXD5sgyFoO4PhMWUTdaZBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761284991; c=relaxed/simple;
	bh=1WfFvzYHcSDCH+B4HhPvJNCEBqTW4nPE8Kyf9KkINlQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B7ZqOcCmHmZcIh0gQCP2mm/CeAb+PpPM7kbC1LVUEr+JubLyQD7n4rk7s075JR44NbL3pcpE3MABG26RLUB7/HBVJb8ErvA1zn56uzm3vTF8g50H/s+DSD8GvHQbbPdWPQA5Euv93OQ52idDZeYJaK7Dz8JwRj1YjJMuFQzrqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iX7MkurQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23E8BC4CEFB;
	Fri, 24 Oct 2025 05:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761284991;
	bh=1WfFvzYHcSDCH+B4HhPvJNCEBqTW4nPE8Kyf9KkINlQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=iX7MkurQJ9AIz+dZEo4Whq+NfqOsWYsvXgGSMFoGCn84kX6FrhN0aRFeYPxRCIqsP
	 6njWxy1yhWSQ1pfqdTCkb8yT6mzSgBqrus9Ota7lwcHlJ3TAIH9v4EF628HifZoiXv
	 o2fiRDIwdfiic+yd0Twjigc3NFgduCEJkGNSHdGZf2JulVIT2aN1+iWmtZzIT8X+7g
	 RkhqHCynYhDhD1GlO1eggLpHST4gBQz4GhR7GvnicTHExqs6H+GA4oECp1HJrIJr+I
	 rYwtYwBBRakUNXvag3lXgby6uO1xbG64qAB6eU93YkVZGLCBhhe72D9TNyantA32Db
	 ms/Vpn1gTOzXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AC6CCD1BF;
	Fri, 24 Oct 2025 05:49:51 +0000 (UTC)
From: ymodlin via B4 Relay <devnull+yogev.modlin.realsenseai.com@kernel.org>
Subject: [PATCH v3 0/3] Since Realsense has been spin-off Intel, the
 comment should be change.
Date: Fri, 24 Oct 2025 08:49:45 +0300
Message-Id: <20251024-fix-uvc-v3-0-b7f83c012ca7@realsenseai.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHkT+2gC/2WMMQ7CMAxFr1JlxiixSUuZuAdiCI6hkaBFCUSgq
 ncn7QIS47P/e6NKEoMktatGFSWHFIa+AK0qxZ3rLwLBF1ao0RqNCOfwgmdmwJYafyLDriVV1vc
 o5bWUDsfCXUiPIb6XcDbz9b+RDRiQDXtNta4bsvso7pqkT+LCmoebmksZf2362ggaDLe0tYS28
 fxvT9P0AT6nBRXiAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ymodlin <yogev.modlin@realsenseai.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761284988; l=1124;
 i=yogev.modlin@realsenseai.com; s=20251022; h=from:subject:message-id;
 bh=1WfFvzYHcSDCH+B4HhPvJNCEBqTW4nPE8Kyf9KkINlQ=;
 b=1Zx2wW+eD4XJ3ZaGki86OeNxnYyV7T4kL1wmAS3vBtcEI4vsuwSfZ+FJYtfQLDn/5ZAk57JiF
 S6rqnwGByFkAUTVednIvUFZTR2TjS91ZLubkm8LdFa2fEZd5SJMKhpc
X-Developer-Key: i=yogev.modlin@realsenseai.com; a=ed25519;
 pk=V3EENbzJJO6YkqjrHtGmN67ulKS2b5TU7Ze0hVi1G1o=
X-Endpoint-Received: by B4 Relay for yogev.modlin@realsenseai.com/20251022
 with auth_id=549
X-Original-From: ymodlin <yogev.modlin@realsenseai.com>
Reply-To: yogev.modlin@realsenseai.com

Signed-off-by: ymodlin <yogev.modlin@realsenseai.com>
---
Changes in v3:
- Add metadata support for D436 and D555 cameras.
- Realsense D555 has been released to the market earlier this year.
- Realsense D436 will soon be official it's currenly being supplied to
  beta users.
- Link to v2: https://lore.kernel.org/r/20251023-fix-uvc-v2-0-1c93853257dc@realsenseai.com

Changes in v2:
- Fixed commit message formatting
- Write 'Intel RealSense' for D400 family of depth camera comments
- Link to v1: https://lore.kernel.org/r/20251022-fix-uvc-v1-1-e4cd03606735@realsenseai.com

---
Yogev Modlin (1):
      media: uvc: Add D436 and D555 cameras metadata support

ymodlin (2):
      change: drop 'Intel' from RealSense camera comments
      media: uvc: Add RealSense vendor prefix to Intel camera comments

 drivers/media/usb/uvc/uvc_driver.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)
---
base-commit: 552c50713f273b494ac6c77052032a49bc9255e2
change-id: 20251022-fix-uvc-2937db31ca93

Best regards,
-- 
Yogev Modlin <yogev.modlin@realsenseai.com>



