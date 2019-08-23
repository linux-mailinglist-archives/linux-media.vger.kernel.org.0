Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFA269B576
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 19:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389408AbfHWR2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 13:28:18 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46361 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732546AbfHWR2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 13:28:18 -0400
Received: by mail-pf1-f196.google.com with SMTP id q139so6849129pfc.13
        for <linux-media@vger.kernel.org>; Fri, 23 Aug 2019 10:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UOvUz1qtdvi6k6qz6cIYuaPyLJd4esPJ6YRubGlHw/s=;
        b=lIFRteBm7BnHktO7rSY6lzNDE9EA70S1O4dxCTw6J17rSDyneR5ILbsbogyqCQi+a3
         L8aXJEadIr9md/UlnDgQOi1Eq3xqfZHnw12N/eL4JFBA5AzMF/XLOqdLrX1ciqJaDX/K
         T7mtTY6YwPv+HH7BCDkTcQxmTr3Z1uGIS85RjAD1pENgMKxsTwK4fAovQfnunlgRWKAC
         lySIyW+ePwMUqoNjy0BvrTsnoMEv5JI6VtlJC51SL8XcCwltqu8NnIoUxo7a2RS3wx80
         DoJqt9xVrmQsz28OpxQTncykfjDoM2CgGkjTMMgS1llefethzFBI/9LOFt+RhpN+VHJs
         AhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UOvUz1qtdvi6k6qz6cIYuaPyLJd4esPJ6YRubGlHw/s=;
        b=kWw/cpODLVL6Carqzl0HUbcXq+SjcfKQcbcXCWSRx+1wkiZweuTwyFHQIJxrLFcQ0V
         yvct2iZqZ3S9w7+kBLp6K7y28GDetDtOo9LAaNkmneRRW8kNzDN8KUt/I5NaE9M1Sqqr
         IhRsq0PlOhV7LPE+qPQazAjKmN1EpeDQt/likbY3CUPsV7YRLgEZ6p+m4X6xhnqNR2fF
         HoPM/yb51AKAei8iOyuhclIQNeslGfOP04pFwOFwEjh/WE2RSHQxaLEYu3gpd6cGwCha
         BnZVX6ukwuG4sglXvgfYMoSJSj9Z9yftuWW+VuhMjsz6I0bzC5hkYMF6Tir3vfTQJ38R
         j5yg==
X-Gm-Message-State: APjAAAUVOPegYb9POL3I6EUjbbTPYmE5jCSSVR1kQLS3yKh6CStclu1a
        jyuOT8YJhBOaD4uV3UAl11k=
X-Google-Smtp-Source: APXvYqwT032uaOZpf2q9m1sT8R2dkb6nmnDI07NiO6RxsxndvwSARp+EEZR7/IWoc1PTZZgquG456Q==
X-Received: by 2002:a63:1918:: with SMTP id z24mr4757664pgl.94.1566581297860;
        Fri, 23 Aug 2019 10:28:17 -0700 (PDT)
Received: from [192.168.3.4] (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.gmail.com with ESMTPSA id ck8sm2724398pjb.25.2019.08.23.10.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2019 10:28:17 -0700 (PDT)
Subject: Re: [PATCH] gl861: re-implement i2c adapter logic
To:     Antti Palosaari <crope@iki.fi>
Cc:     linux-media@vger.kernel.org, sean@mess.org, mchehab@kernel.org
References: <20190822053452.20168-1-crope@iki.fi>
 <e0052c5b-de39-8fd6-abd8-3cc38d6f21ee@iki.fi>
From:   Akihiro TSUKADA <tskd08@gmail.com>
Message-ID: <3d2278c5-75a5-7a49-fd36-16e44fbc8849@gmail.com>
Date:   Sat, 24 Aug 2019 02:28:14 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e0052c5b-de39-8fd6-abd8-3cc38d6f21ee@iki.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, thanks for the example patch.

> Here is debug log I tested multibyte i2c writes using zl10353 demod. All
> returned bytes are not same, but it due to write only register bits I
> think.
> 
> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 50 00 01 00 <<< 03
> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 51 00 01 00 <<< 44
> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 52 00 01 00 <<< 46
> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 53 00 01 00 <<< 15
> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 54 00 01 00 <<< 0f
> dvb_usb_gl861 1-13:1.0: 5 | 40 03 00 1e 50 00 05 00 >>> 0c 77 aa bb cc
> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 50 00 01 00 <<< 0c
> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 51 00 01 00 <<< 77
> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 52 00 01 00 <<< aa
> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 53 00 01 00 <<< 3b
> dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 54 00 01 00 <<< 4c
> 
> 
> Now if you look your tuner i2c implementation...
> 
> buf[0] = msg->addr << 1;
> memcpy(buf + 1, msg->buf, msg->len);
> ret = usb_control_msg(d->udev, usb_sndctrlpipe(d->udev, 0),
> GL861_REQ_I2C_RAW, GL861_WRITE,
> priv->i2c_client_demod->addr << (8 + 1), 0xFE, buf, msg->len + 1, 2000);
> 
> ...it translates same.

Log of an 1-byte read from tuner in Friio looks like the following:
(re-formatted from my past post: https://patchwork.linuxtv.org/comment/92946/ )

40 03 00 30 fe 00 01 00 >>> c1  # command a read from the tuner@0x60 (hence 0xc1)
c0 02 00 30 00 01 01 00 <<< 7c  # get the result (return value: 0x7c)

so,
- One read is composed of *two* USB messages.
  (note that friio_tuner_i2c_xfer() does NOT combine the two I2C messages
   of one read, and issues separate USB message for each,
   contrary to gl861_i2c_master_xfer()).
- The second USB message uses CMD_READ but
  'index'(demod register addr) value exceeds 8bit (0x0100),
  thus cannot use the normal gl861_i2c_master_xfer() as is.

It looks to me different.

Regards,
Akihiro
