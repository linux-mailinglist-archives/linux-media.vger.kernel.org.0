Return-Path: <linux-media+bounces-16070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CA094DBBD
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 11:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4E81F21B8E
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 09:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CC014D2A0;
	Sat, 10 Aug 2024 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUKNgHfb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226F1CD37;
	Sat, 10 Aug 2024 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723280966; cv=none; b=jp6TIJnL+ITtKqNfmAIobzY/W0QnVVZdgYhN6s6buzhyyYUyET3ggkx/FR/elAa3v/Ki1HuDsTFZK0pTVIo9R8KwCmOWB1x+NKvVLNf0U6hZksJIG8ZEjbK1iKe4A9FM9b4Xksq+LrxQbPHZCz3CAfD42LfrTWlq4KUMinvPJcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723280966; c=relaxed/simple;
	bh=oJdNYm3xIb8SsemhyEVCYW+SiamiZrrV94Dn2d41vVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pDXqgs8ssQqPgGJkiNSMxei3mIGWsM76eMfCjd6pYqxMy9dSYh2Kp4VqOhz4Lbgn3aiivIkRrwm9cUani8y86FtUhWdFXyxIuyntRktU733zyIvy2a54QE3+X4lCq5Jpb/+gDT7zyGrEUCFfnpsCWzaVZjEX8cCa72RteSZ8kP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUKNgHfb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E3BC32781;
	Sat, 10 Aug 2024 09:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723280966;
	bh=oJdNYm3xIb8SsemhyEVCYW+SiamiZrrV94Dn2d41vVg=;
	h=From:To:Cc:Subject:Date:From;
	b=ZUKNgHfbqNBa0epCG9+OXiYSfkXmHIBWD9RzeONcxlpSzIVlrigAOW/XyP6PTAmBi
	 uGYISosHyzVsQ9bzQNz1fjEE5JMZz8Xu7h/BXC7V2aASNB1Aevk0Rk9hqr5STf+dDa
	 N4RBj2S3g7BZZh2+7EWctZV4UoEKFGFhEGXdkon2xaEOd6lruVKMAovluBjzBST4oM
	 KK0dQ+L7uaNK40VGMWMt/ZbK1wneRQsnxnRj6TZ99/XA+DH+6cDVPHUHzdsJm5BwTU
	 e/AJbMCx/mqduWfIYovFeJajp1Wnz7GZVEwOAk1P2PNVkhwBus/PDzCJcUN/AYKK3O
	 k6PeMMOit2sQQ==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 0/5] Remove cl in struct cmdq_pkt
Date: Sat, 10 Aug 2024 09:09:13 +0000
Message-Id: <20240810090918.7457-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cl in struct cmdq_pkt is used to store struct cmdq_client, but every client
driver has the struct cmdq_client information, so it's not necessary to
store struct cmdq_client in struct cmdq_pkt. Because mailbox maintainer
do not like to mix mailbox patch with other patches in a series, so
mailbox patch [1] would be sent independently.

Changes in v3:
1. Rebase onto Linux 6.11-rc1 and fix conflicts.
Changes in v2:
1. Fix typo of CMDQ_JUMP_RELATIVE
2. Refine cmdq_pkt_create() and cmdq_pkt_destroy()
3. Rename cmdq_pkt_jump() to cmdq_pkt_jump_abs()
4. Add cmdq_pkt_jump_rel() helper function
5. drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
6. mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
7. mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy()

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-cmdq8&id=a1b2f7a7488285975c1f439086f1c4cc51a13bb9

Chun-Kuang Hu (5):
  drm/mediatek: Use cmdq_pkt_eoc() instead of cmdq_pkt_finalize()
  drm/mediatek: Use cmdq_pkt_create() and cmdq_pkt_destroy()
  media: platform: mtk-mdp3: Get fine-grain control of
    cmdq_pkt_finalize()
  media: platform: mtk-mdp3: Use cmdq_pkt_create() and
    cmdq_pkt_destroy()
  soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function

 drivers/gpu/drm/mediatek/mtk_crtc.c           | 48 ++-----------------
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 48 +++----------------
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  2 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 22 ---------
 include/linux/soc/mediatek/mtk-cmdq.h         | 13 -----
 6 files changed, 14 insertions(+), 120 deletions(-)

-- 
2.34.1


