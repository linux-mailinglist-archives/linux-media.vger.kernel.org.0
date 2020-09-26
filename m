Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2D52798E9
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 14:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgIZMqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 08:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgIZMqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 08:46:06 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EAA8C0613D3
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 05:46:06 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id w2so1934531wmi.1
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 05:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dSwsSSOpdoya+VElstoPs3GBEFL+PDDRdz86nL3fwYY=;
        b=MmffRXqx/TQA259IWYeYPd/YW3g4ukoRQJLak9R0zqBL1iuc+1gNyFQ1LeSAHW6+kN
         UMY518sg4m20FvbYI5ysoEk3Fwa0u18ZFVRuZKGITO5ezzrO8Db9itX7hLvp9pCkeXI1
         Pas3gQSzCrtGBB0s4wj0CnGoi+K/vKl6fPBdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dSwsSSOpdoya+VElstoPs3GBEFL+PDDRdz86nL3fwYY=;
        b=lGv9zZ7vHxuvDOXcXHlCCBAr7xNVpIh9Li2Z2FV+5mtxCS4Vad/8SGQwDhI7fOIk8f
         mnpejcAnfOxgrfBBhQTYiS3Z5IgafEDqdg+DDyJw/QfJFOa948WcWub1z7TPFgneXbJo
         Wyv2pU2Myv+gRlU9mL1sRFgW08IKtgWm0aHS2t+edw4ekpmyRFknNM8kamHyBi/UrcUu
         0CKDETdNfDPYKFk5Q5sqnY4MTC54bMptxAilNGL8Vfnfl5mpbeHingGrhDxXgwB7WzpD
         S80QlXTV+6irJRKescmFYe5Y5ePFKJA/T00aVmMKoI/kW83FYf+8PQFlbGV1qxsgK5p0
         Wdxg==
X-Gm-Message-State: AOAM530vj4CGlTzEsMgBa/PEr7ituicYMfoe2pZ+DngqKyeaBqgF5z6y
        mCgtWN5y6YEUj8J8+GGcq5CoJyX/v076nA==
X-Google-Smtp-Source: ABdhPJyGVP1vyIt+XfmXDsBALeuLmGklLI0DeQtbBvlmHF8Jd13yNc7kjEZ/4KTivRsE2AI1a/lz7w==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr2660597wmg.91.1601124365050;
        Sat, 26 Sep 2020 05:46:05 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id r206sm2638763wma.47.2020.09.26.05.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:46:04 -0700 (PDT)
Date:   Sat, 26 Sep 2020 12:46:03 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v8 0/6] Support running driver's probe for a device
 powered off
Message-ID: <20200926124603.GB3781977@chromium.org>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Sep 03, 2020 at 11:15:44AM +0300, Sakari Ailus wrote:
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
> on by the I�C subsystem calling dev_pm_domain_attach() and the device is
> already powered on when the driver's own probe function is called. To the
> user this visible during the boot process as a blink of the privacy LED,
> suggesting that the camera is recording without the user having used an
> application to do that. From the end user's point of view the behaviour is
> not expected and for someone unfamiliar with internal workings of a
> computer surely seems quite suspicious --- even if images are not being
> actually captured.
> 
> I've tested these on linux-next master. They also apply to Wolfram's
> i2c/for-next branch, there's a patch that affects the I�C core changes
> here (see below). The patches apart from that apply to Bartosz's
> at24/for-next as well as Mauro's linux-media master branch.

Besides the suggestion to make the defintions added less specific to i2c
(but still keeping the implementation so for now), feel free to add:

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
