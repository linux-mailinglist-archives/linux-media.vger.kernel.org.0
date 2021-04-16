Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFE83623A6
	for <lists+linux-media@lfdr.de>; Fri, 16 Apr 2021 17:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343598AbhDPPQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Apr 2021 11:16:48 -0400
Received: from mga03.intel.com ([134.134.136.65]:25932 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245588AbhDPPPd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Apr 2021 11:15:33 -0400
IronPort-SDR: Gdjz/MscIT6jkS96Z7DwYqEbOa4Jl1XNsar9ONqi3BEZbbIOWRoquK2+hbTRu1CmSJrYdZRpAu
 vsPtxVIReNEA==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="195078324"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="195078324"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 08:11:40 -0700
IronPort-SDR: gD+HARgaP/8+IxiIiDqhNNRH0dN5pEIEIH66ioabjBzs45wXUyIU7IiX9bng99/HTUgyGV+Zjf
 rmckrYyEuLag==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; 
   d="scan'208";a="601492104"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2021 08:11:39 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9CBED2057C;
        Fri, 16 Apr 2021 18:11:37 +0300 (EEST)
Date:   Fri, 16 Apr 2021 18:11:37 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martiros Shakhzadyan <vrzh@vrzh.net>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCHv2 0/2] staging: media: atomisp: cleaning up sh_css.c
Message-ID: <20210416151137.GP3@paasikivi.fi.intel.com>
References: <20210415214142.38974-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415214142.38974-1-vrzh@vrzh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 15, 2021 at 05:41:40PM -0400, Martiros Shakhzadyan wrote:
> The following set of patches for sh_css.c aims to resolve coding style
> issues and remove redundancies.
> 
> Martiros Shakhzadyan (2):
>   staging: media: atomisp: Fix sh_css.c brace coding style issues
>   staging: media: atomisp: Remove redundant assertions in sh_css.c
> 
>  drivers/staging/media/atomisp/pci/sh_css.c | 232 ++++++++-------------
>  1 file changed, 90 insertions(+), 142 deletions(-)

Thanks!

For the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
