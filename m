Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5436E266713
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 19:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgIKRhO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 11 Sep 2020 13:37:14 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:40010 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725995AbgIKMte (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 08:49:34 -0400
Received: from [78.134.51.148] (port=34610 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kGiUZ-000Ei9-J2; Fri, 11 Sep 2020 14:49:27 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v8 0/6] Support running driver's probe for a device
 powered off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
Message-ID: <f4b82baa-66b7-464e-fd39-66d2243a05ef@lucaceresoli.net>
Date:   Fri, 11 Sep 2020 14:49:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 03/09/20 10:15, Sakari Ailus wrote:
> 
> Hi all,
> 
> These patches enable calling (and finishing) a driver's probe function
> without powering on the respective device on busses where the practice is
> to power on the device for probe. While it generally is a driver's job to
> check the that the device is there, there are cases where it might be
> undesirable. (In this case it stems from a combination of hardware design
> and user expectations; see below.) The downside with this change is that
> if there is something wrong with the device, it will only be found at the
> time the device is used. In this case (the camera sensors + EEPROM in a
> sensor) I don't see any tangible harm from that though.
> 
> An indication both from the driver and the firmware is required to allow
> the device's power state to remain off during probe (see the first patch).
> 
> 
> The use case is such that there is a privacy LED next to an integrated
> user-facing laptop camera, and this LED is there to signal the user that
> the camera is recording a video or capturing images. That LED also happens
> to be wired to one of the power supplies of the camera, so whenever you
> power on the camera, the LED will be lit, whether images are captured from
> the camera --- or not. There's no way to implement this differently
> without additional software control (allowing of which is itself a
> hardware design decision) on most CSI-2-connected camera sensors as they
> simply have no pin to signal the camera streaming state.
> 
> This is also what happens during driver probe: the camera will be powered
> on by the I²C subsystem calling dev_pm_domain_attach() and the device is
> already powered on when the driver's own probe function is called. To the
> user this visible during the boot process as a blink of the privacy LED,
> suggesting that the camera is recording without the user having used an
> application to do that. From the end user's point of view the behaviour is
> not expected and for someone unfamiliar with internal workings of a
> computer surely seems quite suspicious --- even if images are not being
> actually captured.
> 
> I've tested these on linux-next master. They also apply to Wolfram's
> i2c/for-next branch, there's a patch that affects the I²C core changes
> here (see below). The patches apart from that apply to Bartosz's
> at24/for-next as well as Mauro's linux-media master branch.

Apologies for having joined this discussion this late.

This patchset seems a good base to cover a different use case, where I
also cannot access the physical device at probe time.

I'm going to try these patches, but in my case there are a few
differences that need a better understanding.

First, I'm using device tree, not ACPI. In addition to adding OF support
similar to the work you've done for ACPI, I think instead of
acpi_dev_state_low_power() we should have a function that works for both
ACPI and DT.

Second, even though all the chips I'm interested in are connected via
I2C, some of them (IIO sensors) can alternatively be connected via SPI
and it would make perfectly sense to use SPI instead of I2C. The "i2c-"
prefix added in v8 on the ACPI property looks like a limitation in that
respect. The same reasoning applies to the implementation in the I2C
core, but implementation could be generalized later.

I'd love to know your opinion on the above points.

-- 
Luca

