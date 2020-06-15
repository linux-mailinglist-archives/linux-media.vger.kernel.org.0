Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64D71F953F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 13:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729653AbgFOLWz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 07:22:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:45343 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728285AbgFOLWy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 07:22:54 -0400
IronPort-SDR: 93nY3DUYLIo8cofnSTc+WeMrPVDOWV32OqQD7hu7j922TLXD0RW31F2oKCoJ20VpQflEn9EH1c
 7WSvsByD0V7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 04:22:53 -0700
IronPort-SDR: ij5iitFXCB3O9mBJdw1gRYwX/Rxy1J59rJ4+Cy9NErBv9rJqb95vLxkZ65v8beqqBx5ZI1kB0f
 9L+PzMFrJeGg==
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="261070564"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 04:22:52 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 35393206D6; Mon, 15 Jun 2020 14:22:50 +0300 (EEST)
Date:   Mon, 15 Jun 2020 14:22:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: ov2740: add NVMEM interface to read customized
 OTP data
Message-ID: <20200615112250.GU16711@paasikivi.fi.intel.com>
References: <1591954922-14006-1-git-send-email-bingbu.cao@intel.com>
 <20200615092923.GT16711@paasikivi.fi.intel.com>
 <f4204020-3b84-c138-6648-1e22e194138e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4204020-3b84-c138-6648-1e22e194138e@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Srinivas,

On Mon, Jun 15, 2020 at 10:46:20AM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 15/06/2020 10:29, Sakari Ailus wrote:
> > > +	ret = ov2740_register_nvmem(client);
> > > +	if (ret)
> > > +		dev_err(&client->dev, "register nvmem failed, ret %d\n", ret);
> > > +
> > >   	/*
> > >   	 * Device is already turned on by i2c-core with ACPI domain PM.
> > >   	 * Enable runtime PM and turn off the device.
> > Could you add #ifdefs for CONFIG_NVMEM so this compiles when it's disabled?
> 
> NVMEM already has dummy functions. IMO its better to report an error to user
> as the current code does. This will atleast alert the users of existing
> nvmem provider that has been disabled!
> 
> However with ifdef users have to really look into code to be able to
> understand that there is nvmem provider as part of this driver.

Right, I somehow missed there already were dummy functions for this.

The driver is a camera sensor driver that contains an EEPROM. I'd presume
that not all (or even many) users would care about the EEPROM content so
therefore requiring NVMEM to compile the driver seems unjustified.

Therefore the patch is fine as-is IMO.

-- 
Kind regards,

Sakari Ailus
