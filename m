Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB896407ED
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 14:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbiLBNte (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 08:49:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbiLBNtd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 08:49:33 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394DBCC64F;
        Fri,  2 Dec 2022 05:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669988972; x=1701524972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CUWdcG8n9HnxBTkZaf4yfU7TMpyIqvRrSQgpVT72TzU=;
  b=JkBn4WSqBFKeMbWOA6V5FeSO4FDhTLE3SPN6lGpbWYaYyjYCbusGiXCU
   P2ck2GZuRhX1vb0lsPS0chrhDWv6nIDcZnfjOflccTTH3HhXRjUPvMnjK
   ILClaCiED0KJxfZUxVN4QgyeUISK7WWJwhD7LieoLCLViZ+wyhDkmUrnv
   LT3oKnRGb1OTN/FGYCUbiqHLJIMe2Vr/ozOiDqhteDidZWkg657klO1e2
   TAyonmHWHtLuBj0PVSmYayAIzXtHOHpyi2ZxwMUg2ti1NeFkTS1WD/wtf
   1uwwrVN6T48u0YsTT9xHnF7CrGYvJUvwSdFKsYGymcpMoX27uX7L/AKZJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="317103294"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="317103294"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 05:49:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="622705191"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="622705191"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 05:49:27 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 712FF20363;
        Fri,  2 Dec 2022 15:49:24 +0200 (EET)
Date:   Fri, 2 Dec 2022 13:49:24 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Message-ID: <Y4oCZNGudw0BPYfn@paasikivi.fi.intel.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
 <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
 <fef2a014-1ef9-049a-2516-539ea14abdac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fef2a014-1ef9-049a-2516-539ea14abdac@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Nov 30, 2022 at 05:34:55PM +0100, Hans de Goede wrote:
> So it looks like that at least for x86/ACPI windows devices if the
> LED has its own GPIO the hardware description clearly counts that
> as part of the sensor's GPIOs. So the sensor driver has direct
> access to this, where as any v4l2 framework driver would needed
> to start poking inside the fwnode of the sensor which really
> isn't pretty.

Most of the common (e.g. camera sensor related) properties are parsed by
the V4L2 framework, not by drivers. I'm not saying no to having privacy-led
parsing in a single driver but instead of adding more of this in drivers we
should have a common solution for this.

-- 
Kind regards,

Sakari Ailus
