Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 098A35AD427
	for <lists+linux-media@lfdr.de>; Mon,  5 Sep 2022 15:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238192AbiIENlb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 09:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238237AbiIENl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 09:41:26 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C247B5281F
        for <linux-media@vger.kernel.org>; Mon,  5 Sep 2022 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662385283; x=1693921283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qkuLOgJgxR+lSMUKaXWvOXcQOjxpe7CnYloiwg4Qs2M=;
  b=lA07Ri7AgqBMVcTjd4epTZJComOUiaLFMh/7KgF9h+SDob/N1ypnrpgb
   /a+ne28GpSYQ8OIyTJqsAMBET4lzucsDEcAAOxFqK8QiogmL8ERgxPX22
   /7yF84BqR7b8UiM6dww4KPjFbN0fAWTvBDaU3C2pfPzPQM1DefHoULef0
   Q8gyMLnNcFjCG/Oe3RxJQJVIi712Xt5hiTthFldr4LEVo0shzNzuPCLLO
   b6/F2orvUD+HnyzsZ1lU3UX4K0P6LCyumPWZZgQJtNtEROZHtF8NVePE6
   2JMfgjyZy0T26MAGFRT67PqLQNybMl0yLNASQrD/2ahc3Om0DCIpgPFh0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="382690233"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="382690233"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 06:41:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="682069150"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 06:41:13 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 2656820188;
        Mon,  5 Sep 2022 16:41:11 +0300 (EEST)
Date:   Mon, 5 Sep 2022 13:41:11 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
Message-ID: <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> 16:45-18:00 Anything else?

I think it'd be great to have a GPG key signing party at the end of the
meeting.

-- 
Regards,

Sakari Ailus
