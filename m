Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8161C2F435B
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 05:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbhAMEwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 23:52:21 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:50127 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725818AbhAMEwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 23:52:20 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 63A901A3A;
        Tue, 12 Jan 2021 23:51:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jan 2021 23:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=KSbPow1tbGIF8CqRnSvIZLOnJC
        bEgfYP0sDfURu8QeU=; b=LU6pslt2m+4sCBxdJw2m+IQhrj2N7lYspaebiMlyWR
        C3kbwzp3j6dFuisF4eJF16KofASYciPeIX+SockvAT/JTXGi92/63FfckCtjdZCc
        48PgcOtmxq2shv0YP1cvYO+FBiRemmeWavVuXcCUjlfFkD+q1lFns+LZ03vc2cz7
        RJzxuiE8SB3jFdBhSNgKotZRZNR6RU0N3lzcS4JH84qzQ81DLCjVShsVwlVFTegf
        KP7n/0XJ3zi88IdAyrjh1v+ouUs+zwy8ZA+RWld0oCGGSa4BCE72zpmWCRXuO2wA
        U3qDf7c3T3t2aPLTZNJV95KEpt/Az4yTaFGh1P4svf5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KSbPow1tbGIF8CqRn
        SvIZLOnJCbEgfYP0sDfURu8QeU=; b=YMdpSQhkDnHEDLnbvYq7gU4hqeLEvfQeO
        /JzKzJG/P/jZ4Ba2t7P2OK4RUtqtOpBlzvNGHGBPMpZes8Y2uogOIpylFveqnLeQ
        z2zR5Jg966D7Zn+WK3qwBZg0jKPO2Jbi62JJK3UTZjvNtp719DOKdp1k8Y1nKPP8
        xaLRwRcWW/N6WB8h3wOQUcLUNNBAR9GfnO/kLkOb8Z+3+JShbKW3mpbcVinhJADn
        RSoAWH2Ix042D3JmORCcw6BJeeLB/khgIhGCI2LZl/7u9hoRQnMj+eWDeSLTHYIC
        aumiIz6uLUBj8yzwpCA9u6dSxESHXBJZcLqsj/hHanKfaQ+Pa73+Q==
X-ME-Sender: <xms:VXz-X2U9Y7n3DARLDdLe6nMTjoNFOBrqcdbqMZJQbUDlem8s5ZSUKw>
    <xme:VXz-Xyn-e495hN2SVY-In7NGpfb9OL6ZcFv-5aAF34xS0QRvcvX4e7zXb_56N40ig
    BbJvLSNFoILu7Jm3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
    tdevnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdho
    rhhg
X-ME-Proxy: <xmx:VXz-X6ZlUFH632Vn_IK0H7v-WjReP1otA2eRLeIm7AIlKywykdl5ng>
    <xmx:VXz-X9XXecgfwyID98U54vSg5apFKzxjlTf8rx4WcMYuq4m_DwLcSw>
    <xmx:VXz-XwkIar4haP8O8QQyxOdNt4ohZOS4LItdjt0YHhQXyh0c9SZrQA>
    <xmx:Vnz-X-bF3jXIjNrns9pl8njURH9Z-4_usukA4kC86cE4GWTzADdcBQ>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id D246024005A;
        Tue, 12 Jan 2021 23:51:32 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 0/4] media: sunxi-cir: Cleanup and power management
Date:   Tue, 12 Jan 2021 22:51:28 -0600
Message-Id: <20210113045132.31430-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series cleans up some dead code in the sunxi-cir driver and adds
system power management hooks.

Samuel Holland (4):
  media: sunxi-cir: Clean up dead register writes
  media: sunxi-cir: Remove unnecessary spinlock
  media: sunxi-cir: Factor out hardware initialization
  media: sunxi-cir: Implement suspend/resume/shutdown callbacks

 drivers/media/rc/sunxi-cir.c | 167 ++++++++++++++++++++---------------
 1 file changed, 94 insertions(+), 73 deletions(-)

-- 
2.26.2

