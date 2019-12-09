Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3115C1164C1
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 02:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfLIBSO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Dec 2019 20:18:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50014 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbfLIBSN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Dec 2019 20:18:13 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7A8299A;
        Mon,  9 Dec 2019 02:18:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575854292;
        bh=gMGIeU4wtqaWFsz+sVHshUd1vNGh2FdFDnoFYEXXX+k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K8aDITAfBI3X+2rvcxbb5UALevp2O0Ji52NzhGd8Qh1P3ASjsrwAFHf0qX6piQeyP
         G2yjoCbYTK6XK5g4WKk1leq0YD+42r4TrUsbKiS/IGkfjYE8S/OkXvY0BQgaeuzi7q
         6/Zejz2tmtdXJU3IoIWVT556/j7f08KxiUDLf8yY=
Date:   Mon, 9 Dec 2019 03:18:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jeffrin Jose <jeffrin@rajagiritech.edu.in>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PROBLEM] uvcvideo: Failed to query (GET_INFO) UVC control
Message-ID: <20191209011804.GM14311@pendragon.ideasonboard.com>
References: <20191207182152.GB5280@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191207182152.GB5280@debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jeffrin,

On Sat, Dec 07, 2019 at 11:51:52PM +0530, Jeffrin Jose wrote:
> hello,
> 
> i get this  output piece from "dmesg -l err" of kernel 5.4.2
> 
> 
> -------------------x---------------------------x------------------
> uvcvideo: Failed to query (GET_INFO) UVC control 6 on unit 1: -32 (exp. 1).
> uvcvideo: Failed to query (GET_INFO) UVC control 7 on unit 1: -32 (exp. 1).
> -------------------x----------------------------x-----------------
> 
> Additional information:
> Linux debian 5.4.2 #17 SMP Sat Dec 7 01:39:12 IST 2019 x86_64 GNU/Linux
> 
> Relevant file:
> drivers/media/usb/uvc/uvc_video.c

Does the camera otherwise fail to operate correctly ? Was the problem
present in older kernel versions, or did it appear with v5.4.2 ? Are the
above messages output every time you plug the camera (or load the driver
in case the camera is built in), or only randomly ? What is the exact
camera model, and could you please send me the lsusb -v output for it
(running as root if possible) ?

-- 
Regards,

Laurent Pinchart
