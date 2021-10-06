Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC554423E5F
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 15:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238558AbhJFNFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 09:05:10 -0400
Received: from meesny.iki.fi ([195.140.195.201]:58998 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230304AbhJFNFJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 09:05:09 -0400
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 22E8A2022B;
        Wed,  6 Oct 2021 16:03:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1633525393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ceJuR3J1WGrekVYd4ebGmMBql3ZO6EZNXzBCGWHZgmw=;
        b=BZqPiIC2chFZobx8eWhg7sn+NbQEwbHbAnhxa9OKG2823VTwRU8FICKdC5T+g6UUOIJkg7
        fpF/uLmOkft8vMHFvz1Kwd8OBrlReBuXW3r132VkS714dcJUqgavDnECQZfViUsiDEjI09
        X20h+MqSHgR2bh/fQ/S5D6ZZkTy2NyQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 93A55634C90;
        Wed,  6 Oct 2021 16:03:12 +0300 (EEST)
Date:   Wed, 6 Oct 2021 16:03:12 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 0/2] New V4L2 control V4L2_CID_NOTIFY_GAINS
Message-ID: <YV2ekHnPq3+sFe32@valkosipuli.retiisi.eu>
References: <20210816113909.234872-1-david.plowman@raspberrypi.com>
 <YTdp9Ux0p38F+hfz@pendragon.ideasonboard.com>
 <CAHW6GYJ8cSDJ+DMejrm3EjwGRWoebVsM1OuUfwH-YBP5gO6qTQ@mail.gmail.com>
 <YVz3griwfTn4xvG/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVz3griwfTn4xvG/@pendragon.ideasonboard.com>
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1633525393; a=rsa-sha256; cv=none;
        b=uJNGHlbVL+c+s3ridxJZYhlsQEWtvSLkneJKfOJ2JCM3hqgdsU/wNAEmLr/vGoyPYZr7SG
        KGi5Dm4GdDB1DLwTn/t7/GlEyf0KEjTe3NaB8PzmXXjv/T/sSpH195JmWiS/3kGNYYdJ92
        o2BoS50zvTurex6pvRLTtVXt17U2B88=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1633525393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ceJuR3J1WGrekVYd4ebGmMBql3ZO6EZNXzBCGWHZgmw=;
        b=JBtVh+S09Mjn2dWoy1NaLC7MnP3hADJefJEDLiyXoKaNr/WzefrJw8oCiU0ivPoRngAPoP
        mA4tki95idathdETL5gOLGfyvUgXNCCNGsLn8VO60jV8lVI0ccyYVp45e8nJ36Gpv5LQhT
        aXuNZ4CXmm0voZ1VxlzbtfivKPDapnE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David, Laurent,

On Wed, Oct 06, 2021 at 04:10:26AM +0300, Laurent Pinchart wrote:
> Hi David,
> 
> On Tue, Oct 05, 2021 at 10:37:54AM +0100, David Plowman wrote:
> > Hi Laurent, Sakari, everyone
> > 
> > I was wondering whether I might give this another little nudge just so
> > that it doesn't get lost.
> 
> I've already reviewed it, I can only join you to nicely ask Sakari if he
> could have a look :-) I know he has lots of patches on his plate at the
> moment though.
> 
> Hans, would you like to share your opinion on this series ?

The patches have been merged some time ago to the media tree master branch:

commit 311a839a1ad255ebcb7291fb4e0d2ec2f32312a7
Author: David Plowman <david.plowman@raspberrypi.com>
Date:   Mon Aug 16 13:39:09 2021 +0200

    media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control
    
    Add documentation for the V4L2_CID_NOTIFY_GAINS control.
    
    This control is required by sensors that need to know what colour
    gains will be applied to pixels by downstream processing (such as by
    an ISP), though the sensor does not apply these gains itself.
    
    Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
    Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

commit a9c80593ff80ddb7c6496624e5384e1ea3460a72
Author: David Plowman <david.plowman@raspberrypi.com>
Date:   Mon Aug 16 13:39:08 2021 +0200

    media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
    
    We add a new control V4L2_CID_NOTIFY_GAINS which allows the sensor to
    be notified what gains will be applied to the different colour
    channels by subsequent processing (such as by an ISP), even though the
    sensor will not apply any of these gains itself.
    
    For Bayer sensors this will be an array control taking 4 values which
    are the 4 gains arranged in the fixed order B, Gb, Gr and R,
    irrespective of the exact Bayer order of the sensor itself. The use of
    an array makes it straightforward to extend this control to non-Bayer
    sensors (for example, sensors with an RGBW pattern) in future.
    
    The units are in all cases linear with the default value indicating a
    gain of exactly 1.0. For example, if the default value were reported as
    128 then the value 192 would represent a gain of exactly 1.5.
    
    Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
    Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
Kind regards,

Sakari Ailus
