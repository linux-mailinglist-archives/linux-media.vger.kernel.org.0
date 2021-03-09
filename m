Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE4433257A
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 13:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhCIM2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 07:28:30 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:46849 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231183AbhCIM2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 07:28:16 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JbT9l7mTOqY4WJbTCleJT6; Tue, 09 Mar 2021 13:28:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615292894; bh=52/sL/50tVPpZyumCSkN0o6FMQp5ZQXPOCTw6T2kDGQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=O5sz78qp7AlCZ8VU8NLcpAvzRuJnL+qO7R+h8Vq6p34k6IhAYdcFFF6AB5f1TUgoa
         DhPiQvK9GyQCmVNoQ2ztuMe2qdgnTxa1BjnhjU+zGEFiNkopBRBTFAfJbxBulqtxZI
         qy7ZAuugB8HnZ1lFX2ILFKsK4L5v3NBXyGRecYpDVnGAX+kxZNPWj4TtEdCP9GvAJh
         lxbuzwGz+R1G5avYoLs5VhryFl0hjKkrrxhv5RAt9V7kFLsZP3JXC3HTokOthEvAkT
         fzA93VMNK5XZM1ouE6LXt0u1UbCDnaaIiW3XH88TzrsfyD+yyWplKfosokz/DHogco
         9XdvNdv7uXjnA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media tuner headers: fix kernel-doc warnings
Message-ID: <f90f9e27-bafd-df23-96a7-c86549499edb@xs4all.nl>
Date:   Tue, 9 Mar 2021 13:28:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJFQm/oWLr9EVXLjFxE+oUGqsCRojXgPZhH802PvmbDiSstOj3BsaHRuNzPkVboyyxLZSCP00rRA8cSJeChhO7kWm9GfCpTpLgdX3NWC6oOLHpuNoUs0
 I5QGhUbzKWfO8ne5n+oao4w9O50+jCFZsMhgy43McdKpI5v8HiCUYHHKQYcSiDrJLoFulMtoQfOhpmGy3X8UPi2bfOQQ5xpfFBQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following kernel-doc warnings:

drivers/media/tuners/it913x.h:28: warning: Function parameter or member 'fe' not described in 'it913x_platform_data'
drivers/media/tuners/tda827x.h:34: warning: wrong kernel-doc identifier on line:
 * Attach a tda827x tuner to the supplied frontend structure.
drivers/media/tuners/qt1010.h:20: warning: wrong kernel-doc identifier on line:
 * Attach a qt1010 tuner to the supplied frontend structure.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/tuners/it913x.h b/drivers/media/tuners/it913x.h
index 600268816d98..bb45637abea9 100644
--- a/drivers/media/tuners/it913x.h
+++ b/drivers/media/tuners/it913x.h
@@ -14,7 +14,7 @@
 /**
  * struct it913x_platform_data - Platform data for the it913x driver
  * @regmap: af9033 demod driver regmap.
- * @dvb_frontend: af9033 demod driver DVB frontend.
+ * @fe: af9033 demod driver DVB frontend.
  * @role: Chip role, single or dual configuration.
  */

diff --git a/drivers/media/tuners/qt1010.h b/drivers/media/tuners/qt1010.h
index 559c12b97dbb..8db874334210 100644
--- a/drivers/media/tuners/qt1010.h
+++ b/drivers/media/tuners/qt1010.h
@@ -16,11 +16,11 @@ struct qt1010_config {
 };

 /**
- * Attach a qt1010 tuner to the supplied frontend structure.
+ * qt1010_attach() - Attach a qt1010 tuner to the supplied frontend structure
  *
- * @param fe   frontend to attach to
- * @param i2c  i2c adapter to use
- * @param cfg  tuner hw based configuration
+ * @fe:   frontend to attach to
+ * @i2c:  i2c adapter to use
+ * @cfg:  tuner hw based configuration
  * @return fe  pointer on success, NULL on failure
  */
 #if IS_REACHABLE(CONFIG_MEDIA_TUNER_QT1010)
diff --git a/drivers/media/tuners/tda827x.h b/drivers/media/tuners/tda827x.h
index 30ac9214487f..d3c2f00ada8f 100644
--- a/drivers/media/tuners/tda827x.h
+++ b/drivers/media/tuners/tda827x.h
@@ -30,12 +30,12 @@ struct tda827x_config


 /**
- * Attach a tda827x tuner to the supplied frontend structure.
+ * tda827x_attach() - Attach a tda827x tuner to the supplied frontend structure
  *
- * @param fe Frontend to attach to.
- * @param addr i2c address of the tuner.
- * @param i2c i2c adapter to use.
- * @param cfg optional callback function pointers.
+ * @fe: Frontend to attach to.
+ * @addr: i2c address of the tuner.
+ * @i2c: i2c adapter to use.
+ * @cfg: optional callback function pointers.
  * @return FE pointer on success, NULL on failure.
  */
 #if IS_REACHABLE(CONFIG_MEDIA_TUNER_TDA827X)
