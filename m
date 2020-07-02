Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29F3211B93
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 07:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgGBFe5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 01:34:57 -0400
Received: from mga17.intel.com ([192.55.52.151]:1625 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726015AbgGBFe4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Jul 2020 01:34:56 -0400
IronPort-SDR: HiI8Apn5WpUK5uS8ekblShWXvWDarrbR3PLfYE4StHkLsG2PEA05h9l4oM2uw0+U7tufb0B7bd
 Us5i1ZRVMQ3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="126895553"
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; 
   d="scan'208";a="126895553"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 22:34:55 -0700
IronPort-SDR: Ty6atuWHu18imj2PkfQsFLeXd9jxknx1a6WObfleArNTDpkNQbemEAjQmFoDj7zmJm8iwU+7mD
 oPEUA2MdJ1yQ==
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; 
   d="scan'208";a="321980551"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 22:34:51 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 66818209B8; Thu,  2 Jul 2020 08:34:49 +0300 (EEST)
Date:   Thu, 2 Jul 2020 08:34:49 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu =?utf-8?B?KOacseS4nOaYpSk=?= 
        <Dongchun.Zhu@mediatek.com>
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
Message-ID: <20200702053449.GR16711@paasikivi.fi.intel.com>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
 <20200701091618.GN16711@paasikivi.fi.intel.com>
 <bf610d1b13c74656b2ffeeb9cc2a96ac@MTKMBS31N1.mediatek.inc>
 <20200701134416.GQ16711@paasikivi.fi.intel.com>
 <e55e7b405a084a0298cd839c05b52c79@MTKMBS31N1.mediatek.inc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e55e7b405a084a0298cd839c05b52c79@MTKMBS31N1.mediatek.inc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dongchun,

Please don't send HTML e-mail to Linux kernel related mailing lists.

On Thu, Jul 02, 2020 at 03:48:56AM +0000, Dongchun Zhu (朱东春) wrote:
>  Hi Sakari,
> 
>  Sorry to bother you again, but I am so confused about the questions you raised.
>  I just synced mainline: 5.8-rc3 tarball from https://www.kernel.org/, on which I ran the git am <patch> command.
>  The patch-applying process shows no error.
>  -----------------8<-------------------
>  [mtk15013@mtkslt307 linux]$git apply --check media-i2c-Add-support-for-DW9768-VCM.patch
>  [mtk15013@mtkslt307 linux]$git am media-i2c-Add-support-for-DW9768-VCM.patch
>  Applying: media: dt-bindings: media: i2c: Document DW9768 bindings
>  Applying: media: i2c: dw9768: Add DW9768 VCM driver
>  -----------------8<-------------------
> 
>  On the other hand, I also compared dongwoon,dw9768.yaml file with other media device dt-bindings(like imx219.yaml and ov8856.yaml).
>  It seems there are no apparent differences between them.
>  Especially, the sentence '# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)' shall be common.
>  I dunno why here dongwoon,dw9768.yaml reports trailing whitespace warnings while ov8856.yaml is silent.
> 
>  For the patch failed on MAINTAINERS, I am still curious what's wrong.
>  In fact, I locally have run parse-maintainers.pl script to check MAINTAINERS file before submitting patch.
>  The result also reports no errors.
>  -----------------8<-------------------
>  [mtk15013@mtkslt307 linux]$perl scripts/parse-maintainers.pl
>  [mtk15013@mtkslt307 linux]$ls
>  -----------------8<-------------------
> 
>  As to Base64 encoding, I checked each patch file again. They are all encoded in UTF-8.
>  As https://www.base64encode.org/ says, for an example, '77' in ASCII format would be changed to 'T' in Based64-encoded format.
>  This means there shall be messy code if we adpoting Based64-encoded format.
>  But I cannot see garbled messages in the current patches.
> 
>  The DW9768 serials-patch is attached.
>  @Tomasz @Andy @Rob could anyone help try to see whether the patch can be cherry-picked on Linux master branch or not?
>  Patchwork link:
>  https://patchwork.kernel.org/cover/11633291/

Both of the patches appear to contain only ASCII characters.

I did some research on this. It seems that the base64 encoded message body
does have carriage returns, in both cases. Git am does not attempt to
remove them in that case, but Patchwork does. Hence the files are fine if
you download them from Patchwork --- where the mbox files have neither
carriage returns nor base64 encoding.

What does the file command say about the patch files produced by git
format-patch? My guess is that something in between your local computer and
LMML (and other mail servers) base64 encodes the message body. But where
are the carriage returns added? Nevertheless they seem to be added before
the base64 conversion.

I think this is also a git issue, but something that is very hard to
encounter.

...

>  ************* MEDIATEK Confidentiality Notice ********************
>  The information contained in this e-mail message (including any
>  attachments) may be confidential, proprietary, privileged, or otherwise
>  exempt from disclosure under applicable laws. It is intended to be
>  conveyed only to the designated recipient(s). Any use, dissemination,
>  distribution, printing, retaining or copying of this e-mail (including its
>  attachments) by unintended recipient(s) is strictly prohibited and may
>  be unlawful. If you are not an intended recipient of this e-mail, or believe
>  that you have received this e-mail in error, please notify the sender
>  immediately (by replying to this e-mail), delete any and all copies of
>  this e-mail (including any attachments) from your system, and do not
>  disclose the content of this e-mail to any other person. Thank you!

Did you mean this?

-- 
Kind regards,

Sakari Ailus
