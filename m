Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEE75774D1
	for <lists+linux-media@lfdr.de>; Sun, 17 Jul 2022 08:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiGQGyK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 02:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232347AbiGQGyJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 02:54:09 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C49695B4;
        Sat, 16 Jul 2022 23:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658040847; x=1689576847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g+ejKtr9Hy0i4+xqsZ6Lrtqy/FCD/1bvZELCN6HO28s=;
  b=Qaf20JlqRG3Ge1cflMRfx+3eHKpwVxj0YCYvJowjAYTDbIu5v7/aCcFb
   PPetlEYgFnPjwuj0R63kxzLqKauCyWOl8aMjts80/3K0aUdgOy8/7Z82K
   0OxoNlZqryEEzet4tI+SL0ApqrXhDK6u0QrEHpVEVN3EZHuhB4Djz9PLS
   btGHOD8ziCTlpO24JFfZ7+fkSNGnh0/GCNvmorosKOwCOnCmfmrH0BNSw
   9lsSceqoV1zrrGTkyxF/pNXXAphDoq/V5HXR4Yds2k3Ygzl2WAx7Wtfos
   yIhzFmnpTq5V41Ti7WvRFNUf0CjTeG9qhlBDYMBOsyz2/lTcnAqaGi/q9
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="311709014"
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; 
   d="scan'208";a="311709014"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 23:54:07 -0700
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; 
   d="scan'208";a="572027121"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 23:54:03 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id EA91F20497;
        Sun, 17 Jul 2022 09:54:00 +0300 (EEST)
Date:   Sun, 17 Jul 2022 06:54:00 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 0/6] dt-bindings: Add macros for video interface bus
 types
Message-ID: <YtOyCBOqCR71uG1i@paasikivi.fi.intel.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Folks,

> Laurent Pinchart (6):
>   dt-bindings: media: Add macros for video interface bus types
>   dt-bindings: Use new video interface bus type macros in examples
>   ARM: dts: freescale: Use new media bus type macros
>   ARM: dts: omap: Use new media bus type macros
>   ARM: dts: renesas: Use new media bus type macros
>   ARM: dts: stm32: Use new media bus type macros

What's the preference on the tree through which these would be merged?

The two first should probably go through the media tree but what about the
DTS? There's a dependency to the first patch. I can take these all if
people are fine with that.

-- 
Kind regards,

Sakari Ailus
