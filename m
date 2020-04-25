Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8855E1B866F
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2020 14:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgDYMTe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 08:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgDYMTd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 08:19:33 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B11C09B04B
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2020 05:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=S8UD1LF3cCJ2DiB7eHBm9K2E+dmx+prOiWoaUunPgUI=; b=C9mgaZI3R97KGvB1LzDjBYamrv
        Kou/mgcw3IA0YwLYmCR5bgdVOjDXxlYrON9XFO8tmhKJKXYLHAPNeDr6nXycnwydSnaXliwF2Dvea
        uM5aanuDv8OvUGPTLCD4NhTR9Vxum5YWOKOGouu9Zxrp1GCgamX6h9+5haY06xig9k7455z54dDIa
        fgLpoaANvZFgcJvoGe3iXAJxnB/wviKieeSc1ZoEOMMMz+F108wcrRtZ6s3f7CGbd6nkIERE0beMG
        gpv+hBfree1kYuZWLw0MQ5CEjAFJGqL5CPA/uFp0VKuGpBleKAYRSrIDB+fuXsJ9QLQjIqIx+CWCm
        IOsh33cQ==;
Received: from ip5f5ad5c5.dynamic.kabel-deutschland.de ([95.90.213.197] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jSJmK-0003HA-LX; Sat, 25 Apr 2020 12:19:28 +0000
Date:   Sat, 25 Apr 2020 14:19:24 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200425141924.7a0b27c9@coco.lan>
In-Reply-To: <8bda5543-100b-95f7-04a2-d7b302fc7833@gmail.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
        <20200425023926.GA30200@pendragon.ideasonboard.com>
        <8bda5543-100b-95f7-04a2-d7b302fc7833@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 25 Apr 2020 12:36:18 +0200
Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:

> Hi Laurent,
> 
> thank you for your comprehensive answer.
> 
> On 25.04.20 04:39, Laurent Pinchart wrote:
> > Hi Patrik,
> >
> > (CC'ing Sakari Ailus)
> >
> > On Sat, Apr 18, 2020 at 04:39:25PM +0200, Patrik Gfeller wrote:  
> >> Hello Mauro et al,
> >>
> >> I've recently switched to Linux, and I'm very impressed. Almost
> >> everything thing works out of the box. Only the webcam on my device does
> >> not. I did some digging and if I'm right an atomisp driver would be
> >> required. Is this correct? Below the output of lspci:
> >>
> >> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36)
> >> 00:02.0 VGA compatible controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36)
> >> 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36)
> >> 00:0a.0 Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
> >> 00:0b.0 Signal processing controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power Management Controller (rev 36)
> >> 00:14.0 USB controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI Controller (rev 36)
> >> 00:1a.0 Encryption controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted Execution Engine (rev 36)
> >> 00:1c.0 PCI bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express Port #1 (rev 36)
> >> 00:1f.0 ISA bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36)
> >> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless Network Adapter (rev 31)
> >>
> >> According to the history it looks like the driver was removed from the
> >> kernel in 2018 and replaced with a dummy driver (to make sure power save
> >> works).
> >>
> >> Is there a chance that the atomisp driver will return to the kernel?  
> > As much as I'd like to say yes, I think this is unfortunately very
> > unlikely. There are a few obstacles to getting a working camera with
> > atomisp:
> >
> > - According to some reports, the driver doesn't work. That's the first
> >    thing that would need to be fixed, and without hardware documentation
> >    and support from Intel, that would be a difficult (to say the least)
> >    task.
> >
> > - Assuming we could fix the driver, we would need to make sure it
> >    supports your device. If the atomisp is anything like the IPU3 (a more
> >    recent ISP from Intel), there are two different and incompatible sets
> >    of ACPI data formats related to the device, one developed for Windows,
> >    and one developed for Linux. I expect the atomisp driver to support
> >    the latter but not the former. If your device was shipped with
> >    Windows, it uses the Windows-specific ACPI data format. Furthermore,
> >    it would in that case likely not encode all the information we would
> >    need in ACPI, as Windows drivers have the bad habit of hardcoding
> >    device-specific data in drivers. At the very least we would need to
> >    get the atomisp to support the Windows ACPI data format (which is most
> >    likely completely undocumented), and we would need to figure out how
> >    to retrieve data that are simply not there. This being said, maybe the
> >    atomisp ACPI design was better than the IPU3 and all (or part of)
> >    those issues don't exist, but I'd be surprised.

I decoded the ACPI table that Patrik provided. It is on Intel format:

 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0001A0BD (106685)
 *     Revision         0x02
 *     Checksum         0x76
 *     OEM ID           "_ASUS_"
 *     OEM Table ID     "Notebook"
 *     OEM Revision     0x01072009 (17244169)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120913 (538052883)

