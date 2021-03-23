Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 193B6345911
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 08:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhCWHtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 03:49:41 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:35147 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229865AbhCWHtS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 03:49:18 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ObmrluL8QUzyrObmulOaQL; Tue, 23 Mar 2021 08:49:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616485757; bh=y7cOlfvicbgkhjTXKiELhGinC0b4lySsADVvBiKWafc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=P+LOO/sbz1RIHBAEbwrgxNeyX7RbUsYe/Y3qOe/6VqLK28OWVWooE0EDP5XJA4w+t
         0SexldH+US2mTW0Dic9WAbE6DDCx2mGHUmLShAIGMXQn7AlsXwfSdnxo2omAirrcsN
         lUPilpWNPsJhbPnojJqK2kOG70/dOtROEhiMMrrM35Ua6JgL4ZGD7/0kA8A7N8tLyh
         AkL/9FGiLMXXbP2WRSC3G027k5eLJhivb5Uyr2iNoCHWCgRsZ8NO7UveYU0WVWYRC6
         U1jw/6XAWXL+zaubk2x7GNbp+Ba7fIJH2A41V9QB2tX1cpxTG44f32z+D6b1GpeRTC
         tcmXS4BS9Bq6g==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Tretter <m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] allegro-dvt/nal-h264.h: fix kernel-doc: hdr -> hrd
Message-ID: <03e0ce22-1ebe-24f4-0f49-f4c41ae8f598@xs4all.nl>
Date:   Tue, 23 Mar 2021 08:49:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIF8wfwPe6ayj83Sn3lDjz45xpgQCGEVkei5G61cUhLvETUBgdjUt6Ki6BOJUdM1/sNCIzg5iHJEK6y1x6L9FOs6AdWb+BHULDQKcZt5TTpC6g91wSNJ
 1X9UqcfBNhP+fsKCW1mvUP4Gm36XI54c5XE5tmG+IL5a7LKVLs395Op34S4uGDGJPGIas8wxhIF7txoIbbm7dT/wNIYOGOw0CJ1NjRbOpqLYFp2lO7v1c66M
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Give typo in kernel-doc documentation: hdr -> hrd

Fixes this warning:

drivers/media/platform/allegro-dvt/nal-h264.h:33: warning: expecting prototype for struct nal_h264_hdr_parameters. Prototype was for struct
nal_h264_hrd_parameters instead

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/nal-h264.h
index 2ba7cbced7a5..8cc5a28bf237 100644
--- a/drivers/media/platform/allegro-dvt/nal-h264.h
+++ b/drivers/media/platform/allegro-dvt/nal-h264.h
@@ -12,7 +12,7 @@
 #include <linux/types.h>

 /**
- * struct nal_h264_hdr_parameters - HDR parameters
+ * struct nal_h264_hrd_parameters - HRD parameters
  *
  * C struct representation of the sequence parameter set NAL unit as defined by
  * Rec. ITU-T H.264 (04/2017) E.1.2 HRD parameters syntax.
