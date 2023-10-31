Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459357DD1B6
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 17:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346555AbjJaQeo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 12:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346687AbjJaQeF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 12:34:05 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796BB1BCF;
        Tue, 31 Oct 2023 09:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698769946; x=1730305946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SAVUUSy6kEq+VaAk+hGdPRfOn1rye2cEo6cJ7P/cJ4A=;
  b=GPMB20yuZylvzt4o/x+pzUgHbVNn8NySAwxBhoUgJxev10vH678C/bSJ
   1XsJIVBbyu9EZNvub8kIWOxJi/iJGKDUXgFB5qtJU3dyKC2o4F5bj0uAa
   qFgyP/mSvheVBnQbOyhuSUEGDLGEQ7uFCJFOkCCFHw3fDBFtQMC18g43Y
   UXaJQ+18S/+f/5xmv/1v7cnlqeDhumbk0PQhUWw9mMHX5OSmFC9iF6GIs
   vPxghSIcmbolfLh7eCJzSTqIvYKo1XK2nXyEe555YLuBMMzkwk1vRqcS1
   cyNOiJLFjMt94UbiuZ0L55ltiJA5ioJPZ0CI04XcxW23E/r+RxlhkS1y7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1172522"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="1172522"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 09:32:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851293283"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="851293283"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 09:32:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qxrf8-0000000ACil-13uQ;
        Tue, 31 Oct 2023 18:32:18 +0200
Date:   Tue, 31 Oct 2023 18:32:17 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
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
Message-ID: <ZUEsEQQTTlXmOHPt@smile.fi.intel.com>
References: <20231031135306.1106640-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031135306.1106640-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 31, 2023 at 03:53:06PM +0200, Sakari Ailus wrote:
> Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> on fwnode property API. The same convention of ending the comparison at
> '@' (besides '\0') is applied on also both ACPI and swnode. The function
> is intended for comparing unit address-less node names on DT and firmware
> or swnodes compliant with DT bindings.

Some comments below.

...

> Would you be able to use this to replace of_node_name_eq()?

Can you point out to the use case? Maybe it can be rewritten using existing
APIs?

...

> +	len = strchrnul(node_name, '@') - node_name;

> +	return strlen(name) == len && !strncmp(node_name, name, len);

Seems like this is reimplementation of str_has_prefix().

	len = strchrnul(node_name, '@') - node_name;
	return str_has_prefix(node_name, name) == len;

-- 
With Best Regards,
Andy Shevchenko


