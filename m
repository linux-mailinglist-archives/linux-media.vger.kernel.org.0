Return-Path: <linux-media+bounces-24291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA366A02784
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 15:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B6BD1880870
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 14:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548221DD9AD;
	Mon,  6 Jan 2025 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U8SC0JGA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31239482EF
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172573; cv=none; b=aZSiOAy8rKid9XMFdtZ90FOxR+qF+6wxNKCG8upAcfdTaL0kOXNckQR5n3aEmel2aT6fbrPh9f3IURIqe6D4W1oJdus9vbaUmqHyN5N4AvBEOal+8CruHybO/ofxpi+8vFKCOeCsoArVLEGYSA2Gp+ep0gLrh/MsjPxCm/MKWmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172573; c=relaxed/simple;
	bh=C97UWJD8tg4IYM6azU7jocf7CfzQnym2axmjUZ03ZYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eGMFkk4fFve0xPiAMeKo4JwKD2j7y1bAKyXhJWIxbKxWUiSPBwKbkVpY8tdTwMne9PobTh2yTqqoWvC8jGxsHGdm4Dr0vZfmUIAmF916KCAGIX9PFBBlcDg9eI/HdNxkookSr/TQpQnInau3DxIZ8gTsm7z8K2FF1ilLgYXF0SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U8SC0JGA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736172571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l6nSAOtYP99HqS4aNUZoeqDj5PIdmBHREN7tVRWQKVw=;
	b=U8SC0JGAJTblybH8iVOr+KtJBx73kAPnffLE931sEJY74sEVsoWj2J8jYwFsmYvQ7nhp+H
	5W4RL/2rt9RJx0i9K4MmZQXyxGSyWGcYyIxhqCiWLVQWJRDP01RqiWinroghbXyJCrPFcz
	6K397iH8s9rZN7OF4hD5HGYe1eID4c0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-n0K9Cuj0PNSLqhzTe3vymA-1; Mon,
 06 Jan 2025 09:09:27 -0500
X-MC-Unique: n0K9Cuj0PNSLqhzTe3vymA-1
X-Mimecast-MFC-AGG-ID: n0K9Cuj0PNSLqhzTe3vymA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C6C7A1956061;
	Mon,  6 Jan 2025 14:09:26 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.104])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 10E2A19560A2;
	Mon,  6 Jan 2025 14:09:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/2] media: uvc: limit max bandwidth for HDMI capture
Date: Mon,  6 Jan 2025 15:09:21 +0100
Message-ID: <20250106140923.56896-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi All,

This is mostly a resend of Mauro's patch from a long time ago to
fix the MacroSilicon HDMI capture UVC dongle:
https://patchwork.linuxtv.org/project/linux-media/patch/bca0634691cea503c2c5df62b98ba66f0c85bf85.1624350539.git.mchehab+huawei@kernel.org/

While reviewing this I noticed that the driver hardcodes 10000000
for the UVC frame interval denominator everywhere. So this v2 adds
a preparation patch adding a define for that constant.

The only other change from Mauro's v1 is adding a comment that the new
uvc_device_info.max_bandwidth field is in pixels per second.

Regards,

Hans


Hans de Goede (1):
  media: uvcvideo: Add a UVC_FIVAL_DENOM define

Mauro Carvalho Chehab (1):
  media: uvc: limit max bandwidth for HDMI capture

 drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++--
 drivers/media/usb/uvc/uvc_v4l2.c   | 16 +++++++--------
 drivers/media/usb/uvc/uvc_video.c  | 33 +++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvcvideo.h   |  3 +++
 4 files changed, 55 insertions(+), 15 deletions(-)

-- 
2.47.1