> > - At this point you would (hopefully) have a driver that could capture
> >    RAW images. In order to use the camera as a webcam, those images would
> >    need to be processed by the ISP that is part of the atomisp. This
> >    requires complex image processing algorithm control code in userspace.
> >    Intel has not released any open version of such code for the atomisp
> >    (or any other platform) to my knowledge, so this would need to be
> >    implemented from scratch. The libcamera project could help there, as
> >    it provides a framework to host such code, but the atomisp-specific
> >    code would still need to be implemented. This is a complex task when
> >    the hardware is fully documented, without hardware documentation and
> >    thus without knowing how the hardware works, it gets extremely
> >    difficult. The task would be orders of magnitude more complex than
> >    reverse-engineering a GPU.

Yes, this is indeed something to consider: in order to get good quality
images, it would need to run some proprietary software, at least while
someone doesn't develop support for it under libcamera.

> > - Finally, in order for the driver to be merged back in the upstream
> >    kernel, it would require massive cleanups, but that's the simplest
> >    task of all that is required here.

Well, staging can accept crap code, provided that someone would be
working to address its problems.

> > I'm sorry for the bad news, we need to be more vocal blaming hardware
> > vendors for this type of mess.  
> 
> Bad news indeed, this doesn't sound promising at all. I can confirm that 
> the driver does not work out of the box in its current state (many 
> thanks to Mauro for making this test possible). With all those obstacles 
> I'm surprised that work on such a driver was even started. My only hope 
> is, that the ISP 2 is better documented and less complex than ISP 3 ...
> 
> I'll try to get hold of hardware documentation from Intel, and check if 
> there is any kind of community support program in place (it is at least 
> worth a try :-) ) - that hopefully would allow to assess if there is a 
> possibility to fix the driver and how much post processing would be 
> needed in user space (what raw format that thing delivers). 
> Unfortunately I would depend on others to do the judgment (I do not have 
> the technical skills necessary). I'll also try to find out who initiated 
> the original implementation to find out on what documentation it was 
> based (or if it was all reverse engineering) and what was the rational 
> to asses such an implementation as possible.
> 
> What I've found already is a public document about the ISP2-Registers of 
> the x5-Z8350:
> 
> https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/atom-z8000-datasheet-vol-2.pdf 
> (page 972 ff.) - not sure if this is of any help.
> 
> What kind of documentation would be needed? What I understood so far is 
> that details of ACPI format are important.
> 
> As already mentioned: I would also sponsor a device or two to developers 
> with a reputation as you and Mauro have (preferably the same device I 
> have :-), they are quite cheap today - and that is a way I could support 
> the efforts).

Don't give up just yet. At least for the probing part, getting the right
ACPI values seem easily fixable, as the table is at Intel format.

Something like the enclosed patch, on the top of the last patches on my
experimental tree should make the device specific ACPI data visible to 
the code that retrieves some ACPI data. Yet, this line:

	DMI_MATCH(DMI_BOARD_NAME, "_ASUS_"),

May need some changes, depending on the result of "dmidecode" command.

Thanks,
Mauro

[PATCH] media: atomisp: add Asus ACPI vars

Those were extracted from an ACPI dump:

 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0001A0BD (106685)
 *     Revision         0x02
 *     Checksum         0x76
 *     OEM ID           "_ASUS_"
 *     OEM Table ID     "Notebook"
 *     OEM Revision     0x01072009 (17244169)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120913 (538052883)
 */
DefinitionBlock ("", "DSDT", 2, "_ASUS_", "Notebook", 0x01072009)
...
                    Local0 = Package (0x12)
                        {
                            "CamId",
                            "ov2680",
                            "CamType",
                            "1",
                            "CsiPort",
                            "0",
                            "CsiLanes",
                            "1",
                            "CsiFmt",
                            "15",
                            "CsiBayer",
                            "0",
                            "CamClk",
                            "1",
                            "Regulator1p8v",
                            "0",
                            "Regulator2p8v",
                            "0"
                        }

Note: the DMI_MATCH() line probably needs to be tweaked.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
index eef7123a586f..a5cd9ac7396b 100644
--- a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
@@ -269,6 +269,15 @@ static struct gmin_cfg_var i8880_vars[] = {
 	{},
 };
 
+static struct gmin_cfg_var asus_vars[] = {
+	{"OVTI2680:00_CsiPort", "1"},
+	{"OVTI2680:00_CsiLanes", "1"},
+	{"OVTI2680:00_CsiFmt", "15"},
+	{"OVTI2680:00_CsiBayer", "0"},
+	{"OVTI2680:00_CamClk", "0"},
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
+		.ident = "_ASUS_",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "_ASUS_"),
+		},
+		.driver_data = asus_vars,
+	},
 	{}
 };
 

