Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C967693A22
	for <lists+linux-media@lfdr.de>; Sun, 12 Feb 2023 22:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjBLVFB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Feb 2023 16:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjBLVFA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Feb 2023 16:05:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4411AB
        for <linux-media@vger.kernel.org>; Sun, 12 Feb 2023 13:04:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA23B4DD;
        Sun, 12 Feb 2023 22:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676235897;
        bh=TCj2sTGlI3ymE9ykZZp3di86w2EzP0Rkw15JnYdP0Iw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R+BH2nzT1+fCex6yKEIPH4tFOdtz1wUSYeoOsfACNNF2ucLHmdyX2qkPEHFX1cUie
         jjNS8NoIKU1ahctdLF7ogKoRmhdVpc92Sc/cwBV1Dff2EhLe1T5m7o5SIgPcRW9tXv
         /JxR4TuF4NQZrLTaq0KMIveawuLp4mdB+P0eRfsY=
Date:   Sun, 12 Feb 2023 23:04:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Neelands <paulnee@xplornet.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: uvcvideo
Message-ID: <Y+lUeASSLiGIDB4x@pendragon.ideasonboard.com>
References: <214b57ef-4cb8-c487-9f05-f44ee7e543af@xplornet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <214b57ef-4cb8-c487-9f05-f44ee7e543af@xplornet.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

(CC'ing the linux-media mailing list)

On Sun, Feb 12, 2023 at 02:51:33PM -0500, Paul Neelands wrote:
> Hi.
> 
> I have a new dell Inspiron 16 5620 where the camera doesn't work.  The camera
> is the same as a Dell Inspiron 15 3000 that I have where it works. The 
> difference between the two machines is that on the I15 it is on usb bus 1
> whereas it is on bus 2 on the I16.
> 
> I downloaded and built the latest kernel 6.2.0-rc7 and no joy. I looked at your
> driver for the camera uvcvideo but haven't yet figured out where it finds the
> usb bus. The lsusb of the camera is:
> 
>  Bus 002 Device 004: ID 0c45:6739 Microdia Integrated_Webcam_FHD
> 
> The kernel finds it with the demsg:
> 
>   13.999455] usb 2-6: Found UVC 1.00 device Integrated_Webcam_FHD (0c45:6739)  
>         14.059462] usbcore: registered new interface driver uvcvideo
> 
> I would really appreciate some help on where and how the usb bus gets
> enumerated for the camera.

What's the output of `ls -l /sys/class/video4linux/video*/` and
`ls -l /dev/video*` ?

Could you provide your full kernel log, as well as the output of
`lsusb -v -d 0c45:6739` (if possible running as root, for instance with
sudo) ?

-- 
Regards,

Laurent Pinchart
