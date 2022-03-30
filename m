Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E15194EBC11
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 09:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243762AbiC3Ht6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 03:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241281AbiC3Htz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 03:49:55 -0400
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B362BBD;
        Wed, 30 Mar 2022 00:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648626489; x=1680162489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZIirvbpAZGNjlWxo9inQGprpHFqDnNYQaZfbjKFpXZM=;
  b=SDDXsrnKzQVVFmWOWTMqiyDKDlCtEEOZmzrSAjyR5I6hTISUZBKd7lY0
   xgo5LmpDtSkeq7V4gS5yDF3LhQB2n6b0wGbpXxfx2SokK9RbJwHTKThQ7
   /C+z60KixNRs6ngYd3dX+LOwsb/inWSxdCtSxt3ChRmj8AtrW+2uUaVSo
   eRAoHFcsdAIrUmxArbVdOdp8RJJwCefSdx1iYBMCuZVfdxD0rNtOJyItQ
   thKvP5OY+zwdsyj9VCQsp341gwdlxCKIIs7SlmpoakQQHWgHQHh78A9VV
   2FsW9n1pJ9xPEhVOVXpYpWTySBCzgPAJoXWIyTI5MvdiKJxg2KYwIkKEF
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="320175568"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="320175568"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 00:48:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="519559958"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 00:48:07 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6986820365;
        Wed, 30 Mar 2022 10:48:05 +0300 (EEST)
Date:   Wed, 30 Mar 2022 10:48:05 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: Convert Dongwoon dw9807-vcm bindings
 to json-schema
Message-ID: <YkQLNeQ3oKIJfWar@paasikivi.fi.intel.com>
References: <20220330073341.588550-1-sakari.ailus@linux.intel.com>
 <20220330073341.588550-2-sakari.ailus@linux.intel.com>
 <a79e9ec2-d522-cd08-3947-60a29a702547@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a79e9ec2-d522-cd08-3947-60a29a702547@linaro.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 30, 2022 at 09:42:03AM +0200, Krzysztof Kozlowski wrote:
> On 30/03/2022 09:33, Sakari Ailus wrote:
> > Convert the old text based dw9807-vcm chip DT bindings to json-schema.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/i2c/dongwoon,dw9807-vcm.txt         |  9 ----
> >  .../media/i2c/dongwoon,dw9807-vcm.yaml        | 41 +++++++++++++++++++
> >  2 files changed, 41 insertions(+), 9 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
> > 
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!

-- 
Sakari Ailus
