Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 082B02B153
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 11:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfE0JbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 05:31:16 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:53443 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725991AbfE0JbQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 05:31:16 -0400
Received: from [IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52] ([IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VByLhZvCksDWyVByMhYPEP; Mon, 27 May 2019 11:31:14 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] mc-device.c: don't memset __user pointer contents
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <98876672-00cb-4648-4ba7-e960a2f6c2bb@xs4all.nl>
Date:   Mon, 27 May 2019 11:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDDpTiamHM+gIzx/SlDhYuUwliZd6DdiA04t0oWz9aLGI41F069pHcJ2OlpIM//smBeFSAqumn0JsqIPHBZMN3RmtEkMWqIkfwNbFbFvfXDwPoxEUz9g
 ppM/HCHGlbBijHIkW2XZ6ZDyC3KLvnNclEOp+uVHxn4jZNV27G+CiqFfgSIuswOyA6CBlBbKEwxYbjYJUYFw4fx+msK8x8d2mP5SCbWNUJsrpm0DZTP7eR0x
 izwlPLaTugOJnJP4Wy+UxdsUII8LlvF5qtP79TBz/1I=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

You can't memset the contents of a __user pointer. Instead, call copy_to_user to
copy links.reserved (which is zeroed) to the user memory.

This fixes this sparse warning:

SPARSE:drivers/media/mc/mc-device.c drivers/media/mc/mc-device.c:521:16:  warning: incorrect type in argument 1 (different address spaces)

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: f49308878d720 ("media: media_device_enum_links32: clean a reserved field")
---
Note: this patch sits on top of https://patchwork.linuxtv.org/patch/56330/,
which moves the media sources to drivers/media/mc.
---
diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
index 6893843edada..8e2a66493e62 100644
--- a/drivers/media/mc/mc-device.c
+++ b/drivers/media/mc/mc-device.c
@@ -518,8 +518,9 @@ static long media_device_enum_links32(struct media_device *mdev,
 	if (ret)
 		return ret;

-	memset(ulinks->reserved, 0, sizeof(ulinks->reserved));
-
+	if (copy_to_user(ulinks->reserved, links.reserved,
+			 sizeof(ulinks->reserved)))
+		return -EFAULT;
 	return 0;
 }

