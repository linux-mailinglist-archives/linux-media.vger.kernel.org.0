Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4723136D8D5
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 15:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240027AbhD1NvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 09:51:13 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:43936 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232211AbhD1NvH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 09:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619617802; bh=ZPs87O1n7Rs/FVtu7HFdEuudG0Tivg2EA2GXHVtcliI=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=otMphzDJWyG52ZJy7k0k86mo95Z3lYnyIYucaEAObvqTvzZBNdACO/Ta8jJ+dgMLq
         H+n6HPHAeoDJFHTH2BjoXu/CFgGmrhFSYArkYg1b5kzXdztvgohKHmlQcDP4zJBBgg
         qsfN/eeaiyxMxlgxiCdYtM+pQYwfSYbc3s9C76Qg=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 28 Apr 2021 15:50:01 +0200 (CEST)
X-EA-Auth: bXkCzuHGuhGacUeC5FPCllNutghnTzfxiQwSGipTFrOvV821Mse6zHDinLc0dKcKA2Ndxh4gj0Y2B1wQExvVPNMaypzVT9Ll
Date:   Wed, 28 Apr 2021 19:19:50 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 3/6] staging: media: atomisp: use __func__ over
 function names
Message-ID: <YIln/vE6dbX5NZun@192.168.1.8>
References: <cover.1619199344.git.drv@mailo.com>
 <2cb42846abb7cab5e64bc29d5e496766f5df169b.1619199344.git.drv@mailo.com>
 <20210428102717.GT1981@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428102717.GT1981@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 28, 2021 at 01:27:17PM +0300, Dan Carpenter wrote:
> On Sun, Apr 25, 2021 at 02:13:15PM +0530, Deepak R Varma wrote:
> > Replace hard coded function names from the debug print strings by
> > standard __func__ predefined identifier. This resolves following
> > checkpatch script WARNING:
> > Prefer using '"%s...", __func__' to using function's name, in a string.
> > 
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> > 
> > Changes since v2:
> >    - None.
> > Changes since v1:
> >    - None.
> > 
> >  .../staging/media/atomisp/i2c/atomisp-gc0310.c   |  2 +-
> >  .../staging/media/atomisp/i2c/atomisp-gc2235.c   |  2 +-
> >  .../staging/media/atomisp/i2c/atomisp-lm3554.c   |  2 +-
> >  .../staging/media/atomisp/i2c/atomisp-ov2680.c   | 16 ++++++++--------
> >  .../staging/media/atomisp/i2c/atomisp-ov2722.c   |  2 +-
> >  5 files changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > index d68a2bcc9ae1..b572551f1a0d 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > @@ -1292,7 +1292,7 @@ static int gc0310_remove(struct i2c_client *client)
> >  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >  	struct gc0310_device *dev = to_gc0310_sensor(sd);
> >  
> > -	dev_dbg(&client->dev, "gc0310_remove...\n");
> > +	dev_dbg(&client->dev, "%s...\n", __func__);
> >  
> >  	dev->platform_data->csi_cfg(sd, 0);
> >  
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > index e722c639b60d..548c572d3b57 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > @@ -1034,7 +1034,7 @@ static int gc2235_remove(struct i2c_client *client)
> >  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >  	struct gc2235_device *dev = to_gc2235_sensor(sd);
> >  
> > -	dev_dbg(&client->dev, "gc2235_remove...\n");
> > +	dev_dbg(&client->dev, "%s...\n", __func__);
> 
> Just delete printks that only print the function name.  We have ftrace
> for that.  There are several others below.

Thank you Dan, Hans, Fabio, Sakari and everyone for your review and comments.
I have received feedback and suggestions on the patch set.
I am going to rebuild the patch set according to the feedback and send as v4.

Appreciate your comments and time,
deepak.

> 
> regards,
> dan carpenter
> 


