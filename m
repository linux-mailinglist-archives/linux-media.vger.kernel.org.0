Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039A22EC167
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 17:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbhAFQqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 11:46:32 -0500
Received: from netrider.rowland.org ([192.131.102.5]:43353 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727271AbhAFQqc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 11:46:32 -0500
Received: (qmail 1012897 invoked by uid 1000); 6 Jan 2021 11:45:50 -0500
Date:   Wed, 6 Jan 2021 11:45:50 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Antoine Jacquet <royale@zerezo.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: zr364xx: fix memory leaks in probe()
Message-ID: <20210106164550.GB1012582@rowland.harvard.edu>
References: <X/WMfVDCsxRghKHH@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/WMfVDCsxRghKHH@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 06, 2021 at 01:10:05PM +0300, Dan Carpenter wrote:
> Syzbot discovered that the probe error handling doesn't clean up the
> resources allocated in zr364xx_board_init().  There are several
> related bugs in this code so I have re-written the error handling.

Dan:

I recently sent in a patch for a similar problem in the gspca driver
(commit e469d0b09a19 "media: gspca: Fix memory leak in probe").  It
seems there may be similar issues in that driver: one single function
call tries to undo an indeterminate number of initializations.

I don't know enough about these subsystems to evaluate this.  Can you
take a look at it?

Thank,

Alan Stern
