Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49BBD425236
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 13:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241100AbhJGLqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 07:46:03 -0400
Received: from mailrelay3-3.pub.mailoutpod1-cph3.one.com ([46.30.212.12]:51598
        "EHLO mailrelay3-3.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241097AbhJGLqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Oct 2021 07:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=20191106;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:cc:to:
         subject:from:from;
        bh=Y79g0hHhasNvuVfiv0i8ZljJ7lzOurVa0o9e1DlZNTM=;
        b=Lq3eG89NvpMGrJVxFM8rhbQ6VnYad08tcF6eVNiRxu9Y+JMGapJ7SYozOS84A5Pu2p8ZH0pOOTYko
         eqfdXML0E913kqd1lgHZfaPVY/C/DrESJvKHMOkfJNewwPl+9o21S/qQMHbbk9yOIPRAARHVAEyoaS
         2rurSm2lpRbvrBFAKBwFkqgzJ8KOkfOwNtUYd7XhQ7W5KQwm88F6jHb0shdsmkwAhlDSrx+LVNVmDP
         cgcbi0D6dTVgThoguTeQjsjExVoKtR6FglNS3WFZNWSnAgxnZgITzGb+sMUQfd46kncpFYS7DklUj7
         mAiveTTEBVJg8eEOvs2I5o82Mv1I+CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=rsa1;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:cc:to:
         subject:from:from;
        bh=Y79g0hHhasNvuVfiv0i8ZljJ7lzOurVa0o9e1DlZNTM=;
        b=m36mYWeMWb27K/8/isuAAMYMinDzrLXX2FIn1sH+EdC0XUkPUaGJ9pFWH6I0yYkUM8tgVgrRro2yy
         Fxk6RY8Rt/AQdSLN7TI2JOBTQBGSC/J4QZbvj/DMdLWh0ABIEV6LJUJLENfayWWdVuM9TSFJJIqR/J
         KPpEuMTChem1EV437S1CRkNDX2yMq6gw7YFi7zE7qVOAWeD6l3GsDVDKPEayXixC3DivF4p2d3cxzR
         C9dmJkV29MpDmENn3HyPy7ITwnoL/X/tv7A2Z7nKc0PPH5U1iT6+xzrADO4axwTiOGl0PVJCPhMyhH
         yGoaPcshe7p4OZlgvFu4UTgsDvHEl3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=mida.se; s=ed1;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:cc:to:
         subject:from:from;
        bh=Y79g0hHhasNvuVfiv0i8ZljJ7lzOurVa0o9e1DlZNTM=;
        b=GGZO7sm4jvQOYM4XmOejL4UYpLJ+xVRVytiSwMvDkeuD9wvUqFJ2eMBCFfhnrb7msJva72xAYVuvU
         bBQjca8AA==
X-HalOne-Cookie: be88f6fbb1919b75d4d9310155dbe072e5fb8e38
X-HalOne-ID: e08979a4-2763-11ec-87a1-d0431ea8bb03
Received: from [192.168.1.108] (2.67.139.77.mobile.tre.se [2.67.139.77])
        by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id e08979a4-2763-11ec-87a1-d0431ea8bb03;
        Thu, 07 Oct 2021 11:44:07 +0000 (UTC)
From:   rkardell <rkardell@mida.se>
Subject: [PATCH] media: dvb: mt352, change i2c read buffer from stack, to
 kernel space
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Message-ID: <cdb8ea1d-0bd6-ec1d-e72f-0298f286170a@mida.se>
Date:   Thu, 7 Oct 2021 13:44:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: sv-FI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Solve problem with initialization of Mega Sky 580 USB DVB (and other 
using mt352), error when reading i2c id.


Signed-off-by: rkl099 <rkardell@mida.se>
---
  drivers/media/dvb-frontends/mt352.c | 9 ++++++---
  1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/mt352.c 
b/drivers/media/dvb-frontends/mt352.c
index 399d5c519..d7f33558d 100644
--- a/drivers/media/dvb-frontends/mt352.c
+++ b/drivers/media/dvb-frontends/mt352.c
@@ -69,7 +69,7 @@ static int mt352_read_register(struct mt352_state* 
state, u8 reg)
  {
         int ret;
         u8 b0 [] = { reg };
-       u8 b1 [] = { 0 };
+    u8 *b1=kmalloc(1,GFP_KERNEL);
         struct i2c_msg msg [] = { { .addr = state->config.demod_address,
                                     .flags = 0,
                                     .buf = b0, .len = 1 },
@@ -82,12 +82,15 @@ static int mt352_read_register(struct mt352_state* 
state, u8 reg)
         if (ret != 2) {
                 printk("%s: readreg error (reg=%d, ret==%i)\n",
                        __func__, reg, ret);
+               kfree(b1);
                 return ret;
         }
-
-       return b1[0];
+    ret=b1[0];
+    kfree(b1);
+       return ret;
  }

+
  static int mt352_sleep(struct dvb_frontend* fe)
  {
         static u8 mt352_softdown[] = { CLOCK_CTL, 0x20, 0x08 };
-- 
2.30.2


