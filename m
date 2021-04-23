Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C2F369765
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 18:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbhDWQv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 12:51:27 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:40112 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhDWQv0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 12:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619196639; bh=CZadzIrWiMrwCeTcRwv8qn3XrDMN7XCMWo6IZzlVgjg=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=Z7JU8H4Si76QM11HUIb+7+VkfGufQdQVnEZ3hyIofx/8qb1SYqUi6dnfpO9o7iO93
         Zywkb/VRgFbpkykpcBMkvscQquiGLD+tiw/DTeE9pPlVKDf1D8D12hPqX8lEca8jDC
         UcXxFLh5JN95n1B5PAvD6S4ohl8VAAUu7/Ofwo94=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 23 Apr 2021 18:50:39 +0200 (CEST)
X-EA-Auth: aoDRiUzuVUdCWD7QxyvrIDGIHuWFN8yYEOxIkeBffsOpWvHBoKvsohoiK3d4W3I9AbRCk9QwM691MNfSlrl/lZLx9xZQr6fe
Date:   Fri, 23 Apr 2021 22:20:33 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH v3 0/6] staging: media: atomisp: code cleanup fixes
Message-ID: <20210423165033.GB252852@localhost>
References: <cover.1619022192.git.drv@mailo.com>
 <449f49fa-f19b-70bc-5ee9-3187ac43a376@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <449f49fa-f19b-70bc-5ee9-3187ac43a376@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 23, 2021 at 11:09:08AM +0200, Hans Verkuil wrote:
> Hi Deepak,
> 
> Something weird is going on. This series didn't appear in patchwork
> (https://patchwork.linuxtv.org/) and looking at lore.kernel.org:
> 
> https://lore.kernel.org/linux-media/20210421181101.JySzrynV5EUsi4N5Dh97QA9VUOQjMutu0mNTW7capUw@z/T/#r4d9987c800c28c26c96464bb56916bf0408b4738
> 
> it appears v3 was seen as replied to the v1 posts instead of a new thread.
> 
> It's probably related to the Message-Id field, which is the same for the
> v1 and v3 posts. Not really sure how you managed that :-)
> 
> Please repost so that the v3 series is picked up by patchwork.

Hello Hans,
Thank you for looking into the patch set. I am really not sure what
happened here. I followed the usual steps and resent the patch set with
suggested changes. My apologies for the trouble.

I will resend the patch set as suggested. Is there anything I can
validate at my end to ensure it is different before sending the set
across?

Thank you,
deepak.

> 
> Regards,
> 
> 	Hans
> 
> On 21/04/2021 20:11, Deepak R Varma wrote:
> > This patch set addresses different kinds of checkpatch WARNING and
> > CHECK complaints.
> > 
> > Note: The patches should be applied in the ascending order.
> > 
> > Changes since v2:
> >    Generic change:
> >    1. Correct patch versioning in patch subject
> > 
> >    Patch Specific change:
> >    1. patch 1/6 : none
> >    2. patch 2/6 : none
> >    3. patch 3/6 : none
> >    4. patch 4/6 :
> >         a. Tag Fabio Auito for the patch suggestion
> > 
> >    5. patch 5/6 : none
> >    6. patch 6/6:
> >         a. Tag Fabio Auito for the patch suggestion
> > 
> > Changes since v1:
> >    Generic change:
> >    1. The patch set is being resent from an email account that matches with
> >       the patch signed-of-by tag. Issue highlighted by Hans Verkuil.
> > 
> >    Patch specific changes:
> >    1. patch 1/6 : none
> >    2. patch 2/6 : none
> >    3. patch 3/6 : none
> >    4. patch 4/6 : implement following changes suggested by Fabio Aiuto
> >         a. Corrected commenting style
> >         b. Similar style implemented for other comment blocks in
> >            the same files.
> >    5. patch 5/6 : none
> >    6. patch 6/6: implement following changes suggested by Fabio Aiuto
> >         a. use dev_info instead of pr_info
> >         b. update patch log message accordingly
> > 
> > 
> > Deepak R Varma (6):
> >   staging: media: atomisp: improve function argument alignment
> >   staging: media: atomisp: balance braces around if...else block
> >   staging: media: atomisp: use __func__ over function names
> >   staging: media: atomisp: reformat code comment blocks
> >   staging: media: atomisp: fix CamelCase variable naming
> >   staging: media: atomisp: replace raw printk() by dev_info()
> > 
> >  .../media/atomisp/i2c/atomisp-gc0310.c        |  14 +--
> >  .../media/atomisp/i2c/atomisp-gc2235.c        |  29 ++---
> >  .../atomisp/i2c/atomisp-libmsrlisthelper.c    |   6 +-
> >  .../media/atomisp/i2c/atomisp-lm3554.c        |   2 +-
> >  .../media/atomisp/i2c/atomisp-mt9m114.c       | 106 ++++++++++--------
> >  .../media/atomisp/i2c/atomisp-ov2680.c        |  43 ++++---
> >  .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
> >  7 files changed, 116 insertions(+), 94 deletions(-)
> > 
> 


