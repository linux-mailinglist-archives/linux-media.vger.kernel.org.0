Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE403CF7E8
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 12:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237585AbhGTJv2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 05:51:28 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50324 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S237398AbhGTJtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 05:49:08 -0400
X-UUID: a2fa50a6c4404291b4e25540da31ebec-20210720
X-UUID: a2fa50a6c4404291b4e25540da31ebec-20210720
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <guangming.cao@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 55608880; Tue, 20 Jul 2021 18:29:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 18:29:37 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 MTKCAS06.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 20 Jul 2021 18:29:37 +0800
From:   <guangming.cao@mediatek.com>
To:     <christian.koenig@amd.com>
CC:     <dri-devel@lists.freedesktop.org>, <guangming.cao@mediatek.com>,
        <linaro-mm-sig@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
        <sumit.semwal@linaro.org>, <wsd_upstream@mediatek.com>,
        Guangming Cao <Guangming.Cao@mediatek.com>
Subject: Re: [PATCH] dma_buf: remove dmabuf sysfs teardown before release/detach
Date:   Tue, 20 Jul 2021 18:29:35 +0800
Message-ID: <20210720102935.83187-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <8d7dfc78-aa85-48b5-2828-21ec6b463ac3@amd.com>
References: <8d7dfc78-aa85-48b5-2828-21ec6b463ac3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Guangming Cao <Guangming.Cao@mediatek.com>

On Tue, 2021-07-20 at 11:31 +0200, Christian König wrote:
> Am 19.07.21 um 07:19 schrieb guangming.cao@mediatek.com:
> > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > 
> > Dmabuf sysfs stat is used for dmabuf info track.
> > but these file maybe still use after buffer release/detach,
> > should clear it before buffer release/detach.
> 
> Please rebase on current drm-misc-next. The attachment sysfs files
> have 
> been removed in the meantime.
> 
> Thanks,
> Christian.
> 
updated, thanks for your reminding.
