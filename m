Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E7A274972
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 21:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgIVTr1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 15:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIVTr1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 15:47:27 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484C3C061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 12:47:27 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id A8D46634C87;
        Tue, 22 Sep 2020 22:46:16 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kKoEy-0002gw-Qu; Tue, 22 Sep 2020 22:46:16 +0300
Date:   Tue, 22 Sep 2020 22:46:16 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jenkins <jenkins@linuxtv.org>
Cc:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org,
        builder@linuxtv.org
Subject: Re: [GIT FIXES FOR 5.9] Imx274 DT binding fix (#67094)
Message-ID: <20200922194616.GC8644@valkosipuli.retiisi.org.uk>
References: <20200917144416.GN834@valkosipuli.retiisi.org.uk>
 <20200917201702.3982-1-jenkins@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917201702.3982-1-jenkins@linuxtv.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Sep 17, 2020 at 08:17:02PM +0000, Jenkins wrote:
> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200917144416.GN834@valkosipuli.retiisi.org.uk/
> Build log: https://builder.linuxtv.org/job/patchwork/68754/
> Build time: 00:14:48
> Link: https://lore.kernel.org/linux-media/20200917144416.GN834@valkosipuli.retiisi.org.uk
> 
> gpg: Signature made Thu 17 Sep 2020 02:02:52 PM UTC
> gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
> gpg:                issuer "sakari.ailus@linux.intel.com"
> gpg: Can't check signature: No public key

I think I've added a subkey for signing recently. It's in pgpkeys
repository:

<URL:https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/>

I thought I had added an explanation to the pull request. It seems I did
not.

Feel free to use this one:

This pull request converts IMX274 DT bindings to YAML format. Also
regulators are converted to lower case. This needs to be done now (or
alternatively never) as the regulators were added to IMX274 bindings during
5.9 cycle in commit 74ea3273d24b ("dt-bindings: media: imx274: Add optional
input clock and supplies").

-- 
Kind regards,

Sakari Ailus
