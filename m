Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 817D85E77E0
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 12:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbiIWKDr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 06:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbiIWKDh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 06:03:37 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE9F12FF11
        for <linux-media@vger.kernel.org>; Fri, 23 Sep 2022 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663927416; x=1695463416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=czPUI+Kg+pTI5NEbDdE6PkhZlf5Tq5yMbc0HjA267m8=;
  b=Psomw6bifA/HF8UKbMNMS/h/g4wUyH5RjySJtm0abEqwe4JB54UvIMjW
   7fhLMC9zwpJHUAB/VMPTRdSYXOEEExtKbV9z1jZHrrXv+2D0GqBdcodoX
   TA/hwdv483upk9C6NyHgC/D51Xy2ils79j4TZah+XAsoZ4WcI6VoZnDoH
   g9IgEWPNFFXpl7I2mmjFlSK0c66xCEy4YRZR5ftmycz3u0sGEzyep1Dnv
   RmQlmNtMMdtesZGIGKc9oID4hUGuIkMZcdlnaktmz0Mz5w+sCFaast9OL
   iNo5BILPzrRm/xz0je1G9olcV/F2FrrOMZ1vJqBKIcchkaOHXAP0d1zd1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="298158772"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="298158772"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 03:03:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="709247820"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 03:03:22 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id ED7F920124;
        Fri, 23 Sep 2022 13:03:19 +0300 (EEST)
Date:   Fri, 23 Sep 2022 10:03:19 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: RFC: Arducam 64 MP (Hawkeye)
Message-ID: <Yy2EZ4JwG01UKLhX@paasikivi.fi.intel.com>
References: <166392656967.56880.6892202016312600929@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166392656967.56880.6892202016312600929@Monstersaurus>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Fri, Sep 23, 2022 at 10:49:29AM +0100, Kieran Bingham wrote:
> Hi Sakari, Laurent,
> 
> Last night I hooked up the Arducam 64 MP Hawkeye camera [0], to an RPi4,
> and added the camera helper for the RaspberryPi IPA to libcamera, and
> was able to use the camera directly with dtoverlay=arducam_64mp in the
> Raspberry Pi /boot/config.txt using the latest release from Raspberry
> Pi.
> 
> Raspberry Pi have already added the driver for this camera [1] to their
> tree, and I have been given the tuning files from Arducam.
> 
> This has allowed me to capture an image with pretty good response to
> changing lighting conditions, and colours. [2] ... The AF isn't yet
> enabled, so that shot is out of focus a little. (That's for later).
> 
> Arducam do not wish to name the sensor used in the module, and have
> called it the 'arducam_64mp'. But attempting to upstreaming this with
> that name worries me.
> 
> Furthermore, we would like to maintain libcamera as supporting cameras
> that have 'upstream' drivers (or drivers that are on their way
> upstream), so I'm keen to identify how we can upstream the drivers to
> create a better experience for users who are currently finding that they
> need to run a fork of libcamera to operate the module.
> 
> So ultimately - my open question is ... Is it acceptable to have camera
> drivers that are named by their 'module/integration' rather than their
> sensor?

A lot of users (especially the existing ones) depend on the entity name
currently. I don't think we could change it. For new ones I guess that
would be possible.

Alternatively this could be a string control I think. That could be added
to existing drivers as well.

-- 
Kind regards,

Sakari Ailus
