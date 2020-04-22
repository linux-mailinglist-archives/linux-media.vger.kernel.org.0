Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60D81B4BB6
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 19:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgDVR0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 13:26:42 -0400
Received: from mga09.intel.com ([134.134.136.24]:41318 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbgDVR0m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 13:26:42 -0400
IronPort-SDR: Uha/CVTSz4wYcfzlfnJglGFJAInLXMjGNt1Bo6b6W4YxZdyVZL4cYGnF3sdFaY6RLMIvtql9hN
 KQoSD9rt501w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 10:26:41 -0700
IronPort-SDR: LX7hIz76APh1fR3vGg072vZ6EXuYSZDzv5aTkZLu10eAFbxzlONATbByO1+nYL+8V/SZkNze9P
 h57OjpdfVgFw==
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; 
   d="scan'208";a="246032965"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 10:26:39 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9ACAA20B79; Wed, 22 Apr 2020 20:26:37 +0300 (EEST)
Date:   Wed, 22 Apr 2020 20:26:37 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v8 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200422172637.GF5381@paasikivi.fi.intel.com>
References: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
 <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 21, 2020 at 03:57:40PM +0200, Niklas Söderlund wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The VIDIOC_ENUM_FMT ioctl enumerates all formats supported by a video
> node. For MC-centric devices, its behaviour has always been ill-defined,
> with drivers implementing one of the following behaviours:
> 
> - No support for VIDIOC_ENUM_FMT at all
> - Enumerating all formats supported by the video node, regardless of the
>   configuration of the pipeline
> - Enumerating formats supported by the video node for the active
>   configuration of the connected subdevice
> 
> The first behaviour is obviously useless for applications. The second
> behaviour provides the most information, but doesn't offer a way to find
> what formats are compatible with a given pipeline configuration. The
> third behaviour fixes that, but with the drawback that applications
> can't enumerate all supported formats anymore, and have to modify the
> active configuration of the pipeline to enumerate formats.
> 
> The situation is messy as none of the implemented behaviours are ideal,
> and userspace can't predict what will happen as the behaviour is
> driver-specific.
> 
> To fix this, let's extend the VIDIOC_ENUM_FMT with a missing capability:
> enumerating pixel formats for a given media bus code. The media bus code
> is passed through the v4l2_fmtdesc structure in a new mbus_code field
> (repurposed from the reserved fields). With this capability in place,
> applications can enumerate pixel formats for a given media bus code
> without modifying the active configuration of the device.
> 
> The current behaviour of the ioctl is preserved when the new mbus_code
> field is set to 0, ensuring compatibility with existing userspace. The
> API extension is documented as mandatory for MC-centric devices (as
> advertised through the V4L2_CAP_IO_MC capability), allowing applications
> and compliance tools to easily determine the availability of the
> VIDIOC_ENUM_FMT extension.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
