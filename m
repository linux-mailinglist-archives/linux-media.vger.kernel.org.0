Return-Path: <linux-media+bounces-12-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D66867E7ECA
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BFD21C20D42
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33C83AC14;
	Fri, 10 Nov 2023 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OOswyY12"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0D138FA3
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:33 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBE53977B
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 06:44:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91D4549E;
	Fri, 10 Nov 2023 15:44:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699627455;
	bh=6pXXqK67gvPVu6FLyPdFz2/7vjQPU3wwIhLpiTO8ZkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OOswyY12iL3EivfltYccPJDU7gHI1TEpRe5QSw21Lt4Yfs74TD5f/Pi/RS65iFJGM
	 k4mqOLDIMmdnkF6lo+2FXpd0AYi5RXof9yjDsDBAXvo4Zf/hqMtbHNsvDWmAsMMs9v
	 LcY8rxsRzVc0pNNL1C6cJVINaz3Gwo6sCHbjiaco=
Date: Fri, 10 Nov 2023 16:44:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/6] media: v4l: cci: Add macros to obtain register width
Message-ID: <20231110144445.GC21167@pendragon.ideasonboard.com>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-4-sakari.ailus@linux.intel.com>
 <553265e2-a57a-4f70-9254-f140348ed1e8@redhat.com>
 <ZU4RWhxbJyG-2lR2@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZU4RWhxbJyG-2lR2@kekkonen.localdomain>

On Fri, Nov 10, 2023 at 11:17:46AM +0000, Sakari Ailus wrote:
> Hi Hans,
> 
> Thank you for the review.
> 
> On Fri, Nov 10, 2023 at 12:14:10PM +0100, Hans de Goede wrote:
> > Hi,
> > 
> > On 11/10/23 10:47, Sakari Ailus wrote:
> > > Add CCI_REG_WIDTH() macro to obtain register width in bits and similarly,
> > > CCI_REG_WIDTH_BYTES() to obtain it in bytes.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  include/media/v4l2-cci.h | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> > > index b4ce0a46092c..80eaa7fdc606 100644
> > > --- a/include/media/v4l2-cci.h
> > > +++ b/include/media/v4l2-cci.h
> > > @@ -40,6 +40,9 @@ struct cci_reg_sequence {
> > >  #define CCI_REG_FLAG_PRIVATE_END	31U
> > >  #define CCI_REG_PRIVATE_MASK		GENMASK(CCI_REG_FLAG_PRIVATE_END, CCI_REG_FLAG_PRIVATE_START)
> > >  
> > > +#define CCI_REG_WIDTH_BYTES(x)		(((x) & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT)
> > 
> > Please use FIELD_GET like v4l2-cci.c does:
> > 
> > #define CCI_REG_WIDTH_BYTES(x)		FIELD_GET(CCI_REG_WIDTH_MASK, (x))
> > 
> > With that fixed:
> > 
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > As for the patch 4 - 6, those are interesting patches but
> > I'm afraid I don't have time to review them.
> 
> No worries, I mainly included them to have a user for the newly added
> features.
> 
> I'll send v2 with FIELD_GET().

With FIELD_GET(),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart

