Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0617CD488
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 08:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjJRGe7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 02:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjJRGe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 02:34:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C869EFD
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 23:34:55 -0700 (PDT)
Received: from umang.jainideasonboard.com (unknown [103.251.226.39])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4D14666;
        Wed, 18 Oct 2023 08:34:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697610887;
        bh=QY9SVQam6tF/yFaOJiTeZdjxlGNO0mODJhjOpNKaEnQ=;
        h=Date:From:To:Cc:Subject:From;
        b=Agb9qhATfj4GvA65gzjXFZgAF131Uk9SIe4Tfrr79UnttIOECGCYsZTwFkKO3891V
         Ma0iQlenRuT5eTcKmEghL35+exdbJ1CKvmmHP0GK8bdf5zeUq20cqJZNpPPGDP88vk
         wSFYYztfEhmHvIfFFbGfTG8kZmw8mnCq0Lmdpz4o=
Date:   Wed, 18 Oct 2023 12:04:46 +0530
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Sensor driver support with CCS
Message-ID: <54ntzswkt2eyhjdrrr4yk5fnru4msoc2fn6esuxffa6obp3met@mw2jqxtivbtp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

Past few weeks I have been working to support IMX519 sensor with CCS
driver. The highlight is that I can capture frames with CCS driver now,
with a few workarounds. This thread summarises the issues that we faced
and act as placeholder for more open and structured discussion.

- First open question is regarding the upstream support of a sensor
  driver with CCS. How should we term that a sensor is 'mainline-supported'
  if it is getting supported by CCS. How can one use a sensor out of the box
  with mainline kernel, when supported by CCS?

- Continued from the previous discusion point, the more specific question is
  about the sensor-specific static data that is composed of
  manfacturer-specific-registers (MSRs) and (maybe) overridden
  sensor-read-only-regs which are created as part of ccs-tools [1].
  This becomes part of firmware? which needs to live /lib/firmware and
  then picked up by CCS driver.

  Where can they be centralized ? is linux-firmware an option? [2].

- It was noticed that with current version of CCS - I was only able to
  get 1/3 buffer filled. This was due to the fact that LINE_LENGTH_PCK
  and FRAME_LENGTH_LINES registers are not getting updated to permissible
  values in / before ccs_start_streaming() starts. Hence they are stuck
  with values from probe time.

These are top issues we faced while trying to support IMX519. This thread
will act as placeholder to have more discussions in the open and/or help
other sensors that can be supported with CCS.

[1]: https://github.com/MIPI-Alliance/ccs-tools
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/

thanks,
uajain
