Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325DA4E48F7
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 23:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiCVWOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 18:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiCVWOe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 18:14:34 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6735713CEA
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 15:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647987185; x=1679523185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dio9S14HigEoXc9XrqnRqhBLcSLvaRLBAtcIz31J4mE=;
  b=b49RNUA/f4nuk2j6gIXNCtNIfNAjTCEShmS5K7Vik1xBUc94A1IdJrA4
   +Ccjc83/denTFjXXG4uzb5tLIbLF6X2OnopimaPwpfhV+pHODIw6kbIeR
   ycbystZQn4yuPPgnu8ahMaFwKfYs6o2nlz41q43pV6+FbbdBzDt7FESCV
   +KGjx7ND/OL1DSGG9UlXgfbwp1xRFtZrR2ZjQyB1R5pcj+0OQZFfX3ZJz
   cTzjtCOgs4scCv4lRIMCh0+A0rnTmIR2jbjCAJsCNA4/HmV6B2as5bMBh
   q6AAogo2s/tngzNsnYEEGvs9w4CULz3Tb3lyInGJmO1ZZLxR45uIpYHXQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="282803209"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="282803209"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 15:13:03 -0700
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; 
   d="scan'208";a="500770269"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 15:13:01 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E03E620287;
        Wed, 23 Mar 2022 00:12:58 +0200 (EET)
Date:   Wed, 23 Mar 2022 00:12:58 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        laurent.pinchart@ideasonboard.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH v3 0/5] Introduce ancillary links
Message-ID: <YjpJ6vFs1nZSsKN0@paasikivi.fi.intel.com>
References: <20220302220304.1327896-1-djrscally@gmail.com>
 <664edc45-d624-4cdd-57b4-e38f48493e29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <664edc45-d624-4cdd-57b4-e38f48493e29@gmail.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Mar 22, 2022 at 10:08:07PM +0000, Daniel Scally wrote:
> Hello everyone
> 
> 
> Any more comments on this series?

I hope people are happy with them. They've been out for review for quite
some time.

The patches are in my tree waiting for having rc1 in master.

-- 
Kind regards,

Sakari Ailus
