Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA1CE98B4
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 10:02:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfJ3JCt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 05:02:49 -0400
Received: from mga14.intel.com ([192.55.52.115]:59799 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726184AbfJ3JCt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 05:02:49 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 02:02:49 -0700
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; 
   d="scan'208";a="198619528"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 02:02:48 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 52D2A208A0; Wed, 30 Oct 2019 11:02:46 +0200 (EET)
Date:   Wed, 30 Oct 2019 11:02:46 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Shawnx Tu <shawnx.tu@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com
Subject: Re: [PATCH v2] hi556: Add support for Hi-556 sensor
Message-ID: <20191030090246.GF10211@paasikivi.fi.intel.com>
References: <1572426306-6997-1-git-send-email-shawnx.tu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572426306-6997-1-git-send-email-shawnx.tu@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

On Wed, Oct 30, 2019 at 05:05:06PM +0800, Shawnx Tu wrote:

...

> +enum {
> +	HI556_LINK_FREQ_874MBPS,

Did you see my comments on v1 on the naming?

...

> +static const char * const hi556_test_pattern_menu[] = {
> +	"Disabled",
> +	"Solid Colour",
> +	"100% Colour Bars",
> +	"Fade To Grey’ Colour Bars",

"'" is extra.

...

> +static int hi556_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct hi556 *hi556 = to_hi556(sd);
> +
> +	mutex_lock(&hi556->mutex);
> +	hi556_update_pad_format(&supported_modes[0],
> +				 v4l2_subdev_get_try_format(sd, fh->pad, 0));

The function assigns the given driver specific format to the mbus format
struct. How about calling it e.g. hi556_assign_pad_format() instead?

Also see my comments on v1 to this.

-- 
Regards,

Sakari Ailus
