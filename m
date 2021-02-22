Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6F0320EE8
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 02:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhBVBGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 20:06:12 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54416 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbhBVBGL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 20:06:11 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7757D58E;
        Mon, 22 Feb 2021 02:05:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613955929;
        bh=AD4yr/AoKlgw4K2SHvNO0bY6/vPA6ZTnOjAseSwj2nM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EQ2QzsQJWUXfeGfgTh/jR0+on5jL6yJopFzoVq34FiGboe2ivwtMzZrKaWEa+KOFE
         BmCqjKpc4r9q9EukJOqOUXXo5rQFbTXssxTFOfQ5gQVXI/TCCt6Va33NGI1Z/35MIq
         OE5oAxuBYbFUab47n03uvK1BKZbCuPqI8KuIHW2Y=
Date:   Mon, 22 Feb 2021 03:05:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/16] media: i2c: rdacm20: Replace goto with a loop
Message-ID: <YDMDPymgU/N5wd/i@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-4-jacopo+renesas@jmondi.org>
 <c95022bc-3841-4d0a-653c-6d6974e20355@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c95022bc-3841-4d0a-653c-6d6974e20355@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Wed, Feb 17, 2021 at 01:01:26PM +0000, Kieran Bingham wrote:
> On 16/02/2021 17:41, Jacopo Mondi wrote:
> > During the camera module initialization the image sensor PID is read to
> > verify it can correctly be identified. The current implementation is
> > rather confused and uses a loop implemented with a label and a goto.
> > 
> > Replace it with a more compact for() loop.
> > 
> > No functional changes intended.
> 
> I think there is a functional change in here, but I almost like it.
> 
> Before, if the read was successful, it would check to see if the
> OV10635_PID == OV10635_VERSION, and if not it would print that the read
> was successful but a mismatch.
> 
> Now - it will retry again instead, and if at the end of the retries it
> still fails then it's a failure.
> 
> This means we perhaps don't get told if the device id is not correct in
> the same way, but it also means that if the VERSION was not correct
> because of a read error (which I believe i've seen occur), it will retry.

I was going to ask about that, whether we can have a successful I2C read
operation that would return incorrect data. If we do, aren't we screwed
? If there's a non-negligible probability that reads will return
incorrect data without any way to know about it (for other registers
than the version register of course), then I would consider that writes
could fail the same way, and that would mean an unusable device,
wouldn't it ?

If, on the other hand, read failures can always (or nearly always,
ignoring space neutrinos and similar niceties) be detected, then I think
we should avoid the functional change.

> Because there is a functional change you might want to update the
> commit, but I still think this is a good change overall.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/rdacm20.c | 27 ++++++++++-----------------
> >  1 file changed, 10 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> > index 4d9bac87cba8..6504ed0bd3bc 100644
> > --- a/drivers/media/i2c/rdacm20.c
> > +++ b/drivers/media/i2c/rdacm20.c
> > @@ -59,6 +59,8 @@
> >   */
> >  #define OV10635_PIXEL_RATE		(44000000)
> >  
> > +#define OV10635_PID_TIMEOUT		3
> > +
> >  static const struct ov10635_reg {
> >  	u16	reg;
> >  	u8	val;
> > @@ -452,7 +454,7 @@ static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
> >  
> >  static int rdacm20_initialize(struct rdacm20_device *dev)
> >  {
> > -	unsigned int retry = 3;
> > +	unsigned int i;
> >  	int ret;
> >  
> >  	/* Verify communication with the MAX9271: ping to wakeup. */
> > @@ -501,23 +503,14 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
> >  		return ret;
> >  	usleep_range(10000, 15000);
> >  
> > -again:
> > -	ret = ov10635_read16(dev, OV10635_PID);
> > -	if (ret < 0) {
> > -		if (retry--)
> > -			goto again;
> > -
> > -		dev_err(dev->dev, "OV10635 ID read failed (%d)\n",
> > -			ret);
> > -		return -ENXIO;
> > +	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {
> > +		ret = ov10635_read16(dev, OV10635_PID);
> > +		if (ret == OV10635_VERSION)
> > +			break;
> > +		usleep_range(1000, 2000);
> >  	}
> > -
> > -	if (ret != OV10635_VERSION) {
> > -		if (retry--)
> > -			goto again;
> > -
> > -		dev_err(dev->dev, "OV10635 ID mismatch (0x%04x)\n",
> > -			ret);
> > +	if (i == OV10635_PID_TIMEOUT) {
> > +		dev_err(dev->dev, "OV10635 ID read failed (%d)\n", ret);
> >  		return -ENXIO;
> >  	}
> >  

-- 
Regards,

Laurent Pinchart
