Return-Path: <linux-media+bounces-35516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10816AE27EE
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 10:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2AD37AA5C6
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 08:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79DB1DE4CD;
	Sat, 21 Jun 2025 08:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="kOeQarjj"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2479778F3A
	for <linux-media@vger.kernel.org>; Sat, 21 Jun 2025 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750493464; cv=pass; b=WxLeMlj42ERyvQbnrHEuchuTJVg49ZmwVxjobcZpV7q6123FWgSe9eJtQzM8IxFg61KX6o4Ck9hBf760ejTUuLSi0V7QSeu27pNy7APMFM/adqebE+DGMiisMk+tuKj7H2JOG+xoATM4Ks0sCN4PNYatCxGnydrhItPjybAv33I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750493464; c=relaxed/simple;
	bh=57Ektm+fKdSFz6XdklPmUVtYdBUZbDmmY1Y93RboCZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctYU+qNtO6IZxTrwvqXzv/vVGDxFoP6/ATEedCprg/5QDabxbW8mOqxLMkOT21QcUWmTWR9LAF3DGrtxXxGd/1h+v5zKgg9Au4nlzPOuezEUEFufNB66RA/KadeVrqduxZhfAXlqHdJIkaaz8XyjbMdVRumEHjaYViVAdVyn8Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=kOeQarjj; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4bPRqf3DvBz49PvY;
	Sat, 21 Jun 2025 11:10:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1750493454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPS67ekYCJGNk5Ghf6nMexoBby+Sjt2oGewrB4CKvjs=;
	b=kOeQarjjgrtDq1Y2SCtuupFj9a48F79QD/gOQaaMEzULr6gpKcsa15pMB86IJ8UFTDzP5e
	MKGTpfnMpoUJjX1WccPjDRtznW3ln/9qTLax8zaUeYdYuaJGPXYI1QrfEH07Z48iOb2Plg
	u3Geyg8rKmOFr1J4Y5iNt9E51yemc5UH0MsP4mqslBQ2in0pHfLrUccQMcexzo0/gWag99
	BW2umFDv+9x1I1kjIt4MBuqOcbVdEwjgDuOJzQWcsDh7kzbJ/CiNOzQXDeX7B5nO/yfzp3
	hKqzVB7bUgceELCiJNyuK4HHTKiIDt/iNVFE2qrNXZ6gYKEb57IriNyj2V0lhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1750493454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nPS67ekYCJGNk5Ghf6nMexoBby+Sjt2oGewrB4CKvjs=;
	b=vuVXAwrHIYXAteqvFUg7U4XoDoK4Mw2yfMy6g34IlBfhATXm4PvwhtNtEVix7EdUWqwULi
	MLAWHDKs0n2vFgw/weNLlmOenafsly5GNQMPP/7bzfhvuhhuMPHyAdFseXGtt+LPewzHE4
	R8kl12kWtmgab2wjiDsbAEhN1nU4l6hxJKg3BYp7i/jEdgaKbeUvObUsEOnhd7OZHC2hyW
	fp2l4Akm7x1xxfQeWkE5aLAuEnnX40RzQ56FhPO3YfHmySbnNozolsorR2GXnBtFEBCFCq
	eXzt5r+35MrbptUmkrQVWwYCWrCaIAIFfu7gnwX38/I/hhjib1xG06kL3v3BtQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1750493454; a=rsa-sha256;
	cv=none;
	b=g1vXfaD894Nd8vqYZJLOgDFVK2w6B+Pv+SOs11+wQfw83o1/8VqD8ftD79ZGNhjB5+kdnD
	pNWibdnICzb1SVl6fo9AlW2dpeFj3ShMfNyxsuRc5Zp1Z/6bIlAmOtK2F+ApzBpEPCh0Y0
	JgFOrq81fDn6pdK2THiVAAiBqcFUEBbmCBUnXc6V8o7iBgmQ19U65dNzJLC5k7YrSE4Flo
	oCu1GBwRhr5ES/m4Oz6U2MHsaf9t3wKkZk2XhuFzTt0CNFmZHje5/TQDUGhxkCTI8O2CjA
	fqy+DO5QzmhEcZ5Sgn19V261+ey4diap5R4zGIwbVTkS4+Ca2NV2iDx1EeNLQA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 28B6C634C93;
	Sat, 21 Jun 2025 11:10:54 +0300 (EEST)
Date: Sat, 21 Jun 2025 08:10:54 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 12/13] media: v4l2-mc: Introduce
 v4l2_mc_pipeline_enabled()
Message-ID: <aFZpDpP45IsKLmGA@valkosipuli.retiisi.eu>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-13-sakari.ailus@linux.intel.com>
 <zubhgen5vcjeadujrufagjd3h6rp5va7d7n27fqisc23kr35sn@sg4mwenwnbmc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zubhgen5vcjeadujrufagjd3h6rp5va7d7n27fqisc23kr35sn@sg4mwenwnbmc>

Hi Jacopo,

Thank you for the comments.

On Fri, Jun 20, 2025 at 10:53:13AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 11:15:45AM +0300, Sakari Ailus wrote:
> > v4l2_mc_pipeline_enabled() helps solving a problem known for long but
> > lacked any sort of general solution: with multiple streams, when streaming
> > is started on video nodes one by one, when should streaming be started in
> > the source?
> 
> I tried quite some time to understand this, but if I'm not mistaken,
> a stream-aware subdev, which links to vdev, will always "demux"
> streams to different pads and will connect to the vdev from there
> 
> 
>      Source
>      subdev
>  +-----------------+
>  |                (1/0) ------> vdev0
>  |                 |
> (0)[1,2,3]        (2/0  ------> vdev1
>  |                 |
>  |                (3/0) ------> vdev2
>  +-----------------+
> 
> With
> 
> (0) multiplexed sink pad with 3 streams
> (1) (2) and (3) source pad with a single stream
> 
> Can't we relay on the media-link state between the source pads and the
> video devices with something like what Dan has proposed here ?
> https://patchwork.linuxtv.org/project/linux-media/patch/20250519140403.443915-2-dan.scally@ideasonboard.com/
> 
> What am I missing ?

There are two different concepts here that are probably underdocumented at
the moment: Media entity pipeline state and then when and in which order
streaming control is applied on hardware. But... maybe the latter can be
derived from the former when it comes to video nodes. The pipeline is set
for entities that are upstream from the video device, it's not set on
downstream entities. I'll see if I could use that instead. Otherwise, I'll
check if Dan's approach could be used for the purpose.

-- 
Regards,

Sakari Ailus

