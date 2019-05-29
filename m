Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0084E2DA16
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 12:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfE2KLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 06:11:32 -0400
Received: from mga06.intel.com ([134.134.136.31]:35105 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbfE2KLc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 06:11:32 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 03:11:31 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001.fm.intel.com with ESMTP; 29 May 2019 03:11:28 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D0EB52091F; Wed, 29 May 2019 13:11:27 +0300 (EEST)
Date:   Wed, 29 May 2019 13:11:27 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Ondrej Jirman <megous@megous.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 0/3] ARM: sun8i: a83t: Support Camera Sensor Interface
 controller
Message-ID: <20190529101127.oykszcj7q4ikji47@paasikivi.fi.intel.com>
References: <20190520150637.23557-1-megous@megous.com>
 <20190520151003.uklhhak5clxi5zpf@core.my.home>
 <CAGb2v64NDYo-yOvUQDpqzRB_A3NUgF3dXJeYbz_57uwB7mXwqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64NDYo-yOvUQDpqzRB_A3NUgF3dXJeYbz_57uwB7mXwqQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Chen-Yu,

On Tue, May 28, 2019 at 09:03:06PM +0800, Chen-Yu Tsai wrote:
> On Mon, May 20, 2019 at 11:10 PM Ondřej Jirman <megous@megous.com> wrote:
> >
> > On Mon, May 20, 2019 at 05:06:34PM +0200, verejna wrote:
> > > From: Ondrej Jirman <megous@megous.com>
> > >
> > > This is a re-send of Chen-Yu's A83T CSI patch series with review tags
> > > applied and removed address/size cells from csi_in port. Already applied
> > > patches from v1  were dropped.
> > >
> > > The series is ready to be merged:
> > >
> > >   Patch 1 and 2 via sunxi tree
> > >   Patch 3 via media tree
> >
> > Sorry, wrong numbers. 2 is for media tree, 3 is for sunxi, 1 is a dt-bindings
> > patch, where I'm not sure.
> 
> Bindings typically go with the driver.
> 
> Sakari, this series is and has been ready for some time since before the merge
> window. Could you please merge patches 1 and 2.

Don't wait, instead cc or ping me; that helps. :-)

The two patches are fine; I'll merge them.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
