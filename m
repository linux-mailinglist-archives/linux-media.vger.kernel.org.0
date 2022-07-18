Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57843577E52
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 11:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbiGRJGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 05:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234040AbiGRJGk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 05:06:40 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EAB11449
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658135199; x=1689671199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=goRYSZYo8nGCt6DHKrLL/M6op8kvS9KRXFaa80jxxso=;
  b=fPLA6XBRHVXqrnWz5a6PFLCC+lZTMRw14owrG8ung36HhoAZrb6dR1Y1
   nHZpdUDEklC9BCaMIkX8sYpnrzCnKYeYO2sChvE/G+lhTef/JkixdZHmH
   WDDVaN7J9X4WDCsJuhDXlwFP9Eb/KaLqVQeh7C1aRwCYDcpxLzt29ZyIn
   ca9Ni05sRTIR9BTd/aWCqWgDC/khYy97Z3s5tT0OI3W7pT32rXIfFA31I
   aa8FuvFTD7ceJR01a+BXnzijFmjwnYgfDYoqoAZ7bmQn0Ru2txZd4tSD3
   Xkh7y1Z5p8EdLiiGOpNMDJgEd9GeU4J+izeSa1bPnwz1Mz/5tUm1vtXfZ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="372481609"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="372481609"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 02:06:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="597179048"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 02:06:36 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id BBC8C20462;
        Mon, 18 Jul 2022 12:06:34 +0300 (EEST)
Date:   Mon, 18 Jul 2022 09:06:34 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 0/5] media: Add ST VGXY61 camera sensor driver
Message-ID: <YtUimiUvbzv1SvPo@paasikivi.fi.intel.com>
References: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
 <e920c5e2-dba1-bcf7-7d83-ee797ca51b49@foss.st.com>
 <5a4cbabe-c701-6ab3-adec-592289b7b52b@foss.st.com>
 <7ae752d9-f7a5-a95a-79b3-437ef9aeeb74@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ae752d9-f7a5-a95a-79b3-437ef9aeeb74@foss.st.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, Jul 18, 2022 at 09:26:01AM +0200, Benjamin Mugnier wrote:
> Gentle ping :)

I'll try to review the set this week.

-- 
Sakari Ailus
