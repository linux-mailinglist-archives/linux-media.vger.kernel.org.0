Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22632DCF29
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 21:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437658AbfJRTOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 15:14:07 -0400
Received: from mga05.intel.com ([192.55.52.43]:13821 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436517AbfJRTOH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 15:14:07 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Oct 2019 12:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; 
   d="scan'208";a="226643105"
Received: from wittejoe-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.249.39.3])
  by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2019 12:14:04 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 268F821E76; Fri, 18 Oct 2019 22:10:42 +0300 (EEST)
Date:   Fri, 18 Oct 2019 22:10:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 00/11]  media: Report camera sensor properties
Message-ID: <20191018191041.GD3712@kekkonen.localdomain>
References: <20191007162913.250743-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007162913.250743-1-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Oct 07, 2019 at 06:29:02PM +0200, Jacopo Mondi wrote:
> Hello, fourth iteration following:
> 
> "media: v4l2-ctrls: Add camera sensor location"
> https://patchwork.kernel.org/project/linux-media/list/?series=160901
> "[v2,00/10] media: Report camera sensor properties
> https://patchwork.kernel.org/cover/11116443/
> "[PATCH v3 00/11] media: Report camera sensor properties"
> https://patchwork.kernel.org/project/linux-media/list/?series=173571
> 
> I here included Hans' comments. Most notable changes
> 
> v3 -> v4:
> - Minor reword in documentation of location and rotation properties
> - Fix V4L2_CID_CAMERA_SENSOR_ROTATION control documentation
> - Renamed helper in v4l2_ctrl_new_fwnode_properties()
> v2->v3:
> - Expand 'rotation' property description
> - s/device/system in properties description to make them applicable to
>   cameras and flash LEDs
> - Expand the rotation control description
> - Split helper to parse properties and helper to register properties
> - Drop the example coreboot patch that add properties to the Soraka device
>   ACPI tables
> 
> I know there are still doubts the two properties might well apply to
> modern devices with movable cameras, but I still think they cover 99% of devices
> out there at the moment.

Could you cc this on the next time (or bounce now) this to the devicetree
list, please?

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
