Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC6D3DCE45
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 02:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbhHBAVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Aug 2021 20:21:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhHBAVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Aug 2021 20:21:20 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F323787C;
        Mon,  2 Aug 2021 02:21:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627863671;
        bh=LHQit/QSpW/x9RI+4dN2kQDM8fB0cRd96orcJ4SyeBA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M2nNY9Ei9MgOvNOYYxtArT42z5nOTydmxd3olKT+BY+PLJXnBbPY3zuRmN4kEjrte
         fgBZoAPRS4eu1fI/beYFJ5+3r+xY3jCnRgQBu7kMoGZA/C7stOeE3pWwb8UlF7xv8J
         xNiD2AXysXNeRYGZWvWNc3rm6opedD8gxdZyQTVU=
Date:   Mon, 2 Aug 2021 03:21:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Parekkadam Sunny <shinepsunny@cair.drdo.in>
Cc:     linux-media@vger.kernel.org
Subject: Re: FT602 UVC  error
Message-ID: <YQc6bQ04xOyDC9J2@pendragon.ideasonboard.com>
References: <167984217.339.1627445059569.JavaMail.root@127.0.0.1>
 <1659038457.7490.1627550836140.JavaMail.root@127.0.0.1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1659038457.7490.1627550836140.JavaMail.root@127.0.0.1>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Parekkadan,

On Thu, Jul 29, 2021 at 02:57:16PM +0530, Parekkadam Sunny wrote:
> Hi,
> 
> Antipating a quick support from your side. We are struggling a lot and it is a
> critical aspect for our project.

Please note that we are offering community support in our spare time,
which is unfortunately a limited resource.

> With Regards,
> Shine Parekkadan Sunny
> Scientist 'B'
> CAIR,DRDO
> CV Raman Nagar
> Bangalore-560093
> Email:shinepsunny@cair.drdo.in
> Ph:080 25342646;Extn:4161
>  
>  
> 
> -- Original Message --
>  
> From: [shinepsunny@cair.drdo.in]
> To: [linux-media@vger.kernel.org], [laurent.pinchart@ideasonboard.com]
> Date: Wed 28 July 2021 [9:34:19 AM]
> Subject: FT602 UVC error
> 
>  
>  
> Hi Team,
> 
> Extremely sorry for the initial wrong mail.
>  
> We are planned to use FT602 device(claiming to be uvc compliant but bulk
> device) in our project for collecting camera sensors data and passing it to
> Linux host via USB 3.0 with help of UVC driver(v4l2) in Linux.
>  
> For getting started with the device, we are using UMFT602A module(evaluation
> kit) with cyclone V soc EVM using FT602_UVC_Bus_Master_Sample (AN_434) example
> code, which was available in FT602 product page.  Host side we are using Ubuntu
> 20.04 with latest kernel version 5.13.0-051300-generic.
>  
> When we enable auxiliary interface in FT602 configuration programmer, we are
> unable to receive any data in ubuntu, when We disable auxiliary interface, we
> are able to receive frames in Wireshark and also in UVC debug trace, with frame
> overflow error then we  have tried allocating constant bandwidth using  
> modprobe uvcvideo quirks=640 using these settings we could eliminate frame
> overflow error, but VLC media player failed to display color bar and also
> unable to get any data from V4l2 frame capture API for 1920 x 1080 60fps yuv2,
> for testing we have reduced video resolution and fps but it didn't help in
> solving the problem. 
>  
> There was no problem seen in playing color bar video using VLC media player in
> windows. In final application we need to use V4l2 capture API for collecting
> frame data please help us in solving the issue.
>  
> I am attaching Wireshark capture file and Linux dmesg log with this mail.
> Use any test editor for opening usblog1.log followed by usblog2.log...
> ft602usbdebug.zip contains Wireshark capture.
>  
> Thanks
> Shine
> [drdologo_f]
> 
> The contents of this Email communication are confidential to the addressee. If you
> are not the intended recipient you may not disclose or distribute this communication
> in any form should immediately contact the sender. The information, images, documents
> and views expressed in this Email are personal to the Sender and do not expressly or
> implicitly represent official positions of DRDO and no authority exists on behalf of
> DRDO to make any agreements, or other binding commitment by means of Email.

-- 
Regards,

Laurent Pinchart
