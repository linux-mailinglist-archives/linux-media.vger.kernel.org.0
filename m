Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A10E65B2E4
	for <lists+linux-media@lfdr.de>; Mon,  2 Jan 2023 14:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjABNtX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Jan 2023 08:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236003AbjABNtQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Jan 2023 08:49:16 -0500
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085C263EA;
        Mon,  2 Jan 2023 05:49:14 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 302BG6K5009376;
        Mon, 2 Jan 2023 14:48:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=i4qITYrrsXdKtQXb0+eS4RYOCxnL3PA/faqTfKXe9RA=;
 b=kW70y43cyuRjiKZZBU2dtJ8K56gu6iypTypNqIFPdSOUdu9A8x8AeE8aFyVyN+M30Grx
 Z9/Lci9x2Xw1FeYO6PR//DwcJGvruTrQYv+cREVZwfyExxZDFTSRuLHSyhuzg6dEBoGF
 hPiMhts6wjvmSfTCTzMFCbA1cS5dLomkGsNlrXYUNjliblvWZOHt0pG3SGZwLYvqhmCh
 6b61BbfNGl/u/ws4BExpaGfUmDagZXMePo59eYm4thayo4/BtxRASwE96tO+VbM6/MiD
 COlsWx/jc4Pys/LBUrs3rhZI+Z/kUYtY6zYLXid5geElaZaHwWb/G67ehBdoUnfNg+C/ cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtcupg2qg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Jan 2023 14:48:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F98E10002A;
        Mon,  2 Jan 2023 14:48:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A8772248DF;
        Mon,  2 Jan 2023 14:48:47 +0100 (CET)
Received: from [10.252.15.26] (10.252.15.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 2 Jan
 2023 14:48:46 +0100
Message-ID: <0964106e-8335-fef3-b844-7c00abd1e6d8@foss.st.com>
Date:   Mon, 2 Jan 2023 14:48:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/8] media: i2c: mlx7502x ToF camera support
To:     Volodymyr Kharuk <vkh@melexis.com>, <linux-media@vger.kernel.org>
CC:     Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <devicetree@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <cover.1669978791.git.vkh@melexis.com>
 <Y7LbxRQ2mQnnRC6u@melexis.com>
Content-Language: en-US
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <Y7LbxRQ2mQnnRC6u@melexis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.15.26]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_08,2022-12-30_01,2022-06-22_01
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Volodomyr,

I'm not sure I'm relevant, but since we discussed a bit about controls
in the first version feel free to add my tag for patch 1, 2, and 3:

Acked-By: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

Thank you for your work.

On 1/2/23 14:27, Volodymyr Kharuk wrote:
> Hi All,
> 
> This is a gentle reminder about the patch series for ToF camera.
> 
> Thanks.
> 
> On Fri, Dec 02, 2022 at 06:07:30PM +0200, Volodymyr Kharuk wrote:
>> Hello,
>>
>> This series adds support for the Melexis 75026 and 75027 Time of Flight
>> camera sensors, with DT bindings in patch 7/8 and a driver in patch 8/8.
>> In patches 1/8, 2/8 and 3/8, I've add ToF controls as separate
>> ToF control class.
>>
>> v4:
>> - fix output mode
>> - forbid array for menu and warn if validate_new return an error
>> - add enums to custom control OUTPUT_MODE
>> - update doc
>> - minor fixes
>>
>> v3:
>> - move FMOD, TINT, PHASE_SEQ to common V4L2 as ToF common controls
>> - FMOD and TINT became dynamic arrays
>> - remove PHASE_NUM, use dynamic_array for PHASE_SEQ,
>>   ctrl->new_elems pass number of phases
>> - remove leden-gpios, will be used gpio explicitly in library for now
>> - remade probe: use probe_new, no power on during probe
>> - remove autodetect and wildcard
>> - make all supplies to be required
>> - remove trigger ioctl, will add in separate patch series
>> - remove temperature ioctl, will add in separate patch series
>> - add documentation about custom ioctl
>> - style: 80 cols
>> - minor fixes device tree
>>
>> v2:
>> - added external clock to the sensor
>> - added all regulators required by the sensor
>> - added posibility to choose sensor type in device tree
>> - added prefixes to all custom types in device tree and driver as well
>> - style fixes
>>
>> Volodymyr Kharuk (8):
>>   media: uapi: ctrls: Add Time of Flight class controls
>>   media: v4l: ctrls: Fill V4L2_CID_TOF_CLASS controls
>>   media: Documentation: v4l: Add TOF class controls
>>   media: v4l: ctrls-api: Allow array update in __v4l2_ctrl_modify_range
>>   media: v4l: ctrls: Add user control base for mlx7502x
>>   media: uapi: Add mlx7502x header file
>>   media: dt-bindings: Add mlx7502x camera sensor
>>   media: i2c: Add driver for mlx7502x ToF sensor
>>
>>  .../bindings/media/i2c/melexis,mlx7502x.yaml  |  126 ++
>>  .../userspace-api/media/drivers/index.rst     |    1 +
>>  .../userspace-api/media/drivers/mlx7502x.rst  |   28 +
>>  .../userspace-api/media/v4l/common.rst        |    1 +
>>  .../userspace-api/media/v4l/ext-ctrls-tof.rst |   56 +
>>  MAINTAINERS                                   |   11 +
>>  drivers/media/i2c/Kconfig                     |   13 +
>>  drivers/media/i2c/Makefile                    |    1 +
>>  drivers/media/i2c/mlx7502x.c                  | 1747 +++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |   25 +-
>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   20 +
>>  include/uapi/linux/mlx7502x.h                 |   28 +
>>  include/uapi/linux/v4l2-controls.h            |   14 +
>>  13 files changed, 2059 insertions(+), 12 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx7502x.yaml
>>  create mode 100644 Documentation/userspace-api/media/drivers/mlx7502x.rst
>>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
>>  create mode 100644 drivers/media/i2c/mlx7502x.c
>>  create mode 100644 include/uapi/linux/mlx7502x.h
>>
>>
>> base-commit: a7bab6f8b73fe15a6181673149734a2756845dae
>> -- 
>> BR,
>> Volodymyr Kharuk
>>
> 

-- 
Regards,

Benjamin
