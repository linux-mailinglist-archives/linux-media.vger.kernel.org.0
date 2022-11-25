Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B58BC63821B
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 02:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiKYBcn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 20:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiKYBcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 20:32:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718FE21832
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 17:32:38 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A0B04D5;
        Fri, 25 Nov 2022 02:32:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669339956;
        bh=xaRBs6DRWMfzapNl9xGpZ25OVBWbTUlB4RAAchiyipc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H/r3L/mlLOJ9cI06MZd2U84XaprCeXUS2s1QcIGKsRNP2SqxPXpf1v68MsNEwnue3
         7BuRDJ8qcEW/Yi2U33dOrzBRqDrO2X0mSkpj9V2se5B2okVUZaR3hx3VxFvVwDR+T0
         01WOngFfhfOtG2+H6pZJ5Irwdaw3fIQLZFRbc82Q=
Date:   Fri, 25 Nov 2022 03:32:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Amos Tibaldi <tibaldi.amos@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: request for help on uvcvideo driver issue
Message-ID: <Y4AbJFVL426tanO5@pendragon.ideasonboard.com>
References: <CAKAO289-s=VJYJzt5JBCSvAzHmG-KMY12yX-RMREQTQCHVe6YA@mail.gmail.com>
 <Y358tj0cKyXyaFFF@pendragon.ideasonboard.com>
 <CAKAO28-5OPZgz=7oSr9qrU0KRB7=Tmfj_nM3DQP6rdgw61=YaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKAO28-5OPZgz=7oSr9qrU0KRB7=Tmfj_nM3DQP6rdgw61=YaQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Amos,

Could you please avoid dropping the mailing list from CC when replying ?

On Wed, Nov 23, 2022 at 09:43:10PM +0100, Amos Tibaldi wrote:
> Hello, I attached the dmesg text file of one linux mint 20.1 that I have
> just installed. The issue is the same. I hope it helps. Thanks.

Quoting the interesting part from the log:

> [  823.596518] usb 2-3: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> [  823.629237] usb 2-3: New USB device found, idVendor=1bcf, idProduct=2c99, bcdDevice= 2.00
> [  823.629239] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [  823.629240] usb 2-3: Product: ezcap U3 capture
> [  823.629241] usb 2-3: Manufacturer: VXIS Inc

So far so good.

> [  823.659423] mc: Linux media interface: v0.10
> [  823.667890] videodev: Linux video capture interface: v2.00
> [  823.678367] usb 2-3: 3:1: cannot get freq at ep 0x86
> [  823.685869] usb 2-3: 3:2: cannot get freq at ep 0x86
> [  823.692874] usb 2-3: 3:3: cannot get freq at ep 0x86

This I don't like. I've seen many devices having trouble with the audio
side, which resulted in different kind of firmware misbehaviours (most
likely including crashes) that affected the video side. Could you try to
blacklist the snd_usb_audio module to see if it helps ? It can be done
by adding

blacklist snd_usb_audio

to /etc/modprobe.d/blacklist.conf

> [  823.738250] usb 2-3: Warning! Unlikely big volume range (=4096), cval->res is probably wrong.
> [  823.738252] usb 2-3: [5] FU [Digital In Capture Volume] ch = 1, val = 0/4096/1
> [  823.738384] usbcore: registered new interface driver snd-usb-audio
> [  823.740047] uvcvideo: Found UVC 1.00 device ezcap U3 capture (1bcf:2c99)
> [  823.760905] input: ezcap U3 capture: ezcap U3 capt as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb2/2-3/2-3:1.0/input/input17
> [  823.760976] usbcore: registered new interface driver uvcvideo
> [  823.760977] USB Video Class driver (1.1.1)

Could you start video capture with any application and check if
additional messages are then printed in the kernel log ?

> On Wed, Nov 23, 2022 at 9:04 PM Laurent Pinchart wrote:
> 
> > Hi Amos,
> >
> > CC'ing the linux-media mailing list.
> >
> > On Wed, Nov 23, 2022 at 07:16:05PM +0100, Amos Tibaldi wrote:
> > > Hello,
> > >    I have a usb framegrabber and it worked fine in ubuntu 20.04 and previous
> > > releases of ubuntu with the uvcvideo.ko kernel module but now that I have
> > > ubuntu 22.10 the uvcvideo.ko does not work with the ezcap261 framegrabber. The
> > > ko is loaded but cheese or xawtv or vlc go on timeout when issuing video
> > > acquisition, and the select returns wrong argument. I have also updated the
> > > firmware of the framegrabber. What can I do?
> >
> > Could you please send a copy of the kernel log, in text form ? You can
> > retrieve it with `dmesg` or `sudo dmesg`. I'm particularly interested in
> > messages printed when the device is plugged in, or when an application
> > attempts to use it.

-- 
Regards,

Laurent Pinchart
