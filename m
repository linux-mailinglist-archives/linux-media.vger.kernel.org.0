Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E0A1746B0
	for <lists+linux-media@lfdr.de>; Sat, 29 Feb 2020 13:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgB2MQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Feb 2020 07:16:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgB2MQ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Feb 2020 07:16:27 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD0EB2AF;
        Sat, 29 Feb 2020 13:16:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582978585;
        bh=UVKKq+A0bOzlYXiyFXTM4MZNHNEcpcBbPauSlZl8nKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ai8QyPDL+Evl+OvFd2/6Rkuk863rbagwCyiPCb0UYKxJt0uu7oWLNIZKWgOKN5boV
         OCjmnJU97if5HKZS/Rf1PiKk1wI0/pXRIJRofl8tHI2jiyj13MfVvI54/n3F+HATfs
         AUClDtQXouB3F6f8S6y15P5s5usHBkQzqO+Y+7Ag=
Date:   Sat, 29 Feb 2020 14:16:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     gert.cauwenberg@telenet.be
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [V4l2-library] Macro Silicon M2106
Message-ID: <20200229121602.GA6746@pendragon.ideasonboard.com>
References: <1776591343.116854534.1582965890081.JavaMail.zimbra@telenet.be>
 <827808095.116935408.1582967209344.JavaMail.zimbra@telenet.be>
 <f3e95f98-1b70-d312-2cb7-467b4b31d72b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f3e95f98-1b70-d312-2cb7-467b4b31d72b@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gert,

On Sat, Feb 29, 2020 at 01:07:34PM +0100, Hans Verkuil wrote:
> (changed the mailinglist to linux-media since this topic is not related to libv4l2
> and CCed Laurent who might know more about this)
> 
> On 2/29/20 10:06 AM, gert.cauwenberg@telenet.be wrote:
> > Hello,
> > 
> > About a year ago a page about a new Easycap variant was added to the wiki -
> > https://linuxtv.org/wiki/index.php/Talk:Easycap
> > Has anybody been working on this? I just bought a video grabber - and it seems to be one of those...
> > 
> > Sold as BASETech BR116, but lsusb lists it as ID 534d:0021 MACROSILICON AV TO USB2.0
> 
> No, to my knowledge nobody is working on this.
> 
> It's not clear from the wiki what exactly is wrong, Laurent might have
> some insight in that.

The first error reported by the driver is

[47452.103222] uvcvideo: UVC non compliance - GET_DEF(PROBE) not supported. Enabling workaround.

It is quite common for UVC devices not to support GET_DEF on the PROBE
control (I assume because the Windows driver doesn't use that request),
so the uvcvide driver falls back to a different method automatically.
However, in some less common cases, invalid requests can actually crash
the device firmware. Let's thus first check if enabling the workaround
without trying the unsupported request helps. This is done by setting
the UVC_QUIRK_PROBE_DEF quirk (0x100). Could you

- Unload the uvcvideo driver (rmmod uvcvideo)
- Reload the driver with the quirk (modprobe uvcvideo quirks=0x100)

and see if it fixes your issue ?

Could you also please send me the output of

lsusb -d -v 534d:0021

running as root if possible ?

-- 
Regards,

Laurent Pinchart
