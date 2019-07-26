Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D651C75FFC
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 09:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbfGZHlV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 03:41:21 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53592 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfGZHlV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 03:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=CkRUYquCWMephBCRC3VdcCQqImJr3TKhB4LMdEk0n1A=; b=odlZrfIlkXKhJZmlD4dVLgsGH
        3YhqJbFVFnZ6h2nPNDn/l3tdVDyfS/kXIUf7kJN7AiPIylBSUr9oLbYrJDpY2H2X60xNE+4Pjex4T
        cyx9Mi6s6ruhU9WqfuQuvOMkAwJz1tX27V+I7CFgtrRO+GvIgMX2pgBVC151Xk4WJ1KMFzruOCmHX
        lL50Z709y1wUobslL+YEuH1VDVW+/8v2QaxzxnLSZ7o5NF8dA8ph7xZzgFVmYT3rJd7wf8IRmM6bz
        sh54BgcrfXeLETrUmSaM59rQ2tsEHQf//0f+eSslJyUVImjyrjjxTJDrIT612fv+fddYLWpLf5z7m
        SXckglUFw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hquqq-0006Rg-53; Fri, 26 Jul 2019 07:41:16 +0000
Date:   Fri, 26 Jul 2019 00:41:16 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Jungo Lin <jungo.lin@mediatek.com>, devicetree@vger.kernel.org,
        Sean Cheng =?utf-8?B?KOmEreaYh+W8mCk=?= 
        <sean.cheng@mediatek.com>,
        Frederic Chen =?utf-8?B?KOmZs+S/iuWFgyk=?= 
        <frederic.chen@mediatek.com>,
        Rynn Wu =?utf-8?B?KOWQs+iCsuaBqSk=?= <rynn.wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh@kernel.org>,
        Ryan Yu =?utf-8?B?KOS9meWtn+S/rik=?= <ryan.yu@mediatek.com>,
        Frankie Chiu =?utf-8?B?KOmCseaWh+WHsSk=?= 
        <frankie.chiu@mediatek.com>, Hans Verkuil <hverkuil@xs4all.nl>,
        ddavenport@chromium.org, Sj Huang <sj.huang@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [RFC, v3 9/9] media: platform: Add Mediatek ISP P1 shared memory
 device
Message-ID: <20190726074116.GA19745@infradead.org>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
 <20190611035344.29814-10-jungo.lin@mediatek.com>
 <20190701072532.GB137710@chromium.org>
 <1562297618.1212.46.camel@mtksdccf07>
 <CAAFQd5BaTQ-Q7gsE0X+d4_81OZq9WHaCYkmALt7_4A1JFo=_8g@mail.gmail.com>
 <1562313579.1212.73.camel@mtksdccf07>
 <CAAFQd5AaNFpMGCVJREY85n8UetEwd99TOka8-ECoLzMbMkos_g@mail.gmail.com>
 <1563870117.1212.455.camel@mtksdccf07>
 <CAAFQd5Bh80N+cMhz=eyHUGJLaE5uuypOawQvHrTgGSMDvmcpLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5Bh80N+cMhz=eyHUGJLaE5uuypOawQvHrTgGSMDvmcpLA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 26, 2019 at 02:15:14PM +0900, Tomasz Figa wrote:
> Could you try dma_get_sgtable() with the SCP struct device and then
> dma_map_sg() with the P1 struct device?

Please don't do that.  dma_get_sgtable is a pretty broken API (see
the common near the arm implementation) and we should not add more
users of it.  If you want a piece of memory that can be mapped to
multiple devices allocate it using alloc_pages and then just map
it to each device.
