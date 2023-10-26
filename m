Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 371B77D820F
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 13:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344852AbjJZLyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 07:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbjJZLyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 07:54:08 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A461BB
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 04:54:04 -0700 (PDT)
X-KPN-MessageId: 58ce0ff2-73f6-11ee-a95f-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 58ce0ff2-73f6-11ee-a95f-005056abbe64;
        Thu, 26 Oct 2023 13:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=Df0ruyWDYB161hLD2h3wRHXm5BfD7F6VZytwOlw1hyM=;
        b=Ln5Cll6figb/Ufero4eLmWom826IJd2dlC6dHoJH4/JUF5bYwqwPynA8MhdvsY+MOsv8bIXGwaFN9
         GMRC0lsb2nNtNj2CnLEmpGWsvw/qqReopbF9XUMJXyu7diOooSf8ouFInQbskmRX7KkuyoZ0eeVpUb
         QoNjjTADlGLI5BJWdUn7uva59gIOlgAA6e68lm685paXj97Sr9fbhU6hYkpt4C6meGASmuc0Dcbjrc
         fsaLJ8tl5i8UGiKX82DuG04p1mK8WjxW4/7lEgGidsQhpEpVOPNX2wkgx7Fqw7syP5AcBx9pWvS4o5
         QQwIQNg8Dv4G219IAgUYvsq7DxyWAig==
X-KPN-MID: 33|Tf0rc0NOppvlGd7nEXED/6v3MX4gKZsm0BSo9lv/l1JEEJYHLTXTjuCG2dY/Sbi
 t8fnbuQborNh24eG1JlPUSdG4Ih21Nmj/97ScddJ/cYI=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|OCgqtjO1COcTRcFTqsakFzFQ2AWIFEC9LVsr9rDpnhFKV49DgWeFf51KJyZxGF8
 W1N/bKM2mwirSDlXAzpz2YQ==
X-Originating-IP: 173.38.220.48
Received: from [10.47.75.249] (unknown [173.38.220.48])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 5ad3ca06-73f6-11ee-8248-005056ab1411;
        Thu, 26 Oct 2023 13:54:02 +0200 (CEST)
Message-ID: <f0e6cdb6-15af-4c7b-ac79-98389f8639fc@xs4all.nl>
Date:   Thu, 26 Oct 2023 13:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: core: v4l2-ioctl: check if ioctl is known to avoid
 NULL name
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When ioctl debugging is turned on, the v4l_printk_ioctl() is used
to log the ioctl that is called. It uses an array of ioctl information
to log the ioctl name and it correctly checks for out-of-bound indexing
of that array. However, the array may have holes since not all ioctl
numbers are used. In that case the name of the ioctl is NULL.

It is harmless (printk handles NULL pointers), but not intended. Instead
use the v4l2_is_known_ioctl() function to determine if the ioctl
information is available or not.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 9b1de54ce379..d4104564703b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2951,7 +2951,7 @@ void v4l_printk_ioctl(const char *prefix, unsigned int cmd)
 		type = "v4l2_int";
 		break;
 	case 'V':
-		if (_IOC_NR(cmd) >= V4L2_IOCTLS) {
+		if (!v4l2_is_known_ioctl(cmd)) {
 			type = "v4l2";
 			break;
 		}
