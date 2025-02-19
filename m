Return-Path: <linux-media+bounces-26335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C355A3BAD9
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 233B23A2A32
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 09:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D302E1C3BF1;
	Wed, 19 Feb 2025 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u4ZIoNsQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5891C07D5;
	Wed, 19 Feb 2025 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958269; cv=none; b=cAXcbXokCn5SjG8I8ws+CwCP0RNxv+pfGEQMUNx75hXoY3vICS7rTHg9cw0Dj8ZaW+LUZGZ1gTYQO4sZvlTT0mvpmaWo2xPYMnGVrkwcWzwdzW9L2KQGqjpJ2Dgtj4+oyOB66oo684EUALrTqqzoaIUwrSdu9/AjAcy1MtHoITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958269; c=relaxed/simple;
	bh=vgMAwgPmDiSVX3oKTWyuWdHQNxgNKQWXMsS82fzlN6Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MMYtzoJfBc/DCfz4lAP1Ni2ReXXZtL6VUhTtPmm5sf3+l2OUpP9ccp6kKrhFlSvEeEtJf+c/d0A50ijlM28e1Ud2kQSCRljf2DsK2uPltEV23y2a+Hnjomy2TDaz5ZoWfImKYo4ZbqhhNMT3hzrpo362UGqbQ/QnbzlbCbfoHAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u4ZIoNsQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06F1C3A2;
	Wed, 19 Feb 2025 10:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739958183;
	bh=vgMAwgPmDiSVX3oKTWyuWdHQNxgNKQWXMsS82fzlN6Y=;
	h=From:Subject:Date:To:Cc:From;
	b=u4ZIoNsQz/XyoW8zB4E1L40kkBftScZC44jnPL4hlSyd2xv3kfiwVcPipVrJrKEQt
	 OsptOcwg/yBuNPW1ygXwFawBHft4gEjXGKZA/s+d+U+O1m3uvG7iPPZNuoxzKLOWaX
	 o7ZOCrm4KW+4ghjyYVztGh8kbKI0VlJM6O9xUBSQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v2 0/3] media: subdev: Add v4l2_get_frame_desc_passthrough
 and use it
Date: Wed, 19 Feb 2025 11:44:06 +0200
Message-Id: <20250219-frame-desc-passthrough-v2-0-5135d57ecd6a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOentWcC/4WNQQ6CMBBFr0JmbU1bWkBW3sOwqHSgs4CSDhIN4
 e5WLuDyveS/vwNjImRoix0SbsQU5wz6UkAf3DyiIJ8ZtNRWatWIIbkJhUfuxeKY15Diawyiqhp
 p0ajyVhvI4yXhQO8z/OgyB+I1ps/5s6mf/ZvclJDCldrYZrBlrcydPDqO8zO65K99nKA7juMLT
 oZ0msMAAAA=
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=vgMAwgPmDiSVX3oKTWyuWdHQNxgNKQWXMsS82fzlN6Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBntaf0E+PTeZhFqJUqT2Yjl5NHFRNx8atVNJhx0
 yDJTCcrhvWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7Wn9AAKCRD6PaqMvJYe
 9f2vD/4noY8cco6OtUB/QKSTvQsEpOrqAjNf84u1zxgXufexwscgctojjge0QqbUdOGut+44Es3
 GaZdsaNmd5bkzQsTf/NJKshfmO82j/ua8Pf0aWir6Zu89ENEAmmaTdc+H8uScEA119SxviSFUmV
 bxnAyjNQ1CjLJcL+oPDe2LpBiAu9ElkoghOXJuKmqSgkydD4OXd4xU78bmQ/csghRfMxf5ptBJs
 dzLI+QasSOfZj4SaTCBxZ+Sr8ITMn1WtnxikfApjnlcNeGYjIN5yABjo0cGWRdSjKUSV85Wtkul
 p9Ha1Rc/r0pzFsflVnijgdAk1xpyBr8j5GRLY2L/uMpAf3/FcHByPXV0OESoPoUv1ceV9tWmHmM
 9xoSH/YgXNiZeasydkMHGwiuq9T/8+cwhpGz2mYGP1ptKf3jHqtSJ9uZar0uBRfH9nrtUwiYunK
 dZrQDwG+xfN7OFNRyqT0axbfANeo/Sow4Yjj2D7H6oqab2aSrqKasOv7V1WJpPyqq+dE3gV6ZZd
 t9/rn6H1qr9PrGFctqe6dGX/9m3uaxgr2szgAa1Hi7FVDP3b8YDjCDfEKvR+Qr0zkCt0+ScCchQ
 wCX1AaH9j/M2qZonYbUt64BLQsKFe8aPDnfpeUx714BvV0SuywTw8fnYICWP5PtWu4rM9CBJFEE
 Rcb+BN00it3DrGQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

When writing the exact same code the third time for Renesas, I thought
we probably need a helper.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v2:
- Fix "uninitialized symbol 'ret'"
- Reorder local variables
- Link to v1: https://lore.kernel.org/r/20250218-frame-desc-passthrough-v1-0-a32458f53714@ideasonboard.com

---
Tomi Valkeinen (3):
      media: subdev: Add v4l2_get_frame_desc_passthrough helper
      media: i2c: ds90ub953: Use v4l2_get_frame_desc_passthrough
      media: i2c: ds90ub913: Use v4l2_get_frame_desc_passthrough

 drivers/media/i2c/ds90ub913.c         | 59 +--------------------
 drivers/media/i2c/ds90ub953.c         | 61 +---------------------
 drivers/media/v4l2-core/v4l2-subdev.c | 96 +++++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 21 ++++++++
 4 files changed, 119 insertions(+), 118 deletions(-)
---
base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
change-id: 20250218-frame-desc-passthrough-66805e413974

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


