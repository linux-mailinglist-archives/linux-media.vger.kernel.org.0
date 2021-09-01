Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE3D3FE545
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 00:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbhIAWJo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 18:09:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53008 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245291AbhIAWJo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 18:09:44 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 947FF340;
        Thu,  2 Sep 2021 00:08:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630534125;
        bh=KG1sosiEgjNzCPlMjYOiEtcy5yFmvjUCWAwOdDlWCTY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LDQgUwWBf3wV+tNH/D0/gZOLlLyQKDxIhcAxgPZ81/3mq6zZrwOvubQj2uxev+IS4
         WrzXmB7HG2Rvza2IAEo54QLBtmPFpTZ/J9EHXywVPoeXaYWfTzkQr074lnZ3+V5MgL
         JOySsTVyBOX6ejv6/vy9q1VaD3PgyW0a6QZ+oDxk=
Date:   Thu, 2 Sep 2021 01:08:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Simplify DRM UIF handling
Message-ID: <YS/53RnD9G2J186h@pendragon.ideasonboard.com>
References: <20210618190905.580258-1-kieran.bingham@ideasonboard.com>
 <YMz0+aiRDqHfWarV@pendragon.ideasonboard.com>
 <c9d2529f-8d4f-dbae-7e34-d8e9662b0be0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9d2529f-8d4f-dbae-7e34-d8e9662b0be0@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Sep 01, 2021 at 11:07:40PM +0100, Kieran Bingham wrote:
> On 18/06/2021 20:33, Laurent Pinchart wrote:
> > On Fri, Jun 18, 2021 at 08:09:05PM +0100, Kieran Bingham wrote:
> >> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>
> >> In commit 6732f3139380 ("media: v4l: vsp1: Fix uif null pointer access")
> >> the handling of the UIF was over complicated, and the patch applied
> >> before review.
> >>
> >> Simplify it to keep the conditionals small.
> >>
> >> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >> ---
> >>
> >> Another one that I had lying around in my tree for too long ....
> > 
> > It seems to have survived bitrot quite well.
> 
> This still applies with git am to my tree here ...
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks, do I need to do anything else to progress this ?

You can ping me to remind me to send a pull request. Which you just did
:-)

> >>  drivers/media/platform/vsp1/vsp1_drm.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
> >> index 06f74d410973..0c2507dc03d6 100644
> >> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> >> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> >> @@ -455,6 +455,10 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
> >>  		dev_err(vsp1->dev, "%s: failed to setup UIF after %s\n",
> >>  			__func__, BRX_NAME(pipe->brx));
> >>  
> >> +	/* If the DRM pipe does not have a UIF there is nothing we can update. */
> >> +	if (!drm_pipe->uif)
> >> +		return 0;
> >> +
> >>  	/*
> >>  	 * If the UIF is not in use schedule it for removal by setting its pipe
> >>  	 * pointer to NULL, vsp1_du_pipeline_configure() will remove it from the
> >> @@ -462,9 +466,9 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
> >>  	 * make sure it is present in the pipeline's list of entities if it
> >>  	 * wasn't already.
> >>  	 */
> >> -	if (drm_pipe->uif && !use_uif) {
> >> +	if (!use_uif) {
> >>  		drm_pipe->uif->pipe = NULL;
> >> -	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {
> >> +	} else if (!drm_pipe->uif->pipe) {
> >>  		drm_pipe->uif->pipe = pipe;
> >>  		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
> >>  	}

-- 
Regards,

Laurent Pinchart
