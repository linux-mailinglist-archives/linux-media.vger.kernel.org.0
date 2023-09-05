Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 048CF792549
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 18:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbjIEQBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 12:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354300AbjIEKh7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Sep 2023 06:37:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B2C199
        for <linux-media@vger.kernel.org>; Tue,  5 Sep 2023 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693910276; x=1725446276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bCNUggdWx1PJeaIl+1eBpOhj/1atfAAhdHrR5yR/FFM=;
  b=WoePA/hbxbCI6jxJJBbLH4u57W0n6SVPY8cojl6cU1vbOec9jVm4E993
   r3rblfR9SyOEOSp0GDVLGhKQb2UA0b6ynCvbrTR8sKB0N1OOevSoFMvmm
   cSIbCnPyiyMZXEit6M+C22+fSd7yGNiU5nJR4fY7dTo+D9naA+Ums3wc7
   z6rtO0/T/kWtf6GVZYUWEAvsV3lcuBOaZ6sKO4waa4vvJqPsYMmX48Bmi
   f8xQXxNlrJdMSf3L4JPpn1/zSYfQjfAYPRy9Jgm4syTtIPTAAdBtBHuim
   18b2ZhXEqsfNsF+UGnpajO8YpOBUg4Mcf22WVB/otGahxHF752mcCtFEV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="375654474"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="375654474"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 03:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="811183963"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="811183963"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 03:37:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1138511FC2C;
        Tue,  5 Sep 2023 13:37:45 +0300 (EEST)
Date:   Tue, 5 Sep 2023 10:37:45 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 06/10] media: uapi: Add a macro to tell whether an
 mbus code is metadata
Message-ID: <ZPcE+b3EYWM8G8vE@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-7-sakari.ailus@linux.intel.com>
 <98069c4c-d2fd-9117-08cd-eb595df77d4a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98069c4c-d2fd-9117-08cd-eb595df77d4a@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Tue, Sep 05, 2023 at 12:47:21PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 08/08/2023 10:55, Sakari Ailus wrote:
> > Add a macro to tell whether a given mbus code is metadata.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   include/uapi/linux/media-bus-format.h | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > index 9ee031397372..2486b4178c5f 100644
> > --- a/include/uapi/linux/media-bus-format.h
> > +++ b/include/uapi/linux/media-bus-format.h
> > @@ -182,4 +182,7 @@
> >   #define MEDIA_BUS_FMT_META_20			0x8006
> >   #define MEDIA_BUS_FMT_META_24			0x8007
> > +#define MEDIA_BUS_FMT_IS_META(code)		\
> > +	((code) & 0xf000 == 0x7000 || (code) & 0xf000 == 0x8000)
> > +
> >   #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> 
> mbus code seems to be u32, so the above won't work. Maybe:
> 
> (((code) & ~0xfffULL) == 0x7000 || ((code) & ~0xfffULL) == 0x8000)
> 
> Also, embedded formats with 0x9nnn codes are added later in the series.

Thanks, I'll address these for v4.

-- 
Sakari Ailus
