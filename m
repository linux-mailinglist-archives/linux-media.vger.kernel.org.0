Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573542975C1
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 19:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753430AbgJWR15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 13:27:57 -0400
Received: from mga04.intel.com ([192.55.52.120]:41726 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753423AbgJWR15 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 13:27:57 -0400
IronPort-SDR: DBGqSm2V+xhfI4GTirlBmDRT7WcD6MdDM+eT5UVRZKYY/RUgO8VtW6XX2OhhOFXbwRc54FQsZw
 qbp2+oIFjmpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="165116239"
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; 
   d="scan'208";a="165116239"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2020 10:27:56 -0700
IronPort-SDR: 1kVXpkMxato4KyiDoDyQk9vABZLEsZZcfmHWZYXBHrhlYCCRxUaf73r7zINuiBUEBrld2bX5rm
 fpKPTFxMikuQ==
X-IronPort-AV: E=Sophos;i="5.77,409,1596524400"; 
   d="scan'208";a="321804002"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2020 10:27:52 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 92AF92030F; Fri, 23 Oct 2020 20:27:50 +0300 (EEST)
Date:   Fri, 23 Oct 2020 20:27:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Abylay Ospan <aospan@netup.ru>, Antti Palosaari <crope@iki.fi>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rahul Gottipati <rahul.blr97@gmail.com>,
        Sergey Kozlov <serjk@netup.ru>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Tomasz Figa <tfiga@chromium.org>, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 15/56] media: fix kernel-doc markups
Message-ID: <20201023172750.GN2703@paasikivi.fi.intel.com>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <8eb0e3f5a47cfa412c1004f850ef092011d1a45f.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eb0e3f5a47cfa412c1004f850ef092011d1a45f.1603469755.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks, Mauro!

On Fri, Oct 23, 2020 at 06:33:02PM +0200, Mauro Carvalho Chehab wrote:
> Some identifiers have different names between their prototypes
> and the kernel-doc markup. Seome seems to be due to cut-and-paste
> related issues.
> 
> Others need to be fixed, as kernel-doc markups should use this format:
>         identifier - description
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On IPU3 and V4L2 bits:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus
