Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8717A3610D8
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 19:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234020AbhDORPA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 13:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbhDORO7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 13:14:59 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2539DC061574;
        Thu, 15 Apr 2021 10:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=USIt7kQju8YFJVq4Oq/9MfaoCKu4uLeI8t4U8FPhcmk=; b=bT3jy1Cxw3z/cEHs8tgvzwL3u5
        7wRsbvatgfLKvp+ni8I1+1LRiWSNDU6dpwMNk3YCaMDJpWlh6fK70Fl8MByC9hNDlD502a2Acf552
        qk+x2nkMAB5vl5CGsHU0t3yP6d9YTqTIrM4W/39a6qMxDEApmSyE9SNokr8vrufuQseacbVFtFJgV
        KLsZywHDDAAstkbh1g9qc32ne7wmwEmJ35+CbkNyJLwPuMbgDQOiGKk6n0tndBvQMEVQvcY5Myw/M
        Cac9ti3V/K2BYBIIXbz7J+7YzlTPEAoebb0A1F6p60CEa7PWdjm/qjJk6inVbDxuIX0JPbeHJ//XX
        d56scmVg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lX5ZB-008rHM-US; Thu, 15 Apr 2021 17:14:12 +0000
Date:   Thu, 15 Apr 2021 18:14:09 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210415171409.GC2531743@casper.infradead.org>
References: <20210415170819.GA17534@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415170819.GA17534@focaruja>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> -    u32 mbus_code);
> +const struct atomisp_format_bridge*
> +get_atomisp_format_bridge_from_mbus(u32 mbus_code);

No, this does not match coding style.  Probably best to break the
80-column guideline in this instance.  Best would be to have a function
and/or struct name that isn't so ridiculously long, but that would
require some in-depth thinking.

> -void atomisp_apply_css_parameters(
> -    struct atomisp_sub_device *asd,
> -    struct atomisp_css_params *css_param);
> +void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
> +				  struct atomisp_css_params *css_param);
> +

Good.

