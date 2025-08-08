Return-Path: <linux-media+bounces-39101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63163B1E529
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 11:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 046911651EE
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D67E267F57;
	Fri,  8 Aug 2025 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bPBFEZpL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A352144C9;
	Fri,  8 Aug 2025 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754643598; cv=none; b=X8R7hYR3of2FDKwC0yLNqRdesQq3FxpHvbICZpQuzn4sWdHvG/JEoZOJtbAzshswaQU1UDxfBtd83dDP+l37LBIiYGbmc2KbPPopWFeuQ37z6RcEjXykFzk62QCunarTKPCq2Q9Q5B8/Wxk4j5rx/KPw3YUuaXuGeT8Kof38XHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754643598; c=relaxed/simple;
	bh=4fCWUkIynqky7/IZe7jOrYoP938ZySdZp8AKbSR4F0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qq6gQtQEDAK6osclp2PkPFaFkAYYYTHxY8e5HR33qnvq6XOoBWH6bqB4+DYHmkgTltfZl71qjLQUxmlnoW/ZO5CeatrPboicU69TabZdLTkCmKQwwslMLjmetX3sQPCZqG7if3VcxH9u53KUQwEs+QNRmntXBuh/flIqXoUnvaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bPBFEZpL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4776185B;
	Fri,  8 Aug 2025 10:59:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754643545;
	bh=4fCWUkIynqky7/IZe7jOrYoP938ZySdZp8AKbSR4F0w=;
	h=From:Date:Subject:To:Cc:From;
	b=bPBFEZpLQVUMHbT7/IV8F5QjduXs2N5/+jPslm+TrmHuAZQkXHWjAKTSgT5eJGEyH
	 XBGsTOWXr1KL7B/KZtOwB1+B/dh5ZhVO6NTY5/cOtRtHUChgYV5H1RcvTmy2eZOMEb
	 /+mZDj7MnAu22RwwSnrVm9ZgROVd3ZgKLMN8KPNo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 08 Aug 2025 11:59:15 +0300
Subject: [PATCH] media: v4l2-subdev: Fix alloc failure check in
 v4l2_subdev_call_state_try()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-fix-subdev-call-state-try-v1-1-000676e46754@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAGK8lWgC/x2MWw5AMBAAryL7bZNqPMpVxEexZRNBuiVE3F3jc
 5KZeUDIMwk0yQOeThbe1ghZmsAw23Ui5DEyaKULZZRBxxfK0Y904mCXBSXYQBj8jVTp3NmyVpU
 zEPvdU5T/d9u97wctnq6nawAAAA==
X-Change-ID: 20250808-fix-subdev-call-state-try-e724fa6907f8
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3211;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=4fCWUkIynqky7/IZe7jOrYoP938ZySdZp8AKbSR4F0w=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBolbyGy5gj2CEMIYLaIIneZPvWty7PrB6F1K1GM
 HNJf6afbkSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaJW8hgAKCRD6PaqMvJYe
 9W/nD/4jxkXAnL6VQ86cruGO8+2UpGllyKWQbhTQqGzm/SFNj6qWmNoLfXKKJPkEe/qrdqWopva
 rLF6e5p7pCQM3wsbeO/1TTNQT34Hk4Kmjiox3HSrvyonFjwo6neXk+KPDQI+LE/1O9Svl0DlARJ
 ZYwVKT4LCx+yLTvSS+2b+LHcpvsZgpyCmqfO3JS+d+9b67gFtimjEkOgzRD5bt7f4Q8ranK/Xw2
 Pd3MvnNYUjQt4Lt2TsT3aUjRgeTltIVG/xVadQQnZVyeRBnCFqMaAaYZLP0tNW2P002IGJJWFSZ
 vm5VgKK4dOwfDXQFJ0l6e442MQvfgYxVSZ29VJ+vTPm8sRgqfZlK/ZY2UxrPittFFbHJ1jG+jLO
 DImFYxolMP8Bp5C1bDNR7cwNOldrWbFbt2OjtH6PfpQDHbkhe9PIPYFdovhfc1KQ5Aj6h/pHDR4
 yVw04kh40O8WeIkEtqfRkMRE9CK+1n59XIF6FFt0japOf8g05bDqele5ygiwREQI/3ZYblDfUPO
 7g53wwSsXsO/CJ6PBWkEy+68uo3IQhrr2TyuTWqXjN8JM3VfnAUE3gktP39iArl55MdPZdQajb9
 jsvIOSjcaiKft0wWUKXs+AjDxmuK0V5GEADpoHZ2nLmQs3iGU7Eml6ikRxpgw+ECdPi4C+0t2dB
 JySqKV0nTKFyG5A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

v4l2_subdev_call_state_try() macro allocates a subdev state with
__v4l2_subdev_state_alloc(), but does not check the returned value. If
__v4l2_subdev_state_alloc fails, it returns an ERR_PTR, and that would
cause v4l2_subdev_call_state_try() to crash.

Add proper error handling to v4l2_subdev_call_state_try().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: 982c0487185b ("media: subdev: Add v4l2_subdev_call_state_try() macro")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aJTNtpDUbTz7eyJc%40stanley.mountain/
Cc: stable@vger.kernel.org
---
 include/media/v4l2-subdev.h | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 5dcf4065708f..398b57461677 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1962,19 +1962,23 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
  *
  * Note: only legacy non-MC drivers may need this macro.
  */
-#define v4l2_subdev_call_state_try(sd, o, f, args...)                 \
-	({                                                            \
-		int __result;                                         \
-		static struct lock_class_key __key;                   \
-		const char *name = KBUILD_BASENAME                    \
-			":" __stringify(__LINE__) ":state->lock";     \
-		struct v4l2_subdev_state *state =                     \
-			__v4l2_subdev_state_alloc(sd, name, &__key);  \
-		v4l2_subdev_lock_state(state);                        \
-		__result = v4l2_subdev_call(sd, o, f, state, ##args); \
-		v4l2_subdev_unlock_state(state);                      \
-		__v4l2_subdev_state_free(state);                      \
-		__result;                                             \
+#define v4l2_subdev_call_state_try(sd, o, f, args...)                         \
+	({                                                                    \
+		int __result;                                                 \
+		static struct lock_class_key __key;                           \
+		const char *name = KBUILD_BASENAME                            \
+			":" __stringify(__LINE__) ":state->lock";             \
+		struct v4l2_subdev_state *state =                             \
+			__v4l2_subdev_state_alloc(sd, name, &__key);          \
+		if (IS_ERR(state)) {                                          \
+			__result = PTR_ERR(state);                            \
+		} else {                                                      \
+			v4l2_subdev_lock_state(state);                        \
+			__result = v4l2_subdev_call(sd, o, f, state, ##args); \
+			v4l2_subdev_unlock_state(state);                      \
+			__v4l2_subdev_state_free(state);                      \
+		}                                                             \
+		__result;                                                     \
 	})
 
 /**

---
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
change-id: 20250808-fix-subdev-call-state-try-e724fa6907f8

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


