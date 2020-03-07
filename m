Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC1FA17CCC4
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 09:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgCGII7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 03:08:59 -0500
Received: from mail-pf1-f179.google.com ([209.85.210.179]:38087 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbgCGII7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 03:08:59 -0500
Received: by mail-pf1-f179.google.com with SMTP id g21so2291459pfb.5
        for <linux-media@vger.kernel.org>; Sat, 07 Mar 2020 00:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nU16B2xp2DIniBDEEsyS+pcU0JMbdNxb8GbdumZjS0k=;
        b=HR10p5leSjFRnwqUNx/Gv31a/IZ40Dd7xPHR6I6PRT8uz9ssb0Y2Bz3NBM+yPWuZ52
         d2cv715aawG7DMJxN4yddW3r5hT2qweQjWwYUPr5Ei4zElV0V6jPGXeKDuI1Iu9Ozj7L
         rrgz+WPxWeUO3jBlE8MwXTq1Q07C46kQ7Li+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nU16B2xp2DIniBDEEsyS+pcU0JMbdNxb8GbdumZjS0k=;
        b=ZbrmvUDCbOxfKagk+zZ8VezGFsCVZjSZ0h2nZrh1hgpwhdBWVXhNr8fma9a4+4Z590
         D9F642UWhQlYZaCaCOD3Br8nZIGAG2Ci5QhQdnObn2Iulux7Kq7H9TS5Zet9iO/ZczoV
         xxSNSB/ES8J5TrmcPMq3hkMt2Zqi2KLJtb8p78PEHuZx+vVrXKw+kxMw6m3HoaI2uzSL
         XYT2D8xy2jRn57u3dmG8L0kqyIMZvuosw2b1+2/7P13t7TcdlXl4T897YMqw+0Ep2RR6
         n/EjAcSGUqwYI/XmvlRCJJhY2nzT3H7Q2IPagp6Jz7Ly8Lrrs/Xdu/uGATuhCoDC/Urk
         e+0A==
X-Gm-Message-State: ANhLgQ3+CT2Xs8i3Dd2t5GMclRVjC939UescMOAaWfEwfp7MN5QddAyD
        uTLh0dpHM9MgnuIugz4aLyHJAw==
X-Google-Smtp-Source: ADFU+vskDNL0SpSDH5EH2mSWBx/vmBvwPv11i4h/1pELnQ8rLtQ5q2SeYWpH0NindybguMHaTHjlrw==
X-Received: by 2002:a62:17d1:: with SMTP id 200mr7480449pfx.227.1583568538332;
        Sat, 07 Mar 2020 00:08:58 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id m12sm11775429pjf.25.2020.03.07.00.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2020 00:08:57 -0800 (PST)
Date:   Sat, 7 Mar 2020 17:08:55 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 00/11] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Message-ID: <20200307080855.GE176460@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <04241ce5-dc41-9ea8-a058-5c0d8f9ba5a4@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04241ce5-dc41-9ea8-a058-5c0d8f9ba5a4@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/06 15:18), Hans Verkuil wrote:
[..]
> As mentioned in my v4 review I found a serious bug when testing with
> v4l2-compliance. That meant that this series was not tested properly,
> which is a requirement for something that touches the core framework.

I run tests locally on my board, but the scenarios are rather limited.

> I've posted an RFC patch with my v4l-utils changes (assumes you've run
> 'make sync-with-kernel' first), but that's just very basic testing. You
> can use it as your starting point.

Thanks. I'll try to use it as a starting point and run more "diverse"
tests cases.

> It needs to be expanded to test the various combinations of flags and
> capabilities. I don't think there is a reliable way of actually testing
> the cache hint functionality, so that can be skipped, but the compliance
> test should at least test the basic behavior depending on whether or not
> the cache hints capability is set.

I'll take a look.

> I also would like to see a patch adding cache hint support to an existing
> driver (more than one if possible) and the compliance output when tested
> against that driver.

Need to talk to Tomasz and Pawel first.

> You should also test with the test-media script in contrib/test: run as
> 'sudo test-media mc' to test with all the virtual drivers. If it all passes,
> then that's a good indication that there are at least no regressions.

OK, let me try.

	-ss
