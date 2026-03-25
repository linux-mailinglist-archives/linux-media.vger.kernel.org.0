Return-Path: <linux-media+bounces-57034-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BdKD/fZw2lwuQQAu9opvQ
	(envelope-from <linux-media+bounces-57034-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:49:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FFB3252A4
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4D493148CF6
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518B93D4135;
	Wed, 25 Mar 2026 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="lTYH5aFw"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C5C3988E6
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442076; cv=pass; b=bSk+CWrcvBE+fC0/eKcHbgDtS7Piugs6NxM20kAGqXOAyZPbiQatWuTvY3I7zMJf+CSjyZMi5Fsa1gzrWedTjKqXgUBNDoD1of/xNDoEKC2epDV16X4DY2/zzLQvtY8QSy5ONZ0ZJPib7sORsBfBEX/bFF/nna6qQi/m6jPyscY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442076; c=relaxed/simple;
	bh=07JrRyr+25nKu/vUeQsnj3nA5oLzETCwN3DQYNvfy/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAhz72OHaTX2DvuwapcOMFvtU1g/rN1zjjX2A+fXcWLL/nR260sgyrqDXOA5Qn5BVjqLBCVi7/Mv5EzNOIt1Um03zxxTOyYrAzC84OhB6SYg/nEMp3V5lRCJjWbTB+adOnimTw4tqsb8icz/wtYZKIKCF7p9C2dPpUrVEBntDbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=lTYH5aFw; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fgmYs6GqRz49PyD;
	Wed, 25 Mar 2026 14:34:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1774442067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0am2X80AoRPQAoaLag8eporFmoFogQZjYq0UrHRmJC8=;
	b=lTYH5aFwjQIiWYn9vlat06l/uSF2lWBtNuSY0du2YtiqMgoF91NHCp4qOKW0oZ1c0MW9NK
	MyDM+7qfufBLgWtZ7Not/oIdSWETmdecSEgKJmUs/QGyUFR63VmV33hkxwB70F3gsZTGLk
	TTAL7tCwzDWtbZtwIZObT/1wK2Y0SEKsu+68582AqGcOOoPMT70I0GyZ6jj+ZDIPXopB7G
	vRTH7+cBRBaOa07Mcd7xujFeOsPb3xY7i5HfEakFDNuBdc+cj9aKzqo3RQiB5EteMw3XLZ
	RQTl3CVMaY1+pdiCofh7MZnlxHTZWxLVk1NSKwyuhNe5K/9YSdpW0/GwgOKgeQ==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1774442067;
	b=Xj5TDLgUs0/RfY3gW9NHp1r/0pXto+YKQmWbFvqtf/mI6qznMrZNtUM/D19AgVZiJMQChD
	HWvNEJRLRIz55nAUXQuZUP1qUTPXUZq0l0dsAP9a9h2+EkKcUU9AJZelij0j4MWdKMwivw
	WDSdZuhgnEFZHxH5srMtEW+xF+LP375ppDSILjH5NQcWTAQqnWmRdaYsE3VxJKBS8fN84p
	ncNTT1uUBSdlZ/sbq3Exki3x3OwN+vmFeDfxqXcTuBOyEr9LhkZh2fy9Oeie7u+FwRXkYJ
	TbP+W7oxoGbOf17Kmbw/p+rwv3Y34HBJ4gFOLzcgqjn8NgdRFSCMyrSc8S31oQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1774442067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0am2X80AoRPQAoaLag8eporFmoFogQZjYq0UrHRmJC8=;
	b=eXocunOsRV0S5OXHZIhxHUihnAMCpe/sfyVqaXUGAvxcnPwXXCUPllq5nsYBj0R0qU/FdX
	dVfEAnH5mUgY/gnZHIBwuu8YXuw0QPPv4pjhx6pc00oENvCrO9j2T9yAx699h8jyOjt1h8
	rsYK2ZLt1o3MzLfT21L6Lzkzc325ZxwEgugHOpoUGkCIcAYPzvX2Q53gOvKEkYsY7G70eb
	bIMBt+06Q+srhR0obeh0m3Za78NOwQN9jvEqb8UO7uDL4aR9jSgXKvGey+4p2DV8K9e/LC
	pS8YdN1FOj4/P6/3+ixBVemEXbraBNBdByCoC3OZrkIpjPUXnDmZxUic06+nhQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5C28C634C4E;
	Wed, 25 Mar 2026 14:34:24 +0200 (EET)
Date: Wed, 25 Mar 2026 14:34:24 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v3 14/14] media: Improve enable_streams and
 disable_streams documentation
Message-ID: <acPWUCf15tueeEpe@valkosipuli.retiisi.eu>
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
 <20260325105818.1176816-15-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325105818.1176816-15-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57034-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[iki.fi:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,intel.com:email,iki.fi:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 95FFB3252A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Folks,

Please ignore this patch -- it was somehow left to the directory where I
sent the set.

On Wed, Mar 25, 2026 at 12:58:10PM +0200, Sakari Ailus wrote:
> Document that enable_streams may start additional streams and
> disable_streams may not disable requested streams if other related streams
> are still enabled.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  include/media/v4l2-subdev.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d256b7ec8f84..4588992b4417 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -814,6 +814,10 @@ struct v4l2_subdev_state {
>   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>   *	argument.
>   *
> + *	Starting the requested streams may require starting additional
> + *	streams. Streams that are started together due to hardware are called a
> + *	stream group.
> + *
>   * @disable_streams: Disable the streams defined in streams_mask on the given
>   *	source pad. Subdevs that implement this operation must use the active
>   *	state management provided by the subdev core (enabled through a call to
> @@ -823,6 +827,9 @@ struct v4l2_subdev_state {
>   *	Drivers that support only a single stream without setting the
>   *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
>   *	argument.
> + *
> + *	A stream group is disabled when one or more streams in the stream
> + *	group are disabled.
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*enum_mbus_code)(struct v4l2_subdev *sd,
> -- 
> 2.47.3
> 
> 

-- 
Sakari Ailus

