Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 284B513936A
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 15:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgAMOPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 09:15:55 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:42957 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgAMOPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 09:15:54 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mq1GE-1jVEoL1Rkg-00nAr8; Mon, 13 Jan 2020 15:15:47 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 09B8564F293;
        Mon, 13 Jan 2020 14:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MpW3x8_PgRq7; Mon, 13 Jan 2020 15:15:46 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 3D7C264D641;
        Mon, 13 Jan 2020 15:15:46 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1320.4; Mon, 13 Jan 2020 15:15:46 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id E583A804E9; Mon, 13 Jan 2020 15:15:45 +0100 (CET)
Date:   Mon, 13 Jan 2020 15:15:45 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 6/8] media: adv748x: reduce amount of code for bitwise
 modification of device registers
Message-ID: <20200113141545.GG3606@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1578924232.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F657D64
X-Provags-ID: V03:K1:/85G/aaVRJTZkr6Gku52togdEm1yvKqdKcF2c6D9t/wZUMxfwf+
 ueDyXqBfeWDjMif7FvC+VnxwEbJgUx3FyGyTzatFR1guD9V4uw2RNoDaNeH/Nwnp0pV4896
 DESxa+kfbQ+uqth3DkTy9kl+NvJsPVifiYh/OpUX30+bAkg2vu/QBJ2kTzX9Sh27m1aE5S2
 7B6hcDjYeJBDE0WrhNmsg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5ZCwtVUm3R0=:K645eVt6J/mrOudtoJiooK
 MPK+yBSC1zEBtHzDuRiCAkKjRzkLtFB/2lbGxuSo0GCiyy9DW+wXlseZtCOrTysV6rqRf3MyO
 GqBQB6wkHW8p5v9EqUmhjB69ORSUKpfCbRubBOLlt9jrLLU7w9p541cFihbJAwV352Yq4J4fO
 wtQgyYQ1AkLsT8BEGVN9se34GMoFJkgOiT9sm7B29S2KMGSR/jB9wnjOfN6XSLO87zKEXks4Z
 0PABl0gPXRX48X1/QBzZSDIixRtl7AepMJrAP3h1XG+K+Lx/SP0QuJi0dGNLC4Nalb4WasJ5i
 Db2+LbvTCVGnK5AvN4zy9y4SLk2amVboFL9pxZu+POZ2jBoOK08/GxZlwY946RWJq1J8LZKaW
 PLGCUbugnrqGUIeDOJLo1dGuFSZJHKv/d9HJmigyn/7PurV3QNSWm7NXYCZ+7R3kYFTlcv7Qv
 PdM1Sqwsn7uajbaFsMXJVhV73Jbj3MuJKv+zEI1iiCThlTfrN9wAnExMejo84kZiQT631gkbr
 +U8YEdD2m+qTfhcpAkXTK3F96AtdlCju6Mw2QVStUyPWb3v2K+enLPzgTq7hGmnkX4VUfG0Xu
 XqouWEOvbUpskEB6jRu2H+NXzDDulYJECfp/tsNNj5DLx2Qo+ciOVvhI7GIkP48ratxCYT6R5
 D4pdQaMn3lMFltGT7bC3KEFJrOSnesRzVH8M3rr0hkFTWlADfLgBBB+7Qoi9pozCDE0OPzOe3
 209hNcGsA281A51sfZouewsrkFIJRzBOeZH8XdeWtDZkOILvOhNWzzzXvkAqmTLyHU9mDwV9/
 /ep+nApMI4YLZHFd8PSC6H4g5im4Jnd7SPlBVQljCHj0QVUTD9Itk673MCpCqeRZ9cMFwRNo7
 EhhtCJD6UniZOJIJiXpTnaKy2vdPmzspAc8d0Q758=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The regmap provides corresponding routine (regmap_update_bits) already
wrapped for this device earlier.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 5db06410f102..ab3f754542fe 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -432,7 +432,7 @@ int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg,
 
 #define io_read(s, r) adv748x_read(s, ADV748X_PAGE_IO, r)
 #define io_write(s, r, v) adv748x_write(s, ADV748X_PAGE_IO, r, v)
-#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~m) | v)
+#define io_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)
 #define io_update(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)
 
 #define hdmi_read(s, r) adv748x_read(s, ADV748X_PAGE_HDMI, r)
@@ -450,11 +450,11 @@ int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg,
 
 #define sdp_read(s, r) adv748x_read(s, ADV748X_PAGE_SDP, r)
 #define sdp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_SDP, r, v)
-#define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~m) | v)
+#define sdp_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_SDP, r, m, v)
 
 #define cp_read(s, r) adv748x_read(s, ADV748X_PAGE_CP, r)
 #define cp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_CP, r, v)
-#define cp_clrset(s, r, m, v) cp_write(s, r, (cp_read(s, r) & ~m) | v)
+#define cp_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_CP, r, m, v)
 
 #define tx_read(t, r) adv748x_read(t->state, t->page, r)
 #define tx_write(t, r, v) adv748x_write(t->state, t->page, r, v)
-- 
2.24.1.508.g91d2dafee0

