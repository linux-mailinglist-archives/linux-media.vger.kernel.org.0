Return-Path: <linux-media+bounces-12074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD368D180D
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 12:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08A161C248A6
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C56F16ABCC;
	Tue, 28 May 2024 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="WOnEOFzn"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE68473471;
	Tue, 28 May 2024 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716890666; cv=pass; b=dG+TZxGH0TV4fJKVAN1u8rauFWi1PyitYD+4mz0B96GCjsrKDkzcgN6RqFifNkd95CnKyk0GxHvzbTxpwDQ0wiIaCH/iY+082s2CCyh7+M8Qlv2DuUW6SzU38DSGfuh6F3i20WCDYjtARmpFnraG3pxmjdshxs0qvSMOj2i8NLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716890666; c=relaxed/simple;
	bh=g4CBUXz5T5mu/JCnMt3kyJeUI5ZO8IAT+hqau0JiDts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2LyNHoU7bUUYc53YUFzCUCBA22ISvsSvpHSDLRHEpn7ETGfLQFG0ith9So/xcuEFQKnWXgdlwA88bu33vtTJtDMCiUVb1Kspf4u/gdwWA9lvGEnccTo6176OC40GqVmn+3XQoCqePhAjvLH4R7AqgSqlQ8oouDu5pqGEcVZhD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=WOnEOFzn; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VpSm62k6YzySG;
	Tue, 28 May 2024 13:04:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716890662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oc5lpaoUHfjbT29KeXkb2c/2QzBp2Sez/PsceYiqTG0=;
	b=WOnEOFznfy1bJ+dBgvLx8Qq+pMpXfi73FseMJSufjRH9XgnTzsLvALFEJDwhIJVUJTBHQC
	96N9mHo5g8uuLY0eeb5kPU5L39W7U7C4BJDvYrhKbuuJjmsTarQVStq1a3SE/YGegNeyKE
	rkuMYROAldM798FAU2cE4PtCdaCK/HE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716890662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oc5lpaoUHfjbT29KeXkb2c/2QzBp2Sez/PsceYiqTG0=;
	b=loIdKMLRludf7WtdSO+IsQ2eZhxmu1xw9v1ZmqsBJjG5NN84Tmoc3lvyGRaIOjWJZcui0C
	ohH+dKTyHkpCB8Zop1Ydtcj4oc+mP7OwRE+6KmXBB8B4+BmZZGK8rfKAMV70Oyeyn75exm
	YtmKsGnWafNIdRTqvEJotGQ0YaRZokI=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716890662; a=rsa-sha256; cv=none;
	b=YLcHPXBQiGA8MgaVuUmN3uxrJxdiFu8onLUgkI1lp064qrdhp5/bcTnv7IOPSYqfzJy1GA
	OkkKLwnELuhxdhQkb507BjbC3pmjPMLftELRqVK9DpAhYctA2bjepW2Bz1+L3o22ZPhfmZ
	auwqRpHcesisfh0r02ldP9svb/xpTPE=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 33EC0634C93;
	Tue, 28 May 2024 13:01:22 +0300 (EEST)
Date: Tue, 28 May 2024 10:01:21 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	benjamin.mugnier@foss.st.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
Message-ID: <ZlWrcTCNBWEz67Tj@valkosipuli.retiisi.eu>
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
 <20240521162950.6987-2-sylvain.petinot@foss.st.com>
 <8afe1888-5886-45fc-b576-98db3d392d37@linaro.org>
 <ZlWiQTfag5yTA4YM@valkosipuli.retiisi.eu>
 <b6d3d336-5999-424a-9e38-3cf793b6627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6d3d336-5999-424a-9e38-3cf793b6627e@linaro.org>

Hi Krzysztof,

On Tue, May 28, 2024 at 11:46:00AM +0200, Krzysztof Kozlowski wrote:
> On 28/05/2024 11:22, Sakari Ailus wrote:
> > Hi Krzysztof,
> > 
> > On Mon, May 27, 2024 at 09:04:38PM +0200, Krzysztof Kozlowski wrote:
> >> On 21/05/2024 18:29, Sylvain Petinot wrote:
> >>> Add devicetree bindings Documentation for ST VD56G3 & ST VD66GY camera
> >>> sensors. Update MAINTAINERS file.
> >>>
> >>> Signed-off-by: Sylvain Petinot <sylvain.petinot@foss.st.com>
> >>
> >>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index ef6be9d95143..554e6861425b 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -20885,6 +20885,15 @@ S:	Maintained
> >>>  F:	Documentation/hwmon/stpddc60.rst
> >>>  F:	drivers/hwmon/pmbus/stpddc60.c
> >>>  
> >>> +ST VD56G3 DRIVER
> > 
> > I might add this is a sensor, i.e. "ST VD653G IMAGE SENSOR DRIVER".
> > 
> >>> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> >>> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
> >>> +L:	linux-media@vger.kernel.org
> >>> +S:	Maintained
> >>> +T:	git git://linuxtv.org/media_tree.git
> >>
> >> This is a friendly reminder during the review process.
> >>
> >> It seems my or other reviewer's previous comments were not fully
> >> addressed. Maybe the feedback got lost between the quotes, maybe you
> >> just forgot to apply it. Please go back to the previous discussion and
> >> either implement all requested changes or keep discussing them.
> > 
> > The above MAINTAINERS entry is roughly in line with what else we have for
> > the Media tree. I'm in favour of listing the people who would look after
> > the driver, not just those who merge the patches (or even send PRs to
> > Linus).
> 
> I did not propose to drop the entry.
> 
> > 
> > In other words, I think the above entry is fine as-is.
> 
> I propose to drop duplicated, redundant git entry. Maintainer of this

Ah, I agree, that makes sense.

> driver does not have access to git tree and the git tree is already
> explained in media subsystem entry. If you ever update the git tree, you
> need to update 100 driver entries which is meaningless...

-- 
Regards,

Sakari Ailus

