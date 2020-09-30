Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4601427E7F6
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 13:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbgI3Lxw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 07:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729645AbgI3Lxg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 07:53:36 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18464C0613D0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 04:53:36 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id v12so1430530wmh.3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xUwXV1jfLyrk3fzHWFN8UiiEyP/n/7Giq0Q27vW4/6U=;
        b=Mzyn+zVrXBXpB/+qYQebnqFhRO/DuKUHFBPJkLc7TN2czB/64CXPai6KWUFwetDAfc
         HiJUiHhd/MTv5mm8SRrBWkPQBHpdlRc66Zg2Kke80Xv/6lIDAemQHuIfKCEhNB2P83J7
         DW9fw+N+dCkBJcH1o/iiDoeK/f/LoIMMagH2okdqXDpMD15kdHn/XhnvnqAyuM9rgY3G
         jG3nvwC6He1dXL/8kEz0HZjng7+rqgZIc8CRaPxzZqfFbnDGgqMmtjOBBjqeY0fDRzu0
         68b8rfYJsJIlIcXaJjWhn12ZL4tyFrPhbgenjHi4uqp6BK0jRBye5Quq8i16pSi7BZBp
         ZiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xUwXV1jfLyrk3fzHWFN8UiiEyP/n/7Giq0Q27vW4/6U=;
        b=iKluheeQ7qGI/P1LPlVrRS09VtKMPInGQXt86N9N1QXqmLFouUEoOr8PUt4ih3+bIT
         8/5mRKvEpITz+Rms0e9FOXzhqCWCZOYdAiQSF7A4h2uBKJJ0m51xxKmbg9LZiw/86qbm
         OvPD/nsCP2RZQATsehatOEzMX0Qd7ifc2h6u1oZ1KK7TLqf9LlpSmL7NIqqfQjjX8MpR
         Tomy7fPkvm8+44J0gmrk0wFa0he2aDcHMLqFnbnBQKFGaertWmCpyLy69ty1YogMIfGZ
         mzM3vdJSmjLfyRIgBStifENMVYTkXF1qBmj4knb0J2qFTLS2UHB1sEf8dugaWPKOG9Zk
         BSzA==
X-Gm-Message-State: AOAM530eDLAlZvtQ+Ajqr5nQiS2mHj7UfRRF319O4qzjGeFCUucU+DnY
        VwMu9semfaaeq2ECbk3wqhLVvg==
X-Google-Smtp-Source: ABdhPJzCm/YhtWAwHXSjeHPaI1kSy6fvH1RwwqDu1cSYHPf/1VKNjTpMJQTwi/TktXn5ofLco3x7DQ==
X-Received: by 2002:a1c:2903:: with SMTP id p3mr2733148wmp.170.1601466814658;
        Wed, 30 Sep 2020 04:53:34 -0700 (PDT)
Received: from alex-xps13.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s12sm2222353wmd.20.2020.09.30.04.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 04:53:33 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        jstephan@baylibre.com, stephane.leprovost@mediatek.com,
        gpain@baylibre.com, mturquette@baylibre.com,
        Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 2/4] rpmsg: apu_rpmsg: Add support for async apu request
Date:   Wed, 30 Sep 2020 13:53:48 +0200
Message-Id: <20200930115350.5272-3-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930115350.5272-1-abailon@baylibre.com>
References: <20200930115350.5272-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Julien STEPHAN <jstephan@baylibre.com>

In order to improve performances and flexibility,
add support of async request.

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/rpmsg/apu_rpmsg.c      | 208 ++++++++++++++++++++++-----------
 include/uapi/linux/apu_rpmsg.h |   6 +-
 2 files changed, 144 insertions(+), 70 deletions(-)

