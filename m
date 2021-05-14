Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2023838084D
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 13:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbhENLSJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 May 2021 07:18:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:55214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232164AbhENLSJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 May 2021 07:18:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03DFD610CA;
        Fri, 14 May 2021 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620991018;
        bh=J9saAdQJjfs//Wr+QzpUk4cYnqR+cdilaoVFOVLGCts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d+OiuSPWudn4TTE+H/+vtPG3j47/QVo0nWZyWL4QgKzq2ssSJ/RznadxOcJnP+SW2
         COKeMAqKaWvbcZAdQsuGuV9zEC5bfri0/Wat9/T2HWGaP/fgxdwv7yqBDdkffe20I7
         /KHunF5LyEBmCR18ui3EO7SwVB849+7gS1+XQn6b92O4erJeVHFr27qtoBPa2fhYcy
         SQsoyZkHH7zscX8KtmqFQtLva5JM8w+zYjiu3sP1lRpSmMbqIdb3IpMDQcSBFpujP8
         342/tjoeVHmOll4unXaEdnG8noiFjXq3sghG0B/RWqEF/oYfG4hQQRDhLYsD8KTY3D
         eBexHZrFMgyNg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lhVoR-0000qb-0n; Fri, 14 May 2021 13:16:59 +0200
Date:   Fri, 14 May 2021 13:16:59 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v3 1/3] USB: serial: move ftdi_sio.h into include
 directories
Message-ID: <YJ5cK819bQuijAHy@hovoldconsulting.com>
References: <cover.1620304986.git.sean@mess.org>
 <2bc01aa7942bc135234abd3d7d4b9a738778de56.1620304986.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bc01aa7942bc135234abd3d7d4b9a738778de56.1620304986.git.sean@mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 06, 2021 at 01:44:53PM +0100, Sean Young wrote:
> A following commit adds a new IR driver uirt which needs the ftdi defines;
> the hardware uses an fdti usb serial port.

You don't seem to use more than a couple of the FTDI defines in the
driver so please copy those to your implementation instead of moving the
header.

Johan
