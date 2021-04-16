Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C8A361C94
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 11:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239598AbhDPI4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 04:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239094AbhDPI4r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 04:56:47 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84288C061756
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 01:56:21 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id n138so43717310lfa.3
        for <linux-media@vger.kernel.org>; Fri, 16 Apr 2021 01:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yUDT0DU20s6Nx1WoIVeCfU2ndBTpRcqc+zCTaRbEHK0=;
        b=1v6tu4lTW5+LRhYt+iIxiOWdi7LwIZeMxPRibTEevnzLNmKYnoBo9Qls3r1sC+Gkmk
         Qz9Jb3k/y2L1A8FbZy7k8Vu5TlkyETn0X1igI28hpZwOEUkgkMtvHcJ1LeY46eqEtOSv
         aF9t8aK+PzEe6OM0NoPYLWDrvbLY60VNQnpK8Y9/ACbtZ0p13WLQf5XAdROA9Jg4PnrO
         hbO0Iypkg5Vsdb6gKRsV8rmxsyqaJxcVhRwj+iymSwlRz63dR+X89pVTD3NK2FQpzRtD
         tt4cbEHQjbFiIWCBxmit8sOOo3kVl4jEttRA/nW24eyngyyC4ooPhnQxUgBKF9IB/eli
         cf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yUDT0DU20s6Nx1WoIVeCfU2ndBTpRcqc+zCTaRbEHK0=;
        b=CGPCUeMywZcUOqzVDw8JI+7b1JMMF4XbePbyC17N0SrGZbZkwF0Ya2Z4xqKlfQboR3
         hxMC4qJJZFCpeU/M9M5IMbCVZVFPD13/y0eeL4CJQo5ZusfQ4Ijf7uSvxx++M1L7gCWR
         aOjxjTPkVN+lYFSeNtVx3NIonATZJvX/BFNivNmx5fmh/9n1pXthzmxQNJgnRUmDMDlv
         d69sr5oOZIda/RBMooyuHvMDs8IRYWLwuCQb1PuqYGFefyEGRZ5Nm8aVqxw63ZykyVte
         KIRa4MG9zcqA7RQw2TzQuQVBOV5dz0qn3IY6C2NMc/wTLA3fRIg37XqbK3xJ6sifdhMW
         eRGg==
X-Gm-Message-State: AOAM5333LBnoQ7KsA7X/eENRb6geu/1tYooRbjBj1bAej0I7iQYPV6Kv
        dYxY5wZgTew74wlFhC7xO5B02A==
X-Google-Smtp-Source: ABdhPJy5O9VSDOVxYOpg7bJfv9sFQZsqczqiB3RGtyI5SQu0WBY9spM4bhS9yIEWjdo23mf2Ip2EBA==
X-Received: by 2002:a19:dc0b:: with SMTP id t11mr2351910lfg.233.1618563380044;
        Fri, 16 Apr 2021 01:56:20 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id m5sm925550lfl.303.2021.04.16.01.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 01:56:19 -0700 (PDT)
Date:   Fri, 16 Apr 2021 10:56:18 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 00/24] v4l: subdev internal routing
Message-ID: <YHlRMuEtxUSAZi8I@oden.dyn.berto.se>
References: <20210415130450.421168-1-tomi.valkeinen@ideasonboard.com>
 <YHlND8NhEs+lkDZB@oden.dyn.berto.se>
 <2ed56266-2613-c1d2-bde0-989769264050@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ed56266-2613-c1d2-bde0-989769264050@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On 2021-04-16 11:47:46 +0300, Tomi Valkeinen wrote:
> Hi Niklas,
> 
> On 16/04/2021 11:38, Niklas Söderlund wrote:
> > Hi Tomi,
> > 
> > I'm very happy to see this being worked on again!
> > 
> > Is there code somewhere that demonstrates the v5 API in use? I still
> > have old branches of this series and it would be nice to see how the API
> > have evolved for drivers.
> > 
> > Likewise are there some user-space code around that can be used to test
> > the API? For v2 and v3 I had some hack patches [1], do they still work?
> > More likely they have gone stale by now :-)
> > 
> > 1. git://git.ragnatech.se/v4l-utils routing
> 
> Yes for both. I didn't share those as they're not in a presentable state =).
> 
> But, with the disclaimer that your eyes may bleed when reading the code:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git
> multistream/work
> 
> git://github.com/tomba/kmsxx.git multistream
> 
> On the kernel side, the CAL driver is in relatively good shape. UB960 driver
> is somewhat messy but not totally horrible. OV10635 is horrible, as it's
> used to fake metadata stream even if the sensor doesn't really have such a
> thing.
> 
> For testing I have used kms++ with python bindings. My test script is
> py/tests/cam.py
> 
> The uAPI has changed as there's now the 'which' field. But I think that's
> the only clear change, although the behavior could be slightly different
> wrt. setting formats.

Thanks!

> 
>  Tomi

-- 
Regards,
Niklas Söderlund
