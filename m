Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601992A41CC
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 11:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgKCK0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 05:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727246AbgKCK0N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 05:26:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45923C0613D1
        for <linux-media@vger.kernel.org>; Tue,  3 Nov 2020 02:26:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41D1A332;
        Tue,  3 Nov 2020 11:26:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604399170;
        bh=yCMQjKAU05bVdHbXUhs3bPh0x22AEebW/iGjrpPw+M8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mrUDaUHfpTF83qFQP45w8KMfUHea9Sn5tmh1T0mitSLRks/sgL2VNMmx6Nx09dtAH
         LjMZb1GHlqesTNq6D9d3kR7u4+LmwhUaO1EpZiHqcuwGV7PdZVdHApBRo2cTTmyXt5
         LNDKSmabHUpN770xEzNgCWzTJo+rJOW7qDWoi/0A=
Date:   Tue, 3 Nov 2020 12:25:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v2 00/19] media: Add new pixel formats for Xilinx v-frmbuf
Message-ID: <20201103102522.GA17496@pendragon.ideasonboard.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
 <20201103085752.GF26150@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201103085752.GF26150@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Nov 03, 2020 at 10:57:52AM +0200, Sakari Ailus wrote:
> On Tue, Nov 03, 2020 at 12:40:43AM +0200, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series adds a set of new pixel formats needed for the Xilinx
> > Video Frame Buffer Read/Write IP cores (see [1]).
> > 
> > Compared to v1, the series has been extended to include semi-planar YUV
> > formats. The code is now based on v5.10-rc2, which uses SPDX license
> > headers for the media documentation, so new files have been switched to
> > do so as well. Review comments have also been incorported, thank you
> > Hans and Nicolas for providing feedback on v1.
> > 
> > Documentation of the pixel formats has grown organically in V4L2, and
> > while it is fairly complete and detailed, it also duplicates lots of
> > information. I've thus decided to bite the bullet, and try to
> > consolidate the documentation first before adding new formats.
> > 
> > The first three patches address minor issues in videodev2.h, removing a
> > comment that belongs to a commit message instead (01/19) and moving two
> > misplaced formats to where they belong (02/19 and 03/19).
> > 
> > The next three patches refactor documentation for the RGB formats. Patch
> > 04/19 removes a confusing table (that likely made sense when it was
> > added, but not anymore), 05/19 adds a section title for the deprecated
> > RGB formats to increase clarity, and patch 06/19 documents the naming
> > scheme followed by our RGB formats. There are two separate naming
> > schemes, used by 8- and 16-bit formats on one side, and 24- and 32-bit
> > formats on the other side. The former matches the naming conventions of
> > DRM, while the latter doesn't, which has often led to confusion and
> > errors. This can't be changed, but it's now clearly documented.
> 
> The patches look nice but it'd be useful to see the resulting
> documentation. Would you be able to upload that somewhere for reviewers to
> access?

Sure. Here you are: https://www.ideasonboard.org/media/uapi/v4l/pixfmt.html

-- 
Regards,

Laurent Pinchart
