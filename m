Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB89192389
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 09:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgCYI7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 04:59:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:44788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbgCYI7k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 04:59:40 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC28320663;
        Wed, 25 Mar 2020 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585126780;
        bh=cOn4xweSXTjnIBdVVy7zlvAJx1b+MPNOhF7f/SvJVtQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xQC5Ih3hLcbZJRHGtrKpb8yn1ichnhGO1RqPmWYrlqvsm9829JJgzDLGTSNVjcWWa
         I40Wh6XsucAcBLauxgR6yogL5mBCB04aZtY4skOD1t25Fhbr5yKQH4ViMUvVQixQSd
         w7U5G2kKkCu600AcV10hIUPiV9c7E3DNgqxa+FCA=
Date:   Wed, 25 Mar 2020 09:59:36 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Seungchul Kim <sc377.kim@samsung.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-fh: define v4l2_fh struct regardless of
 condition
Message-ID: <20200325085936.GA3072245@kroah.com>
References: <CGME20200323023045epcas2p12007502edd2a65efcccb00eb899d5532@epcas2p1.samsung.com>
 <000601d600bb$0e2d4320$2a87c960$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000601d600bb$0e2d4320$2a87c960$@samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 23, 2020 at 11:30:45AM +0900, Seungchul Kim wrote:
> v4l2_fh struct define differently by CONFIG_V4L2_MEM2MEM_DEV.
> If some vendors use CONFIG_V4L2_MEM2MEM_DEV by module, it can make the
> mismatch of v4l2_fh sturct.
> 
> By the mismatch, the following error occurs.
> ===============================
> [    7.533506] v4l2_mem2mem: disagrees about version of symbol video_devdata
> [    7.533594] v4l2_mem2mem: Unknown symbol video_devdata (err -22)
> [    7.535319] v4l2_mem2mem: disagrees about version of symbol
> v4l2_event_pending
> [    7.542532] v4l2_mem2mem: Unknown symbol v4l2_event_pending (err -22)
> ===============================
> 
> So v4l2_fh struct is modified to does not have dependency for
> CONFIG_V4L2_MEM2MEM_DEV.
> 
> Signed-off-by: Seungchul Kim <sc377.kim@samsung.com>
> ---
>  include/media/v4l2-fh.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
