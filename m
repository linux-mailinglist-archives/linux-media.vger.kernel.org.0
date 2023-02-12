Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81EF6693B18
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 00:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjBLXXK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Feb 2023 18:23:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjBLXXJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Feb 2023 18:23:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD443C1C
        for <linux-media@vger.kernel.org>; Sun, 12 Feb 2023 15:23:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4D84501;
        Mon, 13 Feb 2023 00:23:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676244187;
        bh=PD1NctP2dJoSGQJGv0+0s4gYlrLVWFe2d+dNmZVn/C0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HWQ4WjgLiJpObGztj+MbMFnkZ3jR4KagTvpYXMD18gwfHytLnUKQtpuRZTRGc1K9X
         yQdGJxuGMwyonwwkQvmkCb+wTxhZ2Yjhby9AXi7gKPfYv5zSu55myndqEHfasrVH6E
         3s8AVukTdS9Stt30vlXuhjBBxVJ7ZM9djchz/UfY=
Date:   Mon, 13 Feb 2023 01:23:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Neelands <paulnee@xplornet.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: uvcvideo
Message-ID: <Y+l02luLG22ymOXC@pendragon.ideasonboard.com>
References: <214b57ef-4cb8-c487-9f05-f44ee7e543af@xplornet.com>
 <Y+lUeASSLiGIDB4x@pendragon.ideasonboard.com>
 <0523daa0-ef00-19c9-a83a-6f04d8c00060@xplornet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0523daa0-ef00-19c9-a83a-6f04d8c00060@xplornet.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Please don't drop the mailing list in your replies.

On Sun, Feb 12, 2023 at 05:06:37PM -0500, Paul Neelands wrote:
> Hi,
> 
> Thanks for the reply.
> 
> There is only one video device so I am confused about video0 & video1.
> 
> 
> ls -l /dev/video*
> crw-rw----+ 1 root video 81, 0 Feb 12 16:23 /dev/video0
> crw-rw----+ 1 root video 81, 1 Feb 12 16:23 /dev/video1
> 
> ls -l /sys/class/video4linux/video*
> lrwxrwxrwx 1 root root 0 Feb 12 16:23 /sys/class/video4linux/video0-> 
> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/video4linux/video0
> lrwxrwxrwx 1 root root 0 Feb 12 16:23 /sys/class/video4linux/video1-> 
> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/video4linux/video1
> 
> lsusb -v -d 0c45:6739 is attached as file lsusb.
> 
> */var/log/kern.**log is attached as file klog*

Nothing strikes me as wrong there. You said your webcam doesn't work,
could you please elaborate ?

> On 2/12/23 16:04, Laurent Pinchart wrote:
> > Hi Paul,
> >
> > (CC'ing the linux-media mailing list)
> >
> > On Sun, Feb 12, 2023 at 02:51:33PM -0500, Paul Neelands wrote:
> >> Hi.
> >>
> >> I have a new dell Inspiron 16 5620 where the camera doesn't work.  The camera
> >> is the same as a Dell Inspiron 15 3000 that I have where it works. The
> >> difference between the two machines is that on the I15 it is on usb bus 1
> >> whereas it is on bus 2 on the I16.
> >>
> >> I downloaded and built the latest kernel 6.2.0-rc7 and no joy. I looked at your
> >> driver for the camera uvcvideo but haven't yet figured out where it finds the
> >> usb bus. The lsusb of the camera is:
> >>
> >>   Bus 002 Device 004: ID 0c45:6739 Microdia Integrated_Webcam_FHD
> >>
> >> The kernel finds it with the demsg:
> >>
> >>    13.999455] usb 2-6: Found UVC 1.00 device Integrated_Webcam_FHD (0c45:6739)
> >>          14.059462] usbcore: registered new interface driver uvcvideo
> >>
> >> I would really appreciate some help on where and how the usb bus gets
> >> enumerated for the camera.
> > What's the output of `ls -l /sys/class/video4linux/video*/` and
> > `ls -l /dev/video*` ?
> >
> > Could you provide your full kernel log, as well as the output of
> > `lsusb -v -d 0c45:6739` (if possible running as root, for instance with
> > sudo) ?


-- 
Regards,

Laurent Pinchart
