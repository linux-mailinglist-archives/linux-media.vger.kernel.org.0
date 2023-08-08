Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64107774141
	for <lists+linux-media@lfdr.de>; Tue,  8 Aug 2023 19:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbjHHRRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Aug 2023 13:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbjHHRQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Aug 2023 13:16:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3FD71F09
        for <linux-media@vger.kernel.org>; Tue,  8 Aug 2023 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691510815; x=1723046815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uPoyOSOm2Zy/FdrVa2oecLInzHO0RgRIPVRr1ylqz00=;
  b=ithZzL9CRLQ4YUe8/8i2xGcH67ftMa/2uNLSKFAaXJojIzMlgCbIHY6G
   EJa16pYoT0/6CdaN6eVAJTjrhspHjSfQBVjjd0i3KS+xeMtl/wKEipmz/
   nZ4RsnrV8ezcXRpIzr+2vDHR4eNTTkRqJUAIWJVbRweUbGS4hqgKddMDr
   QvN0VP1TwoUWy9f7S4bB9yp+cTx4+DIBG00U6G7WIIyBOWDu89bl5AH3Z
   +lueLN3Fg3Ugo0/X0jvBJAE9JPXhn+YGJLJr7Zf9ho82iZ58GPWRbaqpj
   FemGwTe50Ho1xNEggTv4Ia/QJSauFBq4QxI6z3eUtG8RZPGYdURYkwBXs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="351057333"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="351057333"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 01:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="734407482"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="734407482"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 01:16:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 8408E11FAE0;
        Tue,  8 Aug 2023 11:16:04 +0300 (EEST)
Date:   Tue, 8 Aug 2023 08:16:04 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 06/10] media: uapi: Add a macro to tell whether an
 mbus code is metadata
Message-ID: <ZNH5xAfIywcDHLlj@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-7-sakari.ailus@linux.intel.com>
 <e52c51b7-00f8-3df7-d079-579509bdc2ca@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e52c51b7-00f8-3df7-d079-579509bdc2ca@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 08, 2023 at 10:14:11AM +0200, Hans Verkuil wrote:
> On 08/08/2023 09:55, Sakari Ailus wrote:
> > Add a macro to tell whether a given mbus code is metadata.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/uapi/linux/media-bus-format.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > index 9ee031397372..2486b4178c5f 100644
> > --- a/include/uapi/linux/media-bus-format.h
> > +++ b/include/uapi/linux/media-bus-format.h
> > @@ -182,4 +182,7 @@
> >  #define MEDIA_BUS_FMT_META_20			0x8006
> >  #define MEDIA_BUS_FMT_META_24			0x8007
> >  
> > +#define MEDIA_BUS_FMT_IS_META(code)		\
> > +	((code) & 0xf000 == 0x7000 || (code) & 0xf000 == 0x8000)
> 
> I don't think this is right: == has a higher precedence than &, so this
> actually reads:
> 
> 	code & (0xf000 == 0x7000)

You're right, I'll fix this for v4.

-- 
Sakari Ailus
