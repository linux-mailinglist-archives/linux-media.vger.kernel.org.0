Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3881D974DF
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 10:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfHUIY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 04:24:59 -0400
Received: from mga14.intel.com ([192.55.52.115]:7940 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726541AbfHUIY7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 04:24:59 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Aug 2019 01:24:58 -0700
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; 
   d="scan'208";a="353873747"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Aug 2019 01:24:56 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A62C520D2D; Wed, 21 Aug 2019 11:24:54 +0300 (EEST)
Date:   Wed, 21 Aug 2019 11:24:54 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     linux-media@vger.kernel.org, akinobu.mita@gmail.com,
        hverkuil@xs4all.nl, bparrot@ti.com
Subject: Re: [PATCH 3/4] pxa-camera: Match with device node, not the port node
Message-ID: <20190821082454.GB31967@paasikivi.fi.intel.com>
References: <20190305135602.24199-1-sakari.ailus@linux.intel.com>
 <20190305135602.24199-4-sakari.ailus@linux.intel.com>
 <87d0gzj7wc.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d0gzj7wc.fsf@belgarion.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Wed, Aug 21, 2019 at 09:26:59AM +0200, Robert Jarzmik wrote:
> Sakari Ailus <sakari.ailus@linux.intel.com> writes:
> 
> > V4L2 fwnode matching right now still works based on device nodes, not port
> > nodes. Fix this.
> Mmmh why does it need a fix, and what's wrong on device node matching ? This
> commit message is a bit too brief for me to understand why a fix is needed.

The V4L2 async framework matches the async sub-devices based on their
device nodes on fwnode matching which is used on DT-based systems. If a
port node is provided instead, there won't be a match.

> 
> Moreover, does it have an impact on
> Documentation/devicetree/bindings/media/pxa-camera.txt ?

The bindings are fine.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
