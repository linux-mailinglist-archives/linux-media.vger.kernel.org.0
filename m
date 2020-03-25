Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5C8F192397
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbgCYJB5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:01:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43432 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgCYJB5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:01:57 -0400
Received: by mail-wr1-f67.google.com with SMTP id b2so1816046wrj.10;
        Wed, 25 Mar 2020 02:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nbiq64+XzLhBz/5xIW7PmevCceTu0q5VBUbnWqborHc=;
        b=bhpzp8yk8Uwxp4ei1Ow0WJmAdcLW53JUOHAu5oHAlZ9dKYDKkqJ6pzz4nv1/jBieA+
         YAE7AMPZF085cFPz8Dt/KDJRESWtQFWxwdZZXBjf7CVM9YpflrPFWfZ2vCHtWeB25OU5
         JjzaZ7szVCGPTivODh9rzYa/PYBvUhsNdP/TwKigAG3FO55a2gcCsOdE7HSzSbZfBML6
         kOJzyfRHxRjwtAnhl4cdIjH9zNFiI9jdf6XPKoVa1TNxdZpPOSvnVBMQt5p8SfjeeZkH
         BZ3E5NmvNBkzwYk/hAKIrICcM2UHrkfU31v4XBXq3xCYLO2SD8M+GRG9Laywc0cYNati
         73Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nbiq64+XzLhBz/5xIW7PmevCceTu0q5VBUbnWqborHc=;
        b=pXZAX1+YxfDQKp65mahzTV2zhy8OE2o1KQQEkDpxCbvSCk/yt8000QT1bdnY9WU+X2
         i+aBKZkk2GyFkwSoWDEOWXKzoPpY7PE16/bG0ALee83j7968jVIOzwmyWewMrTZxcTVu
         QXCOA6oUqcPr/rl3yox1EWkWOz3zRmClS0j9xopJkRje37WgAKKaMSQ8ViQq9vHgNsBU
         Bhg9pz6kZqiRQXpxQrT/4L8oNe9x2QK4Ps1KoFmCx0RbOj67dDAUsw3iaHVkPbC0YUAp
         SoT7GUPlLBKsCpIdefW8H+7+UE0zLI3eU8ig5TTORon07TqXAhPqFxycsd+jA17T1C+H
         EE2w==
X-Gm-Message-State: ANhLgQ24ehlSvcwT+3gV/N6lwopCgmE2PwVj8GdKWPEo/UEdW881wK/b
        TP2f/XihdFSi4RfGxgy8v+g7eNkLWSw=
X-Google-Smtp-Source: ADFU+vsYtlC0mqbY2opJhHZeQt2yJWwUXpodXoYAxLr8opxwERXjUC+5rmFS04nEeXR1cnzG7CzhVA==
X-Received: by 2002:adf:9b96:: with SMTP id d22mr2381487wrc.249.1585126915420;
        Wed, 25 Mar 2020 02:01:55 -0700 (PDT)
Received: from localhost.localdomain ([185.239.71.98])
        by smtp.gmail.com with ESMTPSA id s131sm8148776wmf.35.2020.03.25.02.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 02:01:54 -0700 (PDT)
From:   Xiaolong Huang <butterflyhuangxx@gmail.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, tglx@linutronix.de,
        mpe@ellerman.id.au, allison@lohutok.net
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiaolong Huang <butterflyhuangxx@gmail.com>
Subject: [PATCH] media: media/pci: prevent memory leak in bttv_probe
Date:   Wed, 25 Mar 2020 17:01:22 +0800
Message-Id: <20200325090122.9308-1-butterflyhuangxx@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In bttv_probe if some functions such as pci_enable_device,
pci_set_dma_mask and request_mem_region fails the allocated
 memory for btv should be released.

Signed-off-by: Xiaolong Huang <butterflyhuangxx@gmail.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index a359da7773a9..37ac59110383 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -4013,10 +4013,14 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	btv->id  = dev->device;
 	if (pci_enable_device(dev)) {
 		pr_warn("%d: Can't enable device\n", btv->c.nr);
+		bttvs[btv->c.nr] = NULL;
+		kfree(btv);
 		return -EIO;
 	}
 	if (pci_set_dma_mask(dev, DMA_BIT_MASK(32))) {
 		pr_warn("%d: No suitable DMA available\n", btv->c.nr);
+		bttvs[btv->c.nr] = NULL;
+		kfree(btv);
 		return -EIO;
 	}
 	if (!request_mem_region(pci_resource_start(dev,0),
@@ -4025,6 +4029,8 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 		pr_warn("%d: can't request iomem (0x%llx)\n",
 			btv->c.nr,
 			(unsigned long long)pci_resource_start(dev, 0));
+		bttvs[btv->c.nr] = NULL;
+		kfree(btv);
 		return -EBUSY;
 	}
 	pci_set_master(dev);
@@ -4211,6 +4217,8 @@ static int bttv_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	release_mem_region(pci_resource_start(btv->c.pci,0),
 			   pci_resource_len(btv->c.pci,0));
 	pci_disable_device(btv->c.pci);
+	bttvs[btv->c.nr] = NULL;
+	kfree(btv);
 	return result;
 }
 
-- 
2.17.1

