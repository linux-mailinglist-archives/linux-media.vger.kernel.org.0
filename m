Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6C931449
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 19:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfEaR4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 13:56:38 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38643 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbfEaR4i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 13:56:38 -0400
Received: by mail-lf1-f67.google.com with SMTP id b11so8622210lfa.5;
        Fri, 31 May 2019 10:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8lbvXxV2I9wKlK6AoN+2OqvLiWU+5ClVbYmT8Pxzqvg=;
        b=S9a+AlHOP6AqqdTUudPclvi3EeIjMj3M/Y2aQJPWdLwjWn+LUtdq6e01oBE4j5oCYD
         p9iGZNlVNNomjyyAGjDapDZEe7dGULyAMqEBqZM/531gG0Hg2FKVwn2iNqQ1TDp+LwCF
         iuK4ONk63AG9VqhwQwpj3+xH/UJ5idGZUwC4iXIs2N6rJVgYeyx6bIMMIRxx0IOLexhe
         iiLakWoee78hk9VgOyrdk/f4/h2RAC8PnulltbjGLZbXHBpFPAjc+rqWnwdZPd0ObWtS
         0wQhCOeLtJKGNOm+6xpKPgh3TM2amz/6vBmg3AG2YIvnMBKk0SVjhWCAYD4onJpsq5KD
         hakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8lbvXxV2I9wKlK6AoN+2OqvLiWU+5ClVbYmT8Pxzqvg=;
        b=lJzPoOS7VQy9h56qyPVyU77xGi7tM0zEYnb+vWdCLG7J9lfK9mkS2CaOjCiS3hqyS6
         oCQee4klW6cin/taiphlvLLfA4SXdNxVXkEW7G5Fg4QMnc1mCEbJmUJRp6xAZZ3BTldl
         fccHQ8f+N3MWPv6BIqNzK+M3+uGhB3wdZh9bR+toGLCZx6adla4h/Wq2Op2o03aqReCm
         acNyGo2DeMs6xL9tNgRK59FppvA434PuIlleAI4Aig825haDezCYRBtKnbFviB/rO7Qu
         1/aoQ7UtVYmpjjbjjQN78/OGpg6TorTU7vL2iwbZ3nB939vYAxmZaMT3hqsQU6XihO3n
         J1iQ==
X-Gm-Message-State: APjAAAWR+adclrorHYAR1HY0v4abASIDfEjdcdYkIvOzhg5T4lYgZR+D
        O/Xwm6jvlSdEVH0Yf5zYNis=
X-Google-Smtp-Source: APXvYqyAcKi6qBmTAoEu3XjQNZdPFQJm1d+QKwaml6ZXSSVfwb3xqqBeDupMyPmYF7arRm+0tA5o8w==
X-Received: by 2002:a05:6512:519:: with SMTP id o25mr6189734lfb.71.1559325396418;
        Fri, 31 May 2019 10:56:36 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id y10sm1285752lfy.66.2019.05.31.10.56.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 10:56:35 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH 4/5] media: ov6650: Fix frame scaling not reset on crop
Date:   Fri, 31 May 2019 19:56:33 +0200
Message-ID: <1933971.yMpNBnsSgY@z50>
In-Reply-To: <20190531114258.6bvsqzlexqnelu5u@valkosipuli.retiisi.org.uk>
References: <20190526204758.1904-1-jmkrzyszt@gmail.com> <20190526204758.1904-5-jmkrzyszt@gmail.com> <20190531114258.6bvsqzlexqnelu5u@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Friday, May 31, 2019 1:42:58 PM CEST Sakari Ailus wrote:
> Hi Janusz,
> 
> On Sun, May 26, 2019 at 10:47:57PM +0200, Janusz Krzysztofik wrote:
> > According to V4L2 subdevice interface specification, frame scaling
> > factors should be reset to default values on modification of input frame
> > format.  Assuming that requirement also applies in case of crop
> > rectangle modification unless V4L2_SEL_FLAG_KEEP_CONFIG is requested,
> > the driver now does not respect it.
> > 
> > The KEEP_CONFIG case is already implemented, fix the other path.
> > 
> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > ---
> >  drivers/media/i2c/ov6650.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> > index 47590cd51190..cc70d8952999 100644
> > --- a/drivers/media/i2c/ov6650.c
> > +++ b/drivers/media/i2c/ov6650.c
> > @@ -472,6 +472,8 @@ static int ov6650_get_selection(struct v4l2_subdev 
*sd,
> >  	}
> >  }
> >  
> > +static int ov6650_s_fmt(struct v4l2_subdev *sd, u32 code, bool 
half_scale);
> > +
> 
> Would it be possible to rearrange the functions in the file so you wouldn't
> need extra prototypes? Preferrably that'd be a new patch.

Sure. I've intentionally done it like that for better readability of the 
patches, but I have a task in my queue for rearrangement of functions order as 
soon as other modifications are in place.

> >  static int ov6650_set_selection(struct v4l2_subdev *sd,
> >  		struct v4l2_subdev_pad_config *cfg,
> >  		struct v4l2_subdev_selection *sel)
> > @@ -515,7 +517,13 @@ static int ov6650_set_selection(struct v4l2_subdev 
*sd,
> >  	}
> >  	if (!ret)
> >  		priv->rect.height = sel->r.height;
> > +	else
> > +		return ret;
> 
> if (ret)
> 	return ret;

OK

Perhaps you will have more comments on other patches so I'll wait a bit and 
then resubmit the series as v2.

Thanks,
Janusz

> ...
> 
> >  
> > +	if (priv->half_scale) {
> > +		/* turn off half scaling, preserve media bus format */
> > +		ret = ov6650_s_fmt(sd, priv->code, false);
> > +	}
> >  	return ret;
> >  }
> >  
> 
> 




