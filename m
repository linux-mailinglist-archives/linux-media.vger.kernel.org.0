Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA695B1AA9
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 12:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbiIHKyn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 06:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiIHKyl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 06:54:41 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0C514019
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 03:54:38 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 7041AC000C;
        Thu,  8 Sep 2022 10:54:32 +0000 (UTC)
Date:   Thu, 8 Sep 2022 12:54:30 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Subject: [Media Summit] Reconcile ACPI/DT image sensor probe sequences
Message-ID: <20220908105430.cujmgixybikn7im4@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This will be a recap of the discussions that already happened.

The discussion spurred from the ov5640 conversion to runtime-pm and
the final email from Laurent reports a few questions I hope can be
answered during the meeting [1]

I'm not going too much into details for the background here as Tomasz
in the same discussion provided a rather complete overview [2] and
there is large consensus that the current situation is not desirable
as it leaves most of the work to sensor drivers.

[1] https://lore.kernel.org/linux-media/YufZXoUSWzOqoVfZ@pendragon.ideasonboard.com/
[2] https://lore.kernel.org/linux-media/CAAFQd5C7-OuNpnduwKpZXFUPQKDeqkz2xkvP+JBBs+aNjB87FQ@mail.gmail.com/

The first issue is what the I2C core does on ACPI systems

        i2c_device_probe()
                dev_pm_domain_attach() *

ACPI: acpi_dev_pm_attach() -> actual power-up
OF: genpd_dev_pm_attach() -> only parses "power-domains"

* Supports ACPI D0 waiveing, but requires fw modifications

Question 1:
 Is the desired behaviour to have the device powered up when probed ?

 Should we aim to have OF behave like ACPI or the other way around ?
 Not even sure that's possible or desirable to move to
 genpd_dev_pm_attach() the acquisition/enabling of resources
 considering how mildly enforced is the standardization of OF names for
 clock/regulators.

 Sakari suggested to extend the D0 waiving mechanism to work not only
 with an ACPI property but also with a device flag. This would work
 for new drivers, but porting the existing ones might be complicated
 if not impossible.

 Also, if we change ACPI systems not to power up the device, would the
 regulator/clock/gpio APIs work the same on OF/ACPI or we will end up
 duplicating the power-up routines ?


Question 2: The runtime_pm dance.

 The problem is also complicated by the fact drivers have to handle
 cases where !CONFIG_PM and cannot rely on runtime_pm "doing the right
 thing" (once we know what the right thing would be), and hence device
 power-up during probe to support HW access have to be performed
 manually.

 It is my understanding that we can't assume CONFIG_PM. Why ? What
 does it take to change this ?

 Also what would it take to have pattern like this one:

 ------------------------------------------------------------------------------
  int sensor_resume(dev)
  {
  }

  int sensor_suspend(dev)
  {
  }

  int probe()
  {
        RESOURCES ACQUISITION (clock/regulators/gpio)

        if (!is_acpi_node(dev))
                sensor_resume(dev)

        pm_runtime_set_active();
        pm_runtime_enable();

         -- HW ACCESS --

        pm_runtime_set_autosuspend_delay(dev, 1000);
        pm_runtime_use_autosuspend()
        pm_runtime_autosuspend();
  }

  SET_PM_RUNTIME_OPS(sensor_suspend, sensor_resume, NULL);
 ------------------------------------------------------------------------------

  Which in my understanding should work on both OF/ACPI and with
  CONFIG_PM/!CONFIG_PM to be moved to a core helper (assuming it works
  ofc) ?

  Would standardize on such a pattern be a good first move or
  converting existing drivers would be a burden we can't take ?

See you all on Monday!
Thanks
  j
