Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12257C5D98
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 21:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233282AbjJKTWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 15:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233122AbjJKTWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 15:22:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1498F
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697052159; x=1728588159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s/YbXaNamq+rWf7fKwQjXFLDTlPiFqWE2ML8OHFDMhU=;
  b=OwyveTmoVsf9J4rerug+B1VNKD+Ms2KiwM11ljGxYr6fh/fgzPMHW07T
   MPZaBvLfAqXcH6/gyJUkw6P09iA5tAdI0nkYVsBm7aAwC1aUmQcEjfyb2
   h0BU6Z32HxGio0uiGhZVmS+vz3ktZuc7d0syznAKbdKzb/VZVES/uhb9t
   7tExMzKU99jvphZX0RdPrMBXhcN0oug3D6DAWs7LwUvRtmPG0jKb98gPr
   uWef8H+imohdCXV8BICfSZBunfnx4pAhlRMfrHSwwklM17bp50/QuLTJA
   T8ZhcoRZ78djDRHTCeA8y/7ADWpakObACV+SDrE6IU0vQ4ZSOl87o3mIO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364116280"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="364116280"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 12:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="877803895"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="877803895"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 12:22:36 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0926E11F7FB;
        Wed, 11 Oct 2023 22:22:33 +0300 (EEST)
Date:   Wed, 11 Oct 2023 19:22:32 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 01/28] media: mc: Add INTERNAL pad flag
Message-ID: <ZSb1+Kir10JIAfUk@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-2-sakari.ailus@linux.intel.com>
 <ee3b59fb-796c-4e38-bc19-575eab4872c1@xs4all.nl>
 <ZR6Ocg+Nm+r1ldy+@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR6Ocg+Nm+r1ldy+@kekkonen.localdomain>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 05, 2023 at 10:22:42AM +0000, Sakari Ailus wrote:
> > Note that "media pipeline" isn't defined either. Should that be added?
> 
> I can add that, too...

Instead I'll remove it altogether: it's not needed here.

-- 
Sakari Ailus
