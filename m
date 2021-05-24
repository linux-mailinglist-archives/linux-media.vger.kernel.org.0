Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC03B38F2FD
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 20:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233528AbhEXSaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 14:30:25 -0400
Received: from mga12.intel.com ([192.55.52.136]:1309 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232709AbhEXSaZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 14:30:25 -0400
IronPort-SDR: IKp8tjvFqVrN/y+JSdrbhku6GaxoNaCt1On57ZJ8w8kdwFr8/V2wS4WffvEBbex/oLzQOUM0Cm
 lnJ4UvGyNNVA==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="181639320"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="181639320"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 11:28:55 -0700
IronPort-SDR: xb0JZcsaIncRDSCIKA0BzvLhrQZgKW46F5371pNdkTp5DIdtSSqUf80AGvDJXz7jvjLch3vJ1p
 CtkITH4RDCWg==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; 
   d="scan'208";a="442158558"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 11:28:53 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6E841202F7;
        Mon, 24 May 2021 21:28:51 +0300 (EEST)
Date:   Mon, 24 May 2021 21:28:51 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Aniket Bhattacharyea <aniketmail669@gmail.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: Fix whitespace at the beginning of
 line
Message-ID: <20210524182851.GR3@paasikivi.fi.intel.com>
References: <20210524173609.672153-1-aniketmail669@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524173609.672153-1-aniketmail669@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 24, 2021 at 11:06:09PM +0530, Aniket Bhattacharyea wrote:
> This patch fixes whitespace at the beginning of line by wrapping after
> the type name and aligning the arguments with the open parenthesis.
> Identified by checkpatch: WARNING: please, no spaces at the start of a 
> line.
> 
> Signed-off-by: Aniket Bhattacharyea <aniketmail669@gmail.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
