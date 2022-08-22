Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEFCE59BB34
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 10:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbiHVISU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 04:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbiHVISS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 04:18:18 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4F2E94
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 01:18:16 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27M7Kq1F023227;
        Mon, 22 Aug 2022 10:18:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YwQaO4htgPOPeiWSo+7FJM0eGv8yjFZKxQrxnANqKis=;
 b=7vMTbQkOul52g/e8hDftTGhsHeco146g1lLsLlFjCYKnObyLjWMFRoQUSJxavbO4aNt0
 Fe//neqRX+zpN/HluwdP6gA1Mau/k+LJP7tsKuXNyC04Wcovt/87nckR+mKrvz93E15H
 kZreNHQgQ/ZXVPfF528igbdyWXRCf7+8VQNLM3Tx84v95aj/FZKbNzhAr4Ok8JJA5v0T
 hN88GGN1SofVOGZVZVS2sBidgDP+ujgGhA8rZrfmRddMj5g2nSyaZ6wRIorPRfVuBBtf
 alJHxtKugnmqPDrtZXkHezyzhF1jjTQTUNdAFFrG9QEbEdDu3pGULHHcyTUAXdXLNUXo Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j2x2ypfrt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Aug 2022 10:18:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 50E4E10002A;
        Mon, 22 Aug 2022 10:18:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F24A21A200;
        Mon, 22 Aug 2022 10:18:02 +0200 (CEST)
Received: from [10.252.11.24] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 22 Aug
 2022 10:18:01 +0200
Message-ID: <3791c2b2-a7e4-6a45-819e-06808528d842@foss.st.com>
Date:   Mon, 22 Aug 2022 10:18:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/5] media: Add ST VGXY61 camera sensor driver
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>
References: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
 <e920c5e2-dba1-bcf7-7d83-ee797ca51b49@foss.st.com>
 <5a4cbabe-c701-6ab3-adec-592289b7b52b@foss.st.com>
 <7ae752d9-f7a5-a95a-79b3-437ef9aeeb74@foss.st.com>
 <YtUimiUvbzv1SvPo@paasikivi.fi.intel.com>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <YtUimiUvbzv1SvPo@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_04,2022-08-18_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 7/18/22 11:06, Sakari Ailus wrote:
> Hi Benjamin,
> 
> On Mon, Jul 18, 2022 at 09:26:01AM +0200, Benjamin Mugnier wrote:
>> Gentle ping :)
> 
> I'll try to review the set this week.
> 

Hi Sakari,

This is another gentle ping ;)
Thank you.

Benjamin
