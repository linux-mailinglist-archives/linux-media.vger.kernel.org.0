Return-Path: <linux-media+bounces-1936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11132809F30
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 10:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A96AB20B95
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 09:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C088125A5;
	Fri,  8 Dec 2023 09:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEFVVX8r"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576C411CA0
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 09:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8611DC433C7;
	Fri,  8 Dec 2023 09:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702027430;
	bh=8OKSkc37GqD1hhdq1qHNAv72gT7ownApsTE4qDcF0aw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IEFVVX8rcnFCr8X12QXLAg/kSs1vQpQ0dB/O10eu0OqplaCbjSus2/W+zozrl4FXQ
	 xKoLedcf+mBEx8NYJNFyN2f6AGIg2+0mmFiSZah1wgL8DtNjPuGRyYaAFhR4FZyZGa
	 pU9V6b8voPW/3dUKQr6LBh9Y9iAYStW1GUPgUobBF6kKUZuzCXEW7NMkSfyOgeAU2R
	 gbefywtzFVCsu4lZJQXeMBS261j0cMnYGhHGaMbku40yAVybUoufMKdKEDx+Lvtc+Z
	 CxL98nX4fQ1U9US/6Nhd9mWiMchAgwlSSGtiPGGqtLInIRmvbc/m1cdEnO0NcOKmpy
	 x1ld9JOeh0FAw==
From: Maxime Ripard <mripard@kernel.org>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 ivan.orlov0322@gmail.com, maarten.lankhorst@linux.intel.com, 
 skhan@linuxfoundation.org, tzimmermann@suse.de, 
 Ziqi Zhao <astrajoan@yahoo.com>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org, 
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, glider@google.com, 
 syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com, 
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
In-Reply-To: <20230721161446.8602-1-astrajoan@yahoo.com>
References: <20230716043411.4950-1-astrajoan@yahoo.com>
 <20230721161446.8602-1-astrajoan@yahoo.com>
Subject: Re: [PATCH] drm/crtc: Fix uninit-value bug in drm_mode_setcrtc
Message-Id: <170202742812.13384.8140202310424410642.b4-ty@kernel.org>
Date: Fri, 08 Dec 2023 10:23:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Fri, 21 Jul 2023 09:14:46 -0700, Ziqi Zhao wrote:
> The connector_set contains uninitialized values when allocated with
> kmalloc_array. However, in the "out" branch, the logic assumes that any
> element in connector_set would be equal to NULL if failed to
> initialize, which causes the bug reported by Syzbot. The fix is to use
> an extra variable to keep track of how many connectors are initialized
> indeed, and use that variable to decrease any refcounts in the "out"
> branch.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime


