Return-Path: <linux-media+bounces-36815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF6CAF8EB6
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3AF7B43A8B
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A106D2BEC23;
	Fri,  4 Jul 2025 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oF7O1PlM"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA08289826;
	Fri,  4 Jul 2025 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621315; cv=none; b=G2WzpChEIHtlo51qovAjHduaNW0r+3/L6hTlDKmago3T0iWUPlwHRhHMNbPtnmAyIcJGj6pwOdG0F9d2Gn7bv/26PS2/QUZ4TC+0tlYzCUyraCy6qE8KQ0nT3elOPWO8Fjpm2Ml9wzaoYATarjTR32zn0y7aur+QKLEOSZvm7R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621315; c=relaxed/simple;
	bh=AAEwlVRpG55UkIPZdG8kFZgt/NwdaZPjlhlHpqhnu2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cShk+X8YhlmrAb8JLcNnjYBEnGfOpGStDzJtg9xJUqqJz00Jn4FWfC4uNPWG/dMnODnYgPRD819fyKfpt4b+eAtirzpVbTgPgSWBySntiuzycjQyYA0fNvAvTV8tNhHi1fxKbVOMaZiR30cPIisTCsbqRYQCTfRP0djdzxY4XeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oF7O1PlM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751621305;
	bh=AAEwlVRpG55UkIPZdG8kFZgt/NwdaZPjlhlHpqhnu2Y=;
	h=From:Date:Subject:To:Cc:From;
	b=oF7O1PlMiM+ZoGkG+os205LerUhn7NCE21+gJdQRCF+ipw2hgs/wAKkbkxgA6dP9D
	 vGH70rfCDHUakW217J9z4IfQTQbLYqk6rk1rCd8evNJP9Noj4e0ERbcQUzRVRE9KI1
	 MU3DHqb+RYYKqJ/PDEDk7qDugtotNTv3uj2uKt7/SFf9G9i1s9VlHvbJ/nplSy4fsH
	 5jymeFeLWCtDS2PitVknyVbJG9ShBRAw2KXOGRA+TszmfVyvTCn5Rid+60L0Thkumx
	 0GYcXdnT8WGIXsQzPIX9vdcecmnsK4rXoRZAlgfKAXPePujoqAGJwery3h14/AAFwJ
	 3fsZFc85dJ6xw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8F85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4FC517E07C9;
	Fri,  4 Jul 2025 11:28:24 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 04 Jul 2025 11:28:24 +0200
Subject: [PATCH] media: i2c: vgxy61: Report stream using frame descriptors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-vgxy61-frame-desc-v1-1-0e62b9c4e260@collabora.com>
X-B4-Tracking: v=1; b=H4sIALeeZ2gC/x3MTQqAIBBA4avErBswK4OuEi0mnWoW/aAgRnj3p
 OW3eO+FwF44wFi94DlKkOssaOoK7E7nxiiuGLTSvRpUh3FLj2lw9XQwOg4WNRnXWmNp6Voo3e1
 5lfQ/pznnD7+bnFNjAAAA
X-Change-ID: 20250704-vgxy61-frame-desc-2a6d3c6cab43
To: kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

Add support for .get_frame_desc() to report CSI-2 virtual channel
and data type information. This allows CSI-2 receivers to properly
interpret the stream without inferring the data type from the pixel
format.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/i2c/vgxy61.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
index 5b0479f3a3c0592be430cefe5a1ab9a76812ba84..44d6c8d8fbf8d6182e42d44e129bc45945ee0da5 100644
--- a/drivers/media/i2c/vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -1181,6 +1181,21 @@ static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static int vgxy61_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+	fd->entry[0].pixelcode = sensor->fmt.code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = get_data_type_by_code(sensor->fmt.code);
+
+	return 0;
+}
+
 static int vgxy61_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_state *sd_state,
 			  struct v4l2_subdev_format *format)
@@ -1402,6 +1417,7 @@ static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
 	.set_fmt = vgxy61_set_fmt,
 	.get_selection = vgxy61_get_selection,
 	.enum_frame_size = vgxy61_enum_frame_size,
+	.get_frame_desc = vgxy61_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops vgxy61_subdev_ops = {

---
base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
change-id: 20250704-vgxy61-frame-desc-2a6d3c6cab43

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


