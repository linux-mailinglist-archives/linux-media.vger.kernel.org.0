Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4878D8BB23
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 16:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729527AbfHMOGE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 10:06:04 -0400
Received: from jp.dhs.org ([62.251.46.73]:56884 "EHLO jpvw.nl"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729438AbfHMOGE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 10:06:04 -0400
X-Greylist: delayed 1162 seconds by postgrey-1.27 at vger.kernel.org; Tue, 13 Aug 2019 10:06:03 EDT
Received: from localhost ([127.0.0.1] helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.92)
        (envelope-from <jp@jpvw.nl>)
        id 1hxX8I-0000VP-2P; Tue, 13 Aug 2019 15:46:38 +0200
Subject: Re: MyGica T230 dvb-t2 data corruption since commit 5fa8815
To:     James Hutchinson <jahutchinson99@googlemail.com>
Cc:     Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Thomas Hollstegge <thomas.hollstegge@gmail.com>
References: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
 <20190719183542.GA25609@jpvw.nl>
 <CAD+OKUoCXV1LLM40Frm8VGoFDzhKmO__ALdsnttmfr=nueBFAg@mail.gmail.com>
From:   JP <jp@jpvw.nl>
Message-ID: <2dcec967-35b0-315c-4cdf-0bcfe8e71cbc@jpvw.nl>
Date:   Tue, 13 Aug 2019 15:46:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAD+OKUoCXV1LLM40Frm8VGoFDzhKmO__ALdsnttmfr=nueBFAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks James, my tests on both DVB-T and DVB-C all went OK.

So, with the t230 driver in cxusb broken for one hw version of
the device and both hw versions now working fine in dvbsky &
the driver in cxusb does not crash itself anymore (did you test
that, James?) & everybody agrees I think this move to dvbsky
should be done.

Sean: some hunks from the 'remove from cxusb' patch won't
apply to linux-5.3 , because of the recent addition of the analogue
driver code to cxusb. So I now have 2 different 'remove from
cxusb'  patches. How do I proceed with that?

[one more remark below]

On 8/2/19 2:00 PM, James Hutchinson wrote:
> Hi Jan,
>
> I've been running for a couple of weeks now with your two patches applied:
>
> 1) dvbsky: add MyGica T230
> 2) remove t230 from cxusb
>
> Everything has been working perfectly - the checksum errors when
> scanning muxes have gone, and streaming has been working nicely.
>
> Tested-by: James Hutchinson <jahutchinson99@googlemail.com>
>
> Regards,
> James
>
> On Fri, 19 Jul 2019 at 19:35, Jan Pieter van Woerkom <jp@jpvw.nl> wrote:
>> dvbsky: add MyGica T230.
>> Moved from cxusb driver as that driver can't handle FX2 FIFO issue.
>>
>> Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
>> ---
>> diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
>> --- a/drivers/media/usb/dvb-usb-v2/dvbsky.c     2019-07-08 00:41:56.000000000 +0200
>> +++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c     2019-07-19 17:50:54.671341146 +0200
>> @@ -561,11 +561,18 @@
>>
>>          /* attach tuner */
>>          si2157_config.fe = adap->fe[0];
>> -       si2157_config.if_port = 0;
>> -
>> -       state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
>> +       if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230) {
>> +               si2157_config.if_port = 1;
>> +               state->i2c_client_tuner = dvb_module_probe("si2157", NULL,
>> +                                                  i2c_adapter,
>> +                                                  0x60, &si2157_config);
>> +       }
>> +       else {
Coding style: those last 2 lines should be:
         } else {
>> +               si2157_config.if_port = 0;
>> +               state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
>>                                                     i2c_adapter,
>>                                                     0x60, &si2157_config);
>> +       }
>>          if (!state->i2c_client_tuner) {
>>                  dvb_module_release(state->i2c_client_demod);
>>                  return -ENODEV;
>> @@ -787,6 +794,9 @@
>>          { DVB_USB_DEVICE(USB_VID_TERRATEC, USB_PID_TERRATEC_CINERGY_S2_R4,
>>                  &dvbsky_s960_props, "Terratec Cinergy S2 Rev.4",
>>                  RC_MAP_DVBSKY) },
>> +       { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230,
>> +               &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230",
>> +               RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>>          { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
>>                  &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
>>                  RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
Cheers,
Jan Pieter.
