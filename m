Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07ED41643F3
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 13:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgBSMI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 07:08:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34954 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgBSMI3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 07:08:29 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61F702F9;
        Wed, 19 Feb 2020 13:08:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582114107;
        bh=59MTlzlEusDjL/j6QdtXIHxzeLVVtK/68dqTnZXmCwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ocBRYAUd9yrSp/AQXjlf9qSC6IJRD4aV8Z4m7riXbhSbRkC5910MxA3mcxIbpPYIY
         k7Pbu8DiaTRsIVxOMDllb3hM2Rfqf4O2qhHfsec6R0mSX4WvzaZi+ymzzf+q35UDnw
         oKBeyo1JtX6dZxg5b/IKYgCA9+zkLXQz3B4nnzI8=
Date:   Wed, 19 Feb 2020 14:08:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [Query] : DT: Adding mezzanine board
Message-ID: <20200219120808.GA5070@pendragon.ideasonboard.com>
References: <CA+V-a8tnsxJP2CfwgrkPum6mYQEEP9+0=Fap4dFu-3x+fXdadw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8tnsxJP2CfwgrkPum6mYQEEP9+0=Fap4dFu-3x+fXdadw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Wed, Feb 19, 2020 at 11:42:42AM +0000, Lad, Prabhakar wrote:
> Hi,
> 
> I am working Renesas RZ/Gx platforms, these boards have support for
> connecting MIPI adapter mezzanine board [1]. To enable this support I
> am planning to create a dtsi which will include the board file and
> enable the necessary VIN/CSI and the camera endpoint.
> 
> For example: to add support for G2E board I would create a file named
> r8a774c0-cat874-mipi-adapter.dtsi which will include the board file
> r8a774c0.dtsi and enable necessary VIN/CSI/Camera endpoint and when
> user wants to enable this support for the G2E board he could just
> include r8a774c0-cat874-mipi-adapter.dtsi to r8a774c0-cat874.dts
> 
> Would this be a good approach or is there an alternative way which I am missing.

DT overlays are another option. They can't be applied on a running
system though. It doesn't seem like the mezzanine boards can be detected
by the boot loader, so overlays can't be applied automatically before
the kernel is started. One option would still be to provide them to
U-Boot and apply a selected overlay based on environment variables.
Another option would be to apply overlays as part of the build process,
which shouldn't require modifying the DT sources to #include the .dtsi
file for the mezzanine board.

> [1] https://github.com/Kevin-WSCU/96Boards-Camera/blob/master/AISTARVISION%20MIPI%20Adapter%20V2.1/AISTARVISION%20MIPI%20Adapter%20V2.1.pdf

-- 
Regards,

Laurent Pinchart
