Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4452EC2BF
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 18:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbhAFRv6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 12:51:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:55804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727176AbhAFRv6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Jan 2021 12:51:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B044A2311B;
        Wed,  6 Jan 2021 17:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609955478;
        bh=AQpKhsAGsqhFg0SXDC3NmRpXTX27a/Y5tEj0l9Oqrfs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MOm/PHzou5OnLA39Woslo2/GbRyZixIxWIQdAos9BNeA/tw3KQPLkSOfjG/wJBwnI
         qpeFqDBfJsJiMe2T7cVadDGjtiJuBLVHYKNJnhoi3EMCbwk2Yl64N5e8O4ttXC2O6q
         s4qH0oqg2lGPYwVfxNioX6jSFr6Aml4M1hzB6PLs=
Date:   Wed, 6 Jan 2021 18:52:39 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Filip Kolev <fil.kolev@gmail.com>
Cc:     devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: ov2722: replace hardcoded function name
Message-ID: <X/X45909l1Tk7Bni@kroah.com>
References: <20210105202945.26913-1-fil.kolev@gmail.com>
 <X/VsF364jpGz6oze@kroah.com>
 <dcdda829-89d6-badd-4f22-72d95d24e9e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcdda829-89d6-badd-4f22-72d95d24e9e3@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 06, 2021 at 07:43:42PM +0200, Filip Kolev wrote:
> 
> 
> On 06-Jan-21 09:51, Greg Kroah-Hartman wrote:
> > On Tue, Jan 05, 2021 at 10:29:18PM +0200, Filip Kolev wrote:
> > > There is a debug message using hardcoded function name instead of the
> > > __func__ macro. Replace it.
> > > 
> > > Report from checkpatch.pl on the file:
> > > 
> > > WARNING: Prefer using '"%s...", __func__' to using 'ov2722_remove', this function's name, in a string
> > > +	dev_dbg(&client->dev, "ov2722_remove...\n");
> > > 
> > > Signed-off-by: Filip Kolev <fil.kolev@gmail.com>
> > > ---
> > >   drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > > index eecefcd734d0e..21d6bc62d452a 100644
> > > --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > > +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > > @@ -1175,7 +1175,7 @@ static int ov2722_remove(struct i2c_client *client)
> > >   	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > >   	struct ov2722_device *dev = to_ov2722_sensor(sd);
> > > -	dev_dbg(&client->dev, "ov2722_remove...\n");
> > > +	dev_dbg(&client->dev, "%s...\n", __func__);
> > 
> > dev_dbg() provides the function name already, and this is just a "trace"
> > call, and ftrace should be used instead, so the whole line should be
> > removed entirely.
> 
> Thank you for the review!
> 
> How do I go about this? Do I amend the patch and re-send as v2 or create a
> new patch entirely?

New patch entirely please.

thanks,

greg k-h
