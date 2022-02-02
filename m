Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B054A709E
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 13:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344103AbiBBMV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 07:21:58 -0500
Received: from mga07.intel.com ([134.134.136.100]:24704 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239210AbiBBMV6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Feb 2022 07:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643804518; x=1675340518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MVF7cM3mfG5/WMfNYN8fuXcbSIKTcBPK/EDtaQwMCrI=;
  b=A1azzjQbQ4lXQ4JfXZeBGn4zsLbi0w03d9wu2FHW8Llu0ULG1hlJVM6j
   jKnoC7nvZmLQ8G/nTq5UoFkKcferPqcNkBXeBU6yZJPer3krMKAREab4w
   k1FzrLaf3DSVlf0Zq8k9ZBSo8HMXLGSha5HIiFMwTCRxgbZ27+CBKAcrM
   KgXSsSx/oIjbMswDiead1gSo9KCoRxAtJ64Bed8MGaKf3cGlj14+vhBQW
   82QZMnXqEqOuayAsWicRsvFUL8I44P0/UW/ncWWZBL00dLshBnOjJ2IrC
   syEfzr5Z1CG43Jg2Pm+8W84n/gWXOEbVowdfJ9EH74yBZ7/3mEYE+KpUI
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="311212211"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; 
   d="scan'208";a="311212211"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 04:21:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; 
   d="scan'208";a="482809000"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 04:21:56 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 117AF20139;
        Wed,  2 Feb 2022 14:21:54 +0200 (EET)
Date:   Wed, 2 Feb 2022 14:21:54 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com,
        kevin.lhopital@bootlin.com
Subject: Re: [PATCH] media: i2c: Fix regulator disable balance in ov8865
Message-ID: <Yfp3YpPto0o+uP3l@paasikivi.fi.intel.com>
References: <20220130213621.70780-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130213621.70780-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Sun, Jan 30, 2022 at 09:36:21PM +0000, Daniel Scally wrote:
> ov8865_sensor_power() disables all three of the sensor's regulators
> on the error path, however not all of the regulators may have been
> enabled at the time of the error, which will result in unbalanced
> disable calls.
> 
> Fix the issue by adding specific error paths for each regulator.
> 
> Fixes: 11c0d8fdccc5 ("media: i2c: Add support for the OV8865 image sensor")
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Thanks for the patch.

This has been already fixed by commit
cbe0b3af73bf72fad197756f026084404e2bcdc7 (in media tree).

-- 
Kind regards,

Sakari Ailus
