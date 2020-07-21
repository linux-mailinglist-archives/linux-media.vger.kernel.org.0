Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAEB6228B6D
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 23:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731370AbgGUVcd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 17:32:33 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56391 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731369AbgGUVcc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 17:32:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xzsDjkru9NPeYxzsFjwWio; Tue, 21 Jul 2020 23:32:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595367151; bh=pekm3LzTe5aNfvBKjKyV795RMvlTrd5jTFOwmeUjLc0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=upm0E6vB8Fe6kgJ+Xa0IMnw55IKPiGHlb212GSKALVz46I60NrTjahlGCm9YG79qk
         QG6e6rvrFZhaxi5r7wLHmlwp2zSAHG9VQv7ey0OFxmO2QvOdHdmaQyObre/lLZlt3x
         6Xi78NCWwL0083dNxx7bPYmWoCveFK9lY0QUj0TwMNFo41BrJGZQ7NCbwvosg9iSet
         DasRM/72w25Y1UpwsPpjHPt3NFPjWJsqStBTW5c64dk3WE+9SvHBFU3ggMXyXOdSAJ
         5ksMzNMh398oeii7ea3N3SkJs25bEpo0hCgC0KnuPzyrh176ry5i+rTvphRuktfUVd
         NsoKBlRUAh4Vw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] meye: fix missing pm_mchip_mode field
Message-ID: <6c163ae3-5aff-e44c-95b5-4eedc73ccc93@xs4all.nl>
Date:   Tue, 21 Jul 2020 23:32:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDO8SzviJhY0ljypjczfaoOZt8Hh0nu29NSQs6MveqyKMRLMRbVE8LqFAQVMl8+O7bxLyWNYrv+yEKNVZoKN9qs0IMOpMy7f0a5qZTyKu/pwr64R8VvF
 Qygmoe0VpBrMzKHJsMy6DHFRJx0Lgp1+4bpGhnnLQ2TvDD2HK8ZHhEcDaAWlrT4/F7aw7Zjwi1iC1t7Ec1CO5snX2/UplxHQQ0sgDLk7CPzI68OFtoBkFFy6
 JPXjcaHqtn+WGW0+U3nDK1unZ2ZsNOetVTxrI/B0PhxRVIVFF1cix6GHpxNQVSdkDFMu5l2PVmOR07fbyxggdg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After patch 9c4a8489ab7c ("media: meye: use generic power management")
the pm_mchip_mode field should now always be present, even if CONFIG_PM
is not set.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: kernel test robot <lkp@intel.com>
Fixes: 9c4a8489ab7c ("media: meye: use generic power management")
---
diff --git a/drivers/media/pci/meye/meye.h b/drivers/media/pci/meye/meye.h
index c957d9b55f89..5fa6552cf93d 100644
--- a/drivers/media/pci/meye/meye.h
+++ b/drivers/media/pci/meye/meye.h
@@ -305,9 +305,7 @@ struct meye {
 	u16 colour;
 	struct meye_params params;	/* additional parameters */
 	unsigned long in_use;		/* set to 1 if the device is in use */
-#ifdef CONFIG_PM
 	u8 pm_mchip_mode;		/* old mchip mode */
-#endif
 };

 #endif
