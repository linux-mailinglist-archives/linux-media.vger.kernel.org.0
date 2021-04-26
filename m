Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB3C36B507
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 16:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbhDZOj2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 10:39:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:47732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231862AbhDZOj1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 10:39:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55DF161026;
        Mon, 26 Apr 2021 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619447925;
        bh=9ZkP5XWMFSyQNawvCkw+V/jzWIibGz9/yts5jldzuGQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IaZRJFAyjEnHmdk+Sw7GRXoFoCfT+0R+3wcY8mkaEdaxEg0W5RbxbAOhtP1JLJa1M
         v5Ro/g1l6MtUcg0Im03tX8EtuSWLU1oN3NOF+BISeTxD2S5G7PM1DUq1GslYf9xWMp
         RlhzpUJYOLelDK5BbuHHSo9nnktMp/Z6WyfSOgdyJsiRQdUXchCnQVngp2Ar9zSnep
         2QbxfaA5VONc+QA9uHCz5yUENI4xLV89gL5IWPwSlLjYdeBP/GDx/O5Hms2GMdIYHH
         g8sD3QNhG7jxvFWddZsjdhtjz477EaItiY3LP/+nbpMpUf/0b0zpo8VjsUohwIOWSU
         fzl2cTJJ24VWQ==
Date:   Mon, 26 Apr 2021 16:38:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 38/78] media: i2c: mt9m001: use
 pm_runtime_resume_and_get()
Message-ID: <20210426163840.67ea8af9@coco.lan>
In-Reply-To: <YIPsTsEA/F+o7fhQ@hovoldconsulting.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
        <beddb7295807f43a190f2add6c1665b7475cb154.1619191723.git.mchehab+huawei@kernel.org>
        <20210424082454.2ciold3j3h2jw47m@uno.localdomain>
        <YIPsTsEA/F+o7fhQ@hovoldconsulting.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 24 Apr 2021 12:00:46 +0200
Johan Hovold <johan@kernel.org> escreveu:

> On Sat, Apr 24, 2021 at 10:24:54AM +0200, Jacopo Mondi wrote:
> > Hi Mauro,
> > 
> > On Sat, Apr 24, 2021 at 08:44:48AM +0200, Mauro Carvalho Chehab wrote:  
> > > Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> > > added pm_runtime_resume_and_get() in order to automatically handle
> > > dev->power.usage_count decrement on errors.
> > >
> > > Use the new API, in order to cleanup the error check logic.
> > >
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> > 
> > Thanks
> > Acked-by: Jacopo Mondi <jacopo@jmondi.org>
> > 
> > I should re-work the error handling sequence there on top of this
> > patch as right now it's not the best, that 'done' label bothers me...
> > anyway, for later.
> >   
> > > ---
> > >  drivers/media/i2c/mt9m001.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> > > index 3b0ba8ed5233..57e15a291ebd 100644
> > > --- a/drivers/media/i2c/mt9m001.c
> > > +++ b/drivers/media/i2c/mt9m001.c
> > > @@ -217,9 +217,9 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
> > >  		goto done;
> > >
> > >  	if (enable) {
> > > -		ret = pm_runtime_get_sync(&client->dev);
> > > +		ret = pm_runtime_resume_and_get(&client->dev);
> > >  		if (ret < 0)
> > > -			goto put_unlock;
> > > +			goto unlock;
> > >
> > >  		ret = mt9m001_apply_selection(sd);
> > >  		if (ret)
> > > @@ -247,6 +247,7 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
> > >
> > >  put_unlock:
> > >  	pm_runtime_put(&client->dev);
> > > +unlock:
> > >  	mutex_unlock(&mt9m001->mutex);
> > >
> > >  	return ret;
> > > @@ -834,7 +835,7 @@ static int mt9m001_remove(struct i2c_client *client)
> > >  {
> > >  	struct mt9m001 *mt9m001 = to_mt9m001(client);
> > >
> > > -	pm_runtime_get_sync(&client->dev);
> > > +	pm_runtime_resume_and_get(&client->dev);
> > >
> > >  	v4l2_async_unregister_subdev(&mt9m001->subdev);
> > >  	media_entity_cleanup(&mt9m001->subdev.entity);  
> 
> I couldn't help looking at one more now that you got feedback on this
> one.
> 
> Here you have the same problem as the one I reported earlier, in that
> the usage count could end up negative on resume failure due to the later
> put_noidle() call in remove().

I'll double-check this at the entire series. Different sensor
drivers are handling this on different ways, which sounds
bad, as they are meant to be independent on the media bridge
driver.

> Also note that you're adding more lines than you're removing.

Ok, but the end goal is not really reducing the number of lines,
but to have the code following the same pattern, and to avoid
cut-and-paste errors when new drivers are written.

The mt9m001 is one of the oldest sensor drivers, written a long time
before the PM runtime core, written for the soc_camera driver, back
in 2008. The port to use PM runtime isn't old:

  commit 8fcfc491c6ca5887bb341b3a622cca3ed8e3c9f0
  Author: Akinobu Mita <akinobu.mita@gmail.com>
  Date:   Tue Jan 8 12:51:44 2019 -0200

    media: mt9m001: switch s_power callback to runtime PM

It was part of an attempt to recover the soc_camera sensor drives
from staging. 

Yet, the logic on this driver seems to be different than the
one used on more modern I2C sensors. So, better to re-check
everything.

> I'd say this kind of mass-conversion is of questionable worth as
> pm_runtime_resume_and_get() isn't necessarily an improvement (even if it
> may have its use in some places).

The main problem is that other parts of the driver's core APIs
assume that get object methods will only increment the usage
counter if no errors. The pm_runtime_get_sync() is an exception.

Its name doesn't help at all: A function like that should, IMHO,
be called, instead:

	pm_runtime_inc_usage_count_and_try_to_resume().

Or something similar, in order to make clearer that it always
increment the usage count, no matter what. If possible, all drivers
should get rid of it too (or alternatively add comments warning
people that keeping the usage_count incremented is desired on the
very specific places where it is really needed), as it is risky
to use something that has a different usage_count increement behavior
than other more usual *_get() functions.

With regards to mass-fixing it, I've seen several patches seen
to media fixing bugs due to the bad usage_count decrement logic.
So, the best is to solve them all at once, and stop using
pm_runtime_get_sync() inside the subsystem.

Thanks,
Mauro
