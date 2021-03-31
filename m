Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7364934FF3A
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 13:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235095AbhCaLEW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 07:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234995AbhCaLDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 07:03:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A485C061574
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 04:03:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A830BDD;
        Wed, 31 Mar 2021 13:03:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617188631;
        bh=xGR8Fx+YYyXfleVB39CLA2lJwDKyb38JldqXzHK21K4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nz/uyr2w6HBwGQZ/LMSZ471EcDB6Fa0CDnVXFcQFhtdDjBW09F8hyKFBrOQfJ2MaF
         O0UWoubnzP/zskzB99ekjxBhRaX5E43Q04DBExY1dGKwZ6zhWVP+y8trUyfH8k9Wzg
         Se1xJMtC0A2RqJcE5wR67VBj0H4GRDBLehRNcbN8=
Date:   Wed, 31 Mar 2021 14:03:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, John Nealy <jnealy3@yahoo.com>
Subject: Re: [PATCH 1/1] media: uvcvideo: Support devices that report an OT
 as an entity source
Message-ID: <YGRW7FO2n2t4wAxX@pendragon.ideasonboard.com>
References: <20210308103128.33173-1-hdegoede@redhat.com>
 <20210308103128.33173-2-hdegoede@redhat.com>
 <7974a22b-8b84-845e-4d2c-3650254a1a86@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7974a22b-8b84-845e-4d2c-3650254a1a86@redhat.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Mar 31, 2021 at 12:38:07PM +0200, Hans de Goede wrote:
> On 3/8/21 11:31 AM, Hans de Goede wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Some devices reference an output terminal as the source of extension
> > units. This is incorrect, as output terminals only have an input pin,
> > and thus can't be connected to any entity in the forward direction. The
> > resulting topology would cause issues when registering the media
> > controller graph. To avoid this problem, connect the extension unit to
> > the source of the output terminal instead.
> > 
> > While at it, and while no device has been reported to be affected by
> > this issue, also handle forward scans where two output terminals would
> > be connected together, and skip the terminals found through such an
> > invalid connection.
> > 
> > Reported-and-tested-by: John Nealy <jnealy3@yahoo.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Ping? This is a bug-fix which fixes a WARN triggering, causing many
> users to see a backtrace in their kernel-logs and reporting bugs about this:
> 
> https://bugzilla.redhat.com/buglist.cgi?quicksearch=mc-entity.c
> 
> Currently shows 12 open bugs for this and this is not counting all the
> ones which have already been triaged and matched as dups.
> 
> As such it would be really good if we can get this merged and on
> its way to 5.12-rc# as a fix for 5.12 (and to be backported to the
> stable series).

The patch is included in "[GIT PULL FOR v5.13] Miscellaneous changes". I
have no personal issue with it being merged in v5.12-rc, but technically
it's not a regression fix, is it ? I'll let Mauro decide what works best
for him.

> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 32 ++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 30ef2a3110f7..8df58f04dac6 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -1716,6 +1716,31 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
> >  				return -EINVAL;
> >  			}
> >  
> > +			/*
> > +			 * Some devices reference an output terminal as the
> > +			 * source of extension units. This is incorrect, as
> > +			 * output terminals only have an input pin, and thus
> > +			 * can't be connected to any entity in the forward
> > +			 * direction. The resulting topology would cause issues
> > +			 * when registering the media controller graph. To
> > +			 * avoid this problem, connect the extension unit to
> > +			 * the source of the output terminal instead.
> > +			 */
> > +			if (UVC_ENTITY_IS_OTERM(entity)) {
> > +				struct uvc_entity *source;
> > +
> > +				source = uvc_entity_by_id(chain->dev,
> > +							  entity->baSourceID[0]);
> > +				if (!source) {
> > +					uvc_dbg(chain->dev, DESCR,
> > +						"Can't connect extension unit %u in chain\n",
> > +						forward->id);
> > +					break;
> > +				}
> > +
> > +				forward->baSourceID[0] = source->id;
> > +			}
> > +
> >  			list_add_tail(&forward->chain, &chain->entities);
> >  			if (!found)
> >  				uvc_dbg_cont(PROBE, " (->");
> > @@ -1735,6 +1760,13 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
> >  				return -EINVAL;
> >  			}
> >  
> > +			if (UVC_ENTITY_IS_OTERM(entity)) {
> > +				uvc_dbg(chain->dev, DESCR,
> > +					"Unsupported connection between output terminals %u and %u\n",
> > +					entity->id, forward->id);
> > +				break;
> > +			}
> > +
> >  			list_add_tail(&forward->chain, &chain->entities);
> >  			if (!found)
> >  				uvc_dbg_cont(PROBE, " (->");

-- 
Regards,

Laurent Pinchart
