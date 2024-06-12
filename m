Return-Path: <linux-media+bounces-13083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955C905B00
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8745B264CE
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 18:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEDD80C14;
	Wed, 12 Jun 2024 18:31:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF4A80049;
	Wed, 12 Jun 2024 18:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217093; cv=none; b=eBCkkUlZppO4vm6wCqvoYux5uFFAI/TA+fXzG/9tjYOUuyfcsUKBFK5fEUZJ/M1TucSn13NP8d4KKTu6Bt1oXal5Rb5XvDhkbJLbJ0jJiX6k8IbhYKacL66nUyR9FFIXE+HHrxnlzAJmCaGm4X4sAiRYieqp37vRCEjKPX1OV2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217093; c=relaxed/simple;
	bh=N9bObP1O6/SZHdEBqH2ugXzcLOkJUGAtRYQ4jxKUMAU=;
	h=From:To:Cc:Subject:Date:Message-ID:Mime-Version:Content-Type; b=V/eOxLiQUZD+HoKXl0R9rIHsGBt9hn0rspKOBtAtEAwm8rQ6/vcDrcssF8+fy2Rexyj5wF3ma7v+Xu9Y49ZLuyMmL5E/S3MbOlSngtvTyTnXhhWSGY6B8KM/4lHxOKdLbQLUwkpHslrg4AFZ41LNQGH2NsRyVYzHuGBw3Q7DhwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (c3e47615.dsl.pool.telekom.hu [::ffff:195.228.118.21])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000070620.000000006669E980.0016B241; Wed, 12 Jun 2024 20:31:27 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 0/2] media: v4l2: map UVC_CT_ROLL_ABSOLUTE_CONTROL
Date: Wed, 12 Jun 2024 20:31:12 +0200
Message-ID: <cover.1718216718.git.soyer@irl.hu>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0

Hi,

Some new UVC cameras can report whether they are mounted in 'portrait 
mode'.

In order to userspace getting to know this, this series maps 
UVC_CT_ROLL_ABSOLUTE_CONTROL to V4L2_CID_ROLL_ABSOLUTE.

Tested with Logitech StreamCam and OBSBOT Tiny 2.

Gergo Koteles (2):
  media: v4l2: ctrls: Add ROLL_ABSOLUTE control
  media: v4l2: map UVC_CT_ROLL_ABSOLUTE_CONTROL

 .../userspace-api/media/v4l/ext-ctrls-camera.rst         | 5 +++++
 drivers/media/usb/uvc/uvc_ctrl.c                         | 9 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                | 1 +
 include/uapi/linux/v4l2-controls.h                       | 2 ++
 4 files changed, 17 insertions(+)

-- 
2.45.2


