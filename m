Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3CE336A096
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 12:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhDXKBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 06:01:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:40584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229848AbhDXKBO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 06:01:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BE3F61184;
        Sat, 24 Apr 2021 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619258436;
        bh=xpqWyIBQQdTi83NwQGIXV4Il7t/xyfvadRSbg8U1WH8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pwpDYIPNP6ueqeqGdf8U6NHfSVA9thFHwZvlmkQCIUcIPeV1u/hDXMYdiedj1C4JR
         t75HQKgc+3tQEUTkVVHNmiqrxkeOYUARH3wpJUgwnb5VH5BvETD4J/aAX+0F/mCdWv
         LLRtEG3d3meZqN7/ON7AOAQor+ingX1ai5WyPnZnPa9h2niphQs+IjJLwHSlrif6Fo
         0U1s7gQx3ORwHxr81ROyWX3yNTXnruCY+U47AuzkqTONBqepkxYjmNKeDUU2yssLqE
         Nnev0tnU7ZSFkzPQ6FuBZd5rGEvX0bVnzSWp8LS04nRrDo6gAzHNbbJgSBne0AoOqT
         BAptY8daVShKw==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1laF5i-0001oZ-Pk; Sat, 24 Apr 2021 12:00:47 +0200
Date:   Sat, 24 Apr 2021 12:00:46 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 38/78] media: i2c: mt9m001: use
 pm_runtime_resume_and_get()
Message-ID: <YIPsTsEA/F+o7fhQ@hovoldconsulting.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
 <beddb7295807f43a190f2add6c1665b7475cb154.1619191723.git.mchehab+huawei@kernel.org>
 <20210424082454.2ciold3j3h2jw47m@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210424082454.2ciold3j3h2jw47m@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 24, 2021 at 10:24:54AM +0200, Jacopo Mondi wrote:
> Hi Mauro,
> 
> On Sat, Apr 24, 2021 at 08:44:48AM +0200, Mauro Carvalho Chehab wrote:
> > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > added pm_runtime_resume_and_get() in order to automatically handle
> > dev->power.usage_count decrement on errors.
> >
> > Use the new API, in order to cleanup the error check logic.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> Thanks
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> I should re-work the error handling sequence there on top of this
> patch as right now it's not the best, that 'done' label bothers me...
> anyway, for later.
> 
> > ---
> >  drivers/media/i2c/mt9m001.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > index 3b0ba8ed5233..57e15a291ebd 100644
> > --- a/drivers/media/i2c/mt9m001.c
> > +++ b/drivers/media/i2c/mt9m001.c
> > @@ -217,9 +217,9 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
> >  		goto done;
> >
> >  	if (enable) {
> > -		ret = pm_runtime_get_sync(&client->dev);
> > +		ret = pm_runtime_resume_and_get(&client->dev);
> >  		if (ret < 0)
> > -			goto put_unlock;
> > +			goto unlock;
> >
> >  		ret = mt9m001_apply_selection(sd);
> >  		if (ret)
> > @@ -247,6 +247,7 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
> >
> >  put_unlock:
> >  	pm_runtime_put(&client->dev);
> > +unlock:
> >  	mutex_unlock(&mt9m001->mutex);
> >
> >  	return ret;
> > @@ -834,7 +835,7 @@ static int mt9m001_remove(struct i2c_client *client)
> >  {
> >  	struct mt9m001 *mt9m001 = to_mt9m001(client);
> >
> > -	pm_runtime_get_sync(&client->dev);
> > +	pm_runtime_resume_and_get(&client->dev);
> >
> >  	v4l2_async_unregister_subdev(&mt9m001->subdev);
> >  	media_entity_cleanup(&mt9m001->subdev.entity);

I couldn't help looking at one more now that you got feedback on this
one.

Here you have the same problem as the one I reported earlier, in that
the usage count could end up negative on resume failure due to the later
put_noidle() call in remove().

Also note that you're adding more lines than you're removing.

I'd say this kind of mass-conversion is of questionable worth as
pm_runtime_resume_and_get() isn't necessarily an improvement (even if it
may have its use in some places).

Johan
