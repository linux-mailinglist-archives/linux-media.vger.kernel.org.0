Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC99822011
	for <lists+linux-media@lfdr.de>; Sat, 18 May 2019 00:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729648AbfEQWHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 18:07:22 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39611 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbfEQWHW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 18:07:22 -0400
Received: by mail-lf1-f68.google.com with SMTP id f1so6358947lfl.6;
        Fri, 17 May 2019 15:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qAXH8WLS9eXwvjAs7s6ui70yKrWvzvE/cb5xKE1rQoI=;
        b=WNS7fP35GhJTFDGBVMSs4oo1H9Pfn7Mve3BPbKjxUaJb7enATqoCvxjRpTGSOuTo7U
         uNHqM9xBRK98LyG5xlf+FW0jo40o8eQPSaBltiK6Z5rs88juL2FxGAsazCACrgQ1Mfem
         GsEawCOR5RAGRQt9uWnU7homqGIF39miGlupeEmrUOrLhIALyIljfs6j51aWZyipQkl3
         asMu4S+Ah6k3H8BDmbxybr6Ndaxbzy/c2DPkstE6F1n5m36myVJTqh7Oh4CTL8Y88Zwp
         7B8VhFDVQzHMAu9CxiG97mvQxp1Z7FrcQzOFJbhxxkyRYpvdbCnNEMfgdvA52wvDpHxC
         QLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qAXH8WLS9eXwvjAs7s6ui70yKrWvzvE/cb5xKE1rQoI=;
        b=GTMT/3SLiF7B2J5NDdVkxtRm0zE1kHiahw3vdxBHd4FYsBncxX61xUlIoDPNgcAiTG
         AgR2t7lZgZsKlGzpYf31M7jWSJmxZBs60IA3Jd6tZqnu72gh1tFAwopxaKmyGGOJcqFU
         8Dn9nYUM0lT18wQ6mxvxrZobl6/Igg22SOj12fhM4/94AO5qc4we8Tm75+7j265tOo57
         qgzJxkEDueFLit06Nnjr6XF3OblOlFSCgjZcBFiyINiJj0NWR+7zNh7oa/gKvggfTEoA
         fYIBEthxn8iHlTUhR2KUcZZMttoLLS+FWrdw1Hh8wf3QPgmwToVNtDhAeK970vw2hK4R
         /Lmw==
X-Gm-Message-State: APjAAAWY24oNFtf7MG0Biehyb68KMG5+C9BL8KWF+OlN+HZjULaw/ote
        1K+aFMH71fBDxjSZLPRfDgI=
X-Google-Smtp-Source: APXvYqySY595Yxo7NLXzL/BYKTDRIBHssUSW9UsPtOWDnI5m3Nwzfz7CI1SyZOzksQd8ikZjYFnEyQ==
X-Received: by 2002:ac2:424b:: with SMTP id m11mr14782165lfl.71.1558130840192;
        Fri, 17 May 2019 15:07:20 -0700 (PDT)
Received: from z50.localnet (78-10-164-223.static.ip.netia.com.pl. [78.10.164.223])
        by smtp.gmail.com with ESMTPSA id i7sm1927756lfi.49.2019.05.17.15.07.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 15:07:19 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
Date:   Sat, 18 May 2019 00:07:17 +0200
Message-ID: <1625662.l8oChD4zDb@z50>
In-Reply-To: <20190517155839.khjyor4cy6vg5vwf@paasikivi.fi.intel.com>
References: <20190514224823.11564-1-jmkrzyszt@gmail.com> <1943741.XiKEDqKQ7m@z50> <20190517155839.khjyor4cy6vg5vwf@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Friday, May 17, 2019 5:58:40 PM CEST Sakari Ailus wrote:
> Hi Janusz,
> 
> On Wed, May 15, 2019 at 10:56:36PM +0200, Janusz Krzysztofik wrote:
> > Hi Sakari,
> > 
> > On Wednesday, May 15, 2019 9:16:02 AM CEST Sakari Ailus wrote:
> > > Hi Janusz,
> > > 
> > > On Wed, May 15, 2019 at 12:48:21AM +0200, Janusz Krzysztofik wrote:
> > > > -static int check_crop(struct v4l2_subdev *sd, struct v4l2_subdev_crop 
> > *crop)
> > > > +static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
> > > >  {
> > > > -	if (crop->which != V4L2_SUBDEV_FORMAT_TRY &&
> > > > -	    crop->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> > > > +#if defined(CONFIG_MEDIA_CONTROLLER)
> > > > +	if (sd->entity.num_pads && pad >= sd->entity.num_pads)
> > > 
> > > One more comment.
> > > 
> > > The num_pads doesn't really tell whether a given op is valid for a 
device.
> > > Well, in this case it would have to be a bug in the driver, but those do
> > > happen. How about checking for sd->entity.graph_obj.mdev instead? It's
> > > non-NULL if the entity is registered with a media device, i.e. when 
these
> > > callback functions are supposed to be called.
> > 
> > Before I do that, let me undestand your point better.
> > 
> > My intentions were:
> > 1) to provide a check for validity of a pad ID passed to an operation, not 
ann 
> > eligibility of a driver to support the operation,
> > 2) to not break drivers which don't set pad_num, especially when building 
them 
> > with CONFIG_MEDIA_CONTROLLER turned on for whatever reason.
> 
> Indeed.
> 
> But these checks still allow calling the pad operations on sub-devices that
> have no pads. That should not be allowed. Pads are a Media controller
> concept, they do not exist outside it; therefore checking for pads only if
> the subdev is a part of the media device would be entirely correct.

OK, now I see your point.  You don't want the check to succeed if a media 
entity has num_pads == 0.

> It should probably accompany a check that requires the pad number is zero
> if the subdev doesn't have a graph object, even if the pad field isn't
> supposedly used for any purpose. Would that address your concern?

Yes, that's acceptable.  Let's require subdevice drivers to register as media 
entities if they want to use pads > 0.

I'll update the patches and submit as v7 soon.

Thanks,
Janusz

> > Since pad IDs are verified against pad_num which may be not set, we should 
> > obviously check validity of pad_num before comparing against it.  Since 
media 
> > controller compatible subdevices need at least one pad, I think the check 
for 
> > non-zero pad_num is quite reasonable.
> > 
> > Moreover, old drivers are actually using those pad operations you describe 
as 
> > not supposed to be called.  They are using them because they were 
converted to 
> > use them in place of former video ops.  Already dealing with pad IDs, they 
may 
> > decide to turn on CONFIG_MEDIA_CONTROLLER and use selected functionality, 
for 
> > example register pads, without implementing fulll media controller 
support.  
> > Why should we refuse to perform pad ID verification for them?
> 
> 




