Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4BA61F42F
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 14:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbiKGNUo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 08:20:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbiKGNUk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 08:20:40 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7861B787
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 05:20:36 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A7ATrai017326;
        Mon, 7 Nov 2022 14:20:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=wAtrc4sDMa7hyt7WKVTSK8IjWfcK1TmY0u8ypH3vEYA=;
 b=Gw1IHIJZFreLH1lU13MfCQ6xV/+EbqO0CQB8B2SR8oV3GsoqYSDqpoqXH8fMa3L5h1Qn
 zAiW1/PsYQheiSUzzMZkP9dkWkA/P1cyrDAEjwdygLHHYAsIVSE0vl1xFMBW8dQdEvzn
 l51nATdhMLRz7rNHWZywrmUNPk0caqV013ca4WdHuvpRFhRz8+i5gOb4uOKq1azf9Nzh
 BqUwQMhPhGHO1kZmzcs5eOgZgysmtthmyi+tOQFOXIuvWAEF4MO5f5PDnPuBzMy0Xdfi
 uZiWMxsz7QD8QJngXAdnoSC1OB7E4j0qfZLNtGZduznpTcWSILZJ34J7+4aBCjlj/iKp /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kq0aps0m2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Nov 2022 14:20:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1471D10003B;
        Mon,  7 Nov 2022 14:20:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EDBF9222CB4;
        Mon,  7 Nov 2022 14:20:16 +0100 (CET)
Received: from localhost (10.129.167.233) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 7 Nov
 2022 14:20:16 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 0/3] media: Documentation: st-vgxy61: Fix driver specific documentation issues
Date:   Mon, 7 Nov 2022 14:19:42 +0100
Message-ID: <20221107131945.40753-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.167.233]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_06,2022-11-07_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patchset fixes the st-vgxy61.rst file characters limit, removes useless
quotes around the 'No HDR' identifier, and references the file in the index
thanks to the kernel test robot warning.

Thanks,
Benjamin

Benjamin Mugnier (3):
  media: Documentation: st-vgxy61: Limit driver specific documentation
    to 80 characters
  media: Documentation: st-vgxy61: Remove quotes around 'No HDR'
    identifier
  media: Documentation: st-vgxy61: Fix driver specific documentation not
    being included in the index

 Documentation/userspace-api/media/drivers/index.rst  |  1 +
 .../userspace-api/media/drivers/st-vgxy61.rst        | 12 +++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.25.1

