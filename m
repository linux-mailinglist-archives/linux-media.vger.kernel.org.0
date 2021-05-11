Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECB837AD4F
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 19:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhEKRqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 13:46:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:57364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231329AbhEKRqV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 13:46:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF676613C5;
        Tue, 11 May 2021 17:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620755114;
        bh=lBdg9pO8LmgLCkMczQpOM+ceJXVD2gHBFdPuLYH3l2Y=;
        h=Date:From:To:Cc:Subject:From;
        b=RyeREauSonx4VHbyBc4VMOUFxkVe2q65iGSRD2jav+sou+Q84iCCnGsvebJXltc7S
         /tJQC1s1inj/XlnaBM6hFx5Mmp6eH0ghHPGITaRn4VM2eWJBc+Vhu3qyfqCEqMlb1S
         Ciax0bhEL5ch8nMWgPEXPpxr5357nIkijswhKkhVxsqId/J1QGinulkf/xp9vK7w1e
         6zGu1RWIJo6jFm7BtfdypKrKXNEO7i47dSlxgk2+SZKuGYaoU5mSZSfHAeZNz10WsR
         BaMVqgdme3Dmtln25qVSsvy//sEgiCuZCo6zuv8ghfcbwCbe/6GJDfxWrE63jSQgSp
         hjOuRkIUSvwDg==
Date:   Tue, 11 May 2021 12:45:47 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: [PATCH RESEND][next] media: siano: Fix out-of-bounds warnings in
 smscore_load_firmware_family2()
Message-ID: <20210511174547.GA33234@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename struct sms_msg_data4 to sms_msg_data5 and increase the size of
its msg_data array from 4 to 5 elements. Notice that at some point
the 5th element of msg_data is being accessed in function
smscore_load_firmware_family2():

1006                 trigger_msg->msg_data[4] = 4; /* Task ID */

Also, there is no need for the object _trigger_msg_ of type struct
sms_msg_data *, when _msg_ can be used, directly. Notice that msg_data
in struct sms_msg_data is a one-element array, which causes multiple
out-of-bounds warnings when accessing beyond its first element
in function smscore_load_firmware_family2():

 992                 struct sms_msg_data *trigger_msg =                                                  
 993                         (struct sms_msg_data *) msg;                                                
 994                                                                                                     
 995                 pr_debug("sending MSG_SMS_SWDOWNLOAD_TRIGGER_REQ\n");                               
 996                 SMS_INIT_MSG(&msg->x_msg_header,                                                    
 997                                 MSG_SMS_SWDOWNLOAD_TRIGGER_REQ,                                     
 998                                 sizeof(struct sms_msg_hdr) +                                        
 999                                 sizeof(u32) * 5);                                                   
1000                                                                                                     
1001                 trigger_msg->msg_data[0] = firmware->start_address;                                 
1002                                         /* Entry point */                                           
1003                 trigger_msg->msg_data[1] = 6; /* Priority */                                        
1004                 trigger_msg->msg_data[2] = 0x200; /* Stack size */                                  
1005                 trigger_msg->msg_data[3] = 0; /* Parameter */                                       
1006                 trigger_msg->msg_data[4] = 4; /* Task ID */ 

even when enough dynamic memory is allocated for _msg_:

 929         /* PAGE_SIZE buffer shall be enough and dma aligned */
 930         msg = kmalloc(PAGE_SIZE, GFP_KERNEL | coredev->gfp_buf_flags);

but as _msg_ is casted to (struct sms_msg_data *):

 992                 struct sms_msg_data *trigger_msg =
 993                         (struct sms_msg_data *) msg;

the out-of-bounds warnings are actually valid and should be addressed.

Fix this by declaring object _msg_ of type struct sms_msg_data5 *,
which contains a 5-elements array, instead of just 4. And use
_msg_ directly, instead of creating object trigger_msg.

This helps with the ongoing efforts to enable -Warray-bounds by fixing
the following warnings:

  CC [M]  drivers/media/common/siano/smscoreapi.o
drivers/media/common/siano/smscoreapi.c: In function ‘smscore_load_firmware_family2’:
drivers/media/common/siano/smscoreapi.c:1003:24: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
 1003 |   trigger_msg->msg_data[1] = 6; /* Priority */
      |   ~~~~~~~~~~~~~~~~~~~~~^~~
In file included from drivers/media/common/siano/smscoreapi.c:12:
drivers/media/common/siano/smscoreapi.h:619:6: note: while referencing ‘msg_data’
  619 |  u32 msg_data[1];
      |      ^~~~~~~~
