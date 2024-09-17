Return-Path: <linux-media+bounces-18334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D742297B115
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 16:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 908451F229BB
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DD317ADFC;
	Tue, 17 Sep 2024 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VG3kdr51"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EF420323;
	Tue, 17 Sep 2024 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582210; cv=none; b=YGakTErVjleyk7QY3rT14XyPDYkCPoYJICwbeUehf6jdkJ03u16hiAaMkYy1efcTnNGJj/i3V9rVVsMC3k/o3/JZxUNSETh0vjmZrnLzghSK/YiUA54jlvDNzCK1ZztvHL9sgcEydbC3pniO2TxgJdaH031wsLf6P4VAeWMNq2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582210; c=relaxed/simple;
	bh=iXygWqgsvlZ4USdjE4KG4+lh1cAoIA2R/07pye8+siE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p/w6HP+GOIznF/i3BrZUFE3H4L96iBKF9UsMJ5cipIURq+PmGmOC2sSFBZB6gFA1p5pN0NpF/ycYlp+PynKIE6QtQkb3hh0+kAZh/gGHL9BQrTLc+GuzrGBZ+6BjjbBm6CUl/Z9WiPsN84tuIGcsbLwB7mg1MfIWYh1ARhlWczc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VG3kdr51; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3169C514;
	Tue, 17 Sep 2024 16:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726582123;
	bh=iXygWqgsvlZ4USdjE4KG4+lh1cAoIA2R/07pye8+siE=;
	h=From:Subject:Date:To:Cc:From;
	b=VG3kdr51W/mcljJnuI5jmfFlx9vMwlUlJ8eihLsUEbEpJZpTxzvkW3pa/ME3GIb/+
	 v5NRBn0Fwbx5UJ8LzKspKjohBK+g25z4dRzuUrPXXw4Y2ZdkE9qN30Bhdrtn/5SUAJ
	 a/odRGXoTVeBOaUXprgsGYOt4Oxcnndw9oO1P+KA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/4] media: v4l2-subdev: Add cleanup macros for active
 state
Date: Tue, 17 Sep 2024 17:09:28 +0300
Message-Id: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJmN6WYC/x3MQQqAIBBA0avErBNMi7CrRAvTqWaj4UgE4t2Tl
 m/xfwHGRMiwdAUSPsQUQ8PQd+AuG04U5JtBSTVKM8yCXbzRC842o7DGTM5Jv1utoSV3woPef7d
 utX675DINXgAAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2320;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=iXygWqgsvlZ4USdjE4KG4+lh1cAoIA2R/07pye8+siE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm6Y23aU4AVMm7kTVvvMNhihlpGEH+U6rQxs59S
 xHxmcjFq0mJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZumNtwAKCRD6PaqMvJYe
 9Yu7D/439cuminfFl9puxve5vBS0uUeIweAZws2iN9f0jq4PSj+nwvXsIcDZLMHqJi76BVWaWz+
 I7k3/gIjs5PZe8aUqoqq8Jc5vE59/ISGNsCgLxZZszvbvUghR0s9G1RwPmu83OSmVTNDWwrBaAx
 lJxT03hbmVfZORyan9Om/FFOXch9jc0YXp69QuQN/znU+5e8+dCTdC0CBCAImbLskD/s06Lczba
 kIDn6/PlmG4VZ4L7tynotfipfZlB4wWJGEOEesFBD7URkxW1gw6FZLz5ipiLbhBFRHi+eamkv2d
 up6gazJp4ZMy2H326nUD6byYiAlA1IXDFtiofvZmKCln+eR4e9MyL283pEVkiCFcDEGzJ2sk46F
 5cOqube5lnVAuuxjNHgpDqmbBzyyWAVrN6kUFMa8wgk6WtjUjiQLmj90+3IqW0Ke1jaHQhtwqQO
 4FoUKZ3OemNxw8qVGpOgfBvBkZ/vk8asxl3N7xJEt+CTbdOyZHRYSVreoFC8/mARGEedj2+LL/K
 erT05Fp5IAirKj+q3RWB0BIn/WoffaYyhVgdZPEOTVVFnzOzfT9MVDSv075fTNADFduMd5+XaNI
 9W3rZ1/xNEO04ynivJg23rEr1UijT0e1AxOUjQad0xYer52yFDP76kKriPQbsN4RbTC/OJ4TRd6
 QNjQR+RsZ4SqI/w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add cleanup macros for the subdev active state. While we could add more
macros to handle state locking in different situations, I believe the
two macros introduced here are the ones most often needed.

A few drivers are changed to use the macros, as an example.

A few thoughts:

The scoped_v4l2_subdev_lock_and_get_active_state() macro will define an
implicitly named 'state' variable inside the scope. This is a bit
similar to scoped_guard(), which defined an implicitly named 'scope'
variable. However, adding the name of the variable as a parameter to the
macro is an easy addition, if needed. Then the usage would be:

    scoped_v4l2_subdev_lock_and_get_active_state(subdev, state) {
    }

Using the CLASS() version does take the name of the variable. The two
macros also look quite different, so I wonder if we should make a helper
macro to hide the CLASS() usage (I don't know what to call it...):

    #define init_v4l2_subdev_lock_and_get_active_state(sd) \
         CLASS(v4l2_subdev_lock_and_get_active_state, state)(sd)

The macro names are quite long, but so is the function name of
'v4l2_subdev_lock_and_get_active_state', which these macros often
replace.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Tomi Valkeinen (4):
      media: v4l2-subdev: Add cleanup macros for active state
      media: v4l2-subdev: Use state cleanup macros
      media: renesas: Use state cleanup macros
      media: i2c: ds90ub9xx: Use state cleanup macros

 drivers/media/i2c/ds90ub913.c                      | 11 +++------
 drivers/media/i2c/ds90ub953.c                      | 11 +++------
 drivers/media/i2c/ds90ub960.c                      | 27 +++++++---------------
 drivers/media/platform/renesas/rcar-csi2.c         | 14 ++++-------
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |  9 ++++----
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |  9 ++------
 drivers/media/v4l2-core/v4l2-subdev.c              | 14 +++--------
 include/media/v4l2-subdev.h                        | 10 ++++++++
 8 files changed, 37 insertions(+), 68 deletions(-)
---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20240917-scoped-state-a995cc0dba33

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


