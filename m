Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB229199374
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 12:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730276AbgCaKc4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 06:32:56 -0400
Received: from retiisi.org.uk ([95.216.213.190]:48102 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729925AbgCaKcz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 06:32:55 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 47818634C87;
        Tue, 31 Mar 2020 13:32:16 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jJEBr-0001Gy-Bd; Tue, 31 Mar 2020 13:32:15 +0300
Date:   Tue, 31 Mar 2020 13:32:15 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
Message-ID: <20200331103215.GI2394@valkosipuli.retiisi.org.uk>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <20200325110358.GB853@valkosipuli.retiisi.org.uk>
 <8bc44545-7d1e-0e37-db27-d37784679574@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bc44545-7d1e-0e37-db27-d37784679574@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Mar 30, 2020 at 12:59:15PM +0200, Hans Verkuil wrote:
> On 3/25/20 12:03 PM, Sakari Ailus wrote:
> > Hi Sowjanya,
> > 
> > Thanks for the patchset.
> > 
> > On Mon, Mar 23, 2020 at 10:52:32AM -0700, Sowjanya Komatineni wrote:
> >> Tegra210 contains a powerful Video Input (VI) hardware controller
> >> which can support up to 6 MIPI CSI camera sensors.
> >>
> >> Each Tegra CSI port can be one-to-one mapped to VI channel and can
> >> capture from an external camera sensor connected to CSI or from
> >> built-in test pattern generator.
> >>
> >> Tegra210 supports built-in test pattern generator from CSI to VI.
> >>
> >> This patch adds a V4L2 media controller and capture driver support
> >> for Tegra210 built-in CSI to VI test pattern generator.
> >>
> >> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> >> ---
> >>  drivers/staging/media/Kconfig              |    2 +
> >>  drivers/staging/media/Makefile             |    1 +
> >>  drivers/staging/media/tegra/Kconfig        |   10 +
> >>  drivers/staging/media/tegra/Makefile       |    8 +
> >>  drivers/staging/media/tegra/TODO           |   10 +
> >>  drivers/staging/media/tegra/tegra-common.h |  263 +++++++
> >>  drivers/staging/media/tegra/tegra-csi.c    |  522 ++++++++++++++
> >>  drivers/staging/media/tegra/tegra-csi.h    |  118 ++++
> >>  drivers/staging/media/tegra/tegra-vi.c     | 1058 ++++++++++++++++++++++++++++
> >>  drivers/staging/media/tegra/tegra-vi.h     |   83 +++
> >>  drivers/staging/media/tegra/tegra-video.c  |  129 ++++
> >>  drivers/staging/media/tegra/tegra-video.h  |   32 +
> >>  drivers/staging/media/tegra/tegra210.c     |  754 ++++++++++++++++++++
> >>  drivers/staging/media/tegra/tegra210.h     |  192 +++++
> > 
> > Why staging? Are there reasons not to aim this to the kernel proper right
> > away? If you only support TPG, the driver may not have too many (if any)
> > real users anyway.
> > 
> >>  14 files changed, 3182 insertions(+)
> >>  create mode 100644 drivers/staging/media/tegra/Kconfig
> >>  create mode 100644 drivers/staging/media/tegra/Makefile
> >>  create mode 100644 drivers/staging/media/tegra/TODO
> >>  create mode 100644 drivers/staging/media/tegra/tegra-common.h
> >>  create mode 100644 drivers/staging/media/tegra/tegra-csi.c
> >>  create mode 100644 drivers/staging/media/tegra/tegra-csi.h
> >>  create mode 100644 drivers/staging/media/tegra/tegra-vi.c
> >>  create mode 100644 drivers/staging/media/tegra/tegra-vi.h
> >>  create mode 100644 drivers/staging/media/tegra/tegra-video.c
> >>  create mode 100644 drivers/staging/media/tegra/tegra-video.h
> >>  create mode 100644 drivers/staging/media/tegra/tegra210.c
> >>  create mode 100644 drivers/staging/media/tegra/tegra210.h
> >>
> 
> <snip>
> 
> >> +static int tegra_channel_g_input(struct file *file, void *priv,
> >> +				 unsigned int *i)
> >> +{
> >> +	*i = 0;
> >> +	return 0;
> >> +}
> >> +
> >> +static int tegra_channel_s_input(struct file *file, void *priv,
> >> +				 unsigned int input)
> >> +{
> >> +	if (input > 0)
> >> +		return -EINVAL;
> >> +
> >> +	return 0;
> >> +}
> > 
> > Please see patchset on topic "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on
> > linux-media; it's relevant here, too.
> 
> No, it isn't. The pipeline is controlled by the driver, not by userspace.
> This is a regular video capture driver, not an ISP driver.

I don't think that really makes a difference, whether a device is an ISP or
not, but instead what does is whether there is something to control in its
pipeline that cannot be generally done through the regular V4L2 interface.
Even plain CSI-2 receiver drivers should be media device centric these days
as doing otherwise excludes using a range of sensor drivers with them,
including any possible future support for e.g. sensor embedded data.

-- 
Kind regards,

Sakari Ailus
