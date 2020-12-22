Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9732E083D
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 10:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgLVJpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 04:45:11 -0500
Received: from mga11.intel.com ([192.55.52.93]:47324 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbgLVJpK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 04:45:10 -0500
IronPort-SDR: YKGszhnq6DbDb1FCHSN/iNSBBvQv4H4YsB3wOWCVejd4vByPlpMFrnpx4VrrTpyLCWwvnMYvuQ
 T4Fe30u3yFfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="172335050"
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; 
   d="scan'208";a="172335050"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2020 01:43:24 -0800
IronPort-SDR: UJw+mmGPgufrv8XuhlBtM0U7qboRtCg4E9oEnuAZ2TepR+h9Wx478S4D78MB3c9iOAHF65XPJA
 sd5x8w1Ew2qA==
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; 
   d="scan'208";a="492132540"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2020 01:43:21 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 38707205FC; Tue, 22 Dec 2020 11:43:19 +0200 (EET)
Date:   Tue, 22 Dec 2020 11:43:19 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 01/30] dt-bindings: media: i2c: Rename ov5647.yaml
Message-ID: <20201222094319.GR26370@paasikivi.fi.intel.com>
References: <20201119161956.756455-1-jacopo@jmondi.org>
 <20201119161956.756455-2-jacopo@jmondi.org>
 <20201125091526.GI3940@paasikivi.fi.intel.com>
 <20201221173446.z7mtvasohwyjukdp@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201221173446.z7mtvasohwyjukdp@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Dec 21, 2020 at 06:34:46PM +0100, Jacopo Mondi wrote:
> Hello,
> 
> On Wed, Nov 25, 2020 at 11:15:26AM +0200, Sakari Ailus wrote:
> > Cc Rob + DT list.
> >
> 
> Gentle ping.
> 
> Sakari, am I mistaken or last time we discussed this, the series is
> ready for being collected (pending this ack I assume)
> 
> I wonder if it needs a rebase (pretty sure it does)

The set is in my tree already.

-- 
Sakari Ailus