diff --git a/drivers/rpmsg/apu_rpmsg.c b/drivers/rpmsg/apu_rpmsg.c
index 5131b8b8e1f2..e14597c467d7 100644
--- a/drivers/rpmsg/apu_rpmsg.c
+++ b/drivers/rpmsg/apu_rpmsg.c
@@ -34,11 +34,16 @@ struct rpmsg_apu {
 	struct iommu_domain *domain;
 	struct iova_domain *iovad;
 	int iova_limit_pfn;
+	wait_queue_head_t waitqueue;
+	u8 available_response;
+	spinlock_t ctx_lock;
+	struct list_head requests;
 };
 
 struct rpmsg_request {
-	struct completion completion;
+	u8 ready;
 	struct list_head node;
+	struct apu_buffer *buffer;
 	void *req;
 };
 
@@ -68,25 +73,35 @@ static dev_t rpmsg_major;
 static DEFINE_IDA(rpmsg_ctrl_ida);
 static DEFINE_IDA(rpmsg_minor_ida);
 static DEFINE_IDA(req_ida);
-static LIST_HEAD(requests);
 static struct apu_iova_domain *apu_iovad;
 
-static int apu_rpmsg_callback(struct rpmsg_device *dev, void *data, int count,
+
+static int apu_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int count,
 			      void *priv, u32 addr)
 {
+	struct rpmsg_apu *apu = dev_get_drvdata(&rpdev->dev);
 	struct rpmsg_request *rpmsg_req;
 	struct apu_dev_request *hdr = data;
+	unsigned long flags;
 
-	list_for_each_entry(rpmsg_req, &requests, node) {
-		struct apu_dev_request *tmp_hdr = rpmsg_req->req;
+	spin_lock_irqsave(&apu->ctx_lock, flags);
+	list_for_each_entry(rpmsg_req, &apu->requests, node) {
+		struct apu_request *tmp_hdr = rpmsg_req->req;
 
 		if (hdr->id == tmp_hdr->id) {
-			memcpy(rpmsg_req->req, data, count);
-			complete(&rpmsg_req->completion);
-
-			return 0;
+			rpmsg_req->ready = 1;
+			apu->available_response++;
+			tmp_hdr->result = hdr->result;
+			tmp_hdr->size_in = hdr->size_in;
+			tmp_hdr->size_out = hdr->size_out;
+			memcpy(tmp_hdr->data, hdr->data,
+			       hdr->size_in+hdr->size_out);
+
+			wake_up_interruptible(&apu->waitqueue);
+			break;
 		}
 	}
+	spin_unlock_irqrestore(&apu->ctx_lock, flags);
 
 	return 0;
 }
@@ -177,48 +192,6 @@ static void apu_device_memory_unmap(struct rpmsg_apu *apu,
 	dma_buf_put(buffer->dma_buf);
 }
 
-static int _apu_send_request(struct rpmsg_apu *apu,
-			     struct rpmsg_device *rpdev,
-			     struct apu_dev_request *req, int len)
-{
-
-	struct rpmsg_request *rpmsg_req;
-	int ret = 0;
-
-	req->id = ida_simple_get(&req_ida, 0, 0xffff, GFP_KERNEL);
-	if (req->id < 0)
-		return ret;
-
-	rpmsg_req = kzalloc(sizeof(*rpmsg_req), GFP_KERNEL);
-	if (!rpmsg_req)
-		return -ENOMEM;
-
-	rpmsg_req->req = req;
-	init_completion(&rpmsg_req->completion);
-	list_add(&rpmsg_req->node, &requests);
-
-	ret = rpmsg_send(rpdev->ept, req, len);
-	if (ret)
-		goto free_req;
-
-	/* be careful with race here between timeout and callback*/
-	ret = wait_for_completion_timeout(&rpmsg_req->completion,
-					  msecs_to_jiffies(1000));
-	if (!ret)
-		ret = -ETIMEDOUT;
-	else
-		ret = 0;
-
-	ida_simple_remove(&req_ida, req->id);
-
-free_req:
-
-	list_del(&rpmsg_req->node);
-	kfree(rpmsg_req);
-
-	return ret;
-}
-
 static int apu_send_request(struct rpmsg_apu *apu,
 			    struct apu_request *req)
 {
@@ -226,6 +199,8 @@ static int apu_send_request(struct rpmsg_apu *apu,
 	struct rpmsg_device *rpdev = apu->rpdev;
 	struct apu_dev_request *dev_req;
 	struct apu_buffer *buffer;
+	struct rpmsg_request *rpmsg_req;
+	unsigned long flags;
 
 	int size = req->size_in + req->size_out +
 		sizeof(u32) * req->count * 2 + sizeof(*dev_req);
@@ -257,24 +232,63 @@ static int apu_send_request(struct rpmsg_apu *apu,
 		dev_req_buffer_size[i] = buffer_size[i];
 	}
 
-	ret = _apu_send_request(apu, rpdev, dev_req, size);
+	ret = ida_simple_get(&req_ida, 0, 0xffff, GFP_KERNEL);
+	if (ret < 0)
+		goto err_free_memory;
+
+	dev_req->id = ret;
+
+	rpmsg_req = kzalloc(sizeof(*rpmsg_req), GFP_KERNEL);
+	if (!rpmsg_req) {
+		ret =  -ENOMEM;
+		goto err_ida_remove;
+	}
 
+	req->id = dev_req->id;
+	rpmsg_req->req = req;
+	rpmsg_req->buffer = buffer;
+	spin_lock_irqsave(&apu->ctx_lock, flags);
+	list_add(&rpmsg_req->node, &apu->requests);
+	spin_unlock_irqrestore(&apu->ctx_lock, flags);
+
+	ret = rpmsg_send(rpdev->ept, dev_req, size);
+	if (ret < 0)
+		goto err;
+
+	kfree(dev_req);
+
+	return req->id;
+
+err:
+	list_del(&rpmsg_req->node);
+	kfree(rpmsg_req);
+	kfree(req);
+err_ida_remove:
+	ida_simple_remove(&req_ida, dev_req->id);
 err_free_memory:
 	for (i--; i >= 0; i--)
 		apu_device_memory_unmap(apu, &buffer[i]);
 
-	req->result = dev_req->result;
-	req->size_in = dev_req->size_in;
-	req->size_out = dev_req->size_out;
-	memcpy(req->data, dev_req->data, dev_req->size_in + dev_req->size_out +
-	       sizeof(u32) * req->count);
-
 	kfree(buffer);
 	kfree(dev_req);
 
 	return ret;
 }
 
+unsigned int rpmsg_eptdev_poll(struct file *fp, struct poll_table_struct *wait)
+{
+	struct rpmsg_apu *apu = fp->private_data;
+	unsigned long flags;
+
+	poll_wait(fp, &apu->waitqueue, wait);
+	spin_lock_irqsave(&apu->ctx_lock, flags);
+	if (apu->available_response) {
+		spin_unlock_irqrestore(&apu->ctx_lock, flags);
+		return POLLIN;
+	}
+	spin_unlock_irqrestore(&apu->ctx_lock, flags);
+	return 0;
+}
 
 static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 			       unsigned long arg)
@@ -285,6 +299,11 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	void __user *argp = (void __user *)arg;
 	int len;
 	int ret;
+	unsigned long flags;
+	struct rpmsg_request *rpmsg_req;
+	int i;
+
+	ret = 0;
 
 	switch (cmd) {
 	case APU_SEND_REQ_IOCTL:
@@ -306,24 +325,69 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 		}
 
 		ret = apu_send_request(apu, apu_req_full);
-		if (ret) {
-			kfree(apu_req_full);
-			return ret;
+
+		break;
+	case APU_GET_NEXT_AVAILABLE_IOCTL:
+		ret = -ENOMSG;
+		spin_lock_irqsave(&apu->ctx_lock, flags);
+		list_for_each_entry(rpmsg_req, &apu->requests, node) {
+			if (rpmsg_req->ready == 1) {
+				struct apu_request *req =
+					rpmsg_req->req;
+
+				ret = 0;
+				if (copy_to_user(argp, &req->id, sizeof(__u16)))
+					ret = -EFAULT;
+				break;
+			}
 		}
+		spin_unlock_irqrestore(&apu->ctx_lock, flags);
+		break;
+	case APU_GET_RESP:
+		/* Get the header */
+		if (!argp)
+			return -EINVAL;
 
-		if (copy_to_user(argp, apu_req_full, sizeof(apu_req) +
-				 sizeof(u32) * apu_req_full->count +
-				 apu_req_full->size_in + apu_req_full->size_out))
-			ret = -EFAULT;
+		if (copy_from_user(&apu_req, argp,
+				   sizeof(apu_req)))
+			return -EFAULT;
 
-		kfree(apu_req_full);
-		return ret;
+		spin_lock_irqsave(&apu->ctx_lock, flags);
+		list_for_each_entry(rpmsg_req, &apu->requests, node) {
+			struct apu_request *req = rpmsg_req->req;
+
+			if ((apu_req.id == req->id) &&
+			    (rpmsg_req->ready == 1)) {
+				int req_len = sizeof(struct apu_request) +
+					req->size_in + req->size_out +
+					req->count * sizeof(u32)*2;
+				int apu_req_len = sizeof(struct apu_request) +
+					req->size_in + req->size_out +
+					req->count * sizeof(u32)*2;
+
+				len = min(req_len, apu_req_len);
+				if (copy_to_user(argp, req, len))
+					ret = -EFAULT;
+				apu->available_response--;
+				ida_simple_remove(&req_ida, req->id);
+				for (i = 0; i < req->count ; i++)
+					apu_device_memory_unmap(apu,
+							&rpmsg_req->buffer[i]);
+				list_del(&rpmsg_req->node);
+				kfree(rpmsg_req->buffer);
+				kfree(rpmsg_req->req);
+				kfree(rpmsg_req);
+				break;
+			}
+		}
+		spin_unlock_irqrestore(&apu->ctx_lock, flags);
 
+		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
@@ -351,6 +415,7 @@ static const struct file_operations rpmsg_eptdev_fops = {
 	.release = rpmsg_eptdev_release,
 	.unlocked_ioctl = rpmsg_eptdev_ioctl,
 	.compat_ioctl = rpmsg_eptdev_ioctl,
+	.poll = rpmsg_eptdev_poll,
 };
 
 static void iova_domain_release(struct kref *ref)
@@ -512,6 +577,11 @@ static int apu_rpmsg_probe(struct rpmsg_device *rpdev)
 	dev->id = ret;
 	dev_set_name(&apu->dev, "apu%d", ret);
 
+	init_waitqueue_head(&apu->waitqueue);
+	spin_lock_init(&apu->ctx_lock);
+	apu->available_response = 0;
+	INIT_LIST_HEAD(&apu->requests);
+
 	ret = cdev_add(&apu->cdev, dev->devt, 1);
 	if (ret)
 		goto free_ctrl_ida;
diff --git a/include/uapi/linux/apu_rpmsg.h b/include/uapi/linux/apu_rpmsg.h
index 81c9e4af9a94..f61207520254 100644
--- a/include/uapi/linux/apu_rpmsg.h
+++ b/include/uapi/linux/apu_rpmsg.h
@@ -21,6 +21,7 @@
  *        by the APU.
  */
 struct apu_request {
+	__u16 id;
 	__u16 cmd;
 	__u16 result;
 	__u16 size_in;
@@ -31,6 +32,9 @@ struct apu_request {
 };
 
 /* Send synchronous request to an APU */
-#define APU_SEND_REQ_IOCTL	_IOWR(0xb7, 0x2, struct apu_request)
+
+#define APU_SEND_REQ_IOCTL		_IOW(0xb7, 0x2, struct apu_request)
+#define APU_GET_NEXT_AVAILABLE_IOCTL	_IOR(0xb7, 0x3, __u16)
+#define APU_GET_RESP			_IOWR(0xb7, 0x4, struct apu_request)
 
 #endif
-- 
2.26.2

