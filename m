Return-Path: <linux-media+bounces-5427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B82D85A70D
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 16:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71C16B2493E
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 15:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DA43C08E;
	Mon, 19 Feb 2024 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AtKOQznq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27A23C49A
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708355274; cv=none; b=BWt3Wv4NPIC18iRATQSYOexx3SGR8wqP6ZzFq7GqsryZ3e+AwTK54MoEHKkAv5kUlQ4pUjOxoPdlLWsiDC2Z8IRNIm9gKjMEjtBe+WT3BDiE01RptwTgz+CHejvywZCXBDwczY6B+Jy4vCx4vwpj6Axy2u5vpHE7vfhsry+0A08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708355274; c=relaxed/simple;
	bh=8beD0l3448gzEPb4ds9oiILOxkWv4XVE1+S1Mecfg4o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=F/rb2Cp0Esl9on9sdjjeUO73ZigqZuo3DpC2//aSalcNRcrh0vnalokClu28A3XdWS3RAF7sVvHa49arq3Djs7UOA9UGWJ4USVF7zSwmDLnMG0DC4yz8y5x+32VEkIynMJbb24gl2qr7IPUZSlAq5nXlxJ1jYx29PbEvKKE83tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AtKOQznq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708355271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TGpYaIyw/fiQC5YRWnOH8kAucBMPzGChOJg45ZgKYu8=;
	b=AtKOQznqMFNI/INPjA15ZWqQvm3qtHUc0czpS57CnlK10li5thc9LbCvqwoxCrO1RSofhl
	kNXUvslCKCX+POoDMb8OjT7h8KBaERXzxefdALSm6ibNGPyfKdWwjAheB3RJ9s45EekooA
	RcvbrNZJSJp3dcKPOLpNQYf+/PNOK8Q=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-EdajFEz6NWeWrkGnEhqt7A-1; Mon, 19 Feb 2024 10:07:49 -0500
X-MC-Unique: EdajFEz6NWeWrkGnEhqt7A-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-512bed4e08cso171839e87.1
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 07:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708355268; x=1708960068;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TGpYaIyw/fiQC5YRWnOH8kAucBMPzGChOJg45ZgKYu8=;
        b=G68okkkpx8eghu4wJYgvKye7JYtQ1ixM/ifMqNpAZksLdnYj5F5KqCzMQOz3iTlS7P
         H+pzreagQAsKshjfQGqIdgkERBbUql7JoKf4WTfIt4QUy+EHNGNAC06yyQDsAZPNAz+O
         wt6pJsoJbM57WU4loRgnFmGjaK8hy0kY/oOzlaQv4rgHKTHWqD1DD+5UH3pG3PzXztp9
         52NUzqcjbzwDoxW+7wL9+hk08KaHBKkBFokGLpHag16YraKpfjgbk1J1OiiGg6/U2rX7
         5hovILj6fKdzwgsc+3gSx2k9TTBKZXENXCY9zm5vzynb6FErrDx1SyZpfXuErLd1SJ5u
         D3tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlM/z4yPF4tv0mO6uGOOLVG9pdcxKvHrie7m7ChfYuUw4yRL6pAnfw8WNjUSbl+TAjknouh4KsestaCHT/+HOniIQB/ycM+rm2jm4=
X-Gm-Message-State: AOJu0YzPwKrC/JlHyNRhmvLkLYdkxhO0OodFvpeYMRc3tNI6hXo7nBRL
	R9us6MEe73DZxTn5ksPC9Iseo3XmujQ4Z1S9wD8ki3nGgda9YDLWoBKgX3BOIWRNv3fm/4aHW2T
	h40B56vOSexAxkoTn0BIpN8mzUj2PC4VMA8bgB1mPi7TYJXEZd2T4XP5HdV3s
X-Received: by 2002:a19:7407:0:b0:512:9e9f:2f1d with SMTP id v7-20020a197407000000b005129e9f2f1dmr4537333lfe.58.1708355268254;
        Mon, 19 Feb 2024 07:07:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7cwVF14U+CoAMztwi/ojg06LyCMEdCzIQVTdO0cqcnVoXLV+tSSIKtYOUxbIl2iUekqHK9w==
X-Received: by 2002:a19:7407:0:b0:512:9e9f:2f1d with SMTP id v7-20020a197407000000b005129e9f2f1dmr4537319lfe.58.1708355267924;
        Mon, 19 Feb 2024 07:07:47 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7d1cd000000b00563ec73bbafsm2765650edp.46.2024.02.19.07.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 07:07:47 -0800 (PST)
Message-ID: <7f7ea4d9-1862-4532-b19f-46c1bba36af8@redhat.com>
Date: Mon, 19 Feb 2024 16:07:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.9-1
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-staging@lists.linux.dev, Kate Hsuan <hpa@redhat.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

Here are the atomisp changes for 6.9.

One patch from another contributor and a set of patches from
me which has been reviewed by Andy and Kieran.

Highlights:
- Remove more dead / unwanted code
- Changes to make the atomisp driver work with libcamera,
  this has been tested with libcamera's simple pipelinehandler
  together with an ov2680 sensor

Regards,

Hans



The following changes since commit e0b8eb0f6d652981bfd9ba7c619c9d81ed087ad0:

  media: visl: Add codec specific variability on output frames (2024-02-16 11:46:33 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.9-1

for you to fetch changes up to 9849bf7008dea11626c6dfdc438658d8607fe47b:

  media: atomisp: Implement link_setup() op for ISP subdev MC entity (2024-02-19 15:55:47 +0100)

----------------------------------------------------------------
atomisp staging driver changes for 6.8

Highlights:
- Remove more dead / unwanted code
- Changes to make the atomisp driver work with libcamera,
  this has been tested with libcamera's simple pipelinehandler
  together with an ov2680 sensor

----------------------------------------------------------------
Hans de Goede (10):
      media: atomisp: Fix double negation in unsupported revision error
      media: atomisp: Remove isp_subdev_propagate()
      media: atomisp: Rename atomisp_set_crop_and_fmt()
      media: atomisp: Remove custom VCM handling
      media: atomisp: Remove ISP controls which get passed through to the camera
      media: atomisp: Stop setting sd->devnode for the ATOMISP_SUBDEV v4l2-subdev
      media: atomisp: Add DMABUF support
      media: atomisp: Change ISP subdev name to "ATOM ISP"
      media: atomisp: Make MC link from ISP to /dev/video# output node immutable
      media: atomisp: Implement link_setup() op for ISP subdev MC entity

Zhipeng Lu (1):
      media: atomisp: ssh_css: Fix a null-pointer dereference in load_video_binaries

 .../staging/media/atomisp/include/linux/atomisp.h  |  24 --
 .../media/atomisp/include/linux/atomisp_platform.h |   5 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  12 +-
 .../staging/media/atomisp/pci/atomisp_internal.h   |   4 -
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  | 333 +--------------------
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  95 +++---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  20 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |   1 +
 8 files changed, 74 insertions(+), 420 deletions(-)


