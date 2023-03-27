Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDB06C9BDD
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbjC0HVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 03:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbjC0HVR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:21:17 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04E31715
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679901676; x=1711437676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iUwTRGL8gme3t/nZz9lEWfL+q6YN74rtRw/jAQpHs+E=;
  b=Aoxd6OrLG96U1ITyB3KnDUj8+DzgCV3nmFzaVB3P6yRibuh/4+ZHmzgh
   pGb7QqI9Iko4YDTpOz9AYrgpl3pNZ4jtrnGggMyCXvmmw+Xk5Mjs6GCmd
   XYLv0TW3fudYADu7mHQQ/2C0v+uqvpC89pGTaM8pdmt2mdQ64ElM4pWke
   MTawl3V+EuiqokkDBOFx1fEFUf1R5tRgVzov9ScP+q9viSyKMuJVMhl0S
   LzK7Mbtw+9oiZSSFX+p20qCJNbXPw8WhHOoCuvKMxDqX9v2daSBHuatvN
   8Aa8IU3FegAtOJKoY2HOCqfKgzPNy3VKMTUxdbqlexXkrTQC7sFWSdPzD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="324083269"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="324083269"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 00:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="752592649"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="752592649"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 00:21:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id BC0EE1218A3;
        Mon, 27 Mar 2023 10:21:01 +0300 (EEST)
Date:   Mon, 27 Mar 2023 10:21:01 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     hdegoede@redhat.com, djrscally@gmail.com,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH v3 0/3] media: pci: intel: ivsc: Add driver of Intel
 Visual Sensing Controller(IVSC)
Message-ID: <ZCFD3aW4NRrn69LR@kekkonen.localdomain>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

On Mon, Mar 27, 2023 at 02:23:05PM +0800, Wentong Wu wrote:
> Intel Visual Sensing Controller (IVSC), codenamed "Clover Falls", is a
> companion chip designed to provide secure and low power vision capability
> to IA platforms. IVSC is available in existing commercial platforms from
> multiple OEMs.
> 
> The primary use case of IVSC is to bring in context awareness. IVSC
> interfaces directly with the platform main camera sensor via a CSI-2 link
> and processes the image data with the embedded AI engine. The detected
> events are sent over I2C to ISH (Intel Sensor Hub) for additional data
> fusion from multiple sensors. The fusion results are used to implement
> advanced use cases like:
>  - Face detection to unlock screen
>  - Detect user presence to manage backlight setting or waking up system
> 
> Since the Image Processing Unit(IPU) used on the host processor needs to
> configure the CSI-2 link in normal camera usages, the CSI-2 link and
> camera sensor can only be used in mutually-exclusive ways by host IPU and
> IVSC. By default the IVSC owns the CSI-2 link and camera sensor. The IPU
> driver can take ownership of the CSI-2 link and camera sensor using
> interfaces exported via v4l2 sub-device.
> 
> Switching ownership requires an interface with two different hardware
> modules inside IVSC. The software interface to these modules is via Intel
> MEI (The Intel Management Engine) commands. These two hardware modules
> have two different MEI UUIDs to enumerate. These hardware modules are:
>  - ACE (Algorithm Context Engine): This module is for algorithm computing
> when IVSC owns camera sensor. Also ACE module controls camera sensor's
> ownership. This hardware module is used to set ownership of camera sensor.
>  - CSI (Camera Serial Interface): This module is used to route camera
> sensor data either to IVSC or to host for IPU driver and application.
> 
> IVSC also provides a privacy mode. When privacy mode is turned on,
> camera sensor can't be used. This means that both ACE and host IPU can't
> get image data. And when this mode is turned on, users are informed via
> v4l2 control API.
> 
> In summary, to acquire ownership of camera by IPU driver, first ACE
> module needs to be informed of ownership and then to setup MIPI CSI-2
> link for the camera sensor and IPU.
> 
> Implementation:
> There are two different drivers to handle ACE and CSI hardware modules
> inside IVSC.
>  - ivsc_csi: MEI client driver to send commands and receive notifications
> from CSI module.
>  - ivsc_ace: MEI client driver to send commands and get status from ACE
> module.
> Interface is exposed via v4l2 sub-devcie APIs to acquire and release
> camera sensor and CSI-2 link.

Thanks for the update.

Could you elaborate the decision of keeping the csi_bridge entirely
separate from the cio2_bridge (to be turned to ipu_bridge first)? Both are
doing essentially the same and using the same data structures, aren't they?

-- 
Kind regards,

Sakari Ailus
