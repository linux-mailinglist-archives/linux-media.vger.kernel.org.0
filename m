Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B311709101
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 09:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbjESHvH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 03:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjESHuj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 03:50:39 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD7C26BD
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684482564; x=1716018564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YlL5Ub5WeL3Gpe+p6yFzkHFAJKOvPdEUF24qlnfIOV0=;
  b=Cw6tCnitVmP8BXzEJfzKAHxt+bx1o/8iL+3pUvweOJUHrnmbkJS8g/Wr
   kHry6LUM5N4DmeGgWqD24kJZ9D0qiQC2llC0ZeZMI3yBhDBP4C6+l4Em3
   I1vK28gmDe9bbDoWePVuTn9QsUTNPq3uZImxjCsc+58r4eIzUL/DkfkVH
   uNFUsrt1Zbz3X6LFh/1ws8rMecaYUuu/6T2V8unnOSeIW4IH1w1vzu4E+
   0vuDJkSrqbAQo7mn9nVvsCU4HMZRc8LCzHP71/3NDbTlGefEWen0FCley
   Kg8FYSfbgfKRS8F5atvJjzFTKGJyWkSgL3wOK5jtRl1eswZSU7v+9PPMj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="349823659"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="349823659"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 00:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="696609756"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="696609756"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 00:47:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DAB7C120279;
        Fri, 19 May 2023 10:47:36 +0300 (EEST)
Date:   Fri, 19 May 2023 07:47:36 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-subdev: Fix missing kerneldoc for client_caps
Message-ID: <ZGcpmH7eHUQKcpXR@kekkonen.localdomain>
References: <20230418105924.126608-1-tomi.valkeinen@ideasonboard.com>
 <20230518094131.7d5057b7@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230518094131.7d5057b7@sal.lan>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, May 18, 2023 at 09:41:31AM +0100, Mauro Carvalho Chehab wrote:
> Em Tue, 18 Apr 2023 13:59:24 +0300
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> escreveu:
> 
> > Add missing kernel doc for the new 'client_caps' field in struct
> > v4l2_subdev_fh.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  include/media/v4l2-subdev.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index cfd19e72d0fc..9d0a6a993fb0 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -1119,6 +1119,7 @@ struct v4l2_subdev {
> >   * @vfh: pointer to &struct v4l2_fh
> >   * @state: pointer to &struct v4l2_subdev_state
> >   * @owner: module pointer to the owner of this file handle
> > + * @client_caps: bitmask of V4L2_SUBDEV_CLIENT_CAP_*
> 
> Did you actually check this patch? Adding an asterisk at the end
> should hit a Sphinx warning, as asterisk is the italic markup.
> So, it seems to me that this patch is actually replacing one warning
> by another one!

I don't get a warning with this patch. Also the documentation is rendered
correctly. Which sphinx version do you have?

$ sphinx-build --version
sphinx-build 3.4.3

-- 
Sakari Ailus
