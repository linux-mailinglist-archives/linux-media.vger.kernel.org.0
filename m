Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9E8B1BC758
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 19:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbgD1R7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 13:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728023AbgD1R7d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 13:59:33 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7145DC03C1AB
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 10:59:33 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id i10so25745524wrv.10
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=kSAEKMyU/lTj9dpATthmhaQBLws94eNWVLVUUU37TC4=;
        b=EQROhOwS6+ZQ6leJeqJwZgbNpvXgf4QfytMbvwmQwz4F+0NrcQSwi3tvOCdpsmU3sL
         sNJDn+Rbv8cl0e63cY5uvWs8VP1Gk7FW8xN9hMd1+pe0BmPOmYzWwRxx+3/4nCeAn2VJ
         kxMC79PKfwiRIU8+ICts3eJG9mWIaz42aFq/sH/tGG5dzKJaJrHguWzYwSqYG86EEhmx
         bueL1GmHK4R7epi7KN2mqtm1wO+XCVohHvY6L04ck0+EWuHZwtKX/ht8Vasdz7TvZtY+
         mkjYih7YYWH3okyM8LgOcItPjafMsYPpAHmzYolaoTsZ1UiJGunKJz2IEVnQ+hEEvIiX
         dQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=kSAEKMyU/lTj9dpATthmhaQBLws94eNWVLVUUU37TC4=;
        b=p9khSZoPT4M6niMsi+c81L3r7MevfLGGVJXActTmDJfYngVmFMr86vHN/f3crmkxhf
         y9GmsdgfDwKyLp7MiU83QwlEcfrtNPP0lEeexczCNQL9akjneMhhiG8DG8FUzv7/mFEV
         oGWplUhrM1jljmXdxOSjp8suxP8a76U+an0rLAs01mcTmY2JoOPM5QoS4tUytuiq3Gvk
         72d3+rBbbjvButfkdHcZJmOAQqpMfg2gCPEw5e5Uxz3kEXIScyIDM6sDzvxmap0Z6wPm
         Sho5lNg8xaUwjtqSHHkbQkFYjTG9accmaql6rm5UoaM5sTCM5oz/Y3hegEcTpPg1S3Yq
         H7vw==
X-Gm-Message-State: AGi0PubVf+LtEf1zgTAxslpPs6qToRU+dQt6YqsSkMMDvUMYNMAVQJjy
        9kbpU0U1o11MsMM+Mu3MYGp6/ywRcqE=
