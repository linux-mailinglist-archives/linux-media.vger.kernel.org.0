Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2F4202323
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2020 12:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbgFTKQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 06:16:47 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:46425 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727944AbgFTKQq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 06:16:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id maYDjDWLkOn2BmaYGjuFlM; Sat, 20 Jun 2020 12:16:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592648205; bh=l7JRUzTgmaafa+XfsgWMWVVFZkEk+S4EdiZteUe+mU4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=v3dETh5hlMdtBgWC8gueBV4kH29QlFlSUCgx3BWL0yJNDN2gPCmxSr7FOk4OgEMeI
         DP8KwyQLwaIW9haSHPK1DcFFKAn5NuxUrEf9lu7iVVCb7l5mjCWcSBmDC+kVWOsPoy
         OI6YNaKYI5oy7D06a09jYSDAswkilS8hki5rwDgKoOUWp+jfCUsDYS6zBx+2+Ukv8l
         ZbQtwKE0eubXAw3vFp8fXR5+ZmLzUldbbTSTeOBVapNgbf0O8DacIZmzKeMyffvFci
         86vET4GeBDNWzo9ZNVDrc5zZrIb/a5mE7vOqQfZ9VDELZpjr5waGTFIzvr4ThjuSWi
         8R7SDS7dGunbw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] cec: remove unused waitq and phys_addrs fields
Date:   Sat, 20 Jun 2020 12:16:40 +0200
Message-Id: <20200620101641.775505-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJCXRKZcgsQ0sZkflwMuzK/h8TopTF7R3mO13FKca7vG2KxPDvNho0t8IPs91rzEVM+dcwxbpXeqECxDeEbgzEShF1I2pWGpEigmuvYyU/Ayxd5VdM/+
 MnolRVmUlL9FpjREtLNFJjsGsYCBLcQSyCfZq4aR5K+xjqLIw1n3JxJ4dJhCCVPFt5gWrd9aADrBxsFaw2RG1XO64gbDT6m3M2OUjI9a1mtznvmpyAGH8yu4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cec_adapter struct contained a waitq field that isn't used
anywhere, so drop this.

It also contained a phys_addrs array to store any reported physical
addresses. However, this was never actually used, so this field is
removed as well. The original idea was to let the core keep track of
this information, but nothing was ever done with this. Should this
be needed in the future then it is easy enough to resurrect this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 4 ----
 drivers/media/cec/core/cec-core.c | 1 -
 include/media/cec.h               | 2 --
 3 files changed, 7 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 6a04d19a96b2..4efe8014445e 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1306,7 +1306,6 @@ static int cec_config_log_addr(struct cec_adapter *adap,
 
 	las->log_addr[idx] = log_addr;
 	las->log_addr_mask |= 1 << log_addr;
-	adap->phys_addrs[log_addr] = adap->phys_addr;
 	return 1;
 }
 
@@ -1324,7 +1323,6 @@ static void cec_adap_unconfigure(struct cec_adapter *adap)
 	adap->log_addrs.log_addr_mask = 0;
 	adap->is_configuring = false;
 	adap->is_configured = false;
-	memset(adap->phys_addrs, 0xff, sizeof(adap->phys_addrs));
 	cec_flush(adap);
 	wake_up_interruptible(&adap->kthread_waitq);
 	cec_post_state_event(adap);
@@ -1974,8 +1972,6 @@ static int cec_receive_notify(struct cec_adapter *adap, struct cec_msg *msg,
 	case CEC_MSG_REPORT_PHYSICAL_ADDR: {
 		u16 pa = (msg->msg[2] << 8) | msg->msg[3];
 
-		if (!from_unregistered)
-			adap->phys_addrs[init_laddr] = pa;
 		dprintk(1, "reported physical address %x.%x.%x.%x for logical address %d\n",
 			cec_phys_addr_exp(pa), init_laddr);
 		break;
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 0c52e1bb3910..c599cd94dd62 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -265,7 +265,6 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	adap->sequence = 0;
 	adap->ops = ops;
 	adap->priv = priv;
-	memset(adap->phys_addrs, 0xff, sizeof(adap->phys_addrs));
 	mutex_init(&adap->lock);
 	INIT_LIST_HEAD(&adap->transmit_queue);
 	INIT_LIST_HEAD(&adap->wait_queue);
diff --git a/include/media/cec.h b/include/media/cec.h
index 972bc8cd4384..1de44a4fc390 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -162,7 +162,6 @@ struct cec_adapter {
 
 	struct task_struct *kthread;
 	wait_queue_head_t kthread_waitq;
-	wait_queue_head_t waitq;
 
 	const struct cec_adap_ops *ops;
 	void *priv;
@@ -197,7 +196,6 @@ struct cec_adapter {
 	struct dentry *status_file;
 	struct dentry *error_inj_file;
 
-	u16 phys_addrs[15];
 	u32 sequence;
 
 	char input_phys[32];
-- 
2.27.0

