Return-Path: <linux-media+bounces-11957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC2F8D026C
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78BCD294AE2
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89B515FD07;
	Mon, 27 May 2024 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uC4P/69Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2804615FCEB;
	Mon, 27 May 2024 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716818303; cv=none; b=Os6hpG7F1tj0IwOIDDlq5v69kSrEiRk+Qnfc1YgCDRBpfksexwdUxsRUBpv2GfE91rEHN6Ni7ggeHp5XLUNsPJMaapoGKnoQq8bYN6NjPci4Z1Ph7TLlZfMjJpFNBXxivAixw9MIOJcd688Eew5jl8a5UCHiG51/w8YKOceLilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716818303; c=relaxed/simple;
	bh=Rw5+InX0fgillZLgsQwYR3h19gtgu6sjCwii1TYZtTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ls/zCS8hwSKIS6h104FMMfA+LJUmrULqkc9OAc9gYv8SrUxztnH4FibXomV9Z4ilVUe7NAFt4M5itEAfNO6QpYfBzR4yuDHTTMczso6ZOlPDkiNLrKOLL+gToQ/sM6WISRvqW+rmWpjbzKRcJwfCcbrOKwheyWOPTZNlfI08gfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uC4P/69Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672D2C2BBFC;
	Mon, 27 May 2024 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716818302;
	bh=Rw5+InX0fgillZLgsQwYR3h19gtgu6sjCwii1TYZtTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uC4P/69ZVYx4tWN6ltPAff+QtAjXoubpZRtb3snppYrEm8c1ufwFVVRgbMN2FIk3n
	 HXWWPPaRn/ZrTxpotNI89iXmD9Dl7cRu1yRFpAVecudaJfeK+CoENNr+wG4XJTz5TN
	 WAdjgrQHZeb2Q/JNf/Lb+FsYcIJG2TWfBqk+tAa2VO9xMlAAfDyjtkhH1IrA2sLbwt
	 bFR24eq2xX66AWIOck9ZFOIQdxzoRHf4b60GPjNIo4C6beIGMmqTXT/XovvZYtACxH
	 7L2q5KXkowQ6iZZk+kxDvAv7ctq9yMi+hnbkuLViqa8Z3umL5lA0s2h8Ak4+J0ra6D
	 Q5DZLZbDQ3ggQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 May 2024 15:57:54 +0200
Subject: [PATCH v15 05/29] drm/mode_object: Export
 drm_mode_obj_find_prop_id for tests
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-kms-hdmi-connector-state-v15-5-c5af16c3aae2@kernel.org>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=998; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Rw5+InX0fgillZLgsQwYR3h19gtgu6sjCwii1TYZtTA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGkhE5N8Cy/t9J+b9F7JZOOPMGORgi69a6vmtgcc6f23d
 puGe/yBjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARtZWMDRMED35Ok3PdVx/b
 7f+Va1qF3bHpy5kWfTvjM+PjXs6vxgd9O94ESBwMqxLqa2p0knrHyNiwJt5Y5fIzCcdva1h3nL6
 5duYT+wf6CswK5xZ+C63zOnd+Z+rvOyfmqXw5eNOVxfBIauVJAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

We'll need to use drm_mode_obj_find_prop_id() for kunit tests to make
sure a given property has been properly created. Let's export it for
tests only.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mode_object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index 0e8355063eee..df4cc0e8e263 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -476,10 +476,11 @@ struct drm_property *drm_mode_obj_find_prop_id(struct drm_mode_object *obj,
 		if (obj->properties->properties[i]->base.id == prop_id)
 			return obj->properties->properties[i];
 
 	return NULL;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_mode_obj_find_prop_id);
 
 static int set_property_legacy(struct drm_mode_object *obj,
 			       struct drm_property *prop,
 			       uint64_t prop_value)
 {

-- 
2.45.0


