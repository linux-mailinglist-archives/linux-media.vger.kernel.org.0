Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 801183537B0
	for <lists+linux-media@lfdr.de>; Sun,  4 Apr 2021 11:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhDDJzg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Apr 2021 05:55:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:49834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229483AbhDDJzf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Apr 2021 05:55:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B34CB61380;
        Sun,  4 Apr 2021 09:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617530131;
        bh=FhEaW2cmEgSgSaC3SbBCxav57AyEtDTZ4e+3qBA+FkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dWIkycwoXooVgqIedtlP6WI6HZ7u663QH3KqsMpIVBzKrAQQiC065kvQWoMRntHBJ
         GSvAQPhs/tedheWCzJJrNctXHnoisBp4Nb3hTzTKyfMUeSpLOBm1lxoi02ag59gviR
         iJGj3rRJMf53nfmHeAsjK7kIDtgvdxUzSXC0FMUo=
Date:   Sun, 4 Apr 2021 11:55:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH 0/7] staging: media: zoran: Eliminate camelcase
Message-ID: <YGmNDmT/aqU/+ygn@kroah.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 04, 2021 at 12:08:57AM +0600, Zhansaya Bagdauletkyzy wrote:
> This patchset fixes 'avoid camelcase' warning by converting local variables to lowercase and separating words using '_'.
> Renaming of each variable is implemented in separate patches.
> 
> Zhansaya Bagdauletkyzy (7):
>   Rename 'HEnd' to 'h_end'
>   Rename 'VEnd' to 'v_end'
>   Rename 'DispMode' to 'disp_mode'
>   Rename 'VidWinWid' to 'vid_win_wid'
>   Rename 'VidWinHt' to 'vid_win_ht'
>   Rename 'We' to 'we'
>   Rename 'He' to 'he'
> 
>  drivers/staging/media/zoran/zoran_device.c | 48 +++++++++++-----------
>  1 file changed, 24 insertions(+), 24 deletions(-)

You did not read the instructions for the outreachy work, sorry, but I
can not take these.

good luck!

greg k-h
