Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA7420772D
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 17:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404590AbgFXPRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 11:17:02 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47345 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404301AbgFXPRC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 11:17:02 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id o78xjhxqrNb6lo790jtpED; Wed, 24 Jun 2020 17:16:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593011820; bh=jyWXSdrvQ+K1W5uN74FxiSFf3+Bnyjhw65V0wYj/fAI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HIuiKyZ6DcYIYdgAQ3nl9u2grQWrlLYo0ql8stqyDBH62ttmUf1WHezeQhr/D5+P9
         VreVW08lQr+Tm527n7HUMyf+ZyfKLVTLNgPrTM43BwMlXZ0Khniq/5QqTLToQOyB7x
         taZQ7HLUpbZQkLTrIvH87f5Q+8O2lZ64tvyRMUAWoZFQgIW9e6g2AFITbietQI4CZK
         wtnHuGeekKKRr+eR8YeGd/h1pLm4JMvKwc2HG983YraBYxgybSNSOujTa7WgOHoajv
         GU4PBV+cHi6LwYTV4b/c8A74fffbwx4Pmyez3cK8f6Ma3PNyFQO62o/j2cHqyhSZYy
         PEAaZBRxs5+zw==
Subject: Re: [PATCH v2 0/4] Tegra Video Decoder driver power management
 corrections
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20200624150847.22672-1-digetx@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <90323aa6-38b5-0a45-69a7-ccf380690a78@xs4all.nl>
Date:   Wed, 24 Jun 2020 17:16:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624150847.22672-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNw6j5csn8oqIJl3z+qis7VF7oRJPzz79BJW74oAFalH/aIvPn0jqVXkIF5gx+CKI8CK2JDqe2xT7iBsMGfE+F8gkgsSKP2cphCliwnqLfqQc73mcWAy
 To9YZnahMnLq3OTsjxebN4xXu6ENQCxPDYXVa2v6/NYGC8nzOl3OF+iX0wajxUSzEEVCn4jmbo5N2Kq3Ipluh5jHHhM5D84rD6/DxLaHGYFTsg8KdiBG3FAw
 NIVlW3O+FItHGlrUOhOOuKsh8ebJQJZ6vDmCP+IsDR+qA+I3HmYuiky89lgOXWcGp55KAHn7LW+BNfUD23+oib/Fi7BF3TpiRb2uT9q+LFrFH/707hKH4ROd
 URlbLajmKW9SeJOp1q54KZ9926WN8+Bzr0ZxO5fw5ylzHY1c5I4gpoqtl4CvesccHErz7iem
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/06/2020 17:08, Dmitry Osipenko wrote:
> Hello,
> 
> This small series addresses a Runtime PM issue that was discovered during
> of Tegra VI driver reviewing by balancing RPM usage count on RPM resume
> failure. Secondly it fixes reboot on some Tegra devices due to bootloader
> expecting VDE power partition to be ON at the boot time, which wasn't
> happening in case of a warm re-booting (i.e. by PMC resetting).

Can you rebase this on top of the media_tree master branch? I think a variant
of patch 1 has already been applied. I found a mail today where you mentioned
that you preferred your version (it looks like I missed that) so you'll need to
rework patch 1.

Sorry about this,

	Hans

> 
> Changelog:
> 
> v2: - Extended the commit's message of the "Balance runtime PM use-count on
>       resume failure" patch.
> 
>     - Re-send for 5.9 inclusion.
> 
> Dmitry Osipenko (4):
>   media: staging: tegra-vde: Balance runtime PM use-count on resume
>     failure
>   media: staging: tegra-vde: Runtime PM is always available on Tegra
>   media: staging: tegra-vde: Turn ON power domain on shutdown
>   media: staging: tegra-vde: Power-cycle hardware on probe
> 
>  drivers/staging/media/tegra-vde/vde.c | 45 +++++++++++++++++----------
>  1 file changed, 29 insertions(+), 16 deletions(-)
> 

