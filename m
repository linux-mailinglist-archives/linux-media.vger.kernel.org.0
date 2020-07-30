Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6062336F6
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 18:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgG3Qjh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 12:39:37 -0400
Received: from mga01.intel.com ([192.55.52.88]:7437 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgG3Qjg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 12:39:36 -0400
IronPort-SDR: 1vUbNUJrti3BH9ntO/aIMrbjoe4mqi58NA3LTUI0Mm9zTuVqpQzO01oMu/Ih500uoVRWaerm3S
 SWhp+53XqaRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="169754093"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; 
   d="scan'208";a="169754093"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 09:39:36 -0700
IronPort-SDR: PsEBQvVtGv0M4qfCmFcKV+OzUhOlQ/04jIXu2ut0cH6bu36+jdy53PJSyoG+VdG4PjRCrddlZO
 mCCXa1d+kA2Q==
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; 
   d="scan'208";a="274255880"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 09:39:32 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 30F4820399; Thu, 30 Jul 2020 19:39:30 +0300 (EEST)
Date:   Thu, 30 Jul 2020 19:39:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "drinkcat@chromium.org" <drinkcat@chromium.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        Erin Lo =?utf-8?B?KOe+hembhem9oSk=?= <erin.lo@mediatek.com>,
        Louis Kuo =?utf-8?B?KOmDreW+t+Wvpyk=?= <louis.kuo@mediatek.com>,
        Sj Huang =?utf-8?B?KOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "bingbu.cao@intel.com" <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= 
        <shengnan.wang@mediatek.com>
Subject: Re: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
Message-ID: <20200730163930.GI13316@paasikivi.fi.intel.com>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
 <20200701091618.GN16711@paasikivi.fi.intel.com>
 <bf610d1b13c74656b2ffeeb9cc2a96ac@MTKMBS31N1.mediatek.inc>
 <20200701134416.GQ16711@paasikivi.fi.intel.com>
 <e55e7b405a084a0298cd839c05b52c79@MTKMBS31N1.mediatek.inc>
 <20200702053449.GR16711@paasikivi.fi.intel.com>
 <1593687965.17166.73.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1593687965.17166.73.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dongchun,

On Thu, Jul 02, 2020 at 07:06:05PM +0800, Dongchun Zhu wrote:
> Hi Sakari,
> 
> Sorry I just sent email using outlook where default format is HTML, now
> I use evolution, one Linux mail client that I used to send upstream
> patch previously.
> 
> On Thu, 2020-07-02 at 08:34 +0300, Sakari Ailus wrote:
> > Dongchun,
> > 
> > Please don't send HTML e-mail to Linux kernel related mailing lists.
> > 
> > On Thu, Jul 02, 2020 at 03:48:56AM +0000, Dongchun Zhu (朱东春) wrote:
> > >  Hi Sakari,
> > > 
> > >  Sorry to bother you again, but I am so confused about the questions you raised.
> > >  I just synced mainline: 5.8-rc3 tarball from https://www.kernel.org/, on which I ran the git am <patch> command.
> > >  The patch-applying process shows no error.
> > >  -----------------8<-------------------
> > >  [mtk15013@mtkslt307 linux]$git apply --check media-i2c-Add-support-for-DW9768-VCM.patch
> > >  [mtk15013@mtkslt307 linux]$git am media-i2c-Add-support-for-DW9768-VCM.patch
> > >  Applying: media: dt-bindings: media: i2c: Document DW9768 bindings
> > >  Applying: media: i2c: dw9768: Add DW9768 VCM driver
> > >  -----------------8<-------------------
> > > 
> > >  On the other hand, I also compared dongwoon,dw9768.yaml file with other media device dt-bindings(like imx219.yaml and ov8856.yaml).
> > >  It seems there are no apparent differences between them.
> > >  Especially, the sentence '# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)' shall be common.
> > >  I dunno why here dongwoon,dw9768.yaml reports trailing whitespace warnings while ov8856.yaml is silent.
> > > 
> > >  For the patch failed on MAINTAINERS, I am still curious what's wrong.
> > >  In fact, I locally have run parse-maintainers.pl script to check MAINTAINERS file before submitting patch.
> > >  The result also reports no errors.
> > >  -----------------8<-------------------
> > >  [mtk15013@mtkslt307 linux]$perl scripts/parse-maintainers.pl
> > >  [mtk15013@mtkslt307 linux]$ls
> > >  -----------------8<-------------------
> > > 
> > >  As to Base64 encoding, I checked each patch file again. They are all encoded in UTF-8.
> > >  As https://www.base64encode.org/ says, for an example, '77' in ASCII format would be changed to 'T' in Based64-encoded format.
> > >  This means there shall be messy code if we adpoting Based64-encoded format.
> > >  But I cannot see garbled messages in the current patches.
> > > 
> > >  The DW9768 serials-patch is attached.
> > >  @Tomasz @Andy @Rob could anyone help try to see whether the patch can be cherry-picked on Linux master branch or not?
> > >  Patchwork link:
> > >  https://patchwork.kernel.org/cover/11633291/
> > 
> > Both of the patches appear to contain only ASCII characters.
> > 
> > I did some research on this. It seems that the base64 encoded message body
> > does have carriage returns, in both cases. Git am does not attempt to
> > remove them in that case, but Patchwork does. Hence the files are fine if
> > you download them from Patchwork --- where the mbox files have neither
> > carriage returns nor base64 encoding.
> > 
> > What does the file command say about the patch files produced by git
> > format-patch? My guess is that something in between your local computer and
> > LMML (and other mail servers) base64 encodes the message body. But where
> > are the carriage returns added? Nevertheless they seem to be added before
> > the base64 conversion.
> > 
> 
> Hm... I used the file command to check the diff patch generated from git
> format-patch and that downloaded from Patchwork, they are both ASCII
> text.

That's because Patchwork appears to be removing the carriage returns. git
does not if the content is base64 encoded.

Your e-mail setup simply appears to be broken. I'd suggest trying to send
the patches encoded in base64 as a workaround. git send-email uses
sendemail.transferEncoding configuration option for this.

-- 
Sakari Ailus
