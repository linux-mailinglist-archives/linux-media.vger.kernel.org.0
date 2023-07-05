Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C80AE7486B3
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 16:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbjGEOog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 10:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbjGEOob (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 10:44:31 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107611732
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 07:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688568262; x=1720104262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6hOqw1/fpqmmF1Ucef5hmych7rV7Z9wO/73ROloUc7k=;
  b=SVw2uykrWMDU3LYGkLs9hWZbRDoH/l6MRsez3LKtvKimMHIN5znv5wHf
   LaC0jw7dawbucS+qkiPz9PyxrbIqiPWrvwtKvcjLq2MBIZy9XSvT0AmYQ
   b7oAsmMjlpOeDjf6KgMyMUaHYIuRO4Kn0a1oo8S83FXznDhQbSqbH9mWg
   73y2wEUY7oSvW3yHcOkN3GSf66/HEi9TyYESOdzBnA9vSb1LRLhHKt9wR
   J844OWA3HMfXPuIq3Z5Dp4BvJcIl7FswBSnHXU0wV4BYinzqKk3DikQ7L
   A+Gqk2IEi0qXyrddVmmxTzt5SFmX/xB/dbRH04/hsY8ha+/2Vp/6eSO3c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="365929023"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="365929023"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 07:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="789189505"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="789189505"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 07:44:17 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id B48D211F931;
        Wed,  5 Jul 2023 17:36:08 +0300 (EEST)
Date:   Wed, 5 Jul 2023 14:36:08 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/2] media: ipu-bridge: add IVSC support
Message-ID: <ZKV/2Pm+dz23o8sQ@kekkonen.localdomain>
References: <20230630134506.109269-1-sakari.ailus@linux.intel.com>
 <20230630134506.109269-2-sakari.ailus@linux.intel.com>
 <ZJ8UtSP8q/hq8Xre@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJ8UtSP8q/hq8Xre@smile.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Fri, Jun 30, 2023 at 08:45:25PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 30, 2023 at 04:45:05PM +0300, Sakari Ailus wrote:
> > From: Wentong Wu <wentong.wu@intel.com>
> > 
> > Previously on ACPI platforms, sensors that are intended to be connected
> > to a IPU device for use with the ipu3-cio2 driver lacking the necessary
> > connection information in firmware. IPU bridge driver is to connect
> > sensors to IPU device via software nodes.
> > 
> > Currently IVSC located between IPU device and sensors is available in
> > existing commercial platforms from multiple OEMs. But the connection
> > information between them in firmware is also not enough to build V4L2
> > connection graph. This patch parses the connection properties from the
> > SSDB buffer in DSDT and build the connection using software nodes.
> > 
> > IVSC driver is based on MEI framework (previously known as HECI), it
> > has two MEI clients, MEI CSI and MEI ACE. Both clients are used to
> > communicate messages with IVSC firmware. Linux abstracts MEI client
> > as a device, whose bus type is MEI. And the device is addressed by a
> > GUID/UUID which is part of the device name of MEI client. After figured
> > out MEI CSI via the UUID composed device name, this patch setup the
> > connection between MEI CSI and IPU, and the connection between MEI CSI
> > and sensor via software nodes.
> > 
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > [Sakari Ailus: rebase on Hans de Goede's cleanups and fixes]
> 
> I believe we use past tense in these comment lines...

No objections, I'll add the missing "d" while applying if there are no
other comments.

> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 

-- 
Regards,

Sakari Ailus
