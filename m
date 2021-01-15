Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFBD2F7561
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 10:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730909AbhAOJ22 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 04:28:28 -0500
Received: from mga03.intel.com ([134.134.136.65]:41112 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729172AbhAOJ21 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 04:28:27 -0500
IronPort-SDR: vkHvCL/UdoOEiTe08AgJYfTICXi69wN3dpBYmuUbijXKBqRPUEof5UTHHSKYHbVHVDixPZI17P
 r+uov+N8ljyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="178611070"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="178611070"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 01:26:41 -0800
IronPort-SDR: 88dXyl/0gw5XIMHuouF1nDiZ/c618bWw9ZCwXlY6MlY7JDivP8c1c4jDWSSxOYObPcYMQzG2op
 NNsUdgfYw9Uw==
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="364525233"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 01:26:38 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A9C30206A9; Fri, 15 Jan 2021 11:26:36 +0200 (EET)
Date:   Fri, 15 Jan 2021 11:26:36 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        roman.kovalivskyi@globallogic.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        naush@raspberrypi.com, Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/30] dt-bindings: media: i2c: Rename ov5647.yaml
Message-ID: <20210115092636.GP11878@paasikivi.fi.intel.com>
References: <20201119161956.756455-1-jacopo@jmondi.org>
 <20201119161956.756455-2-jacopo@jmondi.org>
 <20201125091526.GI3940@paasikivi.fi.intel.com>
 <CAL_JsqLfdGumeicqqhkfn5K40GaXX93NuNZTOpgcCLycHmVQbg@mail.gmail.com>
 <20201222095025.GS26370@paasikivi.fi.intel.com>
 <CAL_JsqL6e3Ko=gwPZj6SeFHofiebeR3-HzsEHcNiXrabruJtLA@mail.gmail.com>
 <20210115090326.qufukw5cd73ansby@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115090326.qufukw5cd73ansby@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Jan 15, 2021 at 10:03:26AM +0100, Jacopo Mondi wrote:
> Ups,
> 
>    I'll fix. A question for Mauro though
> 
> On Thu, Jan 14, 2021 at 02:20:34PM -0600, Rob Herring wrote:
> > On Tue, Dec 22, 2020 at 3:50 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Rob,
> > >
> > > On Mon, Dec 21, 2020 at 01:23:29PM -0700, Rob Herring wrote:
> > > > On Wed, Nov 25, 2020 at 2:15 AM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Cc Rob + DT list.
> > > >
> > > > You have to resend if you really want me to see things. In this case,
> > > > I don't think you need to wait on me for a rename.
> > >
> > > I merged the patch earlier based on the IRC discussion.
> >
> > Seems this landed in -next:
> >
> > ./Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml: $id:
> > relative path/filename doesn't match actual path or filename
> > expected: http://devicetree.org/schemas/media/i2c/ovti,ov5647.yaml#
> >
> 
> The fix is worth a Fixes: tag, should I refer to the current commit
> sha1 in linux-media/master or is there any risk for a rebase before
> the tree is merged in the v5.12 merge window ?

I'd say that happens only in exceptional circumstances. I think you can do
that.

-- 
Regards,

Sakari Ailus
