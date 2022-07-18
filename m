Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E17F578D1D
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 23:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235682AbiGRVzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 17:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234131AbiGRVzD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 17:55:03 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 605FB27FD9
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 14:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658181301; x=1689717301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7BkU61LaZlGfXvISb0W2BSsEd/OzzHzMLeBBFSevO2Y=;
  b=C15LAvDRNHrEHbJLnaHqIubpEW/sGBs3Mg74Ak4sqq+ZcJSHSGmeFN1u
   nBYA1c60NicKYF+gpRxZgOksjRsmGClBY5qLXtXB6LAMGQErMEWVM8HTo
   E10J+LW4j5MQmob6FHIOFiuy9hvuPSK8ZGOgoa9ifhohdyfECL3Nsbild
   M512qgw9reVRAtRaHNQooeaobipGfVvX/mvrIiaEIzczGXwv2wuWID4of
   OyxPq3VAuEVlVP4JvDHatn1gtPxten6y/VfX+kCeFfMkQ8vwuAXZ5cpyD
   29hqAOFWYeUujR6HMYyqzp46/RGhCZN/qHWcwABNgrcfvArPMUzd2TTkv
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="312016160"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="312016160"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 14:55:00 -0700
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="724025210"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 14:54:56 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id DBCF220282;
        Tue, 19 Jul 2022 00:54:53 +0300 (EEST)
Date:   Mon, 18 Jul 2022 21:54:53 +0000
From:   "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Sean Young <sean@mess.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        paul.kocialkowski@bootlin.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
Message-ID: <YtXWrUJ87Fuu4m1V@paasikivi.fi.intel.com>
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jul 15, 2022 at 10:15:04AM +0200, Hans Verkuil wrote:
> Hi all,
> 
> The Linux Foundation organized a meeting room for us to use on Monday
> September 12 at the Convention Centre Dublin.  It is co-located with the
> Open Source Summit Europe, see
> https://events.linuxfoundation.org/open-source-summit-europe/ for more
> info.

I'd like to attend.

-- 
Sakari Ailus
