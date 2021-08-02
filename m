Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EABD3DDC8A
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 17:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234974AbhHBPgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 11:36:48 -0400
Received: from mga06.intel.com ([134.134.136.31]:45034 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233939AbhHBPgs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 11:36:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="274541762"
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; 
   d="scan'208";a="274541762"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 08:36:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; 
   d="scan'208";a="418704479"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 08:36:35 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 8870C2036B;
        Mon,  2 Aug 2021 18:36:33 +0300 (EEST)
Date:   Mon, 2 Aug 2021 18:36:33 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: restore missing 'return' statement
Message-ID: <20210802153633.GN3@paasikivi.fi.intel.com>
References: <20210802143820.1150099-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802143820.1150099-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 02, 2021 at 04:38:14PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The input_system_configure_channel_sensor() function lost its final
> return code in a previous patch:
> 
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
> drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
> 
> Restore what was there originally.
> 
> Fixes: 728a5c64ae5f ("media: atomisp: remove dublicate code")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
