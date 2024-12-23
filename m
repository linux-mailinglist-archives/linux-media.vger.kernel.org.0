Return-Path: <linux-media+bounces-24007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 391729FB092
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 16:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 818F01881CCC
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 15:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EC71B3931;
	Mon, 23 Dec 2024 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0bgQchq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994BA1B218A;
	Mon, 23 Dec 2024 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734966746; cv=none; b=FGzIGEmt5BsqAWPN0AuvnRbazJNWvZsKsgPhyicfPhPA+xFRLGU+sQffePis6fhsZI5zhM+nVmMnzaYBjBTckJpPN+hSzmme35+i2/xeNwaw+WTS5IA1DtG07TLgTYSdbRRxgURicUTCaxJVpS70AxCQHu18IIywFYKziwD3VSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734966746; c=relaxed/simple;
	bh=5OvMBBAIn4z1pixhSW0NLURXy5BwPla2ZRZbgZ60/vA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kQ5Lhy6OxKMapxPFqwMvgl0rJLmAIwUEr7zTIqcuPUBFl97zuDOOI0T5G6H2y8m8702qPsv9I6z2TV6ZS+940KKDulWw2iKke7ZSrsRnOBkpV9VH7OpoGystWLnYY1IKSAWhT/Xb3yC/2SrmbBC4MNkB59mMGdVOp2xYLb5CceM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0bgQchq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF71C4CED3;
	Mon, 23 Dec 2024 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734966746;
	bh=5OvMBBAIn4z1pixhSW0NLURXy5BwPla2ZRZbgZ60/vA=;
	h=From:To:Cc:Subject:Date:From;
	b=q0bgQchq498YOtgImj6YMYMsDbtULOACVP/m84PwGUFRLfHgYW3ONnAw6G6J6qI6d
	 WLIAGc30pEUYHLuiZWCUofkNqjDw2Fn9swPu5Ef85C+vn0AFZ93B4EfZU0zsclx+Vq
	 9KO1wZAEN4SGpK8vWjFUpikhddqPr+9oNKHJdw6MNOEwdoveiNzNGLIou3ZNdNA0TO
	 Rw2evrtayhi3QemyuiEccAIKTSFLutER0ylumDw/9LC++eeRJIGyTbe9loc6ixrV2l
	 8iGU2Zqz8F3KRNzrr1vLl+I2wGOmwyfI1L7NGRDqq1YgOUUx7lPNH7L5DGy1+6pUs6
	 34taeCl7qC5mg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Sasha Levin <sashal@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] Revert "drm/mediatek: Switch to for_each_child_of_node_scoped()"
Date: Mon, 23 Dec 2024 15:12:18 +0000
Message-Id: <20241223151218.7958-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit fd620fc25d88a1e490eaa9f72bc31962be1b4741.

Boot failures reported by
KernelCI:

