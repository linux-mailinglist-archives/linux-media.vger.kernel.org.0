Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 577ACD2855
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 13:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbfJJLos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 07:44:48 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44496 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfJJLor (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 07:44:47 -0400
Received: by mail-ed1-f68.google.com with SMTP id r16so5135737edq.11;
        Thu, 10 Oct 2019 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1IeTS6OtaGl5r6kl4QmygEE+/0UdRFkwKzXgXVrqazc=;
        b=gF6XnRs9Zto3s9HYwDC5Zil9rW4OO51oO/A+LSgFP1z6gcfXlBWGz495Nd8jf0NnPP
         P6Yw1LlLJDbUDmHfcjim696KDyol7o1w8DHWW8de8pvTZTmuSf6WaHGunlfI1KO/tlCH
         Vq7PaVEB3hotxLb8O4ZUgoGgqH4IuBgTOP/Th7U4GEPPUQyuYeu6YH2btN0+nTdi4757
         rIOUzqt8i6n0QwkZDbkWaUVvhwzS24kYGrCHLBbht37r0zE06EycLMkTXbMusrBjMbI8
         7oTNn93nzr47OvYOdVj+QnM0MNnEd4tDVhlLtGR+mE8KtAhWKmwq8ABJOFtOZ1yJ4FMZ
         OAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1IeTS6OtaGl5r6kl4QmygEE+/0UdRFkwKzXgXVrqazc=;
        b=r4JnBngrxW6DjUedHa8x70irNGcPapHYPspbM0Hm80S/1DKTf1srbAA1ycs7Q9IIjD
         Qy+1I4+JRwcA+tO3FQmyNYrwv+qYS2J/SRsgajYofWyuBERmUT+SZbZeBukJyNMdPt7N
         EiLiKrcaAyVCIJVw5s1JdQGGeaZve25618l2qDPI7uBGcdFfDIUDBQacjdcamlrM4wyj
         ywadtwOv+3FqOt2tw11pWbLD+RWODxBRvsyW+ExGyhq28ACub4HvEyPRs4SPfXfwtC/v
         E6MQuGOmI4XpHC+HzgdFY8VFe6AZ4rEzYqv0CgCAcWzCcfqJPOubEkVrlNKkaoafkqbR
         l2ZA==
X-Gm-Message-State: APjAAAUrxAuZftlpBPooRJiRIPY+2vRMjCsqYwCV2aDvGnwiQKDUfyPZ
        t0RWMDrSKOT21NPDYtwcPjU=
X-Google-Smtp-Source: APXvYqzh0ZScc5ATh9Zv+GUeRhfisrqwWOlOzjMrpFrVIiUawgUEGk1kjvJD3EE7H/T88BplgiF1JA==
X-Received: by 2002:a50:9a46:: with SMTP id o64mr7764794edb.191.1570707884368;
        Thu, 10 Oct 2019 04:44:44 -0700 (PDT)
Received: from Limone ([46.114.37.24])
        by smtp.gmail.com with ESMTPSA id jo12sm659875ejb.7.2019.10.10.04.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 04:44:43 -0700 (PDT)
Date:   Thu, 10 Oct 2019 13:44:40 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     linux-media@vger.kernel.org, mchehab@infradead.org, jp@jpvw.nl,
        crope@iki.fi, sean@mess.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] Add support for Logilink VG0022A.
Message-ID: <20191010114440.GA7902@Limone>
References: <20191010091848.GA2898@Limone>
 <20191010095103.3803-5-gonsolo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010095103.3803-5-gonsolo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

> "When the [...] firmware that came with the device is replaced
> by a new one, any I2C data received from the tuner will be
> replaced by 0xff.
> 
> Probably, the vendor firmware has some patch specifically
> designed for this device. So, we can't replace by the generic
> firmware.
> 
> The right solution would be to extract the [...] firmware from
> the original driver and ask the driver to load the specifically
> designed firmware, but, while we don't have that, the next best
> solution is to just keep the original firmware at the device."
 
The information in the patch is not totally correct. It is the
si2168(!) firmware download that confuses things, not the one for the
si2157. The si2157 seems to have no firmware and the problem is
that we used to bail out because we didn't recognize the bogus
chip id. The following patch corrects this.

Signed-off-by: <andreas.wendleder@gmail.com>

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 792667ee5ebc..5a2943e2932b 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -1621,17 +1621,20 @@ static int it930x_tuner_attach(struct dvb_usb_adapter *adap)
 	si2157_config.fe = adap->fe[0];
 
 	/*
-	 * HACK: The Logilink VG0022A has a bug: when the si2157
+	 * HACK: The Logilink VG0022A has a bug: When the si2168
 	 * firmware that came with the device is replaced by a new
 	 * one, the I2C transfers to the tuner will return just 0xff.
 	 *
 	 * Probably, the vendor firmware has some patch specifically
 	 * designed for this device. So, we can't replace by the
 	 * generic firmware. The right solution would be to extract
-	 * the si2157 firmware from the original driver and ask the
+	 * the si2157/68 firmware from the original driver and ask the
 	 * driver to load the specifically designed firmware, but,
 	 * while we don't have that, the next best solution is to just
 	 * keep the original firmware at the device.
+	 *
+	 * Or, the Windows driver includes the same hack and doesn't
+	 * bail out on bogus chip ids.
 	 */
 	if (le16_to_cpu(d->udev->descriptor.idVendor) == USB_VID_DEXATEK &&
 	    le16_to_cpu(d->udev->descriptor.idProduct) == 0x0100)
