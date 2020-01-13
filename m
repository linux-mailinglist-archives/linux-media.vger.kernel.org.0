Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB2E139362
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 15:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbgAMOPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 09:15:55 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:53131 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729064AbgAMOPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 09:15:48 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N9dbx-1jlOmx0isn-015e1N; Mon, 13 Jan 2020 15:15:34 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id EAD7A64F293;
        Mon, 13 Jan 2020 14:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zSUt-Fw9X00y; Mon, 13 Jan 2020 15:15:33 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id A747864E2AB;
        Mon, 13 Jan 2020 15:15:33 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1320.4; Mon, 13 Jan 2020 15:15:33 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 5D6DB804E9; Mon, 13 Jan 2020 15:15:33 +0100 (CET)
Date:   Mon, 13 Jan 2020 15:15:33 +0100
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
Subject: [PATCH 4/8] media: adv748x: reserve space for the audio (I2S) port
 in the driver structures
Message-ID: <20200113141533.GE3606@pflmari>
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
X-Provags-ID: V03:K1:GCk2luEwK7oQKq+TVDmnLvDi4cpAoKdN6TRH/nlXVMKt3Z5GHwu
 H3avNrMuWgo13wQ7Ze/a2VAvbetXqrN6m+l72/5aFqtdk2UyXNuWQJHDhFrsY38zJsq3Uws
 +Nh74MidEuL3prr2ArVSCHN9M4ykTAlnbyxPCdDMKRSR6pLqKYtXwfv5NU2/yCF19ZsVknR
 qE1k9GTehtJ1US1u68Fzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IdhXLHCtac8=:FwiUzFjjrZsbLy8MBOXV/l
 jrlUrLFzvSSLWKSSNT18aCS4sNiVsHlAa49p0eYIwYKUNaXsePcAxPb+hya2JFD24Qvkunifd
 AVBx7hjI8giCZN7rko0ogwSQLQBLIrVz0M3d3tQ93++1vCsmuxI/owy8Dgc5rJQ5I9Hgi2kKw
 YTzc8Cb6bf8uFoJJ9UR/yb/eS1VjpiLmBhFOA4N4ceRuyROuNBAK4HBlcp9mAoz8WnYYQB1ZK
 F5YkTo2/TVPj1Fv9GG4yB1nFidCk37j4Sp0qXaLtG5C8sD/I3SRftWhnnF10vBORFvGZ6Vg9v
 T/tnEx3scvamELA6QmP4b0UNayGaDyakyfY8V/1pyURCQYrzJ5rzNsaBhgR57R87fIcGv35hu
 3YZUHo/z8X0flMtuCQYId1YXy24c/GGQzETlISKRGTCo/jtoy8gvBk+sEFBMmu3HC5OSp461h
 +OSHNKliS/6rrFnZceiq12RZAgZWpw+7dG4h/BrVhUXBquBny3oQ47yrcSGKadysIsG5T/wTY
 U+nUtk771wmCq7Dh1yF9ahwNr7yv52VuG0JHKHhc4KGm51OojhqufJLKfcyX36Le4v+lTQyGu
 IfBd7WgIvGXUYbR2ewj7CEiEpP0otKV9BTTyz6OCjV6M6nEmbIVwWjTbRVafQ1D+O/uTLWg1T
 zsMu28Cep9PWUnhmeBSldJXX/Rj78IbkYeXv3xG5ry6L/f0bhkp3gAnFsnqKaP4jkDqaWspre
 aIF/nf2OfFgAtKB9JMSLL965QHHMAPb3A3jOVo3lQF12Q93bvQcSKjN+akSAb0aFhma50hcHg
 0X1EF7OZ3dL1umwjmDCjRRAdnqE0DiZ86GBO6L75vd6F0h3CexOctlUHpFOy/ODP4zu2M6aoN
 3lWmghCN1TRokcwhUJrpaDA7VeuxwGcICVQ/D3ynM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This allows use of the port in the device tree files.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index fdda6982e437..5db06410f102 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -61,7 +61,8 @@ enum adv748x_ports {
 	ADV748X_PORT_TTL = 9,
 	ADV748X_PORT_TXA = 10,
 	ADV748X_PORT_TXB = 11,
-	ADV748X_PORT_MAX = 12,
+	ADV748X_PORT_I2S = 12,
+	ADV748X_PORT_MAX = 13,
 };
 
 enum adv748x_csi2_pads {
-- 
2.24.1.508.g91d2dafee0

