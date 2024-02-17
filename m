Return-Path: <linux-media+bounces-5335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8E3858F0B
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 12:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 416251C20F76
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 11:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F244651B9;
	Sat, 17 Feb 2024 11:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KmkRhvXM"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22671DDF5
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 11:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708169092; cv=none; b=Gi7XF1cDNOc3pXpLTfM31/kaYs6kWGh+wiMbm2G+2tKTUmsmdOrFOj5K1WHZTfs1JrNt1HZRkV871cJTOgVIfkjwuuuJDvJgB26FiuC/jVopWWI236QBRbiGAipEZmNmra+N4FJwATiF8QW9ek4Bp65sXqWHkIyIXuN2e1kh3k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708169092; c=relaxed/simple;
	bh=jFRWFRr9vmRUoZpO4AJg4hyybKK6nM6HFcAwgko9j1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=orzBJzcceSMrxC4cuWyQvvaJykpnzmYdfOn3Rb+tbfsj+UhMacXkSkZQzMeLts9rmDX/JDTRUn+jT0RlDKypA9e9nGdH9pdQP1yCKVKl7TT/BmG8acBhMv9Hr0z1r9YlaYS1yzl2MbkUhHxeIEzE78I/G/STCeyDdEd4vyWYasg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KmkRhvXM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708169089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I/jxE3Kmxb387DSZAUP2scoF5N+hsfp+AOT6BG9bkXI=;
	b=KmkRhvXMbjtS3yCAtm3xcAQ4urkj/Y/XPeDha4KokaqaQsqLxIj0ovbgAiHxPxIZVXypDU
	eanvdKUovnuBeViqcuu3Y8YjfWx3zcxkWFy/ebwDNk5+dzRXOkOOgkKuBZIlOt12DSdNFW
	GP3LQORgz0n8cNs7Qm15H6lvCVPFQZ0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-9Q5kF8v9Mmqv2xWvomQneg-1; Sat,
 17 Feb 2024 06:24:46 -0500
X-MC-Unique: 9Q5kF8v9Mmqv2xWvomQneg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DDE13C0008A;
	Sat, 17 Feb 2024 11:24:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA2901C1C7E2;
	Sat, 17 Feb 2024 11:24:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/9] media: atomisp: Changes for libcamera support
Date: Sat, 17 Feb 2024 12:24:29 +0100
Message-ID: <20240217112438.15240-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Hi All,

Here is a series of cleanups (prep work) + some small(ish)
changes to make the atomisp driver work with libcamera.

This has been tested with libcamera's simple pipelinehandler
together with an ov2680 sensor.

Regards,

Hans

p.s.

Andy, I known I still need to do some small cleanups from my last
pull-requests. I have this on my TODO list :)


Hans de Goede (9):
  media: atomisp: Remove isp_subdev_propagate()
  media: atomisp: Rename atomisp_set_crop_and_fmt()
  media: atomisp: Remove custom VCM handling
  media: atomisp: Remove ISP controls which get passed through to the
    camera
  media: atomisp: Stop setting sd->devnode for the ATOMISP_SUBDEV
    v4l2-subdev
  media: atomisp: Add DMABUF support
  media: atomisp: Change ISP subdev name to "ATOM ISP"
  media: atomisp: Make MC link from ISP to /dev/video# output node
    immutable
  media: atomisp: Implement link_setup op for ISP subdev MC entity

 .../media/atomisp/include/linux/atomisp.h     |  24 --
 .../atomisp/include/linux/atomisp_platform.h  |   5 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  12 +-
 .../media/atomisp/pci/atomisp_internal.h      |   4 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 333 +-----------------
 .../media/atomisp/pci/atomisp_subdev.c        |  95 +++--
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  18 +-
 7 files changed, 72 insertions(+), 419 deletions(-)

-- 
2.43.0


