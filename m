Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3B99879A
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 01:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730260AbfHUXCk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 19:02:40 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:45657 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730022AbfHUXCk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 19:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3bWtD2b+tGg0XHoxAgH7cCR0NBw7lNaMSmvwqKVI8C4=; b=DUcTB8AyEUxjujj9x5L3Xso8qj
        Cd6WH07qo+i/poTUuNiGunvAwwHmHLim9numjqsce1/l1zKbwFrHV5yZXl85KZY0kkKTYGC380uqB
        cTHC+tWriYpeTBvTWcXPa3D24KN5WI51RfqPowdbt3pruTNNtOZqF7EWZBDcsotQ5pg3O8HXnR0K4
        87wbJAFdZPPlRbcBvuOrYZ7h4o2TSEfvX8bhOB5bK4Z5HrpAmylCoWiozbCRulVKpLZm/r2+LlWu7
        j7w8XhyukjTmyW7nhkhRx+hGDO2Y/n84WOXzZEyxSZt/N4E4GAV76rc2DzSooA+Q+/+wkItN4V8p8
        74cCm/dg==;
Received: from dvbz8cyyyyyyyyyyyy5hy-3.rev.dnainternet.fi ([2001:14ba:8869:c100::64c] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1i0Zci-0004hR-Gd; Thu, 22 Aug 2019 02:02:36 +0300
Subject: Re: [PATCH] dvb-usb-v2/gl861: fix wrong memcpy
To:     Akihiro TSUKADA <tskd08@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sean Young <sean@mess.org>
References: <98cb0a1c-0db8-951b-80e1-12756678db9a@xs4all.nl>
 <6c2806fe-f104-84bf-21b8-21df9b3112cf@gmail.com>
 <20190815220811.6ba32749@coco.lan>
 <df8060a6-9666-3dd1-e041-620891970e7c@gmail.com>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <fe4da71a-c562-e58e-9b1c-acb6853d9005@iki.fi>
Date:   Thu, 22 Aug 2019 02:02:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <df8060a6-9666-3dd1-e041-620891970e7c@gmail.com>
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


On 8/17/19 4:22 PM, Akihiro TSUKADA wrote:
>> Could you please test the patch and check if the return results are
>> now consistent and that it won't break anything?
> 
> I have tested the patch and it worked without problems.
> 
> Testd-by: Akihiro Tsukada <tskd08@gmail.com>
> 
> I could not noticed the bug because
> the device was registered without any error messages,
> and it seemed to work even with the bug.
> (Though actually I was wrong and missed that
>   the device does not work after reboot or re-plugging).
> 
> After applying this patch, I have confirmed that the device
> now works after reboot/re-plugging without any problems.
> 
> note:
> The patched func: gl861_i2c_read_ex was used in device's early init,
> called from d->props->power_ctrl (from dvb_usbv2_init).
> But dvb_usbv2_init does not check the return value of it,
> and if the device had been initialized previously
> it can work even with the interrupted init process in power_ctrl().


I suspect all whole friio_reset() function is not needed as it has 
worked even I/O has been broken.

Also tuner I2C adapter is implemented wrong (I think I mentioned that 
earlier). As tuner sits behind demod I2C-adapter/gate that whole logic 
should be on demod driver.

regards
Antti



-- 
http://palosaari.fi/
