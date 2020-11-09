Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A452AB65C
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 12:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbgKILRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 06:17:03 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:27220 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727774AbgKILRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 06:17:03 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A9BBgXq015865;
        Mon, 9 Nov 2020 12:16:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=+GKVxM0D3KkH2WcQ7+pofmMRwY/ZQf5vYpPY8etpHu4=;
 b=mO7NLy1qnnydc88v9ir50jEPtNIW4K5bGzEy+1KYcU/UsNTVnG6pegaJhPtlIkA8EndZ
 rR2xEQgFxrV+p63N1wwfZfeuKOeyfA6uGIIHW2t4ANH5Rh/3hv7t3AZTh4NbHdoIldWg
 XPJUBZKRaW/4CatSLeysN3GMF6waUKHIhB7R3/RpRr32EmxWwZ8FZDKUBWMya4fMtPbF
 HYICGfh7gjTFU/w3heOrmPnAMWjUEJbo1bSM3uruSChCByAHdYOZCOLFN+OqE1/CL5lg
 /pdTg8O8xHs0aQDl+EX25kMu4w7uHStRWnDt1KQa70prTN14ybS9kpsp9O8SB7uzzcBU DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nhkcj5d1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Nov 2020 12:16:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 648D310002A;
        Mon,  9 Nov 2020 12:16:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C0DF24D15C;
        Mon,  9 Nov 2020 12:16:51 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 12:16:50 +0100
Subject: Re: [PATCH v5 0/4] DCMI BT656 parallel bus mode support
To:     Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain Volmat <alain.volmat@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>
References: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <e7358059-8c19-d69d-4e00-c30a2e44e335@st.com>
Date:   Mon, 9 Nov 2020 12:16:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-09_02:2020-11-05,2020-11-09 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues

On 11/4/20 6:32 PM, Hugues Fruchet wrote:
> Add support of BT656 embedded synchronization bus.
> This mode allows to save hardware synchro lines hsync & vsync
> by replacing them with synchro codes embedded in data stream.
> Add "bus-type" property and make it required so that there is no
> ambiguity between parallel mode (bus-type=5) and BT656 mode (bus-type=6).
> 
> ===========
> = history =
> ===========
> version 5:
>    - Add revisited bindings and devicetree with explicit use of "bus-type"
> 
> version 4:
>    - Fix typo in commit message
> 
> version 3:
>    - Fix bus_width print to %u as per Sakari comment
> 
> version 2:
>    - As per Sakari remark, revisit commit message and document
>      BT656 parallel bus mode in bindings
> 
> version 1:
>    - Initial submission
> 
> Hugues Fruchet (4):
>    media: stm32-dcmi: add support of BT656 bus
>    media: dt-bindings: media: st,stm32-dcmi: add support of BT656 bus
>    ARM: dts: stm32: set bus-type in DCMI endpoint for stm32mp157c-ev1
>      board
>    ARM: dts: stm32: set bus-type in DCMI endpoint for stm32429i-eval
>      board
> 
>   .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 38 ++++++++++++++++++++++
>   arch/arm/boot/dts/stm32429i-eval.dts               |  1 +
>   arch/arm/boot/dts/stm32mp157c-ev1.dts              |  1 +
>   drivers/media/platform/stm32/stm32-dcmi.c          | 37 +++++++++++++++++++--
>   4 files changed, 75 insertions(+), 2 deletions(-)
> 

DT patches applied on stm32-next.

Cheers
Alex
