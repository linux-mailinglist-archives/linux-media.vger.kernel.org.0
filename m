Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCFB2305AC
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 10:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgG1Ins (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 04:43:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:59296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727950AbgG1Ins (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 04:43:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 98F10206F5;
        Tue, 28 Jul 2020 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595925828;
        bh=xG2EtA52/LnnPqDmfRptDJ0EcKmjdNqZ9O7JBN2Bl5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UHGo3rcdXuUAckRTYIGWR14g3x+Nhb26N+wf2u8qpj/A2vl8HSwzsz6J5fWcbu/Tn
         mtZ4Hiv/3Kk2W+XS//f9vC8GRZTkotu16D+POrulNGfFkKIlDNsJ9ECcrsdzIDsHXM
         mQvCZPPECXvErNAMYgaLuITzhuuxl7z05ZIkYKpw=
Date:   Tue, 28 Jul 2020 10:43:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ankit <b18007@students.iitmandi.ac.in>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Staging : media : atomisp : fixed a brace coding
 sytle issue
Message-ID: <20200728084341.GA1795795@kroah.com>
References: <20200728073715.GA351768@kroah.com>
 <20200728082330.24948-1-b18007@students.iitmandi.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728082330.24948-1-b18007@students.iitmandi.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 28, 2020 at 01:53:30PM +0530, Ankit wrote:
> From: Ankit Baluni <b18007@students.iitmandi.ac.in>
> 
> Removed braces for a 'if' condition as it contain only single line & 
> there is no need for braces for such case according to coding style
> rules.
> 
> Signed-off-by: Ankit Baluni <b18007@students.iitmandi.ac.in>
> 
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

What changed from v1?

Always put that below the --- line as the documentation asks for.

thanks,

greg k-h
