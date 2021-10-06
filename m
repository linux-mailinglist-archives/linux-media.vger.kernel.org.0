Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A2A424818
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 22:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239377AbhJFUl0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 16:41:26 -0400
Received: from mailrelay3-3.pub.mailoutpod1-cph3.one.com ([46.30.212.12]:52570
        "EHLO mailrelay3-3.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231593AbhJFUlZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 16:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=20191106;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:cc:to:
         subject:from:from;
        bh=rjy7QMx+HG4fzwEuu/i7VAyuESPI+MiqfkC+7VugfOc=;
        b=HVebTVJ6FuNdZvEenHlyDKonCoYrZ55xjmjSq0cIwypTfnFD0X8sOB7BJSd2BcA7pRuwqBnJf8nIx
         4ShgKTJ0qrpthhH9XJM+d2KoyDgeD6hx+Hskox1O4KYh7imolNH7K3yoyyt1X+dsMYyfBi4+DgdLd3
         aWfVyzi8xSHzNeLA+55uTzZ0JuLKrasfaoaAyoadDR7MQvQYh8W+Q4xXo8IScDLl2znT+XAh7e6ZGo
         xXIvw2mKehd24iGSxnI+8nsniEk9fmOQz/kb2mdTbsqwOldWHuL6W/jBzXb7ToGh9UnN0CLOtbziO6
         MnEN2Hu9TggKxcp6NDegO+IhWSFSQ/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mida.se; s=rsa1;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:cc:to:
         subject:from:from;
        bh=rjy7QMx+HG4fzwEuu/i7VAyuESPI+MiqfkC+7VugfOc=;
        b=f47ZhspZravyLhK6W3sbPMqzLDAoziAXs74IoRNBj1h9Wk/Ouqy+3wYoL2JvS1ldGy3TZ7qxIyew6
         Wd9FwPsaJFttM940wN8+dAqt1Nfeu92KWOiXqARfw6cGVzDGLOwQhhowyVhbtIpG4Q1nChD8yZfdU0
         LnpEic0UfpHKRIARcTHMPHOWvqwh74Bmc84BBHrKtWyVFJYYK1b1UdT3zh4Mp+Ak/b0BAJIVCLbGz3
         JJYafYRX5XgixG30Fy5lq1iyDddp5b3XImwoTUw777Y52RLEIDjU3k54j3VoMROZKCONfBLDBtPEgc
         zGOV2Asw+KbdZXvW2WbMnbCfqG1ng7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=mida.se; s=ed1;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:cc:to:
         subject:from:from;
        bh=rjy7QMx+HG4fzwEuu/i7VAyuESPI+MiqfkC+7VugfOc=;
        b=jwsHlhoXnhQ6d876Rc8LqyV9J8JTO5SyPbiUgZokoSfcBHp9pTZWVDi8PWrH2dw9Ldr/h7TtY4a0s
         vI9wh4tAw==
X-HalOne-Cookie: b74c31112d7684c3e3bff4b64e722478836f3d7b
X-HalOne-ID: 815d8d1c-26e5-11ec-87a1-d0431ea8bb03
Received: from [192.168.1.108] (2.67.139.77.mobile.tre.se [2.67.139.77])
        by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 815d8d1c-26e5-11ec-87a1-d0431ea8bb03;
        Wed, 06 Oct 2021 20:39:30 +0000 (UTC)
From:   rkardell <rkardell@mida.se>
Subject: [PATCH] media: dvb: Solve problem with Terratec cinergyT2 when
 removed and reconnected, or after sleep.
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Message-ID: <ad0a926e-8c5f-eed7-5c3a-96453915ea09@mida.se>
Date:   Wed, 6 Oct 2021 22:39:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: sv-FI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Module used count is incremented 1 time but decremented 2 times by 
dvb_frontend.
This patch inhibit module used count to go to -1.


Signed-off-by: rkl099 <rkardell@mida.se>
---
  drivers/media/usb/dvb-usb/cinergyT2-core.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/dvb-usb/cinergyT2-core.c 
b/drivers/media/usb/dvb-usb/cinergyT2-core.c
index 23f1093d2..56f58b3f9 100644
--- a/drivers/media/usb/dvb-usb/cinergyT2-core.c
+++ b/drivers/media/usb/dvb-usb/cinergyT2-core.c
@@ -69,6 +69,7 @@ static int cinergyt2_frontend_attach(struct 
dvb_usb_adapter *adap)
      struct cinergyt2_state *st = d->priv;
      int ret;

+    try_module_get(THIS_MODULE);
      adap->fe_adap[0].fe = cinergyt2_fe_attach(adap->dev);

      mutex_lock(&d->data_mutex);
-- 
2.30.2


