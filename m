Return-Path: <linux-media+bounces-13252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C624F908593
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 10:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D905E1C21E8E
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 08:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1845818308F;
	Fri, 14 Jun 2024 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="I6HBGleQ"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82751474CB
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 08:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718352072; cv=pass; b=svfmqBhhgf7uGos1U2xl6omp27vriuIqiIa7myCqUAZJzKkkEYhcib+NKNwbODKGRoaek/+aoxv+obTzUEe3OrdtgKFjJWNLOYRnZgPYwM1GwL/bR0nDG5wcbSwQk9Bj13h5sJ4QxsgpkEBhQt5BqKxRZTPswzx3GCXGOOm7gwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718352072; c=relaxed/simple;
	bh=GPHZ2FsZmy9GhwVQI/tYYA80MnwQj8ClhSEWqZW3tH8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UiC+ihBxTIIlP59COlbdATVyFqFz6huwxF+RBJjYXBcPD1+tB7WxfizUVE2fFKt3GcG/cZcUc+30j25vyHQ2KhGs9CbnkFF1s7Lp6LBce5qxQuquiRYo7D9k/zcvES0b9APgvSOC8UJrcVgFU+nYb6bAFjRhD9cjbpHaVJDH+2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=I6HBGleQ; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4W0sCx3p6HzyNX
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 11:01:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1718352061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Fpr5bigNROFihx/b0EiK00zKED/j8rkmdT9MqVyrJdc=;
	b=I6HBGleQ/3Bl8+dk1QRG8b9PBnruq+eYVB5nkMQYy3NIq0siVzxfPFY1QUmrWDUK1R1Y6s
	szSkGN01E9VDEg7o3R0/YoWYmd/QbqtktZx58hb8Bze6eSww4lBpeAoLlwwK+aVavwj1Dv
	D4cQK5Lt5l/8/hqjuUZRiy87RU/740g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1718352061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Fpr5bigNROFihx/b0EiK00zKED/j8rkmdT9MqVyrJdc=;
	b=JbDuvj8FTELnbOvTwaY8h8Y7jkXJ94uR0i4t3Rh6IdcMmEPa5AxgCEKrVqc7E5XF0apdxW
	F6PHwxdOCD6sgAnfodcZm7cKHVXoLgIzZ8vCYQdSSIHO9+RqJlMTayppQgwCVu9wSb7gHG
	6LsfYdITepWwYYSy/mQ4ruBGvGaWIOs=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1718352061; a=rsa-sha256; cv=none;
	b=TZ1ILlfgmIMwkeIz7celU55ssH/wPRmidJtclc3Es2VFGwiPiYUGLGSGe9IWJBEQVqNpTg
	TfuEMmQ6DF6PwtZRGInV6fkKP+gNTk5nIhLPQf570OzCuffVrfzgGJ24Cts/gxcEcCR3yZ
	EzCrum+Gwm8bQv/2TWcSKjLSDad9Kd0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0D40B634C93
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 11:01:00 +0300 (EEST)
Date: Fri, 14 Jun 2024 08:00:59 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 6.10] IPU6, IVSC fixes
Message-ID: <Zmv4u_HQ4Kr2yU6H@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are a few IVSC and IPU6 fixes for 6.10.

Please pull.


The following changes since commit ffb9072bce200a4d004006e8b40c366933cf517b:

  media: intel/ipu6: add csi2 port sanity check in notifier bound (2024-05-30 16:34:59 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.10-5-signed

for you to fetch changes up to f510fde80fdc22a36cf225bc7d7c2be717fad6a8:

  media: ivsc: Depend on IPU_BRIDGE or not IPU_BRIDGE (2024-06-14 10:36:13 +0300)

----------------------------------------------------------------
IPU6 fixes for 6.10

----------------------------------------------------------------
Hao Ge (1):
      media: intel/ipu6: Fix a null pointer dereference in ipu6_isys_query_stream_by_source

Sakari Ailus (2):
      media: ipu6: Use the ISYS auxdev device as the V4L2 device's device
      media: ivsc: Depend on IPU_BRIDGE or not IPU_BRIDGE

 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 2 +-
 drivers/media/pci/intel/ivsc/Kconfig           | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

-- 
Sakari Ailus

