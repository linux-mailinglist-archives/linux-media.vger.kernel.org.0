Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1FA6183A4
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 04:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfEICRG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 22:17:06 -0400
Received: from gate.crashing.org ([63.228.1.57]:57961 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbfEICRG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 May 2019 22:17:06 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x492Gja6014515;
        Wed, 8 May 2019 21:16:47 -0500
Message-ID: <b682cc6a480f2b8a5e14c5c001fa1927467d4e18.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/7] media: aspeed: fix a kernel warning on clk control
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
Date:   Thu, 09 May 2019 12:16:45 +1000
In-Reply-To: <3786afed-c34d-e3f0-4cd5-620185807091@linux.intel.com>
References: <20190502191317.29698-1-jae.hyun.yoo@linux.intel.com>
         <20190502191317.29698-2-jae.hyun.yoo@linux.intel.com>
         <1ec7397cb164b40877839bbc90f79b5942675fdb.camel@kernel.crashing.org>
         <6e93467e-1556-3cfd-b15c-c12b6907f526@linux.intel.com>
         <3b4269d829467870f0b6adac18089b93114fcd3c.camel@kernel.crashing.org>
         <3786afed-c34d-e3f0-4cd5-620185807091@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-05-08 at 18:19 -0700, Jae Hyun Yoo wrote:
> I changed that from a bool because the maintainer of this code, Eddie
> doesn't like adding of an additional flag. I'll change it back with
> codes in the first submit:
> https://www.spinics.net/lists/linux-media/msg148955.html
> 
> Eddie,
> Please let me know if you have any objection on that.

Ok, so random flags ... ugh.

Well, you can approach it either way. Have them all be bitops or all be
bool.

The tricky thing however is that if they are bitops you need to ensure
that they are *all* manipulated under the same lock. If not you have to
use the atomic bitops variants.

The reason I don't like that is that experience shows that most uses of
such atomic variants in drivers usually are failed attempts at papering
over broken locking.

If everything is covered by a lock, then using the non-atomic versions
is more efficient, but so is using bool (optionally with :1 bitfield
qualifiers to avoid wasting memory), which from a pure C language
perspective I think is more expressive of what you are doing and more
readable.

Cheers,
Ben.

