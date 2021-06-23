Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626213B13CF
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 08:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhFWGSO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 02:18:14 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:46950 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229934AbhFWGSO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 02:18:14 -0400
X-UUID: 042604d903aa4f9fb3863fdeb6f33156-20210623
X-UUID: 042604d903aa4f9fb3863fdeb6f33156-20210623
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <yp.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1234963530; Wed, 23 Jun 2021 14:15:52 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 14:15:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 14:15:51 +0800
From:   YP WU <yp.wu@mediatek.com>
To:     <yp.wu@mediatek.com>, <leo.hsiao@mediatek.com>,
        <Lecopzer.Chen@mediatek.com>, <mchehab@kernel.org>,
        <gustavoars@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <Jason-BF.Huang@mediatek.com>, <francis.lee@mediatek.com>
Subject: How to use "DTV_FE_CAPABILITY" command for Frontend.h of Linux DVB 
Date:   Wed, 23 Jun 2021 14:15:51 +0800
Message-ID: <20210623061551.10453-1-yp.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, dvb frontend maintainer:
	I work at mediatek company. Currently I develop TV with Linux DVB system.    
	I would like to implement the following LNB use cases: user space would like to know if frontend device node have LNB or not.
I want to use "DTV_FE_CAPABILITY" to represent above LNB capability, but I am afraid that my usage is not suitable to the original definition.    
So I would like to consult the following quesitons: 
1. The use case for DTV_FE_CAPABILITY in DVB property command.
2. Does it have any restriction for using this command?
3. What’s your suggestion for using this command?

File path: include/uapi/linux/dvb/Frontend.h
#define DTV_FE_CAPABILITY	16

Sorry to bother you and thanks for your helps.
BRs,
YP
