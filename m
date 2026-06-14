Return-Path: <linux-media+bounces-64863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WdVxKasPL2qM7gQAu9opvQ
	(envelope-from <linux-media+bounces-64863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA726822ED
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="jUTDbY/B";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64863-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64863-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6484F3011125
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7EC2F532F;
	Sun, 14 Jun 2026 20:30:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8339B1FC7FB
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:30:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469053; cv=none; b=p1HxAecdLtCnqzsb6X0oMlIL2nqruF7KqvqAZNyc0MMZ2t+RA+XyKReN2HfRzCYZNE/Vsr3CZxNtQou0zY+tyRG4KU9IByIoUklorAdLcdasCeLZ3B46sVwLSeUgE/dIEJFKSYlj3MlIA6EHhbChP/s2q5L2wFIP/lEpXvc54Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469053; c=relaxed/simple;
	bh=1eMFal86YAen0vVh9LNK/i8PVVHxlGEY2RnZMp67kpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IL9qNcDHXYe152mhM72wJhnuu82+Js06f3mtnuPu0x4aPMZcQGXku8CS6Me3eV2TvnXVkD1ViCdvdJFd5RBbDNAlLSR0JEPwlMo8wdmTnMQeQmGrCuejKCBQ5V4FIl5JHW3bpIf+ScvfAoKPthHukCOsVEm4rQ7lCPk1gandyx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUTDbY/B; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b9d265355so1188986a91.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781469052; x=1782073852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1s1vse+Ln4RMdyUiTjXy+JLi3K4i9YZx/oe5qm3b5zQ=;
        b=jUTDbY/BQs0qZm6ugWXgdsxPha3nTQ4gOfb9LChKmr8vdWtlYC1wA4Z1973hKdL3us
         ja33sifgiIoNatKCUWPcOZWkHmOh1BRj+ymysvA5iZfOR9uBH5NGDb+OXqN/rLRLWQ43
         fJqH1t0Pf/GzgC9Jl3ULXWMlhe+VxRISiIHULciDWh9WoSWlD7+Skl+VzoEQQFsY+6OZ
         plzFtWkUC17V4qPd4jItoh3kxUDP7J9d/FDK6OlKYgrnwyQjPmvOE6OAlom8VWZFMqmE
         Qi8MoVy6IAcTvYkA+/yWL8ZMdb2NsSJWSjcTL4z3r6vA95ADJSjxxEZB6bXGHX3Kf7Wc
         sPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781469052; x=1782073852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1s1vse+Ln4RMdyUiTjXy+JLi3K4i9YZx/oe5qm3b5zQ=;
        b=qHSjpLjyrIB2NfN9knxlJnWFuTeB2iIyTo/UxNo/YjDG/5ndqgdux182X3V8LLODga
         tOO3maowdRW5m0UgBoL4/tGTfy0nKHI8q1sf0ltSTNpNVNkf60iQM0OrWNBW2oXsJ2Hl
         CCcPgMVA3pDJEDVEwRcH53rtYv6zm6gIEwFMhT5h3camgbfFAnBwO/kZf427nvpEfGPr
         Rl6jTUS9NnUxB5jjeHG6E2MdGTFbuCyU4jgUTEzs48f0EPaWncPq8Q1tivnoo3NlbLlW
         paWLkG6CtLo6CdWdd0sAKKIZsXKKNLNKsugVaQPU+vnoG4o45CtLs+53zXblh5ZWsGC/
         /cfQ==
X-Gm-Message-State: AOJu0YwZh96I7OEXyHh2dbn+zuzUenwwj6tsEUgHPS9qSYdlJyc6FISX
	gCwnk5oPJO2PudKxzARxeJohI4FY2dQa+IfHYXAfc8oSaWaK+WEk20Nhnv2dXMHf
X-Gm-Gg: Acq92OGhfjVZmumxNdFUEMgR29h9INmO4UgFysiIFdcPxRcM1VjL/pAsjEfzsZ7xAuL
	r5pQGAI4aV1b7HT+g8839H4YGEZPCkp5MB8wyixIgv2PcRm4HmEFatZ6Qrilupf/tvgS/KDU8BE
	NSVBWul8198hvO67AxwGbeBAhU3oI3v6XZUxH03GKaBUB8cyHTpUJRTmXOsx0VSssEMiZIfO1jE
	KG3mTcfKr0lu8sUi3+oWU2yCfcHWyF3W73MyXH/AGUOpS27cmRTGBagRAA0EvipveiHc38nvkBR
	RhlqaZD9lOr/2YIIFNWaUQAA/1+RctNcYgNCb0D1opHHKsnS88XuZ1nfO5Uq/j8jQk/KAFh8s11
	7iL4ttGQAHWf2DojfiKpo6JFbwcXM9cnGtoLw52wK74TdGT7ug0jj8+jSZRNO6K67uESAPX6IHs
	yEdtFnFVELTf5j1aZu2gYM0AdE0jWsdnI90ppkfhWdEIulc1EhHrWg
X-Received: by 2002:a17:90b:278b:b0:36d:b818:f848 with SMTP id 98e67ed59e1d1-37a01846bedmr11565840a91.5.1781469052074;
        Sun, 14 Jun 2026 13:30:52 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.30.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:30:51 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bradford Love <brad@nextdimension.cc>
Subject: [PATCH v3 20/22] media: usb: au0828: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:20 +0530
Message-ID: <20260614202835.11977-21-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64863-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,iscas.ac.cn,nextdimension.cc];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nichen@iscas.ac.cn,m:brad@nextdimension.cc,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BA726822ED

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/usb/au0828/au0828-video.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index 3c53105f3d2b..fec4eafd6e30 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -628,6 +628,7 @@ void au0828_usb_v4l2_media_release(struct au0828_dev *dev)
 		if (AUVI_INPUT(i).type == AU0828_VMUX_UNDEFINED)
 			return;
 		media_device_unregister_entity(&dev->input_ent[i]);
