Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48ED2DAE4
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 12:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbfE2Kfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 06:35:50 -0400
Received: from mga14.intel.com ([192.55.52.115]:33325 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbfE2Kfu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 06:35:50 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 03:35:49 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2019 03:35:48 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 3CC692091F; Wed, 29 May 2019 13:35:47 +0300 (EEST)
Date:   Wed, 29 May 2019 13:35:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        mchehab@kernel.org, rajmohan.mani@intel.com
Subject: Re: [PATCH v2 1/4] staging: imgu: Address a compiler warning on
 alignment
Message-ID: <20190529103547.hdcaqhtyylprmr6n@paasikivi.fi.intel.com>
References: <20190301112400.24339-1-sakari.ailus@linux.intel.com>
 <20190301112400.24339-2-sakari.ailus@linux.intel.com>
 <20190527164440.qtx2qqqwm7dfdlhr@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527164440.qtx2qqqwm7dfdlhr@uno.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, May 27, 2019 at 06:44:41PM +0200, Jacopo Mondi wrote:
> Hi Sakari,
> 
> On Fri, Mar 01, 2019 at 01:23:57PM +0200, Sakari Ailus wrote:
> > Address a compiler warnings on alignment of struct ipu3_uapi_awb_fr_config_s
> > by adding __attribute__((aligned(32))) to a struct member of that type as
> > well.
> >
> 
> Sorry, just noticed there was a v2.
> 
> This is how we momentary worked it around in libcamera, so my tag on
> v1 also applies here too :)
> 
> Could I know why this is preferred compared to v1? Has the field to be
> actually 32 bytes aligned?

Not because of IPU3 DMA, but to maintain ABI compatibility. Technically
there's no strict need to do that as this is a staging driver. This patch
simply fixes the warning. Later on it'd be good to remove the alignment
where they are unnecessary.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
