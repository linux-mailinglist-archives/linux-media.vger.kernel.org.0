Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62812144A93
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 04:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgAVDs3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 22:48:29 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38043 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728900AbgAVDs3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 22:48:29 -0500
Received: by mail-pf1-f196.google.com with SMTP id x185so2634616pfc.5
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 19:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KadZgXrBtO4mVuKeTcVoWP21ln+Btq+vvbOWpeDpln8=;
        b=CaED7IQMeGfxusCT6+3cakdWwWTFDcVNFi3XT3OopLYBw7YlrGgkiI2fRxqWZ9o8LK
         oylPl9WM1Bu5ILGNSdvQT+TjpwAbOkqnpJr6wm1SqC+f2TD+vL7Pt5mOx2yAXFP49lGE
         VsjEDmSCrcoh0CYc/b7527lvoL07bTexhdh50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KadZgXrBtO4mVuKeTcVoWP21ln+Btq+vvbOWpeDpln8=;
        b=HVDWYnDb3b0K0TBvoq/jIMDf/xNlDZXn5wnyvPPb+YYLJ0NSWicHW7barjuwDAfnPR
         fy4V7HMFS0YmaskJG2v/6EHlpySbUSZh1Qs4uctgFE1vBCcZagcQsqTYbXYSW7jda00u
         MDUKN+Ea2GMpCoROZ2hTpERpVxCC3AlmDIu/IBcqq36Ah18XLwBD5ODfjNa+/rAINPkH
         rBPzMyRmrYrdoQyqkngso15rJosta4YKJT8ddguQAznnc/EQdVpoBqOYBqdeJEam7/iA
         aGEBbrOc0sR/cT5bi3MMS7dqzSbT1sJUVpvCtbb4ktCh8bDUk4FN0keDhFaoyQpR+cgd
         5Bvg==
X-Gm-Message-State: APjAAAWBMzYblj5EeCV7XiZIiXcPcRFq0N9CzmV7LQ8O0QFQ/PFUZnUA
        aRNxCC710f6gkZSYpXYl57D87w==
X-Google-Smtp-Source: APXvYqx00s1zj1f3z6a3QsGHpNeUuQypaOEQyTDGgMiU+6RS6ErEU6Tp/bmkEtJkcyZebk41iuOn8Q==
X-Received: by 2002:a65:488f:: with SMTP id n15mr9491436pgs.61.1579664908564;
        Tue, 21 Jan 2020 19:48:28 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id b21sm47755963pfp.0.2020.01.21.19.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 19:48:27 -0800 (PST)
Date:   Wed, 22 Jan 2020 12:48:26 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC][PATCH 05/15] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT in REQBUFS
Message-ID: <20200122034826.GA49953@google.com>
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-6-senozhatsky@chromium.org>
 <8d0c95c3-64a2-ec14-0ac2-204b0430b2b4@xs4all.nl>
 <20200122021805.GE149602@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122021805.GE149602@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/01/22 11:18), Sergey Senozhatsky wrote:
[..]
> > > +    * -
> > > +      - __u32
> > >        - ``reserved``\ [1]
> > >        - A place holder for future extensions. Drivers and applications
> > > -	must set the array to zero.
> > > +	must set the array to zero, unless application wants to specify
> > > +        buffer management ``flags``.
> > 
> > I think support for this flag should be signaled as a V4L2_BUF_CAP capability.
> > If the capability is not set, then vb2 should set 'flags' to 0 to preserve the
> > old 'Drivers and applications must set the array to zero' behavior.
> 
> The patch set adds V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS towards the end of the
> series, I guess I can shuffle the patches and change the wording here.

Or I can add separate queue flag and V4L2_BUF_CAP:

struct vb2_queue {
...
	allow_cache_hints:1
+	allow_consistency_hints:1
...
}

and then have CAP_SUPPORTS_CACHE_HINTS/CAP_SUPPORTS_CONSISTENCY_HINTS.

	-ss
