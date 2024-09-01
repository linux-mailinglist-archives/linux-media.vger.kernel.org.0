Return-Path: <linux-media+bounces-17297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AED96771C
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 16:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 060B91C20F4C
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 14:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E64A183CAD;
	Sun,  1 Sep 2024 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXkoa9zK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D1318308A;
	Sun,  1 Sep 2024 14:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725201187; cv=none; b=b8FcTEF+WxHLkpLrgcxlaYKmgjDf/diyxTnFLd4u91AHj51btSPqOSzS/HyUw6M0Dl4Ixad92Lui4ls2uGEtMU6P7xwtok44QckXFvHMqS7sfc/Fz6zpQHJkE4o0IVmAKn74rAKdFC/W0in7akKW/5PoE9IzUGP7znEhDJrQFU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725201187; c=relaxed/simple;
	bh=kwPiH44pV1ANFJhkdOlQ2NoEBgwHo7h8ejpepwo1EGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gDBtnSHP/ez1zJsu1Z1CZzC+N+GnEFGxS2CyYcIg2YOXkFdIiy1abH5uUxkfupPrUVTiaY4MD0Gg5FJTQPCzAVjqD03irMCbebJSDizloU88z+RVcTwd0hIwT8nEhOmQEi+AWUdw6zcoO3SZ+QVWH4/CLH0UmYJMlu0jwvV/T00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXkoa9zK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83635C4CEC3;
	Sun,  1 Sep 2024 14:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725201187;
	bh=kwPiH44pV1ANFJhkdOlQ2NoEBgwHo7h8ejpepwo1EGg=;
	h=From:To:Cc:Subject:Date:From;
	b=WXkoa9zK+zwyHz3IGIZIBI49Cak3R/xK0dOG42JMjUdpekcS9VOsXzkkAj37LChqv
	 12/aGUKYtkBI/aLxQdYq9pG0dWmFRYL05d4yGOKcgm3SYMhhhib+YruMcc6pSWt2u4
	 RWxmHE+d7QEe/Go6VfP+1ipw6eufotuX7wutA0tfE1tJ3ScPfg61GnzskzBTbTWF02
	 3mKTBYRCp8M9n10iZRsPPuBkhMpaXMKhbO+XCEFcNEJ4eVPo9/RgUq4ALHvtHAXLQN
	 xS+bZxQp/ojwtOI22cq6rjTdjRhynrZPAk2Yyz4W7dJiemdBR7f9gPVSyzOxBCjh8e
	 cV7cuBMUi+BQQ==
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
Subject: [PATCH v4 0/3] Remove cl in struct cmdq_pkt
Date: Sun,  1 Sep 2024 14:32:56 +0000
Message-Id: <20240901143259.16849-1-chunkuang.hu@kernel.org>
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

Changes in v4:
1. Rebase onto mediatek-drm-next-6.12
2. Fix build error in mpd3 driver
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


Chun-Kuang Hu (3):
  media: platform: mtk-mdp3: Get fine-grain control of
    cmdq_pkt_finalize()
  media: platform: mtk-mdp3: Use cmdq_pkt_create() and
    cmdq_pkt_destroy()
  soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function

 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 49 +++----------------
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |  1 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  2 +
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 22 ---------
 include/linux/soc/mediatek/mtk-cmdq.h         | 13 -----
 6 files changed, 11 insertions(+), 77 deletions(-)

-- 
2.34.1