drivers/media/common/siano/smscoreapi.c:1004:24: warning: array subscript 2 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
 1004 |   trigger_msg->msg_data[2] = 0x200; /* Stack size */
      |   ~~~~~~~~~~~~~~~~~~~~~^~~
In file included from drivers/media/common/siano/smscoreapi.c:12:
drivers/media/common/siano/smscoreapi.h:619:6: note: while referencing ‘msg_data’
  619 |  u32 msg_data[1];
      |      ^~~~~~~~
drivers/media/common/siano/smscoreapi.c:1005:24: warning: array subscript 3 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
 1005 |   trigger_msg->msg_data[3] = 0; /* Parameter */
      |   ~~~~~~~~~~~~~~~~~~~~~^~~
In file included from drivers/media/common/siano/smscoreapi.c:12:
drivers/media/common/siano/smscoreapi.h:619:6: note: while referencing ‘msg_data’
  619 |  u32 msg_data[1];
      |      ^~~~~~~~
drivers/media/common/siano/smscoreapi.c:1006:24: warning: array subscript 4 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
 1006 |   trigger_msg->msg_data[4] = 4; /* Task ID */
      |   ~~~~~~~~~~~~~~~~~~~~~^~~
In file included from drivers/media/common/siano/smscoreapi.c:12:
drivers/media/common/siano/smscoreapi.h:619:6: note: while referencing ‘msg_data’
  619 |  u32 msg_data[1];
      |      ^~~~~~~~

Fixes: 018b0c6f8acb ("[media] siano: make load firmware logic to work with newer firmwares")
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Hi,

We are about to be able to globally enable -Warray-bounds and,
these are pretty much the last out-of-bounds warnings in linux-next.

Thanks

 drivers/media/common/siano/smscoreapi.c | 22 +++++++++-------------
 drivers/media/common/siano/smscoreapi.h |  4 ++--
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index 410cc3ac6f94..bceaf91faa15 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -908,7 +908,7 @@ static int smscore_load_firmware_family2(struct smscore_device_t *coredev,
 					 void *buffer, size_t size)
 {
 	struct sms_firmware *firmware = (struct sms_firmware *) buffer;
-	struct sms_msg_data4 *msg;
+	struct sms_msg_data5 *msg;
 	u32 mem_address,  calc_checksum = 0;
 	u32 i, *ptr;
 	u8 *payload = firmware->payload;
@@ -989,24 +989,20 @@ static int smscore_load_firmware_family2(struct smscore_device_t *coredev,
 		goto exit_fw_download;
 
 	if (coredev->mode == DEVICE_MODE_NONE) {
-		struct sms_msg_data *trigger_msg =
-			(struct sms_msg_data *) msg;
-
 		pr_debug("sending MSG_SMS_SWDOWNLOAD_TRIGGER_REQ\n");
 		SMS_INIT_MSG(&msg->x_msg_header,
 				MSG_SMS_SWDOWNLOAD_TRIGGER_REQ,
-				sizeof(struct sms_msg_hdr) +
-				sizeof(u32) * 5);
+				sizeof(*msg));
 
-		trigger_msg->msg_data[0] = firmware->start_address;
+		msg->msg_data[0] = firmware->start_address;
 					/* Entry point */
-		trigger_msg->msg_data[1] = 6; /* Priority */
-		trigger_msg->msg_data[2] = 0x200; /* Stack size */
-		trigger_msg->msg_data[3] = 0; /* Parameter */
-		trigger_msg->msg_data[4] = 4; /* Task ID */
+		msg->msg_data[1] = 6; /* Priority */
+		msg->msg_data[2] = 0x200; /* Stack size */
+		msg->msg_data[3] = 0; /* Parameter */
+		msg->msg_data[4] = 4; /* Task ID */
 
-		rc = smscore_sendrequest_and_wait(coredev, trigger_msg,
-					trigger_msg->x_msg_header.msg_length,
+		rc = smscore_sendrequest_and_wait(coredev, msg,
+					msg->x_msg_header.msg_length,
 					&coredev->trigger_done);
 	} else {
 		SMS_INIT_MSG(&msg->x_msg_header, MSG_SW_RELOAD_EXEC_REQ,
diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index 4a6b9f4c44ac..f8789ee0d554 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -624,9 +624,9 @@ struct sms_msg_data2 {
 	u32 msg_data[2];
 };
 
-struct sms_msg_data4 {
+struct sms_msg_data5 {
 	struct sms_msg_hdr x_msg_header;
-	u32 msg_data[4];
+	u32 msg_data[5];
 };
 
 struct sms_data_download {
-- 
2.27.0

