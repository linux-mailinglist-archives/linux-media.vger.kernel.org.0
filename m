Return-Path: <linux-media+bounces-35126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B0CADE37D
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 08:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAC463A3DD3
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 06:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917261FECB1;
	Wed, 18 Jun 2025 06:15:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746CE45C14;
	Wed, 18 Jun 2025 06:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750227328; cv=none; b=nZt6WanBsdJYuSgh3L6ZR9rM1FglJRK5EXvRSMnNDjjW+ihABXiWcOoEvjYXVkvKxG/1UGtbQdez5vcDb9wIgiFYFlwKvqTvrU/czEuYn9GQa28MUdGzHCfPnpQ333QcW4ibbR4k3o3EqRESR4hsXEbL2BUD08RMDJyrz5qpo7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750227328; c=relaxed/simple;
	bh=DPAVXee8lg/hmktKWM/b+gQyJe9Un0lw3KuXYjRPCDY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o8jC5QtBKOcN0pa3u6bnRQ0emijdfKyEALBKThI0HxGUaXJzkQAO8N9/soGwvWMeSWuqrx+kn6GB2URoCML3gvL9Ci40ncdplj0u/5m5XllAXZ/7c3PZi713M9RbmT2IQjRMm93B7DA/0t1NN7B6YD/fTxlJtr1bjFyEg8hHLnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowADHFU53WVJo92lNBw--.28436S2;
	Wed, 18 Jun 2025 14:15:19 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: mchehab@kernel.org,
	tglx@linutronix.de,
	mingo@kernel.org,
	hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] media: au0828: Use USB API functions rather than constants
Date: Wed, 18 Jun 2025 14:14:30 +0800
Message-Id: <20250618061430.614188-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADHFU53WVJo92lNBw--.28436S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF43CFW7Kry5WF17Xw48tFb_yoW8GF4fpF
	s3Gay8trWDArW5G3WUJw1UAr1rWa1rZ34xGF9rW3yS9F1xA3Wftry8Ar1Iqr17CFy3u3W5
	tr4Dt3Wqgr1jkF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_GcC_XcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjTRNuciUUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use the function usb_endpoint_dir_in() and usb_endpoint_type()
rather than constants.

The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- ((epd->bEndpointAddress & \(USB_ENDPOINT_DIR_MASK\|0x80\)) ==
-  \(USB_DIR_IN\|0x80\))
+ usb_endpoint_dir_in(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\))
+ usb_endpoint_type(epd)
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/media/usb/au0828/au0828-video.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index e5dff969ed57..fbaa542c8259 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -1921,9 +1921,8 @@ int au0828_analog_register(struct au0828_dev *dev,
 	iface_desc = interface->cur_altsetting;
 	for (i = 0; i < iface_desc->desc.bNumEndpoints; i++) {
 		endpoint = &iface_desc->endpoint[i].desc;
-		if (((endpoint->bEndpointAddress & USB_ENDPOINT_DIR_MASK)
-		     == USB_DIR_IN) &&
-		    ((endpoint->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK)
+		if (usb_endpoint_dir_in(endpoint) &&
+		    (usb_endpoint_type(endpoint)
 		     == USB_ENDPOINT_XFER_ISOC)) {
 
 			/* we find our isoc in endpoint */
-- 
2.25.1


