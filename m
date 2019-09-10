Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72F68AE88E
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 12:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732573AbfIJKm5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 06:42:57 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39259 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729308AbfIJKm5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 06:42:57 -0400
Received: from [IPv6:2001:420:44c1:2577:9dde:3063:4dc7:2a88] ([IPv6:2001:420:44c1:2577:9dde:3063:4dc7:2a88])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 7dbniVrTy9b7T7dbrii3hs; Tue, 10 Sep 2019 12:42:55 +0200
Subject: Re: [Patch 00/13] media: am437x-vpfe: overdue maintenance
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190909162743.30114-1-bparrot@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5b73285c-5d05-1799-06fc-f4ab84cb9a1d@xs4all.nl>
Date:   Tue, 10 Sep 2019 12:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909162743.30114-1-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDgLUEHVN+RKov8OWXK1F7XNGT12EkJNiYeymJivzCZcZuFob/plBzrX/mPgK47XVhOZy64hbgWTJSXRZXg53bsDL2o24RyqG6Yk5/bKNtsBxMPfo7lf
 6Y+6E9PCVDB74klKgCifSzdihMf4RSAKZuVrvrpZyZ6M5enTvN1rpiivxHtqdvR4HbGZfUJSozQGB0h6r/fqV4wpFbb8IMFmENSV9czometSb2ird2gjTPN8
 ULjQA2TVpldqO/OaNYq37mUO7HXKqfxx49Xe3hASQEYcPyc/pr1qS6rc6+D/0c3Exh0ZoHGwcsXffW9RzuglCcXXvhexe5ywDmOySNcx67yXuWUr6RUgGNMX
 dDYcgO1NXn9hwaUqDoNOc9FZ3McMA4pjti1dCJjC70VflsSdpSEPUHPpDE9R4MLLInQji2HJB5H/1BYnGEhc+78FZjjdWA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

On 9/9/19 6:27 PM, Benoit Parrot wrote:
> This patch series is a collection of patches we have been carrying for a
> while.
> 
> A few patches do fix actual bug and v4l2-compliance errors/warnings.
> Other are drivers re-work to simplify/clarify the code for easier
> maintenance.

Can you post the output of the latest version of v4l2-compliance? Use
the '-s' option so streaming is tested as well.

Thanks!

	Hans

> 
> We also include the SPDX Licensing update which seemed to have been
> missed by the global script thus far.
> 
> Benoit Parrot (12):
>   media: am437x-vpfe: Fix missing first line
>   media: am437x-vpfe: Rework ISR routine for clarity
>   media: am437x-vpfe: Wait for end of frame before tear-down
>   media: am437x-vpfe: Streamlined vb2 buffer cleanup
>   media: am437x-vpfe: Setting STD to current value is not an error
>   media: am437x-vpfe: Use a per instance format array instead of a
>     static one
>   media: am437x-vpfe: Maintain a reference to the current vpfe_fmt
>   media: am437x-vpfe: fix function trace debug log
>   media: am437x-vpfe: Remove print_fourcc helper
>   media: am437x-vpfe: TRY_FMT ioctl is not really trying anything
>   media: am437x-vpfe: Remove per bus width static data
>   media: am437x-vpfe: Switch to SPDX Licensing
> 
> Dave Gerlach (1):
>   media: am437x-vpfe: Fix suspend path to always handle pinctrl config
> 
>  drivers/media/platform/am437x/am437x-vpfe.c   | 906 ++++++++----------
>  drivers/media/platform/am437x/am437x-vpfe.h   |  44 +-
>  .../media/platform/am437x/am437x-vpfe_regs.h  |  10 +-
>  3 files changed, 438 insertions(+), 522 deletions(-)
> 

