Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60AE920F2B2
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 12:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732545AbgF3K2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 06:28:34 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:53309 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732315AbgF3K2d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 06:28:33 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qDV6j7tbXrl4BqDV9jbKA5; Tue, 30 Jun 2020 12:28:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593512912; bh=Qr5fegNSmgU199CyaNX+ZDerQ+ZPXXLCuHnBMj/VYVI=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TORJbCqi22jzqkvKgIBoj7L9Cir4Q8QuN3ZIniU9t8Ek0gYjYWb7f/e0s/lGqcLZ+
         7d721Nif/5Jjb76isq95n5CCIOE4VtGkmKpw6tnFA+IbcsPRV8PGU5LWQ9SUQK1TPc
         +Kd5E0uHAKRfm6vBrSx/3Ew8c4o6O/p2iVwr9gUH0ZS89qJRti8wpMb5pjA1mZzYxx
         zV21dYO/t6dZ8TaeyoLVjuJUdPcKc9lBkhrgkxrqS7u5hqr0qx+Sn4LuwDQemkuvFp
         gWvDTtlJEPVbw2dW/4GzECWt666JQf5MH1CFGBlgpoDihtqsjjpG/ChScjiB0d/ehs
         k7MWXy1JkE7LQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] include/media/v4l2-subdev.h: fix typo
Message-ID: <d29e9b33-a644-1a13-508b-fe0df6b768b8@xs4all.nl>
Date:   Tue, 30 Jun 2020 12:28:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAd7JNyvKLPnrnzb/IfZUdemZsFw0DWUx+hCXMduqJQaz39gM3KfxfGnPqjoEnP5vjgk3XeCO7SPTCcrFGRMnMsAoYvtOYZtbr53b0t+5dgMDf7EqQXk
 4PyZcqULL9fVqKaQYvCoTSnrHD4LPBvK2upqywpZfzZR81BE1LLwcRm3ZKZQEEbyY2fh5fBzdYbmow==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Typo in comment block:

v4l2_subdev_get_try_crop -> v4l2_subdev_get_try_compose

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index f7fe78a6f65a..2607ea85096a 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -959,7 +959,7 @@ static inline struct v4l2_rect
 }

 /**
- * v4l2_subdev_get_try_crop - ancillary routine to call
+ * v4l2_subdev_get_try_compose - ancillary routine to call
  *	&struct v4l2_subdev_pad_config->try_compose
  *
  * @sd: pointer to &struct v4l2_subdev
