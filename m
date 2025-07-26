Return-Path: <linux-media+bounces-38501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 356F9B129F6
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 11:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ED7E1C82193
	for <lists+linux-media@lfdr.de>; Sat, 26 Jul 2025 09:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAF9227EA7;
	Sat, 26 Jul 2025 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HRj0IhwH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFB4155326;
	Sat, 26 Jul 2025 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753523006; cv=none; b=ebHcG++12SGp26ZA9H9kT06P0zQaNNgc4olZgpLs8+V0RkL8yFEiSVSPkQFAn0In8FrUohaigKdyAosIkxnZE0WSermLbExLlpYTmntEW73AZIQdUgCZ5Zuj3Q6Q6Ewocxb/MZzQFMuEqC/T+y4G7aTkT0MrIUjuO+aqhvVHCoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753523006; c=relaxed/simple;
	bh=gmoae3pQ6n1/2XP8mGxeGj2e+0uTKpbeI5N90BkBXcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/+xa0WWEwidCK9rXGQ+v0htHifrIm7jdia8sr6ro7CZwhPFCds+Guvzton+ISEMv4p0zJJ7QQrJAmBkOxW760S99cng61nF4EiHNKz6aMZZ2nlddW7g5tbXnpPXLerHXIzttNXV3ByE3rZPzphjRL2fvqyum86M5kUkr3evZcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HRj0IhwH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 821204C9;
	Sat, 26 Jul 2025 11:42:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753522959;
	bh=gmoae3pQ6n1/2XP8mGxeGj2e+0uTKpbeI5N90BkBXcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRj0IhwHMiVRjp+TVns7bQy+6Y3+uM9Gs9XOT8xxoMLoN0XSlTd8qUY3uKWpyIGR3
	 yLU+/jsolGOdd5EWZuPcBGF1Azh85YRUd95hQo4NDCTeLxzGF64rrdCVF4FeQPiwho
	 OnEWNvohZyl7Iusw20RVJj6q9uLZt3f2km8NstsQ=
Date: Sat, 26 Jul 2025 12:43:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <20250726094313.GD27425@pendragon.ideasonboard.com>
References: <20250724104711.18764-1-hardevsinh.palaniya@siliconsignals.io>
 <20250724104711.18764-3-hardevsinh.palaniya@siliconsignals.io>
 <aIKi1BkNzNvsf5Tr@smile.fi.intel.com>
 <PN3P287MB35190A4AEE4C8D98142E7B6AFF59A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
 <175345442477.2567018.13588829522231689027@ping.linuxembedded.co.uk>
 <PN3P287MB3519055FE42890F5F577B51BFF58A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB3519055FE42890F5F577B51BFF58A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>

On Sat, Jul 26, 2025 at 06:06:05AM +0000, Hardevsinh Palaniya wrote:
> > Quoting Hardevsinh Palaniya (2025-07-25 06:55:23)
> > <snip>
> > > > > +static int ov2735_page_access(struct ov2735 *ov2735,
> > > > > +�������������������������� u32 reg, void *val, int *err, bool is_read)
> > > > > +{
> > > > > +���� u8 page = (reg >> CCI_REG_PRIVATE_SHIFT) & 0xff;
> > > >
> > > > ' & 0xff' part is redundant.
> > > >
> > > > > +���� u32 addr = reg & ~CCI_REG_PRIVATE_MASK;
> > > > > +���� int ret = 0;
> > > >
> > > > How is this assignment being used?
> > > >
> > > > > +���� if (err && *err)
> > > > > +������������ return *err;
> > > > > +
> > > > > +���� mutex_lock(&ov2735->page_lock);
> > > > > +
> > > > > +���� /* Perform page access before read/write */
> > > > > +���� if (ov2735->current_page != page) {
> > > > > +������������ ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, page, err);
> > > > > +������������ if (ret)
> > > > > +�������������������� goto err_mutex_unlock;
> > > > > +������������ ov2735->current_page = page;
> > > > > +���� }
> > > > > +
> > > > > +���� if (is_read)
> > > > > +������������ ret = cci_read(ov2735->cci, addr, (u64 *)val, err);
> > > > > +���� else
> > > > > +������������ ret = cci_write(ov2735->cci, addr, *(u64 *)val, err);
> > > >
> > > > Do you really need this castings?
> > >
> > > Do you really think this casting is unnecessary?
> > >
> > 
> > Yes? Well quite probably - I haven't checked myself yet but ..
> > 
> > 
> > > Please check the definitions of cci_read/write
> > >
> > > without this, we can't even build the driver.
> > 
> > How about ... changing the function prototype of ov2735_page_access ?
> 
> Of course, changing the function prototype would work.
> 
> My intention is to keep a single ov2735_page_access() function that can
> handle both read and write operations. The cci_read() function expects 
> a u64 *, whereas cci_write() expects a u64 value. To support both cases
> within one function, I’ve used a void *val and cast it appropriately 
> depending on the operation.
> 
> If we were to remove the casting, we would need to split this into two
> separate functions, one for read and one for write, even though the only 
> difference between them would be a single line. I’d prefer to avoid that
> redundancy and keep the code compact. 
> 
> Let me know if you see a better way to handle this without duplicating
> the logic. 

Move the cci_read() and cci_write() calls from the bottom of
ov2735_page_access() to ov2735_read() and ov2735_write() respectively.

-- 
Regards,

Laurent Pinchart