X-Google-Smtp-Source: APiQypLQvP3ltBXrV8W0upWl8Bk8Yna+LtjAgsHh1B/+x38phvAQD2EkXlJMlUbu7TI/CIRVpFarbQ==
X-Received: by 2002:adf:d0ca:: with SMTP id z10mr37244605wrh.172.1588096771175;
        Tue, 28 Apr 2020 10:59:31 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id l6sm26697059wrb.75.2020.04.28.10.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 10:59:30 -0700 (PDT)
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
 <131a4247-cef3-d651-a0ea-defd32b8bf20@gmail.com>
 <20200426185007.1954885a@coco.lan>
 <45817a6a-dd2f-13a6-835b-fd2b04ded23f@gmail.com>
 <20200427235027.15cd4e03@coco.lan>
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: Re: atomisp kernel driver(s)
Message-ID: <d9ec5067-142c-66c9-c412-51ddf38e44f7@gmail.com>
Date:   Tue, 28 Apr 2020 19:59:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427235027.15cd4e03@coco.lan>
Content-Type: multipart/mixed;
 boundary="------------EA5E88E2862EEBFEC2692536"
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------EA5E88E2862EEBFEC2692536
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 27.04.20 23:50, Mauro Carvalho Chehab wrote:
> Em Mon, 27 Apr 2020 20:31:31 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>> On 26.04.20 18:50, Mauro Carvalho Chehab wrote:
>>> No, you're looking at the wrong place. This should be at the system
>>> board's BIOS, and not at something that the driver would load.
>>>
>>> Just run (as root):
>>>
>>> 	# dmidecode
>>>
>>> and check the name of your board. It should be similar to this:
>>>
>>> 	...
>>> 	System Information
>>> 	        Manufacturer: Intel Corporation
>>> 	        Product Name: (something)
>>>
>>> The "(something)" is the board name. The atomisp driver will seek for
>>> it. So, you need to patch the driver (using the example I gave) in
>>> order for it to look at the right DMI_MATCH() table. Right now,
>>> the driver knows only those:
>>>
>>> 	$ git grep DMI_MATCH drivers/staging/media/atomisp/
>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "T100TA"),
>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "TABLET"),	
>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_VERSION, "MRD 7"),
>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "ST70408"),
>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "VTA0803"),
>>>
>>> Your asus board should likely use "ASUS", "_ASUS_" or something similar.
>>> So, you should take a look on the patch I sent you and modify it to
>>> match whatever name dmidecode printed.
>>>
>>> See for example this patch:
>>>
>>> 	https://www.spinics.net/lists/linux-media/msg126880.html
>>>
>>> If it finds the right table, it should end by calling gmin_subdev_add(),
>>> with should use DTST table, also from the ACPI table inside the system's BIOS.
>> Now I understood :-). I've made the modifications as you explained and
>> indeed the errors regarding
>>
>> OVTI2680:00_CamClk
>> OVTI2680:00_ClkSrc
>> OVTI2680:00_CsiPort
>> OVTI2680:00_CsiLanes
>>
>> are gone.
> Great! Could you please submit the exact patch you applied? I'll place
> it on my experimental tree:

Here is the patch for the change I made:

diff --git 
a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c 
b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
index eef7123a586f..081f9be6ec29 100644
--- 
a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
+++ 
b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
@@ -269,6 +269,15 @@ static struct gmin_cfg_var i8880_vars[] = {
      {},
  };

+static struct gmin_cfg_var asus_vars[] = {
+    {"OVTI2680:00_CsiPort", "0"},
+    {"OVTI2680:00_CsiLanes", "1"},
+    {"OVTI2680:00_CsiFmt", "15"},
+    {"OVTI2680:00_CsiBayer", "0"},
+    {"OVTI2680:00_CamClk", "1"},
+    {},
+};
+
  static const struct dmi_system_id gmin_vars[] = {
      {
          .ident = "BYT-T FFD8",
@@ -306,6 +315,13 @@ static const struct dmi_system_id gmin_vars[] = {
          },
          .driver_data = i8880_vars,
      },
+    {
+        .ident = "T101HA",
+        .matches = {
+            DMI_MATCH(DMI_BOARD_NAME, "T101HA"),
+        },
+        .driver_data = asus_vars,
+    },
      {}
  };

>> Now we have the following in dmesg:
>>
>> [    8.815960] kernel: mc: Linux media interface: v0.10
>> [    8.858458] kernel: videodev: Linux video capture interface: v2.00
>> [    8.876864] kernel: input: Intel HID events as
>> /devices/pci0000:00/INT33D5:00/input/input16
>> [    8.887625] kernel: 8086228A:01: ttyS5 at MMIO 0x91a1f000 (irq = 40,
>> base_baud = 2764800) is a 16550A
>> [    8.894655] kernel: dw_dmac INTL9C60:01: DesignWare DMA Controller, 8
>> channels
>> [    8.929818] kernel: atomisp_ov2680: module is from the staging
>> directory, the quality is unknown, you have been warned.
>> [    8.989630] kernel: ov2680 i2c-OVTI2680:00: gmin: initializing
>> atomisp module subdev data.PMIC ID 1
>> [    8.989887] kernel: ov2680 i2c-OVTI2680:00: supply V1P8SX not found,
>> using dummy regulator
>> [    8.989954] kernel: ov2680 i2c-OVTI2680:00: supply V2P8SX not found,
>> using dummy regulator
> Did you apply this patch also?
>
> 	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp&id=898564642042fdd136a16c3ee120a00061c13940
>
> I guess this would get rid of the two above warnings.
>
The patch was already applied when I did the test width the driver - the 
warnings are also present with it.

