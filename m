Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6DC48453
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 15:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbfFQNo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 09:44:27 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:41702 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726424AbfFQNoR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 09:44:17 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5HDfrWe012102;
        Mon, 17 Jun 2019 15:44:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=HG2GkKtZhuPS2Ed7xPIs5Wp0qhty/QSSX36GIyQz3Qs=;
 b=CEYMRnrRVJCNO27ihxU6Q4AOzfHv57LJVnlTlmPZZX/TSUK4Ljl3yIWVsvnuMxJWa/Uo
 +Ey99QS0kHhkr7Nq9xtXHdx3Z7GghsLuYgMTCyFXx5riu1R3gzt/9yO13aH/vQl2MOO3
 kBD4VcdoNa4KYP3Hr6V9iN9qnh0M5R0xNhheCYDUWj20/Ssl6Ovcz8r0LazaQXrYifBx
 d8QMjBObUEbvYLPil6J4gj0qY/Me7Nr/tD0bl+YXvXgAJrL1ve10C8kAER/pwSwWbwWe
 /SJgHd4oCKLiDy9L4GkZwm5b3KcoFA8cv2vkg5rNqY+arv0jhtwdm0QnKZG+Mez3J+QS lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2t68n3gydp-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 17 Jun 2019 15:44:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B0EC831;
        Mon, 17 Jun 2019 13:44:09 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 969B325DF;
        Mon, 17 Jun 2019 13:44:09 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun
 2019 15:44:09 +0200
Received: from localhost (10.201.23.19) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Jun 2019 15:44:09
 +0200
From:   Hugues Fruchet <hugues.fruchet@st.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mickael Guene <mickael.guene@st.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Hugues Fruchet" <hugues.fruchet@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v2 0/3] Add support of RGB565, YUV and JPEG to MIPID02 bridge
Date:   Mon, 17 Jun 2019 15:43:55 +0200
Message-ID: <1560779038-26012-1-git-send-email-hugues.fruchet@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.19]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-17_06:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support of RGB565, YUV and JPEG to MIPID02 bridge.

===========
= history =
===========
version 2:
  - Link frequency could not be computed from pixel rate for JPEG,
    remove JPEG case in bpp_from_code().

version 1:
  - Initial submission

Hugues Fruchet (3):
  media: st-mipid02: add support of RGB565
  media: st-mipid02: add support of YUYV8 and UYVY8
  media: st-mipid02: add support of JPEG

 drivers/media/i2c/st-mipid02.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

-- 
2.7.4

