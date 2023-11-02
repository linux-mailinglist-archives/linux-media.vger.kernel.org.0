Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4EF7DEE34
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 09:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbjKBIdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 04:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjKBIdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 04:33:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705DD128;
        Thu,  2 Nov 2023 01:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698914005; x=1730450005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+MXnK5cwDYhvKA44iiKMDWpGOqCiNsZG9MxtAN4y3SA=;
  b=Ju/8KgGchHfba5xjCn+TydXv3FW+qO2wK7piS1O3dJNxPxMWeWard3NY
   UkN4GCH9qOr+gj3nX23C6/EWMSuOiMmWL2z6Rr+APIoosaNCxCT2ftc4z
   e+T6hYfog58idYxnDip8ilQ5sp/ysJXqkkCFZuCDNrUi/Dy/DRMtuoSDk
   kn/KPW0qZYqH+kNSPNvDDIOBQQU7qJgMyEsAdQqJZ60+mUkRB2G7fP49S
   le61lx1OCDy1Ibz22DFOYweW1kKSD0EIpFerdU0jnVptpDUjRyV89tdCt
   oZ3f3Tc9JfNb1N7d6uQO8wdJ8GMlbyEm+Cz5P4lFoz0EClyTMtAXFNFcO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1532712"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="1532712"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 01:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="8914936"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 01:33:22 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0A73112035D;
        Thu,  2 Nov 2023 10:33:19 +0200 (EET)
Date:   Thu, 2 Nov 2023 08:33:19 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: v4l2-cci: Add support for little-endian
 encoded registers
Message-ID: <ZUNezx3fs-Q8w0Bg@kekkonen.localdomain>
References: <20231101122354.270453-1-alexander.stein@ew.tq-group.com>
 <20231101122354.270453-2-alexander.stein@ew.tq-group.com>
 <20231102012217.GC5933@pendragon.ideasonboard.com>
 <1977009.tdWV9SEqCh@steina-w>
 <20231102082430.GE5933@pendragon.ideasonboard.com>
 <ZUNecAPukbm3kOyv@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUNecAPukbm3kOyv@kekkonen.localdomain>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 02, 2023 at 08:31:44AM +0000, Sakari Ailus wrote:
> This is a pre-existing problem. Feel free to add a patch to address it. :-)

I forgot to add that addressing may be part of the same set but come as
last, to avoid unnecessarily backporting patches. There's no bug in the
code related to this --- just a bug-prone pattern.

-- 
Sakari Ailus
