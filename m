Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E4A361C10
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 11:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240748AbhDPIrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 04:47:20 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:2250 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239471AbhDPIrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 04:47:20 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AZL/wmquxbTNGJ9gVaa3z1RQC7skCEoMji2hD?=
 =?us-ascii?q?6mlwRA09T+Wxncqjhele8BfyhioYVn1Io6HjBICraxrnmaJdy48XILukQU3CsG?=
 =?us-ascii?q?ynMIlt4eLZsljdMgf58fNQ0rolTrhmBLTLfCFHpOvz/QXQKbYd6fad9qTAv43j?=
 =?us-ascii?q?5lNMaS0vVK169Qd+DW+gYzVLbS1LH4AwGpbZxucvnUvCRV0tYs62BmYIUoH4zr?=
 =?us-ascii?q?WhqLvdfRUECxQ7gTPgsRqU6aX3GxXd/hASXyIn+9Yf2FXFiADw6+Gftei6wHbn?=
 =?us-ascii?q?uVP70pI+orbc4+oGIPbJq8AObh3wlw6jZe1aKtm/lQFwhNvq1XEHv53npQw6M8?=
 =?us-ascii?q?F69nXLF1vFxifF6k3c9HIH0TvN43m+rhLY0LfEbSN/D9BewYFUdhac7EY/ptRx?=
 =?us-ascii?q?zb9GxAuixuBqJAKFmj/86djOXwxrkUTxoWNKq590s0Bi?=
X-IronPort-AV: E=Sophos;i="5.82,226,1613430000"; 
   d="scan'208";a="503542453"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 10:46:54 +0200
Date:   Fri, 16 Apr 2021 10:46:54 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
In-Reply-To: <20210416083728.GL3@paasikivi.fi.intel.com>
Message-ID: <alpine.DEB.2.22.394.2104161045140.8503@hadrien>
References: <20210415170819.GA17534@focaruja> <20210415171409.GC2531743@casper.infradead.org> <20210415194955.GI3@paasikivi.fi.intel.com> <20210415195704.GE2531743@casper.infradead.org> <20210415195941.GF2531743@casper.infradead.org> <20210415212158.GK3@paasikivi.fi.intel.com>
 <20210416054941.GF6021@kadam> <20210416083728.GL3@paasikivi.fi.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > If you're running into the 80 character limit, then it's fine to use
> > two tabs.  I think we have been rejecting patches that push align the
> > parameters but push past the 80 character limit.  Using one tab is
> > confusing because it makes the decalarations line up with the code.
>
> Interesting. Do you have an example of this? I've thought checkpatch.pl
> gave a warning if the line ended with an opening parenthesis no matter
> what.

Checkpatch is a perl script that searches for patterns that often indicate
code that is hard to understand.  It is not a precise definition of what
is allowed in the Linux kernel.  Humans have to amke compromises.

julia
