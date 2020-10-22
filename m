Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2AA296071
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506512AbgJVNyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:54:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:35032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2443322AbgJVNyT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:54:19 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D64E22275;
        Thu, 22 Oct 2020 13:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603374859;
        bh=k/96McXBUQrMgM4y/fJNrw43hXeNtSxVU6BUe2aasrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JfhNMyMoeo79vFKGh2kPdEK6Z9KBVoCnHEiWkZoBbSOYVIyDiVjzohSe9tyINoAEu
         oQ0dY0PKFot074Qy8U0+2w1ZtMNyp1HRdU4TTmBWVu4+9DC+f2dCt3amempuKh7ErT
         xcK5tj42W5UNWipPg8217GvuzCo3QQf1TRVGoBfQ=
Date:   Thu, 22 Oct 2020 15:54:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, outreachy-kernel@googlegroups.com,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, melissa.srw@gmail.com,
        linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH 4/5] gpu: drm: amdgpu: Replace
 snprintf() with sysfs_emit()
Message-ID: <20201022135455.GA1788090@kroah.com>
References: <cover.1603371258.git.sylphrenadin@gmail.com>
 <f6107f3e467f1906abdcc33d35f13cf54f7e5a96.1603371258.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6107f3e467f1906abdcc33d35f13cf54f7e5a96.1603371258.git.sylphrenadin@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 22, 2020 at 07:17:56PM +0530, Sumera Priyadarsini wrote:
> Using snprintf() for show() methods holds the risk of buffer overrun
> as snprintf() does not know the PAGE_SIZE maximum of the temporary
> buffer used to output sysfs content.
> 
> Modify amdgpu_psp.c to use sysfs_emit() instead which knows the
> size of the temporary buffer.
> 
> Issue found with Coccinelle.
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index d6c38e24f130..4d1d1e1b005d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -2621,7 +2621,7 @@ static ssize_t psp_usbc_pd_fw_sysfs_read(struct device *dev,
>  		return ret;
>  	}
>  
> -	return snprintf(buf, PAGE_SIZE, "%x\n", fw_ver);
> +	return sysfs_emit(buf, PAGE_SIZE, "%x\n", fw_ver);

Did you build this code?  I don't think it is correct...

thanks,

greg k-h
