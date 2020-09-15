Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B71EA269F8D
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 09:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgIOHWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 03:22:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:43460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbgIOHWN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 03:22:13 -0400
Received: from mail.kernel.org (ip5f5ad5a5.dynamic.kabel-deutschland.de [95.90.213.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3567C20897;
        Tue, 15 Sep 2020 07:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600154533;
        bh=oiZhyrnur8sEMYwMjG4p+RXrZKXVdVhsWLko9YL6U1U=;
        h=From:To:Cc:Subject:Date:From;
        b=PnX7XCuftGF7QHNG+q3TVX3SrgKNWyI1nQflrG6kAc7+cTdgydqoPj5iN0Fz2VQjO
         /Y/EYUNjNFGr8VS/+2ooGvfWSDiC06UdUlDLEt3z6pxOWwfHyD2tvjvdBNc4FaGxkV
         vHtzFdEH+Vji0aIjwnpyTOpNbPWCS5DnczMrR0bw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kI5I2-004XJd-LJ; Tue, 15 Sep 2020 09:22:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 0/3] vidtv: fix DVB-S/S2 simulation
Date:   Tue, 15 Sep 2020 09:22:06 +0200
Message-Id: <cover.1600154449.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add dummy functions to simulate a DisEqC , and fix the tuning logic,
in order to take a LNBf into account.

Mauro Carvalho Chehab (3):
  media: vidtv: add DiSEqC dummy ops
  media: vidtv: fix DVB-S/S2 tuning logic
  media: vidtv.rst: update it to better describe the frequencies

 .../driver-api/media/drivers/vidtv.rst        | 14 ++++++--
 .../media/test-drivers/vidtv/vidtv_bridge.c   | 35 +++++++++++++++----
 .../media/test-drivers/vidtv/vidtv_demod.c    | 33 +++++++++++++++--
 3 files changed, 70 insertions(+), 12 deletions(-)

-- 
2.26.2


