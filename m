Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 598A1B756B
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 10:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbfISItT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 04:49:19 -0400
Received: from mga04.intel.com ([192.55.52.120]:36257 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbfISItT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 04:49:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Sep 2019 01:49:18 -0700
X-IronPort-AV: E=Sophos;i="5.64,522,1559545200"; 
   d="scan'208";a="181407171"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Sep 2019 01:49:15 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile documentation
In-Reply-To: <CAMuHMdU10J5zgQ0r8uoA+LFHRbyLB=AG6xygTmsxwc7T-ffdDw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com> <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org> <20190918123620.GA6306@pendragon.ideasonboard.com> <20190918105728.24e7eb48@coco.lan> <20190919065447.GF2959@kadam> <CAMuHMdU10J5zgQ0r8uoA+LFHRbyLB=AG6xygTmsxwc7T-ffdDw@mail.gmail.com>
Date:   Thu, 19 Sep 2019 11:49:13 +0300
Message-ID: <87o8zgwu0m.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 19 Sep 2019, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Sep 19, 2019 at 8:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> On Wed, Sep 18, 2019 at 10:57:28AM -0300, Mauro Carvalho Chehab wrote:
>> When I sent a patch, I use get_maintainer.pl then I add whoever the
>> wrote the commit from the Fixes tag.  Then I remove Colin King and Kees
>> Cook from the CC list because they worked all over the tree and I know
>> them.  I also normally remove LKML if there is another mailing list but
>> at least one subsystem uses LKML for patchwork so this isn't safe.
>>
>> So the safest instructions are "Use get_matainer.pl and add the person
>> who wrote the commit in the Fixes tag".
>
> Better: perhaps get_maintainer.pl can be taught to add the author of the
> commit pointed to by the Fixes tag, if present?

The drm maintainer tools [1] have that, with Cc's and reviewers picked
up, and appropriate Cc: stable added. On a random commit from v5.3:

$ dim fixes 61f7f7c8f978b1c0d80e43c83b7d110ca0496eb4
Fixes: 61f7f7c8f978 ("gpiolib: acpi: Add gpiolib_acpi_run_edge_events_on_boot option and blacklist")
Cc: stable@vger.kernel.org
Cc: Daniel Drake <drake@endlessm.com>
Cc: Ian W MORRISON <ianwmorrison@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-acpi@vger.kernel.org
Cc: <stable@vger.kernel.org> # v5.3+

I'm sure it could be massively improved, but it does give you the
initial list that's easy to trim.

BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/maintainer-tools/blob/master/dim#L2398


-- 
Jani Nikula, Intel Open Source Graphics Center
