Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A13292F75
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 22:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731701AbgJSUeH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 16:34:07 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33189 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731695AbgJSUeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 16:34:06 -0400
Received: by mail-ot1-f65.google.com with SMTP id t15so1056450otk.0;
        Mon, 19 Oct 2020 13:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZJ1OdJEMAg9mvn+iPb/nFrKcPNsuSwSirp5g+ojHnBk=;
        b=GUnNlL6GkyGi+qjHk04WlLWPWDe7OdPx1LgP9r+0jYMUouRlT7d9HirM8tImMC2DFc
         km1ohJBmXjwnjHOJZkkIsRmxpiAdTv4y4UF0/YzxbRM/c3SjByoQAeTPThGiVBptdmQn
         qmaOvaVwOK5umYuR1PMUH3WDjr4DVj3KKv/mZUApw76mkAZaY5SAIM5hUsPqFdxCChTl
         ePymZWe/35DBzcO8bZeMt+1ilV6sE0NkviMv96ZvA1Wknf8qFW0Ipp/XfCzD4c7INIwc
         /x9LYdUV5ERgU/YsMeaOxBdYLDmKDxx7ynafcL8DJe3grEoivtrOoitqwL6Bpd/3Ec/T
         KjxA==
X-Gm-Message-State: AOAM533PRnSZvyXxpZdTYA+z1uct3vGdAL+lRkXMoC15q0SsjRV6GPZy
        cRo9n4Msdt8UVVztDnlbWw==
X-Google-Smtp-Source: ABdhPJwgqzsJ5hcZkg6yMln7dTm1jR+oAgEb8smVIrxTUfDUoXsU3fpnST4HJVrRBRegyFVhVwceyw==
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr1162521oto.31.1603139645984;
        Mon, 19 Oct 2020 13:34:05 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s21sm194760otr.77.2020.10.19.13.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:34:05 -0700 (PDT)
Received: (nullmailer pid 3558892 invoked by uid 1000);
        Mon, 19 Oct 2020 20:33:59 -0000
Date:   Mon, 19 Oct 2020 15:33:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: ov2680: convert bindings to yaml
Message-ID: <20201019203359.GA3550266@bogus>
References: <20201014142759.726823-1-rmfrfs@gmail.com>
 <20201014142759.726823-2-rmfrfs@gmail.com>
 <20201015144905.4b23k5uy7ycuhvlo@uno.localdomain>
 <20201016144204.3viee7spmvwtms5i@arch-thunder.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016144204.3viee7spmvwtms5i@arch-thunder.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 16, 2020 at 03:42:04PM +0100, Rui Miguel Silva wrote:
> Hey Jacopo,
> Thanks for the review.
> 
> On Thu, Oct 15, 2020 at 04:49:05PM +0200, Jacopo Mondi wrote:
> > Hi Rui,
> > 
> > On Wed, Oct 14, 2020 at 03:27:57PM +0100, Rui Miguel Silva wrote:
> > > Convert ov2680 sensor bindings documentation to yaml schema, remove
> > > the textual bindings document and update MAINTAINERS entry.
> > >
> > > Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>

> > > +  clock-names:
> > > +    description:
> > 
> > I'll never get yaml right, doesn't breaking lines require '|' after
> > the semicolon ? The validator does not complain, so I guess not.
> 
> I also had that idea, but looking also to other cases, and also in the
> examlpe-schema where you have both cases, looks like it is not needed.

'|' will preserve line breaks and formatting. For a single line like 
this it doesn't really matter. Though ruamel's round trip will make it a 
single line when writing back out. 

> > 
> > > +      Input clock for the sensor.

Really, you can just drop the description. Doesn't really add anything 
specific for this device.

> > > +    items:
> > > +      - const: xvclk
