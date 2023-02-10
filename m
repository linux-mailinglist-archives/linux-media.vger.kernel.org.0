Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1439C691FA8
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 14:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbjBJNSs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 08:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbjBJNSr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 08:18:47 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5738956EF8
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 05:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676035127; x=1707571127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VVzHEiLMA9mnKXFENefJxvaonbt8ej/mKgkvRRdF0WY=;
  b=dFKYV4pCrpddAZqHeJj+2eK2frN71F23YhArlrmIYgEtpmy8dfeZx2Xu
   HPy5sDisYEc4Li8ZI54R4ZPkBPeQMfRtHYsZ9gxN3Rm3rxvnI8d9zw57L
   hgtlFYIQ0FYtFT+bz10cNF6VLuEtmiB36QZDPy4SLhkmb1KpCCtpfgzeb
   WfqcszEsXKY6SgbKjfFGtcqZ2HkqDLnVOI9bJM7vLe5iphbepnjNg/4st
   VPG317J1gSjZcXTfN6GyubNs7AaAovr5sGwDHvF6MnTEJGJ3SXiOeN4nK
   26wu5KdtCmeauLm3+HM5Hu852vyBV00m4GY7n5QRgEQQUxRTj+d+cs3/l
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="328105820"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="328105820"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 05:18:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="810817244"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="810817244"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 05:18:44 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C793311F9EF;
        Fri, 10 Feb 2023 15:18:41 +0200 (EET)
Date:   Fri, 10 Feb 2023 15:18:41 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+ZEMTJZcbPAj+yk@kekkonen.localdomain>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <026272d3-88d7-a67f-4942-5cba6c3eab86@redhat.com>
 <Y+UbIAVQZ5U0/U5U@pendragon.ideasonboard.com>
 <4e501e71-a226-a022-83e2-f53686ca07a7@redhat.com>
 <Y+YuRuHbs8kDZPNP@pendragon.ideasonboard.com>
 <3be27a04-21e5-5929-88a1-0159f554a36f@redhat.com>
 <Y+Yz3qPY3aiJ+bYZ@pendragon.ideasonboard.com>
 <30181cf6-7dc8-d75c-5d7a-93f483d4f045@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30181cf6-7dc8-d75c-5d7a-93f483d4f045@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Feb 10, 2023 at 01:47:49PM +0100, Hans de Goede wrote:
> > And if someone dislikes having to pass NULL for the last argument, we
> > could use some macro magic to accept both the 3 arguments and 4
> > arguments variants.
> > 
> > int __cci_write3(struct cci *cci, u32 reg, u32 val);
> > int __cci_write4(struct cci *cci, u32 reg, u32 val, int *err);
> > 
> > #define __cci_write(_1, _2, _3, _4, NAME, ...) NAME
> > #define cci_write(...) __cci_write(__VA_ARGS__, __cci_write4, __cci_write3)(__VA_ARGS__)
> 
> TBH this just feels like code obfuscation to me and it is also going
> to write havoc with various smarted code-editors / IDEs which give
> proptype info to the user while typing the function name.
> 
> Having the extra ", NULL" there in calls which don't use / need
> the *err thingie really is not a big deal IMHO.

It's still an eyesore if the driver doesn't use that pattern of register
access error handling. I also prioritise source code itself rather than try
to make it fit for a particular editor (which is neither Emacs nor Vim I
suppose?).

My preference is to provide an interface that best suits a driver's needs,
whatever that is. There are just a couple of common patterns and the one above
is one of the rare ones.

-- 
Regards,

Sakari Ailus
