Return-Path: <linux-media+bounces-35620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CDEAE3DE3
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9FE217253C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 11:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF7621C178;
	Mon, 23 Jun 2025 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="hxrih/9e"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3083221D9E;
	Mon, 23 Jun 2025 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678070; cv=pass; b=DatXYKJ57iNnfIS2PC/uhEaXZT3sVTrvaam0Mr12UrqIzJ5z+VI86nV294v7Nm8szU/17UBFZlJboey6WawO2YFo23UMOmScnduScgYrWexPkWD7Q2b7nBhaegnVD03xbnUDse9qZ9YtE9UPyDkh7Fc3BCl9kGsJ/WloHev4C84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678070; c=relaxed/simple;
	bh=pfg5vRQioOluNyG1N0RB42NJFmxziBgtZYFyDan9tFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thJAdaClk6EkYR+ldW6WTB0ocMnSJXdnxE04fLGl0n3FaB7vKyj70H2/RpYARm6oZf8FZkwYO28JCTpPLgyGPvSG9iLsMMO8k0ld1j9x6s+22Apx8/F2ey1I1VuxH0Ph+C7fMENn+I50TtwtWThWmYr5pyrQJTON3yiP2oS/ZxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=hxrih/9e; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4bQm5l6HSYz49Q09;
	Mon, 23 Jun 2025 14:27:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1750678060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h04LSD/eziTW/dAC0CP/1lAMle7TJGTrSi4OGVbgdos=;
	b=hxrih/9eiXenztQTTOzjuOJ0l/fhfaKTrRcIfbgXD3rp3+kPQ51qbFJr6CIxf0ayLrw19D
	ij3vPbT7cECG1Jn86RsOeCavtLhPTOchMKUnawsyeCCOoZLMQXdTtM2YwvUqsDNoPj9TdB
	MFseM3IKNi3menWPWBo/Jfo2+16VSnV4/mAyahh70ghrP5ga2Bb34+b0JejplApAt5sDG6
	qANe8XDF0fIzCfgaf6akeoLFb2wQECby9XC8wFt6IVQlY/xt/6Pr9iugusr1LJZ46QiWEm
	zoTxL6VikE312s3U94ljSEzstjxsvxrc/dP/qp6ixQ8TCwA2Du1sji0ZBIHXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1750678060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h04LSD/eziTW/dAC0CP/1lAMle7TJGTrSi4OGVbgdos=;
	b=DRhJCWm+QfhjW0IYAC98Gdxipi5rVuxUR5XNHL1YdC7LEbEV4xr/O5ZF+AEs79T3s+3z/u
	TzceKpCqmoEVYxAMDQ+kzBheik2heWZhGdoo22XWhrgV+1NVf2dxyJnnu5G33pXJ+1Necq
	GoJkAOT2oi0sVA7xIHkTwBinOD5MNDIgA7+LIqCyKmVprOa/2VoQiv7/M60WbCOk8dFHZS
	f4l22EQEozEm69ysSxVOaqS4/vvUGt6rdgmJI5v4oRsTJ3axrMBRDI8+p2Zuzo78gONA71
	9YAKVQXw3m87YueN1oIzRDzduvRsh/Oh4xoOFaNYMheyQICvlprg2Qnk9rnoUw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1750678060; a=rsa-sha256;
	cv=none;
	b=A3yJqlwMgxOjLhtfFwTuSjtn6284/LDm/FaCUa0ZN308DdOLJzZ5DPHojjyzzgzNmn5sdL
	YLyWNDQP6+4uDZThuFayCEfbLem3gD+0dR4rOZ6xb2qpinP7RrjAvO+kK21hoK+YBIpbvl
	PfQHooe8rNvMRj9BqTv1xXKFNMT+HgDqf2p8ZBIobf6DDDsfCGDeFKaUagb34MRofaXti2
	g2k0iPswE9/pVEMx0ogqhppyUA59+elZ7Z1xFKI4ROZwPjabd5DcSaHDVZxHS469U8gTk0
	YDpKTJoOGb4+W7p9LL9phTQya4RYZqGcmH1v7snvucDXoBfkxQsPRisyMEWafA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5C96A634C93;
	Mon, 23 Jun 2025 14:27:39 +0300 (EEST)
Date: Mon, 23 Jun 2025 11:27:39 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com,
	king.li@amd.com, dantony@amd.com, vengutta@amd.com,
	dongcheng.yan@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <aFk6K4mYtq24MnNj@valkosipuli.retiisi.eu>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <20250614225257.GO10542@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614225257.GO10542@pendragon.ideasonboard.com>

Hi Laurent,

On Sun, Jun 15, 2025 at 01:52:57AM +0300, Laurent Pinchart wrote:
> > > > +#define OV05C10_REF_CLK			(24 * HZ_PER_MHZ)
> > > 
> > > Seems your module use 24 MHz clock input. The Dell's modules always use
> > > 19.2MHz, which means your the PLL settings will not work on Dell's.
> > 
> > This is ok as further work. Please send a patch. :-)
> 
> The patch should calculate PLL configuration dynamically, perhaps using
> the ccs-pll calculator if applicable.

As much as I do like your suggestion, I don't think it's really feasible to
often do this for Omnivision sensors (most others largely do just work
without much hassle wrt. PLL, as long as a PLL calculator exists). This
sensor's PLL tree is different from CCS and badly documented, as expected.

> > > Seems there are already several camera sensors using page-based registers.
> > > Is it a good idea to add page support in CCI interface?
> > 
> > Sounds like a good idea as such but I'm not sure how common this really is,
> > I think I've seen a few Omnivision sensors doing this. If implemented, I
> > think it would be nice if the page could be encoded in the register address
> > which V4L2 CCI would store and switch page if needed only. This would
> > require serialising accesses, too. There's some room in CCI register raw
> > value space so this could be done without even changing that, say, with
> > 8-bit page and 8-bit register address.
> 
> Ack. I've worked on a driver for the AP1302 external ISP, which also
> uses pages registers. The full address space spans 32 bits though, but
> fortunately the driver doesn't need to access anything above 0x00ffffff.

0xffffff? The current CCI register addresses are limited to 16 bits. To
support that, we'd need to use u64 most likely. For 16-bit register
addresses and 8-bit values which probably are the most common, that starts
to appear a bit wasteful.

-- 
Regards,

Sakari Ailus

