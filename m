Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFDC7E2195
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjKFMcD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbjKFMcC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:32:02 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B7CAB;
        Mon,  6 Nov 2023 04:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699273920; x=1730809920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=trKSJFRQ56/vfO4ua26lccDk+qC8F3ce04ec6I2TXcQ=;
  b=k44E0JPgZhHqp69RYmTd+pRUMUwr4/FPNBEfC+RmH3Y4Dadtq9Z+DZpH
   Voemr/eJwycwbOQUNJ6ZGNoo5hqWL6zA9VVaoJ/Prp5/BSMcM/3LR0NHN
   B3oeqFGFxHVPZKbzRVAQMiCVP6u4K03U4J6Wl/EuhQo5XaP+vcK+itPQB
   1VBmE03LZSCtSFYmRslpsQuZO0BLbtejTSfy946EOxLTmU7tQ+r4g+fIv
   029eMYcmywUf4fSZZSpWUEAaBmT78eil9i9RSVJpvOshCHrxXlU/GX0lC
   lwg8uLbY0Dpa47e42m4LtqPGw33YQkkMYu8uCgEP2isVoSAmLFTrBBwAW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2173673"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="2173673"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:31:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="852985262"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="852985262"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:31:55 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 53FB511F724;
        Mon,  6 Nov 2023 14:31:53 +0200 (EET)
Date:   Mon, 6 Nov 2023 12:31:53 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-acpi@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org,
        Paul Elder <paul.elder@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Julien Stephan <jstephan@baylibre.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        rafael@kernel.org
Subject: Re: [RESEND PATCH v4 1/1] device property: Add fwnode_name_eq()
Message-ID: <ZUjcuc52NRudNola@kekkonen.localdomain>
References: <20231106073141.1250344-1-sakari.ailus@linux.intel.com>
 <2023110623-alongside-credible-833d@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023110623-alongside-credible-833d@gregkh>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 06, 2023 at 09:45:45AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 06, 2023 at 09:31:41AM +0200, Sakari Ailus wrote:
> > Add fwnode_name_eq() to implement the functionality of of_node_name_eq()
> > on fwnode property API. The same convention of ending the comparison at
> > '@' (besides NUL) is applied on also both ACPI and swnode. The function
> > is intended for comparing unit address-less node names on DT and firmware
> > or swnodes compliant with DT bindings.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> > ---
> > Hi Greg,
> > 
> > Could we merge this via the media tree?
> 
> For 6.8-rc1?  Sure, feel free to:
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Yes, 6.8-rc1 is the target. Thanks!

-- 
Sakari Ailus
