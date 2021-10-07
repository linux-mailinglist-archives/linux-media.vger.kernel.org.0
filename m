Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7AB425307
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 14:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241380AbhJGMa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 08:30:57 -0400
Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com ([46.30.212.11]:52873
        "EHLO mailrelay2-3.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241376AbhJGMa4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Oct 2021 08:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=20191106;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:cc:to:
         subject:from:from;
        bh=XFUZIvYUUSzvXFg3UTtTaUX58u2hmAWVTWHRchR63XM=;
        b=Wq9ycX1o2L1kxKolvttKlXMfccIHzb+8QG96A7B6C1BpiQUivoDrbplBYEce7GRRqW3Z/ezF4yI6V
         q+xWtGKt98nrPi70KWFWNO6i8kgz7FxIAO6npTcslm0DRXH0wd1INl3ZXaH3dLEJGh0RfuCw2In2y8
         1jLGfgd6ot/btSAUw7H+IiJxlA8pl5K+H65VGev7flzmj15V7REB4EP8kU53ABaKN1B3pLsmQDUXc2
         /QOAGlg3ju3YKLnwrkkaXwPvbMZW8gF4aeMdj2S+tg2kru4S7ZzsTSd+21PUANbFzaTBCtOwz74MaJ
         Gq0svZahDVg275WNpPK7ealai+YxU/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=rsa1;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:cc:to:
         subject:from:from;
        bh=XFUZIvYUUSzvXFg3UTtTaUX58u2hmAWVTWHRchR63XM=;
        b=PFdaGnuZ9nB+A3DVbgseRL7xf2KnlS2waAvrrEhfmHsIuO6XUCAYmYrL6+1Xj6mFXwMkbNheDUrgg
         LmjS/ilhSTF/wQaPF06c9RXF+XwJXABDRwrARTeUjjaMmrycGZhhu66vpEoNcYeOkfROi+09hNsmpz
         0+B79nKMPKFe+80y4IORchKefsszRkEpak/myaT3Z8FYYkE1dY/yUqK5qHGhrqvYJW+deAzBHFBRcf
         77xMPosMNZ+y/6SmgTmzYpmpzLjFbHShTbfUGpGOkm0o4HWsZCeauppcEKlC2ZZEQEL1Lp/Lf23imP
         lb2+IxRdBya8TRG9iX9cgmgqVRNV59w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=mida.se; s=ed1;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:cc:to:
         subject:from:from;
        bh=XFUZIvYUUSzvXFg3UTtTaUX58u2hmAWVTWHRchR63XM=;
        b=rQ3I1S8+M3z6sUPSIRi1zQ2f+hAAWLvFqBm4OUeenRUNj6M9ydGhHtnq1xQ5S02Xs0t68tK7hd95m
         EGHcLRaAw==
X-HalOne-Cookie: 337e692878d51df8326ce4c9460df03be9965480
X-HalOne-ID: 269d6e5d-276a-11ec-bd57-d0431ea8a290
Received: from [192.168.1.108] (2.67.139.77.mobile.tre.se [2.67.139.77])
        by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 269d6e5d-276a-11ec-bd57-d0431ea8a290;
        Thu, 07 Oct 2021 12:29:01 +0000 (UTC)
From:   rkardell <rkardell@mida.se>
Subject: [PATCH] media: dvb: qt1010, change i2c read buffer from stack, to
 kernel space
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Message-ID: <ccc99e48-de4f-045e-0fe4-61e3118e3f74@mida.se>
Date:   Thu, 7 Oct 2021 14:29:00 +0200
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
  drivers/media/tuners/qt1010.c | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/tuners/qt1010.c b/drivers/media/tuners/qt1010.c
index 3853a3d43..1bc0756f7 100644
--- a/drivers/media/tuners/qt1010.c
+++ b/drivers/media/tuners/qt1010.c
@@ -11,18 +11,22 @@
  /* read single register */
  static int qt1010_readreg(struct qt1010_priv *priv, u8 reg, u8 *val)
  {
+    u8 *b1=kmalloc(1,GFP_KERNEL);
         struct i2c_msg msg[2] = {
                 { .addr = priv->cfg->i2c_address,
                   .flags = 0, .buf = &reg, .len = 1 },
                 { .addr = priv->cfg->i2c_address,
-                 .flags = I2C_M_RD, .buf = val, .len = 1 },
+                 .flags = I2C_M_RD, .buf = b1, .len = 1 },
         };

         if (i2c_transfer(priv->i2c, msg, 2) != 2) {
                 dev_warn(&priv->i2c->dev, "%s: i2c rd failed reg=%02x\n",
                                 KBUILD_MODNAME, reg);
+           kfree(b1);
                 return -EREMOTEIO;
         }
+       *val=b1[0];
+       kfree(b1);
         return 0;
  }

-- 
2.30.2


