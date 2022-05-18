Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E39F52C182
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 19:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241180AbiERRn3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 13:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241077AbiERRn1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 13:43:27 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E938218FE4
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 10:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652895807; x=1684431807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OAra1uUvHF3aJeha1pzu5gQlpbyWvkmAM0qFewO40ro=;
  b=YydqHIkzhKf6w9BPN2fGtJbxFEtGrPrhWh5ad3CiLjEbQmoJlnHNy6x+
   qSdqlZ5nEhEtwYou/FSqVlghH07n+9m3IiC2xePgBbLvXwL82uwMQKFa9
   WU7FdltiogVSrMuFPEYL4f/ZNsDa6MDe3s4yISXjzQaDBxejv4abSYJIl
   GgNp2Mv9nyydhMMzkElHwujQ/EKU8habbLsF2+lumVimNztjAQKyZHcNs
   RulRY94ScxrbK5btuI5JqIxPjRfhc9oHTVt1mydWKGaVa3cpydBkXC5jW
   hLnTlDy+yVjCvLss4bScfwnQTkTPa66VthJjMd6sxe0H/yvWoKGSSobs/
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="252315454"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; 
   d="scan'208";a="252315454"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 10:15:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; 
   d="scan'208";a="523620265"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 10:15:31 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0C23320387;
        Wed, 18 May 2022 20:15:29 +0300 (EEST)
Date:   Wed, 18 May 2022 20:15:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jimmy Su <jimmy.su@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com, yhuang@ovt.com,
        akeem.chen@ovt.com
Subject: Re: [PATCH v2] UPSTREAM: media: ov8856: skip OTP read in non-zero
 ACPI D state
Message-ID: <YoUpsdTwtBre3Cyf@paasikivi.fi.intel.com>
References: <20220510151241.12435-1-jimmy.su@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510151241.12435-1-jimmy.su@intel.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jimmy,

On Tue, May 10, 2022 at 11:12:41PM +0800, Jimmy Su wrote:
> To skip OTP read function while enable non-zero ACPI D state.
> This OTP read only influences streaming output with 3280x2464 &
> 1640x1232 resolution.

This isn't the right way to fix the problem.

Reading the EEPROM (and thus starting streaming) is a problem since the
receiver has been already set up to receive a proper frame. EEPROM reading
should be instead moved to pre_streamon callback.

I suppose this way the sensor's CSI-2 TX is also set in LP-11 mode, as many
CSI-2 receivers expect.

-- 
Kind regards,

Sakari Ailus
