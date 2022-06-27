Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6E055CD75
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbiF0IxI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 04:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbiF0IxH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 04:53:07 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45D4624F
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 01:53:05 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R7lndN020295;
        Mon, 27 Jun 2022 10:52:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+renNw83dt8blEeS001BpRISOdYBWEdYQtaTvyDgX8I=;
 b=Iricnu9qTLd8hhP0fQklD+5B52FzI/1lnawONIjFvlpGCk6UnTxEe5kzKja80FUSxeeX
 GvXVwtr2xKSFmGdr+3GAmiPGJHPaCZOeM26p0GtH581+IWltiqvhysDjZYUOq9d35kTs
 328nUqqas9BcRmEZcewxPC/XOUaFneXrP7F2h16Lyp0XQqCFWLym8hetBa5IZOAkVv+0
 orsYdAi3QT7hot6DhpAZC/4axC5XAz3eaA0wcvbDtflNyEhy3csmyVntpigR3+NpujSU
 iE504iD3rruOH7Yhy7sD/ZsE08JB2mtljyqKN4RcUlsZTr5OqDTJYuQeYIV56JfaBv9O mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gwsq1063n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 10:52:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99C9910002A;
        Mon, 27 Jun 2022 10:52:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7CB25215127;
        Mon, 27 Jun 2022 10:52:49 +0200 (CEST)
Received: from [10.201.21.143] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 10:52:49 +0200
Message-ID: <03a086c9-4386-b8ec-661f-3ec349132c5d@foss.st.com>
Date:   Mon, 27 Jun 2022 10:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: stm32: dcmi: Register V4L2 subdev nodes
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20220618222335.478205-1-marex@denx.de>
 <Yq5dtc3MHz5gp5BK@pendragon.ideasonboard.com>
 <4dc7b39c-35cd-663a-98f8-6034693df3c8@denx.de>
 <Yq5u8sPxZoSVKZ7w@pendragon.ideasonboard.com>
 <da593513-fc1e-b993-4476-2137b0cf3338@denx.de>
From:   Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <da593513-fc1e-b993-4476-2137b0cf3338@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

As said by Laurent -thanks for answer Laurent- driver configures the 
subdevs internally and not expose subdev interface. This is done to keep 
legacy applications based on V4L2 interface up & running.

As said also, all the sensor controls are exposed on dcmi video node so 
you don't need subdev interface to get access on sensor controls.

Best regards,
Hugues.

On 6/19/22 02:43, Marek Vasut wrote:
> On 6/19/22 02:33, Laurent Pinchart wrote:
>> On Sun, Jun 19, 2022 at 02:28:55AM +0200, Marek Vasut wrote:
>>> On 6/19/22 01:20, Laurent Pinchart wrote:
>>>> Hi Marek,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> On Sun, Jun 19, 2022 at 12:23:35AM +0200, Marek Vasut wrote:
>>>>> Unless the V4L2 device calls v4l2_device_register_subdev_nodes(),
>>>>> the /dev/v4l-subdev* sub-device nodes are not registered and thus
>>>>> not created. Add the missing call.
>>>>
>>>> This driver configures the subdevs internally. Exposing the subdev 
>>>> nodes
>>>> to userspace would conflict with driver operation.
>>>>
>>>> If you need the subdev nodes only to query subdev information, you can
>>>> use v4l2_device_register_ro_subdev_nodes(). Ideally I'd prefer this
>>>> driver to expose subdev nodes to userspace and stop propagating formats
>>>> internally, but that may break applications :-(
>>>
>>> I need those subdevs to configure e.g. test pattern on the sensor side.
>>
>> Doesn't the dcmi driver expose the sensor controls on the video node ?
> 
> Apparently it does, so, discard this patch.
