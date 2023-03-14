Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3659D6B93E7
	for <lists+linux-media@lfdr.de>; Tue, 14 Mar 2023 13:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbjCNMfL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Mar 2023 08:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbjCNMfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Mar 2023 08:35:07 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C318312CD5
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678797271; x=1710333271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LAhAUI7dgr041uHohi7PklaRzff4NZnJ4Zev8sPvxhg=;
  b=F13nvtsHfXKqxKimsC9HTN8Mmu/HELJs//LdFTb53aOCKOOz98bUSWjr
   nF/A5Arm01hbiNUZgoMxbDpbRcr896Vt6ZcMyl1cLKiT3ymveoDXeDaOs
   7tWyvXQYDBgg6QdRbuOq7ghuSEunLwLmo7+nnYYaUtp9sEUeiySQj1rCe
   sVccrbh2ww0Px5zI2Du81fpGFq4IIjvAimZplj9EpuBAg7UPB/jFiV1Kz
   e36GPLWpwy91Sjb5nA5RBTNgMEnDO+xee6mS+YY1+Aagwov0OL+OXXX3t
   8WKh5AhxY4YDR90b+yjUPQllM54NEP1IDckPvTfXME/ZkRqdMfNEFrRP1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="337434420"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="337434420"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 05:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="679070352"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="679070352"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 05:26:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 7CC7F120D16;
        Tue, 14 Mar 2023 14:26:05 +0200 (EET)
Date:   Tue, 14 Mar 2023 14:26:05 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Arec Kao <arec.kao@intel.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
        andy.yeh@intel.com
Subject: Re: [PATCH v2] media: ov13b10: Support device probe in non-zero ACPI
 D state
Message-ID: <ZBBn3Vpmyei9Jgk7@kekkonen.localdomain>
References: <20230314121436.13538-1-arec.kao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314121436.13538-1-arec.kao@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arec,

On Tue, Mar 14, 2023 at 08:14:36PM +0800, Arec Kao wrote:
> Tell ACPI device PM code that the driver supports the device being in
> non-zero ACPI D state when the driver's probe function is entered.
> 
> Also do identification on the first access of the device, whether in
> probe or when starting streaming.
> 
> Signed-off-by: Arec Kao <arec.kao@intel.com>

Please detail the changes from the previous version.

This is ok for now though.

-- 
Kind regards,

Sakari Ailus