+		media_entity_cleanup(&dev->input_ent[i]);
 	}
 #endif
 }
@@ -934,7 +935,9 @@ int au0828_analog_unregister(struct au0828_dev *dev)
 
 	mutex_lock(&au0828_sysfs_lock);
 	vb2_video_unregister_device(&dev->vdev);
+	media_entity_cleanup(&dev->vdev.entity);
 	vb2_video_unregister_device(&dev->vbi_dev);
+	media_entity_cleanup(&dev->vbi_dev.entity);
 	mutex_unlock(&au0828_sysfs_lock);
 
 	v4l2_device_disconnect(&dev->v4l2_dev);
@@ -1907,8 +1910,10 @@ static void au0828_analog_create_entities(struct au0828_dev *dev)
 			pr_err("failed to initialize input pad[%d]!\n", i);
 
 		ret = media_device_register_entity(dev->media_dev, ent);
-		if (ret < 0)
+		if (ret < 0) {
 			pr_err("failed to register input entity %d!\n", i);
+			media_entity_cleanup(ent);
+		}
 	}
 #endif
 }
@@ -2026,6 +2031,7 @@ int au0828_analog_register(struct au0828_dev *dev,
 	if (retval != 0) {
 		dprintk(1, "unable to register video device (error = %d).\n",
 			retval);
+		media_entity_cleanup(&dev->vdev.entity);
 		return -ENODEV;
 	}
 
@@ -2055,6 +2061,8 @@ int au0828_analog_register(struct au0828_dev *dev,
 
 err_reg_vbi_dev:
 	vb2_video_unregister_device(&dev->vdev);
+	media_entity_cleanup(&dev->vdev.entity);
+	media_entity_cleanup(&dev->vbi_dev.entity);
 	return ret;
 }
 
-- 
2.50.1 (Apple Git-155)


