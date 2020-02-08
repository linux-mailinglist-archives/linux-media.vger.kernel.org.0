Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C30D31567B5
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2020 21:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbgBHUhA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Feb 2020 15:37:00 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:16594 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgBHUhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Feb 2020 15:37:00 -0500
Date:   Sat, 08 Feb 2020 20:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1581194217;
        bh=t+xJ/xEP20T406kYwPLPT1xFtx2YUsz+aTTierMkImg=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=XMuYghRTyn3mK7NVMN8ZZ73Ago7Rog1LaVkGRfd2KE6t4Fb/ppESsEms9yROkAM1D
         zeqQcXsLD98uso8cd8lq45cSmvmga5e7xv1zStsUrbyk3z6SK+jQi0JGhZKnZV+h6l
         ICDf/HfoJUnG54nEl54PmOwANzPRH2ARu1ZNjlTM=
To:     Helen Koike <helen.koike@collabora.com>
From:   =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Reply-To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: Re: [PATCH 1/3] media: vimc: Support multiple buscodes for each pixelformat
Message-ID: <20200208203639.nxxzgh6j6z7yagzc@ArchWay.local>
In-Reply-To: <1d32848b-3009-1748-2823-5b91404c6426@collabora.com>
References: <20200202155019.1029993-1-nfraprado@protonmail.com>
 <20200202155019.1029993-2-nfraprado@protonmail.com>
 <1d32848b-3009-1748-2823-5b91404c6426@collabora.com>
Feedback-ID: cwTKJQq-dqva77NrgNeIaWzOvcDQqfI9VSy7DoyJdvgY6-nEE7fD-E-3GiKFHexW4OBWbzutmMZN6q4SflMDRw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,
thanks for the review.

Just one comment below.

On Wed, Feb 05, 2020 at 11:17:31AM -0300, Helen Koike wrote:
>
> Hi N=C3=ADcolas,
>
> Thanks for the patch, just some minor nits:
>
> On 2/2/20 1:50 PM, N=C3=ADcolas F. R. A. Prado wrote:
> > diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/=
platform/vimc/vimc-common.h
> > index 87eb8259c2a8..132a5889f1ea 100644
> > --- a/drivers/media/platform/vimc/vimc-common.h
> > +++ b/drivers/media/platform/vimc/vimc-common.h
> > @@ -69,7 +69,7 @@ do {                                                 =
                     \
> >   * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
> >   */
> >  struct vimc_pix_map {
> > -   unsigned int code;
> > +   unsigned int code[3];
>
> why 3?

On my patch I'm using at most 2.
I chose 3 so that it would be easier to add more formats, but I guess it do=
esn't
really make sense, since it's wasting memory and that value can be increase=
d
when it's necessary.
So I should change it to 2, right?

> Regards,
> Helen

Thanks,
N=C3=ADcolas

