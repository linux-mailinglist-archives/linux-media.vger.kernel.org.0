Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B82B3FEC88
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 12:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbhIBK5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 06:57:40 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:46292 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233427AbhIBK5j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 06:57:39 -0400
X-UUID: ffa4865a9b4245b09ed7702e72332cec-20210902
X-UUID: ffa4865a9b4245b09ed7702e72332cec-20210902
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yp.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1939917499; Thu, 02 Sep 2021 18:56:37 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 18:56:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 18:56:36 +0800
From:   YP WU <yp.wu@mediatek.com>
To:     <mchehab@kernel.org>
CC:     <Jason-BF.Huang@mediatek.com>, <Lecopzer.Chen@mediatek.com>,
        <francis.lee@mediatek.com>, <gustavoars@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <leo.hsiao@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <yp.wu@mediatek.com>
Subject: Re: DVBS Blind scan implementation of Linux DVB
Date:   Thu, 2 Sep 2021 18:56:36 +0800
Message-ID: <20210902105636.14850-1-yp.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210702133326.654ac68d@coco.lan>
References: <20210702133326.654ac68d@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, Mr.Mauro,
      Frist of all, thanks for your reply and Sorry to reply late.

According to your comment, we found that it still miss some steps about blindscan
For example, we should get tuner's next IF frequency from demod DD during blindscan.
Also, we should get the number of founded transpoders and detail information of each transponder
To complete DVBS blindscan, we proposed to add element below:

1.Create interface between demod DD and user space
We need to add IOCTL command for user space to indicate dvb_core that this command is related to blindscan
Also, we need to add ops for dvb_core to indicate demod dd to set/get parameters related to blindscan
We propose to add code below:

(1)Add IOCTL cmd in frontend.h:
#define FE_BLINDSCAN                   _IOW('o', 84, enum blindscan_action, struct dtv_frontend_properties *p)
/* 
ioctl command which is related to DVBS blindscan
*/

(2)Add member into dvb_frontend_ops in dvb_frontend.h
int (*blindscan)(enum blindscan_action cmd, struct dtv_frontend_properties *p );
/* 
function which is related to DVBS blindscan
*/

2.Indicate demod DD what kind of blindscan command user space send
During blindscan, user space needs to get or set parameters with demod DD
Ex: User space should get next IF frequency from demod DD and set to tuner.
    If transponders are founded in this tuner step, user space should get the number of transponders and information of each transponder
    User space should start blindscan with start&end frequency

Therefore, we need add enum to indicate demod DD that user space want to get or set parameters during blindscan with demod DD 
We propose to add enum in dvb_frontend.h below:

Enum blindscan_action
{
    BLINDSCAN_SET  //Setting parameters during blindscan (set start/end frequency, continue blindscan)
    BLINDSCAN_GET  //Getting parameters during blindscan (get current tuner frequency, get total founded transponders information)
    BLINDSCAN_END  //current tuner frequency reaches end frequency or user wants to stop blindscan
}

3.Additional properties related to blindscan
(1)We should indicate demod DD the end frequency of blindscan, then demod DD would know when to end blindscan
(2)If transponders are founded in this tuner step, we should get the number of transponders and information of each transponder

We propose to add property command and struct member of dtv_frontend_properties below: 
(1)Add dtv property command in frontend.h
#define DTV_END_FREQUENCY  //Setting end IF frequency of blindscan
#define DTV_TRANSPONDER_NUMBER  //Getting number of founded transponders in this tuner step

(2)Add struct member of dtv_frontend_properties in dvb_frontend.h
u32 end_freq  //End IF frequency of blindscan
u8 TP_num  //Number of founded transponders in this tuner step

Do you have any suggestion? 
Thanks for your help.

BRs,
YP
