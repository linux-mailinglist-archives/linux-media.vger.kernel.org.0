Return-Path: <linux-media+bounces-38873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B3B1AA6E
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 23:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 783C6621A25
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 21:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BC123AB8F;
	Mon,  4 Aug 2025 21:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ri4QNRJv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F399419C556
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754343704; cv=none; b=iEItAuFfJdjxQohyvPqNu4ekSfsfbPaBlrV7qup5u51Rb5Gxp0Apv4oLAGmyZ7WY0Li11adXZMiIftmm5a8pphKbkMT1eg8waKuga1v3vHRjFDed0Fpzdpt030lJawdqCQ5u0Tr5OAs2IeBuZoy6dKo21BDTR9foDmERqYvyy0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754343704; c=relaxed/simple;
	bh=PL7lo66XcnyBq2LGXtKUbohMx3PW5Q3nHhtN8novHSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XvhO3uAfjaOHJvxMdMZO6zNrTanrk6GbGOuoc9cQPyYGFdMLiOOgsyR9eZ0MQXEqyJhl0KVhqBgoWKLlg9A5qBBDAs040KIEuJGdR0Pd/OYEzndJGBjwFny98TpVh7Qsr3sVRC/r0OJNC9Zb5QgkoN77vbhU0eW7DS1jLZnRpjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ri4QNRJv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 464F89CE;
	Mon,  4 Aug 2025 23:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754343654;
	bh=PL7lo66XcnyBq2LGXtKUbohMx3PW5Q3nHhtN8novHSQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Ri4QNRJveQwgzulfm7AYlUXQoEgIrf+wcCOyhjBkvuAQQ2sY31fjbXitR+IYAiqFd
	 Xq2IwPl8UtII/QfzvceDI8btMP6PxZY6MiSZklnZ2WfW7lYN/dcd6sXN6V42e3uYPk
	 AL4JOZulMzBSMRl10Lalnkd5/DgBzTv4aQWZMbSM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/2] media: intel: Fix control event subscription in IPU6 and IPU7 ISYS drivers
Date: Tue,  5 Aug 2025 00:41:25 +0300
Message-ID: <20250804214127.22217-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series fixes incorrect usage of control helpers meant
for video devices in the IPU6 and IPU7 ISYS drivers. Please see
individual patches for details.

Laurent Pinchart (2):
  media: ipu6: isys: Use v4l2_ctrl_subdev_subscribe_event()
  media: staging/ipu7: Use v4l2_ctrl_subdev_subscribe_event()

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 2 +-
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
-- 
Regards,

Laurent Pinchart


