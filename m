Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00FC34316CE
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 13:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhJRLHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 07:07:22 -0400
Received: from mga02.intel.com ([134.134.136.20]:43930 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229519AbhJRLHW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 07:07:22 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="215389459"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="215389459"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 04:05:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="462289320"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 04:05:07 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mcQRl-00025D-6H;
        Mon, 18 Oct 2021 14:04:49 +0300
Date:   Mon, 18 Oct 2021 14:04:49 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
Message-ID: <YW1U0UtNpA9DYZ56@smile.fi.intel.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 18, 2021 at 01:19:40AM +0900, Tsuchiya Yuto wrote:

Just a remark, your To is not filled. At some point I had written a script [1]
to help me with patch series sending, It also tries to be smart to include
necessary people and mailing lists (you can always alter it by adding more).
[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko


