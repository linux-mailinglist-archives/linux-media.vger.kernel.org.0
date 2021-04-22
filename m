Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993F53687DC
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 22:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236949AbhDVU0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 16:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236896AbhDVU0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 16:26:49 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A57C06174A
        for <linux-media@vger.kernel.org>; Thu, 22 Apr 2021 13:26:14 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi [84.251.93.176])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 956FE20179;
        Thu, 22 Apr 2021 23:26:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1619123168;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s6aPF3t1KGoolHSoZc4SQi+uey9sXCnUqT8wQsB61lo=;
        b=pb4waZOLuBZpqRv4bhOEx4lONvvta5nnYOGbWlEnqYZ1HV/HZ4QBYXZM09F/MfYQAo/2IB
        tw6JRNTkzS+RJNSPMZhZzU54V83kHFTZyqGTWjnkKww7VsZvc0uE2X6tZgiV6h6S3WfPRO
        4lrrxQ2r6uFhKhlfbGCpAUm+d9il8u0=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E73FA634C87;
        Thu, 22 Apr 2021 23:24:36 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lZfto-0003jK-NS; Thu, 22 Apr 2021 23:26:08 +0300
Date:   Thu, 22 Apr 2021 23:26:08 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bernhard Wimmer <be.wimm@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ccs: Fix the op_pll_multiplier address
Message-ID: <20210422202608.GN3@valkosipuli.retiisi.eu>
References: <20210421213320.4454-1-be.wimm@gmail.com>
 <20210421213320.4454-2-be.wimm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421213320.4454-2-be.wimm@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1619123168; a=rsa-sha256; cv=none;
        b=ekXaMRYSSLWs4K4KIcGD5fKSJEEtnHKbfC00XQRUBEFvgHO76sJItcFe9pgAodIgPnwuSx
        owf0VDulQM7Lp7BmZC0RTBF7s3JOfIatofh8983O7+GnO+d4PmdMtkrOIRDhqAxfkIX94V
        LIKSuLF5TMTKDgvNQlF8uZoHfTJ4I1s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1619123168;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s6aPF3t1KGoolHSoZc4SQi+uey9sXCnUqT8wQsB61lo=;
        b=Dycls3Vif7j3Yy+nReCI/majEQ5wqbMuRbjt+phebqa3UovEVPqoC+euuQrF9kDdVZjrfL
        ntvmEHUZQFYKbf8sS99ytay7mQui86z15/FkPL5NL3ZfoPl0v4XifCeb0RAvhE9hf+GUzv
        /jwgc3NISUb5FUPKWsv1v1MteWdwVYA=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 11:33:20PM +0200, Bernhard Wimmer wrote:
> According to the CCS spec the op_pll_multiplier address is 0x030e,
> not 0x031e.
> 
> Signed-off-by: Bernhard Wimmer <be.wimm@gmail.com>

Thanks, Bernhard!

I've added these two tags to the patch, to get it merged to the stable
kernels:

Cc: stable@vger.kernel.org
Fixes: 6493c4b777c2 ("media: smiapp: Import CCS definitions")

-- 
Sakari Ailus
