Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC8A36FA1F
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 14:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhD3M2I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 08:28:08 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:53330 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229864AbhD3M2I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 08:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619785625; bh=2HIgowVCeeS0VSBy4mZ1r3TtIT+EekDnKb318+ZW250=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=CuyXQ0DH9TpisKyDUcPiqQdq2o2D4FM8/q781u+fAH6lfTK7KNKDPANEwFukBezem
         fJ2z+Lfn1PsqgV/YVZ49Apho8vye1AmE03f0K3/W1KYUZgfEG1RtwblA0WhoZzOiEU
         aO3nKkhoWf4n/jSnIBFNWXsaTGKfVIGDl56/C2Es=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Fri, 30 Apr 2021 14:27:05 +0200 (CEST)
X-EA-Auth: ShcEcij6R581OKL0kHBcfmQVUrY5LT0DiOcT6LDwen/2s9qMz+pqzjfVcOIVzQf6B4lON2Ga3UJC1mQTGAFINdq0K3da5cpV
Date:   Fri, 30 Apr 2021 17:57:00 +0530
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
Message-ID: <YIv3lEAC8d8LsCb+@dU2104>
References: <cover.1619630709.git.drv@mailo.com>
 <034c3cc993191feb8fda719dd1b2adc9e2074e78.1619630709.git.drv@mailo.com>
 <20210429070611.GA1409@agape.jhs>
 <YIqdT6wsrlNP/cEo@192.168.1.8>
 <693e054f-6a7b-d9e7-a72a-07d7fa295487@xs4all.nl>
 <YIvm4M0Gru+RpV5O@dU2104>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIvm4M0Gru+RpV5O@dU2104>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 30, 2021 at 04:45:56PM +0530, Deepak R Varma wrote:
> On Fri, Apr 30, 2021 at 12:04:33PM +0200, Hans Verkuil wrote:
> > On 29/04/2021 13:49, Deepak R Varma wrote:
> > > On Thu, Apr 29, 2021 at 09:06:12AM +0200, Fabio Aiuto wrote:
> > >> Hi Deepak,
> > >>>  	{MISENSOR_16BIT, 0xC868, 0x0280}, /* cam_output_width = 952 */
> > >>>  	{MISENSOR_16BIT, 0xC86A, 0x01E0}, /* cam_output_height = 538 */
> > >>>  	/* LOAD = Step3-Recommended
> > >>> -	 * Patch,Errata and Sensor optimization Setting */
> > >>> +	 * Patch,Errata and Sensor optimization Setting
> > >>> +	 */
> > >>
> > >> 	/*
> > >> 	 * LOAD = Step3-Recommended
> > >>
> > >> :(
> > > 
> > > oops... sorry for the oversight. Not sure how I missed it.
> > > I will wait for any other feedback on other patches and send
> > > in a corrected version shortly.
> > 
> > I've fixed this up myself.
> > 
> > I'm taking this series and make a PR for this, wrapping up these
> > atomisp cleanups.
> > 
> > If you plan any more cleanups, then please do this on top of this
> > branch: https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=for-v5.14-out1
> > 
> > That contains all pending cleanups for staging/media.
> 
> Thank you Hans and everyone. Appreciate your time, comments and patience. I
> understand this entire patch series is acceptable for your consideration and
> that I can now move on to other changes.
> 
> I will be sending additional clean up patches and I will base those on top of the
> mentioned branch.

Hello Hans,
I have cloned media_tree repository and checked out branch for-v5.14-out1

Is it okay for me to start my next patch in this branch? I do not need for
you the last patch set to be applied to the git tree, correct?

Thank you,
deepak.

> 
> Have a good one.
> deepak.
> 
> > 
> > Regards,
> > 
> > 	Hans
> > 


