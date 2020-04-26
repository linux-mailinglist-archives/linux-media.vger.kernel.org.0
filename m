Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505771B8F73
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 13:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgDZLi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 07:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgDZLiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 07:38:25 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C40CC061A0E
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2020 04:38:24 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z6so17059232wml.2
        for <linux-media@vger.kernel.org>; Sun, 26 Apr 2020 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=T7/qlr8UwK052/stusvKmDAFZOBAC/4+vE+6f4TjnTE=;
        b=Oz2jH4Q6O/QRX4itD53LD1G0bY9tZuIZf1D87x767DeM+SV2YSPXVKCvWG7+2UanyI
         4FqEoqi+Rc9lTV5vyDgxvvKvuJRzbzpnMIkn2jGO98jLOhjMOcjLtKrW8oSozRvKI2ZB
         hEo//TD0as1oEyQ+fbwEjC+c4GFG+RGqg8OKHLCe/PiiuLycUrUKxw6iHbleekUv04Jt
         OglynAt8IQOalBdHwNNpFBSfAEdWc7vSOG0kSW8XpeBaN0ASmbmDlzMcf5wuQeZ+O9IE
         qdpB8ZGyY1ravG5ShPYi0gvjacJsu66SxfEu33DgiK4yRBbr5DhzUdlPvFP+2J9lxL5w
         Fd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=T7/qlr8UwK052/stusvKmDAFZOBAC/4+vE+6f4TjnTE=;
        b=ndn3nhLi6aGvLHs/fUsCNlHxzP3Bld4bHWRdhmj3yRAmXnaeQm9spGKTr5+Ihl4xWl
         yLFmkB95ewYGJSLIwdD8BGgSk1/u9h8akUXPEo9XQEZJ6DlKeAQOsQjLNhfkwoHNauhZ
         CgC8WVqi1/y4PgE28o/8N5UvA/ryGSOPFecD1Qvjv0JbZNFu+CyMEaiCVO6TBVWL7ygj
         /IHKj+ID5jDUJmLHyL3dPkY1TP25n/uOgbRPT5oUKCYHG4f9CzwkXaKMN6bUW2Owlg2G
         U9UKXc78yJlOUd3JEcDy64t2J+/BjA/z4MJXtLQEcW9Ucty1mYnzTLkaZ3dbq1Ax6fsZ
         33Ng==
X-Gm-Message-State: AGi0PuaC9wYqnQ1VoOj9eqqI/b8/7dwlfvQyB1kjUHSZsQ8G4Lav5EWt
        rgc2zt6OYmKN+F3+6CXsUs/Q0KwIOes=
X-Google-Smtp-Source: APiQypI8mdXR6DgjrN1jO1Z+O3orN17aQ4r3WJy4ZqQNSlZ4qsS2oF6Wo/bI+xAE7AWcJtgvmYNpfw==
X-Received: by 2002:a1c:a90a:: with SMTP id s10mr19383770wme.99.1587901101916;
        Sun, 26 Apr 2020 04:38:21 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id i17sm16328595wru.39.2020.04.26.04.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 04:38:21 -0700 (PDT)
