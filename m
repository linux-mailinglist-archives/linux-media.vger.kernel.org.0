Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5418936F900
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 13:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhD3LQ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 07:16:57 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:40474 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhD3LQ4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 07:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619781352; bh=1A9xugSi8dzriGXM3Bh1afWQ+qsOl8QuZQW0kkzn40A=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=g1OQzwh+k4j+j86Ea2+Z/6qPgaoXqHhFEqC8cD8VeZ1DAO4ThMkAPExSBgjZztFXt
         MPNgYtbEv/gD8JzhT3bF5hqwYD0IOJqXm4X+FOh4f741B+ljK6KURjWWbqzb4rRTII
         v/LtsFy6TTbeRhBuSCvj2a++OxfPyS3dGVz47WVg=
Received: by 192.168.90.13 [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 30 Apr 2021 13:15:51 +0200 (CEST)
X-EA-Auth: Nhd7YcevGYtiOWwz05vY70n6fQirNtfkI4paUVkpiMDQpDpswVj2Hfh7sZKO3YFpZO7Xp+AfLeufe24ONKHSo2JJ4rhmNaOc
Date:   Fri, 30 Apr 2021 16:45:44 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Fabio Aiuto <fabioaiuto83@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/9] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <YIvm4M0Gru+RpV5O@dU2104>
References: <cover.1619630709.git.drv@mailo.com>
 <034c3cc993191feb8fda719dd1b2adc9e2074e78.1619630709.git.drv@mailo.com>
 <20210429070611.GA1409@agape.jhs>
 <YIqdT6wsrlNP/cEo@192.168.1.8>
 <693e054f-6a7b-d9e7-a72a-07d7fa295487@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <693e054f-6a7b-d9e7-a72a-07d7fa295487@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 30, 2021 at 12:04:33PM +0200, Hans Verkuil wrote:
> On 29/04/2021 13:49, Deepak R Varma wrote:
> > On Thu, Apr 29, 2021 at 09:06:12AM +0200, Fabio Aiuto wrote:
> >> Hi Deepak,
> > 
> > Hello Fabio :)
> > 
> >>
> >> On Wed, Apr 28, 2021 at 11:38:45PM +0530, Deepak R Varma wrote:
> >>> Reformat code comment blocks according to the coding style guidelines.
> >>> This resolves different checkpatch script WARNINGs around block comments.
> >>>
> >>> Suggested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> >>> Signed-off-by: Deepak R Varma <drv@mailo.com>
> >>> ---
> >>>
> >>> Changes since v3:
> >>>    - Include additional header files in the clean up
> >>> Changes since v2:
> >>>    - Tag Fabio Auito for the patch suggestion
> >>>
> >>> diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
> >>> index 787bbf59e895..aad98f37aaa6 100644
> >>> --- a/drivers/staging/media/atomisp/i2c/mt9m114.h
> >>> +++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
> >>> @@ -765,7 +765,8 @@ static struct misensor_reg const mt9m114_common[] = {
> >>>  	{MISENSOR_16BIT, 0xC868, 0x0280}, /* cam_output_width = 952 */
> >>>  	{MISENSOR_16BIT, 0xC86A, 0x01E0}, /* cam_output_height = 538 */
> >>>  	/* LOAD = Step3-Recommended
> >>> -	 * Patch,Errata and Sensor optimization Setting */
> >>> +	 * Patch,Errata and Sensor optimization Setting
> >>> +	 */
> >>
> >> 	/*
> >> 	 * LOAD = Step3-Recommended
> >>
> >> :(
> > 
> > oops... sorry for the oversight. Not sure how I missed it.
> > I will wait for any other feedback on other patches and send
> > in a corrected version shortly.
> 
> I've fixed this up myself.
> 
> I'm taking this series and make a PR for this, wrapping up these
> atomisp cleanups.
> 
> If you plan any more cleanups, then please do this on top of this
> branch: https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=for-v5.14-out1
> 
> That contains all pending cleanups for staging/media.

Thank you Hans and everyone. Appreciate your time, comments and patience. I
understand this entire patch series is acceptable for your consideration and
that I can now move on to other changes.

I will be sending additional clean up patches and I will base those on top of the
mentioned branch.

Have a good one.
deepak.

> 
> Regards,
> 
> 	Hans
> 
> > 
> > Thank you,
> > deepak.
> > 
> > 
> > 
> >>
> >>
> >>>  	{MISENSOR_16BIT, 0x316A, 0x8270}, /* DAC_TXLO_ROW */
> >>>
> >>
> >> thank you,
> >>
> >> fabio
> > 
> > 
> 


