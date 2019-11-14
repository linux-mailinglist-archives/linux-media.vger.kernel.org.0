Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 184F0FBF51
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 06:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfKNFRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 00:17:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:47996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726505AbfKNFRZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 00:17:25 -0500
Received: from localhost (unknown [124.219.31.93])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 18A2120659;
        Thu, 14 Nov 2019 05:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573708644;
        bh=8BYMV7CANtRhOA58MtOK3hZb2vP43Rz9zeEellPyIgM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jpvjjKuhqx4v0eaZHif+d5Jmx97YOQlTjee2CXgnI6+s77VIaqFChCCP5Q+XK7Q+d
         6Vq3rqQ19ApidkSJFwq00cbj33niuEcuD2iltZCV8LEe7+Sn1b9YVdxMxaDbO1ed33
         el9gf9aAaMwN5zbxY4gZGOrRQciXkXGOHf61LdE8=
Date:   Thu, 14 Nov 2019 13:17:22 +0800
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, jeffy.chen@rock-chips.com,
        zyc@rock-chips.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        zhengsq@rock-chips.com
Subject: Re: [PATCH v11 00/11] Rockchip ISP Driver
Message-ID: <20191114051722.GA316916@kroah.com>
References: <20191114051242.14651-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114051242.14651-1-helen.koike@collabora.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 14, 2019 at 02:12:31AM -0300, Helen Koike wrote:
> Hello,
> 
> This series adds the Rockchip Image Signal Processing Unit v1 driver to
> staging.
> 
> The main reason to be in staging is that people are already using it from the
> mailing list (including libcamera), and having it in mainline makes the workflow
> easier. Also, it is easier for other people to contribute back (with code
> or testing the driver).
> 
> We plan to actively work on this driver to get it our of staging.
> 
> This patchset is also available at:
> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v11
> 
> Libcamera patched to work with this version:
> https://gitlab.collabora.com/koike/libcamera
> (also sent to the mailing list)
> 
> The major difference in v11 are:
> - Fixed compiling warnings found with W=1
> - Fixed checkpatch errors
> - Add clock-names values in dt-bindings
> 
> This series only touches MAINTAINERS file and drivers/staging/

Looks sane, but as this is drivers/staging/media I am guessing this will
go through the media kernel tree, not my staging tree, right?

thanks,

greg k-h