Subject: Re: atomisp kernel driver(s)
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <20200418172549.7cca07a7@coco.lan> <20200418172654.74a1eeea@coco.lan>
 <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
 <20200420013109.65babb54@coco.lan>
 <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
 <eb83f789-9595-55f0-d922-bab00ae85cff@gmail.com>
 <20200420224750.28c0181d@coco.lan>
 <dd8ab5df-31c7-f009-36e4-ca4fd0605e97@gmail.com>
 <20200422211344.2ec3d93e@coco.lan>
 <23b3a078-2a9a-5f50-a35e-9f40f5aa8a6e@gmail.com>
 <86413836-e4b5-cb53-3ac0-1764c693ec7b@gmail.com>
 <682558b0-a2cf-9fe2-6e54-20462ecccb5d@gmail.com>
 <20200425132255.4bf872b2@coco.lan>
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Message-ID: <131a4247-cef3-d651-a0ea-defd32b8bf20@gmail.com>
Date:   Sun, 26 Apr 2020 13:38:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425132255.4bf872b2@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 25.04.20 13:22, Mauro Carvalho Chehab wrote:
> Hi Patrik,
>
> Em Fri, 24 Apr 2020 12:07:30 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>
>> On 24.04.20 11:10, Patrik Gfeller wrote:
>>> On 24.04.20 10:52, Patrik Gfeller wrote:
>>>> On 22.04.20 21:13, Mauro Carvalho Chehab wrote:
>>>>> Em Wed, 22 Apr 2020 19:56:56 +0200
>>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>>>>   
>>>>>> On 20.04.20 22:47, Mauro Carvalho Chehab wrote:
>>>>>>> Em Mon, 20 Apr 2020 20:27:25 +0200
>>>>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>>>>>>> Me again ... sorry to ask such a basic question, but I can't get
>>>>>>>> your
>>>>>>>> modified source code. I get the following error:
>>>>>>>>       > git clone https://git.linuxtv.$ sudo make M=drivers/staging/media/atomisp/ modules_install
>>>>>>>> org/mchehab/experimental.git/
>>>>>>>> Cloning into 'experimental'...
>>>>>>>> warning: adding alternate object store:
>>>>>>>> https://git.linuxtv.org/git/linux.git/
>>>>>>>> warning: adding alternate object store:
>>>>>>>> https://git.linuxtv.org/git/media_tree.git/
>>>>>>>> warning: adding alternate object store:
>>>>>>>> https://git.linuxtv.org/git/linux.git/
>>>>>>>> error: Unable to find fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f under
>>>>>>>> https://git.linuxtv.org/mchehab/experimental.git
>>>>>>>> Cannot obtain needed object fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f
>>>>>>>> while processing commit 6d80bfc14608f4bb5514b79721d30b486f50c987.
>>>>>>>> error: fetch failed.
>>>>>>>>
>>>>>>>> Do I use the wrong command?
>>>>>>> Better to use git:// url:
>>>>>>>
>>>>>>>      git clone git://git.linuxtv.org/mchehab/experimental.git/
>>>>>> I was able to download and compile the code. I installed the kernel
>>>>>> and
>>>>>> tried to boot; unfortunately it hangs with the message "Loading
>>>>>> initial
>>>>>> ramdisk ..." - after I start the old kernel I check kern.log and
>>>>>> syslog
>>>>>> - but I do not see entries from the failed boot attempt. I'll read
>>>>>> into
>>>>>> the topic and try around. This will take some time ... so there
>>>>>> will be
>>>>>> a dealy, but it's not that I do not care or lacking interest, I just
>>>>>> first have to sort this out.
>>>>> Well, try to build it first without the atomisp driver. This would
>>>>> allow
>>>>> you to see what's going on.
>>>> I was able to solve the problem I had with the ramdisk - I had to
>>>> strip the kernel modules, probably the ramdisk file was too big.
>>>>
>>>> It is possible to boot with the atomisp driver, but I can not see the
>>>> camera yet - but maybe that's due to missing firmware, as there were
>>>> warnings when I installed the kernel that firmware files are missing.
>> I've added the missing firmware files and now I do not have warnings
>> when I create the ramdisk. Unfortunately it makes no difference - the
>> device does not work yet (dmesg looks the same).
>>>> The following I found in dmesg:
>>>>
>>>> [    9.331011] kernel: atomisp_ov2680: module is from the staging
>>>> directory, the quality is unknown, you have been warned.
>>>> [    9.402456] kernel: ov2680 i2c-OVTI2680:00: gmin: initializing
>>>> atomisp module subdev data.PMIC ID 1
>>>> [    9.421113] kernel: acpi OVTI2680:00: Failed to find gmin variable
>>>> OVTI2680:00_CamClk
>>>> [    9.433478] kernel: acpi OVTI2680:00: Failed to find gmin variable
>>>> OVTI2680:00_ClkSrc
>>>> [    9.443146] kernel: acpi OVTI2680:00: Failed to find gmin variable
>>>> OVTI2680:00_CsiPort
>>>> [    9.456677] kernel: acpi OVTI2680:00: Failed to find gmin variable
>>>> OVTI2680:00_CsiLanes
>>>> [    9.479411] kernel: ov2680 i2c-OVTI2680:00: supply V1P8SX not
>>>> found, using dummy regulator
>>>> [    ...
>>>> [    9.510282] kernel: ov2680 i2c-OVTI2680:00: supply V2P8SX not
>>>> found, using dummy regulator
>>>> [    ...
>>>> [    9.532284] kernel: ov2680 i2c-OVTI2680:00: supply V1P2A not
>>>> found, using dummy regulator
>>>> [    9.536200] kernel: ov2680 i2c-OVTI2680:00: supply VPROG4B not
>>>> found, using dummy regulator
>>>> [   ...'
>>>> [    9.592064] kernel: ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
>>>> [    9.623628] kernel: ov2680 i2c-OVTI2680:00: camera pdata: port: 0
>>>> lanes: 1 order: 00000002
>>>> [    9.628258] kernel: ov2680 i2c-OVTI2680:00: sensor_revision id =
>>>> 0x2680, rev= 0
>>>> [    9.636582] kernel: ov2680 i2c-OVTI2680:00: register atomisp i2c
>>>> module type 1
>>>>
>>>> The first signs of live :-) ... I'll try to find the firmware files
>>>> to see if it makes a difference.
> Atomisp driver uses ACPI to detect the camera configuration. As you
> can see at drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:
>
> 	static const struct acpi_device_id ov2680_acpi_match[] = {
> 	        {"XXOV2680"},
> 	        {"OVTI2680"},
> 	        {},
> 	};
> 	MODULE_DEVICE_TABLE(acpi, ov2680_acpi_match);
>
> The regulator data is parsed at
> drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:
>
>          if (pmic_id == PMIC_REGULATOR) {
>                  gmin_subdevs[i].v1p8_reg = regulator_get(dev, "V1P8SX");
>                  gmin_subdevs[i].v2p8_reg = regulator_get(dev, "V2P8SX");
>                  gmin_subdevs[i].v1p2_reg = regulator_get(dev, "V1P2A");
>                  gmin_subdevs[i].v2p8_vcm_reg = regulator_get(dev, "VPROG4B");
>
>                  /* Note: ideally we would initialize v[12]p8_on to the
>                   * output of regulator_is_enabled(), but sadly that
>                   * API is broken with the current drivers, returning
>                   * "1" for a regulator that will then emit a
>                   * "unbalanced disable" WARNing if we try to disable
>                   * it.
>                   */
>          }
>
> There are two things that could be the cause of this issue:
>
> 1) Some patch could have broken support for it.
>
> Doing a:
>
> 	git diff a49d25364dfb drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
>
> will allow you to check the changes on this file.
>
> 2) Maybe recent BIOSes may have changed the names of the ACPI variables.
>
> For instance, from the code, the driver should be seeking for those
> variables for OV2680 (and several others that seem to be common among
> multiple combinations):
>
> 	XXOV2680:00_CsiPort
> 	XXOV2680:00_CsiLanes
> 	XXOV2680:00_CamClk
>
> It would be possible, that, on a modern BIOS, such vars were, for example,
> renamed to 'XXOV2680_V2*'.

