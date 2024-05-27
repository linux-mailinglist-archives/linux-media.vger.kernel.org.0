Return-Path: <linux-media+bounces-11933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B697A8D012A
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 505E1B26FE9
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9473215ECDE;
	Mon, 27 May 2024 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="igG8vcb8"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C59015E5DD
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716815938; cv=pass; b=Ez1K2X66TdXPEPAWyo8oNRk9olctHhybefxA6T6wsdRVL1Itla7eM2Ib1caH3gTDHCJliSEzJBcDZr1BvMR3gUvlYvZQ2WVZHI11vH6cUOyce0BGl4sDzS+ikljMOnv5HFinwlMJF6IeDD9U/k1sXr9xIdNstDAedpDIYb4D/Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716815938; c=relaxed/simple;
	bh=v15NeTliAoLr5OslziWIMFLUM10ElCAKYNSJRy2DYgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cGpZyMcVMWXxPndFzeIXEGw/AFoQfQnzP6NRdqXWCm02q/B3AFDAcKBJXlmnRqKUGO/N6YBFdXukzAgpj8bJNFNKakcbKclFxfTCrnp3Q3RBNTziw7pxrCFhRbaA+f6jv9et5HczeB58w4jM9+LyIgKUlcuRx19wXhCc64mUZFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=igG8vcb8; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Vnx715bTJzyQm;
	Mon, 27 May 2024 16:18:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716815933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=nXfouacDrevptuT1xzOqhFGhubf86bItGrNGDGb5cLY=;
	b=igG8vcb8aGnUH4ie+xG8XevkCgqVc/Ygg1mKa5Gws2rRjJjRJda8cCU3V70rHJmf+lGEAR
	tfgKR1dvwiQFpLP8pa3ZmgI2KG8dEEKFHLR3ppKNbYOUowZ5DQPMTAQZ+Hwv48yH7cv4yx
	gZ4t03s6CRBYaBpSN/UZG1Z3mGpP5fk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716815933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=nXfouacDrevptuT1xzOqhFGhubf86bItGrNGDGb5cLY=;
	b=u1/1X1qq5XDt2qEkQxV64fDhhGZAXPdJWRWbffffOseouct+Jr68dCBL9geh7CH5uFOxwz
	KH8HqEI71COnyw2MgPUO/EvyXm0fGp0re0xv0AE2eq/udxJ/Usr25QeN6jg5oTZi/29CoO
	k8F1hhag7lSHptMWe2zs9BHdhX3GflE=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716815933; a=rsa-sha256; cv=none;
	b=KuE2SANEyjjKdfdXfQSFHoSSebk637TAeIwWfOSjcFzJ9ahbNczVmFC18iahqplOFO1xKe
	4IF2kGuNYn4m5Vtcean2Feh4ebCCMNE5edQrTZV51buklQ8yq9cgngBfezP1A9t5ePPNQp
	NP/9JLufjNlDPtcn2NYfYjK4fLSRcmM=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 930B0634C93;
	Mon, 27 May 2024 16:15:57 +0300 (EEST)
Date: Mon, 27 May 2024 13:15:57 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR 6.10] Streams and IPU6 fixes
Message-ID: <ZlSHjWepKUfC9Unl@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are a few IPU6 and streams API documentation fixes for 6.10.

Please pull.


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.10-3-signed

for you to fetch changes up to 217396eb23f8e4ee5cf52a0e85baf9fab4d20ac9:

  media: intel/ipu6: fix the buffer flags caused by wrong parentheses (2024-05-27 14:57:27 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.10

----------------------------------------------------------------
Bingbu Cao (1):
      media: intel/ipu6: fix the buffer flags caused by wrong parentheses

Christophe JAILLET (3):
      media: intel/ipu6: Fix some redundant resources freeing in ipu6_pci_remove()
      media: intel/ipu6: Move isys_remove() close to isys_probe()
      media: intel/ipu6: Fix an error handling path in isys_probe()

Sakari Ailus (1):
      media: Documentation: v4l: Fix ACTIVE route flag

 .../userspace-api/media/v4l/dev-subdev.rst         |  2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           | 65 ++++++++++++----------
 drivers/media/pci/intel/ipu6/ipu6.c                |  3 -
 4 files changed, 41 insertions(+), 35 deletions(-)

-- 
Kind regards,

Sakari Ailus

