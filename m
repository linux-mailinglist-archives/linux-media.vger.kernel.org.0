Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7EA9C9EDE
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 14:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730123AbfJCMwo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 08:52:44 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38174 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729086AbfJCMwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 08:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hSjVhr+TxHikgyvVbjZ6N9WzrVnc0qlIQP9JM8TUOps=; b=Z4Erw6duU0bxU9l15Y+cHI0xm
        iUBtS1mYOo8p7c97FykF8iobjrrFUOmWWHOg09tmzXGhjTwojC5dz8isxflrdmyV3PK/tE0eSrTxY
        wPzBjFL8hHNVA5EScf15Ic47XhawwTfd7E97CvaHfXYJWG9XyKHf1c35tHIiw7/kKbLYs8q4aZy+Y
        GJC2HySTMuik/BMed6Q9eIBbw3sUE9iaviFrDKgTfZvoyO7wXiS4NLQxchwuA4Rh5AdzW31UqDxrM
        vTAFbXO12vW7GULUQ7Fs1VvXoBbaHnFssdm4enfPW59lQLQxGoeNcXhd4VcIA7BbEU/9g1it1W8dd
        P7jcOLbYA==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iG0b3-00055F-H8; Thu, 03 Oct 2019 12:52:41 +0000
Date:   Thu, 3 Oct 2019 09:52:37 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gonsolo <gonsolo@gmail.com>
Cc:     JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191003095237.2efa0e7f@coco.lan>
In-Reply-To: <20191003094904.3aa5fdc7@coco.lan>
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
        <20191003081742.0933264b@coco.lan>
        <CANL0fFTtHn4ocL4BD4cVKhVzjLhnQ0a45yq5x4MxWAVu-tD8sw@mail.gmail.com>
        <20191003094904.3aa5fdc7@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Oct 2019 09:49:04 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Thu, 3 Oct 2019 13:41:23 +0200
> Gonsolo <gonsolo@gmail.com> escreveu:
> 
> > Hi!
> >   
> > > It means that there's a firmware stored at the device's eeprom
> > > (version 4.0.2). When the driver starts, it downloads a newer firmware
> > > from the file dvb-demod-si2168-b40-01.fw.    
> > 
> > Thanks for the explanation.
> >   
> > > Btw, could you please try the enclosed hack and post the results?    
> > 
> > Will do in a second.
> > 
> > FWIW, this hack worked:
> > 
> > diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
> > index e87040d6eca7..28a3a4f1640e 100644
> > --- a/drivers/media/tuners/si2157.c
> > +++ b/drivers/media/tuners/si2157.c
> > @@ -136,6 +136,7 @@ static int si2157_init(struct dvb_frontend *fe)
> >         #define SI2147_A30 ('A' << 24 | 47 << 16 | '3' << 8 | '0' << 0)
> >         #define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
> >         #define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
> > +       #define GONZO     (255 << 24 | 255 << 16 | 255 << 8 | 255 << 0)
> > 
> >         switch (chip_id) {
> >         case SI2158_A20:
> > @@ -148,6 +149,10 @@ static int si2157_init(struct dvb_frontend *fe)
> >         case SI2177_A30:
> >                 fw_name = SI2157_A30_FIRMWARE;
> >                 break;
> > +       case GONZO:
> > +               dev_info(&client->dev, "trying null\n");
> > +               fw_name = NULL;
> > +               break;
> >         case SI2157_A30:
> >         case SI2147_A30:
> >         case SI2146_A10:  
> 
> What does it print with this hack?
> 
> Also, could you get the SI version after the reset code at
> skip_fw_download, just after retrieving si2157 firmware version?

Maybe something like this would make it work?

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index e87040d6eca7..86d945fd50b9 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -129,6 +129,28 @@ static int si2157_init(struct dvb_frontend *fe)
 	chip_id = cmd.args[1] << 24 | cmd.args[2] << 16 | cmd.args[3] << 8 |
 			cmd.args[4] << 0;
 
+	if (chip_id == 0xffffffff) {
+		/* reboot the tuner  */
+		memcpy(cmd.args, "\x01\x01", 2);
+		cmd.wlen = 2;
+		cmd.rlen = 1;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		/* query chip revision */
+		memcpy(cmd.args, "\x02", 1);
+		cmd.wlen = 1;
+		cmd.rlen = 13;
+		ret = si2157_cmd_execute(client, &cmd);
+		if (ret)
+			goto err;
+
+		chip_id = cmd.args[1] << 24 | cmd.args[2] << 16 | cmd.args[3] << 8 |
+				cmd.args[4] << 0;
+
+	}
+
 	#define SI2177_A30 ('A' << 24 | 77 << 16 | '3' << 8 | '0' << 0)
 	#define SI2158_A20 ('A' << 24 | 58 << 16 | '2' << 8 | '0' << 0)
 	#define SI2148_A20 ('A' << 24 | 48 << 16 | '2' << 8 | '0' << 0)


Thanks,
Mauro
