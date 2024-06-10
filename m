Return-Path: <linux-media+bounces-12808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D16B901C95
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86D961C2130E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 08:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3AB757EE;
	Mon, 10 Jun 2024 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiLXCU61"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE996F31A;
	Mon, 10 Jun 2024 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007041; cv=none; b=TBioIV7Io16DDkXtR2MnuHx4MDhPBRrnrQ+SriJ1GF6MnAf6ckMkMyukCY7psa1xbw8/pbhoCclG5GnOVO/MkH57lcexnzQhv1tBofRAod+wIUsOawoezJXlJnjGin2fc3x/TOMzDSd4KYt3+LT3urKigRjR96P4JOeZBUism4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007041; c=relaxed/simple;
	bh=3J/yZBJ105SCztYTIJVDaoUQRAB/xSFzxUxU7kuA/T0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ivH7hZ6e3dDNL04SbdNuLFN6Y/0woyJSfDrZsTh50oEnlXOHZEOMsN7ap/da6n8CO6sDT0bOTxFU4KwaZatKqjcoaiO8peJCmM8iqd6c8ADspgNpvYNW8D1WyZnRdEzQVuVJr5zspU+KL6L21iViTG7gmVepEJ4zDtOrEKPeoyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiLXCU61; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52bc1acb9f0so2594440e87.2;
        Mon, 10 Jun 2024 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718007038; x=1718611838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WyMU6nrjUktsF/kShN+367PbDn/Xbamsn29XnW6Z9QY=;
        b=ZiLXCU611iXKs48zjZ8+MoNTITfQROyYLt/6zMwDzecWCvqvFvv8xOWi6N06StHe6l
         A+Tecl1gL2zbOH9wP/oliNvMqFB8AUWWDEdVDoN2XoBiZLZpH87rg7Jig/FBZCf+lAPI
         8INvaPUe/vAzJ9Bn4sRLtCwnt6a2wWT+Nn6Nqew3ed8hEOJYyO607WdMpk6ZlIh8MraM
         +dWywVWC2y0rwVGNzPj+wSUI+rXRzVxoNxPeowHBOwpM3TbKCDKsLv+Z6KvBW8Tjp7lU
         EWJ0S22UG331SXKKQk9TczBFS9bTYjTHUIKXB0pyXofw/Du0BGOIlLBkwz8hmKMRNq3u
         7Kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718007038; x=1718611838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyMU6nrjUktsF/kShN+367PbDn/Xbamsn29XnW6Z9QY=;
        b=e1ERj16a9kdGC/4fCjgN4p7iYTfUYs9AHpaaPuHsx+0no4AV1FgYKBObi2ykwipzsM
         EVnnbpULt5eCPNzPBjhRr8BArBdLLr8Bq6byLZfahl43TnhC/nRgSLAj61gHJg6nbzRL
         KQkn+wnHfR1V7WNejCL5kZgH/vPSHOOoIFI4+jpsM/EieN/9yUuCQTKZCJCnsBPcckMY
         YX7JVfYxeG1KkPmhCmEZ+RIq1s4j24eITt5sk39w5jXxYsEeLyxQmiIvLKbTIjn2itFu
         AGt41b1YxK0iA+IjxyHhEvliGQbEhHILbeHoLShtOPBIjOtOivB+qO7Ob/6mnURFIQY9
         NQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCVD7nPJ1O6zDGHLtx+Ofp2QdrAkoiIXrQR24mUWkd7nE4JyZ0OoL+dXkohfUpdV9WaxiLnx5P2N4z2P0ymB3cts53DMYPJRJesZgaddXGcPIesiXyT+3O5ZpFVsuitj/f9vDhrqNM75Iqg=
X-Gm-Message-State: AOJu0Yxw7KTkxWUjl1YoIjYQ7yLzvtZ/CZAoBUUkGxpG9zgHyhGvOjbE
	Ok7wwXxfpUAw8iR3PPa0YbDe3bRzFx1OvYXOJ8W38nbUk1EdGguT
X-Google-Smtp-Source: AGHT+IH9dA8TG5uJLqvBOAbGSeEmnPrCphyw4s0h1AxVFtdDwmgziowOLrjS1KyMo1BrOAMUpus5YQ==
X-Received: by 2002:a05:6512:33c8:b0:52c:820d:9a2a with SMTP id 2adb3069b0e04-52c820d9d9cmr3733283e87.53.1718007036928;
        Mon, 10 Jun 2024 01:10:36 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-58-5.cust.vodafonedsl.it. [188.217.58.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421e91c47b4sm18021315e9.35.2024.06.10.01.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 01:10:36 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	martin.hecht@avnet.eu,
	tomm.merciai@gmail.com,
	michael.roeder@avnet.eu,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] alvium improvements
Date: Mon, 10 Jun 2024 10:10:29 +0200
Message-Id: <20240610081034.1195523-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  Hello,

This series containing improvements for the Alvium camera driver.
Specifically:

Patches:
 - 1 Fix fix alvium_get_fw_version()
 - 2 Rename acquisition frame rate enable define into a short define
 - 3 Alvium camera by default is in free running mode. Datasheet say that
     acquisition frame rate reg can only be used if frame start trigger
     mode is set to off. Enable r/w aquisition frame rate and turn off trigger mode.
 - 4 Implement enum_frame_size
 - 5 Use the right V4L2_CID for the analogue gain

Thanks & Regards,
Tommaso

Tommaso Merciai (5):
  media: i2c: alvium: fix alvium_get_fw_version()
  media: i2c: alvium: rename acquisition frame rate enable reg
  media: i2c: alvium: enable acquisition frame rate
  media: i2c: alvium: implement enum_frame_size
  media: i2c: alvium: Move V4L2_CID_GAIN to V4L2_CID_ANALOG_GAIN

 drivers/media/i2c/alvium-csi2.c | 65 ++++++++++++++++++++++++++-------
 drivers/media/i2c/alvium-csi2.h | 16 +++++---
 2 files changed, 62 insertions(+), 19 deletions(-)

-- 
2.34.1


