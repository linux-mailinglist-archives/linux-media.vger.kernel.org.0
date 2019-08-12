Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB8D38A020
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 15:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbfHLNyR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 09:54:17 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57227 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727136AbfHLNyR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 09:54:17 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id xAm4hRKMWur8TxAm7hicCZ; Mon, 12 Aug 2019 15:54:15 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Fix dma_mask for omap_vout
Message-ID: <d8972207-52e0-76af-4226-d276c649b434@xs4all.nl>
Date:   Mon, 12 Aug 2019 15:54:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNKnMRhEOlVBo/lURI+AVVfUxeQqoSvJKdzH1OlLFTqsXr1a3F6Y2ouuQ34VTcQmgcqNpFX7k2YDzVJSn3cKk/mvqbSaQPrPN7XKEaZ9NBoMqcfCVGF4
 KDALb5U+5NC27Ru11j7vriQPNHjU64T7X/3l9cwxevQW8sabRJTqBThqUG1q00zRkjZBjlx7cv6F/Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just a single patch: this is the last bit needed to make omap_vout work
again. Tony was OK with this going through the media subsystem since it
concerns a media driver.

Regards,

	Hans

The following changes since commit 97299a3035328d7ae2f4fccaf6e549974df6e118:

  media: Remove dev_err() usage after platform_get_irq() (2019-08-07 17:08:33 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4j

for you to fetch changes up to b9553f6250e0ef78673a7691cd304a732c4bfc00:

  mach-omap2/devices.c: set dma mask (2019-08-12 15:51:13 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      mach-omap2/devices.c: set dma mask

 arch/arm/mach-omap2/devices.c | 7 +++++++
 1 file changed, 7 insertions(+)
