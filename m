Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 729B27D7687
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 23:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjJYVVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 17:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjJYVVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 17:21:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD48136
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 14:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698268889; x=1729804889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=agV1GNdGZuaGda+PPV0FKE7P8Q54HqhBi/J6+Jkjbb8=;
  b=bcdH1IMyp7rzUEzElOjLpCgmIWwZrOKqF1ECbyld7ZYvCPtpk1e9iNy/
   V5tRjrurZbbUTX6nAupGVGxuGIem9L/wD3qTvQ/5sNT/EM3BGSKijFZjn
   XET+4zEY/AH5ub8OcH81F409fNBJpl7OCsr/K2/yrIGI7ZfaG+20ftchf
   1tGU7aQ4ky82ozeIV+Afx32QNXdZ5gVCP8FUcjQXajxcriH9DDLoNrUqR
   CzYRwg5OyFaOOJEI/3F7cUDpVpdg2oEyuxEgYwgTXvnOHe50g4uTmYkpY
   8wF2rj9xTJ6He29AFCA+MMZfYlKFuA+rohihmQ/5GS13VgVZm6S9dbXmH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="184603"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="184603"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:21:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="849671790"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="849671790"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:21:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 68F6A11F758;
        Thu, 26 Oct 2023 00:13:04 +0300 (EEST)
Date:   Wed, 25 Oct 2023 21:13:04 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 20/28] media: uapi: v4l: subdev: Enable streams API
Message-ID: <ZTmE4C6bJyKhB2n2@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-11-sakari.ailus@linux.intel.com>
 <fb51323e-334b-414d-9b58-e9d82151a3b4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb51323e-334b-414d-9b58-e9d82151a3b4@ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Mon, Oct 09, 2023 at 03:52:27PM +0300, Tomi Valkeinen wrote:
> On 03/10/2023 15:08, Sakari Ailus wrote:
> > Remove v4l2_subdev_enable_streams_api variable that was used to easily
> > enable streams API for development, and conditions that use the variable.
> > 
> > This patch enables the streams API for V4L2 sub-device interface which
> > allows transporting multiple streams on a single MC link.
> 
> I wouldn't go there yet. Just in this series you break the API.

That was perfectly fine as it was done before this patch. ;-)

But more seriously, this patch does not necessarily need to be merged with
the rest of the set. There is also a possibility of merging it early in 6.7
without this patch, as the UAPI will remain disabled.

-- 
Terveisin,

Sakari Ailus
