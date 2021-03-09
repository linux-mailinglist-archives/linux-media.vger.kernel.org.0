Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9CAB332534
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 13:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbhCIMQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 07:16:06 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:50683 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230437AbhCIMPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 07:15:41 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JbGyl7iMLqY4WJbH1leHeI; Tue, 09 Mar 2021 13:15:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615292139; bh=MLwqRXM6yZRmI5Z9+SDsFH/D2VZqFoZAUjxywPlpZYU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BQ5VbD9HRuiTZaugqSEbkM/pfKzMg4eNcRTK8pIkMulajiYGQam9SoYRN+2q0GZ+O
         PGdfXcaF/lMux/GnAqTDgdnHvcBLKY4lQy5fTpRvK5C+vbFOu9fOL0bpYMbX1XvmM/
         t/P941mTYOh7Q/p5BfntDwdFpWTYJIEHqigzsfJn1kVj8kG/pRzn7ApiwTuN3D+6dE
         WkpCW1bwWIYpM5Q7tlCEkj3gRK4juP/tgSY+NCism5Fev+dAeCoQ6TsqddjsceIbzc
         22CcVSF70rP/SQWQbQE3GbXtSuv5JXjzRc0aRxX/YWExZYmpyoo9/4KJRNhmhLGzNn
         X0MrcOPX1drEw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media/pci: fix kerneldoc issues in two headers
Message-ID: <efe8e6e9-47c4-f49f-5d3f-640b11a839bd@xs4all.nl>
Date:   Tue, 9 Mar 2021 13:15:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAy8krtFBeaxO6xDzCEm4SrWfSxYf1huTW3yRzI65RS1Ar7wnl3O0+XDOTEwI5kRBBCeSLI1li/XExZZrAbEE0iM23n3Rbig2h5Nx8nqi36CJPquOl+/
 xyPA35edQNrmAfL1iFMzwQW8SMC4DFHxvwS06/rBUjAT5onuy4z9gBqLjJnyx1mBD84bePXsiXQHpyIPZr+BgKCQ96jMrx+acFs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes these kerneldoc warnings:

drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'v4l2_dev' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'snd_card' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'name' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'type' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'dma_mode' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'pci_dev' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'mmio' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'dma_ops' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'video_channels' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'audio_channels' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'audio_rate' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'period_size' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'audio_enabled' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'dma_delay_timer' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'pending_dma_en' not described in 'tw686x_dev'
drivers/media/pci/tw686x/tw686x.h:143: warning: Function parameter or member 'pending_dma_cmd' not described in 'tw686x_dev'
drivers/media/pci/sta2x11/sta2x11_vip.h:25: warning: Function parameter or member 'i2c_id' not described in 'vip_config'
drivers/media/pci/sta2x11/sta2x11_vip.h:25: warning: Function parameter or member 'i2c_addr' not described in 'vip_config'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.h b/drivers/media/pci/sta2x11/sta2x11_vip.h
index a8cf140a050b..de6000e7943e 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.h
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.h
@@ -14,6 +14,8 @@
  * @pwr_pin: ADV powerdown pin
  * @reset_name: ADV reset name
  * @reset_pin: ADV reset pin
+ * @i2c_id: ADV i2c adapter ID
+ * @i2c_addr: ADV i2c address
  */
 struct vip_config {
 	const char *pwr_name;
diff --git a/drivers/media/pci/tw686x/tw686x.h b/drivers/media/pci/tw686x/tw686x.h
index 48dd1e03d806..21a98995065c 100644
--- a/drivers/media/pci/tw686x/tw686x.h
+++ b/drivers/media/pci/tw686x/tw686x.h
@@ -111,12 +111,12 @@ struct tw686x_dma_ops {
 	u32 hw_dma_mode;
 };

-/**
- * struct tw686x_dev - global device status
- * @lock: spinlock controlling access to the
- *        shared device registers (DMA enable/disable).
- */
+/* struct tw686x_dev - global device status */
 struct tw686x_dev {
+	/*
+	 * spinlock controlling access to the shared device registers
+	 * (DMA enable/disable)
+	 */
 	spinlock_t lock;

 	struct v4l2_device v4l2_dev;
