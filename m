Return-Path: <linux-media+bounces-5496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D07E85BCCC
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 14:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F12891F21799
	for <lists+linux-media@lfdr.de>; Tue, 20 Feb 2024 13:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20EB69E18;
	Tue, 20 Feb 2024 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SB1w4GR8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B850F69E03
	for <linux-media@vger.kernel.org>; Tue, 20 Feb 2024 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708434226; cv=none; b=Gp6NmYgOYX5VV0pYxGuAJkLaDo104w1xgqnfdcqP3X5/Y0EmSDeLNlv8kI1STpAl4No/phH7U9CwYix45l111qavWKi7wx535DcoYQsBVOrMF1dZnG/7pUN1lrSYG3ZZkImmtRhWSPr5AanfOyzPxuHz/5O+zA2XLbJm7QnTiuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708434226; c=relaxed/simple;
	bh=DGWO9ji9ZZDshiitQLLbTa/AKHx3rz5meLcTAlOkBcs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QOoAKeNbOQjlqvy42pUz+LCHHbwo4iu9DeQJyCOqZysTOMItmHdOr49aeB/sUjh/8yJhoN/MzHR7T7+dvezNsMoWREoLSV/f9IGTuICyzRizLulRPLmF7yEfKt3rkM6IE+N9wDMdW791ySeCNxPbuXhFYAaAYhJbM12bk8t7x3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SB1w4GR8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708434225; x=1739970225;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DGWO9ji9ZZDshiitQLLbTa/AKHx3rz5meLcTAlOkBcs=;
  b=SB1w4GR8T66RwT+M/1vIRtdWTLixBoy+MjUK9xDJMssYn9gxYj5ZeVLZ
   xwYtBG4EDZtxHhroTWM5EfcMtlGB4idv876alwk34ctBo9lYg63QVeJnh
   5Lvih5N71nopn9RWtjOv97UhYoO4npmxnddlZcuPz/iHmLhO3o5/7qU3i
   wPEblGfHBju2pZ7EkHI5/dXC5kf0zO/9jguHbnRkQKv8r0WSBb9cAhXXD
   Rsyp7g4GsK6yV+EegETwsgPwkz6qct9OSGxjRI6ad2TqbGqoqOW1iGWar
   b/fyEd5/YualQuKpfpdm3p1TIRj4oXga9NCG7P2yqckZld+OUvn52u1Se
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13158157"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="13158157"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 05:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="827157818"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="827157818"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 05:03:42 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C168911F8B1;
	Tue, 20 Feb 2024 15:03:39 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH 0/3] Use INTEGER64 type for MEI CSI LINK_FREQ control
Date: Tue, 20 Feb 2024 15:03:36 +0200
Message-Id: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

An integer menu isn't a useful control type for conveying the frequency
depending on an external device to the receiver. Instead, in the MEI CSI
driver, just obtain the link frequency from the upsteam sub-device and
pass it on to the receiver.

The v4l2_get_link_freq() is changed to add support for this and it's
documented as well.

Sakari Ailus (3):
  media: v4l: Support obtaining link frequency from INTEGER64 controls
  media: Documentation: v4l: LINK_FREQ can be an INTEGER64 control
  media: ivsc: csi: Fix link frequency control behaviour

 .../media/v4l/ext-ctrls-image-process.rst     |  2 +-
 drivers/media/pci/intel/ivsc/mei_csi.c        | 30 +++++++++----------
 drivers/media/v4l2-core/v4l2-common.c         |  3 ++
 3 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.39.2


