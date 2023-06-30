Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39B207437EA
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 11:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbjF3JHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 05:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbjF3JHW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 05:07:22 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5AB135A0
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 02:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688116040; x=1719652040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vyokOc/7YRY1Cp1rJjMyk0eGmVgqO9pTkKNcDm7sEpI=;
  b=UYVswPEOBher/3vN+xbx8bwBYVLk5ucSvFO0c8w14vsF1Ff4biT/00aA
   1JA6j012NsuJf9NgEkdBJqWE7vYd+Aha4Cq1YWWl1wmIEz97b4RHKp+D9
   jSbBs4N47TR0gnQk4yKhech2aUir2xivSzaX1coy00L/xKfZ46ObqtmvQ
   F2u7DpN7puEyp9t6NBXOH5gBux9XBAQlj0ucaO2pEKOA40/2jhM0Nsc0C
   gKjsdk57FT5yluZy4fon2yNyjPCtwSyTt7pe/1mxCmn7h3OqMGytGsf3t
   TLE/2KtQMvm9M23DGXuNtOA9pnlSms+J2qDCKrGxwX4ZzK0J9AlvlRwf4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="428393704"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="428393704"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 02:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="752931515"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="752931515"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 02:07:17 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0744011F90E;
        Fri, 30 Jun 2023 12:07:15 +0300 (EEST)
Date:   Fri, 30 Jun 2023 09:07:14 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 00/12] media: intel-cio2-bridge: Add shared
 intel-cio2-bridge code, rework VCM instantiation
Message-ID: <ZJ6bQs37MwT/m20z@kekkonen.localdomain>
References: <20230627175643.114778-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627175643.114778-1-hdegoede@redhat.com>
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

On Tue, Jun 27, 2023 at 07:56:30PM +0200, Hans de Goede wrote:
> Hi All,
> 
> While working on adding (proper) VCM support to the atomisp code
> I found myself copying yet more code from
> drivers/media/pci/intel/ipu3/cio2-bridge.c into the atomisp code.
> 
> So I decided that it really was time to factor out the common code
> (most of the code) from intel/ipu3/cio2-bridge.c into its own
> helper library and then share it between the atomisp and IPU3 code.
> 
> This will hopefully also be useful for the ongoing work to upstream
> IPU6 input system support which also needs this functionality and
> currently contains a 3th copy of this code in the out of tree driver.
> 
> This set consists of the following parts:

Thanks for the set.

It's indeed being renamed. Wentong wrote a patch to add IVSC support, it
should go in after these.

-- 
Regards,

Sakari Ailus
