Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDB23519B1
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbhDARz6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:55:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:54734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235363AbhDARxB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Apr 2021 13:53:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01DD06136E;
        Thu,  1 Apr 2021 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617290750;
        bh=hSu9uPH/Hw+DB94jZx4GKfdEPdzNMr1RIWzL7XlHirQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zO7z16H+9N64eLC2bU+ASReX0/QjnbtEVOy2Yo8uvuMCmm7Kax84+fHsbRPt1enXB
         Cye2XqDtzeiCzAn5MVf5cpDYxQoV7ayTe4WZzBwpIlBn5Y9Vtb8asIea9xpQ+Ekboa
         DiLbSwN41mcAozYQpeezOnVy2dtRM7abhcg/L8dc=
Date:   Thu, 1 Apr 2021 17:25:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH 0/2] staging: media: omap4iss: Patchsets cleans up in
 iss.c
Message-ID: <YGXl+0iLgnVL2jkt@kroah.com>
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 01, 2021 at 04:07:37PM +0100, Beatriz Martins de Carvalho wrote:
> Clean up checks of "Alignment should match open parenthesis" and 
> "CHECK: Lines should not end with a '('" in iss.c
> 
> Beatriz Martins de Carvalho (2):
>   staging: media: omap4iss: Ending line with argument
>   staging: media: omap4iss: align arguments with open parenthesis
> 
>  drivers/staging/media/omap4iss/iss.c | 48 +++++++++++++---------------

Please read the outreachy introduction email again :(

thanks,

greg k-h
