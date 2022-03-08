Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF604D1839
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 13:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239109AbiCHMtx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 07:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiCHMtw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 07:49:52 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2649127CDC
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 04:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646743736; x=1678279736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DA/GkyBUS4UdGUsniLWfF8L001zsuJ1A9P/ordV3ctQ=;
  b=GTPf6LNRDn/8dmzBy/7ioXzHP1pJzwiQnYLtwR69hElJ4QMGJSN6JDtD
   hXnwcsdrDd0oVGkAmkJ2ZIg7O3gqZW2u/37Dpi9MrWIeFsgz041a/AHbt
   v0zhV1xTI9KedbzHBOfgecBdNh23xbx6D/iT38cQmQJwrcpbgk1mT2fiT
   YEDM2DSyqiGE6o+kR/V1OeZYZQfJNLtN6kQeGrHIkS2eHzZ/u+/tgbUlw
   3MLQeuJFzp2SZgNFbjPs3lJwKdE7sL40DGIwsNTs4VjZYULS4rxAGq033
   p8LCt5yYXnIu3aOjmPGd+uUKqWHRAEmSRgQq92u+zlcnOPnII5XI2dV+B
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="317903399"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="317903399"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 04:48:55 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="641735216"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 04:48:54 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1B87D201AA;
        Tue,  8 Mar 2022 14:48:52 +0200 (EET)
Date:   Tue, 8 Mar 2022 14:48:52 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Arec Kao <arec.kao@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com, tfiga@google.com
Subject: Re: [PATCH 2/2] Re-run BLC when gain change
Message-ID: <YidQtF28hqh6Ew7j@paasikivi.fi.intel.com>
References: <20220308033839.3773-1-arec.kao@intel.com>
 <20220308033839.3773-2-arec.kao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308033839.3773-2-arec.kao@intel.com>
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arec,

Thanks for the patch.

On Tue, Mar 08, 2022 at 11:38:39AM +0800, Arec Kao wrote:
> Changing the gain affects the black-level through the device;
> the gain should therefore not be changed during a BLC procedure.
> If the gain changes, then the BLC routine should be re-run
> in some scenarios.

Could you also explain what are the scenarios the BLC routine should be
re-run and how does the user space know this should be done? Could this be
done in the driver instead without involving the user space?

-- 
Kind regards,

Sakari Ailus
