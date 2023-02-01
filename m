Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4EF6867EE
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 15:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbjBAOFA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 09:05:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjBAOEu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 09:04:50 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194FD133
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 06:04:48 -0800 (PST)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311A0s9Z027462;
        Wed, 1 Feb 2023 15:04:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Zp0eNblbeNBnf+Ynnw3yRSIsEYIRQlqVLBm+JjLWGLE=;
 b=MO8FrS55qaVhKANrs0adQo+uWQjEzgDGVaK/24OE9PqnW6wFIlF0L456t9CNOwZ2HNy7
 pBrF0vdrWoUhQJ+SACUN2pz+Lek37g5pcuh5/XD7tp7U/LP5XkGQilbM8WJpVTzNPyBk
 /MISu0kV+nS2m/zRDgN+TOBWLoTmmFnu81W4vGUiB3um6Et3ahxhirVGni4+teEEzzEt
 0QfyHvm3f9AXiqI891CRZeLoyTI0ZNmkFOK/m6pmcbjUIjNQ5hz4V0dD7aXs9FfpZW4l
 qFhGoqE1mUIeQYaComscPLD2D9vDqodaNjjcRky9lCcMbqco6wOPQEtZ/x/N0YEbfES0 MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nfny51dtm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Feb 2023 15:04:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 571F610002A;
        Wed,  1 Feb 2023 15:04:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4438321ED57;
        Wed,  1 Feb 2023 15:04:30 +0100 (CET)
Received: from localhost (10.252.0.107) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 1 Feb
 2023 15:04:30 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 0/4] media: i2c: st-vgxy61: Power up sequence fixes
Date:   Wed, 1 Feb 2023 15:04:13 +0100
Message-ID: <20230201140417.89195-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.0.107]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series contains fixes for some issues I ran into, mostly related to
power up, plus a small cleanup patch for a hardcoded value while at it.

Thanks,
Benjamin

Benjamin Mugnier (4):
  media: i2c: st-vgxy61: Remove duplicate default mode set on probe
  media: i2c: st-vgxy61: Move 'detect' call to 'power_on'
  media: i2c: st-vgxy61: Fix control flow error on probe
  media: i2c: st-vgxy61: Use VGXY61_NB_POLARITIES instead of hardcoded
    value in tx_from_ep

 drivers/media/i2c/st-vgxy61.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

-- 
2.25.1

