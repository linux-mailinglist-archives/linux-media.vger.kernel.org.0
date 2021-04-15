Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECA6361316
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 21:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234735AbhDOTu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 15:50:27 -0400
Received: from mga01.intel.com ([192.55.52.88]:45948 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234226AbhDOTu1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 15:50:27 -0400
IronPort-SDR: 9aP6hx3k2so9/1ZM64hC/+m+pYuoRJ4i3LYCQ60Gcj2gojk5z+WiCGbgzofEbh8kWESzO5rd0C
 8bjGeRp2vNNg==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="215442161"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="215442161"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 12:49:59 -0700
IronPort-SDR: eOU2zCcD3J55/9SE1uLBp57qUwy3FyckoLw/AMgywqjXcLADDBre4t1KbW/NcFUjDBDpz43G9S
 YC2gJK2tk/1Q==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; 
   d="scan'208";a="533244995"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 12:49:57 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 911F1200E8;
        Thu, 15 Apr 2021 22:49:55 +0300 (EEST)
Date:   Thu, 15 Apr 2021 22:49:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210415194955.GI3@paasikivi.fi.intel.com>
References: <20210415170819.GA17534@focaruja>
 <20210415171409.GC2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415171409.GC2531743@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 15, 2021 at 06:14:09PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 15, 2021 at 02:08:19PM -0300, Aline Santana Cordeiro wrote:
> > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > -    u32 mbus_code);
> > +const struct atomisp_format_bridge*
> > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> 
> No, this does not match coding style.  Probably best to break the
> 80-column guideline in this instance.  Best would be to have a function

Having the return type on the previous line is perfectly fine. There should
be a space before the asterisk though.

-- 
Sakari Ailus
