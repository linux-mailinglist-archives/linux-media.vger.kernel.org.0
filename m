Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46FDB3B9E3B
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 11:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhGBJbL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 05:31:11 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:53699 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230476AbhGBJbL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 05:31:11 -0400
X-UUID: 8cdbb4eeab4a42d79d2acc5f97a00b58-20210702
X-UUID: 8cdbb4eeab4a42d79d2acc5f97a00b58-20210702
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <yp.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 734400183; Fri, 02 Jul 2021 17:28:35 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 17:28:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Jul 2021 17:28:34 +0800
From:   YP WU <yp.wu@mediatek.com>
To:     <mchehab@kernel.org>
CC:     <Jason-BF.Huang@mediatek.com>, <Lecopzer.Chen@mediatek.com>,
        <francis.lee@mediatek.com>, <gustavoars@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <leo.hsiao@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <yp.wu@mediatek.com>
Subject: Re: How to use "DTV_FE_CAPABILITY" command for Frontend.h of Linux DVB
Date:   Fri, 2 Jul 2021 17:28:34 +0800
Message-ID: <20210702092834.11699-1-yp.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210623093312.6f9883a5@coco.lan>
References: <20210623093312.6f9883a5@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, Mr.Mauro,
<I need to understand more about the use case.
-> About use case, I describe below:

	For our design of kernel, demod/tuner and LNB are registered to different frontend device nodes.
We want to implement property command to know if the frontend device node is LNB device or demod/tuner device.
If it is LNB device node, the value would return true
If it is demod/tuner device node, the value would return false.
 
Do you have better idea or suggestion for our usage?
Please let me know if your have better suggestion.
Very thank you for your help.

BRs,
YP
