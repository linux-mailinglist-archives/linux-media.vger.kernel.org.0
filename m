Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B708E35E5A3
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 19:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345556AbhDMRxE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 13:53:04 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58127 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345527AbhDMRxC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 13:53:02 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4EDACE000C;
        Tue, 13 Apr 2021 17:52:38 +0000 (UTC)
Date:   Tue, 13 Apr 2021 13:55:43 -0400
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Minor code style changes
Message-ID: <YHXbH+EqAm2bE8oE@coplandos.local>
References: <20210412160203.6925-1-vrzh@vrzh.net>
 <eda1c459-f654-e9f4-5738-5d611f267a9e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eda1c459-f654-e9f4-5738-5d611f267a9e@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 13, 2021 at 04:41:02PM +0200, Hans Verkuil wrote:
> Please repost with a '[PATCHv3]' in the subject.
> 
> This version should have been '[PATCHv2]', but you forgot the v2 part :-)
> 
> It's important, since now I had no indication that the previous patch was superseded
> and I tried to apply both, thus discovering that the older one should have been skipped.
> 
> Regards,
> 
> 	Hans
> 
Got it! Will do that now - thanks for your patience :)
> On 12/04/2021 18:02, Martiros Shakhzadyan wrote:
> > Fixed line continuation and parenthesis alignment issues.
> > 
> > Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
> > ---
> >  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > index 912eadaffc44..90a985ee25fa 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> > @@ -49,8 +49,8 @@ static int ov2722_read_reg(struct i2c_client *client,
> >  		return -ENODEV;
> >  	}
> >  
> > -	if (data_length != OV2722_8BIT && data_length != OV2722_16BIT
> > -	    && data_length != OV2722_32BIT) {
> > +	if (data_length != OV2722_8BIT && data_length != OV2722_16BIT &&
> > +	    data_length != OV2722_32BIT) {
> >  		dev_err(&client->dev, "%s error, invalid data length\n",
> >  			__func__);
> >  		return -EINVAL;
> > @@ -212,8 +212,8 @@ static int __ov2722_buf_reg_array(struct i2c_client *client,
> >  }
> >  
> >  static int __ov2722_write_reg_is_consecutive(struct i2c_client *client,
> > -	struct ov2722_write_ctrl *ctrl,
> > -	const struct ov2722_reg *next)
> > +					     struct ov2722_write_ctrl *ctrl,
> > +					     const struct ov2722_reg *next)
> >  {
> >  	if (ctrl->index == 0)
> >  		return 1;
> > 
> 
