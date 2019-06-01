Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B44032113
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 00:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbfFAWhz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 18:37:55 -0400
Received: from mga07.intel.com ([134.134.136.100]:45978 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbfFAWhz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 Jun 2019 18:37:55 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Jun 2019 15:37:54 -0700
X-ExtLoop1: 1
Received: from mczarkow-mobl2.ger.corp.intel.com (HELO mara.localdomain) ([10.249.140.11])
  by orsmga002.jf.intel.com with ESMTP; 01 Jun 2019 15:37:52 -0700
Received: from sailus by mara.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1hXCdP-0004A3-UP; Sun, 02 Jun 2019 01:37:56 +0300
Date:   Sun, 2 Jun 2019 01:37:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/5] media: ov6650: Fix frame scaling not reset on
 crop
Message-ID: <20190601223754.65soglqayxrblgzl@mara.localdomain>
References: <20190526204758.1904-1-jmkrzyszt@gmail.com>
 <20190526204758.1904-5-jmkrzyszt@gmail.com>
 <20190531114258.6bvsqzlexqnelu5u@valkosipuli.retiisi.org.uk>
 <1933971.yMpNBnsSgY@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1933971.yMpNBnsSgY@z50>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Fri, May 31, 2019 at 07:56:33PM +0200, Janusz Krzysztofik wrote:
> Hi Sakari,
> 
> On Friday, May 31, 2019 1:42:58 PM CEST Sakari Ailus wrote:
> > Hi Janusz,
> > 
> > On Sun, May 26, 2019 at 10:47:57PM +0200, Janusz Krzysztofik wrote:
> > > According to V4L2 subdevice interface specification, frame scaling
> > > factors should be reset to default values on modification of input frame
> > > format.  Assuming that requirement also applies in case of crop
> > > rectangle modification unless V4L2_SEL_FLAG_KEEP_CONFIG is requested,
> > > the driver now does not respect it.
> > > 
> > > The KEEP_CONFIG case is already implemented, fix the other path.
> > > 
> > > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > > ---
> > >  drivers/media/i2c/ov6650.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> > > index 47590cd51190..cc70d8952999 100644
> > > --- a/drivers/media/i2c/ov6650.c
> > > +++ b/drivers/media/i2c/ov6650.c
> > > @@ -472,6 +472,8 @@ static int ov6650_get_selection(struct v4l2_subdev 
> *sd,
> > >  	}
> > >  }
> > >  
> > > +static int ov6650_s_fmt(struct v4l2_subdev *sd, u32 code, bool 
> half_scale);
> > > +
> > 
> > Would it be possible to rearrange the functions in the file so you wouldn't
> > need extra prototypes? Preferrably that'd be a new patch.
> 
> Sure. I've intentionally done it like that for better readability of the 
> patches, but I have a task in my queue for rearrangement of functions order as 
> soon as other modifications are in place.

I'm totally fine with doing that after this set on as well. Up to you.

> 
> > >  static int ov6650_set_selection(struct v4l2_subdev *sd,
> > >  		struct v4l2_subdev_pad_config *cfg,
> > >  		struct v4l2_subdev_selection *sel)
> > > @@ -515,7 +517,13 @@ static int ov6650_set_selection(struct v4l2_subdev 
> *sd,
> > >  	}
> > >  	if (!ret)
> > >  		priv->rect.height = sel->r.height;
> > > +	else
> > > +		return ret;
> > 
> > if (ret)
> > 	return ret;
> 
> OK
> 
> Perhaps you will have more comments on other patches so I'll wait a bit and 
> then resubmit the series as v2.

Not so much on this set BUT I realised that the subtle effect of "media:
ov6650: Register with asynchronous subdevice framework" is that the driver
is now responsible for serialising the access to its own data structures
now. And it doesn't do that. Could you submit a fix, please? It'd be good to
get that to 5.2 through the fixes branch.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
