Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86902582FC
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 22:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbgHaUsv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 16:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgHaUsv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 16:48:51 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C1FC061573;
        Mon, 31 Aug 2020 13:48:51 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id EB986634C87;
        Mon, 31 Aug 2020 23:48:33 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kCqjB-0000zW-QP; Mon, 31 Aug 2020 23:48:33 +0300
Date:   Mon, 31 Aug 2020 23:48:33 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, hverkuil@xs4all.nl,
        luca@lucaceresoli.net, leonl@leopardimaging.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] media: i2c: imx274: Add IMX274 power on and off
 sequence
Message-ID: <20200831204833.GG844@valkosipuli.retiisi.org.uk>
References: <1598903558-9691-1-git-send-email-skomatineni@nvidia.com>
 <1598903558-9691-5-git-send-email-skomatineni@nvidia.com>
 <20200831202350.GD844@valkosipuli.retiisi.org.uk>
 <b4db7b37-a0d7-9324-c47a-53ad22b8c444@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4db7b37-a0d7-9324-c47a-53ad22b8c444@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 31, 2020 at 01:46:00PM -0700, Sowjanya Komatineni wrote:
> 
> On 8/31/20 1:23 PM, Sakari Ailus wrote:
> > > @@ -1968,19 +2087,45 @@ static int imx274_remove(struct i2c_client *client)
> > >   	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > >   	struct stimx274 *imx274 = to_imx274(sd);
> > > +	pm_runtime_get_sync(&imx274->client->dev);
> > > +
> > >   	/* stop stream */
> > This really shouldn't happen and the driver isn't expected to handle it
> > either.
> 
> Do you mean to remove stop stream during remove()?
> 
> Stop stream is not part of this change and as writes to sensor can't happen
> when power off, added pm_runtime_get_sync

Indeed.

But there certainly isn't a need to power the sensor on to stream off, is
there?

> 
> > >   	imx274_write_table(imx274, imx274_stop);
> > >   	v4l2_async_unregister_subdev(sd);
> > >   	v4l2_ctrl_handler_free(&imx274->ctrls.handler);
> > > +
> > > +	pm_runtime_put(&client->dev);
> > > +	pm_runtime_disable(&client->dev);
> > > +	pm_runtime_set_suspended(&client->dev);
> > > +
> > >   	media_entity_cleanup(&sd->entity);
> > >   	mutex_destroy(&imx274->lock);
> > >   	return 0;
> > >   }

-- 
Sakari Ailus
