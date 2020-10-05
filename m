Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF37828327B
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 10:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgJEItF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 04:49:05 -0400
Received: from mga04.intel.com ([192.55.52.120]:64418 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbgJEItF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Oct 2020 04:49:05 -0400
IronPort-SDR: uGqchOwkkklW18mwUVMcEfMwBogu42Fes3tt+3VBsoX9WmLasEjfx/GztLD7TqgKp2igAozXaI
 nqD9+C9sSpKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="160739423"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="160739423"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2020 01:48:58 -0700
IronPort-SDR: UPd8fX2UVZGZuWU587nv6Y5qXeQGSdpctqkoRfk2qW9uO47f/ntw6qFjqksYNiLg5cgddKIsE+
 j4TNDqJjK8VA==
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="515922828"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2020 01:48:54 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 741AF205CA; Mon,  5 Oct 2020 11:48:52 +0300 (EEST)
Date:   Mon, 5 Oct 2020 11:48:52 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
Message-ID: <20201005084852.GD26842@paasikivi.fi.intel.com>
References: <20201004122234.802044-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004122234.802044-1-acourbot@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexandre,

On Sun, Oct 04, 2020 at 09:22:34PM +0900, Alexandre Courbot wrote:
> The addition of MT8183 support added a dependency on the SCP remoteproc
> module. However the initial patch used the "select" Kconfig directive,
> which may result in the SCP module to not be compiled if remoteproc was
> disabled. In such a case, mtk-vcodec would try to link against
> non-existent SCP symbols. "select" was clearly misused here as explained
> in kconfig-language.txt.
> 
> Replace this by a "depends" directive on at least one of the VPU and
> SCP modules, to allow the driver to be compiled as long as one of these
> is enabled, and adapt the code to support this new scenario.
> 
> Also adapt the Kconfig text to explain the extra requirements for MT8173
> and MT8183.
> 
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks for the patch!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I wonder if this driver suffers from similar object lifetime management
issues than V4L2 and MC do, albeit not related to either. Say, what happens
if you unbind the other device while mtk-vcodec is in use?

-- 
Regards,

Sakari Ailus
