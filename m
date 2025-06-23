Return-Path: <linux-media+bounces-35646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E423AE4511
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 15:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE4751895B4E
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74AD253B56;
	Mon, 23 Jun 2025 13:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XPgSn8Di"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FF425392D;
	Mon, 23 Jun 2025 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686145; cv=none; b=u8VdwQ45Yz7u+PqojypE3jhlEl0d4u1lDm5lNqLVCvogDBu2poLkY2kJ8jQDgkPYKbefnfClpZXfLIxG9yZ6dH6XutRkdJvsRADvcrNxgRy4Ee7uDt+JoOoWdiwwPle2xAeWmxceglDCYN33iLnxUZDVAwzSCRCLptleVJ4oUUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686145; c=relaxed/simple;
	bh=Co65TiTS9Q9fFk3zQhoDANBVjWL264C3AopEEfcpMSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcXJCyfusJ4un3LBjjbtYRSbRz0en1+gZi6KtbIid01V1QzTe7Q7xmRcq/8HMdtBIaqodmYDiwdHRK6vO023npoTJ3BU4jUAR+pG3z2VcVcR2GdCyqW4Y85ITu/n1tClwVRl4z8tXdiVvyazs2o6ZQXyT6wf40z33RW3TgHxxWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XPgSn8Di; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0BC82D77;
	Mon, 23 Jun 2025 15:42:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750686124;
	bh=Co65TiTS9Q9fFk3zQhoDANBVjWL264C3AopEEfcpMSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPgSn8DiIzbVcYeL3Sczq7Yfh6z7OGdlM+w7DBf864iBpJssbvVExCn2ASGiBvH0V
	 ey26Qih2Ar40/bQQOF5oxVKbHhaXPh/WFbVjFA8+0CFaTG/Mwv3/BI3xJUh69uYWBm
	 HGze8i3572IklaXG1bALeuIB9CD25OeX/26/0eiU=
Date: Mon, 23 Jun 2025 16:42:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Nirujogi, Pratap" <pnirujog@amd.com>, Hao Yao <hao.yao@intel.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com,
	king.li@amd.com, dantony@amd.com, vengutta@amd.com,
	dongcheng.yan@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <20250623134200.GB29597@pendragon.ideasonboard.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com>
 <20250623120929.GE826@pendragon.ideasonboard.com>
 <aFlU-E_GCHWBXErq@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFlU-E_GCHWBXErq@kekkonen.localdomain>

On Mon, Jun 23, 2025 at 01:22:00PM +0000, Sakari Ailus wrote:
> On Mon, Jun 23, 2025 at 03:09:29PM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 16, 2025 at 07:12:28PM -0400, Nirujogi, Pratap wrote:
> > > On 6/13/2025 6:02 PM, Sakari Ailus wrote:
> > > > On Fri, Jun 13, 2025 at 12:55:46PM +0800, Hao Yao wrote:
> > > >> Hi Pratap,
> > > >>
> > > >> Thanks for your patch.
> > > >>
> > > >> This patch is written for your camera sensor module, which seems very
> > > >> different from those already applied on Dell laptops (some of "Dell Pro"
> > > >> series). Looking into the driver, I think this version will break the
> > > >> devices using ov05c10 sensor.
> > > > 
> > > > There never was such a driver in upstream so nothing breaks. However, in
> > > > order to support these, could you check what would it take to support them
> > > > using this driver and post patches, please?
> > > > 
> > > >> I think this patch is better to be validated on existing devices, but please
> > > >> do some fixes before we can do validation. Please check my comments inline.
> > > >>
> > > >> On 2025/6/10 03:42, Pratap Nirujogi wrote:
> > > >>> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
> > > >>> supports only the full size normal 2888x1808@30fps 2-lane
> > > >>> sensor profile.
> > > >>>
> > > >>> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> > > >>> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> > > >>> Co-developed-by: Bin Du <bin.du@amd.com>
> > > >>> Signed-off-by: Bin Du <bin.du@amd.com>
> > > >>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > 
> > [snip]
> > 
> > > >> Hi Sakari,
> > > >>
> > > >> Seems there are already several camera sensors using page-based registers.
> > > >> Is it a good idea to add page support in CCI interface?
> > > > 
> > > > Sounds like a good idea as such but I'm not sure how common this really is,
> > > > I think I've seen a few Omnivision sensors doing this. If implemented, I
> > > > think it would be nice if the page could be encoded in the register address
> > > > which V4L2 CCI would store and switch page if needed only. This would
> > > > require serialising accesses, too. There's some room in CCI register raw
> > > > value space so this could be done without even changing that, say, with
> > > > 8-bit page and 8-bit register address.
> > > 
> > > Hi Sakari, thank you for sharing your insights and guiding us. Could you 
> > > please suggest if we should take up this work implementing the helpers 
> > > in CCI and submit the patch or is it okay to leave it as-is for now and 
> > > take care of updating in future once the implementation is ready.
> > 
> > I think it can live in the driver for now. Given that the device uses
> > only 8 bits of register address, I would store the page number in bits
> > 15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
> > available for driver-specific purpose.
> 
> I'd use the CCI private bits, the driver uses page numbers up to 4 so 4
> bits are plenty for that. If we add pages to CCI later, this may be
> refactored then.

That works too.

-- 
Regards,

Laurent Pinchart

