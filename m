Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E7B7295B6
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 11:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241333AbjFIJoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 05:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241531AbjFIJnm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 05:43:42 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2EF7EC3
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686303501; x=1717839501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gr/Q9E7rK+F0fPRxkmSpVWpob5J8XIdJxR8sCM7FR5g=;
  b=Oq2hL9DFAxHu8R6agtBvVb/QUJDxoFaeRIOgKtU70S+FW0iHNospYfqo
   m4mwiI8MF/55YglrMRsPVxMfoPI3EB0+XDI55uLkXJrcsnRtCeTNs9o3r
   7SH7E3OBh5lQNPEQblX91EUaRvsbZnLZF4AxHm1rTHKLhs/9MOzon7xmf
   yUyzz9994/PoDIi37aqDeujQHF0knXjAdvFyabN72yWbdNljCuW6Liznk
   J5X1OcXJsHLd888uGJLHsIWoyuMAuEbT2sQaBJ8BJjlZc+PUY3tu6oshP
   KuCZDSVyxjFyVJkQaqnPW3mnBXkXa3Yo/lJ2A5T1iTzZlFGHDiDfzuSDA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="355051161"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="355051161"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 02:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="743420044"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="743420044"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 02:37:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 04C2D11F9D2;
        Fri,  9 Jun 2023 12:37:01 +0300 (EEST)
Date:   Fri, 9 Jun 2023 09:37:00 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 00/28] media: ov2680: Bugfixes + ACPI +
 selection(crop-tgt) API support
Message-ID: <ZILyvPcLNwBscZdk@kekkonen.localdomain>
References: <20230607164712.63579-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607164712.63579-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 07, 2023 at 06:46:44PM +0200, Hans de Goede wrote:
> Hi All,
> 
> During all the work done on the atomisp driver I have mostly been testing
> on devices with an ov2680 sensor. As such I have also done a lot of work
> on the atomisp-ov2680.c atomisp specific sensor driver.

Could you wrap the lines at or before 80 characters, unless there are
reason (generally other coding style rules) to keep them longer?

-- 
Kind regards,

Sakari Ailus
