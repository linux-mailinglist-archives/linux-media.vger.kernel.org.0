Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4920F8EC2D
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730497AbfHONAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:00:38 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47891 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729818AbfHONAi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:00:38 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yFMnhvnOJDqPeyFMqhYCUO; Thu, 15 Aug 2019 15:00:36 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] hdpvr: add terminating 0 at end of string
Message-ID: <e733c6ac-cec9-e251-ff5f-c20df1c9c326@xs4all.nl>
Date:   Thu, 15 Aug 2019 15:00:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAy81XwoX3Hl6bJO/xiX0KBVPA/ZAHGJqIQvye13mB5xl1TR7ht2FEAx0eztB49hXCysVSZZ1DnSfhqgZw6LkPIiR9LUNLHEjgxCKZiMArGjUkbJUsrJ
 hnUYRxDSejoc/R5ypdiJMUHm9yCdaC7Qzhqdsa8PtqQukPVYPRyivDMtnjs+hnC5FT0hTnX5HQ1iLMOvZbPb/zGyFlheRviHIHKgzuPHahsx02VpGYR/8xCq
 R54mAC55wsaX2QZBshNb2rhphnfh69DfVnYbQ54sYfP3C1MN2baZ3KjkV7XE4bgD
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dev->usbc_buf was passed as argument for %s, but it was not safeguarded
by a terminating 0.

This caused this syzbot issue:

https://syzkaller.appspot.com/bug?extid=79d18aac4bf1770dd050

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-and-tested-by: syzbot+79d18aac4bf1770dd050@syzkaller.appspotmail.com
---
diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c b/drivers/media/usb/hdpvr/hdpvr-core.c
index a0905c81d2cb..b75c18a012a7 100644
--- a/drivers/media/usb/hdpvr/hdpvr-core.c
+++ b/drivers/media/usb/hdpvr/hdpvr-core.c
@@ -137,6 +137,7 @@ static int device_authorization(struct hdpvr_device *dev)

 	dev->fw_ver = dev->usbc_buf[1];

+	dev->usbc_buf[46] = '\0';
 	v4l2_info(&dev->v4l2_dev, "firmware version 0x%x dated %s\n",
 			  dev->fw_ver, &dev->usbc_buf[2]);

