Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BB522DD8A
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 11:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgGZJMO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 05:12:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:43158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgGZJMN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 05:12:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDA9F206F6;
        Sun, 26 Jul 2020 09:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595754733;
        bh=SkIbXYrd9PCUhAfh+KHQ6eWiQH+hjmz6Y3cUt7Ryq8Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SFhM2n8ac9C3e3sYuWswrp8xNieMzbpCePZvZBBsCpJCWWHEFw52WZFRSoyy4EO+A
         rywNPHEIm+uCj8BqqZnqdgHdXL+JssIWMnZqqD1acqNmL/wJZ1RO9h+roz/oRotCIO
         wVwuJP66Cb+hTz5u0etFnQkM2Xi6oM3ekmmKVWEQ=
Date:   Sun, 26 Jul 2020 11:12:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/4] staging: media: atomisp: fix style of block
 comments
Message-ID: <20200726091209.GA451376@kroah.com>
References: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
 <20200726090512.20574-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726090512.20574-1-bharadwaj.rohit8@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jul 26, 2020 at 02:35:10PM +0530, Rohit K Bharadwaj wrote:
> this patch fixes the coding style of block comments.
> 
> Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
> ---
> v3: change patch subject prefix
> v2: split patch into sequence of patches 
> v1: fix all coding style issues in single patch
> 
>  .../media/atomisp/pci/sh_css_firmware.c       | 28 +++++++++++++------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> index d4ab15b6d1ac..2907aead98b7 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> @@ -51,9 +51,12 @@ struct fw_param {
>  
>  static struct firmware_header *firmware_header;
>  
> -/* The string STR is a place holder
> +/*
> + * The string STR is a place holder
>   * which will be replaced with the actual RELEASE_VERSION
> - * during package generation. Please do not modify  */
> + * during package generation. Please do not modify
> + */
> +

Why the blank line?
