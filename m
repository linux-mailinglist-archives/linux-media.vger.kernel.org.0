Return-Path: <linux-media+bounces-14037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F679146C4
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83FE51C2240C
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F0F1339A4;
	Mon, 24 Jun 2024 09:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1VBP7OM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9A013248E
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222955; cv=none; b=IFLi63+umB2q6Y7d3Ynv0zCaCzERn89x4/y9gaB11vlhx7f4kaj38F/9wKw4nvl8sySXBycCdjsIapmUFlYlHvbmLor0Eip2NW7Paq//uME9H8nlrqt8OYLSxBtC5XQOnRIQ4ZcWgNvSri/IV66RO/lNx4eynzqbCrZrcbLGqs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222955; c=relaxed/simple;
	bh=FJMHlIcGPE6yU14Apfn5AmKH0FSzCEBzXYJ3Ya0nAj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sYME6QpQqSXjM1i9iiu7lCUhl+MoJDy9k1oEyJpZADogu9cdyr5hyx8lW1dQRizXaK29q9+HOqRPb4Y18K5qsjRrk2tc9GYOIoo/a9Uhw4ZlROji+9UeV8I9upw9y/C+SM5GMAjj7PoCZ8VIxmoXRqvsf94fGOEMEsUHJ1JVo/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1VBP7OM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4230366ad7bso45209145e9.1
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 02:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719222952; x=1719827752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWSZpdRr8ss4XLyazOufDG/vY72XV8sVtx2q8BwJKKk=;
        b=G1VBP7OMwVOXsBvjqLGpB82T8zReUF+XOGwBv8SQGv1nvudyt6QIVZVvNA/ZXavuVx
         X107fAcTk0EvSmqju5WK1fc0VGiwNZSAovC3rIcztg/Uka0pjUZlngEJUoVKqIdMPGnb
         LxXEqS6kuXUoZnbGzS4TEFIBhhF68hUuqIdlXRZG+bjjWoc4Jo1Acaur9a5zBMii24yQ
         XdMgG13MMb4OrNeXHs2rus2d+N2WElKNJvZ/GMJcKBHnGtu+bvmQ0Vw/zw/ge9X5XEaa
         tRMwSJuS5N1FpyZwyWbTbXWshgIYQxAyH3SNGakV2yBb2nK1nWJStOsqKL5OBnDtioSV
         REJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222952; x=1719827752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWSZpdRr8ss4XLyazOufDG/vY72XV8sVtx2q8BwJKKk=;
        b=vuoFOFAJNLlCiSMRGdRg+Zw7EaSII3fk7z6bDUFf7bzrfpqsCy5sBdcaNj3x24DkBC
         TQ6icjMavH8JEg3EpODDDoJN48fKCygwpWyPg21warL+oDRPuaSiwUR8xz5stpmB0uE/
         k61je5IA1yiCSJpogppWo8IrPPMgc+t88iCmz6MZnES8jt8WpX7aSI0UDl+t5wfaMIfk
         XsixG/pEvFxCtDhDOF4GcxbI2vBkAI7he8HOQgRJ1qQzg066hxlHA8aNa0B5XD/frezB
         0aA/7nFNN+kXUzPTkEWyCecC/Av/bwBngbRBAkLDKsCcnwKtQ2/4JtbHZV0NQ26YcCfe
         Xxlg==
X-Gm-Message-State: AOJu0YzRCeAa3JNH7FCSoUMelbdP2y51QTYS6El+SE/95OsFrmOwsP/k
	1JJq+pLyxPYeOWWYE/jCYGHC7KVaXN9PRS3wYj6N1ksjY6WcOhfrQ7A5DiA=
X-Google-Smtp-Source: AGHT+IHXUjt9Y5vlhETtbvvTRlRHKEPz55bQup5bs9zUkv2VppJJ2Rb7Zb+OUOTf8pMoWmlbYnmLAg==
X-Received: by 2002:a05:600c:791:b0:422:683b:df31 with SMTP id 5b1f17b1804b1-4248cc1792emr34071925e9.7.1719222952116;
        Mon, 24 Jun 2024 02:55:52 -0700 (PDT)
