Return-Path: <linux-media+bounces-1220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309FA7FB727
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31D701C2140A
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21644EB25;
	Tue, 28 Nov 2023 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Es823PGa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C044C3A6;
	Tue, 28 Nov 2023 10:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F636C433C7;
	Tue, 28 Nov 2023 10:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701167076;
	bh=T1VDwdVoznG4IGcAFm7TZYH0xfCY62bnXCmWs4ZMug8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Es823PGa7N8+2/RqZWUTPGalS09UBfOox7B6BdSAOKCoXn8PUOkUjypJJZ64fuzIo
	 zMAB87ALQ3P2yVAo8iUbNumc2SBfTeZX6z7DLIz84dT2rRs6YSPPVTt3/MJ2WbqaK9
	 t6IFUAWO87PmVRy8jTpAjsXLvXi8JmMNvhNA3doYnUq/H/euKSzo0/zxJem0yfGK5D
	 PQ4nsCURYrT/V9f69RJNyjuVvcbb4ND4+Ac43aL4fCSFupOYYM+GE8t4istKgBxGiE
	 541gLkQza0iC1Fx6ONRbh7xbpqSvAnM1z7cLyhs7vRoMSZEa60HJY2tmnUkdJ0kC94
	 Lx8k+YvoT6v4Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 28 Nov 2023 11:24:16 +0100
Subject: [PATCH v4 05/45] drm/connector: Check drm_connector_init pointers
 arguments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=mripard@kernel.org;
 h=from:subject:message-id; bh=T1VDwdVoznG4IGcAFm7TZYH0xfCY62bnXCmWs4ZMug8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmp+y++fVU5/cIzv1tzXztP2P2vx3m9st/0q6cWNte2M
 agLmklO7ShlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBELm5j+MNl2NlnxjlVMZXv
 z+GJkn1ne/2eu2RavXKY/Ezpefc6m8eMDJMuH00x6BfoFTjeUq2VYb53F6tgkd9DB42sDwpNB5I
 tOAE=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

All the drm_connector_init variants take at least a pointer to the
device, connector and hooks implementation.

However, none of them check their value before dereferencing those
pointers which can lead to a NULL-pointer dereference if the author
isn't careful.

Let's test those pointers instead and error out if any is NULL.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b0516505f7ae..2f60755dccdd 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -229,6 +229,9 @@ static int __drm_connector_init(struct drm_device *dev,
 	struct ida *connector_ida =
 		&drm_connector_enum_list[connector_type].ida;
 
+	if (!dev || !connector || !funcs)
+		return -EINVAL;
+
 	WARN_ON(drm_drv_uses_atomic_modeset(dev) &&
 		(!funcs->atomic_destroy_state ||
 		 !funcs->atomic_duplicate_state));

-- 
2.41.0


