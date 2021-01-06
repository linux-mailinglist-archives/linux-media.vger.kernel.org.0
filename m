Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBED2EC160
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 17:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbhAFQoh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 11:44:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:53734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727205AbhAFQoh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Jan 2021 11:44:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B384C23131;
        Wed,  6 Jan 2021 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609951437;
        bh=IejT2lVXTH0kk/fG9dvYmRsztiEo7c6jYNhh7J5/CWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EdExiLF8Cw1eBt+E/4Aq9a7K2EwBHSHuBeYvvMyxZAMd9OX6kHLDiihHapRGn4yJA
         LLeM39q+/ndQnVqNkhBsiDrkS/rjpr2S4B703ja2fYJF7NOWPonrsJBOxJFDFTPE0A
         A8O4GWbAl++0yb4gwY22ZHI3Ctim3IG60rzteRA8=
Date:   Wed, 6 Jan 2021 17:45:18 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Matthias Maennich <maennich@google.com>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Hridya Valsaraju <hridya@google.com>,
        Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH] staging: ION: remove some references to CONFIG_ION
Message-ID: <X/XpHo82oOBYygYX@kroah.com>
References: <20210106155201.2845319-1-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106155201.2845319-1-maennich@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 06, 2021 at 03:52:01PM +0000, Matthias Maennich wrote:
> With commit e722a295cf49 ("staging: ion: remove from the tree"), ION and
> its corresponding config CONFIG_ION is gone. Remove stale references
> from drivers/staging/media/atomisp/pci and from the recommended Android
> kernel config.
> 
> Fixes: e722a295cf49 ("staging: ion: remove from the tree")
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: devel@driverdev.osuosl.org
> Signed-off-by: Matthias Maennich <maennich@google.com>
> ---
>  .../media/atomisp/pci/atomisp_subdev.c        | 20 -------------------
>  kernel/configs/android-recommended.config     |  1 -
>  2 files changed, 21 deletions(-)

Thanks for finding these remnants, I'll go queue this up now.

greg k-h
