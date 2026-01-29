Return-Path: <linux-media+bounces-51794-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLaoGGfSe2nrIgIAu9opvQ
	(envelope-from <linux-media+bounces-51794-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 22:34:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B96FEB4D1F
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 22:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EF7D30AEDEB
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 21:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E9735C1B4;
	Thu, 29 Jan 2026 21:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="UREoisG9"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A1C2F5A28;
	Thu, 29 Jan 2026 21:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769721966; cv=pass; b=hqpvggXoij3SN7tMvyCC2zQSwXeoafDvnaXAyYAZ4VS53iYNr2kreRl32ixO1eciBVvEcmOEOks7vLrTpJenPiGr8ot0Y5MW3pYIB141bOVTFufHoQHKxQF0WMKqz3xdzGqOjg827uuQ35qLvYgmKSBaYhRmB8l3XKrwY9uFDPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769721966; c=relaxed/simple;
	bh=BHYn+DrKdS8gMpqMTd9IBvd43kuZUvW+2jj3ckgrS/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNDHrwv3ooW4O8E9FOVB3MRJq2s3TXnuFM7aiRtnkjF6t8pmeKNjHCe75V87InGkLhAHodz8XCUYIOBOJokFmIshYAx8JGzuj2s4SxZbI1iM5OzCXt5NZlA8Zs3Ubf9vARVl9HTFv9IHqbTvP6NKHzAQoxkjXTf+gEY9Rsss8OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=UREoisG9; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4f2BnB5CVfz49Q4q;
	Thu, 29 Jan 2026 23:17:50 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1769721471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Px9ArMU72eS2DZM6sPnYMvj/HAEcdGN5InvjqFpwDC8=;
	b=UREoisG9DpMBG+PQYXlzQPjNIXY2btn6SjY22IznoxI+9xIMp4+MmP+IS7zw6/XoCmEnuM
	rbWgmoDuh3SQAx2I9gT5r127Laz/69ZpDBQe9GPPGuXGoW+ltM1hnOkHZsG3zLnJXW41rx
	4JG4OkFPJPNUxO66SXzAEmMeliLVOiY3hhK4FsYCRbkXNxJUoBVOelapr6NX0shDFaJSJ1
	P+5hB8SVdN7MGJguxxPm6CeshSmuvb7hdIrPMTtZMAJEJDI+fgOjCbd339gJTPRH8lQYvz
	56ukeE7ZTfkG8polAoY5OwLayiS2cVhe3+bp6n2q9r0ffwziQ+o9nNYOON7jWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1769721471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Px9ArMU72eS2DZM6sPnYMvj/HAEcdGN5InvjqFpwDC8=;
	b=Ivo+uxOo3Dl46yW2BZfurDMcUOTkMD24FoAjn9+WExPKg3tgPVMwVsCtlgusmyxIlrdTI/
	5CNygxcRhlb16kVU44AhxJo8Ky9Qdqkd2yUMDbBp3oCFBH+/24YMbXYZsy1AzzbjNIC3Pc
	a4BGJl0tfsoCtyAx/Qj/WoWV0/jlIfcUPGkhIShjX6hVVaM6xTIIuA4HS6eswMV8pis415
	DUHI8oXVAOHXv4ANRUYkAQjGsGJY/fpQO/XwXeyrfr49J7UYh369FSGcXz4n6RwuCqc4qv
	wO/lceCSytSf7ccxVm+KMPmaELDtk2GZ50MdPMmimE8rkPY5LKXodah51bFrrA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1769721471;
	b=l5dlvQvb4vAtUz52veLN04B6lPIrR5dYNrkywxy/BRmYxxjZkC5aA7oQix8SrGpyPY6F8E
	4AazpdttwFZTgr+vWWRcefKiLRRsKRicE6nE8fJ8SD0kyBDOiSI7Jp5FGrx1Mlae9dmCWo
	D21teKh9HOwY8PzTnfmgS9GAnfBWCLxoAhQMl0ojNfmOkW6aKsCcKZpllAaJ+lY2lllCQQ
	gR1GBoU0YSK+JyZzirOtJibJ9cO/Etozja/Y4lQZl/VBT81YUYe7ObmOsHJ1Xa1/xge1YR
	0X0AXVyRSNO0BXd/vgXdnqDb5J5U+eEjClCEh/dRPzuxfk5sHH1DnCbNjYJfOg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2793B634C50;
	Thu, 29 Jan 2026 23:17:50 +0200 (EET)
Date: Thu, 29 Jan 2026 23:17:49 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: "Du, Bin" <bin.du@amd.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>,
	"bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sultan@kerneltoast.com" <sultan@kerneltoast.com>,
	"Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
	"Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
	"Li, King" <King.Li@amd.com>,
	"Rosikopulos, Gjorgji" <Gjorgji.Rosikopulos@amd.com>,
	"Jawich, Phil" <Phil.Jawich@amd.com>,
	"Antony, Dominic" <Dominic.Antony@amd.com>,
	"Limonciello, Mario" <Mario.Limonciello@amd.com>,
	"Gong, Richard" <Richard.Gong@amd.com>,
	"Tsao, Anson" <anson.tsao@amd.com>,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v7 5/7] media: platform: amd: isp4 video node and buffers
 handling added
