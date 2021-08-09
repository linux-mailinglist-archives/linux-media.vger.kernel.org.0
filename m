Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D7F3E4EA8
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 23:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235126AbhHIVla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 17:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhHIVl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 17:41:28 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F7FC0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 14:41:07 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 567B71B00242;
        Tue, 10 Aug 2021 00:41:04 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1628545264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FiTJaYOwVGIPLxR+FyP/XsDOMG1O+zP5IdSTR1AM7qU=;
        b=ownClaxrQxwpRCmB/zuQxwdxOoHsuwvj05leeERNeqBTeZEqhiHBlDJao7GuMCvA5NagjL
        6ixuU/z0lTgBbu/XN254+QPbkhd/XselaHy+2yA8ec5vVF8oX8frc7a8DXO0t3prD75nxm
        JyCbQPMVt/9pxRR96KQHFBSvGIRevreZ+XSU0LrAEHpG5ExtLbKKPHb1g/ygYubQWgHb4X
        uiubsH3hl5hrSkuPpp6g+rItS/B0IoDIzmq7pJIWj1lOlkneyKW0Fuo/4YwNXHgjIZCP3M
        NsHjIcZ41WhhkXmNezBYlHL+1Wei4UpQUUJlqJ4o/baPnAh2//syy5y9ZDXxtQ==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0036D634C89;
        Tue, 10 Aug 2021 00:39:26 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1mDD0u-0003tS-Um; Tue, 10 Aug 2021 00:40:53 +0300
Date:   Tue, 10 Aug 2021 00:40:52 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     David Plowman <david.plowman@raspberrypi.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS
 control
Message-ID: <20210809214052.GI3@valkosipuli.retiisi.eu>
References: <20210809093448.4461-1-david.plowman@raspberrypi.com>
 <20210809093448.4461-2-david.plowman@raspberrypi.com>
 <21527f47-3c9e-55e2-3973-bfd0ebc91c2e@xs4all.nl>
 <YREdXF2XhR6WA+50@pendragon.ideasonboard.com>
 <54c13814-634d-b0db-1e8c-965dbb45fa0f@xs4all.nl>
 <CAHW6GYKAYq=MaJBF3HRvuR1=oYOWXgGjK-DHXSvxmSAqcHPJ0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHW6GYKAYq=MaJBF3HRvuR1=oYOWXgGjK-DHXSvxmSAqcHPJ0g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1628545264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FiTJaYOwVGIPLxR+FyP/XsDOMG1O+zP5IdSTR1AM7qU=;
        b=BYaJaCQjgilHMzCjAQcERTysxrYBKmMI7x8UicKRd1zQIR1cpwtNJZrkaMG8Fnb8wxvPnf
        9IckbWGQM1E4a6y7Rd3Kqx4x61PU/VP+GVu2xThJTW1ZqiZSCxvyuspXhWzBjiO8u/yqrM
        hTT8H30VjGXbpIhf1HPFRrOHbTZntgloYTAJznzVvf6TbgL7JxhDK58Qt/kd0WgPq1eRoT
        UZdytmTsu/jxr+GRoPtKP5RPUA+si5F6DdoRdtgqtLRr5lUeU0wZRevVVAgFuVsZM0NXIo
        sKeaYUQ0Q3q47g58FcESpLYcYeNdUj78AsHLKZdV+gmCBkxwUHjBG0Zbch2rxw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1628545264; a=rsa-sha256;
        cv=none;
        b=mMPdHWgV9UvE8LtUybw6Xs2/T1TNHrWSgNTBmKjBeGOyJGFA0rQx1Ev1zNCmDac8364VD8
        qN+83cfcqmf4mbpZ7MEjNajgmplrx1ztxde+WOJLbiCHXn65xgMA3LT+Y0ot9HzJ3SmKiX
        uS9RQgYgrWnDMzpgbkrAFzTp0nDIZ9hwEYA6QVgfxPJWiSNaYdUe/tZkJFc2jeD/nV3phQ
        Hv9GC4cTbgpbx4i9jtPT2FLbrfMvwXk/PABIly7nKu7yWXzp7HERjMyf9vxR7MrwfTThMy
        GZVmGB4xksanrZwNxye+CEPFGlMI/ywiQIFAkMp2VChrCwPjUCGxSdOD7zX4GQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

On Mon, Aug 09, 2021 at 01:31:44PM +0100, David Plowman wrote:
> Hi everyone
> 
> On Mon, 9 Aug 2021 at 13:24, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >
> > On 09/08/2021 14:19, Laurent Pinchart wrote:
> > > Hi Hans,
> > >
> > > On Mon, Aug 09, 2021 at 01:05:00PM +0200, Hans Verkuil wrote:
> > >> On 09/08/2021 11:34, David Plowman wrote:
> > >>> We add a new control V4L2_CID_NOTIFY_GAINS which allows the sensor to
> > >>> be notified what gains will be applied to the different colour
> > >>> channels by subsequent processing (such as by an ISP), even though the
> > >>> sensor will not apply any of these gains itself.
> > >>>
> > >>> For Bayer sensors this will be an array control taking 4 values which
> > >>> are the 4 gains arranged in the fixed order B, Gb, Gr and R,
> > >>> irrespective of the exact Bayer order of the sensor itself.
> > >>>
> > >>> The units are in all cases linear with the default value indicating a
> > >>> gain of exactly 1.
> > >>
> > >> So a value of 2 means a gain of 2? Or are these fixed point values? How do
> > >> I represent a gain of 1.5?
> > >
> > > No, the default value corresponds to a x1.0 gain, but it's not 1. If the
> > > default is, let's say, 128, then x2.0 will be 256.
> >
> > Ah, now I get it. Perhaps a small example of this in the documentation patch will
> > help clarify this.
> 
> Yes I agree that would be helpful. I'll put that in the next version
> shortly (just waiting to see if there are any other changes
> suggested).

The digital gain control has the same semantics, see
Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst .

-- 
Regards,

Sakari Ailus
