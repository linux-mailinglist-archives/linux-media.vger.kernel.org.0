Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1CE76ED9B
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 17:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236839AbjHCPJS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 11:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236843AbjHCPJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 11:09:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBCB30D2
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 08:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691075355; x=1722611355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kI9H1yc/9bNpMN+HwGub69+Yqf0y768F1K3B2iJehKg=;
  b=cNaFZYRat5GisDqy3z6xzQrPzV8o/84A0O9Ca5zjcqKu3Fs6JOHVRpQh
   i65DutHxMuq3IJJhAAMw2po6ldquOvlSRiE5/69FUPJKyWcCbk+blupJE
   tGq+0LHE0facEDYV6gS9gbW4smMIXXi/t0FAgY8N2tqGCA6MhkhgWPBm5
   pDxTC+wMfRSpjqocq77bRVt8Z5A+6+20H7mzjp69BY7gtSP6nEA/IcX3I
   M43gGg2IU4WGjNyVhy1Ch71fVlS0Puwlxv0BR9gmMk8caYq4k8nqsLaJj
   4tyiGElXjvLMC/wA/tQS7A18wMWuPLtwuknfPMvBhHgj7h7AvHhqD68SE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="436222947"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="436222947"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 08:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872966055"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 08:07:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 19A4E1204CF;
        Thu,  3 Aug 2023 18:07:52 +0300 (EEST)
Date:   Thu, 3 Aug 2023 15:07:52 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 17/32] media: ov2680: Add support for ACPI enumeration
Message-ID: <ZMvCyGM8K0iH2egl@kekkonen.localdomain>
References: <20230803093348.15679-1-hdegoede@redhat.com>
 <20230803093348.15679-18-hdegoede@redhat.com>
 <ZMuoVeni2dSSM9xb@smile.fi.intel.com>
 <28263f7c-ae07-3d17-4c45-92af29c3144a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28263f7c-ae07-3d17-4c45-92af29c3144a@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Aug 03, 2023 at 04:57:24PM +0200, Hans de Goede wrote:
> Hi andy,
> 
> On 8/3/23 15:15, Andy Shevchenko wrote:
> > On Thu, Aug 03, 2023 at 11:33:32AM +0200, Hans de Goede wrote:
> >> Add an acpi_match_table now that all the other bits necessary for
> >> ACPI support are in place.
> > 
> >> The OVTI prefix used for the ACPI-HID is used for various OmniVision
> >> sensors on many generations x86 tablets and laptops.
> > 
> > "OVTI is the official ACPI vendor ID for OmniVision Technologies, Inc."
> 
> Is it though? Is there a list of official ACPI vendor IDs
> published somewhere were we can check this ?
> 
> I think the Intel MIPI camera driver team may have come up with
> the OVTI prefix independently ?
> 
> Just because it is used quite a lot does not mean that it is
> official ...

It is. Only ACPI and PNP vendor IDs allocated to vendors should be used
(and HIDs allocated by that vendor only).

<URL:https://uefi.org/acpi_id_list>
<URL:https://uefi.org/pnp_id_list>

-- 
Regards,

Sakari Ailus
