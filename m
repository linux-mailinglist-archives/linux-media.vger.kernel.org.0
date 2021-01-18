Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE192F99A5
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 07:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732470AbhARGCI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 01:02:08 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:41831 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732344AbhARGB6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 01:01:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id ED3801607;
        Mon, 18 Jan 2021 01:00:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 18 Jan 2021 01:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=8Qe4sI/K6zB+6w7BE9895+1hHz
        fJQfq/Z2GqA+EZKck=; b=Oh3CgmMA+hytzchcr4ZPpfL2Pn25rIQWOwxGc+53yA
        +s60A2yL35xZDlPjChWCuw7jQwhAqrGpAj18uepTaauuf4A3v/uc4mx5kMlkXtZO
        nG58PDsq4qD2rOw7+FyOm1NOuXDW5UHScDqYmIosv7/ALEiq8W3TZVi91Nd9Pbq/
        fUoCgi0nfhpXRXH7VXsRxQ4yxHKEImALiC8SBU4cvjsZAR43+APXbSo4EEN6g4Rl
        z6lkJq45HJgFMaX4ywt6d5iuFFHYwXrEkcLhNmSieF8bevVsgTjFmJn2KqGHnp+r
        w5PlTJOQ3clL+8PbgD5FwUwTZV6tt+wGdz2AZTmHd95g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8Qe4sI/K6zB+6w7BE
        9895+1hHzfJQfq/Z2GqA+EZKck=; b=X3nW+4JXr/WyKjYGkcHvLdpGS/t6UgW74
        oEWffvkf25lMqs/oNN9BAwla8FkazbgNEwzihVteKx0409vnC02kJMm7bSrODqw6
        VTVFwphLOzJ46bcYv/qrQhmCiXbTjjNog5cc6eVI4VLf19nE3jreWNP50LBBjpck
        NYImS66RSqGfkCDTz1jesjHvgk4I2CMqX17swSe2TvHYN4UtX980QLDRoZk0ux4v
        KIlBThxE4TPbGgXLyVA6j6m2svYBy1IAIL34lKuwdSQxGO3jacKIyh260OVTOjhZ
        n5cHI2B0QFXmJxbXzEsqIu7eHX3vRMalrDb6Eh85/1cl0LCXRppGg==
X-ME-Sender: <xms:ESQFYOvbZ1vzmKPWoJzx3eBeL_ErrSrX_wWsU3Y34PpYSu5WWM3vbA>
    <xme:ESQFYDZG5ykt8sF9ukXbQah0nGkoeH9Vq8p7BT1jjqegdELURjLEyzPHpf3x3RCys
    av2ta7iiI9MNycH5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
    tdevnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdho
    rhhg
X-ME-Proxy: <xmx:ESQFYGpees-ifAoQRKkW-bQEHkqFt1VomeZH2neYBFUwkEkD8FjWyA>
    <xmx:ESQFYA9cUP8cYtoJJRj0PPk8psS6UaPFZkNGHEvtRTI8EwJbSkMeig>
    <xmx:ESQFYN-1v9bHcDg1hA0A-_-YjF1Faij4iYMb2v4esVJs_iLNHaicPA>
    <xmx:EiQFYNAuIMoyEFbvD4aFyI_hi5AnmeNnaVl6gGBUmpdDSW2Que7OTg>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9015E108005B;
        Mon, 18 Jan 2021 01:00:49 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 0/4] media: sunxi-cir: Cleanup and power management
Date:   Mon, 18 Jan 2021 00:00:44 -0600
Message-Id: <20210118060048.22267-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series cleans up some dead code in the sunxi-cir driver and adds
system power management hooks.

---
Changes from v1:
  - Unregister the RC device first thing in sunxi_ir_remove() [3]

Samuel Holland (4):
  media: sunxi-cir: Clean up dead register writes
  media: sunxi-cir: Remove unnecessary spinlock
  media: sunxi-cir: Factor out hardware initialization
  media: sunxi-cir: Implement suspend/resume/shutdown callbacks

 drivers/media/rc/sunxi-cir.c | 169 ++++++++++++++++++++---------------
 1 file changed, 95 insertions(+), 74 deletions(-)

-- 
2.26.2

