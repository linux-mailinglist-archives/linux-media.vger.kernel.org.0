Return-Path: <linux-media+bounces-39120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E1BB1E83A
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 14:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 844153B42A7
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 12:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218B4277CB1;
	Fri,  8 Aug 2025 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dPzZMBIV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0F4266EE7;
	Fri,  8 Aug 2025 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754655682; cv=none; b=fECgd9HISwa0zUfgO2R8v5ADPb5NijnnLSh2G71fuCzQsCQ7JYXN+4MyzxsiycsA2HUPHLVL8Nx2dRd0jjN0eCbgYbxJCuI3gvecLa31wTdknzEp3eJ/z1Z3RC+hBCsTbp9dJbJdOBDBRFogTo//s7ca4xSIRVslgv0O480Qx3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754655682; c=relaxed/simple;
	bh=pQKEY9HKOjJeHrE/3Jam+y7lJIQyCzEeJAN2hxtlJ8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgYD7NdnVHyd8+zkGEgvW24HPbjneN3k3RuRqLZukvVURNzFP978T6ZMDLVuQWXEREIvJxz9+DZEeaOctrFnV9hcTDfURNoo9tuo+qxXH4q6LMWk674Ry93XPBqfH+lYYHkxtV3OUve7tp+puArg2+6VZjqtRRf+C7tZFbVTqnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dPzZMBIV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 516CA42D0;
	Fri,  8 Aug 2025 14:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754655628;
	bh=pQKEY9HKOjJeHrE/3Jam+y7lJIQyCzEeJAN2hxtlJ8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPzZMBIV5toDL6OezANTsT31Znty5c+FMBEc/jrycgU2PKmGKMGcUmX8BzAMjd6U+
	 N6zbUDa7UvNy//cOwdVhSXx1QnSXblG2Yn/yk0AjycwIv8jSwnZVJD0V/KHI3xS4fO
	 66ijSLgLCgyFCKYvBbRnhpTtY9HMkTdCKd1d5TXQ=
Date: Fri, 8 Aug 2025 15:21:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Arnd Bergmann <arnd@arndb.de>, Jim Lai <jim.lai@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/2] media: i2c: Add ov2735 camera sensor driver
Message-ID: <20250808122103.GC7299@pendragon.ideasonboard.com>
References: <20250731061004.5447-1-hardevsinh.palaniya@siliconsignals.io>
 <PN3P287MB3519EB2966DFF198318CC164FF2FA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB3519EB2966DFF198318CC164FF2FA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>

Hi Hardevsinh,

On Fri, Aug 08, 2025 at 09:13:01AM +0000, Hardevsinh Palaniya wrote:
> > The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
> > active array size of 1920 x 1080.
> > 
> > The following features are supported:
> > - Manual exposure an gain control support.
> > - vblank/hblank control support.
> > - Test pattern support control.
> > - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10).
> > 
> > The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a.
>  
> Hi Sakari, Laurent, Kieran,
>  
> Please let me know if there’s anything else I should improve or change.
> If not, I will proceed with sending the next version of this series, 
> including Andy’s and Krzysztof’s changes.

I'm quite busy at the moment and won't have time to review the driver
until after the OSS Europe conference.

-- 
Regards,

Laurent Pinchart