Message-ID: <aXvOfXNn2gGsmkfg@valkosipuli.retiisi.eu>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-6-Bin.Du@amd.com>
 <aUl61d5mQq2ep8qE@kekkonen.localdomain>
 <f62729ba-a271-4f3f-a929-4f07ae3368b2@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f62729ba-a271-4f3f-a929-4f07ae3368b2@amd.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51794-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com,amd.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iki.fi:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: B96FEB4D1F
X-Rspamd-Action: no action

Hi Bin,

On Fri, Jan 09, 2026 at 06:08:00PM +0800, Du, Bin wrote:
> > > +static const struct vb2_mem_ops isp4vid_vb2_memops = {
> > > +	.alloc		= isp4vid_vb2_alloc,
> > > +	.put		= isp4vid_vb2_put,
> > > +#ifdef CONFIG_HAS_DMA
> > > +	.get_dmabuf	= isp4vid_vb2_get_dmabuf,
> > > +#endif
> > > +	.map_dmabuf	= isp4vid_vb2_map_dmabuf,
> > > +	.unmap_dmabuf	= isp4vid_vb2_unmap_dmabuf,
> > > +	.attach_dmabuf	= isp4vid_vb2_attach_dmabuf,
> > > +	.detach_dmabuf	= isp4vid_vb2_detach_dmabuf,
> > > +	.vaddr		= isp4vid_vb2_vaddr,
> > > +	.mmap		= isp4vid_vb2_mmap,
> > > +	.num_users	= isp4vid_vb2_num_users,
> > > +};
> > 
> > Could you elaborate a bit why do you need your own videobuf mem ops?
> > 
> 
> Sure, ISP FW/HW can access system memory only via GPU VA, not system VA, so
> vb2_vmalloc_memops can't be used directly, we need to base on it to
> implement our own videobuf mem ops to support both GPU VA and system VA.

It's fine to use other virtual addresses than system ones (a lot of other
drivers do in fact, e.g. IPU6), you generally don't need to add new memory
types for this.

...

> > > +struct isp4vid_capture_buffer {
> > > +	/*
> > > +	 * struct vb2_v4l2_buffer must be the first element
> > > +	 * the videobuf2 framework will allocate this struct based on
> > > +	 * buf_struct_size and use the first sizeof(struct vb2_buffer) bytes of
> > > +	 * memory as a vb2_buffer
> > > +	 */
> > > +	struct vb2_v4l2_buffer vb2;
> > > +	struct isp4if_img_buf_info img_buf;
> > > +	struct list_head list;
> > > +};
> > > +
> > > +struct isp4vid_ops {
> > > +	int (*send_buffer)(struct v4l2_subdev *sd,
> > > +			   struct isp4if_img_buf_info *img_buf);
> > 
> > Is there a reason why isp4sd_ioc_send_img_buf() isn't called directly?
> > 
> 
> In our design, isp4sd serves as the upper layer of video. Therefore, isp4sd
> can directly call functions within video, but not vice versa, This callback
> mechanism is implemented to support the call from video to isp4sd by
> indirect way.

You still have a single module, don't you? Thus you can make a direct
function call. Only use a callback pointer when you actually need one.

> 
> > > +};
> > > +
> > > +struct isp4vid_dev {
> > > +	struct video_device vdev;
> > > +	struct media_pad vdev_pad;
> > > +	struct v4l2_pix_format format;
> > > +
> > > +	/* mutex that protects vbq */
> > > +	struct mutex vbq_lock;
> > > +	struct vb2_queue vbq;
> > > +
> > > +	/* mutex that protects buf_list */
> > > +	struct mutex buf_list_lock;
> > > +	struct list_head buf_list;
> > > +
> > > +	u32 sequence;
> > > +	bool stream_started;
> > > +
> > > +	struct media_pipeline pipe;

You might not need this for the time being at least.

> > > +	struct device *dev;
> > > +	struct v4l2_subdev *isp_sdev;
> > > +	struct v4l2_fract timeperframe;
> > > +
> > > +	/* Callback operations */
> > > +	const struct isp4vid_ops *ops;
> > > +};
> > > +
> > > +int isp4vid_dev_init(struct isp4vid_dev *isp_vdev,
> > > +		     struct v4l2_subdev *isp_sdev,
> > > +		     const struct isp4vid_ops *ops);
> > > +
> > > +void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev);
> > > +
> > > +void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
> > > +			       const struct isp4if_img_buf_info *img_buf);
> > > +
> > > +#endif /* _ISP4_VIDEO_H_ */

-- 
Kind regards,

Sakari Ailus

