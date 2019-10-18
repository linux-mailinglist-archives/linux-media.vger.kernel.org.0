Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBBD3DCCE2
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2019 19:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505566AbfJRReI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 13:34:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:13186 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502519AbfJRReH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 13:34:07 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Oct 2019 10:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; 
   d="scan'208";a="226608579"
Received: from wittejoe-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.249.39.3])
  by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2019 10:34:05 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id CB48321E76; Fri, 18 Oct 2019 20:30:42 +0300 (EEST)
Date:   Fri, 18 Oct 2019 20:30:42 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Don't use __u32 internally
Message-ID: <20191018173042.GA3712@kekkonen.localdomain>
References: <20191018153140.594-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018153140.594-1-jmkrzyszt@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 18, 2019 at 05:31:40PM +0200, Janusz Krzysztofik wrote:
> Commit a8fa55078a77 ("media: v4l2-subdev: Verify arguments in
> v4l2_subdev_call()") and commit 374d62e7aa50 ("media: v4l2-subdev:
> Verify v4l2_subdev_call() pad config argument") introduced a few local
> functions, unfortunately with arguments of type __u32, reserved for use
> in Linux uAPI.  Use u32 instead.
> 
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
