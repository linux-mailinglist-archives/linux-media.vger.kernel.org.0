Return-Path: <linux-media+bounces-750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A4F7F3FAA
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3AE51C20B6B
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 08:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD9F21109;
	Wed, 22 Nov 2023 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAlHcKef"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C620718E;
	Wed, 22 Nov 2023 00:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700640440; x=1732176440;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=HzCmIqjiD/db2OVbbJ6fw6PB9pWnFmcUdmjHwNUjwaw=;
  b=OAlHcKef/5awVohSEwnbUzrwn8UiUXJaV+oOQgkLCc5wIazlg/a3TCBy
   Jw027fPq+iqzo7N3VPjSd7b3hJYx/bKE8qjFZHckSoZmC9SakW7+lePWe
   hLU9BXbg2GfeSvHya+6ht/Np70eIo0D5yI4NKyqlRUSWZHT/7y990X+Ne
   GNjmSymw6MWgFEjEG/Us0szn5Xjzc539Pqya16z3kwiK0tbXOU1ER2cm/
   915R1xl0G4Xx9D/PaX/KELD5/RUe6TuSKfizIdoyFCydOmjTKYV4Zkr80
   sji4P7dr69tgYanjtujn4oxkNvtKmRbquSj0JqDWYjgwwHNY7gZm22Vpq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="478214281"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="478214281"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 00:07:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="832934951"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="832934951"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 00:07:16 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 110AF1202B6;
	Wed, 22 Nov 2023 10:07:14 +0200 (EET)
Date: Wed, 22 Nov 2023 08:07:14 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] Add support for DCMIPP camera interface of
 STMicroelectronics STM32 SoC series
Message-ID: <ZV22srRYwqKf3eKs@kekkonen.localdomain>
References: <20231120170809.728941-1-alain.volmat@foss.st.com>
 <ZVvNMPfW7OhPByZk@kekkonen.localdomain>
 <20231122074404.GA787777@gnbcxd0016.gnb.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122074404.GA787777@gnbcxd0016.gnb.st.com>

Hi Alain,

On Wed, Nov 22, 2023 at 08:44:04AM +0100, Alain Volmat wrote:
> Hi Sakari,
> 
> On Mon, Nov 20, 2023 at 09:18:40PM +0000, Sakari Ailus wrote:
> > Hi Alain,
> > 
> > On Mon, Nov 20, 2023 at 06:07:56PM +0100, Alain Volmat wrote:
> > > This patchset introduces support for Digital Camera Memory Interface
> > > Pixel Processor (DCMIPP) of STMicroelectronics STM32 SoC series.
> > > 
> > > This initial support implements a single capture pipe
> > > allowing RGB565, YUV, Y, RAW8 and JPEG capture with
> > > frame skipping, prescaling and cropping.
> > > 
> > > DCMIPP is exposed through 3 subdevices:
> > > - dcmipp_dump_parallel: parallel interface handling
> > > - dcmipp_dump_postproc: frame skipping, prescaling and cropping control
> > > - dcmipp_dump_capture: video device capture node
> > > 
> > > v7:
> > >   - correct byteproc set_fmt handling and compose/crop/fmt handling
> > >   - replace few v4l2_subdev_get_try_* into v4l2_subdev_get_pad_*
> > 
> > Can you rebase this on my my linuxtv.org tree master branch
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/log/>?
> > 
> > These will be called v4l2_subdev_state_get_* now.
> 
> Ok, serie v8 is now rebased on top of the master branch of your tree.
> I'm going to push the rebased gc2145 sensor driver as well in a moment.

Thanks. Hans said he's going to merge the API change later this week (Mauro
might do that earlier), I'll take these then.

-- 
Regards,

Sakari Ailus

