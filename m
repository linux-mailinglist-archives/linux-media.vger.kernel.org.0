Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A29AA42FFC5
	for <lists+linux-media@lfdr.de>; Sat, 16 Oct 2021 04:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236726AbhJPC4P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 22:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234792AbhJPC4O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 22:56:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D2EC061570
        for <linux-media@vger.kernel.org>; Fri, 15 Oct 2021 19:54:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3113D268;
        Sat, 16 Oct 2021 04:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634352846;
        bh=wD+S1EIdGkJlZfBLzkkESCFo9G+iAJmRgrVexEKZowE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kD1c7at8BQ+xfZxY9u9tL1fKuDJEjp8ac9UZ0TB0ehV4SkNt24RkDeJ03tmhVM4lr
         HTKaoduOegSpLVH/0i2yg/E+r7m7zRUGfBA3ZO36QAO5wgZJu30jS4PqA6g4+Pal8Q
         INEEm1nMDTH9+NBfbzQWyD/sCY1IO/cW+HYAymPc=
Date:   Sat, 16 Oct 2021 05:53:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH] media: ipu3-cio2: Update high watermark to support
 higher data rate camera sensors
Message-ID: <YWo+vtVy5dR4tmQD@pendragon.ideasonboard.com>
References: <1632370218-5508-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5BdXTYZDAQcyLVurqdjuT6fHdGpzQQ0c1NJ5y=81v7hcg@mail.gmail.com>
 <0309ef19-8411-ae6c-3304-0e180420baa5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0309ef19-8411-ae6c-3304-0e180420baa5@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Thu, Oct 14, 2021 at 02:49:19PM +0800, Bingbu Cao wrote:
> On 10/6/21 1:03 PM, Tomasz Figa wrote:
> > On Thu, Sep 23, 2021 at 1:11 PM Bingbu Cao wrote:
> >>
> >> CIO2 worked well with most camera sensors so far, but CIO2 will meet SRAM
> >> overflow when working with higher data rate camera sensors such as 13M@30fps.
> >> We must set lower high watermark value to trigger the DRAM write to support
> >> such camera sensors.
> >>
> >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >> ---
> >>  drivers/media/pci/intel/ipu3/ipu3-cio2.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> > 
> > Thanks for the patch. Would this have any implications for other
> > (lower) operating modes, such as increased power consumption, or it's
> > harmless? If so, what's the reason we didn't use the value from the
> > very beginning?
> 
> Yes, we meet that the frame data corruption for some high data rate camera sensors like
> imx258 (13M@30fps) with current watermark settings. The higher watermark potentially has
> power concern as it  request DMA transfer more than before.
> 
> To keep the old settings for low data rate camera sensor, I am thinking the rationality
> to determine the HWM value based on the link_frequency? Apparently, it is not reliable
> to determine by the format.

It depends on the SRAM buffer size, on the image width, the horizontal
blanking, and the link frequency. If you can store a full line of data,
you'll have time during horizontal blanking to finish the DMA transfer,
so you can trigger it later. I don't know how the hardware works exactly
so I can't provide an exact formula (and I suppose you'll need to
reserve some margin to account for other traffic to the DRAM).

> >> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> >> index 3806d7f04d69..fde80d48533b 100644
> >> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> >> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> >> @@ -181,7 +181,7 @@ struct pci_dev;
> >>  #define CIO2_PBM_WMCTRL1_MID1_2CK      (16 << CIO2_PBM_WMCTRL1_MID1_2CK_SHIFT)
> >>  #define CIO2_PBM_WMCTRL1_MID2_2CK      (21 << CIO2_PBM_WMCTRL1_MID2_2CK_SHIFT)
> >>  #define CIO2_REG_PBM_WMCTRL2                           0x1468
> >> -#define CIO2_PBM_WMCTRL2_HWM_2CK                       40U
> >> +#define CIO2_PBM_WMCTRL2_HWM_2CK                       30U
> >>  #define CIO2_PBM_WMCTRL2_HWM_2CK_SHIFT                 0U
> >>  #define CIO2_PBM_WMCTRL2_LWM_2CK                       22U
> >>  #define CIO2_PBM_WMCTRL2_LWM_2CK_SHIFT                 8U

-- 
Regards,

Laurent Pinchart
