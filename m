Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146842A787D
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 09:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729825AbgKEIBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 03:01:10 -0500
Received: from mga01.intel.com ([192.55.52.88]:11122 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729495AbgKEIBK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 03:01:10 -0500
IronPort-SDR: Zfj0q8zkSP4qUr3dha7/cCzpmrFM7T9599eKx9FVAhSEY/fySOk5Y6rmIRgaJr2cZSXY/tDqb/
 FNwc8ipkCDag==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="187248461"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="187248461"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 00:01:09 -0800
IronPort-SDR: tt3fXPOqlHfi97+t4bFnwcWEyIrfOG5l1otuNcSARW9NIUqT2gdUVTDxVVttinLJDAiqzgLfVd
 EAFRiHO2T6XA==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="321114831"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 00:01:08 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 987DA20901; Thu,  5 Nov 2020 10:01:05 +0200 (EET)
Date:   Thu, 5 Nov 2020 10:01:05 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 001/106] smiapp: Generate CCS register definitions and
 limits
Message-ID: <20201105080105.GU26150@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201105081950.43f0613f@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105081950.43f0613f@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the review.

On Thu, Nov 05, 2020 at 08:19:50AM +0100, Mauro Carvalho Chehab wrote:
> Hi,
> 
> Em Wed,  7 Oct 2020 11:44:21 +0300
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > Add register definitions of the MIPI CCS 1.1 standard.
> > 
> > The CCS driver makes extended use of device's capability registers that
> > are dependent on CCS version. This involves having an in-memory data
> > structure for limit and capability information, creating that data
> > structure and accessing it.
> > 
> > The register definitions as well as the definitions of this data structure
> > are generated from a text file using a Perl script. Do the generation here
> > and so avoid making manual, error-prone changes to the several generated
> > files.
> 
> I understand the reason behind using a perl script to parse some
> text file in order to generate register's definition files,
> but I can't see what's the sense of storing the perl script and
> such texts together with the Kernel building system, re-generating them
> every time.
> 
> I mean: register definitions is something that it is supposed to be
> stable, and nothing something that will change on every Kernel
> compilation.
> 
> How often are you expecting changes at ccs-regs.txt?

When there's a new version of the standard, or a bug is found. At least. So
not very often.

After pushing the set to a branch in my linuxtv.org tree, I also noticed
that some architectures are built by kbuild bot without Perl interpreter
being present. This suggests that Perl is not currently universally
required for building the kernel albeit there seems to be some PowerPC
hardware (?) related driver needing it to be built.

I was thinking of putting the files produced by the script into a new patch
and leaving the script and the text file in the directory. The files would
be rebuilt when a specific environment variable is set. This would in line
with what crypto drivers are doing.

-- 
Kind regards,

Sakari Ailus
