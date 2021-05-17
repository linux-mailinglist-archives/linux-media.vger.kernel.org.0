Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55EF1382CE8
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 15:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237259AbhEQNKx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 09:10:53 -0400
Received: from verein.lst.de ([213.95.11.211]:57455 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237251AbhEQNKw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 09:10:52 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id E0E7967373; Mon, 17 May 2021 15:08:52 +0200 (CEST)
Date:   Mon, 17 May 2021 15:08:52 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Christoph Hellwig <hch@lst.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: remove compat_ioctl32 code
Message-ID: <20210517130852.GA18985@lst.de>
References: <20210516204818.2967910-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516204818.2967910-1-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, May 16, 2021 at 10:47:43PM +0200, Arnd Bergmann wrote:
> This is one of the last remaining users of compat_alloc_user_space()
> and copy_in_user(), which are in the process of getting removed.

Are you also going to resend the other compat_alloc_user_space removal
patches?  It would be great to see it buried ASAP.
