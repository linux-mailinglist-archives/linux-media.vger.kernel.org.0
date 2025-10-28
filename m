Return-Path: <linux-media+bounces-45785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C053C14005
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 983315672DC
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D7E3043C9;
	Tue, 28 Oct 2025 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pV7tbHs3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFB2571DA;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761645925; cv=none; b=D40b841Z3C54S8JmN681C5qlZrK5k8YDOhfmAXC4M24V261tHaJvrKHg/tYNZ56bmkZVcLt5e8gJg3KqooRf5UkcVUQ2mWg6oHBFzuDfZW8KD9XwTTq69DMvp2rYxRHNeQviTa9aS6+eFfWtn0SzYbxTnzkEIy14qGq0DVbqNEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761645925; c=relaxed/simple;
	bh=cboT8hdgAS+dJXCgWDc4oLFGKxlmUgQ1vL9o91ppk8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vwvvn9f8HMXT9MANi/hd8ogk4HyCA/R0jA/Zi3uttXVq46G8Zv2uFGZpvwvmTY4LJIs+w5kh2u+RLhKwhopFd7kiGUAQwZCUb8vgGl8j1LGRWhEKcVo8+pEnXt2xyId9SNZVm3bcTL2bZn2SebKdGkbSURxuSttAz9nxiw+QOsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pV7tbHs3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C50FC4CEE7;
	Tue, 28 Oct 2025 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645925;
	bh=cboT8hdgAS+dJXCgWDc4oLFGKxlmUgQ1vL9o91ppk8E=;
	h=From:To:Cc:Subject:Date:From;
	b=pV7tbHs3rae0oYm+a+xLllG1b8RhmWWrP5cmFqfk+kAVXD+mq+MIRYEwqq99LG8CJ
	 M7kIqUAjCVUzvACo2SPi0b1nUYiexZI/hpLQXY6uokX2OCQO1JzwY34b6WjHRCeTGu
	 X1gqxh2owYOvDbxKa0ot+GK4YLvzLBuo7Blx/8bwedKHPaaCpN58/b3BWn6DiMwlB7
	 ZIA9ppAUDaF5Y54x78tCYbijhv5VU2k1Pm+rE32gDHDyDSaPG0zOJic7MY2NnVUww0
	 3do9eT6Ed25Zpet+qxYC9u3bGYjfgshBx7SNup7qtLT0kPKlGocJ34gRHaW2Aac+CK
	 imU5EGYswxXUA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDga0-0000000014g-3A6c;
	Tue, 28 Oct 2025 11:05:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/2] media: mediatek: fix VPU device leaks on probe
Date: Tue, 28 Oct 2025 11:04:52 +0100
Message-ID: <20251028100454.4086-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes VPU device leaks during probe of the mdp driver.

Included is also a minor documentation update to make it clear that the
VPU lookup helper returns the device with an incremented refcount.

Johan


Changes in v2
 - drop incorrect vcodec patch since that reference leak has already
   been fixed by commit bf1d556ad4e0 ("media: mtk-vcodec: abstract
   firmware interface") which added the codec release callback


Johan Hovold (2):
  media: mediatek: mdp: fix device leak on probe
  media: mediatek: amend vpu_get_plat_device() documentation

 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 7 +++++--
 drivers/media/platform/mediatek/vpu/mtk_vpu.h      | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.51.0