Received: from localhost.localdomain ([105.163.2.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm128258475e9.24.2024.06.24.02.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:55:51 -0700 (PDT)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: anonolitunya@gmail.com,
	jaffe1@gmail.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 05/10] media: vivid: vidioc_g_edid: do not change the original input EDID
Date: Mon, 24 Jun 2024 12:52:58 +0300
Message-Id: <20240624095300.745567-6-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624095300.745567-1-anonolitunya@gmail.com>
References: <20240624095300.745567-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Returning an EDID for a connected output would modify the original
input EDID with the physical address of the output. That causes
problems, and it should just update the physical address of the
output EDID.

Update vivid_hdmi_edid to set the physical address to 0.0.0.0.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-core.c |  4 ++--
 .../test-drivers/vivid/vivid-vid-common.c     | 22 +++++++++++++++++--
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 0273bc9863b0..4a9d9b30aa42 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -218,7 +218,7 @@ static const u8 vivid_hdmi_edid[256] = {
 	0x5e, 0x5d, 0x10, 0x1f, 0x04, 0x13, 0x22, 0x21,
 	0x20, 0x05, 0x14, 0x02, 0x11, 0x01, 0x23, 0x09,
 	0x07, 0x07, 0x83, 0x01, 0x00, 0x00, 0x6d, 0x03,
-	0x0c, 0x00, 0x10, 0x00, 0x00, 0x3c, 0x21, 0x00,
+	0x0c, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x21, 0x00,
 	0x60, 0x01, 0x02, 0x03, 0x67, 0xd8, 0x5d, 0xc4,
 	0x01, 0x78, 0x00, 0x00, 0xe2, 0x00, 0xca, 0xe3,
 	0x05, 0x00, 0x00, 0xe3, 0x06, 0x01, 0x00, 0x4d,
@@ -229,7 +229,7 @@ static const u8 vivid_hdmi_edid[256] = {
 	0x00, 0x00, 0x1a, 0x1a, 0x1d, 0x00, 0x80, 0x51,
 	0xd0, 0x1c, 0x20, 0x40, 0x80, 0x35, 0x00, 0xc0,
 	0x1c, 0x32, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x82,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x92,
 };
 
 static int vidioc_querycap(struct file *file, void  *priv,
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
index 38d788b5cf19..a3e8eb90f11b 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
@@ -1038,6 +1038,7 @@ int vidioc_g_edid(struct file *file, void *_fh,
 	struct vivid_dev *dev = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
 	struct cec_adapter *adap;
+	unsigned int loc;
 
 	memset(edid->reserved, 0, sizeof(edid->reserved));
 	if (vdev->vfl_dir == VFL_DIR_RX) {
@@ -1068,8 +1069,25 @@ int vidioc_g_edid(struct file *file, void *_fh,
 		return -EINVAL;
 	if (edid->blocks > dev->edid_blocks - edid->start_block)
 		edid->blocks = dev->edid_blocks - edid->start_block;
-	if (adap)
-		v4l2_set_edid_phys_addr(dev->edid, dev->edid_blocks * 128, adap->phys_addr);
+
 	memcpy(edid->edid, dev->edid + edid->start_block * 128, edid->blocks * 128);
+
+	loc = cec_get_edid_spa_location(dev->edid, dev->edid_blocks * 128);
+	if (vdev->vfl_dir == VFL_DIR_TX && adap && loc &&
+	    loc >= edid->start_block * 128 &&
+	    loc < (edid->start_block + edid->blocks) * 128) {
+		unsigned int i;
+		u8 sum = 0;
+
+		loc -= edid->start_block * 128;
+		edid->edid[loc] = adap->phys_addr >> 8;
+		edid->edid[loc + 1] = adap->phys_addr & 0xff;
+		loc &= ~0x7f;
+
+		/* update the checksum */
+		for (i = loc; i < loc + 127; i++)
+			sum += edid->edid[i];
+		edid->edid[i] = 256 - sum;
+	}
 	return 0;
 }
-- 
2.34.1


