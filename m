Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4790C6FAFDE
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 14:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbjEHMY0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 08:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234133AbjEHMYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 08:24:15 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90153610C
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 05:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683548654; x=1715084654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=otUFpG1LZ/vCHxZLMds1TUz2Uvh9sI4kOmOh51F9tCQ=;
  b=nM4VQCgf3NBFzIYkHTUtzu60zCKZka93r0S660FIKglxMtWgyKaNwGl1
   rCZgSXaXBSXWiEEpaCsB3U5oknrLFJauEnbFgLud1/J/jwzY8BZ1ZVmeg
   IdzM4Fc8N59wann5C7F8CzzFm4kkEY3oTN0fY80/FixkdZS0qipzlflDJ
   tPHPLuihFjtr/vepr7pOekq/l4Ledu2w7VTHfCzRfUwnF3E0mW91w5V/5
   akH44L5HApNG6RwsH3Ix1FBast3CM1vEpZCPqv4eEYBYTCHNT9OsqKidF
   mHUkr8uDCUGgVV1RdPoO40P+uhLT4nsRp11QJgurFRb1fGCD52kiHO6aM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="377721724"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="377721724"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 05:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="822651801"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="822651801"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 05:24:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 247B41203DA;
        Mon,  8 May 2023 15:24:10 +0300 (EEST)
Date:   Mon, 8 May 2023 15:24:10 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [RFC 2/7] media: v4l: subdev: Support INTERNAL_SOURCE pads in
 routing IOCTLs
Message-ID: <ZFjp6jtJk4WIeXCx@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-3-sakari.ailus@linux.intel.com>
 <691a9d35-218f-4eef-ddb0-5834f1e222c8@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <691a9d35-218f-4eef-ddb0-5834f1e222c8@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Mon, May 08, 2023 at 01:14:07PM +0300, Tomi Valkeinen wrote:
> On 06/05/2023 00:52, Sakari Ailus wrote:
> > Take the new INTERNAL_SOURCE pad flag into account in validating routing
> > IOCTL argument. Effectively this is a SINK pad in this respect. Due to the
> > union there's no need to check for the particular name.
> 
> What union? The one you add in the next patch?

Oops. I think we can reorder the patches.

> 
> As a concept the internal source pads sound good, and they work in practice
> in my tests. But this union is what grates me a bit. We have a flag,
> MEDIA_PAD_FL_INTERNAL_SOURCE, which tells which field of the union to use,
> and then we go and do not use the new union field. Well, and also the
> naming, as we normally have source and sink pads, but now we also have
> internal source pads, which are actually identical to sink pads...

The union still should be used by the user space. We're testing flags here
and those flags are the same independently of the INTERNAL_SOURCE flag.

I'm fine by not adding that union though, but for the user space I think
it's better we have it: explaining that the sink_pad has a different
meaning if that flag is set is harder than making it a union member.

> 
> I understand the idea and reasoning, but the two points above do confuse me
> and I'm sure would confuse others also.
> 
> I wonder if it would be less or more confusing to simplify this by just
> adding a MEDIA_PAD_FL_INTERNAL, which could be applied to either a source or
> a sink pad, and would prevent linking to it. The flag would indicate that
> the stream from/to that pad is generated/consumed internally. (I don't know
> when you would need an internal pad to consume data, but... who knows, the
> need might pop up =).

This is another option. But I envision there will be more compatibility
issues. Although... generally using such hardware requires knowledge of the
device, and we haven't obviously had any support for devices needing this
functionality in the tree. So in the end it might not matter much.

> 
> That would mean that an "internal sink pad" would generate a data stream,
> i.e. it's a "source", but I think a normal sink pad is almost the same
> anyway: when considering entity's internal routing, the normal sink pad is a
> "source", and the same logic would apply with the internal pads too.
> 
> An internal sink pad that generates a stream is a bit more confusing than an
> internal source pad, but I think that confusion is less than the rest of the
> confusion in the code-side that comes with the internal source pads.

I prefer having the possible sources of the confusion in the framework than
in the drivers. Therefore I think INTERNAL_SOURCE flag is a (slightly)
better option.

I wonder what Llaurent thinks.

-- 
Kind regards,

Sakari Ailus
