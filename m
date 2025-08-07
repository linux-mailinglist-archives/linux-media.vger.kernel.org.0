Return-Path: <linux-media+bounces-39072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34157B1DDA1
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 21:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BBE67AA287
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 19:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBB522DFA4;
	Thu,  7 Aug 2025 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X6HfJndc"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA2320A5EC;
	Thu,  7 Aug 2025 19:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754595826; cv=none; b=P9bWhDWv1+NjxKsw3OKlzuJsT3nqzA0bCE6LvOmq2Z4Gv17JDG2gR7xrgH3ha0b2DWPRHXrQTx/jn1DoHMhxbdpM2K0B0uhi30e1/QVxEatjJbOs0+Dm1SQJ288DqCj6iT3Mla2/fBtLSTy1X6JzRmj52AkAL03PtI7bSeoUFDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754595826; c=relaxed/simple;
	bh=ZRIzuEh4ff2QtBc07LdqKUp7iG373pjthqroU94ucJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tkKHlVjCpXpyK3HzLIFv3uytZnCt6DG1JYk3Wd8TLbuCN703Wdl3HtrqQyYEBzkcc8+g0q3tw+x1NgyjdRVrpWo4blOdKyscAHuJfQRpRFppQ3Z3qxMEE6+8M/5o8taRdXoSl4MtqvVlvBdXYpyGURg+CG27Jbe9HHwBjAygkcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X6HfJndc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754595814;
	bh=ZRIzuEh4ff2QtBc07LdqKUp7iG373pjthqroU94ucJ8=;
	h=From:To:Cc:Subject:Date:From;
	b=X6HfJndcDMBBECWzqaVrFOLcIIhy9Tju29bNFklNHhl2Np2Y6W00Ux9pASm4/4rmU
	 JF5E6YTfmmLVWT71rqTVxA9QlnLTE5sd1ydxZLtSoPUZNYcHkF+A3W1gGIQYq6RanQ
	 9lBFEYsNlzLm+om97986f4XaHnLgsSaoX69B5KxydKRpXS0Vs7Ihal2xKj9o5ngm2U
	 DBX5sFRKqvIq/UWdC/IDJJAqbYxXe4Jq84PR9GInVbAMxjh7SLKXeT/xV/x5BXlF5m
	 rmUXU6WVEfS9dls59o89UoT9A+WAIGYyViI+9oKyN7wa86j7v5os2JgMGtU2RmPtnn
	 olUIUQrFW0yQQ==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E633917E10C5;
	Thu,  7 Aug 2025 21:43:32 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 0/2] media: Add HEVC long and short term ref pic sets controls
Date: Thu,  7 Aug 2025 15:43:25 -0400
Message-ID: <20250807194327.69900-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New v4l2 controls for HEVC are added to be able to send the missing long
and short term RPS information to the driver.

Both controls have a dynamic size to send up to 65 sets each.

The controls take raw data as they are read from the video stream.

Changes since v2:
 - Fix long lines
 - Add videodev2.h.rst.exceptions entries
 - Add v1 changes

Changes since v1:
 - Separate long and short term in different controls
 - Use raw data to let drivers format the data how they want
 - doc: Add array information

Detlev Casanova (2):
  media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
  media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps controls

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 114 ++++++++++++++++++
 .../media/v4l/vidioc-queryctrl.rst            |  12 ++
 .../media/videodev2.h.rst.exceptions          |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  18 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  10 ++
 include/uapi/linux/v4l2-controls.h            |  61 ++++++++++
 include/uapi/linux/videodev2.h                |   2 +
 7 files changed, 219 insertions(+)

-- 
2.50.1


