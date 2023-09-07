Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADEC797733
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 18:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239213AbjIGQWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 12:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbjIGQVx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 12:21:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D1C83CD
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 09:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694103555; x=1725639555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vWEbdfUC940jfuUbXjd7GRFwrs53F6qa7vAnQCbligU=;
  b=aay4OaX8b6+dKaUz06UlB3CKW7mcrUb4wPCxaAzhJGdZJVzUOkwGjgWL
   w1oDBBhmyHq3GhwhELtmZIE5mxZBUNpWCfPsz5LTK0qjaO5nnb4sSFl6A
   rwMcHqy1zPTrDeI2pSLqjYrX0rPyVE7f12+QJ+xL2WpKZs4MtYDv6xbuY
   W9VmBhQLTaYadh+Yl1jd+dtYtitwdlONYIpMLS/usKmCVnEqMoqDP9H+I
   0CMBMM+JmGoz905LgWAXrg16unLDtCV13q/rfuzyVIToPfX5e4MJpevFu
   M9LmDZKerA+N7PqvI2B5E4uSJ1xR+cylJaRSHlzdzbxJd4jKSt61wnPnG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="441299440"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="441299440"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 02:49:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="988699370"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="988699370"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 02:49:04 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 5649211F9DF;
        Thu,  7 Sep 2023 12:49:01 +0300 (EEST)
Date:   Thu, 7 Sep 2023 09:49:01 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 07/10] media: uapi: Add generic 8-bit metadata format
 definitions
Message-ID: <ZPmcjchJx+3p0rCW@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-8-sakari.ailus@linux.intel.com>
 <20230905165558.GD7971@pendragon.ideasonboard.com>
 <ZPho//Cib9DtXx0o@kekkonen.localdomain>
 <ZPmLm1QyK4gbrHPx@kekkonen.localdomain>
 <20230907084712.GB25940@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907084712.GB25940@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Sep 07, 2023 at 11:47:12AM +0300, Laurent Pinchart wrote:
> > > > > +V4L2_META_FMT_GENERIC_8
> > > > > +-----------------------
> > > > > +
> > > > > +The V4L2_META_FMT_GENERIC_8 format is a plain 8-bit metadata format.
> > > > > +
> > > > > +This format is also used on CSI-2 on both 8 bits per sample as well as on
> > > > 
> > > > s/also on/by/
> > > > 
> > > > I would also mention "MIPI CCS" instead of "CSI-2".
> > > 
> > > If CCS were to be mentioned here, then all uses of this format should be
> > > included as well.
> > > 
> > > > > +16 bits per sample when two bytes of metadata are packed into one sample.
> > > > 
> > > > "bits per sample" is very ill-defined for metadata, as there's no
> > > > sample. I would write "for both the RAW8 packing and the 2 bytes RAW16
> > > > packing" or something similar.
> > > > 
> > > > Similar comments for below.
> > > 
> > > From CSI-2 bus point of view there's no difference between pixel and
> > > embedded data when it comes to encoding that data. "Sample" is the next
> > > best term beyond "pixel", as the bus can carry samples that may or may not
> > > be pixel data. But I'm fine with changing the wording if you think it makes
> > > it more understandable.
> > 
> > I'll use "data unit" in v4.
> 
> Please define the term :-)

To the glossary, how about this:

    Data unit

	Unit of data transported by a bus. On parallel buses, this is
	called a sample while on serial buses the data unit is logical. If
	the data unit is image data, it may also be called a pixel.

-- 
Sakari Ailus
