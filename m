Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23DC737714B
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 12:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhEHK7L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 06:59:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:55644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230234AbhEHK7L (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 8 May 2021 06:59:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 878E861414;
        Sat,  8 May 2021 10:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620471489;
        bh=H/jXYFQXLAmIIakuyQqiit+5QqWQgTX/kFXq/0VpIH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pyLiTcFH2B0Q2YAJfl0liVNUB0fK2q7FFh4C1w8szsHQNO6/vid52u/4UVXRyZTyw
         Hkxyl3Gh1MMidre9szM/jhDt+yRgH498gZaWA5MRNrcixxa3Y9bcCYVg5EkML4RIzE
         yfXlB9zt1DWTxUxdhly5vK256JvflOcAruNgwyLM=
Date:   Sat, 8 May 2021 12:58:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: code cleanup
Message-ID: <YJZuviLa3SRLWASk@kroah.com>
References: <20210507075458.GB3@paasikivi.fi.intel.com>
 <20210508105129.2698-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508105129.2698-1-paskripkin@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 08, 2021 at 01:51:29PM +0300, Pavel Skripkin wrote:
> Breaks are not useful after a return, they can
> simply be removed.
> 
> Also, dropped the individual return statements
> after or inside switch cases

Almost always, when you say "also" in a patch changelog, that means this
should be split up into two different patches.

I recommend doing that here as well, this should be a 2 patch series,
right?

thanks,

greg k-h
