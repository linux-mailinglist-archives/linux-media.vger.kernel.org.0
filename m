Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85CB02FFF80
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 10:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbhAVJoN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 04:44:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:37758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727582AbhAVJmQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 04:42:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E06323381;
        Fri, 22 Jan 2021 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611308493;
        bh=ECesVPcS/HIWEZfAdA/O3MXlnw9MPpIYj1PgFRvyz2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LJ2GSws0GTi8bk2C4bFtny6FgWkt89b2swGZKCfyhPWnK0E1IiFBd0CtjCM+NhzFJ
         whv1b/b61zKuSyBCSxIBNGXK4rU7mZrIotnVbXNfYc2RndOSQeEd5r+myvAeSNCaNe
         bDSGJ8Uqz7N+iTLBdARZ/EFVF6oAoVGd1+kzuteY=
Date:   Fri, 22 Jan 2021 10:41:30 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yang Li <abaci-bugfix@linux.alibaba.com>
Cc:     mchehab@kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] scsi: megaraid_sas: remove redundant NULL check
Message-ID: <YAqdyoZhHsDXoDOD@kroah.com>
References: <1611307424-109090-1-git-send-email-abaci-bugfix@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611307424-109090-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 22, 2021 at 05:23:44PM +0800, Yang Li wrote:
> Fix below warnings reported by coccicheck:
> ./drivers/scsi/megaraid/megaraid_sas_fusion.c:3924:3-8: WARNING: NULL
> check before some freeing functions is not needed.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>
> ---
>  drivers/scsi/megaraid/megaraid_sas_fusion.c | 3 +--

Please always use scripts/get_maintainer.pl to determine who to send
patches to, and what mailing list, otherwise they will just be ignored,
like this one :(

thanks,

greg k-h
