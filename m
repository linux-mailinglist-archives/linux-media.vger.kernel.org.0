Return-Path: <linux-media+bounces-17301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4FA967C4E
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 23:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 640B1281AEF
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2024 21:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10274139CFF;
	Sun,  1 Sep 2024 21:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bBwalnkX"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA43D56B7C
	for <linux-media@vger.kernel.org>; Sun,  1 Sep 2024 21:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725225522; cv=none; b=TXrlazMi5Sng/MF0Nrvg/T/cGltgV10Nzc0Ky+utvjDPPRVFZKNnk9cwnI7UQYzb66S8aco85D5C49IVu1gBPUoCyeJuDR1TqXeTWSdmLXiJMaILgXJpgeOBmsSWv6TKwac1gaVGq2Hkf6uxQCESY7Pr99Ouc1c/wwPjgA1lSrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725225522; c=relaxed/simple;
	bh=h+3is2u1hDEDH6Kbi0EQfmFv2OcDrSB3NEjviM46h+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PsCxrEzDSJiBxVdp3EsHiQx6HQEwXHBlTnWPQd1nMXzuLrs+lCL32u0MXwb5nvd9x1nbsxQFeKgZFRmrFtmXlUhSvT8N7TLFsid6iNnGK5GuVabDzLvHPC+ZCusOsnXQvanEjKBIyCplTCUDN/R0Byf51OWmY2/5+zjU/z/gHfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bBwalnkX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725225519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P3eSgRgAPinVye51XUc1h1oeEbt3BPVGzmdzfCwQzKQ=;
	b=bBwalnkXwkT2jM4mzaMxryTTvL5xa2Z+lPMtCnzn4KLzJUucWcsqdyPZRnCcK3nn8slzY9
	2A8nyytEZl2ZyjuiWbqDGQviDdjXf8Rm6jNRfGbYVp5Yrn6BQMgsDpCMhV3TEiq/TiSlgW
	HxN+c6a98lLmXI6VKwxasdaZ4++Q+lA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-298-GM_jGZk3OQeClzc1dXScow-1; Sun,
 01 Sep 2024 17:18:38 -0400
X-MC-Unique: GM_jGZk3OQeClzc1dXScow-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B2BC1956080;
	Sun,  1 Sep 2024 21:18:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2727E1955F1B;
	Sun,  1 Sep 2024 21:18:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 0/2] media: v4l: Call s_stream() on VCM when it is called on the associated sensor
Date: Sun,  1 Sep 2024 23:18:32 +0200
Message-ID: <20240901211834.145186-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi All,

The first patch in this series addresses a long standing issue with VCM
device power-management where merely opening the /dev node causes
the VCM to power on. This issue was recently brought up on the libcamera-
devel list and this is my attempt at fixing this.

The second patch is a new VCM driver which I have had in my personal tree
for quite a while now, but finishing it was blocked on the power-management
issue. This new driver shows how VCM runtime-pm can work after patch 1.

Regards,

Hans


Hans de Goede (2):
  media: v4l: Call s_stream() on VCM when it is called on the associated
    sensor
  media: i2c: Add driver for AD5823 VCM

 drivers/media/i2c/Kconfig             |   5 +
 drivers/media/i2c/Makefile            |   1 +
 drivers/media/i2c/ad5823.c            | 311 ++++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-async.c  |  20 ++
 drivers/media/v4l2-core/v4l2-subdev.c |  28 ++-
 include/media/v4l2-subdev.h           |   2 +
 6 files changed, 361 insertions(+), 6 deletions(-)
 create mode 100644 drivers/media/i2c/ad5823.c

-- 
2.46.0


