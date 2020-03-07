Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37A6D17CD52
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 10:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgCGJqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 04:46:38 -0500
Received: from mail-pj1-f43.google.com ([209.85.216.43]:52686 "EHLO
        mail-pj1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbgCGJqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 04:46:38 -0500
Received: by mail-pj1-f43.google.com with SMTP id lt1so2128396pjb.2
        for <linux-media@vger.kernel.org>; Sat, 07 Mar 2020 01:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RrUVYR+Ncmf3+5c5RCoXaObVour9qF7+lbeQrqlz+7c=;
        b=MRcjzBNzTh5m3HSl5QjeZjeXKY2VA6NvugpKkaY9BkbYggMALXdwJmatwbyzt4HVaN
         FNVwzPydWl9DfNHfnZpihcslmKiTLENkCGlOZ1pnwEXwB5KfPBF87uI20I4WeQLruafb
         k51o3Yw1Kue72BUfoIjgvPAQ90aUwsFtPxcMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RrUVYR+Ncmf3+5c5RCoXaObVour9qF7+lbeQrqlz+7c=;
        b=f6v3Se3bxKWWVy8NaouPuEK071tmj+trjSBR7mZ4DdWv76Ux+OfPoMxyOXZTf3I79L
         3lMzv54NZaojFekPYEf+i9tycMjcvFdkTJpwcekRxUsRcebG/r7nS3uOD/UV3UBKdSZn
         y1dXtA1OkJwliPV0O/FwNDvuj8UdCyk9RFuhIW2skRT95IL1Lz1rD0E5BfFeBcw4aT5+
         jNilOGBNl1deb0S+22OSkwgOfII7LZ+i17z2ofK6R3mqcgsSoR7N02LaMdq3iiDgDzeg
         ex663Gycmxd34t92uNGOYpHLBaoDYzwO1uGnTFAz41rLZ6a08aP+jqJDkHgq5kWAMYJ/
         Vskg==
X-Gm-Message-State: ANhLgQ325mRL0SLU3yQEwP6TMysvGLuhm5CKSVTDeEAIOQUIopISGKbx
        9LpW5T/46hQ9khjRvuEm7Y0veg==
X-Google-Smtp-Source: ADFU+vu/3aSIwqudH328r7Q6d2ReouzpmLb4lMtmayKrIiBYtfhZmjNz5NkivGbIl4PV33pL8GnFfQ==
X-Received: by 2002:a17:902:b497:: with SMTP id y23mr6987040plr.81.1583574397292;
        Sat, 07 Mar 2020 01:46:37 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id b10sm11855226pjo.32.2020.03.07.01.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2020 01:46:36 -0800 (PST)
Date:   Sat, 7 Mar 2020 18:46:34 +0900
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
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
Message-ID: <20200307094634.GB29464@google.com>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-2-senozhatsky@chromium.org>
 <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17060663-9c30-de5e-da58-0c847b93e4d3@xs4all.nl>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/06 14:57), Hans Verkuil wrote:
[..]
> >   * @lock:	pointer to a mutex that protects the &struct vb2_queue. The
> >   *		driver can set this to a mutex to let the v4l2 core serialize
> >   *		the queuing ioctls. If the driver wants to handle locking
> > @@ -564,6 +573,7 @@ struct vb2_queue {
> >  	unsigned			requires_requests:1;
> >  	unsigned			uses_qbuf:1;
> >  	unsigned			uses_requests:1;
> > +	unsigned			allow_cache_hints:1;

Shall I use "unsigned int" here instead of "unsigned"?

	-ss
