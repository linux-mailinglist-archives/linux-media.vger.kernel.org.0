Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8122236A1
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 10:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgGQIKN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 04:10:13 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:58399 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726113AbgGQIKM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 04:10:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id wLRXjsCCWZ80HwLRajWTv6; Fri, 17 Jul 2020 10:10:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594973410; bh=H/dcz81qPlP24QBY/FlqQPaGWQ0O5nCmZ25XELd9AzM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wFTCQ71QQW5ylhs6Ap4kZO4gFTp9bofKOzq1PGNYXAzf+GlR0ZBLH4dIrE96a3kim
         Lz9g3+yEu1rMeVnPlhIg2irejIfrm33vuAdG5896hirJ/H7k9/XLo9UFtVV8QOwvZd
         O12xpKp/wEvHNAwfVjxjl2W/OkpxMC1/FW34TxxPZUmaTDMzofEMNT+5C9oKPvgAC6
         zB8ixNw0yVyjMFaVZ7K7nymCIG8zxnQnWa37EmQekH4rjoHUdAIsWovU64II3OMIUe
         k4LQCI4UUsA04A4caC5WkN8z2gPPtBW+Icm8XducHEY1UnyPEU+G+CIcNXJm9dsXH+
         mbMnmWQSX/bBw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] dvbdev.h: keep * together with the type
Message-ID: <880acce9-cd85-c69c-2786-8fa8e0a8e9d3@xs4all.nl>
Date:   Fri, 17 Jul 2020 10:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLBhpzSK49jTF7Y8+Am1vsMLVR8vIY4CZC3rSl8hUFKb1vfKHQ0PCmhW1ZS/QyxzgDv8MBPqJdmRgsiy8XT6DEeMlHKQgawi/JeeSzMXQRcBHPrjzdNF
 SXyKJF6+jYpdmNOyUydWYp8cyspTqVUPscqr8CvZbPSjClYQrbDFkSPV/ITZJoaVR0Bymx9Xh/Vvjw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Having the '*' in the next line separated from the type makes it
hard to see that these functions return a pointer to that type.

Instead, keep it next to the type name so it is clear that it is
a pointer to that type.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index 551325858de3..47490c37b7d3 100644
--- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -293,8 +293,8 @@ static inline void dvb_register_media_controller(struct dvb_adapter *adap,
  *
  * @adap:			pointer to &struct dvb_adapter
  */
-static inline struct media_device
-*dvb_get_media_controller(struct dvb_adapter *adap)
+static inline struct media_device *
+dvb_get_media_controller(struct dvb_adapter *adap)
 {
 	return adap->mdev;
 }
