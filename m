Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCEC33FEC9B
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 13:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233828AbhIBLEv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 07:04:51 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:39710 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232113AbhIBLEu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 07:04:50 -0400
X-UUID: 86b3d324245c45f1b14f9e8fb3201383-20210902
X-UUID: 86b3d324245c45f1b14f9e8fb3201383-20210902
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <yp.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1238895030; Thu, 02 Sep 2021 19:03:49 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 19:03:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 19:03:47 +0800
From:   YP WU <yp.wu@mediatek.com>
To:     <mchehab@kernel.org>
CC:     <Jason-BF.Huang@mediatek.com>, <Lecopzer.Chen@mediatek.com>,
        <francis.lee@mediatek.com>, <gustavoars@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <leo.hsiao@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <yp.wu@mediatek.com>
Subject: Re: How to use "DTV_FE_CAPABILITY" command for Frontend.h of Linux DVB
Date:   Thu, 2 Sep 2021 19:03:47 +0800
Message-ID: <20210902110347.14939-1-yp.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210715095933.63dbcd31@coco.lan>
References: <20210715095933.63dbcd31@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, Mr.Mauro,
      Frist of all, thanks for your reply and Sorry to reply late.

We know that everything is controlled by /dev/dvb/frontend.

It is assumed that the device node "dvb/frontend0", "dvb/frontend1" and "dvb/frontend2" use the input signal from the same satellite antenna. In addition, "dvb/frontend0", "dvb/frontend1", and "dvb/frontend2" are premised on receiving broadcast signals at the same time under the condition that the same voltage is always supplied to the satellite antenna.

Therefore, Our TV uses an HW circuit equipped with only one LNB IC.

Since only one LNB IC is installed, the design policy of including and controlling the same LNB IC in "dvb/frontend0", "dvb/frontend1" and "dvb/frontend2" is complicated and difficult to understand. It is more simpler and easier to design to separate the LNB IC into "dvb/frontend3" and control the LNB IC from "dvb0.frontend3". Therefore, we want to separate LNB to different device node.

BRs,
YP
