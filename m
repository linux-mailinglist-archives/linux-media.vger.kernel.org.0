Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63CD8DABCB
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 14:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393088AbfJQMPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 08:15:55 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:53481 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731634AbfJQMPz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 08:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
        References:To:Subject:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
        :List-Post:List-Owner:List-Archive;
        bh=twhSvuCN7qBP8yV0alNeK8pU3KPZ1B6B0ABJ/1XVFgQ=; b=Nrrx1jelxlm2MWr7W/DGNPP8dv
        1FCOlw/Xvn1BE0Q4CKGYKTQdtE/t9CFWW9CfaUR4fvHknLcGwC5/hOYsWnK+aEld3wPG3l9feUSgH
        IP865jSd4MicQEos7tpdcRN32pwExKFDH7IbHj0dXKiJ4pszb8i0rR6ggijaDbRFSwk38D74GiaoR
        tHalg4lP9Xb32n+hyFbWrEWnkGFkXMraHQiEG1CmpGMGe6gnt16YW+x0qCEPOiAwQNm3rQ7c0+BIb
        viNA9MxYsKn/JvQBcHlhBtQnyTBpxf5ZvvX/gNeMBF8VCZV6eow/VNpIwZGmdXrLg6u1imNbFckiQ
        AMD+4Pwg==;
Received: from dvbz8cyyyyyyyyyyyyt3t-3.rev.dnainternet.fi ([2001:14ba:8869:c100::42f] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1iL4h6-000355-5r; Thu, 17 Oct 2019 15:15:52 +0300
Subject: Re: Logilink VG0022A firmware/si2157 probe
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org
References: <20191017090837.GA26546@gofer.mess.org>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <07eae3df-5df1-eda4-8142-b228dc34b16c@iki.fi>
Date:   Thu, 17 Oct 2019 15:15:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191017090837.GA26546@gofer.mess.org>
Content-Type: multipart/mixed;
 boundary="------------F888F70E36FDA36B00C8960C"
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:14ba:8869:c100::42f
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------F888F70E36FDA36B00C8960C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 10/17/19 12:08 PM, Sean Young wrote:
> Hi Antti,
> 
> I have a Logilink VG0022A device which is an af9035.c type device (with
> ITE 9xxx frontned). The probe of the si2146 tuner fails and returns 0xffs.
> 
> Now I would like to work on fixing this. Mauro suggested the firmware might
> be incorrect. Any tips on extracting the firmware? I can try and dump
> usb traffic from Windows and see what firmware is being used there. How did
> you extract the firmware?
> 
> Any other suggestions for this device? You might be able to save me a lot
> of time since you have experience with these types of devices, I do not.

Extracting firmware is done almost always by following steps:
1) take sniffs from the some bus (usb/i2c)
2) identify firmware download section, detect it starting point and 
ending point ~few first and last bytes
3) find that firmware binary located inside of binary driver
  * grep, hexeditor, etc
  * example LANG=C grep -obUaP "\x08\x05\x00" driver.sys
4) use dd command to copy firmware blob from binary driver to separate 
file (you need to know firmware location and length inside binary)


It is also possible to dump firmware to file from bus sniffs too, but it 
requires writing some simple script. Dumping it from the binary driver 
is usually still most easiest way.

At some point I downloaded bunch of drivers to find out multiple 
firmware versions for si2168 and made simple script to ease things. 
Script is attached.


After all, I suspect root of issue may be still be buggy i2c...


regards
Antti

-- 
http://palosaari.fi/

--------------F888F70E36FDA36B00C8960C
Content-Type: text/x-python; charset=UTF-8;
 name="si2168_extract_firmware.py"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="si2168_extract_firmware.py"

#!/usr/bin/env python
# Silicon Labs Si2168 firmware extractor.
# Copyright (C) 2015 Antti Palosaari <crope@iki.fi>
# Usage: si2168_extract_firmware.py binary_driver_name.sys

import sys
import struct
import md5

fread = file(sys.argv[1], 'rb')
binary = fread.read()
offset = 0

# Known firmware md5 and its version
fw_ver_tab = {
    '02c9b1e751f362621c649ea831410b61' : '4.0.7',
    'b2670d8ae5e3369fc71edbb98cdd8f6e' : '4.0.11',
    '8dfc2483d90282bbb05817fbbc282376' : '4.0.19',
    'c8e089c351e9834060e962356f8697b8' : '4.0.25',
}

while True:
    # Match 17-byte firmware header
    # 04 01 00 00 00 00 9a 41 05 1b af 33 02 1b 3e 7d 2a | A20 (not supported)
    # 08 05 00 xx xx xx xx xx xx 00 00 00 00 00 00 00 00 | B40
    offset = binary.find('\x08\x05\x00', offset)
    if offset == -1:
        print "Done"
        break

    if (binary[offset + 9:offset + 17] != '\x00\x00\x00\x00\x00\x00\x00\x00'):
        offset = offset + 1
        continue

    print "Possible 17-byte Si2168-B40 firmware header found at 0x%x" % (offset)

    fw_filename = 'dvb-demod-si2168-b40-01.fw_' + str(offset)
    fw_write = open(fw_filename, 'wb')
    fw_md5 = md5.new()

    while True:
        fields = struct.unpack("B", binary[offset])
        fw_data_len = fields[0]
        # Firmware chunk first byte tells bytes to upload - 16 is max
        if fw_data_len == 0 or fw_data_len > 16:
            break

        # Check remaining (unused) bytes on firmware 17-byte chunk are all zero
        data_valid = True
        for x in range(offset + fw_data_len + 1, offset + 17):
            if (binary[x] != '\x00'):
                data_valid = False
                break

        if data_valid == False:
            break

        # Firmware chunk validated, write it to file
        fw_write.write(binary[offset + 0:offset + 17])
        fw_md5.update(binary[offset + 0:offset + 17])
        offset = offset + 17

    fw_write.close()

    if fw_md5.hexdigest() in fw_ver_tab:
        fw_ver = fw_ver_tab[fw_md5.hexdigest()]
    else:
        fw_ver = '<unknown>'

    print "Firmware md5 '%s'" % (fw_md5.hexdigest())
    print "Firmware version '%s'" % (fw_ver)
    print "Firmware stored to file '%s'" % (fw_filename)

    offset = offset + 1

fread.close()


--------------F888F70E36FDA36B00C8960C--
