Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 741F612E80F
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2020 16:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728749AbgABP10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jan 2020 10:27:26 -0500
Received: from retiisi.org.uk ([95.216.213.190]:57172 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728561AbgABP1Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Jan 2020 10:27:25 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 6EBA8634C86;
        Thu,  2 Jan 2020 17:26:24 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1in2Mi-0001tL-UM; Thu, 02 Jan 2020 17:26:24 +0200
Date:   Thu, 2 Jan 2020 17:26:24 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     mchehab+samsung@kernel.org
Cc:     linux-media@vger.kernel.org, builder@linuxtv.org
Subject: Re: [GIT PULL for 5.6] Smiapp PM patches and omap3isp fixes
Message-ID: <20200102152624.GI5050@valkosipuli.retiisi.org.uk>
References: <20200102134658.GH5050@valkosipuli.retiisi.org.uk>
 <20200102135507.3512-1-jenkins@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200102135507.3512-1-jenkins@linuxtv.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Jan 02, 2020 at 01:55:07PM +0000, Jenkins wrote:
> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/patch/60967/
> Build log: https://builder.linuxtv.org/job/patchwork/31904/
> Build time: 00:04:57
> Link: https://lore.kernel.org/linux-media/20200102134658.GH5050@valkosipuli.retiisi.org.uk
> 
> gpg: Signature made Thu 02 Jan 2020 01:42:43 PM UTC
> gpg:                using DSA key F0D0377A0D4F25A79238EFE56D40361B6E28C193
> gpg:                issuer "sakari.ailus@linux.intel.com"
> gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]
> 
> Summary: 1 patches and/or PDF generation with issues, being 0 at build time
> 
> Error/warnings:
> 
> 
> Error #256 when running ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:
> $ ./scripts/checkpatch.pl --terse --mailback --no-summary --strict patches/0003-smiapp-Avoid-maintaining-power-state-information.patch
> patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:114: CHECK: Lines should not end with a '('
> patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:120: CHECK: Lines should not end with a '('
> patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:132: CHECK: Lines should not end with a '('
> patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:139: CHECK: Lines should not end with a '('
> patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:146: CHECK: Lines should not end with a '('
> patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:152: CHECK: Lines should not end with a '('
> patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:158: CHECK: Lines should not end with a '('
> patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:164: CHECK: Lines should not end with a '('
> patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:170: CHECK: Lines should not end with a '('
> patches/0003-smiapp-Avoid-maintaining-power-state-information.patch:268: WARNING: Avoid multiple line dereference - prefer 'sensor->pixel_array->ctrl_handler'

Regarding this --- parentheses beginning lines are abundantly used by the
driver elsewhere (where they were originally moved from). If you prefer,
I can send another patch reworking the code to remove parentheses beginning
lines. It likely causes a number of cases where lines end up being longer
than 80 chars though.

-- 
Sakari Ailus
