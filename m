Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3F12F7FFE
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 16:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbhAOPvH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 10:51:07 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:34628 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbhAOPvG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 10:51:06 -0500
Received: by mail-ot1-f44.google.com with SMTP id a109so8964633otc.1;
        Fri, 15 Jan 2021 07:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UWwfO6fUF3jtZTFE5DmkWv7oWxLHfv1fXYLbOJ6ASMY=;
        b=acW5vd9tA5IGEqARXWGahLHFYx8Ry9BMcbNk7jSXYqQlBeE7hSNAcsuFDfu+xHo8Vr
         I40npuFkD56hGIUcLsbLhGGPLhokvB2dJfaXCNVeGSs83iBlj+vBdjaVbg6pstuopUQ2
         u1MGE8VdTlhWmTdvbWGbpBLhyj8xTLgKxOd6I0AhHrWMkRtLaPjhHGmMR2OUza9buYfr
         4Yk4tcSBk+Gn4UqDgNKhxWDXAOJyRZUp90TZkDT5kiO8YUPNC8VgbuVsWSMQBqHkQPSf
         /dPuZ0OwZKRD8DEIU7PtIILSD1470cjoRCHwdTOBLIZg3ZzZoUlYVXGUp1sN4XJkjHuR
         zlZQ==
X-Gm-Message-State: AOAM531bMPCx05z8CbZPvJgXTv7ky6RDWMiAm1oEViSty+dJQHKyJ+A0
        VgXwZnX1cEQkG8Yf5w3Z+OdSyIrMKg==
X-Google-Smtp-Source: ABdhPJyLI97/zqP2+zMwbcvSjT7ER1S+YTAMTLyOVfHUEjDMlnWl0x4l5k7i1ZOWTLQMQsyMj3NRWQ==
X-Received: by 2002:a9d:1f7:: with SMTP id e110mr8442019ote.73.1610725825796;
        Fri, 15 Jan 2021 07:50:25 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w5sm1838406oow.7.2021.01.15.07.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:50:24 -0800 (PST)
Received: (nullmailer pid 1330230 invoked by uid 1000);
        Fri, 15 Jan 2021 15:50:24 -0000
Date:   Fri, 15 Jan 2021 09:50:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: ov5647: Fix filename
Message-ID: <20210115155024.GB1320747@robh.at.kernel.org>
References: <20210115101652.9275-1-jacopo@jmondi.org>
 <c77755a4-4386-f5b0-cb47-64227d022b4b@ideasonboard.com>
 <20210115110146.yu635kh4emdvbidy@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115110146.yu635kh4emdvbidy@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 15, 2021 at 12:01:46PM +0100, Jacopo Mondi wrote:
> Hi Kieran
> 
> On Fri, Jan 15, 2021 at 10:20:20AM +0000, Kieran Bingham wrote:
> > Hi Jacopo,
> >
> > On 15/01/2021 10:16, Jacopo Mondi wrote:
> > > Commit 1b5071af8240 ("media: dt-bindings: media: i2c: Rename
> > > ov5647.yaml") renamed the bindings file but did not update the
> > > Id: field there.
> > >
> > > Fix it by using the new filename.
> > >
> > > Fixes: 1b5071af8240 ("media: dt-bindings: media: i2c: Rename ov5647.yaml")
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >
> > I wonder if this could be automatically validated by one of the checkers
> > at some point. (I assume it isn't already).
> >
> 
> The dt validation process complains
> 
> ../Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml: $id: relative path/filename doesn't match actual path or filename
> 
> I can't tell if it's a newly introduced validation or it was there
> already when I renamed that file ~6 months ago and I failed to run
> validation :/

It's been there since Aug 2019.

Rob
