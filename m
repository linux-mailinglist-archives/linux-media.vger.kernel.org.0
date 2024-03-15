Return-Path: <linux-media+bounces-7102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A683E87C92F
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 08:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67D8B283067
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 07:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572D913FE7;
	Fri, 15 Mar 2024 07:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJSnDJ2d"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB20414F62
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 07:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710487782; cv=none; b=J1OU8fppJ1uSoic0hnN0qpCPYQlT7eIzXh69DqRk+oYKjQYDJwo1781VowNQYrExLeWIQ44PnFV0xB29wdjYQP5KJxjKBCW+Cs+BgQEGYB37zFiu6jGNJxk0lYXsd+xoBuC/twidZ2QDK/9uCPZxKXb8RaUapEumQ/Wuv6LdLMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710487782; c=relaxed/simple;
	bh=pvIasN9dIK5VGQVkJ3IkNo3B7LZiedwuiztp6g/pv2M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sXaGw/A7AdN6zIa0NABiQ9kunFnUTMvYDN+2eSWLrD+fcF6JQy/AHN7xFaBVbnoSnYevQOyctvi+q92ioCqC313D55dZKQph/F3sne1v/11yrqVX+OLU8+tJCnPldbDJSOmEV7rApkafuWhhvS1p1ULjXy91aSOgsxCogV28+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJSnDJ2d; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710487781; x=1742023781;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pvIasN9dIK5VGQVkJ3IkNo3B7LZiedwuiztp6g/pv2M=;
  b=lJSnDJ2dLXU6gtuLZ8AZZrPOPa1IIYncJ5TNzowidjeNP85I2BGAPD6p
   WcgwZDob2GUCKtJSEyJW0NqylAwNKB0DuTZE4pkcQzWz05uYv76ccOSeK
   D1YCBUBEttJlvsFKDBHRwrUBUCcHYdebPGbdBzQ2RCDTEnYXnJc51W0df
   ffZ38ajg0ssaCffS+LS/Hs4pN+qRG/S5x/HlKY/MOxLlx71WbltyL2LfK
   Fo8W1r5chIddjftCiwVSonQjdvjpjKQAk5+a2gHHewpp+BnIx7A//1dcB
   6jdNTLDh5HU59QvAVxRFA0I3bmLR4tgoJI4yidgZp0bee/hnRbIaSUoCI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5945573"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5945573"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 00:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12498602"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 00:29:39 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3CC7A11F819;
	Fri, 15 Mar 2024 09:29:36 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl
Subject: [PATCH 0/2] Set sub-device owner field 
Date: Fri, 15 Mar 2024 09:29:31 +0200
Message-Id: <20240315072935.275458-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This set makes v4l2_device_register_subdev() and
v4l2_async_register_subdev() macros and prefixes the similarly named
functions with "__". The macro is used to obtain THIS_MODULE pointer that
is then passed to the function, in order to set the owner field of the
sub-device.

Drivers often miss this and one could ask why should the drivers do this
on their own. So instead do it consistently for all callers.

Sakari Ailus (2):
  media: v4l: Set sub-device's owner field to the caller's module
  media: v4l: async: Set owner for async sub-devices

 drivers/media/v4l2-core/v4l2-async.c  | 10 +++++++---
 drivers/media/v4l2-core/v4l2-device.c | 12 +++++++-----
 drivers/media/v4l2-core/v4l2-i2c.c    |  2 +-
 drivers/media/v4l2-core/v4l2-spi.c    |  2 +-
 include/media/v4l2-async.h            |  4 +++-
 include/media/v4l2-device.h           |  7 +++++--
 6 files changed, 24 insertions(+), 13 deletions(-)

-- 
2.39.2


