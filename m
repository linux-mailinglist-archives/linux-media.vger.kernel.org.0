Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A593F1941EA
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 15:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgCZOsl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 10:48:41 -0400
Received: from retiisi.org.uk ([95.216.213.190]:35070 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726270AbgCZOsl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 10:48:41 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id D0130634C90;
        Thu, 26 Mar 2020 16:48:21 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jHTnw-0000iH-Up; Thu, 26 Mar 2020 16:48:20 +0200
Date:   Thu, 26 Mar 2020 16:48:20 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, helen.koike@collabora.com, digetx@gmail.com,
        sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5 6/9] media: tegra: Add Tegra210 Video input driver
Message-ID: <20200326144820.GB2394@valkosipuli.retiisi.org.uk>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-7-git-send-email-skomatineni@nvidia.com>
 <20200325110358.GB853@valkosipuli.retiisi.org.uk>
 <a219aeb2-3d00-016e-eed9-503a9fbd0d13@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a219aeb2-3d00-016e-eed9-503a9fbd0d13@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

On Wed, Mar 25, 2020 at 11:30:18PM -0700, Sowjanya Komatineni wrote:
> 
> On 3/25/20 4:03 AM, Sakari Ailus wrote:
> > > +static int tegra_channel_enum_input(struct file *file, void *fh,
> > > +                                 struct v4l2_input *inp)
> > > +{
> > > +     /* currently driver supports internal TPG only */
> > > +     if (inp->index)
> > > +             return -EINVAL;
> > > +
> > > +     inp->type = V4L2_INPUT_TYPE_CAMERA;
> > > +     strscpy(inp->name, "Tegra TPG", sizeof(inp->name));
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int tegra_channel_g_input(struct file *file, void *priv,
> > > +                              unsigned int *i)
> > > +{
> > > +     *i = 0;
> > > +     return 0;
> > > +}
> > > +
> > > +static int tegra_channel_s_input(struct file *file, void *priv,
> > > +                              unsigned int input)
> > > +{
> > > +     if (input > 0)
> > > +             return -EINVAL;
> > > +
> > > +     return 0;
> > > +}
> > Please see patchset on topic "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on
> > linux-media; it's relevant here, too.
> 
> Can update in v6 to add device caps V4L2_CAP_IO_MC and remove enum/g/s_input
> ioctls.
> 
> But, I don't see this patch "v4l2-dev/ioctl: Add V4L2_CAP_IO_MC" on latest
> linux-next

It's not merged yet but likely will be very soon.

-- 
Sakari Ailus
