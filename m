Return-Path: <linux-media+bounces-10531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8425D8B8AE8
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 15:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A89BB219A6
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 13:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727E512DDB8;
	Wed,  1 May 2024 13:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D+1xP58E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7232712CDBF
	for <linux-media@vger.kernel.org>; Wed,  1 May 2024 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714568895; cv=none; b=cjAwjZSSPJir3AdVo3k49JsnFqdXXKZGqe98OeNbbKiC0lfNkyS8ECBX8T8/gNgH6/9m4dAdt6OkSVoESacOY9l2Jxlk+axh+qw7FnIzcb6gcHaPfAHMYWFqxTxYLH0DQoRrTdF/eJvANAH2gwJ0yJp9AikMR4qY8ltX+FGiNFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714568895; c=relaxed/simple;
	bh=y+Suiychj5Kmbd47EPo9G1ipeYh3sedqM8+HUUUc2kM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yu/NJIQFVxmyiwEazp19aMcvIRam0IM7RMGHSlbc7UsXbyaJ5vmi1UUjokdQc5wABAlD/JqsesOqSckN/pbj/+hSOY2gCP2Jk8DnavlZwsod2vQs2miHIlKJ/H2C85KWnD6a5D7+KBk4xV59vkHzsgbcIA78E48Bw9sGbzX6wrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D+1xP58E; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78edc49861aso503881485a.3
        for <linux-media@vger.kernel.org>; Wed, 01 May 2024 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714568893; x=1715173693; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oVIV4FnRNv/dPP5V2rQHJiO7NQ04SMPMgulHpPoizBk=;
        b=D+1xP58EpghqBIbnYNuRsQ5P2Y1w4gqq7RiQdUBgpRvxPCOCis7aYLtzj7xrkYW8q4
         aQhoY0bsnhA/VCGu8F+QOzP63d+oPMpMz3NIX7neNfOoau4I0UJ7QzNtOTe99lcFg1IC
         F8P7KrQv3OMGWNxDft0rt+gvUqll0EpTYoUz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714568893; x=1715173693;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVIV4FnRNv/dPP5V2rQHJiO7NQ04SMPMgulHpPoizBk=;
        b=tNkwsmdIU6gd3gb/tMucZ1sugZh7oGWDK/yU8/pXvzFOww5r9DTVcFEhzn8RSW+46p
         40+vSfDRy8XwuwusvQGdHzr3NLs7wUOa8pKBe3PxMQoA/aM2JBgNzAo4un4nIIJX+ZyY
         +MmrU/MxFNMwL1XQYVRcG4NuG9UigoDfKsrtowdUsFXsV9HHNN9TXPt4MWyO1agn49vM
         D7pt8Wi0XOJtCeMILjTZtMnROV4kEoPoLJJt781bxXYm3ezKAZyTMFfCx/kuP3TWQXCA
         F8Q7x8MMwvVsEm++I8usz1+T6LUwN4P0UDAOmZ/knNRUqFzViHkPI6Jv5Gyplg0wkXn2
         e8rg==
X-Gm-Message-State: AOJu0YyaEQnjoXpVLrojO+jOEOZwR8X5Yp+O5bZjYQI3v4Ivi4Iz4PjB
	BGwpa5ZYPCGwgeFPWcRAV3bKj8UjX8jPw8oJ4/HXd/8LVqg2xev+xbhTuN5ohg==
X-Google-Smtp-Source: AGHT+IFsKinwo/iR99RzdQl8G0pRYGUoKS26HhMQdT1jQisFRr1LLT7UP2na3C0h1t48Mf5E3V0V8Q==
X-Received: by 2002:ad4:4eeb:0:b0:6a0:991b:cea1 with SMTP id dv11-20020ad44eeb000000b006a0991bcea1mr3044964qvb.5.1714568893143;
        Wed, 01 May 2024 06:08:13 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id l26-20020a0c979a000000b0069b10d78445sm12430971qvd.142.2024.05.01.06.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 06:08:12 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/5] media: Fix compilations with !ACPI !PM and !OF
Date: Wed, 01 May 2024 13:08:08 +0000
Message-Id: <20240501-fix-ipu6-v2-0-a5629a37a0fb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALg+MmYC/22MQQ7CIBBFr9LMWgzQoVFX3sN0ITBtZ9HSgCWah
 ruLXbt8/7+8HRJFpgS3ZodImROHpYI+NeCm5zKSYF8ZtNQosZVi4LfgdevEBT16Y5RBo6Hqa6T
 6HalHX3ni9Arxc5Sz+q1/IlkJKa62VYO1jjrCu5timHmbzyGO0JdSvghr4QijAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda <ribalda@chromium.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.12.4

The current media-stating has some errors when configurations are
missing. Fix that.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Remove missing __maybe_unused (Thanks Hidenori)
- Include https://patchwork.linuxtv.org/project/linux-media/patch/20240430213633.23767-2-laurent.pinchart@ideasonboard.com/
- Link to v1: https://lore.kernel.org/r/20240430-fix-ipu6-v1-0-9b31fbbce6e4@chromium.org

---
Laurent Pinchart (1):
      media: bcm2835-unicam: Include v4l2-subdev.h

Ricardo Ribalda (4):
      media: bcm2835-unicam: Fix build with !PM
      media: intel/ipu6: Switch to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS
      media: intel/ipu6: Fix direct dependency Kconfig error
      media: intel/ipu6: Fix build with !ACPI

 drivers/media/pci/intel/Kconfig                  |  3 +-
 drivers/media/pci/intel/ipu-bridge.c             | 66 +++++++++++++++++-------
 drivers/media/pci/intel/ipu6/ipu6.c              |  4 +-
 drivers/media/platform/broadcom/bcm2835-unicam.c |  3 +-
 4 files changed, 53 insertions(+), 23 deletions(-)
---
base-commit: a1c6d22421501fc1016b99ac8570a1030714c70f
change-id: 20240430-fix-ipu6-84d4d5515452

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


