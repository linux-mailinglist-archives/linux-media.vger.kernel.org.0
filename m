Return-Path: <linux-media+bounces-9091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F07688A0BCE
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 11:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A69D9287309
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 09:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17487142629;
	Thu, 11 Apr 2024 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIKnMzsf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01011411FE
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 09:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712826295; cv=none; b=hMa74CLFyaF94UawbzDkhVpnz/bk/JCSb7xjZrLbJSyQeCiXng65HRnjF+2L+/gYAD8LMZtDb7Lm06pkTn7MaiMi7E5Ctw8N3IwglGz7grAGteeUx84WXGMh1ZDfvIo3VGOuHjDZ6w4Stf30zxk1Tn90dQsF/PcCpLmf1BCv9eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712826295; c=relaxed/simple;
	bh=L3CH/MJi6uZAy/iehzOKgtTd3sp4886S0cuIYsAfJQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qg3g/WveO9ryifBLa1nCSxXDLbvtCT5K8JtOQiwK2RslEd5fB0In7v4355Y0Oe2K6DmD/lmTz07bOBDRFhwe2nBdGdAMAAObFCyWUjPp8HNqefVatq8rXzpYFeKYJ+HSgBV8TrQ4S5F/MSKTXXkoJyU+T7rMIKpKBlL5DEwaprc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIKnMzsf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712826293; x=1744362293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L3CH/MJi6uZAy/iehzOKgtTd3sp4886S0cuIYsAfJQs=;
  b=gIKnMzsf1hPK7EfJIS9ZPWdTGld65ehXalORYdbVRb5IMGlLddXAQe2F
   o7T4QAqgG7LdPr/rH570NWDcsUDbxOeQ96iu7yvRwzQCkK9qmwMb1/ge3
   y3wpSv9LlekIkVU3FDlryNZJB7LPx/TDKMEINkG+wAMcDEBNX5wwlAOGX
   hfJB31ZKGKeKKXBNQIj4+jbxSOAib6XXjdtV6Xs9w+mV94Z5C+kfQSwCZ
   +a3pjGMJFMZk3+z6VNRNXf9d4XQkEn5n0vTFJSJnPn4YmUh5JsEVNOGZY
   3ZAW7o4uFMylqGjLfPwNyHlT26Lnv6q2K52i1CSgh/+TAcMqWZe8m8/I+
   A==;
X-CSE-ConnectionGUID: xUup3cokQzWg82L0XQe0vQ==
X-CSE-MsgGUID: BOzGKX/LQX+fiubVhIskxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18828731"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="18828731"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:04:52 -0700
X-CSE-ConnectionGUID: u8/fETgTRR2eAlNf1jUcYQ==
X-CSE-MsgGUID: zEotTEqRSRCUbVroBowwNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25485671"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:04:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BA69F12035C;
	Thu, 11 Apr 2024 12:04:47 +0300 (EEST)
Date: Thu, 11 Apr 2024 09:04:47 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 23/38] media: uapi: ccs: Add media bus code for MIPI
 CCS embedded data
Message-ID: <Zhenr8ykPs9vlkh6@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-24-sakari.ailus@linux.intel.com>
 <20240321164914.GD9582@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321164914.GD9582@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Mar 21, 2024 at 06:49:14PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:25:01AM +0200, Sakari Ailus wrote:
> > Add new MIPI CCS embedded data media bus code
> > (MEDIA_BUS_FMT_CCS_EMBEDDED).
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/subdev-formats.rst              | 28 +++++++++++++++++++
> >  include/uapi/linux/media-bus-format.h         |  3 ++
> >  2 files changed, 31 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index cbd475f7cae9..c8f982411e70 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -8564,3 +8564,31 @@ and finally the bit number in subscript. "X" indicates a padding bit.
> >        - X
> >        - X
> >        - X
> > +
> > +.. _MEDIA-BUS-FMT-CCS-EMBEDDED:
> > +
> > +MIPI CCS Embedded Data Formats
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
> > +metadata format for sensor embedded data, which is used to store the register
> > +configuration used for capturing a given frame. The format is defined in the CCS
> > +specification. The media bus code for this format is
> > +``MEDIA_BUS_FMT_CCS_EMBEDDED``.
> > +
> > +The CCS embedded data format definition includes three levels:
> > +
> > +1. Padding within CSI-2 bus :ref:`Data unit <media-glossary-data-unit>` as
> 
> s/Data unit/Data Unit/

Yes.

> 
> > +   documented in the MIPI CCS specification.
> > +
> > +2. The tagged data format as documented in the MIPI CCS specification.
> > +
> > +3. Register addresses and register documentation as documented in the MIPI CCS
> > +   specification.
> > +
> > +The format definition shall be used only by devices that fulfill all three
> > +levels above.
> 
> Hmmmm... Do we need to mandate level 3 ? There are lots of sensors that
> comply with the first two levels but have their own register set. Would
> you like a sensor-specific embedded data format for each of them ? If
> so, how would we document it without essentially copying the datasheet ?

You could refer to the datasheet if it's publicly available.

The CCS static data format is meaningful only for accessing (level 1) and
parsing (level 2) the data without knowing its meaning, which is the most
important aspect. The user space will need to know the meaning of the data
and can additionally select the same data unpacker than for CCS and
possibly also the CCS data parser if applicable.

The user space should especially not have to have a list of CCS-compliant
sensors which would become necessary, should we skip on the 3rd level
requirement here.

> 
> > +
> > +This mbus code are only used for "2-byte simplified tagged data format" (code
> > +0xa) but their use may be extended further in the future, to cover other CCS
> > +embedded data format codes.
> > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > index d4c1d991014b..03f7e9ab517b 100644
> > --- a/include/uapi/linux/media-bus-format.h
> > +++ b/include/uapi/linux/media-bus-format.h
> > @@ -183,4 +183,7 @@
> >  #define MEDIA_BUS_FMT_META_20			0x8006
> >  #define MEDIA_BUS_FMT_META_24			0x8007
> >  
> > +/* Specific metadata formats. Next is 0x9002. */
> > +#define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
> > +
> >  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> 

-- 
Regards,

Sakari Ailus

