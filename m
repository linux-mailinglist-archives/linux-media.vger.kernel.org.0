Return-Path: <linux-media+bounces-61114-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBzNCZfNAWryjwEAu9opvQ
	(envelope-from <linux-media+bounces-61114-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 14:37:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2E250DFD6
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 14:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A0353048DEC
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B0038F630;
	Mon, 11 May 2026 12:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ifB2BmY2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BF52DAFCB;
	Mon, 11 May 2026 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502964; cv=none; b=Rsi/eCf+vCbDlZBGILyd7PFPvt5noFVFliYM7oM380W0EHgq2Vf+esY/LIrRWDRxfrt+DmP51MME61UM51l8VnGcFCC2577DdI+kkLHH6PsIgZ7FCC/o+95fbUfmGwQehpgYPtvCk7rqLGhmpLwZXFPaqF1ijowacf/SZUbEUt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502964; c=relaxed/simple;
	bh=ax4A3f2MzJf5+dZA9M2R501DDz1MaI5ANJ5g95xtr1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4a3xbk0MNT6LuO5Cnk7QqrM6c+0Z2H+fEg0AO1c34K5g3gYhkWDWf7vXUVwGrFYMmOEwov1pQ8NEH9PYjma7FICIclEY2ZE7DWnLaWo4nx6EJpXRTqdu8DSjXbJzQBDvIpRoKVuu0zk47UbTWqL8XyYpFfukBTi/ODcJ6U3QqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ifB2BmY2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C66512EE;
	Mon, 11 May 2026 14:35:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778502954;
	bh=ax4A3f2MzJf5+dZA9M2R501DDz1MaI5ANJ5g95xtr1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ifB2BmY2tni+HPdOFe/cg/Lvlde9Ra+WDaaFsxl0Mh5dViec3w+zOkPS3HOobP7Lm
	 jrM9BdYZQ3l8JMJSTfZ3rYcF0oPvi1zLa/yGA6T5SEyipW4XxPWV+zQGoynOMllBic
	 5+GP9UZhza1fhO45lIOKDBlUqer/d7jYhFmuL5pE=
Date: Mon, 11 May 2026 15:36:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: uvcvideo: Introduce allow_privacy_override
 module parameter
Message-ID: <20260511123600.GA3095289@killaraus.ideasonboard.com>
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-3-19cd4657e1f3@chromium.org>
 <ad28139c-46b8-4209-9a43-14609763a883@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad28139c-46b8-4209-9a43-14609763a883@kernel.org>
X-Rspamd-Queue-Id: 7A2E250DFD6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-61114-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, Mar 30, 2026 at 06:02:10PM +0200, Hans de Goede wrote:
> On 16-Mar-26 14:34, Ricardo Ribalda wrote:
> > Some camera modules have XU controls that can configure the behaviour of
> > the privacy LED.
> > 
> > Block mapping of those controls, unless the module is configured with
> > a new parameter: allow_privacy_override.
> > 
> > This is just an interim solution. Based on the users feedback, we will
> > either put the privacy controls behind a CONFIG option, or completely
> > block them.
> > 
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> I realize this patch is not without controversy, but I do believe
> that this is an important step to safeguard the privacy of Logitech
> webcam users.
> 
> Discussion in this thread has mentioned libusb / usbfs access as
> a workaround. But that can be used to directly access usb-storage
> devices directly without going through a filesystem and those
> pesky filesystem permission checks, yet we do bother with those.
> 
> As with all things related to information security it is all
> about defenense in depth and this just makes it that bit harder
> for spyware to disable the privacy LED.

Is anyone aware of this being exploited ?

> I do believe that the RFC Kconfig option likely is a bridge
> too far. As discussed in the thread it will likely be at least
> a year before many stable distro users actually see the change
> adding this module parameter, so switching to permanently
> disabling this by default through Kconfig in a year seems much
> too soon and depending on the feedback we may end up sticking
> with the module parameter and never permanently disabling this.
> 
> As such while merging this I've removed this paragraph from the commit
> message:
> 
> "This is just an interim solution. Based on the users feedback, we will
> either put the privacy controls behind a CONFIG option, or completely
> block them."
> 
> and I've also removed the deprecation warning turning this into
> a regular bool module parameter.
> 
> I've pushed this to the uvc git repo for-next branch now,
> with the discussed changes squashed in.
> 
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 38 ++++++++++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_v4l2.c   |  7 +++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> >  include/linux/usb/uvc.h            |  4 ++++
> >  5 files changed, 71 insertions(+)
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index b6e020b41671..3ca108b83f1d 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -3001,6 +3001,35 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
> >  	return ret;
> >  }
> >  
> > +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector)
> > +{
> > +	/*
> > +	 * This list is not exhaustive, it is a best effort to block access to
> > +	 * non documented controls that can affect user's privacy.
> > +	 */
> > +	struct privacy_control {
> > +		u8 entity[16];
> > +		u8 selector;
> > +	} privacy_control[] = {
> > +		{
> > +			.entity = UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
> > +			.selector = 1,
> > +		},
> > +		{
> > +			.entity = UVC_GUID_LOGITECH_PERIPHERAL,
> > +			.selector = 9,
> > +		},
> > +	};
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(privacy_control); i++)
> > +		if (!memcmp(entity, privacy_control[i].entity, 16) &&
> > +		    selector == privacy_control[i].selector)
> > +			return true;
> > +
> > +	return false;
> > +}
> > +
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >  	struct uvc_xu_control_query *xqry)
> >  {
> > @@ -3045,6 +3074,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >  		return -ENOENT;
> >  	}
> >  
> > +	if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
> > +	    !uvc_allow_privacy_override_param) {
> > +		dev_warn_once(&chain->dev->intf->dev,
> > +			      "Privacy related controls can only be accessed if module parameter allow_privacy_override is true\n");
> > +		uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
> > +			entity->guid, xqry->selector);
> > +		return -EACCES;
> > +	}
> > +
> >  	if (mutex_lock_interruptible(&chain->ctrl_mutex))
> >  		return -ERESTARTSYS;
> >  
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index b0ca81d924b6..74c9dea29d36 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -36,6 +36,7 @@ unsigned int uvc_no_drop_param = 1;
> >  static unsigned int uvc_quirks_param = -1;
> >  unsigned int uvc_dbg_param;
> >  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> > +bool uvc_allow_privacy_override_param;
> >  
> >  static struct usb_driver uvc_driver;
> >  
> > @@ -2505,6 +2506,25 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
> >  module_param_named(timeout, uvc_timeout_param, uint, 0644);
> >  MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
> >  
> > +static int param_set_privacy(const char *val, const struct kernel_param *kp)
> > +{
> > +	pr_warn_once("uvcvideo: " DEPRECATED
> > +		     "allow_privacy_override parameter will be eventually removed.\n");
> > +	return param_set_bool(val, kp);
> > +}
> > +
> > +static const struct kernel_param_ops param_ops_privacy = {
> > +	.set = param_set_privacy,
> > +	.get = param_get_bool,
> > +};
> > +
> > +param_check_bool(allow_privacy_override, &uvc_allow_privacy_override_param);
> > +module_param_cb(allow_privacy_override, &param_ops_privacy,
> > +		&uvc_allow_privacy_override_param, 0644);
> > +__MODULE_PARM_TYPE(allow_privacy_override, "bool");
> > +MODULE_PARM_DESC(allow_privacy_override,
> > +		 "Allow access to privacy related controls");
> > +
> >  /* ------------------------------------------------------------------------
> >   * Driver initialization and cleanup
> >   */
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index f9049e9c0d3a..6d4f027c8402 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -133,6 +133,13 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
> >  		return -EINVAL;
> >  	}
> >  
> > +	if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
> > +	    !uvc_allow_privacy_override_param) {
> > +		dev_warn_once(&chain->dev->intf->dev,
> > +			      "Privacy related controls can only be mapped if module parameter allow_privacy_override is true\n");
> > +		return -EACCES;
> > +	}
> > +
> >  	map = kzalloc_obj(*map);
> >  	if (map == NULL)
> >  		return -ENOMEM;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 8480d65ecb85..362110d58ca3 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -664,6 +664,7 @@ extern unsigned int uvc_no_drop_param;
> >  extern unsigned int uvc_dbg_param;
> >  extern unsigned int uvc_timeout_param;
> >  extern unsigned int uvc_hw_timestamps_param;
> > +extern bool uvc_allow_privacy_override_param;
> >  
> >  #define uvc_dbg(_dev, flag, fmt, ...)					\
> >  do {									\
> > @@ -794,6 +795,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >  		      struct uvc_xu_control_query *xqry);
> >  
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector);
> >  
> >  /* Utility functions */
> >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index dea23aabbad4..70c2a7d25236 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -49,6 +49,10 @@
> >  #define UVC_GUID_LOGITECH_PERIPHERAL \
> >  	{0x21, 0x2d, 0xe5, 0xff, 0x30, 0x80, 0x2c, 0x4e, \
> >  	 0x82, 0xd9, 0xf5, 0x87, 0xd0, 0x05, 0x40, 0xbd }
> > +#define UVC_GUID_LOGITECH_USER_HW_CONTROL_V1 \
> > +	{0x82, 0x06, 0x61, 0x63, 0x70, 0x50, 0xab, 0x49, \
> > +	 0xb8, 0xcc, 0xb3, 0x85, 0x5e, 0x8d, 0x22, 0x1f }
> > +
> >  
> >  /* https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls */
> >  #define UVC_MSXU_CONTROL_FOCUS			0x01
> > 
> 

-- 
Regards,

Laurent Pinchart

