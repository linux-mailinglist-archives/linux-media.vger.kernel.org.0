Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A322735FCE0
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 22:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhDNU4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 16:56:06 -0400
Received: from mga04.intel.com ([192.55.52.120]:1590 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhDNU4C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 16:56:02 -0400
IronPort-SDR: bX1T2EYldIQnq8pAMtFgqYsd9Pkj2gIt4LE7Vc3bfvxdM84f3ka5BRiMgGGXeB8RZEcN3KnhVR
 IE0wqdy1bt7g==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="192608322"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="192608322"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 13:55:38 -0700
IronPort-SDR: GLbey1GVBxh6cFzkyqokGMnywWDiujcWnFN8IJe7X1O8DersDr8SwtrvA0l7w2rgJTtazkNAlL
 nB1uyaqUTqGg==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="443946283"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 13:55:36 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 53E4A204F8;
        Wed, 14 Apr 2021 23:55:34 +0300 (EEST)
Date:   Wed, 14 Apr 2021 23:55:34 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH v2] staging: media: atomisp: pci: Format comments
 according to coding-style in file atomisp_cmd.c
Message-ID: <20210414205534.GF3@paasikivi.fi.intel.com>
References: <20210414204244.GA8287@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414204244.GA8287@focaruja>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 14, 2021 at 05:42:44PM -0300, Aline Santana Cordeiro wrote:
> Format all comments according to the coding-style.
> Issue detected by checkpatch.pl.
> 
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
