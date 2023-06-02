Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA67720414
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 16:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbjFBOO2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 10:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234114AbjFBOO1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 10:14:27 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB038197
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 07:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685715266; x=1717251266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9avcbil6vvfxfkM1rSXs+sD1lQ8LsK03Sx/8x1VNmEs=;
  b=DNMS2TaSmQtY4WmfSgC8UUk3nGa14QCZnNVNRiK7iCUWJE2JysexrsSA
   thj+JQctYVrI2eSBdXHA518Y0IhnrhgB6A+Vt+9CCKvTjCGWh0QGUC/03
   2fefAwqrWYHlITTMlp3EARjMppPHjD5InlxYhBPl62cQHt/d/auQN8y+d
   /l8Si7Wvktqkw3qVs85Wkn49OcaSNTDezruFKMSr/Ex6t7m3qh5fe9eSa
   3/6h5Xy6ASIAAqLoYzNBTa8r+PHD3vxSumflu19I4HXJsGWynYELa6pKw
   N/vSOe2RVV1WyrIIpeoJBTEqu0kLAWnZClna3yFAQz16e/bqhY63gUBA/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358305185"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="358305185"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="954519797"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="954519797"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:14:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id CDFD3120B16;
        Fri,  2 Jun 2023 17:14:08 +0300 (EEST)
Date:   Fri, 2 Jun 2023 14:14:08 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com
Subject: Re: [PATCH v3 1/1] media: pci: ipu3-cio2: Obtain remote pad from
 endpoint
Message-ID: <ZHn5MH3o1l0lBhqS@kekkonen.localdomain>
References: <20230515122127.590733-1-sakari.ailus@linux.intel.com>
 <20230602091212.GB23701@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602091212.GB23701@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jun 02, 2023 at 12:12:12PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, May 15, 2023 at 03:21:27PM +0300, Sakari Ailus wrote:
> > Use the endpoint fwnode to find out the remote pad, instead of using the
> > first source pad found. Also improve error messages.
> 
> The commit message should explain *why*. Once I know why, I'll review
> the patch :-)

I thought it'd be trivial. :-)

Using framework functions instead of open coding this in drivers, and using
the pad related to the endpoint fwnode instead of just the first pad found.

I'll add this to the commit message.

-- 
Sakari Ailus
