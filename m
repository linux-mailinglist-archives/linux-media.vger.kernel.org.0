Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B2B368E3B
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 10:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhDWIBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 04:01:30 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45227 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229456AbhDWIB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 04:01:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Zqk5lzMwhvTEDZqk8lcRzi; Fri, 23 Apr 2021 10:00:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619164852; bh=33+WHiI7WgU4lirKOfn9KUlTMMYS3ljhvWkW/OMyemA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IhtwbLLIW4UiyU7DElD2GYw+PoOrCxNVT5t0YelqECSVFSDTbL0LgZXzVdC5IXPjR
         zWiYY8SQYZX+1eJ1mKnYhVYpPYDsJsrIlSV6Q94PK3SgD8cgGdm3CaNRzEb26irm15
         2aBOlUUVMs+YZrfpmHHjhr/DFWO4q3QL7nY272cLlCHiAsJo23h4jHZ7Ha/5ujIezr
         HyPo+FB0NTp2EcVMF1gkOayFwRY7bzDJetb06p/F7QbT/LXLYe3cAMebhoGqePf337
         gXT8KK9gNsVX0uX6WZIlU7XRPkPxthtDXTS1VwY1mBntM7KDUjQlxvpRFfmyNfWTLe
         8dF2Plm1F1hug==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cobalt: fix race condition in setting HPD
Message-ID: <ba047eda-9a62-c529-80d5-ea073c010d44@xs4all.nl>
Date:   Fri, 23 Apr 2021 10:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAx3zR44c3W9Pc1YcFpKtbiaYoduehxxv2KZkmG74wT0q4T/Ejypwn+OLOYos/3w/ruX3y0LvMYZTMZC8t85a+jAVqkErR3sWohUCpmNC55I93cLTRJY
 NaBwgEM1YaRTC1fSkTPaxReAww9pC3O8WMec0H/pD77m30p4Dfo9ia5nXf8W6Fk0fKk/I31M6TFD4c22vFAMW4UhyfY8KyQMau8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cobalt_s_bit_sysctrl reads the old register value over PCI,
then changes a bit and sets writes the new value to the register.

This is used among other things for setting the HPD output pin.

But if the HPD is changed for multiple inputs at the same time,
then this causes a race condition where a stale value is read.

Serialize calling this function with a mutex.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 839503e654f4..16af58f2f93c 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -667,6 +667,7 @@ static int cobalt_probe(struct pci_dev *pci_dev,
 		return -ENOMEM;
 	cobalt->pci_dev = pci_dev;
 	cobalt->instance = i;
+	mutex_init(&cobalt->pci_lock);

 	retval = v4l2_device_register(&pci_dev->dev, &cobalt->v4l2_dev);
 	if (retval) {
diff --git a/drivers/media/pci/cobalt/cobalt-driver.h b/drivers/media/pci/cobalt/cobalt-driver.h
index bca68572b324..d40b186b1126 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.h
+++ b/drivers/media/pci/cobalt/cobalt-driver.h
@@ -251,6 +251,7 @@ struct cobalt {
 	int instance;
 	struct pci_dev *pci_dev;
 	struct v4l2_device v4l2_dev;
+	struct mutex pci_lock;

 	void __iomem *bar0, *bar1;

@@ -320,10 +321,13 @@ static inline u32 cobalt_g_sysctrl(struct cobalt *cobalt)
 static inline void cobalt_s_bit_sysctrl(struct cobalt *cobalt,
 					int bit, int val)
 {
-	u32 ctrl = cobalt_read_bar1(cobalt, COBALT_SYS_CTRL_BASE);
+	u32 ctrl;

+	mutex_lock(&cobalt->pci_lock);
+	ctrl = cobalt_read_bar1(cobalt, COBALT_SYS_CTRL_BASE);
 	cobalt_write_bar1(cobalt, COBALT_SYS_CTRL_BASE,
 			(ctrl & ~(1UL << bit)) | (val << bit));
+	mutex_unlock(&cobalt->pci_lock);
 }

 static inline u32 cobalt_g_sysstat(struct cobalt *cobalt)
