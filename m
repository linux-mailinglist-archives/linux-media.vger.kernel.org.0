Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBE396F647
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 00:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfGUWEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jul 2019 18:04:00 -0400
Received: from jpvw.nl ([80.127.100.2]:59094 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbfGUWEA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jul 2019 18:04:00 -0400
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hpJvy-0007mO-2z; Mon, 22 Jul 2019 00:03:58 +0200
Subject: Re: MyGica T230 dvb-t2 data corruption since commit 5fa8815
To:     Sean Young <sean@mess.org>
Cc:     James Hutchinson <jahutchinson99@googlemail.com>,
        Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org,
        Thomas Hollstegge <thomas.hollstegge@gmail.com>
References: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
 <20190719183542.GA25609@jpvw.nl>
 <20190721182940.kclp27faukxxfc4d@gofer.mess.org>
From:   JP <jp@jpvw.nl>
Message-ID: <62bc916f-a586-17b5-b9f8-f543d56ea76b@jpvw.nl>
Date:   Mon, 22 Jul 2019 00:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190721182940.kclp27faukxxfc4d@gofer.mess.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

On 7/21/19 8:29 PM, Sean Young wrote:
> On Fri, Jul 19, 2019 at 08:35:42PM +0200, Jan Pieter van Woerkom wrote:
>> dvbsky: add MyGica T230.
>> Moved from cxusb driver as that driver can't handle FX2 FIFO issue.
> Well then it should be deleted from the cxusb driver. Also how well
> is this tested?
I'm watching DVB-T2 TV now  with this for a couple of days
and see no problems. Will test on DVB-C coming week.
James will also test coming week.

The driver in cxusb crashes the kernel when I remove the
stick while running. That is gone with this. I needed that.
Another advantage is one can switch off the RC. I needed
that too. And almost all code was already in dvbsky.

Yep it should be deleted from cxusb. I now blacklist that
module while testing.
> Thanks
> Sean
>
Thank you,
Jan Pieter.

>> Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
>> ---
>> diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
>> --- a/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-07-08 00:41:56.000000000 +0200
>> +++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c	2019-07-19 17:50:54.671341146 +0200
>> @@ -561,11 +561,18 @@
>>   
>>   	/* attach tuner */
>>   	si2157_config.fe = adap->fe[0];
>> -	si2157_config.if_port = 0;
>> -
>> -	state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
>> +	if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230) {
>> +		si2157_config.if_port = 1;
>> +		state->i2c_client_tuner = dvb_module_probe("si2157", NULL,
>> +						   i2c_adapter,
>> +						   0x60, &si2157_config);
>> +	}
>> +	else {
>> +		si2157_config.if_port = 0;
>> +		state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
>>   						   i2c_adapter,
>>   						   0x60, &si2157_config);
>> +	}
>>   	if (!state->i2c_client_tuner) {
>>   		dvb_module_release(state->i2c_client_demod);
>>   		return -ENODEV;
>> @@ -787,6 +794,9 @@
>>   	{ DVB_USB_DEVICE(USB_VID_TERRATEC, USB_PID_TERRATEC_CINERGY_S2_R4,
>>   		&dvbsky_s960_props, "Terratec Cinergy S2 Rev.4",
>>   		RC_MAP_DVBSKY) },
>> +	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230,
>> +		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230",
>> +		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>>   	{ DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
>>   		&mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
>>   		RC_MAP_TOTAL_MEDIA_IN_HAND_02) },

