Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCC93150A5
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 14:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhBINpj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 08:45:39 -0500
Received: from lahtoruutu.iki.fi ([185.185.170.37]:51034 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbhBINnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 08:43:37 -0500
Received: from hillosipuli.retiisi.eu (dbd4xkyj7wcfw2k22jcct-3.rev.dnainternet.fi [IPv6:2001:14ba:8f1:3400:fb90:892b:22d6:3885])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 69E421B00107
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 15:42:50 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1612878170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=J7CAsJ7LT4/hO00gmjdPpEclkZGwO+X/rhBP6PwE93M=;
        b=OczqD64IPR7Kk+CSOu8HNXtmiO/m7Q0B9yPfZoug3ayeHj/k4xhtT4jI6D8A7AZ5/GDFBG
        K/pb9wQcDEkk7AUNZMIeIrUPwIC8u04TccxGbsjeCZ3XzrgXseAW1NSj2dtCu+538OIFFq
        Vazy/YcLSMsEQoAv7LcBech79Lz/4yan7ZA3EfVFAxd5JbY++QcNnerRMkJY7SXUjYbGht
        cQerBbiey3R1K78sHDcWlUUJRNP+qVKG0IHPaZNQasLMHgVG3UE43zaciP5BsgWqC1FEju
        zCifqpBtMmTldNCNg0+IDwCESjaBxGnSvAbuAozYxWX7/Ynas1vFpRSF2+myHw==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E016B634C93
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 15:42:14 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l9THz-0005Cn-PG
        for linux-media@vger.kernel.org; Tue, 09 Feb 2021 15:42:47 +0200
Date:   Tue, 9 Feb 2021 15:42:47 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.12] IMX334 fix
Message-ID: <20210209134247.GH3@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1612878170; a=rsa-sha256;
        cv=none;
        b=P9qJKv5zQedu81j+k3GEgqvB/AFzKobGYjVEou+hLOoStoFHbQBKD/m+zZcs5kqszarc1/
        cogyavTKi5GxeosJ72NVX4gLjkiSkYwZfFkTiBwtCeqeSgcFqHbVsGvtX7m29WSHe2ubaJ
        Or7Dysmfyu9mQc0+1fdkTR36jYZ4hTa6tjNeQharRcw0R1nyL14eRPE74DiEmTlm6HdCD6
        iOPEE73oiWB7+vt7Pq3WAUR4fCeydEB5zXWvLA+BI/1g675p+4LwBtbezNhU0uIpsrgYvf
        IcAF18U1nfPUZSZqPUhB7xfiELGzid61c4zRmB5jWJfgoIOsiwbVlUlXWb/WVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1612878170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=J7CAsJ7LT4/hO00gmjdPpEclkZGwO+X/rhBP6PwE93M=;
        b=EfuVBFvJINNSY/iFUt/HLt6NuxsdXnKvEKozSictxGcPFz8xrpj4KEzMWxRPN/+0715rYF
        RAAZQoyC8CMgeJoFBivKsxfgpeRZA9EkHC5hQcOVxBSCEsIbWgfpKcIqqvH0ztCj7Fj8D1
        M4r8a2p3xi3nRdU7EQ2Ngjb2WSR1D/OMeEuZofS6ZKhmjYO9ltJSmP4uNWbSDP+NxtYDbz
        EA7w+dX3XVzQ8LsFF6vgC8HAcBZHFa801/P3XTV77EY7QerXAoqgRDpuoStOgmi7yHhE9c
        Nesykrl8fT7+WmW+O8jatJo9Y0CIEMr4+Gv9c9OZvEluj92Bai/CQ4mGwoA2Rg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a fix for the IMX334 driver compiler warning.

Please pull.


The following changes since commit 9746b11715c3949241e2d88cb9057da4adab7e02:

  media: i2c: Add imx334 camera sensor driver (2021-02-06 09:42:24 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.12-6-signed

for you to fetch changes up to 0ea9940a83734f698c2bfe77794b4f257d872b44:

  imx334: 'ret' is uninitialized, should have been PTR_ERR() (2021-02-08 14:17:02 +0200)

----------------------------------------------------------------
IMX334 fix

----------------------------------------------------------------
Hans Verkuil (1):
      imx334: 'ret' is uninitialized, should have been PTR_ERR()

 drivers/media/i2c/imx334.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
Sakari Ailus
