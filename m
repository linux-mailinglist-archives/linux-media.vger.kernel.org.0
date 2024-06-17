Return-Path: <linux-media+bounces-13477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C27D90B968
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 20:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1ABEB2AEA7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 18:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03670195967;
	Mon, 17 Jun 2024 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PSDAJ8S+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC29194093
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647417; cv=none; b=XS98oKuN880aHI5WFSjLyDL4cOCdOhT9gAToW5JxhaQ3e2CmKMz6C+D7Ku2/6sOmUMCx0Q0NQ5soxTgcg5czv1zcqZBQqb3WPn4GHNUbM53H8T0S1OM+ggMXPk8lOGC8fQedUmLiaQWUtupVlOzdPmK4J0bWggAvjPHUiVvXrEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647417; c=relaxed/simple;
	bh=7wGQWDhi6lQQiJ+si7D4t5oFV9PoAp/Yzievup+XB6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfKGCE2rsUJ7zivGvgC9cxC034dFcoEqIiek3xFs+ZVbkhU4n08LiHwma1Jzth2oVf4KFsjUAniRjgWr2cr33OsNoWboQrzbmJPNFd87n9kaQhmAKS8KBo9MwQUiKyzGizuJqOdI6eXam7OH/Wrepw+qgx1poeHvBQY58GmxkrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PSDAJ8S+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD9632D5;
	Mon, 17 Jun 2024 20:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718647396;
	bh=7wGQWDhi6lQQiJ+si7D4t5oFV9PoAp/Yzievup+XB6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSDAJ8S+yvyVc+xFMGWc9g1RY+pWoTnU60T+4WYX7ZR4Lnc5YN3GlQjsaHmIwYOri
	 ooJ/Cg+lSdPFsvc3RQMYA4PWsCSFqbPEzKkFkie/2KiEkIglOC0vTESMD5QV1rylM8
	 vhfcuAF3p8i9iaNFJUYdVxbY+ChUE+cx11pOt98w=
Date: Mon, 17 Jun 2024 21:03:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v3 0/6] media: uvc: Probe PLF limits at start-up
Message-ID: <20240617180311.GA23867@pendragon.ideasonboard.com>
References: <20240616231350.6787-1-laurent.pinchart@ideasonboard.com>
 <CANiDSCsNa_agem5t=5tHbppyem=OhbfULsArWJquxUCrCwAW9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsNa_agem5t=5tHbppyem=OhbfULsArWJquxUCrCwAW9Q@mail.gmail.com>

On Mon, Jun 17, 2024 at 09:43:50AM +0200, Ricardo Ribalda wrote:
> Hi Laurent
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> On Mon, 17 Jun 2024 at 01:14, Laurent Pinchart wrote:
> >
> > Hello,
> >
> > This patch series is a new version of Ricardo's v2 that incorporate my
> > review feedback and squash v2 7/7 into the appropriate commits. I've
> > decided to send it as a new version to speed up merging.
> >
> > As part of the squashing, patch 1/6 now implements a slightly different
> > filtering logic by ignoring mappings whose .filter_mapping() function
> > returns NULL. Apart from that, the series should be functionally
> > equivalento to v2.
> >
> > The patches have been rebased on my UVC -next branch. The base commit
> > can be found in
> > git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git. If
> > this version is acceptable, I will add it to the branch and send a pull
> > request in the next few days.
> 
> For reference this is the diff with v2
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index eb930825c354..79c6dacd516e 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -495,8 +495,8 @@ static const struct uvc_control_mapping
> uvc_ctrl_power_line_mapping_uvc15 = {
>                                   V4L2_CID_POWER_LINE_FREQUENCY_DISABLED),
>  };
> 
> -static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping
> -               (struct uvc_video_chain *chain, struct uvc_control *ctrl)
> +static const struct uvc_control_mapping *uvc_ctrl_filter_plf_mapping(
> +       struct uvc_video_chain *chain, struct uvc_control *ctrl)
>  {
>         const struct uvc_control_mapping *out_mapping =
>                                         &uvc_ctrl_power_line_mapping_uvc11;
> @@ -2408,8 +2408,7 @@ static int uvc_ctrl_add_info(struct uvc_device
> *dev, struct uvc_control *ctrl,
>   * Add a control mapping to a given control.
>   */
>  static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> -                                 struct uvc_control *ctrl,
> -                                 const struct uvc_control_mapping *mapping)
> +       struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
> 
> Just curious, do you have a nice vim code formatter that you can
> share? Or is it just "what looks nicer"?

It's the latter I'm afraid, and I'm sure it has changed over time. I
would nowadays use the '-' style, not the '+' style here. The diff shows
a change, but that's only because splitting patch 7/7 and squashing it
in previous patches removed the need to change the
__uvc_ctrl_add_mapping() function, so I ended up dropping the style
change.

>  {
>         struct uvc_control_mapping *map;
>         unsigned int size;
> @@ -2670,14 +2669,14 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> 
>         /* Process common mappings. */
>         for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
> -               const struct uvc_control_mapping *mapping = NULL;
> -
> -               /* Try to get a custom mapping from the device. */
> -               if (uvc_ctrl_mappings[i].filter_mapping)
> -                       mapping = uvc_ctrl_mappings[i].filter_mapping(chain,
> -                                                                     ctrl);
> -               if (!mapping)
> -                       mapping = &uvc_ctrl_mappings[i];
> +               const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
> +
> +               /* Let the device provide a custom mapping. */
> +               if (mapping->filter_mapping) {
> +                       mapping = mapping->filter_mapping(chain, ctrl);
> +                       if (!mapping)
> +                               continue;
> +               }
> 
> I guess that if the device is too broken to fail filter_mapping we can
> skip that control.

And I think we *should* skip it in that case, as exposing the control
would lead to trouble.

> > Ricardo Ribalda (6):
> >   media: uvcvideo: Allow custom control mapping
> >   media: uvcvideo: Refactor Power Line Frequency limit selection
> >   media: uvcvideo: Probe the PLF characteristics
> >   media: uvcvideo: Cleanup version-specific mapping
> >   media: uvcvideo: Remove PLF device quirking
> >   media: uvcvideo: Remove mappings form uvc_device_info
> >
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 184 ++++++++++++++++-------------
> >  drivers/media/usb/uvc/uvc_driver.c | 131 --------------------
> >  drivers/media/usb/uvc/uvcvideo.h   |   8 +-
> >  3 files changed, 105 insertions(+), 218 deletions(-)
> >
> >
> > base-commit: 75007ad7544c3a4da6b670983fb41cc4cbe8e9b1

-- 
Regards,

Laurent Pinchart

