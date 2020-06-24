Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F539207679
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 17:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404316AbgFXPDF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 11:03:05 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:46815 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404134AbgFXPDE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 11:03:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id o6vQjhu4eNb6lo6vUjtnEZ; Wed, 24 Jun 2020 17:03:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593010981; bh=8vHa8zWFZv5Egl5FuCWV3OqICGomxeOIYhnp0NekHPw=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NYcvOxa8AVm6WOd2Of8SXyiwKL1F87Km8BzywX/NtY+Oalv0N8sk0wkH29dfu/lza
         wMiGGE7g3BI3tcO1vHsRst1eOtULsJYTJkNgysTbz16S57ND6cNFCLrUBr26ktvwG2
         frMyb8PWO0YFzA99s7A0s+woZBTMPYFGdujI6tYYzK1ldMYgzf6EnAVXg0/yjDlR+i
         q3Vy0OCakhG/CA8VoO+9dbw76i1ea1PIEFXQswpC3dBTIlcV2Yh0Tb58ia1G94IzKZ
         B4GR8D7a4Ans4yvolhL86ZPb5RxIzI2IhLU4uqU2pY3xuD3dQSvkF5UNeV9Z9Hh7mw
         Zqctn8bWnA+YQ==
Subject: Re: [GIT PULL FOR v5.9] More fixes
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <169d364f-8961-1e4b-657c-44a58bc5ec45@xs4all.nl>
Message-ID: <726b9d59-ed20-43f5-d135-c6c3ef7df290@xs4all.nl>
Date:   Wed, 24 Jun 2020 17:02:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <169d364f-8961-1e4b-657c-44a58bc5ec45@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfITSyopDCeRFPMdSnYil0aKGVlCxmWBvbQRv9X2l+UCdG0epj69bCF9wErXefGlIysNmugVeoXyTZK4EwgzQ7w5itvoGL6HyvNPlwT/3BQYPARO02h2U
 88Rh3fEPos4ugnstexJiIOe68ESGIWJlWV6J13+zc3NYvPv9iInmaA9OkT2kZFYFcVG+3AYMmy8qAg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/06/2020 16:54, Hans Verkuil wrote:
> The following changes since commit 7b981288285f0e8b816ea7ba8f34d0973ee39e0d:
> 
>   media: ov2740: add NVMEM interface to read customized OTP data (2020-06-23 15:19:16 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9d
> 
> for you to fetch changes up to 624dc5e356402b7487192f9b5caf97355ec98389:
> 
>   media: vsp1: dl: Fix NULL pointer dereference on unbind (2020-06-24 16:46:29 +0200)

Ignore this PR, I messed something up.

Regards,

	Hans

> 
> ----------------------------------------------------------------
> Tag branch
> 
> ----------------------------------------------------------------
> Andrey Konovalov (1):
>       media: camss: use proper media entity function for subdevices
> 
> Chen Zhou (1):
>       media: coda: jpeg: add NULL check after kmalloc
> 
> Colin Ian King (1):
>       media: cx231xx: remove redundant assignment to variable err
> 
> Dafna Hirschfeld (1):
>       media: staging: rkisp1: cap: remove support of BGR666 format
> 
> Dan Carpenter (1):
>       firewire: Using uninitialized values in node_probe()
> 
> Dmitry Osipenko (3):
>       media: staging: tegra-vde: Runtime PM is always available on Tegra
>       media: staging: tegra-vde: Turn ON power domain on shutdown
>       media: staging: tegra-vde: Power-cycle hardware on probe
> 
> Eizan Miyamoto (5):
>       mtk-mdp: remove mtk_mdp_comp.regs from mtk_mdp_comp.h
>       mtk-mdp: handle vb2_dma_contig_set_max_seg_size errors during probe
>       mtk-mdp: handle vpu_wdt_reg_handler() errors during probe
>       mtk-mdp: convert mtk_mdp_dev.comp array to list
>       mtk-mdp: Remove mtk_mdp_comp.id and supporting functionality
> 
> Eugen Hristev (1):
>       media: atmel: atmel-sama5d2-isc: fix warning in configs without OF
> 
> Eugeniu Rosca (1):
>       media: vsp1: dl: Fix NULL pointer dereference on unbind
> 
> Francois Buergisser (1):
>       mtk-mdp: Remove states for format checks
> 
> Gustavo A. R. Silva (1):
>       media: usb: pwc: pwc.h: Replace zero-length array with flexible-array member
> 
> Tuomas Tynkkynen (1):
>       media: media-request: Fix crash if memory allocation fails
> 
>  drivers/media/firewire/firedtv-fw.c              |   2 +
>  drivers/media/mc/mc-request.c                    |  31 ++--
>  drivers/media/platform/atmel/atmel-sama5d2-isc.c |   2 +
>  drivers/media/platform/coda/coda-jpeg.c          |   5 +-
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c    |  60 +------
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h    |  23 +--
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c    |  69 ++++++---
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h    |  12 +-
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c     |  90 ++++-------
>  drivers/media/platform/qcom/camss/camss-csid.c   |   2 +-
>  drivers/media/platform/qcom/camss/camss-csiphy.c |   2 +-
>  drivers/media/platform/qcom/camss/camss-ispif.c  |   2 +-
>  drivers/media/platform/vsp1/vsp1_dl.c            |   2 +
>  drivers/media/usb/cx231xx/cx231xx-417.c          |   2 +-
>  drivers/media/usb/pwc/pwc.h                      |   2 +-
>  drivers/staging/media/allegro-dvt/allegro-core.c | 387 +++++++++++++++++++++++++++-------------------
>  drivers/staging/media/allegro-dvt/allegro-mail.c | 506 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/staging/media/allegro-dvt/allegro-mail.h | 111 ++++++++-----
>  drivers/staging/media/rkisp1/rkisp1-capture.c    |   4 -
>  drivers/staging/media/tegra-vde/vde.c            |  41 +++--
>  20 files changed, 958 insertions(+), 397 deletions(-)
> 

