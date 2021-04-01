Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4BA351A87
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235652AbhDASBx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236793AbhDAR6k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:58:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC77C0225A8;
        Thu,  1 Apr 2021 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Kha/E3uhoOiUrD0C/aeRnYYOJ8L7PhbQTFEePWXTQ9o=; b=GiF2UwUHIZnHkEkOlcxLLgluR7
        syNox8h+RaBbuIUiOBghBF3CDGQNuaIbRzy7mWDoxwenL11iVarDDi6MmiRxTFuHb4kP13LZvn2f6
        35thsXdGlyCG8MGNauINAug1BzBEFT4pbD4wIwaSunIPgfbfA8chATkAqldy2DO/PybrFImdLg0wO
        mNCslbxOAuh01cjc+scg0jSBhcVB/IKtD58/f7a4sI5WIyiXdtrZHuStvqjyjgZ+eAffpU+zYNZVS
        Hu1zZPxQtOxOmhNtAXhJ8AFMfHi/hVJ78H7v36FIrf0oQO/kkb9wcbdYgR1IsDDx2zA9fDFxDwcsV
        kRF2tr4g==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lRzFU-006IH7-5h; Thu, 01 Apr 2021 15:28:46 +0000
Date:   Thu, 1 Apr 2021 16:28:44 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH 1/2] staging: media: omap4iss: Ending
 line with argument
Message-ID: <20210401152844.GF351017@casper.infradead.org>
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
 <441d27060ff6477d0ad418f41e194b96373c1f7f.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <441d27060ff6477d0ad418f41e194b96373c1f7f.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 01, 2021 at 04:07:38PM +0100, Beatriz Martins de Carvalho wrote:
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index dae9073e7d3c..e8f724dbf810 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -559,9 +559,10 @@ static int iss_reset(struct iss_device *iss)
>  	iss_reg_set(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG,
>  		    ISS_HL_SYSCONFIG_SOFTRESET);
>  
> -	timeout = iss_poll_condition_timeout(
> -		!(iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG) &
> -		ISS_HL_SYSCONFIG_SOFTRESET), 1000, 10, 100);
> +	timeout = iss_poll_condition_timeout(!(iss_reg_read(iss,
> +							    OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG)
> +							    & ISS_HL_SYSCONFIG_SOFTRESET),
> +							    1000, 10, 100);

This is not a readability improvment.  I would factor it out into its
own function.

