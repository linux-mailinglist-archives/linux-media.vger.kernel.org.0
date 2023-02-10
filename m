Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9435691F0C
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 13:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbjBJM0k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 07:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjBJM0i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 07:26:38 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9047170CF2
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 04:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676031997; x=1707567997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AAW8CAxh3NospT4twb5krZ4kq1Oorn3Fo1t0adNhpqg=;
  b=fCT8s7HC5w+7slFyvgG5tt117z/D7IzK7QI62ShwOUwnHvli1MkIOUOm
   souqqtVzEbCs8GIqMKvI9iX/gYcteVgMRiKbv6/8/jQFQSfzmXDKKA4o9
   laBUiHBtkOqNrIXVyIiKUhP102WaBP/HXAd1Od2NhaX/Anws0B7wge8wE
   uS4k+oQoBZEKqSECgMGOLVarIDYDjrIL4xEW0N2CUhGsOmjkxG58sq1qe
   a5V2F0c5RY/OoC5RXwtlI8RaPIk8JGzHFzoDwuF5gnY85s1bd8h31xRQS
   RnH1zYY86rRCxrpf/DpXn5He8Uy3/R9u0EPGoCMVb2MumAhrPvQYSQjef
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="331711497"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="331711497"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 04:26:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="698410598"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="698410598"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 04:26:34 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 65E8B11F9EF;
        Fri, 10 Feb 2023 14:26:31 +0200 (EET)
Date:   Fri, 10 Feb 2023 14:26:31 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+Y39+IRyjwQi7Jr@kekkonen.localdomain>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Feb 10, 2023 at 01:45:10PM +0200, Laurent Pinchart wrote:
> Regarding the width-specific versions of the helpers, I really think
> encoding the size in the register macros is the best option. It makes
> life easier for driver authors (only one function to call, no need to
> think about the register width to pick the appropriate function in each
> call) and reviewers (same reason), without any drawback in my opinion.

As I noted previously, this works well for drivers that need to access
registers with multiple widths, which indeed applies to the vast majority
of camera sensor drivers, but not to e.g. flash or lens VCM drivers. Fixed
width registers are better served with a width-specific function. But these
can be always added later on.

-- 
Sakari Ailus
