Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9894336B05D
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 11:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhDZJTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 05:19:41 -0400
Received: from mga09.intel.com ([134.134.136.24]:55092 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232078AbhDZJTl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 05:19:41 -0400
IronPort-SDR: icjYzmBBcoVQtAz/wSZAwhYq+SssR1qroyqlmaWC0Hkh+ctUsFvd/IMf11Fh7MfqJQAa5GgetA
 rGpNu3ugKVpQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="196417474"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="196417474"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 02:18:59 -0700
IronPort-SDR: gUc7e3gkI8Fyv0bXaNY1wSQeG2wcpR4s1OBErdbZZRNtUf088ofFUROUULEAZ3mHmbwcgZQ8tU
 YMeuNiiax4+w==
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="615320703"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 02:18:57 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 2EAEB203BC;
        Mon, 26 Apr 2021 12:18:55 +0300 (EEST)
Date:   Mon, 26 Apr 2021 12:18:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v3] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
Message-ID: <20210426091855.GT3@paasikivi.fi.intel.com>
References: <20210421123718.GA4597@focaruja>
 <20210421131522.GI3596236@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421131522.GI3596236@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 02:15:22PM +0100, Matthew Wilcox wrote:
> On Wed, Apr 21, 2021 at 09:37:18AM -0300, Aline Santana Cordeiro wrote:
> > -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> > -    u32 mbus_code);
> > +const struct atomisp_format_bridge *
> > +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
> 
> As I said, better to break the 80 column rule than do this.

May depend on the maintainer, as well as other reviewers. It's a question
of priorities.

I'd suggest otherwise.

-- 
Sakari Ailus
