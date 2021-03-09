Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7582331B95
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 01:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhCIAUm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 19:20:42 -0500
Received: from ms.lwn.net ([45.79.88.28]:43152 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231246AbhCIAUa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Mar 2021 19:20:30 -0500
X-Greylist: delayed 1633 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Mar 2021 19:20:30 EST
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CFEF92B0;
        Tue,  9 Mar 2021 00:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CFEF92B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615249230; bh=aAJj+JuWRyhVw+3NtR9KNDnI/NEk/+8wsjAwCp0HeT0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=K9DjD/1XsyrFpPNYEeWehCq7kg/sUE7/Hs0svkg2KeXVtAbmEpW9dQdQaEhrdzCHf
         yKOp9D1XqeDooXtyfIvwNfAlNeQ/TARgvBbZhge2Tj0muy/46sgXfTKvLMKf3w9ys4
         k/1ghMYP+Sq/LKhEYqffuk8nwnl2q++fjc1g+4PHXsKG0oQDsAgkL8LPTFvebOxR+V
         g6izNcv3faf7+Af1MSeAkIIDxgWJ0/LylG4HXLy4szuHPDloriOnXOISW8L4i9D4GA
         tcdnsZcoFsNZ8JUrFDjT/pXxXybc+qnwALn114/LFCrbltvy55xKeozDWr0jaV2bCU
         nJo2FaC866oxQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: conf.py: adjust the LaTeX document output
In-Reply-To: <911fbac185dd09c7df715cf4153361b81f04b7ad.1614787053.git.mchehab+huawei@kernel.org>
References: <911fbac185dd09c7df715cf4153361b81f04b7ad.1614787053.git.mchehab+huawei@kernel.org>
Date:   Mon, 08 Mar 2021 17:20:29 -0700
Message-ID: <87o8ft41pu.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Changeset f546ff0c0c07 ("Move our minimum Sphinx version to 1.7")
> cleaned up some compatibility issues with previous Sphinx
> versions, but it also dropped the PDF margin sets.
>
> Without that, the media documentation won't build fine, as
> the margins are too wide to display texts with monospaced
> fonts.
>
> While here, align the  "latex_elements = {" values, and add
> a few other sphinxsetup configs in order to allow Sphinx to
> wrap long lines on literal blocks.
>
> Fixes: f546ff0c0c07 ("Move our minimum Sphinx version to 1.7")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
>  Documentation/conf.py | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)

Applied, thanks.

jon
