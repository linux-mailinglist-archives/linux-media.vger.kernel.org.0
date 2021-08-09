Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3F03E4230
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 11:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbhHIJMK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 05:12:10 -0400
Received: from 8bytes.org ([81.169.241.247]:58172 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234130AbhHIJMJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Aug 2021 05:12:09 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id F0AE01F1; Mon,  9 Aug 2021 11:11:46 +0200 (CEST)
Date:   Mon, 9 Aug 2021 11:11:42 +0200
From:   "joro@8bytes.org" <joro@8bytes.org>
To:     Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>
Cc:     "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "krzysztof.kozlowski@canonical.com" 
        <krzysztof.kozlowski@canonical.com>,
        Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= 
        <youlin.pei@mediatek.com>,
        Anan Sun =?utf-8?B?KOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Xia Jiang =?utf-8?B?KOaxn+mcnik=?= <Xia.Jiang@mediatek.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "eizan@chromium.org" <eizan@chromium.org>,
        Yi Kuo =?utf-8?B?KOmDreaHvyk=?= <Yi.Kuo@mediatek.com>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "evgreen@chromium.org" <evgreen@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Tiffany Lin =?utf-8?B?KOael+aFp+ePiik=?= 
        <tiffany.lin@mediatek.com>,
        Anthony Huang =?utf-8?B?KOm7g+W7uuWYiSk=?= 
        <Anthony.Huang@mediatek.com>,
        "acourbot@chromium.org" <acourbot@chromium.org>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "drinkcat@chromium.org" <drinkcat@chromium.org>,
        "hsinyi@chromium.org" <hsinyi@chromium.org>,
        Ming-Fan Chen =?utf-8?B?KOmZs+aYjuaxjik=?= 
        <Ming-Fan.Chen@mediatek.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "frank-w@public-files.de" <frank-w@public-files.de>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "will.deacon@arm.com" <will.deacon@arm.com>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "mka@chromium.org" <mka@chromium.org>
Subject: Re: [PATCH v7 00/12] Clean up "mediatek,larb"
Message-ID: <YRDxTmvA9PcSRQUe@8bytes.org>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
 <YQfALZNWyw8VKODp@8bytes.org>
 <ed099698f63bec6771561bcad7022dbff184ce7f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed099698f63bec6771561bcad7022dbff184ce7f.camel@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 09, 2021 at 08:30:03AM +0000, Yong Wu (吴勇) wrote:
> Thanks very much for your confirm. I will your Ack for iommu part in
> the next version.

Note that my ack is conditional on the premise that Matthias has
reviewed the IOMMU parts.

Thanks,

	Joerg
