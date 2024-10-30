Return-Path: <linux-media+bounces-20608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A829B6DD1
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 21:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3327A1C21946
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 20:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFB41FAC2A;
	Wed, 30 Oct 2024 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gKQVKjAS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EDA1DE3BD
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730320660; cv=none; b=PfM16qsKIfQ7AOPcaxAsPYcpRoXUqM46/W78UNTtUqWWw54X4zEsl7B5kVXTFhqvxBj7rFBwotAprsyXU2Ie4yNxnv27n7uKzTYsHYo3pzF3B3WN4D8ENrXrXjaElFZNRzD6BH6EEbN5fT4yP/87nskXIvroZzsrboTlYCzD6Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730320660; c=relaxed/simple;
	bh=XD7v9QdNIGJTsmJsMMGYVH95GAma23zf2G+bMsSKeu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=idFZxOaXlYpzJ7X7l6pFuCXyri63L8j5L0j42DS3V3zvYL7Puw3nsoQxsYECEdAa7cvGPrA1Wxl7QcOPe5Mt1hZh6nYD1DDkVYLgAkj4zJYS405cAPbwc4NCDH4aoNiHJB7P00DROUz8cxdrsx0VCtSgy8lB/sRaQhWZm5rv4XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gKQVKjAS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4806BB7E;
	Wed, 30 Oct 2024 21:37:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730320653;
	bh=XD7v9QdNIGJTsmJsMMGYVH95GAma23zf2G+bMsSKeu8=;
	h=From:To:Cc:Subject:Date:From;
	b=gKQVKjASg/lQp5Tz4kJMQ4w//YR/ylp8sMvX6XeaG1DMr8zGQrcgXNp0NyqoGZaxY
	 UFlQRHS1EU4q14HNhX+2j/hM/ez3emp9ZyDS+IL6IIM+UAm2o7BDrrL8Pny44HKxiX
	 Q3KLx6Byxwdyv/zoyvYww6qcaSVCkPSV23hX7yfs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [PATCH] [v4l-utils] meson: Bump minimum meson version
Date: Wed, 30 Oct 2024 22:37:30 +0200
Message-ID: <20241030203730.28241-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l-utils sets the minimum meson version to 0.57, but uses features of
newer versions:

WARNING: Project specifies a minimum meson_version '>= 0.57' but uses features which were added in newer versions:
 * 0.58.0: {'add_devenv'}
 * 0.59.0: {'dep 'intl' custom lookup'}
 * 0.60.0: {'list.<plus>'}

All stable versions of major Linux distributions ship a version newer
than 0.60, so we can safely bump the minimum requirements.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index ce6db73c7014..a8843c8fd025 100644
--- a/meson.build
+++ b/meson.build
@@ -1,6 +1,6 @@
 project('v4l-utils', 'c', 'cpp',
     version: '1.29.0',
-    meson_version : '>= 0.57',
+    meson_version : '>= 0.60',
     default_options : [
         'buildtype=debugoptimized',
         'warning_level=1',

base-commit: b79e00a74fde35d0c0bb801b78b15664d3f10309
-- 
Regards,

Laurent Pinchart


