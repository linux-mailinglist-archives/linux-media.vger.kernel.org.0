Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD781B8342
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2020 04:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgDYCjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 22:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgDYCjq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 22:39:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F155C09B049
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 19:39:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A40D4F7;
        Sat, 25 Apr 2020 04:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587782381;
        bh=mF6yZWnSYsIYpGP7ypzEkrcOfPA+wT0orktyyr3TZ4M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tEqSAd/GUNeOk8BP0lqkoVZ7AiyMseYDW920qo9CaC2ahQMs5Fz5flWY1YBxzjn27
         icLYY4J3VwO8ECBS6pNf5oqHW6/eqjK9sIofyR8EHY+EnrkoN6xHH1meUWiWCooLFC
         YqD0LtLJJpmswHq3s9JwVzsJ1ySvef2HNP0BDYxY=
Date:   Sat, 25 Apr 2020 05:39:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Patrik Gfeller <patrik.gfeller@gmail.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: atomisp kernel driver(s)
Message-ID: <20200425023926.GA30200@pendragon.ideasonboard.com>
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Patrik,

(CC'ing Sakari Ailus)

On Sat, Apr 18, 2020 at 04:39:25PM +0200, Patrik Gfeller wrote:
> Hello Mauro et al,
> 
> I've recently switched to Linux, and I'm very impressed. Almost 
> everything thing works out of the box. Only the webcam on my device does 
> not. I did some digging and if I'm right an atomisp driver would be 
> required. Is this correct? Below the output of lspci:
> 
> 00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36)
> 00:02.0 VGA compatible controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36)
> 00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36)
> 00:0a.0 Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36)
> 00:0b.0 Signal processing controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power Management Controller (rev 36)
> 00:14.0 USB controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI Controller (rev 36)
> 00:1a.0 Encryption controller: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted Execution Engine (rev 36)
> 00:1c.0 PCI bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express Port #1 (rev 36)
> 00:1f.0 ISA bridge: Intel Corporation Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36)
> 01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless Network Adapter (rev 31)
> 
> According to the history it looks like the driver was removed from the 
> kernel in 2018 and replaced with a dummy driver (to make sure power save 
> works).
> 
> Is there a chance that the atomisp driver will return to the kernel? 

As much as I'd like to say yes, I think this is unfortunately very
unlikely. There are a few obstacles to getting a working camera with
atomisp:

- According to some reports, the driver doesn't work. That's the first
  thing that would need to be fixed, and without hardware documentation
  and support from Intel, that would be a difficult (to say the least)
  task.

- Assuming we could fix the driver, we would need to make sure it
  supports your device. If the atomisp is anything like the IPU3 (a more
  recent ISP from Intel), there are two different and incompatible sets
  of ACPI data formats related to the device, one developed for Windows,
  and one developed for Linux. I expect the atomisp driver to support
  the latter but not the former. If your device was shipped with
  Windows, it uses the Windows-specific ACPI data format. Furthermore,
  it would in that case likely not encode all the information we would
  need in ACPI, as Windows drivers have the bad habit of hardcoding
  device-specific data in drivers. At the very least we would need to
  get the atomisp to support the Windows ACPI data format (which is most
  likely completely undocumented), and we would need to figure out how
  to retrieve data that are simply not there. This being said, maybe the
  atomisp ACPI design was better than the IPU3 and all (or part of)
  those issues don't exist, but I'd be surprised.

- At this point you would (hopefully) have a driver that could capture
  RAW images. In order to use the camera as a webcam, those images would
  need to be processed by the ISP that is part of the atomisp. This
  requires complex image processing algorithm control code in userspace.
  Intel has not released any open version of such code for the atomisp
  (or any other platform) to my knowledge, so this would need to be
  implemented from scratch. The libcamera project could help there, as
  it provides a framework to host such code, but the atomisp-specific
  code would still need to be implemented. This is a complex task when
  the hardware is fully documented, without hardware documentation and
  thus without knowing how the hardware works, it gets extremely
  difficult. The task would be orders of magnitude more complex than
  reverse-engineering a GPU.

- Finally, in order for the driver to be merged back in the upstream
  kernel, it would require massive cleanups, but that's the simplest
  task of all that is required here.

I'm sorry for the bad news, we need to be more vocal blaming hardware
vendors for this type of mess.

> There are quite a few older tablets and 2in1 devices that would benefit. 
> Unfortunately I do not understand the removed code (my coding skills are 
> very basic) and can thus not help to change what ever is necessary to 
> make it fit for the kernel :-( (does not sound like a beginner project). 
> However - I would be glad to help out to help testing an ISP driver.
> 
> However - even without the cam it is a very impressing operating system 
> which I enjoy very much. I would like to thank all of you for your work 
> that benefits so many people!

You're welcome. Your thanks are much appreciated :-)

-- 
Regards,

Laurent Pinchart
