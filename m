Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC4E3FAF20
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 01:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbhH2XwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Aug 2021 19:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhH2XwX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Aug 2021 19:52:23 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6413C061575
        for <linux-media@vger.kernel.org>; Sun, 29 Aug 2021 16:51:30 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id u1so3703803plq.5
        for <linux-media@vger.kernel.org>; Sun, 29 Aug 2021 16:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=triularity-org.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=J0TnTKjBzAssbRjWaMR9Kp1ntZM65mnDLx0xEXM1uys=;
        b=v2xgW/xFmGWwEMio7EtB65cvBNp2MiJ+7QZX9IuzTdzpMDierCYr1PfCN6SW6vsxP4
         vEJpD5EhTa2nbtlDa2zrrheLuLHOQDrJxOENdGp5tCVdRx68LYbIpnCqCUmAANFEKpJY
         sgJslRSKR6pRQ7ANWMF/nXyAydPp5XQ/tb3hyRDn+jIP7//5waEEz6j6SRJOenPwRWXb
         4BLn/tSDCZUbwtcxHtMMFb17oE8WiGH6qFi0zVF95TXQmllk6VFHLbR5De8/NCLBIdZE
         ZVIHiAuh+Jua+8cd6VF/12Hh4Bbz4BeCuBdRlNYgBfJfEEIzf5uC2xJUBKiGgZa6W4aE
         +tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=J0TnTKjBzAssbRjWaMR9Kp1ntZM65mnDLx0xEXM1uys=;
        b=uZkPtKDf0cto/J+j+FXp7hN/CP6vt/Hq93Ltbj8b9zZeeFO+9inb38y/ghUWoj+/jT
         pyEUkZEzig9ZYWd495U40p+2aqatOTSJrfkMsglHKc7nTrs2IWsllR+dX4DmGg7MNdBg
         6s7Z5i4jr+/oeqPFx5KQC8tYHCC6uDuYZxcXUvqdQynPRcNUEzjrSqrOQL7TnkD7bCpX
         hVA8kahQLyEJQ1h55QnWty3uY3rr9UjYzNH85yzYl80Clo+isWTUgao7i8Xk96imb3Pi
         M+UQ4l+RI0wWaRJTEErnFTcMICRhEZD3Q5CZ7X1CNU/ETVhdIhfPewvGivTiVXlGXOLi
         j9Cg==
X-Gm-Message-State: AOAM531t4bAVvZFz3vVzgb1SyzrqHQEeMaFPFcAqQhB6J61dj5H6M4Q8
        vcUO5C+rAKcUeje1OBxS+pnCDFv5RgZmCJMKDzc=
X-Google-Smtp-Source: ABdhPJwKfeg5xRn3N+1EmzdoPDniQdb8+x7+wCs0bxUAFVpwNQx2CKmMYyqN1KRWzYOYwjElQKOOzQ==
X-Received: by 2002:a17:90a:1b2a:: with SMTP id q39mr23118697pjq.219.1630281089909;
        Sun, 29 Aug 2021 16:51:29 -0700 (PDT)
Received: from [192.168.128.78] (c-73-225-34-148.hsd1.wa.comcast.net. [73.225.34.148])
        by smtp.gmail.com with ESMTPSA id w16sm13323245pff.130.2021.08.29.16.51.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 16:51:29 -0700 (PDT)
To:     linux-media@vger.kernel.org
From:   Chad Fraleigh <chadf@triularity.org>
Subject: [PATCH] gspca: Limit frame size to sizeimage.
Message-ID: <46deb378-7ca0-e0ae-8e1f-08d0506e5ea5@triularity.org>
Date:   Sun, 29 Aug 2021 16:51:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Limit frame size to what userland code expects. This can happen when 
cameras, such as Kensington VideoCAM, use fixed sized transfer packets 
which includes trailing junk in the final packet.

Signed-off-by: Chad Fraleigh <chadf@triularity.org>


diff --git a/drivers/media/usb/gspca/gspca.c 
b/drivers/media/usb/gspca/gspca.c
index 47d8f28bfdfc..770714c34295 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -444,6 +444,8 @@ void gspca_frame_add(struct gspca_dev *gspca_dev,
  	 * next first packet, wake up the application and advance
  	 * in the queue */
  	if (packet_type == LAST_PACKET) {
+		if (gspca_dev->image_len > gspca_dev->pixfmt.sizeimage)
+			gspca_dev->image_len = gspca_dev->pixfmt.sizeimage;
  		spin_lock_irqsave(&gspca_dev->qlock, flags);
  		list_del(&buf->list);
  		spin_unlock_irqrestore(&gspca_dev->qlock, flags);
