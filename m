Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573BA257D77
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 17:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbgHaPh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 11:37:57 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13511 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728850AbgHaPhu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 11:37:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4d18cf0004>; Mon, 31 Aug 2020 08:35:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 31 Aug 2020 08:37:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 31 Aug 2020 08:37:49 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 15:37:48 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 31 Aug 2020 15:37:48 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.173.243]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4d194b0002>; Mon, 31 Aug 2020 08:37:48 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Fix compile warnings reported during Non TPG build
Date:   Mon, 31 Aug 2020 08:37:37 -0700
Message-ID: <1598888258-25586-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598888143; bh=GGK4Y8UghTcx7ENK145NKST1O+8RRIgQHK06/HSZE2k=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=GTnaR55gjXg/BaZs0XJg+gaVACl7HwZpd7vToZeJOKY8CxKqJsMLFc7/eeLwBOhUC
         xRxyj5LNpZAmhncgCFXOrH2iVF1g5d1WXhKZqiWq8oRP/CYaXlVEd57Q0jEuiyIeJY
         HQmdPcStV3sikvlfj1FL3N4VIdYTmQke4gHDUI4Vph6pY5SD/Y/o6EKRYssMdPADhy
         sgi5vYriUgv423Oq+ENp2/M/fmzpuU1KZhyJlUlk6txZmGVdMv3qPI9HwR9L66RSE3
         VsbL3ELat3LV1d0wlqeraO6NPa1ulBxRv6Sy22l2d4IuBCivOJGiPHpdUWB4gXlgBx
         Mi2m/gG/r1CkA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Patch-0001 fixes compilation warnings for variables used with V4L2
control operation when tegra-video is builded for Non TPG.

Patch-0001 should be applied on top of below external support patches.
https://patchwork.kernel.org/cover/11709839/

Sowjanya Komatineni (1):
  media: tegra-video: Fix compilation warning of unused variable

 drivers/staging/media/tegra-video/vi.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.7.4