But if I read the code correctly this is expected, as we try to get 
those regulators in any case - only if we have an error on two of them 
we try the "Regulator1p8v" & "Regulator2p8v". As we do not see warnings 
for those two regulators I assume this worked.

f (pmic_id == PMIC_REGULATOR) {
         gmin_subdevs[i].v1p8_reg = regulator_get(dev, "V1P8SX");
         gmin_subdevs[i].v2p8_reg = regulator_get(dev, "V2P8SX");
         gmin_subdevs[i].v1p2_reg = regulator_get(dev, "V1P2A");
         gmin_subdevs[i].v2p8_vcm_reg = regulator_get(dev, "VPROG4B");

         /*
          * Based on DTST dumps on newer Atom E3800 devices, it seems that
          * the regulators data now have new names.
          */
         if (IS_ERR(gmin_subdevs[i].v1p8_reg))
             gmin_subdevs[i].v1p8_reg = regulator_get(dev, "Regulator1p8v");

         if (IS_ERR(gmin_subdevs[i].v2p8_reg))
             gmin_subdevs[i].v2p8_reg = regulator_get(dev, "Regulator2p8v");

>> [    8.989977] kernel: ov2680 i2c-OVTI2680:00: supply V1P2A not found,
>> using dummy regulator
>> [    8.989998] kernel: ov2680 i2c-OVTI2680:00: supply VPROG4B not found,
>> using dummy regulator
>> [    9.033505] kernel: ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
>> [    9.061511] kernel: ov2680 i2c-OVTI2680:00: camera pdata: port: 0
>> lanes: 1 order: 00000002
>> [    9.065178] kernel: ov2680 i2c-OVTI2680:00: sensor_revision id =
>> 0x2680, rev= 0
>> [    9.071095] kernel: ov2680 i2c-OVTI2680:00: register atomisp i2c
>> module type 1
> We need to double check if everything is ok on the above.
>
> That's said, with the current code, I don't expect ISP2401 to work out
> of the box, as the Kernel is set for ISP2400. I'm trying to address
> this on my spare time.
Thanks - just let me know if I shall test anything on my side.
>> Laurent explained me how to enable internal debug messages. I'll read
>> more about this to understand how to use it and hope this will give a
>> more detailed insight.
>>
>>
>> great to see some progress :-),
> Yes!
>
>> thanks and kind regards,
>>
>> Patrik
>>
>>
>>> Thanks,
>>> Mauro
>
>
> Thanks,
> Mauro

with kind regards,

Patrik


--------------EA5E88E2862EEBFEC2692536
Content-Type: text/x-patch; charset=UTF-8;
 name="asus.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="asus.patch"

diff --git a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
index eef7123a586f..081f9be6ec29 100644
--- a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
@@ -269,6 +269,15 @@ static struct gmin_cfg_var i8880_vars[] = {
 	{},
 };
 
+static struct gmin_cfg_var asus_vars[] = {
+	{"OVTI2680:00_CsiPort", "0"},
+	{"OVTI2680:00_CsiLanes", "1"},
+	{"OVTI2680:00_CsiFmt", "15"},
+	{"OVTI2680:00_CsiBayer", "0"},
+	{"OVTI2680:00_CamClk", "1"},
+	{},
+};
+
 static const struct dmi_system_id gmin_vars[] = {
 	{
 		.ident = "BYT-T FFD8",
@@ -306,6 +315,13 @@ static const struct dmi_system_id gmin_vars[] = {
 		},
 		.driver_data = i8880_vars,
 	},
+	{
+		.ident = "T101HA",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "T101HA"),
+		},
+		.driver_data = asus_vars,
+	},
 	{}
 };
 

--------------EA5E88E2862EEBFEC2692536--
