Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A82937DD484
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 18:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjJaRTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 13:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345030AbjJaRTa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 13:19:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9819F;
        Tue, 31 Oct 2023 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698772768; x=1730308768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ynm4tfHqWXPDrSI6ig6/UG85d5Tsv2T74eFACMZiyBE=;
  b=gXVbIHDT8ZcPws7fE6CwHhRm/UAPs+xBK1W15JAz/PXrBt2D9yF5Wg80
   m/a2dpQW0yWCSr7str+YN86eAYdDKKrINKmDfQdo/rjt9KArdLZ/BtxN9
   k0GH+GFcc3+qFsMCd++kzz+rUgOzsbgBrTp0lcSGm6NzUh+O2ksM+/LGy
   MYy3MooQN7zYxIW620y9vpGuDoX3yxbs4hYUkFGCQi/1KXhkOskvP7y8p
   8umyccxlaiEOnNB90149O63VX3bG8aDxOovokqpBEa0+DhfRP9fM+Jwyz
   4PWgmBsbLFwp7oP2DAO06xT3i+PmzCEFsi6a13RgBwssF49nit4g2wVtq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="387221365"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="387221365"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 10:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="831116769"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="831116769"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 10:19:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 59FAA11F894;
        Tue, 31 Oct 2023 19:19:09 +0200 (EET)
Date:   Tue, 31 Oct 2023 17:19:09 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-acpi@vger.kernel.org, linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUE3Dbq2p8JZGeE1@kekkonen.localdomain>
References: <20231031135306.1106640-1-sakari.ailus@linux.intel.com>
 <ZUEsEQQTTlXmOHPt@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUEsEQQTTlXmOHPt@smile.fi.intel.com>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Tue, Oct 31, 2023 at 06:32:17PM +0200, Andy Shevchenko wrote:
> On Tue, Oct 31, 2023 at 03:53:06PM +0200, Sakari Ailus wrote:
> > Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> > on fwnode property API. The same convention of ending the comparison at
> > '@' (besides '\0') is applied on also both ACPI and swnode. The function
> > is intended for comparing unit address-less node names on DT and firmware
> > or swnodes compliant with DT bindings.
> 
> Some comments below.
> 
> ...
> 
> > Would you be able to use this to replace of_node_name_eq()?
> 
> Can you point out to the use case? Maybe it can be rewritten using existing
> APIs?

Parsing DT for THine THP7321 ISP:
<URL:https://lore.kernel.org/linux-media/20231030133247.11243-1-laurent.pinchart@ideasonboard.com/T/#t>.

The driver shouldn't be bothered with separating the node name from the
unit address (separated by '@').

> 
> ...
> 
> > +	len = strchrnul(node_name, '@') - node_name;
> 
> > +	return strlen(name) == len && !strncmp(node_name, name, len);
> 
> Seems like this is reimplementation of str_has_prefix().
> 
> 	len = strchrnul(node_name, '@') - node_name;
> 	return str_has_prefix(node_name, name) == len;

I'll use this in v2.

-- 
Regards,

Sakari Ailus
