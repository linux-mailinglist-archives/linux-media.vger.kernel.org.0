Return-Path: <linux-media+bounces-21-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C120B7E7EDF
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 463BFB219A1
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BDA3B785;
	Fri, 10 Nov 2023 17:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGZNWtA/"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3383AC23
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550FA2E5D5
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 03:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699615071; x=1731151071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2/kJhVEJkbisT+xjYVitPpQBRx2iZ2glzyHll88ROlc=;
  b=MGZNWtA/6qKm7oG7dTFXgYTiFJ1Tc0k9oD/OKt/Fh3skNUIqoywn7tTg
   1CXDBEb+G/OcnS/zpC+bYt1PPS+cb7KG4VtPcssClpcMCGs9soomotE3C
   LPlw2x/o/+EScAbkhNdqVmDqFbhtZIGRMnjqYiK62dIWEsc1yvenuDsBs
   A9Ppg4jMZZr08vLdL/2Uym13McfHIknNwvEgErxOI5ab4lqLS5A8ZRQkY
   O0Hn+xC/81SAT1G+vVqUlDqbxXD8sOy1rmbgFJuPVA5S+5thn9WZvx2pS
   QgauMwP8Yewxr8IkdKHjOWhRbfcNw9Yi3SRuO5hTw0oWFqhqktcPx3W/W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="387333461"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="387333461"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 03:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792839367"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="792839367"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 03:17:49 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8CA7611F7D1;
	Fri, 10 Nov 2023 13:17:46 +0200 (EET)
Date: Fri, 10 Nov 2023 11:17:46 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 3/6] media: v4l: cci: Add macros to obtain register width
Message-ID: <ZU4RWhxbJyG-2lR2@kekkonen.localdomain>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-4-sakari.ailus@linux.intel.com>
 <553265e2-a57a-4f70-9254-f140348ed1e8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <553265e2-a57a-4f70-9254-f140348ed1e8@redhat.com>

Hi Hans,

Thank you for the review.

On Fri, Nov 10, 2023 at 12:14:10PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 11/10/23 10:47, Sakari Ailus wrote:
> > Add CCI_REG_WIDTH() macro to obtain register width in bits and similarly,
> > CCI_REG_WIDTH_BYTES() to obtain it in bytes.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-cci.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> > index b4ce0a46092c..80eaa7fdc606 100644
> > --- a/include/media/v4l2-cci.h
> > +++ b/include/media/v4l2-cci.h
> > @@ -40,6 +40,9 @@ struct cci_reg_sequence {
> >  #define CCI_REG_FLAG_PRIVATE_END	31U
> >  #define CCI_REG_PRIVATE_MASK		GENMASK(CCI_REG_FLAG_PRIVATE_END, CCI_REG_FLAG_PRIVATE_START)
> >  
> > +#define CCI_REG_WIDTH_BYTES(x)		(((x) & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT)
> 
> Please use FIELD_GET like v4l2-cci.c does:
> 
> #define CCI_REG_WIDTH_BYTES(x)		FIELD_GET(CCI_REG_WIDTH_MASK, (x))
> 
> With that fixed:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> As for the patch 4 - 6, those are interesting patches but
> I'm afraid I don't have time to review them.

No worries, I mainly included them to have a user for the newly added
features.

I'll send v2 with FIELD_GET().

-- 
Regards,

Sakari Ailus