Thank you for the explanations. I've read the article about ACPI and 
have now a basic idea what it is.

I tried to figure out if the ACPI variable names changed ... in the ACPI 
dump the variables seem to match the code (if I understood correctly). I 
tried to scan the firmware file to check if there's a hint regarding a 
changed variable:

$ strings shisp_2401a0_v21.bin | grep 2680
$ strings shisp_2401a0_v21.bin | grep OV

But found not matches. I then checked the android source code to check 
if I find the information in their code (as there is kind of a atomisp 
driver). But unfortunately I was not able to find the ACPI code and a 
simple search for 2680 did not find anything. Next I downloaded a 
windows driver and searched all the files for 2680:

$ ls | xargs strings | grep 2680
OV2680
D:\work\vied-vieddrv-camerasw_base\Source\Camera\Platform\SKYCAM\DriversOutput\ov2680\ov2680_Release_x64\ov2680.pdb
OV2680
OV2680

This did not find something useful, - had expected to find OVTI2680.

I wonder if it fails to load the variable because it can not load the 
firmware - what would surprise me, as if I understood the ACPI thing 
correctly, that information should be available without firmware ...

Apr 26 12:35:42 ASUS kernel: [ 3731.387524] acpi OVTI2680:00: Failed to 
find gmin variable OVTI2680:00_CamClk
Apr 26 12:35:42 ASUS kernel: [ 3731.388195] acpi OVTI2680:00: Failed to 
find gmin variable OVTI2680:00_ClkSrc
Apr 26 12:35:42 ASUS kernel: [ 3731.388855] acpi OVTI2680:00: Failed to 
find gmin variable OVTI2680:00_CsiPort
Apr 26 12:35:42 ASUS kernel: [ 3731.389541] acpi OVTI2680:00: Failed to 
find gmin variable OVTI2680:00_CsiLanes

