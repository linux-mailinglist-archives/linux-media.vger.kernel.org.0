Return-Path: <linux-media+bounces-45421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0ABC032AB
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 21:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E7AD634600A
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 19:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48D634D4F1;
	Thu, 23 Oct 2025 19:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZHa1RaS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D3026FDB2;
	Thu, 23 Oct 2025 19:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247460; cv=none; b=WrEwAvM2e31eAjXKmFDVlBEi8dFke6n8o0O9ABRAS9BQWVgeKVI24/gVra2UcQozNvnZSe1xHecnMLO4qQq2QTPr4drGhqbTZLBjLOeWgn0beGdh1GX9BQjGrVj3+4F3HxupAioTTxq+0pCQhDcdhynsna6Y0ntiRluvUD+Hibs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247460; c=relaxed/simple;
	bh=gbR+ILxy7ngx0bQKjqtcEIog8d3NC2/uBdxDrlmQj6M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mh0yaMMiX3mswpvPgVE6KGj97/LvwQlk9VJasb5qoozQ+iFkyvWVUvhShUZnqxRAeqGyge/Ny+6Q9VlzdvMV7q+oRkC3e2xxO/Iko6IaewJeAMDwUF9yHy2YA7vNjiIi4haN9K+T8xtxF6x62W8O3krjh8BFmnvMvspdMNxPp6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZHa1RaS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFA75C4CEE7;
	Thu, 23 Oct 2025 19:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761247459;
	bh=gbR+ILxy7ngx0bQKjqtcEIog8d3NC2/uBdxDrlmQj6M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gZHa1RaS0GYq63IMeLBpm7DYoqNTtlacqXBSyFuqDtEsaPELUrCrrzfwyoF0h4xZG
	 pK19LSarWGDawCdasdPFnPGETJqtXRcXxzzuTicxnRA4CCE0lI1Z5NPGlJbGSh3HKz
	 UC7XZJ3mg4Xu7lmYPTDy7QuqOOKJ0qRqtREPeTqyrVphaYMkZy0TgS8ukg95zgmyJ3
	 VnA+EQ+s7ZgSnXB7XlIKNkf+Pc+c65PusLzIPHIXhVnNu/Lf0WAQGV/AqiGLmp8QLb
	 t8YfUWbpC66hP7CUXOkzCVlQ2xqNn4TMya4KNJQ0eQjaKZ+1bpU3V/tP/XcZakwo9C
	 3zlsOZOoKMcAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6752CCF9E5;
	Thu, 23 Oct 2025 19:24:19 +0000 (UTC)
From: ymodlin via B4 Relay <devnull+yogev.modlin.realsenseai.com@kernel.org>
Subject: [PATCH v2 0/2] Since Realsense has been spin-off Intel, the
 comment should be change.
Date: Thu, 23 Oct 2025 22:24:13 +0300
Message-Id: <20251023-fix-uvc-v2-0-1c93853257dc@realsenseai.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN2A+mgC/2WMQQ7CIBBFr9LMWgwMtk1deQ/TBcJoJ1HaMEo0D
 XcXu3X5/n95KwglJoFjs0KizMJzrIC7Bvzk4o0Uh8qAGlujEdWV3+qVvcLB9uFijXeDhWovieq
 1lc5j5YnlOafPFs7mt/43slFG0cEHbTvd9bY9JXJ3oSjkeO/nB4yllC8YFGhnpAAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ymodlin <yogev.modlin@realsenseai.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761247458; l=705;
 i=yogev.modlin@realsenseai.com; s=20251022; h=from:subject:message-id;
 bh=gbR+ILxy7ngx0bQKjqtcEIog8d3NC2/uBdxDrlmQj6M=;
 b=/hf5jMg/w6jaMNNETzqPUwiKuWXEwpw9vekIIFCUmHvdjMvoEnqliu92PUWPUTEsDRzA2LAw9
 KjMSpGmePWwBLXre28crbiACLIpRgYgEeleRNTXhhqQpyV5D76cjBFt
X-Developer-Key: i=yogev.modlin@realsenseai.com; a=ed25519;
 pk=V3EENbzJJO6YkqjrHtGmN67ulKS2b5TU7Ze0hVi1G1o=
X-Endpoint-Received: by B4 Relay for yogev.modlin@realsenseai.com/20251022
 with auth_id=549
X-Original-From: ymodlin <yogev.modlin@realsenseai.com>
Reply-To: yogev.modlin@realsenseai.com

Signed-off-by: ymodlin <yogev.modlin@realsenseai.com>
---
Changes in v2:
- Fixed commit message formatting
- Write 'Intel RealSense' for D400 family of depth camera comments
- Link to v1: https://lore.kernel.org/r/20251022-fix-uvc-v1-1-e4cd03606735@realsenseai.com

---
ymodlin (2):
      change: drop 'Intel' from RealSense camera comments
      media: uvc: Add RealSense vendor prefix to Intel camera comments

 drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
---
base-commit: 552c50713f273b494ac6c77052032a49bc9255e2
change-id: 20251022-fix-uvc-2937db31ca93

Best regards,
-- 
Yogev Modlin <yogev.modlin@realsenseai.com>



