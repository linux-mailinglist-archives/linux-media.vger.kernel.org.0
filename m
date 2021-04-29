Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8CA36E9CB
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 13:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233922AbhD2Lum (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 07:50:42 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:44600 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231168AbhD2Lul (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 07:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619696983; bh=twcZvohCwjd1Si2IWjo5hMQiJhmHeTywKFGo7trrjmM=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=Si/1+HM4CPa/2TYbFN7rtLmZ1ad+o6SRowrXVbNwE7SHbCb8toW79VTxXzFpFwbe2
         49Zop4iHdeDCHZxnXUZl9YNLG3bwbJ2WtrtNd0/bhtLnnZl6cUv6t4TkSz2DewZhwM
         wuSG2Ov/k5NBo2520SqEgo5oKGcfImkjO3Sa62Nk=
Received: by 192.168.90.11 [192.168.90.11] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Thu, 29 Apr 2021 13:49:43 +0200 (CEST)
X-EA-Auth: Qhap1+fDGjjyE3FPac3PuXQI/P8frPknoRrQRqU1eiTe0gP2ff7WVl63dMDg3Cpt3C2zzvRXSXvQ/QWwYu0b6zHK+UFq7S08
Date:   Thu, 29 Apr 2021 17:19:35 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/9] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <YIqdT6wsrlNP/cEo@192.168.1.8>
References: <cover.1619630709.git.drv@mailo.com>
 <034c3cc993191feb8fda719dd1b2adc9e2074e78.1619630709.git.drv@mailo.com>
 <20210429070611.GA1409@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429070611.GA1409@agape.jhs>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 29, 2021 at 09:06:12AM +0200, Fabio Aiuto wrote:
> Hi Deepak,

Hello Fabio :)

> 
> On Wed, Apr 28, 2021 at 11:38:45PM +0530, Deepak R Varma wrote:
> > Reformat code comment blocks according to the coding style guidelines.
> > This resolves different checkpatch script WARNINGs around block comments.
> > 
> > Suggested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> > 
> > Changes since v3:
> >    - Include additional header files in the clean up
> > Changes since v2:
> >    - Tag Fabio Auito for the patch suggestion
> > 
> > diff --git a/drivers/staging/media/atomisp/i2c/mt9m114.h b/drivers/staging/media/atomisp/i2c/mt9m114.h
> > index 787bbf59e895..aad98f37aaa6 100644
> > --- a/drivers/staging/media/atomisp/i2c/mt9m114.h
> > +++ b/drivers/staging/media/atomisp/i2c/mt9m114.h
> > @@ -765,7 +765,8 @@ static struct misensor_reg const mt9m114_common[] = {
> >  	{MISENSOR_16BIT, 0xC868, 0x0280}, /* cam_output_width = 952 */
> >  	{MISENSOR_16BIT, 0xC86A, 0x01E0}, /* cam_output_height = 538 */
> >  	/* LOAD = Step3-Recommended
> > -	 * Patch,Errata and Sensor optimization Setting */
> > +	 * Patch,Errata and Sensor optimization Setting
> > +	 */
> 
> 	/*
> 	 * LOAD = Step3-Recommended
> 
> :(

oops... sorry for the oversight. Not sure how I missed it.
I will wait for any other feedback on other patches and send
in a corrected version shortly.

Thank you,
deepak.



> 
> 
> >  	{MISENSOR_16BIT, 0x316A, 0x8270}, /* DAC_TXLO_ROW */
> > 
> 
> thank you,
> 
> fabio


