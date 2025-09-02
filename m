Return-Path: <linux-media+bounces-41579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 989A6B4013A
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F2B820370F
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610D02D3724;
	Tue,  2 Sep 2025 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="epj6UPXK";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="oD7/YPfr"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBA81419A9;
	Tue,  2 Sep 2025 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817320; cv=pass; b=eFRQ7xUPdJ1VJ7Iy78dvClBxwU5vv1bAX6FG1DIC5aMaweAtf1gc14AULAB7yqDq28VHAFpokDDFzjUGjKa8uMKxx9OV312pwvsOdgKCxt47/dyZqqxPB8zSZpvwc8uaQISxaNoXDn4OKEw7iWk/1TiHqhYnTJDICfsdNfytDcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817320; c=relaxed/simple;
	bh=wU7qWEPyst9Ftq4pRRZe+bFJYDPPTs9iuZXC5uioKWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBPl7soAmhe/kYstBY4xMVudqx/JrXkyKbvfUiBoDBZkRLpUhFuvf0ZVdhM4U5W+EQCrcrGg6DTLz294GW4lucmSdmFYdhOHzgWDC9c3HV4PfFT4j055dZ5trBrsAUgIOSd5NS+l/8so4dBLUMHtCAkhR4Cl4EjXRbQG8lnv4fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=epj6UPXK; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=oD7/YPfr; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4cGQX92xwlz49Pxd;
	Tue,  2 Sep 2025 15:48:25 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1756817305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2m0AdmzVx62ppePfQnYhxMw6RCz/hoGAXew6yRRziDg=;
	b=epj6UPXKkvHVikHqclwf/x1VwxUQe4BcLSg8BTYN4QDvgYnY7FXijn3AESULDsnc02KCgg
	9hrma22GPbk1ezurFBnxYtszE4H5gycpN7oEcv5OElgYOWztJeP+cGT0uK1eYiDzd4LBm1
	YxOhdyvv8ZuwmWgxqByFUap2DduMdHpUo2a9CVCoScv171PCTPMoEJyU4DrMRBv6euCLAr
	VkgBR8MEQHBk5PF6SAcfKu2AUr+b0KEuifOB1yY04vvhGDlCNyjpX53G1Fu12kxpK2SC0o
	Dx3BPDIJ+7m+kcgX70N1KG2twyVTFOR2rs4XJbQnAoO4lYhDZHsoxD6oanqCww==
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4cGQWx2kLbzyRp;
	Tue,  2 Sep 2025 15:48:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1756817296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2m0AdmzVx62ppePfQnYhxMw6RCz/hoGAXew6yRRziDg=;
	b=oD7/YPfrsYF7PqocSEKmT0mRJYjbdf0f+hJIpls01m/zB7brfUZRxI3iZ6H6juIFF9vR5b
	I5ij7AQaKok6tXEhHwoUOjVy3MZXQ+bm4T/rcJWYyK92+81ZhrvNr/F3C/W1ARspXTYsbt
	7EE5UnkBi/bV2iOMHKREoS+JUv9j5Ss=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1756817296; a=rsa-sha256; cv=none;
	b=inniAaeJ3cVCOuLXCrrmGOkUPS8+/0QrPFZyvGS7PBqY5RdBqdOvoW+fgPRqFDwDaozrNk
	bcWaq7Jrq28xHUaeYry4EduTtrMNoFRtd+JL3rzPyCObHiJCdoDv3+l/+k1ZQLIRskOMTW
	cBjV10vQK05w1wWvX8dK1U8KRoROsD4=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1756817296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2m0AdmzVx62ppePfQnYhxMw6RCz/hoGAXew6yRRziDg=;
	b=TVokqAm9YtsAIJtOLvtXvL6q0rWppmcxEl99Jjp/YiRh+BBysDbQUpd7zcxuO5WEpfO3Dh
	FFT1A6u11PRC4KxaDmLVGBJXY0TXVplpyfQutYI1JWuV1sHcrFSb9ftx/eoctgdeGDAwLS
	Z6wsX1x19hjcQxJ5NF9ES2tSJ1y6now=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9C9C8634C93;
	Tue,  2 Sep 2025 15:48:12 +0300 (EEST)
Date: Tue, 2 Sep 2025 15:48:12 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] imx-mipi-csis: Get the number of active lanes from
 mbus_config
