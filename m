Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F322FC40E7
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 21:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfJATTJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 15:19:09 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:49148 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726458AbfJATTJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 15:19:09 -0400
Received: (qmail 6574 invoked by uid 2102); 1 Oct 2019 15:19:08 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Oct 2019 15:19:08 -0400
Date:   Tue, 1 Oct 2019 15:19:08 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Tim Harvey <tharvey@gateworks.com>
cc:     linux-media <linux-media@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: PureThermal2 UVC video camera: Failed to submit URB 0 (-28)
In-Reply-To: <CAJ+vNU1UdhbPSMZBOeW3XXBkALdNP8_Rk8T=bzeR9KpdqKC8VQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1910011512470.1991-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 1 Oct 2019, Tim Harvey wrote:

> On Thu, Sep 26, 2019 at 3:47 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > Greetings,
> >
> > I'm running into an issue with a USB UVC Full speed camera, the
> > PureThermal2 [1] on an IMX6 based ARM board.
> >
> > What I find is that I get two video devices registered (the first one
> > is the expected device, and I'm not clear what the 2nd one is). When I
> > try to capture a single frame I get 'Failed to submit URB 0 (-28)'
> > which historically has been due to a bandwidth issue. I encounter this
> > on the IMX6 EHCI host as well as the OTG host when no other devices
> > are connected (no hubs either). I've tested with both a 4.20 kernel
> > and a 5.3 kernel.
> >
> > If I plug this device into another board I have based on an OcteonTX
> > ARM64 cpu with a fairly modern 4.14 kernel and I find that a single
> > video device gets registered and I can capture just fine.
> >
> > Here are some details:
> > lsusb reports: 1e4e:0100 Cubeternet WebCam
> >
> > working system with 4.14 kernel hot-inserting the camera:
> > [  495.163276] usb 1-1.2: new full-speed USB device number 6 using xhci_hcd
> > [  495.291685] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> > (1e4e:0100)
> > [  495.300543] input: PureThermal (fw:v1.2.2): PureTh as
> > /devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input1
> > [  496.731214] usb 1-1.2: USB disconnect, device number 6
> > [  496.987294] usb 1-1.2: new full-speed USB device number 7 using xhci_hcd
> > [  497.115683] uvcvideo: Found UVC 1.00 device PureThermal (fw:v1.2.2)
> > (1e4e:0100)
> > [  497.124182] input: PureThermal (fw:v1.2.2): PureTh as
> > /devices/platform/soc@0/848000000000.pci/pci0000:00/0000:00:10.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input2

...

> > I'm also not clear why the device enumerates then disconnects and
> > enumerates again when plugged in but this happens on the system it
> > works on as well and I've seen similar things with other devices.

Perhaps some process opens the camera's device file, does something to 
cause the camera to disconnect and reconnect, but then doesn't close 
the file.

> I have found that if I enumerate the camera through a PCIe based XHCI
> host controller it still registers the 2 v4l2 devices but in this case
> I can capture fine. So it would appear that this has something to do
> with the IMX6 ci_hdrc controller. The -ENOSPC is getting returned from
> drivers/usb/host/ehci-sched.c:iso_stream_schedule()
> 
> I feel perhaps this is something basic I don't understand regarding
> USB URB scheduling but I don't get why it occurs on the IMX6 ci_hdrc
> controller on not an XHCI controller.

It's probably related to differences between the drivers.  What shows 
up in /sys/kernel/debug/usb/devices with the camera plugged in?

Alan Stern

> Regards,
> 
> Tim
> 
> -- 
> 
> 
> CONFIDENTIALITY NOTICE: This email constitutes an electronic 
> communication within the meaning of the Electronic Communications Privacy 
> Act, 18 U.S.C. 2510, and its disclosure is strictly limited to the named 
> recipient(s) intended by the sender of this message. This email, and any 
> attachments, may contain confidential and/or proprietary information. If 
> you are not a named recipient, any copying, using, disclosing or 
> distributing to others the information in this email and attachments is 
> STRICTLY PROHIBITED. If you have received this email in error, please 
> notify the sender immediately and permanently delete the email, any 
> attachments, and all copies thereof from any drives or storage media and 
> destroy any printouts or hard copies of the email and attachments.
> 
>  
> 
> 
> EXPORT COMPLIANCE NOTICE: This email and any attachments may contain 
> technical data subject to U.S export restrictions under the International 
> Traffic in Arms Regulations (ITAR) or the Export Administration Regulations 
> (EAR). Export or transfer of this technical data and/or related information 
> to any foreign person(s) or entity(ies), either within the U.S. or outside 
> of the U.S., may require advance export authorization by the appropriate 
> U.S. Government agency prior to export or transfer. In addition, technical 
> data may not be exported or transferred to certain countries or specified 
> designated nationals identified by U.S. embargo controls without prior 
> export authorization. By accepting this email and any attachments, all 
> recipients confirm that they understand and will comply with all applicable 
> ITAR, EAR and embargo compliance requirements.

PS: These notices are completely inappropriate for a messages sent to a 
public mailing list.  If adhered to strictly, they would prevent anyone 
from replying to your message.

