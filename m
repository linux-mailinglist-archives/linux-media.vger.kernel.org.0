Return-Path: <linux-media+bounces-9383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB68A50EE
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 15:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0315328CF9A
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4980128399;
	Mon, 15 Apr 2024 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aM8V1zs2"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D0128378
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186220; cv=none; b=tpwA2xEcdA1AEykoOqT4VkhWB00V/VbTh3dnGPsmU3e5R3CG+bTLm3YMQ7EbvCm5NktQNUCMIBGTKpJqz+RXwKuoaua95/nMKJouBw1A70ULTducdZKJRoWHmUER4NewhtCR0ZlakPJ8VLg2u2Zvw6qNILZxI/VNC3j+FG0eaic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186220; c=relaxed/simple;
	bh=txYDYAbRNN76WfICM9MMjp/XW21WAzH/nARWYFwkhxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nFl5aJRTm955srgESwUVr3wct93gPXbFuOmLv5pJBdXun745vh9F7IWg40bzr6y1r54j0qmPaDtL355e+795ud7xJ1UDBNH32EK7uRX1utnHYxxaU+fvPU7pML9dAJ4l6vVQHvgP8PGQvYIwyOnw5Gulr3uCPPqdy9pAqLF2ERU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aM8V1zs2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713186217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/1dhgrCsdOf/A9hkdCUG/Ot/YUah7V/Ei9H1qvE4jBg=;
	b=aM8V1zs2KWI4JuY0mS/C31tcmP9rOK1Q8HVTRc9KByioUWfQk4n2qPfGFru1KOOB6BiXeo
	9CV5x8okwHMzqCZzutProySYliaYvqkke7JLTifTo/HeurIq7bRGuny10IDPP6GMT8isa4
	gbEgyPaEDY/1hdi/uUyTMtokk4YfY2k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-NAILFiWJMWSDqJrwroIFfA-1; Mon, 15 Apr 2024 09:03:32 -0400
X-MC-Unique: NAILFiWJMWSDqJrwroIFfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91AE71044572;
	Mon, 15 Apr 2024 13:03:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 832381121312;
	Mon, 15 Apr 2024 13:03:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/5] media: ov2680: Add all controls required by libcamera
Date: Mon, 15 Apr 2024 15:03:13 +0200
Message-ID: <20240415130318.234222-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Hi All,

Here is a resend of my patch-series to add all controls required by
libcamera to the ov2680 driver.

Changes in v2:
- Add error checking to __v4l2_ctrl_modify_range() and
  __v4l2_ctrl_s_ctrl() calls
- Set hblank read-only flag after checking hdl->error (avoids the need
  for an if (ctrls->hblank) check)
- Use hdl->error to error check v4l2_ctrl_new_fwnode_properties()

This has been tested together with the atomisp using the simple
pipelinehandler. This should also work in IPU3 based devices with
an ov2680.

Note the vblank control new default value after a mode-set call 
has been chosen so as to preserve the old behavior of always
running at 30 fps, so as to not change behavior for any existing
use-cases.

Regards,

Hans


Hans de Goede (5):
  media: ov2680: Stop sending more data then requested
  media: ov2680: Drop hts, vts ov2680_mode struct members
  media: ov2680: Add vblank control
  media: ov2680: Add hblank control
  media: ov2680: Add camera orientation and sensor rotation controls

 drivers/media/i2c/ov2680.c | 90 ++++++++++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 19 deletions(-)

-- 
2.44.0


