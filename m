Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1ECE98AEC
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 07:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731361AbfHVFss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 01:48:48 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:51065 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727781AbfHVFss (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 01:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/mBTzRnU2k234HaDE06v/+5dkLIzvBLhJ4/QXn+7ERI=; b=Z/tZSCEykJwPwt3BDZ3v0tFvIh
        QKGBZuO2GEZ4ewIa05rtznighzfRXPLY6qHLMPbWpNxrpqlvSBRZ87jAdcCKCJQgq8z3TpHMLTB8W
        UMMymrSGiolCgKNCHxh20PZAzynhh/K5eM5vDh2QgORQf8Q0CRHycXBNFERKxdrxtbcR9ZCHSRn2M
        eaOAfUkmADkvxSfhpEi23LSI4RIOi+mUC9bvaepTi72gjhcTGAwsuVyJcSU6UWF93DtDkeSX6baB+
        bIJosmphSjXjINdkU8YMv5bgN/uQHPZGM2c7P4YN/MIsphUKSGoF2tUXfTvsDUxLh7rQRRvMOuIwO
        C5ZOwYhw==;
Received: from dvbz8cyyyyyyyyyyyy5hy-3.rev.dnainternet.fi ([2001:14ba:8869:c100::64c] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1i0fxm-0003gD-FP; Thu, 22 Aug 2019 08:48:46 +0300
Subject: Re: [PATCH] gl861: re-implement i2c adapter logic
To:     Akihiro TSUKADA <tskd08@gmail.com>
Cc:     linux-media@vger.kernel.org
References: <20190822053452.20168-1-crope@iki.fi>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <e0052c5b-de39-8fd6-abd8-3cc38d6f21ee@iki.fi>
Date:   Thu, 22 Aug 2019 08:48:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822053452.20168-1-crope@iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:14ba:8869:c100::64c
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/22/19 8:34 AM, Antti Palosaari wrote:
> Device I2C adapter is capable of writing and reading large messages.
> For I2C writes there is 2 methods: simple for max 2 byte messages and
> usb_control_msg() with payload data for larger I2C messages. Add I2C
> adapter logic which selects suitable method according to message size.

Here is debug log I tested multibyte i2c writes using zl10353 demod. All 
returned bytes are not same, but it due to write only register bits I think.

dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 50 00 01 00 <<< 03
dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 51 00 01 00 <<< 44
dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 52 00 01 00 <<< 46
dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 53 00 01 00 <<< 15
dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 54 00 01 00 <<< 0f
dvb_usb_gl861 1-13:1.0: 5 | 40 03 00 1e 50 00 05 00 >>> 0c 77 aa bb cc
dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 50 00 01 00 <<< 0c
dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 51 00 01 00 <<< 77
dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 52 00 01 00 <<< aa
dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 53 00 01 00 <<< 3b
dvb_usb_gl861 1-13:1.0: 1 | c0 02 00 1e 54 00 01 00 <<< 4c


Now if you look your tuner i2c implementation...

buf[0] = msg->addr << 1;
memcpy(buf + 1, msg->buf, msg->len);
ret = usb_control_msg(d->udev, usb_sndctrlpipe(d->udev, 0), 
GL861_REQ_I2C_RAW, GL861_WRITE,
priv->i2c_client_demod->addr << (8 + 1), 0xFE, buf, msg->len + 1, 2000);

...it translates same.

It writes i2c message to demod which;
byte0 0xfe, demod register/cmd/mailbox for tuner i2c bus
byte1 tuner i2c address
byte2-n tuner i2c data


Antti


-- 
http://palosaari.fi/
