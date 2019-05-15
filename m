Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 641AD1FBDD
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 22:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfEOU4l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 16:56:41 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42030 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfEOU4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 16:56:41 -0400
Received: by mail-lj1-f193.google.com with SMTP id 188so1041949ljf.9;
        Wed, 15 May 2019 13:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nKwefnJo5YJrYqWfMruLqrWt5JT9/MOqPcL6hS0ecvg=;
        b=GVmKIFglLz/jVTQZHP+YWVW5FzXB+lBEEU46re5vDPEQt723AC2N5J0SXpKwFTNrJC
         ELUTuTt88Qa/GbSnCDDuvf+UyT4ek9NFRNPMtXf8ElItfhU2nZ+QpSdu8bKSRzeIZHbx
         g1fmGlh2Wex0guWctm8ZWM382meIMtfBBBbMiIGZ77mNKx/1DgYzahua6ipGat56dzgL
         /pWqwMA/qj6WCGzDABmnGiGOSrOXJ1GCOID7qkH0mciN8TQOavIVI1VMAd/mKGfjcskA
         10uexC1xg3yZfziJ493EhqEKhJiAJqYnUei4HmTaG88vUTeyQSb+U+SGf6iRMt2XjYck
         lG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nKwefnJo5YJrYqWfMruLqrWt5JT9/MOqPcL6hS0ecvg=;
        b=FICTM02pSLc6yNGhdOhGWPaIouOSvO8pVht4gy7718C9jFAMZ0m5zQk66GNGbC2wml
         HQR/ywnjJJtPvkdJl9OP8nLdtGv8Oo/J1Q8tk0TzEu3HnoKhx2lH81RR77Zhl4aC2Ftm
         l6TtjkrsrLFfnNGtd8MWJqHlswm34CkovHLi9HGvnut3usAg9ft5Q/shM6tG5HEANMBH
         TGeroCZCqpo3Oc5VV4Utum3GYTLo1htGUCZmEsUlpPpFcZI0S7rDXFazf5gWJ/E++9aZ
         jZP9zMCaL0ifQxPEhmvqmdFvOSMvE27csm+8QpCcd/AJMxgjLzDYhZCoguAvmJRPeci+
         /zNA==
X-Gm-Message-State: APjAAAW+Z7tohMOJqpE7gCyCHsIV5IKFzlBoq+aGumTDrya9b6W18aKM
        Kgtc0NUBP/NnRXYsSFuztX1wK/oC
X-Google-Smtp-Source: APXvYqwU+EDVRLLJaMTz2Jrna8FKHwyluCSKdSLSBeNjGqCxjfPth1ysP7Auu2DllGlKwtgYN65yJg==
X-Received: by 2002:a2e:9a1a:: with SMTP id o26mr7219846lji.174.1557953799240;
        Wed, 15 May 2019 13:56:39 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id y19sm573574lfl.40.2019.05.15.13.56.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 13:56:38 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] media: v4l2-subdev: Verify arguments in v4l2_subdev_call()
Date:   Wed, 15 May 2019 22:56:36 +0200
Message-ID: <1943741.XiKEDqKQ7m@z50>
In-Reply-To: <20190515071601.knfdhwofz6ukjmxt@paasikivi.fi.intel.com>
References: <20190514224823.11564-1-jmkrzyszt@gmail.com> <20190514224823.11564-2-jmkrzyszt@gmail.com> <20190515071601.knfdhwofz6ukjmxt@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wednesday, May 15, 2019 9:16:02 AM CEST Sakari Ailus wrote:
> Hi Janusz,
> 
> On Wed, May 15, 2019 at 12:48:21AM +0200, Janusz Krzysztofik wrote:
> > -static int check_crop(struct v4l2_subdev *sd, struct v4l2_subdev_crop 
*crop)
> > +static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
> >  {
> > -	if (crop->which != V4L2_SUBDEV_FORMAT_TRY &&
> > -	    crop->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> > +#if defined(CONFIG_MEDIA_CONTROLLER)
> > +	if (sd->entity.num_pads && pad >= sd->entity.num_pads)
> 
> One more comment.
> 
> The num_pads doesn't really tell whether a given op is valid for a device.
> Well, in this case it would have to be a bug in the driver, but those do
> happen. How about checking for sd->entity.graph_obj.mdev instead? It's
> non-NULL if the entity is registered with a media device, i.e. when these
> callback functions are supposed to be called.

Before I do that, let me undestand your point better.

My intentions were:
1) to provide a check for validity of a pad ID passed to an operation, not ann 
eligibility of a driver to support the operation,
2) to not break drivers which don't set pad_num, especially when building them 
with CONFIG_MEDIA_CONTROLLER turned on for whatever reason.

Since pad IDs are verified against pad_num which may be not set, we should 
obviously check validity of pad_num before comparing against it.  Since media 
controller compatible subdevices need at least one pad, I think the check for 
non-zero pad_num is quite reasonable.

Moreover, old drivers are actually using those pad operations you describe as 
not supposed to be called.  They are using them because they were converted to 
use them in place of former video ops.  Already dealing with pad IDs, they may 
decide to turn on CONFIG_MEDIA_CONTROLLER and use selected functionality, for 
example register pads, without implementing fulll media controller support.  
Why should we refuse to perform pad ID verification for them?

Thanks,
Janusz




