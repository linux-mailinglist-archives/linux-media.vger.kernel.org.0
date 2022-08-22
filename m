Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2709659BB47
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 10:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbiHVIWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 04:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233820AbiHVIWG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 04:22:06 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CC11EC4E
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 01:22:05 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27M75mdp029969;
        Mon, 22 Aug 2022 10:21:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8jWIxUMaHrj0pDB0Fv8mAdAk25S74EagUet1bpmzRnM=;
 b=kE7Y1esEbC4X1LPB8VxwK6S8MltXr11PG20AmuXGbLdTQt4DSvCYy9X3FmWwzAekL/RJ
 KFc+zTYSAM7Qqmpe+Ix3vY6+frOfGnFqEFV+EJGy1g8ABc6dLMm7c6QWD8a6H9PDDxQG
 9LoZYTUEQ5OZifRSE9v3JwoghqESkrfGbsbPwizRXEaKEhEOiKANWWXsFM1VnnFkBTD8
 5GeuVl+tlEZNT0HZwoAodj+ktSJpIimvMFwkxD9oOxtyNWkNL1MBvufg6JoDWeEG+uI6
 pKAWnGoujmHt7Ikqq3OcvGGp3jDhY2lHA3RBj2XK5A5PRmZCyAU46uRhw4FQXBxnGCVt pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j2x2r6gv0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 22 Aug 2022 10:21:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD09810002A;
        Mon, 22 Aug 2022 10:21:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B2B3221A20F;
        Mon, 22 Aug 2022 10:21:51 +0200 (CEST)
Received: from [10.252.11.24] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 22 Aug
 2022 10:21:51 +0200
Message-ID: <a922c43b-621e-8337-609b-e8fd9bb8ce16@foss.st.com>
Date:   Mon, 22 Aug 2022 10:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V1
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <1ca14c26-2e47-b144-1f5a-02824e81269a@xs4all.nl>
 <Yu0aWXxuoyJJolyU@pendragon.ideasonboard.com>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <Yu0aWXxuoyJJolyU@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
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


>> 13:30 Dave: On-sensor temperature reporting.
>>
>>    Thread started by Benjamin at
>>    https://lore.kernel.org/linux-media/20220415111845.27130-3-benjamin.mugnier@foss.st.com/
>>    but no resolution over using hwmon API or V4L2 control. If hwmon
>>    then we need Media Controller framework to tie the sensor and thermal
>>    device together.
>>
>>    It's recently been queried for IMX477 with the Pi
>>    (https://github.com/raspberrypi/libcamera/issues/19), but it will
>>    apply to many sensors.
> 
> Dave, it would be very useful if you could summarize, based on your
> experience, how that information is reported by sensors (I2C reads,
> embedded data, ..., but also single value, multiple values, ...) and
> what use cases are expected to consume it.

I will only attend in remote so I won't be able to talk with you about 
this topic.

But indeed I'm really interested in the outcome.
