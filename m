Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56B62D3F33
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 10:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbgLIJwi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 04:52:38 -0500
Received: from mga02.intel.com ([134.134.136.20]:25777 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728504AbgLIJwi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Dec 2020 04:52:38 -0500
IronPort-SDR: QyfpGewZpMlyb0dSmfIrsaoohGgw48rfVetoGuvRMqD52+S+Loh4sVJolh7Wc7gsCdvPJ/QzCx
 A1/nmR3ZYoNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="161102854"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="161102854"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 01:50:51 -0800
IronPort-SDR: qwNuumCrCFLgqV0riMObJkx+LwSH6fP4Vsz3NfAHlfChMTmE5pddVVy+/zM7Sfcu/PB9I2NiWD
 mso/fMIqURzw==
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="483954453"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 01:50:50 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7A0442067A; Wed,  9 Dec 2020 11:50:48 +0200 (EET)
Date:   Wed, 9 Dec 2020 11:50:48 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: ccs: Remove uninitialized, unused variable
Message-ID: <20201209095048.GG25763@paasikivi.fi.intel.com>
References: <X9B0NIm4Iv4uFlkT@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9B0NIm4Iv4uFlkT@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Wed, Dec 09, 2020 at 09:52:36AM +0300, Dan Carpenter wrote:
> The "reg" value isn't used any more but it's still printed in the
> debug code.  Delete it.
> 
> Fixes: fd9065812c7b ("media: smiapp: Obtain frame descriptor from CCS limits")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for the patch. This has been already fixed by another patch:

<URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201203222828.1029943-1-arnd@kernel.org/>

-- 
Sakari Ailus
