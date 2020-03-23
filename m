Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF9C18F3F5
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 12:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728190AbgCWL6F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 07:58:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47052 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728174AbgCWL6F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 07:58:05 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BA51308;
        Mon, 23 Mar 2020 12:58:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584964683;
        bh=JNDk9wn76BRC2ltv6vH7dVDYspglphRvhbxJvyQdBWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iQTJR2M1vuOj5cCdl6xlBR99w3t1M39rNCeX8SbmKsNH1Ho4cAwP0dgFekw38r0Is
         uxp3rwi9wE3S1jxZp9GGXXe0igY9ZsrlPCCZf7cbcSzhICv4mg72FsfOKr8yf/aB6B
         JohRht9f81scwxgE7qQb7p0jcIEzhfM+A0iy3FdQ=
Date:   Mon, 23 Mar 2020 13:57:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     sean@mess.org, hverkuil-cisco@xs4all.nl,
        mchehab+samsung@kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] Minimal libv4l2 support for complex cameras
Message-ID: <20200323115753.GC12103@pendragon.ideasonboard.com>
References: <20200323114727.GA31063@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200323114727.GA31063@amd>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,

Thank you for the patch.

On Mon, Mar 23, 2020 at 12:47:27PM +0100, Pavel Machek wrote:
> Hi!
> 
> We now have easy-to-install support for complex camera in form of
> Maemo Leste on N900.... Unfortunately we don't have anything in
> userspace that can be used to work with the camera.
> 
> This attempts to be minimal solution to get libv4l2 to work.

libv4l2 is mostly deprecated. How about contributing an OMAP3 ISP
pipeline handler to libcamera instead ? :-)

> It enables passing camera pipeline description to libv4l2, so that
> controls are mapped to appopriate devices, and libv4l2 can be used
> with complex camera.
> 
> It is useful for testing kernel parts of N900 subsystem, and it will
> serve as a basis for autofocus work and autogain improvements.
> 
> Signed-off-by: Pavel Machek <pavel@ucw.cz>

[snip]

-- 
Regards,

Laurent Pinchart