However, I tried to find out if the firmware is actually loaded and 
found that the filename was correct, but the actual version string in 
the firmware was not. I tried to find the correct firmware, but could 
not find it. I hoped for a stable interface and changed the version 
string in the code to match my firmware. No change in behavior. To check 
if it actually loads the firmware I searched the code and found in file 
sh_css_firmware.c some code that seems to be related: 
sh_css_load_firmware. In case of a version mismatch I expect a debug 
message:

     if (!valid_firmware)
     {
#if !defined(HRT_RTL)
         IA_CSS_ERROR("CSS code version (%s) and firmware version (%s) 
mismatch!",
                  file_header->version, release_version);
         return IA_CSS_ERR_VERSION_MISMATCH;
#endif
     } else
     {
         IA_CSS_LOG("successfully load firmware version %s", 
release_version);
     }

Surprisingly I do not see either of the two message with dmesg or in 
kern.log. I assumed that it is necessary to activate those debug 
messages somehow - but could not figure out how. During my research I 
found printk - so I added a printk just after a message I see in dmesg 
as a 1st test (my plan was to use it later to log if the firmware is 
loaded, or not):

     dev_info(dev,
          "gmin: initializing atomisp module subdev data.PMIC ID %d\n",
          pmic_id);

     pr_err("printk Hello World");

I did not find the message in dmesg, nor kern.log. So I increased the 
loglevel:

$ echo 8 | sudo tee /proc/sys/kernel/printk

But still no result. Maybe I didn't recompile the module the right way 
(did not compile the full kernel):

$ make clean M=drivers/staging/media/atomisp/
$ make -j4 M=drivers/staging/media/atomisp/
$ sudo make M=drivers/staging/media/atomisp/ modules_install
$ sudo depmod -a
$ sudo rmmod atomisp-ov2680
$ sudo modprobe atomisp-ov2680

Currently I'm a little confused, as this printk thing did not work. I'll 
investigate further to see where I did the mistake.

kind regards,

Patrik