Message-ID: <aLbnjLapJXlCe67R@valkosipuli.retiisi.eu>
References: <20250814113701.165644-1-isaac.scott@ideasonboard.com>
 <aJ77VTtZy96JJCHE@valkosipuli.retiisi.eu>
 <20250815103205.GJ6201@pendragon.ideasonboard.com>
 <aJ8ZJFSn5Wxhj2Aj@valkosipuli.retiisi.eu>
 <20250815113633.GM6201@pendragon.ideasonboard.com>
 <aJ8pKs_6YpAiPjlq@valkosipuli.retiisi.eu>
 <20250819024413.GJ5862@pendragon.ideasonboard.com>
 <175681611736.1349241.9877873145029586025@isaac-ThinkPad-T16-Gen-2>
 <20250902123805.GL13448@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902123805.GL13448@pendragon.ideasonboard.com>

Hi Laurent, Isaac,

On Tue, Sep 02, 2025 at 02:38:05PM +0200, Laurent Pinchart wrote:
> On Tue, Sep 02, 2025 at 01:28:37PM +0100, Isaac Scott wrote:
> > Quoting Laurent Pinchart (2025-08-19 03:44:13)
> > <snip>
> > > > > > > That would need to parse the endpoint every time we start streaming, it
> > > > > > > doesn't sound ideal.
> > > > > > 
> > > > > > Perhaps not, but does that matter in practice? Parsing the endpoint is,
> > > > > > after all, fairly trivial. The advantage would be simplifying drivers.
> > > > > 
> > > > > It's trivial from a code point of view, but it's not a cheap operation.
> > > > > I'd like to avoid making starting streaming more expensive.
> > > > 
> > > > How cheap is "not cheap"? I'd be surprised if parsing an endpoint took more
> > > > time than e.g. an I²C register write. Of course it depends on the CPU...
> > > 
> > > Still, it's not cheap, and I think it can easily be avoided.
> > > 
> > > > > > Alternatively we could think of caching this information somewhere but I
> > > > > > don't think it's worth it.
> > > > > 
> > > > > Drivers likely need to parse endpoints for other reasons. I'd cache the
> > > > > value in drivers, like done today, and pass it to a get_active_lanes
> > > > > helper.
> > > > 
> > > > Then drivers presumably would also validate this against the endpoint
> > > > configuration, wouldn't they? That's extra code in every CSI-2 receiver
> > > > driver.
> > > 
> > > Why so ? The number of connected lanes can be passed to the helper
> > > function, which can use it to validate the number of lanes reported by
> > > the source subdev.
> > 
> > Apologies if I'm interpreting this wrong, but it seems that the main
> > thing I'm reading is that this is not the correct place to implement
> > this, and it should be implemented at a higher level (e.g. in v4l2) that
> > lets all MIPI CSI reciever drivers use it?
> > 
> > I have noticed that similar functionality has been implemented as part
> > of __v4l2_get_link_freq_pad. Are you suggesting that I take a similar
> > approach and resubmit as a new series?
> 
> As far as iI understand, Sakari would like a helper function that will
> query the remote subdev for the number of data lanes it uses, and
> validates that against the number of connected data lanes as described
> by DT. I don't like the idea of parsing the endpoint properties every
> time we do so, so I think the number of connected data lanes should be
> passed by the driver to the helper instead. The helper would still query
> the remote subdev, and validate the value.

As long as the bulk of the work is done by the helper, I'm fine. This is a
fairly specific need but still in principle every CSI-2 receiver driver
needs it, so ease of use does count.

The helper could e.g. take the number of lanes in the endpoint as an
additional argument and just return the value if the sub-device doesn't
implement get_mbus_config() pad op. That'd be fairly trivial to use in a
driver.

> 
> > > > > > > > The function could take struct media_pad pointer as an argument, or struct
> > > > > > > > v4l2_subdev pointer and the pad number.
> > > > > > > > 
> > > > > > > > I wonder if any other parameters could change dynamically but I can't think
> > > > > > > > of that now, so perhaps just the number of lanes is what the function
> > > > > > > > should indeed return.
> > > > > > > > 
> > > > > > > > > +
> > > > > > > > > +   return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > > > > > >  {
> > > > > > > > >     struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> > > > > > > > > @@ -965,6 +1002,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> > > > > > > > >     format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > > > > > > > >     csis_fmt = find_csis_format(format->code);
> > > > > > > > >  
> > > > > > > > > +   ret = mipi_csis_get_active_lanes(sd);
> > > > > > > > > +   if (ret < 0)
> > > > > > > > > +           dev_dbg(csis->dev, "Failed to get active lanes: %d", ret);
> > > > > > > > > +
> > > > > > > > >     ret = mipi_csis_calculate_params(csis, csis_fmt);
> > > > > > > > >     if (ret < 0)
> > > > > > > > >             goto err_unlock;

-- 
Kind regards,

Sakari Ailus

