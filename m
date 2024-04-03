Return-Path: <linux-media+bounces-8594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED48F897BFB
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 01:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9143289E57
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 23:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5029E15699A;
	Wed,  3 Apr 2024 23:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gdFysprh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3225315666F
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 23:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712186680; cv=none; b=I/oob0zGhQKK5/lhF8mJwPT5COc3XnysDjsrUnwIbGFPEbXidtOskBGgOkXCgscGGXmy9u6aHu+kLS5PyNa4hxg6iVDyUYifGqbIOqBrMv2Xj+XmjL3LpbbOSKoNn0rbTwARRGSDV+Po2+j5dd2KcKzosCd2YFvZaSuhCRes03k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712186680; c=relaxed/simple;
	bh=fcdDyd5tphJmJdQ0pY6OF5CDcRILwtP6+ZpUNgm5BB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3AzbEsznCb4b/IMKBjoFTxG3AP2mQ+nitc9/LG5KSlJHRrs/5KDhye0rGZUt+ZXmJEywEtXDNrU2Trpfu4OSglJTLya1zmYeMmI/jp/CEm1NsfN72ad7qgEvVh0em7SW+mJNQfoQeU0TlC3kXcTuZIgvG64M02TzfkiQvtDJUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gdFysprh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE52C8E1;
	Thu,  4 Apr 2024 01:23:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712186640;
	bh=fcdDyd5tphJmJdQ0pY6OF5CDcRILwtP6+ZpUNgm5BB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gdFysprhZKgkAmrT5+iuaT8akCN/DYj4pbPctqNgjwfRWD03QWON95wDgeleSKE6G
	 w599UZafaHEy7NVFay5thrKvLMVjlD6ckmLucFOOrEoB47pzIUOsS3nCbMudtUGJeF
	 4iNfg8b7arNE6cwfNbsukZ9njNQiwfO3xgoZHG/U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH 1/2] utils: libv4l2subdev: Drop stream support for the crop API
Date: Thu,  4 Apr 2024 02:24:24 +0300
Message-ID: <20240403232425.22304-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403232425.22304-1-laurent.pinchart@ideasonboard.com>
References: <20240403232425.22304-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev crop API has never had working streams support in the kernel.
The stream field of the v4l2_subdev_crop structure will be removed,
prepare for that by not setting it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/media-ctl/libv4l2subdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
index c614f4a2e0fd..b9d33fb301f0 100644
--- a/utils/media-ctl/libv4l2subdev.c
+++ b/utils/media-ctl/libv4l2subdev.c
@@ -226,7 +226,6 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
 
 	memset(&u.crop, 0, sizeof(u.crop));
 	u.crop.pad = pad;
-	u.crop.stream = stream;
 	u.crop.which = which;
 	u.crop.rect = *rect;
 
-- 
Regards,

Laurent Pinchart