>
> -
>
> In any case, I guess the next step is to use some ACPI dump facility to check
> how your BIOS is exporting camera-related data[1].
>
> If the vars are the same, then there's a bug (condition 1) above. If
> the vars are different, then some vars were added or renamed (condition 2).
>
> With such information, you should be able to write a patch to
> atomisp_gmin_platform.c adding support for the new way. Please notice that,
> in the case of renames, the patch should keep support to the old way, as
> otherwise support for other older hardware would break.
>
> Using the file you sent, I decoded the DTST table and paste the relevant
> parts for this camera, using:
>
> 	$ acpixtract /tmp/dmp/acpidump.txt
> 	$ iasl -d dsdt.dat
>
> Now, we need to compare what it provides with what the code expects.
> On a quick check, it seems that it provides those info about the sensor:
>
>
>                      Local0 = Package (0x12)
>                          {
>                              "CamId",
>                              "ov2680",
>                              "CamType",
>                              "1",
>                              "CsiPort",
>                              "0",
>                              "CsiLanes",
>                              "1",
>                              "CsiFmt",
>                              "15",
>                              "CsiBayer",
>                              "0",
>                              "CamClk",
>                              "1",
>                              "Regulator1p8v",
>                              "0",
>                              "Regulator2p8v",
>                              "0"
>                          }
>
> The regulator code seems to be expecting something different:
>
>                  gmin_subdevs[i].v1p8_reg = regulator_get(dev, "V1P8SX");
>                  gmin_subdevs[i].v2p8_reg = regulator_get(dev, "V2P8SX");
>                  gmin_subdevs[i].v1p2_reg = regulator_get(dev, "V1P2A");
>                  gmin_subdevs[i].v2p8_vcm_reg = regulator_get(dev, "VPROG4B");
>
> Maybe if we add something like:
>
> 	if (IS_ERR(gmin_subdevs[i].v1p8_reg))
> 		gmin_subdevs[i].v1p8_reg = regulator_get(dev, "Regulator1p8v");
>
> 	if (IS_ERR(gmin_subdevs[i].v2p8_reg))
> 		gmin_subdevs[i].v2p8_reg = regulator_get(dev, "Regulator2p8v");
>
> It would be able to properly initialize the regulators.
>
> [1] Please take a look on this article:
>
> 	https://blog.fpmurphy.com/2014/12/decompiling-acpi-tables.html
>
>      It explains how to transform an ACPI table dump into something useful.
>
>      Basically, ACPI contains some code that the OSes run in order to get
>      information about some devices.
>
> Thanks,
> Mauro
>
>          Device (CAM1)
>          {
>              Name (_ADR, Zero)  // _ADR: Address
>              Name (_HID, "OVTI2680")  // _HID: Hardware ID
>              Name (_CID, "OVTI2680")  // _CID: Compatible ID
>              Name (_SUB, "13A01043")  // _SUB: Subsystem ID
>              Name (_DDN, "OV2680")  // _DDN: DOS Device Name
>              Name (_UID, One)  // _UID: Unique ID
>              Name (_DEP, Package (0x02)  // _DEP: Dependencies
>              {
>                  I2C7,
>                  ^^I2C7.PMI2
>              })
>              Name (_PR0, Package (0x03)  // _PR0: Power Resources for D0
>              {
>                  P28T,
>                  P18D,
>                  CLK4
>              })
>              Name (PLDB, Package (0x01)
>              {
>                  Buffer (0x14)
>                  {
>                      /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
>                      /* 0008 */  0x61, 0x0C, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00,  // a.......
>                      /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
>                  }
>              })
>              Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
>              {
>                  Return (PLDB) /* \_SB_.PCI0.I2C3.CAM1.PLDB */
>              }
>
>              Method (_STA, 0, NotSerialized)  // _STA: Status
>              {
>                  Return (0x0F)
>              }
>
>              Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>              {
>                  Name (SBUF, ResourceTemplate ()
>                  {
>                      GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>                          "\\_SB.GPO1", 0x00, ResourceConsumer, ,
>                          )
>                          {   // Pin list
>                              0x0037
>                          }
>                      I2cSerialBusV2 (0x0036, ControllerInitiated, 0x00061A80,
>                          AddressingMode7Bit, "\\_SB.PCI0.I2C3",
>                          0x00, ResourceConsumer, , Exclusive,
>                          )
>                  })
>                  Return (SBUF) /* \_SB_.PCI0.I2C3.CAM1._CRS.SBUF */
>              }
>
>              Name (C1CD, Buffer (0x0220){})
>              Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>              {
>                  If ((Arg0 == ToUUID ("dc2f6c4f-045b-4f1d-97b9-882a6860a4be")))
>                  {
>                      Local0 = Package (0x12)
>                          {
>                              "CamId",
>                              "ov2680",
>                              "CamType",
>                              "1",
>                              "CsiPort",
>                              "0",
>                              "CsiLanes",
>                              "1",
>                              "CsiFmt",
>                              "15",
>                              "CsiBayer",
>                              "0",
>                              "CamClk",
>                              "1",
>                              "Regulator1p8v",
>                              "0",
>                              "Regulator2p8v",
>                              "0"
>                          }
>                      Return (Local0)
>                  }
>
>                  If ((Arg0 == ToUUID ("377ba76a-f390-4aff-ab38-9b1bf33a3015")))
>                  {
>                      Return ("OVTI2680")
>                  }
>
>                  If ((Arg0 == ToUUID ("3c62aaaa-d8e0-401a-84c3-fc05656fa28c")))
>                  {
>                      Return ("OV2680")
>                  }
>
>                  If ((Arg0 == ToUUID ("822ace8f-2814-4174-a56b-5f029fe079ee")))
>                  {
>                      Return ("CIFF2192")
>                  }
>
>                  If ((Arg0 == ToUUID ("2959512a-028c-4646-b73d-4d1b5672fad8")))
>                  {
>                      If ((BDID == 0x04))
>                      {
>                          If ((FBID == 0x02))
>                          {
>                              Return ("INTEL_FFRD")
>                          }
>
>                          If ((FBID == 0x03))
>                          {
>                              Return ("INTEL_FFRD")
>                          }
>                      }
>
>                      Return ("INTEL_RVP")
>                  }
>
>                  If ((Arg0 == ToUUID ("918ab242-c37c-450a-9d0f-f47ab97c3dea")))
>                  {
>                      Return (0x0101)
>                  }
>
>                  If ((Arg0 == ToUUID ("ea3b7bd8-e09b-4239-ad6e-ed525f3f26ab")))
>                  {
>                      Return (0x1011)
>                  }
>
>                  If ((Arg0 == ToUUID ("b65ac492-9e30-4d60-b5b2-f497c790d9cf")))
>                  {
>                      Return (Zero)
>                  }
>
>                  If ((Arg0 == ToUUID ("e770ab0f-2644-4bab-8628-d62f1683fb9d")))
>                  {
>                      Return (0x05)
>                  }
>
>                  If ((Arg0 == ToUUID ("1ea54ab2-cd84-48cc-9dd4-7f594ec3b015")))
>                  {
>                      Return (0x02)
>                  }
>
>                  If ((Arg0 == ToUUID ("8dbe2651-70c1-4c6f-ac87-a37cb46e4af6")))
>                  {
>                      Return (One)
>                  }
>
>                  If ((Arg0 == ToUUID ("75c9a639-5c8a-4a00-9f48-a9c3b5da789f")))
>                  {
>                      Return (Zero)
>                  }
>
>                  If ((Arg0 == ToUUID ("2fa9bb94-9c5d-4aeb-8e6e-27434f81e3d3")))
>                  {
>                      Return ("CHT_CR")
>                  }
>
>                  If ((Arg0 == ToUUID ("647a6ca2-8b29-49ac-8806-d58b3d2d3ef5")))
>                  {
>                      Return ("FFD")
>                  }
>
>                  If ((Arg0 == ToUUID ("a6e922a1-f7b3-4399-b56a-406ae416843b")))
>                  {
>                      Return ("CHV")
>                  }
>
>                  If ((Arg0 == ToUUID ("5960313b-0ab0-4940-8840-2cafa420c015")))
>                  {
>                      Return ("ASUS")
>                  }
>
>                  If ((Arg0 == ToUUID ("26257549-9271-4ca4-bb43-c4899d5a4881")))
>                  {
>                      If ((Arg2 == One))
>                      {
>                          Return (One)
>                      }
>
>                      If ((Arg2 == 0x02))
>                      {
>                          Return (0x03003600)
>                      }
>                  }
>
>                  If ((Arg0 == ToUUID ("79234640-9e10-4fea-a5c1-b5aa8b19756f")))
>                  {
>                      If ((Arg2 == One))
>                      {
>                          Return (One)
>                      }
>
>                      If ((Arg2 == 0x02))
>                      {
>                          Return (0x01003701)
>                      }
>                  }
>
>                  If ((Arg0 == ToUUID ("e9914eb6-592b-4228-ba5d-a0994bcb20dd")))
>                  {
>                      Local0 = Zero
>                      While ((Local0 < 0x0220))
>                      {
>                          C1CD [Local0] = MEMB ((CA10 + Local0))
>                          Local0++
>                      }
>
>                      Return (C1CD) /* \_SB_.PCI0.I2C3.CAM1.C1CD */
>                  }
>
>                  If ((Arg0 == ToUUID ("f486d39f-d657-484b-84a6-42a565712b92")))
>                  {
>                      Return (Buffer (0x20)
>                      {
>                          /* 0000 */  0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00,  // ........
>                          /* 0008 */  0x05, 0x01, 0x03, 0x03, 0x00, 0x00, 0x00, 0x00,  // ........
>                          /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
>                          /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
>                      })
>                  }
>
>                  Return (Zero)
>              }
>          }
>
>
>
>
>
