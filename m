Return-Path: <linux-media+bounces-43067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12819B9A0E8
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 15:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F308E1721F8
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 13:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F62305079;
	Wed, 24 Sep 2025 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/m9EUBF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F172848B7;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758720987; cv=none; b=eYv+yk2Vy/tckYDGO01RFo9sAkdFoVxoCBmUhfYHaMJ8HwQcddhx9v3RSJpK/CU4Ic3W3tFx3Z/L7/s/S/M/Vrzt+AhOp4Juzjb1uRdCDq3LEISeoSzI5Ylv5aw1PpovEjwcNn/phetGJO5K8kvm0tKnlG4xZFeukS21ue+ulJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758720987; c=relaxed/simple;
	bh=0eGbMVZE9ppAw4JKx2/t7b/9Qqfa2SiBgK+5orCgncE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7kxlUJIdryMq/z43+/2GMtEmZ57P2fU04thpJS6IXBm7a8PTUp/gpTkxy8DZUtq0Bdm4hGxySSIz4OP//J5DlEOewNThg5HVcZzdTgWW0iAzZBK4i4huPtdw43BscDzOzhbhbeBrR7LiwsWMwbMqe4V2O3tlCgC2IotAbfO4lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/m9EUBF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBE3C4AF0B;
	Wed, 24 Sep 2025 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720987;
	bh=0eGbMVZE9ppAw4JKx2/t7b/9Qqfa2SiBgK+5orCgncE=;
	h=From:To:Cc:Subject:Date:From;
	b=W/m9EUBFg8e5Wh2gJL64hhHsELJfLetGpxwu6EJmwR/Ja+SrIW8LOusgf4QEmBMn3
	 r4YWqJJPE2ZfhaS+CG4j5bHfq9UsxH52bMOJ2j280kPwFykwWtJpi9OkRbpOXBsFVZ
	 sv36yt5kSWrhSNMbhCbtP8zV27nakdpWM20cf2g4RLji34X+ly3NE0noeIZiyjr7kq
	 CJq2WxlMwrxjR/DiuGzJUf/nv3EnZzvi+62ASdZGI32H3X3dfmqMul1yJkob8vLt9s
	 nrrw3bbE80b2IJq5f5LmvEK4NGYJej8d4DVdLNULP6J24vnfrwcS+tVSY8wm0W8QTG
	 XacDnTsp2rj9Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v1PfQ-000000007Vk-28ai;
	Wed, 24 Sep 2025 15:36:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] media: mediatek: fix VPU device leaks on probe
Date: Wed, 24 Sep 2025 15:35:49 +0200
Message-ID: <20250924133552.28841-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes VPU device leaks during probe of the mdp and two codec
drivers.

Included is also a minor documentation update to make it clear that the
VPU lookup helper returns the device with an incremented refcount.

Johan


Johan Hovold (3):
  media: mediatek: vcodec: fix device leak on codec init
  media: mediatek: mdp: fix device leak on probe
  media: mediatek: amend vpu_get_plat_device() documentation

 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c  |  7 +++++--
 .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 13 +++++++++++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.h       |  2 +-
 3 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.49.1