[    4.395400] mediatek-drm mediatek-drm.5.auto: bound 1c014000.merge (ops 0xffffd35fd12975f8)
[    4.396155] mediatek-drm mediatek-drm.5.auto: bound 1c000000.ovl (ops 0xffffd35fd12977b8)
[    4.411951] mediatek-drm mediatek-drm.5.auto: bound 1c002000.rdma (ops 0xffffd35fd12989c0)
[    4.536837] mediatek-drm mediatek-drm.5.auto: bound 1c004000.ccorr (ops 0xffffd35fd1296cf0)
[    4.545181] mediatek-drm mediatek-drm.5.auto: bound 1c005000.aal (ops 0xffffd35fd1296a80)
[    4.553344] mediatek-drm mediatek-drm.5.auto: bound 1c006000.gamma (ops 0xffffd35fd12972b0)
[    4.561680] mediatek-drm mediatek-drm.5.auto: bound 1c014000.merge (ops 0xffffd35fd12975f8)
[    4.570025] ------------[ cut here ]------------
[    4.574630] refcount_t: underflow; use-after-free.
[    4.579416] WARNING: CPU: 6 PID: 81 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x148
[    4.587670] Modules linked in:
[    4.590714] CPU: 6 UID: 0 PID: 81 Comm: kworker/u32:3 Tainted: G        W          6.12.0 #1 cab58e2e59020ebd4be8ada89a65f465a316c742
[    4.602695] Tainted: [W]=WARN
[    4.605649] Hardware name: Acer Tomato (rev2) board (DT)
[    4.610947] Workqueue: events_unbound deferred_probe_work_func
[    4.616768] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.623715] pc : refcount_warn_saturate+0xf4/0x148
[    4.628493] lr : refcount_warn_saturate+0xf4/0x148
[    4.633270] sp : ffff8000807639c0
[    4.636571] x29: ffff8000807639c0 x28: ffff34ff4116c640 x27: ffff34ff4368e080
[    4.643693] x26: ffffd35fd1299ac8 x25: ffff34ff46c8c410 x24: 0000000000000000
[    4.650814] x23: ffff34ff4368e080 x22: 00000000fffffdfb x21: 0000000000000002
[    4.657934] x20: ffff34ff470c6000 x19: ffff34ff410c7c10 x18: 0000000000000006
[    4.665055] x17: 666678302073706f x16: 2820656772656d2e x15: ffff800080763440
[    4.672176] x14: 0000000000000000 x13: 2e656572662d7265 x12: ffffd35fd2ed14f0
[    4.679297] x11: 0000000000000001 x10: 0000000000000001 x9 : ffffd35fd0342150
[    4.686418] x8 : c0000000ffffdfff x7 : ffffd35fd2e21450 x6 : 00000000000affa8
[    4.693539] x5 : ffffd35fd2ed1498 x4 : 0000000000000000 x3 : 0000000000000000
[    4.700660] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff34ff40932580
[    4.707781] Call trace:
[    4.710216]  refcount_warn_saturate+0xf4/0x148 (P)
[    4.714993]  refcount_warn_saturate+0xf4/0x148 (L)
[    4.719772]  kobject_put+0x110/0x118
[    4.723335]  put_device+0x1c/0x38
[    4.726638]  mtk_drm_bind+0x294/0x5c0
[    4.730289]  try_to_bring_up_aggregate_device+0x16c/0x1e0
[    4.735673]  __component_add+0xbc/0x1c0
[    4.739495]  component_add+0x1c/0x30
[    4.743058]  mtk_disp_rdma_probe+0x140/0x210
[    4.747314]  platform_probe+0x70/0xd0
[    4.750964]  really_probe+0xc4/0x2a8
[    4.754527]  __driver_probe_device+0x80/0x140
[    4.758870]  driver_probe_device+0x44/0x120
[    4.763040]  __device_attach_driver+0xc0/0x108
[    4.767470]  bus_for_each_drv+0x8c/0xf0
[    4.771294]  __device_attach+0xa4/0x198
[    4.775117]  device_initial_probe+0x1c/0x30
[    4.779286]  bus_probe_device+0xb4/0xc0
[    4.783109]  deferred_probe_work_func+0xb0/0x100
[    4.787714]  process_one_work+0x18c/0x420
[    4.791712]  worker_thread+0x30c/0x418
[    4.795449]  kthread+0x128/0x138
[    4.798665]  ret_from_fork+0x10/0x20
[    4.802229] ---[ end trace 0000000000000000 ]---

Fixes: fd620fc25d88 ("drm/mediatek: Switch to for_each_child_of_node_scoped()")
Cc: stable@vger.kernel.org
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Reported-by: Sasha Levin <sashal@kernel.org>
Closes: https://lore.kernel.org/lkml/Z0lNHdwQ3rODHQ2c@sashalap/T/#mfaa6343cfd4d59aae5912b095c0693c0553e746c
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..12cf3d9872ea 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -373,11 +373,12 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
+	struct device_node *node;
 	struct device *drm_dev;
 	unsigned int cnt = 0;
 	int i, j;
 
-	for_each_child_of_node_scoped(phandle->parent, node) {
+	for_each_child_of_node(phandle->parent, node) {
 		struct platform_device *pdev;
 
 		of_id = of_match_node(mtk_drm_of_ids, node);
@@ -406,8 +407,10 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
-		if (cnt == MAX_CRTC)
+		if (cnt == MAX_CRTC) {
+			of_node_put(node);
 			break;
+		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {
-- 
2.34.1


