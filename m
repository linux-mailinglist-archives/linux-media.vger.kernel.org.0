Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C95F4E549E
	for <lists+linux-media@lfdr.de>; Wed, 23 Mar 2022 15:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244902AbiCWOzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Mar 2022 10:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiCWOzj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Mar 2022 10:55:39 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B15813F6C;
        Wed, 23 Mar 2022 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648047250; x=1679583250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rSlpVK8+R01VAXYRit0qcvSrSRsMZS+hlQozzAGKVDA=;
  b=EycwbQ9/HAATSsFlhvUcZ3ndnZhUyWKoqPQ1rjuS0s8Tq7i3NqIReljl
   Gkw1QdLPP0GxLEebwo2YMYHQQqMZoaf1BxOykROHQ1A9GNROTqUOa/Zxv
   wJJcA/N64miv8fS2eXg5nZBfXvVTrD+2O3IJ/ywN9b3y8GTRNjkthvL6/
   FvUFtOv4lHhy85N3veuxaTt02AInVx95AttF1GqYoq/315fjTDpK8gr8k
   dI91Pac+V+ywT7uzVlLna8m4IRAjPlC8h6U+GvVbxgRXiiJCV46zPXrzR
   6ZK3cxZJ324tqPaBYcFqfytvbSLoiU7fDECCiU5eWvuj3UEhZ+ZygAHf9
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="238069627"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="238069627"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 07:54:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; 
   d="scan'208";a="544222466"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2022 07:54:08 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 388572012F;
        Wed, 23 Mar 2022 16:54:06 +0200 (EET)
Date:   Wed, 23 Mar 2022 16:54:06 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Convert Dongwoon dw9807-vcm bindings to
 json-schema
Message-ID: <Yjs0jjNMeqVl2HPj@paasikivi.fi.intel.com>
References: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
 <20220318165119.12191-2-sakari.ailus@linux.intel.com>
 <035a1501-4a40-2f1a-2220-1a35a4419876@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <035a1501-4a40-2f1a-2220-1a35a4419876@kernel.org>
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Sun, Mar 20, 2022 at 12:56:48PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2022 17:51, Sakari Ailus wrote:
> > +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9807-vcm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Dongwoon Anatech DW9807 voice coil lens driver
> > +
> > +maintainers:
> > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > +
> > +description: |
> > +  DW9807 is a 10-bit DAC with current sink capability. It is intended for
> > +  controlling voice coil lenses.
> > +
> > +properties:
> > +
> 
> No blank line.
> 
> > +  compatible:
> > +    const: "dongwoon,dw9807-vcm"
> 
> No quotes.

Hmm. Strings generally need to be quoted, including the compatible
strings.

I'll remove the extra blank lines.

-- 
Sakari Ailus
