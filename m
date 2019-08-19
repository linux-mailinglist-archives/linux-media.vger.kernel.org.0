Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D748591CA1
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 07:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfHSFjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 01:39:53 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:13798 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725768AbfHSFjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 01:39:52 -0400
X-UUID: 663142ec0b6440d5921048f23debae01-20190819
X-UUID: 663142ec0b6440d5921048f23debae01-20190819
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1037830993; Mon, 19 Aug 2019 13:39:33 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 19 Aug
 2019 13:39:30 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 19 Aug 2019 13:39:29 +0800
Message-ID: <1566193170.21623.46.camel@mhfsdcap03>
Subject: Re: [RFC,V2,1/2] media: dt-bindings: media: i2c: Add bindings for
 OV02A10
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <tfiga@google.com>, <drinkcat@chromium.org>
Date:   Mon, 19 Aug 2019 13:39:30 +0800
In-Reply-To: <20190817213207.GC3504@valkosipuli.retiisi.org.uk>
References: <20190704084651.3105-1-dongchun.zhu@mediatek.com>
         <20190704084651.3105-2-dongchun.zhu@mediatek.com>
         <20190723074153.GA4606@paasikivi.fi.intel.com>
         <ef65288c523f405396991bd6d757bba0@mtkmbs02n1.mediatek.inc>
         <1566013985.21623.9.camel@mhfsdcap03>
         <20190817213207.GC3504@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 1FFD33D17A9099ABE642A276F2E703E2656BAF1550E1FEDA5DAA451D829739DB2000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Sun, 2019-08-18 at 00:32 +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> On Sat, Aug 17, 2019 at 11:53:05AM +0800, Dongchun Zhu wrote:
> ...
> > > > +
> > > > +The device node shall contain one 'port' child node with an
> > > > +'endpoint' subnode for its digital output video port, in accordance
> > > > +with the video interface bindings defined in
> > > > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > > +The endpoint optional property 'data-lanes' shall be "<1>".
> > > 
> > > How many lanes does the module (or the sensor) have?
> > > 
> > 
> > From sensor datasheet, OV02A10 supports 1-lane MIPI interface.
> 
> If only one lane is supported, the property should be omitted: there's
> nothing that the driver needs to know here.
> 
Thanks for the suggestion.
But sorry that I didn't read this message this morning, so this issue
still remains unsettled in v3.
https://patchwork.kernel.org/patch/11100219/
I would fix this point in v4.

