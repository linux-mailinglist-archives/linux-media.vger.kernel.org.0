Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5F54C9D0B
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 13:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbfJCLRt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 07:17:49 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59540 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729241AbfJCLRt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 07:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=E0Oh63oHhIbSzhlN17sqrOoPkjj5Y53xWSnvYbnZ9z4=; b=dy/V4f+t+E/ubISR+CLAauMVc
        tK3DMQMxloFI6m77U9n4BTKHG2UzzX0cdWLHVJp7El7SqBTM1Ackc988IWE8Z5O95cvFJW3IItqNm
        wG7VTSBQjlWBSmmsJkUt7WptsRiWp/no0EmKHsLKHTnLZzvh/IoSoaCYExZ3TdGWaBbYDD7K+W8Ft
        acVNvi66jAXd1sKCHarr6Ns6BmJak4r4sOwrmd/mr4fUCcI/HbdybYclZ7e4+GomREWSV9+zm3JE8
        pZXxJC2nfSiN7X+yt0MCmQDtQP0EswSWv1qPMLR+ddSOZ25S29X6WygfPdjgQRsJF/QSLbjXE0GAS
        iLUl75UEw==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFz7C-0002A4-Bh; Thu, 03 Oct 2019 11:17:46 +0000
Date:   Thu, 3 Oct 2019 08:17:42 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gonsolo <gonsolo@gmail.com>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003081742.0933264b@coco.lan>
In-Reply-To: <CANL0fFTwJ4yRO+5q6WkL0+DtwdrRti6r_WY1intisYJhs5En8w@mail.gmail.com>
References: <20191001205203.4b1a5fb6@coco.lan>
        <20191002141359.30166-1-gonsolo@gmail.com>
        <20191002141359.30166-2-gonsolo@gmail.com>
        <20191002142744.GA3475@gofer.mess.org>
        <CANL0fFS9TGKJH2rfkXzak78BaLazTNO7GoZhSb4vLBsDrmz3FQ@mail.gmail.com>
        <20191002150650.GA4227@gofer.mess.org>
        <CANL0fFRoL6NxOCbNC=XjQ6LDkeeqAayaLUbm9xARWX9ttqfPFg@mail.gmail.com>
        <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
        <20191002154922.7f1cfc76@coco.lan>
        <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
        <CANL0fFTwJ4yRO+5q6WkL0+DtwdrRti6r_WY1intisYJhs5En8w@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Oct 2019 12:57:50 +0200
Gonsolo <gonsolo@gmail.com> escreveu:

> Hi!
> 
> Boot time:
> 
> > [    5.380991] si2168 1-0067: firmware version: B 4.0.2  
> 
> When starting VLC:
> 
> > [  457.677363] si2168 1-0067: downloading firmware from file
> > 'dvb-demod-si2168-b40-01.fw'
> > [  458.631034] si2168 1-0067: firmware version: B 4.0.11
> > [  458.650309] si2157 2-0063: unknown chip version Si21255-\xff\xff\xff  
> 
> There are two different firmware versions, 4.0.2 and 4.0.11. Is that expected?

It means that there's a firmware stored at the device's eeprom
(version 4.0.2). When the driver starts, it downloads a newer firmware
from the file dvb-demod-si2168-b40-01.fw.

Btw, could you please try the enclosed hack and post the results?

Thanks,
Mauro

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index e87040d6eca7..3ccfd602934b 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -76,6 +76,7 @@ static int si2157_init(struct dvb_frontend *fe)
 	const struct firmware *fw;
 	const char *fw_name;
 	unsigned int uitmp, chip_id;
+	int i;
 
 	dev_dbg(&client->dev, "\n");
 
@@ -118,16 +119,32 @@ static int si2157_init(struct dvb_frontend *fe)
 			goto err;
 	}
 
-	/* query chip revision */
-	memcpy(cmd.args, "\x02", 1);
-	cmd.wlen = 1;
-	cmd.rlen = 13;
-	ret = si2157_cmd_execute(client, &cmd);
-	if (ret)
-		goto err;
+	for (i = 0; i < 10; i++) {
+		/* query chip revision */
+		memcpy(cmd.args, "\x02", 1);
+		cmd.wlen = 1;
+		cmd.rlen = 13;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		chip_id = cmd.args[1] << 24 | cmd.args[2] << 16 | cmd.args[3] << 8 |
+			  cmd.args[4] << 0;
 
-	chip_id = cmd.args[1] << 24 | cmd.args[2] << 16 | cmd.args[3] << 8 |
-			cmd.args[4] << 0;
+		if (chip_id != 0xffffffff)
+			break;
+
+		msleep(10);
+	}
+
+	if (i)
+		dev_info(&client->dev, "Needed to wait %i ms to get chip version", i * 10);
+
+	if (chip_id == 0xffffffff) {
+		dev_err(&client->dev, "Unable to retrieve chip version\n");
+		ret = -EINVAL;
+		goto err;
+	}
 
 	#define SI2177_A30 ('A' << 24 | 77 << 16 | '3' << 8 | '0' << 0)
 	#define SI2158_A20 ('A' << 24 | 58 << 16 | '2' << 8 | '0' << 0)

